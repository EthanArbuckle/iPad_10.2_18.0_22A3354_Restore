@implementation CUICommonAssetStorage

- (const)keyFormat
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (self->_keyfmt)
    return self->_keyfmt;
  else
    return (const _renditionkeyfmt *)CUIDefaultThemeRenditionKeyFormat(self->_header->var11, self->_header->var2, v2, v3, v4, v5, v6, v7);
}

- (const)keyAttributeIndex
{
  return &self->_keyfmtindex;
}

- (id)renditionInfoForIdentifier:(unsigned __int16)a3
{
  unsigned int v3;
  uint64_t v5;
  unsigned __int16 *renditionInfoCacheLookup;
  CUINamedRenditionInfo *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *bitmapKeydb;
  unint64_t Value;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  id v20;
  id v21;
  void *v22;
  uint64_t i;
  char *v24;
  uint64_t v25;
  id *v26;
  id v27;
  CUINamedRenditionInfo *v28;
  uint64_t v30;

  if (!self->_bitmapKeydb)
    return 0;
  v3 = a3;
  v30 = 0;
  os_unfair_lock_lock(-[CUICommonAssetStorage renditionInfoCacheLock](self, "renditionInfoCacheLock"));
  v5 = 0;
  renditionInfoCacheLookup = self->_renditionInfoCacheLookup;
  while (self->_renditionInfoCacheLookup[v5] != v3)
  {
    if (++v5 == 20)
    {
      v7 = 0;
      goto LABEL_8;
    }
  }
  v7 = (CUINamedRenditionInfo *)self->_renditionInfoCache[v5];
LABEL_8:
  os_unfair_lock_unlock(-[CUICommonAssetStorage renditionInfoCacheLock](self, "renditionInfoCacheLock"));
  if (!v7)
  {
    os_unfair_lock_lock(-[CUICommonAssetStorage lock](self, "lock"));
    bitmapKeydb = self->_bitmapKeydb;
    if ((*((_BYTE *)self + 108) & 2) != 0)
      Value = BOMTreeReadValue((uint64_t)bitmapKeydb, (void *)v3, 2uLL, v8, v9, v10, v11, v12);
    else
      Value = BOMTreeGetValue((uint64_t)bitmapKeydb, (void *)v3, 2uLL, v8, v9, v10, v11, v12);
    v7 = (CUINamedRenditionInfo *)Value;
    if (Value)
    {
      if (BOMTreeGetValueSize((uint64_t)self->_bitmapKeydb, (void *)v3, 2uLL, &v30, v15, v16, v17, v18))
      {
        v7 = 0;
      }
      else
      {
        v19 = *((_BYTE *)self + 108);
        v20 = objc_alloc((Class)NSData);
        if ((v19 & 2) != 0)
          v21 = objc_msgSend(v20, "initWithBytesNoCopy:length:freeWhenDone:", v7, v30, 0);
        else
          v21 = objc_msgSend(v20, "initWithBytes:length:", v7, v30);
        v22 = v21;
        v7 = -[CUINamedRenditionInfo initWithData:keyFormat:andPlatform:]([CUINamedRenditionInfo alloc], "initWithData:keyFormat:andPlatform:", v21, -[CUICommonAssetStorage keyFormat](self, "keyFormat"), -[CUICommonAssetStorage deploymentPlatform](self, "deploymentPlatform"));

        if (v7)
        {
          os_unfair_lock_lock(-[CUICommonAssetStorage renditionInfoCacheLock](self, "renditionInfoCacheLock"));
          for (i = 0; i != 20; ++i)
          {
            v24 = (char *)self + 2 * i;
            if (!*((_WORD *)v24 + 60))
            {
              *((_WORD *)v24 + 60) = v3;
              self->_renditionInfoCache[i] = v7;
              goto LABEL_26;
            }
          }
          v25 = 0;
          v26 = &self->_renditionInfoCache[1];
          do
          {
            renditionInfoCacheLookup[v25] = renditionInfoCacheLookup[v25 + 1];
            v27 = *(v26 - 1);
            *(v26 - 1) = *v26;
            *v26 = 0;
            renditionInfoCacheLookup[v25 + 1] = 0;
            ++v26;
            ++v25;
          }
          while (v25 != 19);
          self->_renditionInfoCacheLookup[19] = v3;
          self->_renditionInfoCache[19] = v7;
LABEL_26:
          os_unfair_lock_unlock(-[CUICommonAssetStorage renditionInfoCacheLock](self, "renditionInfoCacheLock"));
          v28 = v7;
        }
      }
    }
    os_unfair_lock_unlock(-[CUICommonAssetStorage lock](self, "lock"));
  }
  return v7;
}

- (os_unfair_lock_s)renditionInfoCacheLock
{
  return &self->_renditionInfoCacheLock;
}

- (BOOL)swapped
{
  return *((_BYTE *)self + 108) & 1;
}

- (unsigned)storageVersion
{
  _carheader *header;

  header = self->_header;
  if (header)
    return header->var2;
  else
    return 1;
}

- (BOOL)assetExistsForKeyData:(const void *)a3 length:(unint64_t)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  objc_msgSend(+[CUIRuntimeStatistics sharedRuntimeStatistics](CUIRuntimeStatistics, "sharedRuntimeStatistics"), "incrementStaticsProbe");
  os_unfair_lock_lock(-[CUICommonAssetStorage lock](self, "lock"));
  LOBYTE(a4) = BOMTreeValueExists((uint64_t)self->_imagedb, (void *)a3, a4, v7, v8, v9, v10, v11) != 0;
  os_unfair_lock_unlock(-[CUICommonAssetStorage lock](self, "lock"));
  return a4;
}

- (os_unfair_lock_s)lock
{
  return &self->_lock;
}

- (unsigned)distilledInCoreUIVersion
{
  unint64_t v2;
  _carheader *header;

  header = self->_header;
  if (header)
  {
    LODWORD(v2) = header->var1;
    return (double)v2;
  }
  else
  {
    return floor(916.0);
  }
}

- (int64_t)deploymentPlatform
{
  return CUIPlatformForPlatformString(-[CUICommonAssetStorage deploymentPlatformString](self, "deploymentPlatformString"));
}

- (unsigned)appearanceIdentifierForName:(id)a3
{
  id v3;

  if ((*((_BYTE *)self + 108) & 4) != 0)
  {
    v3 = -[NSDictionary objectForKey:](-[CUICommonAssetStorage appearances](self, "appearances"), "objectForKey:", a3);
    if (v3)
      LOWORD(v3) = (unsigned __int16)objc_msgSend(v3, "unsignedIntegerValue");
  }
  else
  {
    LOWORD(v3) = 0;
  }
  return (unsigned __int16)v3;
}

- (NSDictionary)appearances
{
  NSDictionary *result;

  result = self->_appearances;
  if (!result)
  {
    result = (NSDictionary *)objc_msgSend(-[CUICommonAssetStorage _readAppearances](self, "_readAppearances"), "copy");
    self->_appearances = result;
  }
  return result;
}

- (id)assetForKey:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSData *v16;
  uint64_t v17;
  NSData *v18;
  unint64_t Value;
  const void *v20;
  void *v21;
  size_t size;

  os_unfair_lock_lock(-[CUICommonAssetStorage lock](self, "lock"));
  v5 = objc_msgSend(a3, "bytes");
  v6 = objc_msgSend(a3, "length");
  size = 0;
  v16 = 0;
  if (!BOMTreeGetValueSize((uint64_t)self->_imagedb, v5, (unint64_t)v6, (uint64_t *)&size, v7, v8, v9, v10))
  {
    if ((*((_BYTE *)self + 108) & 2) != 0
      && (v17 = BOMTreeReadValue((uint64_t)self->_imagedb, v5, (unint64_t)v6, v11, v12, v13, v14, v15)) != 0)
    {
      v18 = +[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:", v17, size, 0);
    }
    else
    {
      Value = BOMTreeGetValue((uint64_t)self->_imagedb, v5, (unint64_t)v6, v11, v12, v13, v14, v15);
      if (!Value
        || (v20 = (const void *)Value,
            v21 = malloc_type_malloc(size, 0x92DDF3A0uLL),
            __CFSetLastAllocationEventName(v21, "CSIData"),
            !v21))
      {
        v16 = 0;
        goto LABEL_10;
      }
      memcpy(v21, v20, size);
      v18 = +[NSData dataWithBytesNoCopy:length:](NSData, "dataWithBytesNoCopy:length:", v21, size);
    }
    v16 = v18;
  }
LABEL_10:
  os_unfair_lock_unlock(-[CUICommonAssetStorage lock](self, "lock"));
  return v16;
}

- (id)nameForAppearanceIdentifier:(unsigned __int16)a3
{
  int v3;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __CFString *v20;
  unsigned __int16 *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  __CFString *v44;

  if (!self->_appearancedb)
    return &stru_1E41B97C0;
  v3 = a3;
  os_unfair_lock_lock(-[CUICommonAssetStorage lock](self, "lock"));
  v5 = BOMTreeIteratorNew((uint64_t)self->_appearancedb, 0, 0, 0);
  v20 = &stru_1E41B97C0;
  if (!BOMTreeIteratorIsAtEnd((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12))
  {
    while (1)
    {
      v21 = (unsigned __int16 *)BOMTreeIteratorValue((uint64_t)v5, v13, v14, v15, v16, v17, v18, v19);
      if (v21)
      {
        if (*v21 == v3)
          break;
      }
      BOMTreeIteratorNext((uint64_t)v5, v22, v23, v24, v25, v26, v27, v28);
      if (BOMTreeIteratorIsAtEnd((uint64_t)v5, v29, v30, v31, v32, v33, v34, v35))
        goto LABEL_9;
    }
    v36 = BOMTreeIteratorKey((uint64_t)v5, v22, v23, v24, v25, v26, v27, v28);
    v20 = (__CFString *)objc_msgSend(objc_alloc((Class)NSString), "initWithBytes:length:encoding:", v36, BOMTreeIteratorKeySize((uint64_t)v5, v37, v38, v39, v40, v41, v42, v43), 4);
    v44 = v20;
  }
LABEL_9:
  BOMTreeIteratorFree(v5);
  os_unfair_lock_unlock(-[CUICommonAssetStorage lock](self, "lock"));
  return v20;
}

- (id)deploymentPlatformString
{
  _carextendedMetadata *extendedMetadata;

  -[CUICommonAssetStorage _loadExtendedMetadata](self, "_loadExtendedMetadata");
  extendedMetadata = self->_extendedMetadata;
  if (extendedMetadata && extendedMetadata->var3[0])
    return +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", extendedMetadata->var3);
  else
    return 0;
}

- (void)_loadExtendedMetadata
{
  uint64_t v3;
  unsigned int NamedBlock;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  unint64_t v12;
  _carextendedMetadata *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  size_t v17;

  if (!self->_extendedMetadata)
  {
    v3 = BOMTreeStorage((uint64_t)-[CUICommonAssetStorage imagedb](self, "imagedb"));
    NamedBlock = BOMStorageGetNamedBlock(v3, "EXTENDED_METADATA");
    if (NamedBlock)
    {
      v11 = NamedBlock;
      if ((*((_BYTE *)self + 108) & 2) != 0)
      {
        self->_extendedMetadata = (_carextendedMetadata *)BOMStorageReadFromBlock(v3, NamedBlock, v5, v6, v7, v8, v9, v10);
      }
      else
      {
        v12 = BOMStorageSizeOfBlock(v3, NamedBlock, v5, v6, v7, v8, v9, v10);
        v13 = (_carextendedMetadata *)malloc_type_calloc(1uLL, 0x404uLL, 0x100004084B5CCE0uLL);
        self->_extendedMetadata = v13;
        if (v12 >= 0x404)
          v17 = 1028;
        else
          v17 = v12;
        BOMStorageCopyFromBlockRange(v3, v11, 0, v17, v13, v14, v15, v16);
      }
    }
  }
}

- (void)imagedb
{
  return self->_imagedb;
}

- (id)_readAppearances
{
  id v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unsigned __int16 *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  if (self->_appearancedb)
  {
    v3 = objc_alloc_init((Class)NSMutableDictionary);
    os_unfair_lock_lock(-[CUICommonAssetStorage lock](self, "lock"));
    v4 = BOMTreeIteratorNew((uint64_t)self->_appearancedb, 0, 0, 0);
    if (!BOMTreeIteratorIsAtEnd((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11))
    {
      do
      {
        v19 = (unsigned __int16 *)BOMTreeIteratorValue((uint64_t)v4, v12, v13, v14, v15, v16, v17, v18);
        if (v19)
        {
          v27 = *v19;
          v28 = BOMTreeIteratorKey((uint64_t)v4, v20, v21, v22, v23, v24, v25, v26);
          v36 = objc_msgSend(objc_alloc((Class)NSString), "initWithBytes:length:encoding:", v28, BOMTreeIteratorKeySize((uint64_t)v4, v29, v30, v31, v32, v33, v34, v35), 4);
          objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v27), v36);

        }
        BOMTreeIteratorNext((uint64_t)v4, v20, v21, v22, v23, v24, v25, v26);
      }
      while (!BOMTreeIteratorIsAtEnd((uint64_t)v4, v37, v38, v39, v40, v41, v42, v43));
    }
    BOMTreeIteratorFree(v4);
    os_unfair_lock_unlock(-[CUICommonAssetStorage lock](self, "lock"));
  }
  else
  {
    v3 = 0;
  }
  if (objc_msgSend(v3, "count"))
    return v3;

  return 0;
}

- (id)localizations
{
  id v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unsigned __int16 *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  if (self->_localizationdb)
  {
    v3 = objc_alloc_init((Class)NSMutableDictionary);
    os_unfair_lock_lock(-[CUICommonAssetStorage lock](self, "lock"));
    v4 = BOMTreeIteratorNew((uint64_t)self->_localizationdb, 0, 0, 0);
    if (!BOMTreeIteratorIsAtEnd((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11))
    {
      do
      {
        v19 = (unsigned __int16 *)BOMTreeIteratorValue((uint64_t)v4, v12, v13, v14, v15, v16, v17, v18);
        if (v19)
        {
          v27 = *v19;
          v28 = BOMTreeIteratorKey((uint64_t)v4, v20, v21, v22, v23, v24, v25, v26);
          v36 = objc_msgSend(objc_alloc((Class)NSString), "initWithBytes:length:encoding:", v28, BOMTreeIteratorKeySize((uint64_t)v4, v29, v30, v31, v32, v33, v34, v35), 4);
          objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v27), v36);

        }
        BOMTreeIteratorNext((uint64_t)v4, v20, v21, v22, v23, v24, v25, v26);
      }
      while (!BOMTreeIteratorIsAtEnd((uint64_t)v4, v37, v38, v39, v40, v41, v42, v43));
    }
    BOMTreeIteratorFree(v4);
    os_unfair_lock_unlock(-[CUICommonAssetStorage lock](self, "lock"));
  }
  else
  {
    v3 = 0;
  }
  if (objc_msgSend(v3, "count"))
    return v3;

  return 0;
}

- (BOOL)_commonInitWithStorage:(_BOMStorage *)a3 forWritting:(BOOL)a4
{
  unsigned int NamedBlock;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _carheader *header;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unsigned int v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unsigned int v48;
  size_t v49;
  size_t v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unsigned int v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unsigned int v64;
  size_t v65;
  size_t v66;
  _renditionkeyfmt *v67;
  void **p_keyfmt;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  unsigned int v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  unsigned int v101;
  size_t v102;
  size_t v103;
  void *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  _renditionkeyfmt *keyfmt;
  size_t var2;
  unsigned int *var3;
  unsigned int *v113;
  unsigned int v114;
  unsigned int v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  _renditionkeyfmt *v123;
  unsigned int v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  unsigned int v131;
  size_t v132;
  _DWORD *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  NSSet *v139;
  unsigned int v140;
  _DWORD *v141;
  id v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  void *v150;
  char v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  void *bitmapKeydb;
  _BYTE *v160;
  void *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;

  NamedBlock = BOMStorageGetNamedBlock(a3, "CARHEADER");
  if (NamedBlock)
  {
    v14 = NamedBlock;
    v15 = BOMStorageSizeOfBlock((uint64_t)a3, NamedBlock, v8, v9, v10, v11, v12, v13);
    if (v15 >= 0x1B5)
    {
      v191 = BOMStorageFileName(a3);
      _CUILog(4, (uint64_t)"CoreUI: Car file '%s' has a malformed header(%zu) sizeof CAR_HEADER_NAME > structure used to store data(%zu)", v16, v17, v18, v19, v20, v21, v191);
      return 0;
    }
    if (v15 == 436)
    {
      header = (_carheader *)malloc_type_malloc(0x1B4uLL, 0x7A26D82CuLL);
      self->_header = header;
    }
    else
    {
      if (a4)
      {
        v192 = BOMStorageFileName(a3);
        _CUILog(4, (uint64_t)"CoreUI: Can't update header information for old version of CAR '%s'", v35, v36, v37, v38, v39, v40, v192);
        return 0;
      }
      -[CUICommonAssetStorage _initDefaultHeaderVersion:versionString:](self, "_initDefaultHeaderVersion:versionString:", "@(#)PROGRAM:CoreUI  PROJECT:CoreUI-916\n", 916.0);
      header = self->_header;
    }
    BOMStorageCopyFromBlock((uint64_t)a3, v14, header, v30, v31, v32, v33, v34);
    if (self->_header->var0 == 1380013123)
    {
      -[CUICommonAssetStorage _swapHeader](self, "_swapHeader");
      *((_BYTE *)self + 108) |= 1u;
    }
    -[CUICommonAssetStorage _bringHeaderInfoUpToDate](self, "_bringHeaderInfoUpToDate");
  }
  else
  {
    v22 = BOMStorageFileName(a3);
    _CUILog(4, (uint64_t)"CoreUI: Car file '%s' has no header information.  Using default values", v23, v24, v25, v26, v27, v28, v22);
    -[CUICommonAssetStorage _initDefaultHeaderVersion:versionString:](self, "_initDefaultHeaderVersion:versionString:", "@(#)PROGRAM:CoreUI  PROJECT:CoreUI-916\n", 916.0);
  }
  self->_thinnedWithCoreUIVersion = -1;
  v41 = BOMStorageGetNamedBlock(a3, "CARGLOBALS");
  if (v41)
  {
    v48 = v41;
    v49 = BOMStorageSizeOfBlock((uint64_t)a3, v41, v42, v43, v44, v45, v46, v47);
    if (v49)
    {
      v50 = v49;
      v51 = malloc_type_malloc(v49, 0xC52B9E1DuLL);
      BOMStorageCopyFromBlock((uint64_t)a3, v48, v51, v52, v53, v54, v55, v56);
      self->_globals = (NSData *)objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", v51, v50);
      free(v51);
    }
  }
  v57 = BOMStorageGetNamedBlock(a3, "KEYFORMAT");
  if (v57)
  {
    v64 = v57;
    v65 = BOMStorageSizeOfBlock((uint64_t)a3, v57, v58, v59, v60, v61, v62, v63);
    if (v65 < 0xC)
    {
      v81 = BOMStorageFileName(a3);
      _CUILog(4, (uint64_t)"CoreUI: Car file '%s' has erroneous key format information keyformat is too short. Using CUISystemThemeRenditionKeyFormat", v82, v83, v84, v85, v86, v87, v81);
      p_keyfmt = (void **)&self->_keyfmt;
LABEL_26:
      *p_keyfmt = 0;
      goto LABEL_27;
    }
    v66 = v65;
    v67 = (_renditionkeyfmt *)malloc_type_malloc(v65, 0xAFF191A0uLL);
    self->_keyfmt = v67;
    p_keyfmt = (void **)&self->_keyfmt;
    BOMStorageCopyFromBlock((uint64_t)a3, v64, v67, v69, v70, v71, v72, v73);
    if ((*((_BYTE *)self + 108) & 1) != 0)
      -[CUICommonAssetStorage _swapKeyFormat](self, "_swapKeyFormat");
    if (*(_DWORD *)*p_keyfmt != 1801874804)
    {
      v193 = BOMStorageFileName(a3);
      _CUILog(4, (uint64_t)"CoreUI: Car file '%s' has erroneous key format information. Using CUISystemThemeRenditionKeyFormat", v88, v89, v90, v91, v92, v93, v193);
      goto LABEL_25;
    }
    if (4 * *((unsigned int *)*p_keyfmt + 2) + 12 != v66)
    {
      v74 = BOMStorageFileName(a3);
      _CUILog(4, (uint64_t)"CoreUI: Car file '%s' has erroneous key format information keyformat #keys %d doesn't match size %d. Using CUISystemThemeRenditionKeyFormat", v75, v76, v77, v78, v79, v80, v74);
LABEL_25:
      free(*p_keyfmt);
      goto LABEL_26;
    }
  }
LABEL_27:
  v94 = BOMStorageGetNamedBlock(a3, "KEYFORMATWORKAROUND");
  if (v94 && self->_keyfmt)
  {
    v101 = v94;
    v102 = BOMStorageSizeOfBlock((uint64_t)a3, v94, v95, v96, v97, v98, v99, v100);
    if (v102 < 0xC)
    {
      v116 = BOMStorageFileName(a3);
      _CUILog(4, (uint64_t)"CoreUI: Car file '%s' KEY_FORMAT_WORKAROUND that is too short ignoring.", v117, v118, v119, v120, v121, v122, v116);
    }
    else
    {
      v103 = v102;
      v104 = malloc_type_malloc(v102, 0x76DDFE77uLL);
      BOMStorageCopyFromBlock((uint64_t)a3, v101, v104, v105, v106, v107, v108, v109);
      keyfmt = self->_keyfmt;
      var2 = keyfmt->var2;
      if (v103 >> 2 < var2)
        var2 = v103 >> 2;
      if (var2)
      {
        var3 = keyfmt->var3;
        v113 = (unsigned int *)v104;
        do
        {
          v115 = *v113++;
          v114 = v115;
          if (v115)
            *var3 = v114;
          ++var3;
          --var2;
        }
        while (var2);
      }
      free(v104);
    }
  }
  v123 = self->_keyfmt;
  if (v123)
    CUIRenditionKeyInitializeAttributeIndexWithKeyFormat((uint64_t)&self->_keyfmtindex, (uint64_t)v123);
  v124 = BOMStorageGetNamedBlock(a3, "EXTERNAL_KEYS");
  if (v124)
  {
    v131 = v124;
    v132 = BOMStorageSizeOfBlock((uint64_t)a3, v124, v125, v126, v127, v128, v129, v130);
    v133 = malloc_type_malloc(v132, 0x701972C7uLL);
    BOMStorageCopyFromBlock((uint64_t)a3, v131, v133, v134, v135, v136, v137, v138);
    if (*v133 == 1163414603)
    {
      v139 = (NSSet *)objc_alloc_init((Class)NSMutableSet);
      if (v133[2])
      {
        v140 = 0;
        v141 = v133 + 3;
        do
        {
          v142 = objc_msgSend(objc_alloc((Class)NSString), "initWithUTF8String:", v141 + 2);
          -[NSSet addObject:](v139, "addObject:", v142);

          v141 = (_DWORD *)((char *)v141 + v141[1] + 8);
          ++v140;
        }
        while (v140 < v133[2]);
      }
      self->_externalTags = v139;
    }
    else
    {
      v143 = BOMStorageFileName(a3);
      _CUILog(4, (uint64_t)"CoreUI: Car file '%s' has erroneous external tags information ignoring", v144, v145, v146, v147, v148, v149, v143);
    }
    free(v133);
  }
  v150 = (void *)BOMTreeOpenWithName((uint64_t)a3, "RENDITIONS", a4);
  if (!v150)
  {
    v194 = BOMStorageFileName(a3);
    _CUILog(4, (uint64_t)"CoreUI: Error: CUICommonAssetStorage No rendition tree found in '%s'", v152, v153, v154, v155, v156, v157, v194);
    return 0;
  }
  self->_imagedb = v150;
  self->_colordb = (void *)BOMTreeOpenWithName((uint64_t)a3, "COLORS", a4);
  self->_fontdb = (void *)BOMTreeOpenWithName((uint64_t)a3, "FONTS", a4);
  self->_fontsizedb = (void *)BOMTreeOpenWithName((uint64_t)a3, "FONTSIZES", a4);
  self->_facetKeysdb = (void *)BOMTreeOpenWithName((uint64_t)a3, "FACETKEYS", a4);
  self->_bitmapKeydb = (void *)BOMTreeOpenWithName((uint64_t)a3, "BITMAPKEYS", a4);
  self->_appearancedb = (void *)BOMTreeOpenWithName((uint64_t)a3, "APPEARANCEKEYS", a4);
  self->_localizationdb = (void *)BOMTreeOpenWithName((uint64_t)a3, "LOCALIZATIONKEYS", a4);
  if (BOMStorageIsOpenForWriting((uint64_t)a3) || !BOMStorageMemoryMapped((_BOOL8)a3))
    v151 = *((_BYTE *)self + 108) & 0xFD;
  else
    v151 = *((_BYTE *)self + 108) | 2;
  *((_BYTE *)self + 108) = v151;
  bitmapKeydb = self->_bitmapKeydb;
  if (bitmapKeydb && !a4)
  {
    v160 = BOMTreeIteratorNew((uint64_t)bitmapKeydb, 0, 0, 0);
    v161 = (void *)MEMORY[0x1A1AEEF7C]();
    if (!BOMTreeIteratorIsAtEnd((uint64_t)v160, v162, v163, v164, v165, v166, v167, v168))
    {
      v176 = 22;
      do
      {
        -[CUICommonAssetStorage renditionInfoForIdentifier:](self, "renditionInfoForIdentifier:", (unsigned __int16)BOMTreeIteratorKey((uint64_t)v160, v169, v170, v171, v172, v173, v174, v175));
        if (!--v176)
          break;
        BOMTreeIteratorNext((uint64_t)v160, v177, v178, v179, v180, v181, v182, v183);
      }
      while (!BOMTreeIteratorIsAtEnd((uint64_t)v160, v184, v185, v186, v187, v188, v189, v190));
    }
    objc_autoreleasePoolPop(v161);
    BOMTreeIteratorFree(v160);
  }
  if (self->_appearancedb)
  {
    self->_appearances = (NSDictionary *)objc_msgSend(-[CUICommonAssetStorage _readAppearances](self, "_readAppearances"), "copy");
    *((_BYTE *)self + 108) = *((_BYTE *)self + 108) & 0xFB | (4
                                                            * CUIRenditionKeyHasIdentifier((uint64_t)-[CUICommonAssetStorage keyFormat](self, "keyFormat"), 7));
  }
  *((_BYTE *)self + 108) = *((_BYTE *)self + 108) & 0xF7 | (8
                                                          * CUIRenditionKeyHasIdentifier((uint64_t)-[CUICommonAssetStorage keyFormat](self, "keyFormat"), 13));
  return 1;
}

- (void)_bringHeaderInfoUpToDate
{
  _carheader *header;

  header = self->_header;
  if (header->var2 <= 5)
    header->var9 = 1;
}

- (const)renditionKeyForName:(const char *)a3 hotSpot:(CGPoint *)a4
{
  double v7;
  double v8;
  unsigned int v9;
  size_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSMutableData *v21;
  unint64_t Value;
  unsigned int v23;
  uint64_t v24;
  unsigned int *v25;
  uint64_t v26;
  unsigned int v27;
  int v28;
  uint64_t v29;
  int v30;

  v30 = 0;
  v29 = 0;
  os_unfair_lock_lock(-[CUICommonAssetStorage lock](self, "lock"));
  v7 = -1.0;
  if (!a3)
  {
    v8 = -1.0;
LABEL_6:
    v21 = +[NSMutableData dataWithBytes:length:](NSMutableData, "dataWithBytes:length:", &v30, 4);
    goto LABEL_7;
  }
  v8 = -1.0;
  if (!self->_facetKeysdb)
    goto LABEL_6;
  v9 = -[CUICommonAssetStorage swapped](self, "swapped");
  v10 = strlen(a3);
  if (BOMTreeGetValueSize((uint64_t)self->_facetKeysdb, (void *)a3, v10, &v29, v11, v12, v13, v14))
    goto LABEL_4;
  if ((*((_BYTE *)self + 108) & 2) == 0
    || (Value = BOMTreeReadValue((uint64_t)self->_facetKeysdb, (void *)a3, v10, v15, v16, v17, v18, v19)) == 0)
  {
    Value = BOMTreeGetValue((uint64_t)self->_facetKeysdb, (void *)a3, v10, v15, v16, v17, v18, v19);
  }
  if (!Value || !v29)
  {
LABEL_4:
    os_unfair_lock_unlock(-[CUICommonAssetStorage lock](self, "lock"));
    return 0;
  }
  v23 = *(unsigned __int16 *)Value;
  if (v9)
  {
    v7 = (double)__rev16(v23);
    v8 = (double)(bswap32(*(unsigned __int16 *)(Value + 2)) >> 16);
    LODWORD(v24) = bswap32(*(unsigned __int16 *)(Value + 4)) >> 16;
  }
  else
  {
    v7 = (double)(__int16)v23;
    v8 = (double)*(__int16 *)(Value + 2);
    LODWORD(v24) = *(unsigned __int16 *)(Value + 4);
  }
  v21 = +[NSMutableData dataWithCapacity:](NSMutableData, "dataWithCapacity:", 4 * v24 + 4);
  __CFSetLastAllocationEventName(v21, "CUIRenditionKeyToken");
  if ((_DWORD)v24)
  {
    v24 = v24;
    v25 = (unsigned int *)(Value + 6);
    do
    {
      v28 = 0;
      v27 = *v25++;
      v26 = v27;
      if (v9)
      {
        Value = Value & 0xFFFFFFFF00000000 | v26;
        LODWORD(v26) = -[CUICommonAssetStorage _swapRenditionKeyToken:](self, "_swapRenditionKeyToken:", Value);
      }
      v28 = v26;
      -[NSMutableData appendBytes:length:](v21, "appendBytes:length:", &v28, 4);
      --v24;
    }
    while (v24);
  }
  -[NSMutableData appendBytes:length:](v21, "appendBytes:length:", &v30, 4);
  if (!v29)
    goto LABEL_6;
LABEL_7:
  if (a4)
  {
    a4->x = v7;
    a4->y = v8;
  }
  os_unfair_lock_unlock(-[CUICommonAssetStorage lock](self, "lock"));
  return (const _renditionkeytoken *)-[NSMutableData bytes](v21, "bytes");
}

- (unsigned)renditionCount
{
  _carheader *header;

  header = self->_header;
  if (header)
    return header->var4;
  else
    return 0;
}

- (BOOL)getColor:(_colordef *)a3 forName:(const char *)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *colordb;
  unint64_t Value;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v21;
  _OWORD v22[8];
  int v23;

  v21 = 0;
  os_unfair_lock_lock(-[CUICommonAssetStorage lock](self, "lock"));
  if (a4
    && self->_colordb
    && ((v23 = 0,
         memset(v22, 0, sizeof(v22)),
         __strlcpy_chk((char *)v22 + 4, a4, 128, 128),
         colordb = self->_colordb,
         (*((_BYTE *)self + 108) & 2) != 0)
      ? (Value = BOMTreeReadValue((uint64_t)colordb, v22, 0x84uLL, v7, v8, v9, v10, v11))
      : (Value = BOMTreeGetValue((uint64_t)colordb, v22, 0x84uLL, v7, v8, v9, v10, v11)),
        (v18 = Value) != 0))
  {
    if (a3
      && !BOMTreeGetValueSize((uint64_t)self->_colordb, v22, 0x84uLL, &v21, v14, v15, v16, v17)
      && v21 == 12)
    {
      v19 = *(_QWORD *)v18;
      a3->var2 = *(_rgbquad *)(v18 + 8);
      *(_QWORD *)&a3->var0 = v19;
      if ((*((_BYTE *)self + 108) & 1) != 0)
      {
        a3->var2 = (_rgbquad)bswap32(*(_DWORD *)&a3->var2);
        *(int8x8_t *)&a3->var0 = vrev32_s8(*(int8x8_t *)&a3->var0);
      }
    }
    os_unfair_lock_unlock(-[CUICommonAssetStorage lock](self, "lock"));
    return 1;
  }
  else
  {
    os_unfair_lock_unlock(-[CUICommonAssetStorage lock](self, "lock"));
    return 0;
  }
}

- (id)path
{
  uint64_t v2;
  const char *v3;

  v2 = BOMTreeStorage((uint64_t)self->_imagedb);
  v3 = (const char *)BOMStorageFileName(v2);
  return -[NSFileManager stringWithFileSystemRepresentation:length:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "stringWithFileSystemRepresentation:length:", v3, strlen(v3));
}

- (CUICommonAssetStorage)initWithPath:(id)a3 forWriting:(BOOL)a4
{
  _BOOL8 v4;
  CUICommonAssetStorage *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CUICommonAssetStorage *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE *v22;
  uint64_t v24;
  objc_super v25;

  v4 = a4;
  v25.receiver = self;
  v25.super_class = (Class)CUICommonAssetStorage;
  v6 = -[CUICommonAssetStorage init](&v25, sel_init);
  v14 = v6;
  if (v6)
  {
    BOMExceptionHandlerSetDefault((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13, v24);
    v15 = BOMStorageOpenWithSys((uint64_t)objc_msgSend(a3, "fileSystemRepresentation"), v4, 0);
    if (!v15)
    {
      _CUILog(4, (uint64_t)"CoreUI: Error: CUICommonAssetStorage -initWithPath: Unable to read file at '%@'", v16, v17, v18, v19, v20, v21, (uint64_t)a3);
      goto LABEL_6;
    }
    v22 = (_BYTE *)v15;
    if (!-[CUICommonAssetStorage _commonInitWithStorage:forWritting:](v14, "_commonInitWithStorage:forWritting:", v15, v4))
    {
      BOMStorageFree(v22);
LABEL_6:

      return 0;
    }
  }
  return v14;
}

- (CUICommonAssetStorage)initWithPath:(id)a3
{
  return -[CUICommonAssetStorage initWithPath:forWriting:](self, "initWithPath:forWriting:", a3, 0);
}

- (unsigned)localizationIdentifierForName:(id)a3
{
  unsigned __int16 v3;
  CFIndex MaximumSizeOfFileSystemRepresentation;
  char *v7;
  void *v8;
  size_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int16 *Value;

  if ((*((_BYTE *)self + 108) & 8) == 0)
    return 0;
  MaximumSizeOfFileSystemRepresentation = CFStringGetMaximumSizeOfFileSystemRepresentation((CFStringRef)a3);
  v7 = (char *)malloc_type_malloc(MaximumSizeOfFileSystemRepresentation, 0xD4913AFBuLL);
  if (CFStringGetFileSystemRepresentation((CFStringRef)a3, v7, MaximumSizeOfFileSystemRepresentation))
  {
    os_unfair_lock_lock(-[CUICommonAssetStorage lock](self, "lock"));
    v8 = -[CUICommonAssetStorage localizationdb](self, "localizationdb");
    v9 = strlen(v7);
    Value = (unsigned __int16 *)BOMTreeReadValue((uint64_t)v8, v7, v9, v10, v11, v12, v13, v14);
    if (Value)
      v3 = *Value;
    else
      v3 = 0;
    os_unfair_lock_unlock(-[CUICommonAssetStorage lock](self, "lock"));
  }
  else
  {
    v3 = 0;
  }
  free(v7);
  return v3;
}

- (void)localizationdb
{
  return self->_localizationdb;
}

- (void)setExternalTags:(id)a3
{
  NSSet *externalTags;
  NSSet *v5;

  externalTags = self->_externalTags;
  if (externalTags != a3)
  {

    v5 = self->_externalTags;
  }
}

- (void)_initDefaultHeaderVersion:(double)a3 versionString:(const char *)a4
{
  _carheader *v7;
  _carheader *header;

  *((_DWORD *)self + 27) &= 0xFu;
  v7 = (_carheader *)malloc_type_malloc(0x1B4uLL, 0x100004050C72333uLL);
  self->_header = v7;
  *(_OWORD *)&v7->var0 = 0u;
  *(_OWORD *)&v7->var4 = 0u;
  *(_OWORD *)&v7->var5[12] = 0u;
  *(_OWORD *)&v7->var5[28] = 0u;
  *(_OWORD *)&v7->var5[44] = 0u;
  *(_OWORD *)&v7->var5[60] = 0u;
  *(_OWORD *)&v7->var5[76] = 0u;
  *(_OWORD *)&v7->var5[92] = 0u;
  *(_OWORD *)&v7->var5[108] = 0u;
  *(_OWORD *)&v7->var5[124] = 0u;
  *(_OWORD *)&v7->var6[12] = 0u;
  *(_OWORD *)&v7->var6[28] = 0u;
  *(_OWORD *)&v7->var6[44] = 0u;
  *(_OWORD *)&v7->var6[60] = 0u;
  *(_OWORD *)&v7->var6[76] = 0u;
  *(_OWORD *)&v7->var6[92] = 0u;
  *(_OWORD *)&v7->var6[108] = 0u;
  *(_OWORD *)&v7->var6[124] = 0u;
  *(_OWORD *)&v7->var6[140] = 0u;
  *(_OWORD *)&v7->var6[156] = 0u;
  *(_OWORD *)&v7->var6[172] = 0u;
  *(_OWORD *)&v7->var6[188] = 0u;
  *(_OWORD *)&v7->var6[204] = 0u;
  *(_OWORD *)&v7->var6[220] = 0u;
  *(_OWORD *)&v7->var6[236] = 0u;
  *(_OWORD *)&v7->var6[252] = 0u;
  *(_OWORD *)&v7->var7[12] = 0u;
  v7->var11 = 0;
  header = self->_header;
  header->var0 = 1129595218;
  header->var1 = vcvtmd_u64_f64(a3);
  *(_QWORD *)&header->var2 = 1;
  header->var4 = 0;
  strncpy(header->var5, a4, 0x80uLL);
  uuid_generate_random(self->_header->var7);
  *(_OWORD *)&self->_header->var8 = xmmword_19EC72D60;
  *(_QWORD *)&self->_lock._os_unfair_lock_opaque = 0;
}

- (void)_swapHeader
{
  _carheader *header;

  header = self->_header;
  *(int8x16_t *)&header->var1 = vrev32q_s8(*(int8x16_t *)&header->var1);
  header->var11 = bswap32(header->var11);
  *(int8x8_t *)&header->var8 = vrev32_s8(*(int8x8_t *)&header->var8);
}

- (void)_swapKeyFormat
{
  uint64_t v2;
  _renditionkeyfmt *keyfmt;
  unint64_t v4;

  v2 = 0;
  keyfmt = self->_keyfmt;
  do
  {
    *(unsigned int *)((char *)&keyfmt->var0 + v2) = bswap32(*(unsigned int *)((char *)&keyfmt->var0 + v2));
    v2 += 4;
  }
  while (v2 != 12);
  if (keyfmt->var2)
  {
    v4 = 0;
    do
    {
      keyfmt->var3[v4] = bswap32(keyfmt->var3[v4]);
      ++v4;
    }
    while (v4 < keyfmt->var2);
  }
}

- (CUICommonAssetStorage)initWithBytes:(const void *)a3 length:(unint64_t)a4
{
  CUICommonAssetStorage *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CUICommonAssetStorage *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _BYTE *v27;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)CUICommonAssetStorage;
  v6 = -[CUICommonAssetStorage init](&v29, sel_init);
  v14 = v6;
  if (v6)
  {
    BOMExceptionHandlerSetDefault((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13, (uint64_t)v29.receiver);
    v20 = BOMStorageOpenInRAM((uint64_t)a3, a4, 0, v15, v16, v17, v18, v19);
    if (!v20)
    {
      _CUILog(4, (uint64_t)"CoreUI: Error: CUICommonAssetStorage -initWithBytes:length: unable to read bytes", v21, v22, v23, v24, v25, v26, (uint64_t)v29.receiver);
      goto LABEL_6;
    }
    v27 = v20;
    if (!-[CUICommonAssetStorage _commonInitWithStorage:forWritting:](v14, "_commonInitWithStorage:forWritting:", v20, 0))
    {
      BOMStorageFree(v27);
LABEL_6:

      return 0;
    }
  }
  return v14;
}

+ (BOOL)isValidAssetStorageWithBytes:(const void *)a3 length:(unint64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _BYTE *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unsigned int NamedBlock;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _OWORD v37[27];
  int v38;

  v38 = 0;
  memset(v37, 0, sizeof(v37));
  BOMExceptionHandlerSet(0, (uint64_t)a2, (uint64_t)a3, a4, v4, v5, v6, v7, 0);
  v15 = (uint64_t)BOMStorageOpenInRAM((uint64_t)a3, a4, 0, v10, v11, v12, v13, v14);
  if (v15)
  {
    v23 = (_BYTE *)v15;
    NamedBlock = BOMStorageGetNamedBlock(v15, "CARHEADER");
    if (NamedBlock)
    {
      if ((unint64_t)BOMStorageSizeOfBlock((uint64_t)v23, NamedBlock, v24, v25, v26, v27, v28, v29) > 0x1B4)
      {
        LOBYTE(NamedBlock) = 0;
      }
      else
      {
        BOMStorageCopyFromBlock((uint64_t)v23, NamedBlock, v37, v31, v32, v33, v34, v35);
        LOBYTE(NamedBlock) = LODWORD(v37[0]) == 1129595218;
      }
    }
    v15 = BOMStorageFree(v23);
  }
  else
  {
    LOBYTE(NamedBlock) = 0;
  }
  BOMExceptionHandlerSetDefault(v15, v16, v17, v18, v19, v20, v21, v22, *(uint64_t *)&v37[0]);
  return NamedBlock;
}

+ (BOOL)isValidAssetStorageWithURL:(id)a3
{
  __int128 *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _BYTE *v20;
  unsigned int NamedBlock;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  BOOL v27;
  _OWORD v29[27];
  int v30;

  v30 = 0;
  memset(v29, 0, sizeof(v29));
  v4 = (__int128 *)BomSys_defaultNoMMAP();
  BOMExceptionHandlerSet(0, v5, v6, v7, v8, v9, v10, v11, 0);
  v12 = BOMStorageOpenWithSys((uint64_t)objc_msgSend(a3, "fileSystemRepresentation"), 0, v4);
  if (v12)
  {
    v20 = (_BYTE *)v12;
    NamedBlock = BOMStorageGetNamedBlock(v12, "CARHEADER");
    if (NamedBlock)
    {
      BOMStorageCopyFromBlock((uint64_t)v20, NamedBlock, v29, v22, v23, v24, v25, v26);
      v27 = LODWORD(v29[0]) == 1129595218;
    }
    else
    {
      v27 = 0;
    }
    v12 = BOMStorageFree(v20);
  }
  else
  {
    v27 = 0;
  }
  BOMExceptionHandlerSetDefault(v12, v13, v14, v15, v16, v17, v18, v19, *(uint64_t *)&v29[0]);
  return v27;
}

- (_BOMStorage)_bomStorage
{
  return (_BOMStorage *)BOMTreeStorage((uint64_t)self->_imagedb);
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  uint64_t v5;

  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = BOMTreeStorage((uint64_t)self->_imagedb);
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@:%p '%s'>"), v4, self, BOMStorageFileName(v5));
}

- (void)dealloc
{
  _BYTE *v3;
  _carheader *header;
  _renditionkeyfmt *keyfmt;
  uint64_t i;
  id *v7;
  _carextendedMetadata *extendedMetadata;
  objc_super v9;

  v3 = (_BYTE *)BOMTreeStorage((uint64_t)self->_imagedb);
  BOMTreeFree((uint64_t)self->_imagedb);
  BOMTreeFree((uint64_t)self->_colordb);
  BOMTreeFree((uint64_t)self->_fontdb);
  BOMTreeFree((uint64_t)self->_fontsizedb);
  BOMTreeFree((uint64_t)self->_facetKeysdb);
  BOMTreeFree((uint64_t)self->_bitmapKeydb);
  BOMTreeFree((uint64_t)self->_appearancedb);
  BOMTreeFree((uint64_t)self->_localizationdb);
  header = self->_header;
  if (header)
    free(header);
  keyfmt = self->_keyfmt;
  if (keyfmt)
    free(keyfmt);

  for (i = 0; i != 20; ++i)
  {
    v7 = (id *)(&self->super.isa + i);

    v7[20] = 0;
    self->_renditionInfoCacheLookup[i] = 0;
  }
  if (BOMStorageIsOpenForWriting((uint64_t)v3) || !BOMStorageMemoryMapped((_BOOL8)v3))
  {
    extendedMetadata = self->_extendedMetadata;
    if (extendedMetadata)
      free(extendedMetadata);
  }
  BOMStorageFree(v3);
  v9.receiver = self;
  v9.super_class = (Class)CUICommonAssetStorage;
  -[CUICommonAssetStorage dealloc](&v9, sel_dealloc);
}

- (unsigned)schemaVersion
{
  _carheader *header;

  header = self->_header;
  if (header)
    return header->var9;
  else
    return 1;
}

- (int64_t)_storagefileTimestamp
{
  uint64_t v3;
  const char *v4;
  stat v6;

  os_unfair_lock_lock(-[CUICommonAssetStorage lock](self, "lock"));
  if (!_storagefileTimestamp_tstamp)
  {
    v3 = BOMTreeStorage((uint64_t)self->_imagedb);
    v4 = (const char *)BOMStorageFileName(v3);
    memset(&v6, 0, sizeof(v6));
    stat(v4, &v6);
    _storagefileTimestamp_tstamp = v6.st_mtimespec.tv_sec;
  }
  os_unfair_lock_unlock(-[CUICommonAssetStorage lock](self, "lock"));
  return _storagefileTimestamp_tstamp;
}

- (int64_t)storageTimestamp
{
  _carheader *header;
  int64_t var3;

  header = self->_header;
  if (header && (var3 = header->var3, (_DWORD)var3))
    return var3;
  else
    return -[CUICommonAssetStorage _storagefileTimestamp](self, "_storagefileTimestamp");
}

- (int)keySemantics
{
  return self->_header->var11;
}

- (id)keyFormatData
{
  -[CUICommonAssetStorage keyFormat](self, "keyFormat");
  return +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:");
}

- (id)catalogGlobalData
{
  NSData *globals;

  globals = self->_globals;
  if (globals)
    return -[NSData copy](globals, "copy");
  else
    return +[NSData data](NSData, "data");
}

- (int64_t)maximumRenditionKeyTokenCount
{
  _renditionkeyfmt *keyfmt;

  keyfmt = self->_keyfmt;
  if (keyfmt)
    return keyfmt->var2;
  else
    return 21;
}

- (BOOL)usesCUISystemThemeRenditionKey
{
  return self->_header->var11 == 1;
}

- (const)versionString
{
  _carheader *header;

  header = self->_header;
  if (header)
    return header->var6;
  else
    return 0;
}

- (const)mainVersionString
{
  _carheader *header;

  header = self->_header;
  if (header)
    return header->var5;
  else
    return 0;
}

- (unsigned)thinnedWithCoreUIVersion
{
  unsigned int result;
  id v4;
  NSScanner *v5;
  unsigned int v6;

  result = self->_thinnedWithCoreUIVersion;
  if (result == -1)
  {
    v4 = -[CUICommonAssetStorage thinningArguments](self, "thinningArguments");
    result = 0x7FFFFFFF;
    self->_thinnedWithCoreUIVersion = 0x7FFFFFFF;
    if (v4)
    {
      v6 = 0;
      if (objc_msgSend(v4, "hasPrefix:", CFSTR("carutil")))
      {
        v5 = +[NSScanner scannerWithString:](NSScanner, "scannerWithString:", v4);
        -[NSScanner scanUpToCharactersFromSet:intoString:](v5, "scanUpToCharactersFromSet:intoString:", +[NSCharacterSet decimalDigitCharacterSet](NSCharacterSet, "decimalDigitCharacterSet"), 0);
        if (-[NSScanner scanInt:](v5, "scanInt:", &v6))
          self->_thinnedWithCoreUIVersion = v6;
      }
      return self->_thinnedWithCoreUIVersion;
    }
  }
  return result;
}

- (id)uuid
{
  return objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", self->_header->var7);
}

- (unsigned)associatedChecksum
{
  _carheader *header;

  header = self->_header;
  if (header)
    return header->var8;
  else
    return 0;
}

- (unsigned)colorSpaceID
{
  _carheader *header;

  header = self->_header;
  if (header)
    return header->var10;
  else
    return 0;
}

- (id)thinningArguments
{
  _carextendedMetadata *extendedMetadata;

  -[CUICommonAssetStorage _loadExtendedMetadata](self, "_loadExtendedMetadata");
  extendedMetadata = self->_extendedMetadata;
  if (extendedMetadata)
    return +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", extendedMetadata->var1);
  else
    return 0;
}

- (id)deploymentPlatformVersion
{
  _carextendedMetadata *extendedMetadata;

  -[CUICommonAssetStorage _loadExtendedMetadata](self, "_loadExtendedMetadata");
  extendedMetadata = self->_extendedMetadata;
  if (extendedMetadata)
    return +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", extendedMetadata->var2);
  else
    return 0;
}

- (id)authoringTool
{
  _carextendedMetadata *extendedMetadata;

  -[CUICommonAssetStorage _loadExtendedMetadata](self, "_loadExtendedMetadata");
  extendedMetadata = self->_extendedMetadata;
  if (extendedMetadata)
    return +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", extendedMetadata->var4);
  else
    return 0;
}

- (void)_swapRenditionKeyArray:(unsigned __int16 *)a3
{
  uint64_t v4;

  v4 = -[CUICommonAssetStorage maximumRenditionKeyTokenCount](self, "maximumRenditionKeyTokenCount");
  if (v4 >= 1)
  {
    do
    {
      *a3 = bswap32(*a3) >> 16;
      ++a3;
      --v4;
    }
    while (v4);
  }
}

- (BOOL)assetExistsForKey:(id)a3
{
  return -[CUICommonAssetStorage assetExistsForKeyData:length:](self, "assetExistsForKeyData:length:", objc_msgSend(a3, "bytes"), objc_msgSend(a3, "length"));
}

- (id)allAssetKeys
{
  id v3;
  _QWORD v5[5];

  v3 = objc_alloc_init((Class)NSMutableArray);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __37__CUICommonAssetStorage_allAssetKeys__block_invoke;
  v5[3] = &unk_1E41B1CC0;
  v5[4] = v3;
  -[CUICommonAssetStorage assetKeysMatchingBlock:](self, "assetKeysMatchingBlock:", v5);
  return v3;
}

uint64_t __37__CUICommonAssetStorage_allAssetKeys__block_invoke(uint64_t a1, uint64_t a2)
{
  CUIRenditionKey *v3;

  v3 = -[CUIRenditionKey initWithKeyList:]([CUIRenditionKey alloc], "initWithKeyList:", a2);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

  return 0;
}

- (id)assetKeysMatchingBlock:(id)a3
{
  const _renditionkeyfmt *v5;
  unsigned int var2;
  unsigned __int16 *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[32];

  os_unfair_lock_lock(-[CUICommonAssetStorage lock](self, "lock"));
  v5 = -[CUICommonAssetStorage keyFormat](self, "keyFormat");
  v52 = 0u;
  memset(v53, 0, 28);
  v50 = 0u;
  v51 = 0u;
  v49 = 0u;
  var2 = v5->var2;
  if (var2 < 0x18)
  {
    v7 = (unsigned __int16 *)&v49;
  }
  else
  {
    v7 = (unsigned __int16 *)malloc_type_calloc(var2 + 2, 4uLL, 0x100004052888210uLL);
    var2 = v5->var2;
  }
  v8 = BOMTreeIteratorNew((uint64_t)self->_imagedb, 0, 2 * var2, 0);
  v23 = 0;
  if (!BOMTreeIteratorIsAtEnd((uint64_t)v8, v9, v10, v11, v12, v13, v14, v15))
  {
    v23 = 0;
    do
    {
      v24 = BOMTreeIteratorKey((uint64_t)v8, v16, v17, v18, v19, v20, v21, v22);
      v32 = BOMTreeIteratorKeySize((uint64_t)v8, v25, v26, v27, v28, v29, v30, v31);
      if (-[CUICommonAssetStorage swapped](self, "swapped", v49, v50, v51, v52, *(_QWORD *)v53, *(_OWORD *)&v53[8], *(_QWORD *)&v53[24]))
      {
        -[CUICommonAssetStorage _swapRenditionKeyArray:](self, "_swapRenditionKeyArray:", v24);
      }
      CUIFillRenditionKeyForCARKeyArray(v7, v24, (uint64_t)v5);
      os_unfair_lock_unlock(-[CUICommonAssetStorage lock](self, "lock"));
      v33 = (*((uint64_t (**)(id, unsigned __int16 *, const _renditionkeyfmt *))a3 + 2))(a3, v7, v5);
      os_unfair_lock_lock(-[CUICommonAssetStorage lock](self, "lock"));
      if (v33)
      {
        if (!v23)
          v23 = objc_alloc_init((Class)NSMutableSet);
        objc_msgSend(v23, "addObject:", +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v24, v32));
      }
      if (-[CUICommonAssetStorage swapped](self, "swapped"))
        -[CUICommonAssetStorage _swapRenditionKeyArray:](self, "_swapRenditionKeyArray:", v24);
      BOMTreeIteratorNext((uint64_t)v8, v34, v35, v36, v37, v38, v39, v40);
    }
    while (!BOMTreeIteratorIsAtEnd((uint64_t)v8, v41, v42, v43, v44, v45, v46, v47));
  }
  BOMTreeIteratorFree(v8);
  if (v7 != (unsigned __int16 *)&v49)
    free(v7);
  os_unfair_lock_unlock(-[CUICommonAssetStorage lock](self, "lock", v49, v50, v51, v52, *(_QWORD *)v53, *(_OWORD *)&v53[8], *(_QWORD *)&v53[24]));
  return v23;
}

- (BOOL)enumerateKeysAndObjectsUsingBlock:(id)a3
{
  const _renditionkeyfmt *v5;
  unsigned __int16 *v6;
  uint64_t **v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  unint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  id v50;
  unint64_t v51;
  uint64_t Value;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  id v57;
  void *v58;
  _DWORD *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v82;
  uint64_t v83;

  os_unfair_lock_lock(-[CUICommonAssetStorage lock](self, "lock"));
  v5 = -[CUICommonAssetStorage keyFormat](self, "keyFormat");
  v6 = (unsigned __int16 *)malloc_type_calloc(v5->var2 + 1, 4uLL, 0x100004052888210uLL);
  v7 = (uint64_t **)BOMTreeIteratorNew((uint64_t)self->_imagedb, 0, 0, 0);
  v8 = objc_alloc_init((Class)NSAutoreleasePool);
  if (!BOMTreeIteratorIsAtEnd((uint64_t)v7, v9, v10, v11, v12, v13, v14, v15))
  {
    v82 = (uint64_t)v5;
    v24 = 0;
    v23 = 1;
    while (1)
    {
      v83 = 0;
      if (v24 >= 0x3E9)
      {
        objc_msgSend(v8, "drain");
        v8 = objc_alloc_init((Class)NSAutoreleasePool);
        v24 = 0;
      }
      v83 = 0;
      v25 = (void *)BOMTreeIteratorKey((uint64_t)v7, v16, v17, v18, v19, v20, v21, v22);
      v33 = BOMTreeIteratorKeySize((uint64_t)v7, v26, v27, v28, v29, v30, v31, v32);
      if ((*((_BYTE *)self + 108) & 2) != 0)
      {
        v51 = v33;
        Value = BOMTreeReadValue((uint64_t)self->_imagedb, v25, v33, v36, v37, v38, v39, v40);
        if (!BOMTreeGetValueSize((uint64_t)self->_imagedb, v25, v51, &v83, v53, v54, v55, v56))
        {
          v57 = objc_alloc((Class)NSData);
          v50 = objc_msgSend(v57, "initWithBytesNoCopy:length:freeWhenDone:", Value, v83, 0);
          goto LABEL_11;
        }
      }
      else
      {
        v48 = BOMTreeIteratorValue((uint64_t)v7, v34, v35, v36, v37, v38, v39, v40);
        if (v48)
        {
          v83 = BOMTreeIteratorValueSize(v7, v41, v42, v43, v44, v45, v46, v47);
          v49 = objc_alloc((Class)NSData);
          v50 = objc_msgSend(v49, "initWithBytes:length:", v48, v83);
LABEL_11:
          v58 = v50;
          goto LABEL_14;
        }
        _CUILog(4, (uint64_t)"CoreUI: %s invalid value skipping", v42, v43, v44, v45, v46, v47, (uint64_t)"-[CUICommonAssetStorage enumerateKeysAndObjectsUsingBlock:]");
        v23 = 0;
      }
      v58 = 0;
LABEL_14:
      v59 = objc_msgSend(v58, "bytes");
      if (!v59)
      {
        _CUILog(4, (uint64_t)"CoreUI: %s can't get size of value skipping [data size:%d ptr:%p]", v60, v61, v62, v63, v64, v65, (uint64_t)"-[CUICommonAssetStorage enumerateKeysAndObjectsUsingBlock:]");
LABEL_19:
        v23 = 0;
        goto LABEL_20;
      }
      if (*v59 != 1129599817)
      {
        _CUILog(4, (uint64_t)"CoreUI: %s skipping invalid CSIHeader [signature:%d]", v60, v61, v62, v63, v64, v65, (uint64_t)"-[CUICommonAssetStorage enumerateKeysAndObjectsUsingBlock:]");
        goto LABEL_19;
      }
      CUIFillRenditionKeyForCARKeyArray(v6, (uint64_t)v25, v82);
      os_unfair_lock_unlock(-[CUICommonAssetStorage lock](self, "lock"));
      v66 = (void *)MEMORY[0x1A1AEEF7C]();
      (*((void (**)(id, unsigned __int16 *, void *))a3 + 2))(a3, v6, v58);
      objc_autoreleasePoolPop(v66);
      os_unfair_lock_lock(-[CUICommonAssetStorage lock](self, "lock"));
LABEL_20:

      BOMTreeIteratorNext((uint64_t)v7, v67, v68, v69, v70, v71, v72, v73);
      ++v24;
      if (BOMTreeIteratorIsAtEnd((uint64_t)v7, v74, v75, v76, v77, v78, v79, v80))
        goto LABEL_21;
    }
  }
  v23 = 1;
LABEL_21:
  free(v6);
  BOMTreeIteratorFree(v7);
  objc_msgSend(v8, "drain");
  os_unfair_lock_unlock(-[CUICommonAssetStorage lock](self, "lock"));
  return v23 & 1;
}

- (void)enumerateKeysAndObjectsWithoutIgnoringUsingBlock:(id)a3
{
  const _renditionkeyfmt *v5;
  unsigned __int16 *v6;
  uint64_t **v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  id v49;
  unint64_t v50;
  uint64_t Value;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  id v57;
  _DWORD *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;

  os_unfair_lock_lock(-[CUICommonAssetStorage lock](self, "lock"));
  v5 = -[CUICommonAssetStorage keyFormat](self, "keyFormat");
  v6 = (unsigned __int16 *)malloc_type_calloc(v5->var2 + 1, 4uLL, 0x100004052888210uLL);
  v7 = (uint64_t **)BOMTreeIteratorNew((uint64_t)self->_imagedb, 0, 0, 0);
  v8 = objc_alloc_init((Class)NSAutoreleasePool);
  if (!BOMTreeIteratorIsAtEnd((uint64_t)v7, v9, v10, v11, v12, v13, v14, v15))
  {
    v23 = 0;
    do
    {
      v80 = 0;
      if (v23 >= 0x3E9)
      {
        objc_msgSend(v8, "drain");
        v8 = objc_alloc_init((Class)NSAutoreleasePool);
        v23 = 0;
      }
      v24 = (void *)BOMTreeIteratorKey((uint64_t)v7, v16, v17, v18, v19, v20, v21, v22);
      v32 = BOMTreeIteratorKeySize((uint64_t)v7, v25, v26, v27, v28, v29, v30, v31);
      if ((*((_BYTE *)self + 108) & 2) != 0)
      {
        v50 = v32;
        Value = BOMTreeReadValue((uint64_t)self->_imagedb, v24, v32, v35, v36, v37, v38, v39);
        if (BOMTreeGetValueSize((uint64_t)self->_imagedb, v24, v50, &v80, v52, v53, v54, v55))
        {
          v56 = 0;
          goto LABEL_11;
        }
        v57 = objc_alloc((Class)NSData);
        v49 = objc_msgSend(v57, "initWithBytesNoCopy:length:freeWhenDone:", Value, v80, 0);
      }
      else
      {
        v40 = BOMTreeIteratorValue((uint64_t)v7, v33, v34, v35, v36, v37, v38, v39);
        v80 = BOMTreeIteratorValueSize(v7, v41, v42, v43, v44, v45, v46, v47);
        v48 = objc_alloc((Class)NSData);
        v49 = objc_msgSend(v48, "initWithBytes:length:", v40, v80);
      }
      v56 = v49;
LABEL_11:
      v58 = objc_msgSend(v56, "bytes");
      if (!v58)
      {
        _CUILog(4, (uint64_t)"CoreUI: %s can't get size of value skipping", v59, v60, v61, v62, v63, v64, (uint64_t)"-[CUICommonAssetStorage enumerateKeysAndObjectsWithoutIgnoringUsingBlock:]");
LABEL_16:
        v65 = 0;
        goto LABEL_17;
      }
      if (*v58 != 1129599817)
      {
        _CUILog(4, (uint64_t)"CoreUI: %s skipping invalid CSIHeader", v59, v60, v61, v62, v63, v64, (uint64_t)"-[CUICommonAssetStorage enumerateKeysAndObjectsWithoutIgnoringUsingBlock:]");
        goto LABEL_16;
      }
      CUIFillRenditionKeyForCARKeyArray(v6, (uint64_t)v24, (uint64_t)v5);
      v65 = v56;
LABEL_17:
      os_unfair_lock_unlock(-[CUICommonAssetStorage lock](self, "lock"));
      (*((void (**)(id, unsigned __int16 *, void *))a3 + 2))(a3, v6, v65);
      os_unfair_lock_lock(-[CUICommonAssetStorage lock](self, "lock"));

      BOMTreeIteratorNext((uint64_t)v7, v66, v67, v68, v69, v70, v71, v72);
      ++v23;
    }
    while (!BOMTreeIteratorIsAtEnd((uint64_t)v7, v73, v74, v75, v76, v77, v78, v79));
  }
  free(v6);
  BOMTreeIteratorFree(v7);
  objc_msgSend(v8, "drain");
  os_unfair_lock_unlock(-[CUICommonAssetStorage lock](self, "lock"));
}

- (BOOL)enumerateColorsBlock:(id)a3
{
  void *colordb;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  colordb = self->_colordb;
  if (colordb)
  {
    v5 = BOMTreeIteratorNew((uint64_t)colordb, 0, 0, 0);
    if (!BOMTreeIteratorIsAtEnd((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12))
    {
      do
      {
        v20 = BOMTreeIteratorKey((uint64_t)v5, v13, v14, v15, v16, v17, v18, v19);
        v28 = BOMTreeIteratorValue((uint64_t)v5, v21, v22, v23, v24, v25, v26, v27);
        v29 = objc_msgSend(objc_alloc((Class)NSString), "initWithUTF8String:", v20 + 4);
        (*((void (**)(id, id, _QWORD, _QWORD, _QWORD, _QWORD))a3 + 2))(a3, v29, BYTE2(*(_DWORD *)(v28 + 8)), BYTE1(*(_DWORD *)(v28 + 8)), *(_DWORD *)(v28 + 8), HIBYTE(*(_DWORD *)(v28 + 8)));

        BOMTreeIteratorNext((uint64_t)v5, v30, v31, v32, v33, v34, v35, v36);
      }
      while (!BOMTreeIteratorIsAtEnd((uint64_t)v5, v37, v38, v39, v40, v41, v42, v43));
    }
    BOMTreeIteratorFree(v5);
  }
  return 1;
}

- (void)enumerateRenditionInfosUsingBlock:(id)a3
{
  const _renditionkeyfmt *v5;
  uint64_t **v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unsigned __int16 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  CUINamedRenditionInfo *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;

  os_unfair_lock_lock(-[CUICommonAssetStorage lock](self, "lock"));
  v5 = -[CUICommonAssetStorage keyFormat](self, "keyFormat");
  v6 = (uint64_t **)BOMTreeIteratorNew((uint64_t)self->_bitmapKeydb, 0, 0, 0);
  v7 = objc_alloc_init((Class)NSAutoreleasePool);
  if (!BOMTreeIteratorIsAtEnd((uint64_t)v6, v8, v9, v10, v11, v12, v13, v14))
  {
    do
    {
      v22 = BOMTreeIteratorKey((uint64_t)v6, v15, v16, v17, v18, v19, v20, v21);
      v30 = BOMTreeIteratorValue((uint64_t)v6, v23, v24, v25, v26, v27, v28, v29);
      v38 = BOMTreeIteratorValueSize(v6, v31, v32, v33, v34, v35, v36, v37);
      if (v30 && v38)
      {
        v46 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", v30, v38);
        v47 = -[CUINamedRenditionInfo initWithData:keyFormat:andPlatform:]([CUINamedRenditionInfo alloc], "initWithData:keyFormat:andPlatform:", v46, v5, -[CUICommonAssetStorage deploymentPlatform](self, "deploymentPlatform"));
        if (v47)
          (*((void (**)(id, _QWORD, CUINamedRenditionInfo *))a3 + 2))(a3, v22, v47);

      }
      BOMTreeIteratorNext((uint64_t)v6, v39, v40, v41, v42, v43, v44, v45);
    }
    while (!BOMTreeIteratorIsAtEnd((uint64_t)v6, v48, v49, v50, v51, v52, v53, v54));
  }
  BOMTreeIteratorFree(v6);
  objc_msgSend(v7, "drain");
  os_unfair_lock_unlock(-[CUICommonAssetStorage lock](self, "lock"));
}

- (_renditionkeytoken)_swapRenditionKeyToken:(_renditionkeytoken)a3
{
  return (_renditionkeytoken)__rev16(*(_DWORD *)&a3);
}

- (id)allRenditionNames
{
  id v3;
  void *facetKeysdb;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;

  v3 = +[NSMutableArray array](NSMutableArray, "array");
  os_unfair_lock_lock(-[CUICommonAssetStorage lock](self, "lock"));
  facetKeysdb = self->_facetKeysdb;
  if (facetKeysdb)
  {
    v5 = BOMTreeIteratorNew((uint64_t)facetKeysdb, 0, 0, 0);
    v13 = v5;
    if (v5 && !BOMTreeIteratorIsAtEnd((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12))
    {
      do
      {
        v21 = BOMTreeIteratorKeySize((uint64_t)v13, v14, v15, v16, v17, v18, v19, v20);
        v29 = BOMTreeIteratorKey((uint64_t)v13, v22, v23, v24, v25, v26, v27, v28);
        if (v21)
        {
          v37 = objc_msgSend(objc_alloc((Class)NSString), "initWithBytes:length:encoding:", v29, v21, 4);
          if (v37)
          {
            v38 = v37;
            objc_msgSend(v3, "addObject:", v37);

          }
        }
        BOMTreeIteratorNext((uint64_t)v13, v30, v31, v32, v33, v34, v35, v36);
      }
      while (!BOMTreeIteratorIsAtEnd((uint64_t)v13, v39, v40, v41, v42, v43, v44, v45));
    }
    BOMTreeIteratorFree(v13);
  }
  os_unfair_lock_unlock(-[CUICommonAssetStorage lock](self, "lock"));
  return v3;
}

- (id)renditionNameForKeyList:(_renditionkeytoken *)a3
{
  void *facetKeysdb;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  int v45;
  uint64_t v46;
  uint64_t v47;
  unsigned __int16 *v48;
  int v49;
  id v50;
  id v51;

  os_unfair_lock_lock(-[CUICommonAssetStorage lock](self, "lock"));
  facetKeysdb = self->_facetKeysdb;
  if (facetKeysdb)
  {
    v13 = BOMTreeIteratorNew((uint64_t)facetKeysdb, 0, 0, 0);
    if (v13)
    {
      while (!BOMTreeIteratorIsAtEnd((uint64_t)v13, v6, v7, v8, v9, v10, v11, v12))
      {
        v21 = BOMTreeIteratorKeySize((uint64_t)v13, v14, v15, v16, v17, v18, v19, v20);
        v29 = BOMTreeIteratorKey((uint64_t)v13, v22, v23, v24, v25, v26, v27, v28);
        v37 = BOMTreeIteratorValue((uint64_t)v13, v30, v31, v32, v33, v34, v35, v36);
        v45 = *(unsigned __int16 *)(v37 + 4);
        if (*(_WORD *)(v37 + 4))
        {
          v46 = v37;
          v47 = 0;
          v48 = (unsigned __int16 *)(v37 + 8);
          while (1)
          {
            v49 = *v48;
            if (v49 != CUIRenditionKeyValueForAttribute(&a3->identifier, *(v48 - 1)))
              break;
            v48 += 2;
            if (++v47 >= (unint64_t)*(unsigned __int16 *)(v46 + 4))
            {
              if (v45)
              {
                v50 = objc_msgSend(objc_alloc((Class)NSString), "initWithBytes:length:encoding:", v29, v21, 4);
                if (v50)
                {
                  v51 = v50;
                  goto LABEL_12;
                }
              }
              break;
            }
          }
        }
        BOMTreeIteratorNext((uint64_t)v13, v38, v39, v40, v41, v42, v43, v44);
      }
    }
    v51 = 0;
LABEL_12:
    BOMTreeIteratorFree(v13);
  }
  else
  {
    v51 = 0;
  }
  os_unfair_lock_unlock(-[CUICommonAssetStorage lock](self, "lock"));
  return v51;
}

- (id)renditionNamesWithKeys
{
  id v3;
  void *facetKeysdb;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  id v38;
  unint64_t v39;
  unsigned __int16 *v40;
  unsigned int v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;

  v3 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  os_unfair_lock_lock(-[CUICommonAssetStorage lock](self, "lock"));
  facetKeysdb = self->_facetKeysdb;
  if (facetKeysdb)
  {
    v5 = BOMTreeIteratorNew((uint64_t)facetKeysdb, 0, 0, 0);
    v13 = v5;
    if (v5 && !BOMTreeIteratorIsAtEnd((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12))
    {
      do
      {
        v21 = BOMTreeIteratorValue((uint64_t)v13, v14, v15, v16, v17, v18, v19, v20);
        v29 = BOMTreeIteratorKeySize((uint64_t)v13, v22, v23, v24, v25, v26, v27, v28);
        v37 = objc_msgSend(objc_alloc((Class)NSString), "initWithBytes:length:encoding:", BOMTreeIteratorKey((uint64_t)v13, v30, v31, v32, v33, v34, v35, v36), v29, 4);
        v38 = +[NSMutableString string](NSMutableString, "string");
        if (*(_WORD *)(v21 + 4))
        {
          v39 = 0;
          v40 = (unsigned __int16 *)(v21 + 8);
          do
          {
            objc_msgSend(v38, "appendFormat:", CFSTR("%s:%d"), CUIThemeAttributeNameToString(*(v40 - 1)), *v40);
            v41 = *(unsigned __int16 *)(v21 + 4);
            if (v39 != v41 - 1)
            {
              objc_msgSend(v38, "appendString:", CFSTR(","));
              v41 = *(unsigned __int16 *)(v21 + 4);
            }
            v40 += 2;
            ++v39;
          }
          while (v39 < v41);
        }
        objc_msgSend(v3, "setObject:forKey:", v38, v37);

        BOMTreeIteratorNext((uint64_t)v13, v42, v43, v44, v45, v46, v47, v48);
      }
      while (!BOMTreeIteratorIsAtEnd((uint64_t)v13, v49, v50, v51, v52, v53, v54, v55));
    }
    BOMTreeIteratorFree(v13);
  }
  os_unfair_lock_unlock(-[CUICommonAssetStorage lock](self, "lock"));
  return v3;
}

- (id)renditionNameForKeyBaseList:(const _renditionkeytoken *)a3
{
  void *facetKeysdb;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unsigned __int16 v30;
  uint64_t v31;
  uint64_t v32;
  unsigned __int16 *v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  id v51;

  os_unfair_lock_lock(-[CUICommonAssetStorage lock](self, "lock"));
  facetKeysdb = self->_facetKeysdb;
  if (!facetKeysdb)
  {
    v51 = 0;
    goto LABEL_16;
  }
  v6 = BOMTreeIteratorNew((uint64_t)facetKeysdb, 0, 0, 0);
  v14 = v6;
  if (!v6 || BOMTreeIteratorIsAtEnd((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13))
  {
LABEL_13:
    v51 = 0;
    goto LABEL_14;
  }
  while (2)
  {
    v22 = BOMTreeIteratorValue((uint64_t)v14, v15, v16, v17, v18, v19, v20, v21);
    v30 = *(_WORD *)(v22 + 4);
    if (!v30)
      goto LABEL_12;
    v31 = v22;
    v32 = 0;
    v33 = (unsigned __int16 *)(v22 + 8);
    while (*(v33 - 1) != 17)
    {
LABEL_9:
      v33 += 2;
      if (++v32 >= (unint64_t)v30)
        goto LABEL_12;
    }
    v34 = *v33;
    if (v34 != CUIRenditionKeyValueForAttribute(&a3->identifier, 17))
    {
      v30 = *(_WORD *)(v31 + 4);
      goto LABEL_9;
    }
    v35 = BOMTreeIteratorKeySize((uint64_t)v14, v23, v24, v25, v26, v27, v28, v29);
    v43 = objc_msgSend(objc_alloc((Class)NSString), "initWithBytes:length:encoding:", BOMTreeIteratorKey((uint64_t)v14, v36, v37, v38, v39, v40, v41, v42), v35, 4);
    if (!v43)
    {
LABEL_12:
      BOMTreeIteratorNext((uint64_t)v14, v23, v24, v25, v26, v27, v28, v29);
      if (BOMTreeIteratorIsAtEnd((uint64_t)v14, v44, v45, v46, v47, v48, v49, v50))
        goto LABEL_13;
      continue;
    }
    break;
  }
  v51 = v43;
LABEL_14:
  BOMTreeIteratorFree(v14);
LABEL_16:
  os_unfair_lock_unlock(-[CUICommonAssetStorage lock](self, "lock"));
  return v51;
}

- (BOOL)hasColorForName:(const char *)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  _OWORD v11[8];
  int v12;

  if (!a3 || !self->_colordb)
    return 0;
  v12 = 0;
  memset(v11, 0, sizeof(v11));
  __strlcpy_chk((char *)v11 + 4, a3, 128, 128);
  os_unfair_lock_lock(-[CUICommonAssetStorage lock](self, "lock"));
  v9 = BOMTreeValueExists((uint64_t)self->_colordb, v11, 0x84uLL, v4, v5, v6, v7, v8) != 0;
  os_unfair_lock_unlock(-[CUICommonAssetStorage lock](self, "lock"));
  return v9;
}

- (const)_fontValueForFontType:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  const FontValue *result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int ValueSize;
  uint64_t v16;
  _OWORD v17[8];

  if (!a3 || !self->_fontdb)
    return 0;
  memset(v17, 0, sizeof(v17));
  v8 = objc_msgSend(a3, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v17, 128, 0, 1, 0, 0, objc_msgSend(a3, "length"), 0);
  result = 0;
  if (v8)
  {
    v16 = 0;
    ValueSize = BOMTreeGetValueSize((uint64_t)self->_fontdb, v17, 0x80uLL, &v16, v4, v5, v6, v7);
    result = 0;
    if (!ValueSize && v16 == 132)
      return (const FontValue *)BOMTreeGetValue((uint64_t)self->_fontdb, v17, 0x80uLL, v10, v11, v12, v13, v14);
  }
  return result;
}

- (BOOL)getFontName:(id *)a3 baselineOffset:(float *)a4 forFontType:(id)a5
{
  const FontValue *v9;

  os_unfair_lock_lock(-[CUICommonAssetStorage lock](self, "lock"));
  v9 = -[CUICommonAssetStorage _fontValueForFontType:](self, "_fontValueForFontType:", a5);
  if (v9)
  {
    if (a3)
      *a3 = objc_msgSend(objc_alloc((Class)NSString), "initWithBytes:length:encoding:", v9, strlen(v9->var0), 1);
    if (a4)
      *a4 = v9->var1;
  }
  os_unfair_lock_unlock(-[CUICommonAssetStorage lock](self, "lock"));
  return v9 != 0;
}

- (BOOL)getBaselineOffset:(float *)a3 forFontType:(id)a4
{
  const FontValue *v7;
  BOOL v8;

  os_unfair_lock_lock(-[CUICommonAssetStorage lock](self, "lock"));
  v7 = -[CUICommonAssetStorage _fontValueForFontType:](self, "_fontValueForFontType:", a4);
  if (a3 && v7)
    *a3 = v7->var1;
  v8 = v7 != 0;
  os_unfair_lock_unlock(-[CUICommonAssetStorage lock](self, "lock"));
  return v8;
}

- (float)fontSizeForFontSizeType:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t Value;
  float *v15;
  uint64_t v17;
  _OWORD v18[8];

  os_unfair_lock_lock(-[CUICommonAssetStorage lock](self, "lock"));
  if (a3
    && self->_fontsizedb
    && (memset(v18, 0, sizeof(v18)),
        (objc_msgSend(a3, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v18, 128, 0, 1, 0, 0, objc_msgSend(a3, "length"), 0) & 1) != 0)&& (v17 = 0, !BOMTreeGetValueSize((uint64_t)self->_fontsizedb, v18, 0x80uLL, &v17, v5, v6, v7, v8))&& v17 == 4&& (Value = BOMTreeGetValue((uint64_t)self->_fontsizedb, v18, 0x80uLL, v9, v10, v11, v12, v13)) != 0)
  {
    v15 = (float *)Value;
    os_unfair_lock_unlock(-[CUICommonAssetStorage lock](self, "lock"));
    return *v15;
  }
  else
  {
    os_unfair_lock_unlock(-[CUICommonAssetStorage lock](self, "lock"));
    return 0.0;
  }
}

- (id)externalTags
{
  return self->_externalTags;
}

- (void)enumerateBitmapIndexUsingBlock:(id)a3
{
  const _renditionkeyfmt *v5;
  int64_t v6;
  void *bitmapKeydb;
  uint64_t **v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  CUINamedRenditionInfo *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;

  os_unfair_lock_lock(-[CUICommonAssetStorage lock](self, "lock"));
  v5 = -[CUICommonAssetStorage keyFormat](self, "keyFormat");
  v6 = -[CUICommonAssetStorage deploymentPlatform](self, "deploymentPlatform");
  bitmapKeydb = self->_bitmapKeydb;
  if (bitmapKeydb)
  {
    v8 = (uint64_t **)BOMTreeIteratorNew((uint64_t)bitmapKeydb, 0, 0, 0);
    if (!BOMTreeIteratorIsAtEnd((uint64_t)v8, v9, v10, v11, v12, v13, v14, v15))
    {
      do
      {
        v23 = BOMTreeIteratorKey((uint64_t)v8, v16, v17, v18, v19, v20, v21, v22);
        v31 = BOMTreeIteratorValue((uint64_t)v8, v24, v25, v26, v27, v28, v29, v30);
        v39 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytesNoCopy:length:freeWhenDone:", v31, BOMTreeIteratorValueSize(v8, v32, v33, v34, v35, v36, v37, v38), 0);
        v40 = -[CUINamedRenditionInfo initWithData:keyFormat:andPlatform:]([CUINamedRenditionInfo alloc], "initWithData:keyFormat:andPlatform:", v39, v5, v6);
        os_unfair_lock_unlock(-[CUICommonAssetStorage lock](self, "lock"));
        (*((void (**)(id, uint64_t, CUINamedRenditionInfo *))a3 + 2))(a3, v23, v40);
        os_unfair_lock_lock(-[CUICommonAssetStorage lock](self, "lock"));

        BOMTreeIteratorNext((uint64_t)v8, v41, v42, v43, v44, v45, v46, v47);
      }
      while (!BOMTreeIteratorIsAtEnd((uint64_t)v8, v48, v49, v50, v51, v52, v53, v54));
    }
    BOMTreeIteratorFree(v8);
  }
  os_unfair_lock_unlock(-[CUICommonAssetStorage lock](self, "lock"));
}

- (void)_addBitmapIndexForNameIdentifier:(unsigned __int16)a3 attribute:(int)a4 withValue:(unsigned __int16)a5 toDictionary:(id)a6
{
  uint64_t v7;
  uint64_t v8;
  CUINamedRenditionInfo *v10;
  id v11;

  v7 = a5;
  v8 = *(_QWORD *)&a4;
  v11 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithInt:", a3);
  v10 = (CUINamedRenditionInfo *)objc_msgSend(a6, "objectForKey:");
  if (!v10)
  {
    v10 = -[CUINamedRenditionInfo initWithKeyFormat:andPlatform:]([CUINamedRenditionInfo alloc], "initWithKeyFormat:andPlatform:", -[CUICommonAssetStorage keyFormat](self, "keyFormat"), -[CUICommonAssetStorage deploymentPlatform](self, "deploymentPlatform"));
    objc_msgSend(a6, "setObject:forKey:", v10, v11);

  }
  -[CUINamedRenditionInfo setAttributePresent:withValue:](v10, "setAttributePresent:withValue:", v8, v7);

}

- (void)_buildBitmapInfoIntoDictionary:(id)a3
{
  const _renditionkeyfmt *v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t var2;
  unsigned int *var3;
  _WORD *v31;
  int v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v5 = -[CUICommonAssetStorage keyFormat](self, "keyFormat");
  self->_header->var4 = 0;
  v6 = BOMTreeIteratorNew((uint64_t)self->_imagedb, 0, 0, 0);
  if (!BOMTreeIteratorIsAtEnd((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13))
  {
    do
    {
      v28 = BOMTreeIteratorKey((uint64_t)v6, v14, v15, v16, v17, v18, v19, v20);
      var2 = v5->var2;
      var3 = v5->var3;
      v31 = (_WORD *)v28;
      if ((_DWORD)var2)
      {
        while (1)
        {
          v32 = *var3++;
          if (v32 == 17)
            break;
          ++v31;
          if (!--var2)
            goto LABEL_9;
        }
        v33 = (unsigned __int16)*v31;
        if (*v31)
        {
          v34 = 0;
          do
          {
            -[CUICommonAssetStorage _addBitmapIndexForNameIdentifier:attribute:withValue:toDictionary:](self, "_addBitmapIndexForNameIdentifier:attribute:withValue:toDictionary:", v33, v5->var3[v34], *(unsigned __int16 *)(v28 + 2 * v34), a3);
            ++v34;
          }
          while (v34 < v5->var2);
        }
      }
LABEL_9:
      ++self->_header->var4;
      BOMTreeIteratorNext((uint64_t)v6, v21, v22, v23, v24, v25, v26, v27);
    }
    while (!BOMTreeIteratorIsAtEnd((uint64_t)v6, v35, v36, v37, v38, v39, v40, v41));
  }
  BOMTreeIteratorFree(v6);
}

- (int)validateBitmapInfo
{
  int64_t v3;
  int64_t v4;
  id v5;
  uint64_t **v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  CUINamedRenditionInfo *v40;
  id v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;

  os_unfair_lock_lock(-[CUICommonAssetStorage lock](self, "lock"));
  v3 = -[CUICommonAssetStorage deploymentPlatform](self, "deploymentPlatform");
  if (self->_bitmapKeydb)
  {
    v4 = v3;
    v5 = objc_alloc_init((Class)NSMutableDictionary);
    -[CUICommonAssetStorage _buildBitmapInfoIntoDictionary:](self, "_buildBitmapInfoIntoDictionary:", v5);
    v6 = (uint64_t **)BOMTreeIteratorNew((uint64_t)self->_bitmapKeydb, 0, 0, 0);
    if (BOMTreeIteratorIsAtEnd((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13))
    {
      BOMTreeIteratorFree(v6);
    }
    else
    {
      v22 = 1;
      do
      {
        v23 = BOMTreeIteratorKey((uint64_t)v6, v14, v15, v16, v17, v18, v19, v20);
        v31 = BOMTreeIteratorValue((uint64_t)v6, v24, v25, v26, v27, v28, v29, v30);
        v39 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", v31, BOMTreeIteratorValueSize(v6, v32, v33, v34, v35, v36, v37, v38));
        v40 = -[CUINamedRenditionInfo initWithData:keyFormat:andPlatform:]([CUINamedRenditionInfo alloc], "initWithData:keyFormat:andPlatform:", v39, -[CUICommonAssetStorage keyFormat](self, "keyFormat"), v4);
        v41 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithInt:", v23);
        v42 = objc_msgSend(v5, "objectForKey:", v41);
        if (v42 && -[CUINamedRenditionInfo isEqualToNamedRenditionInfo:](v40, "isEqualToNamedRenditionInfo:", v42))
          objc_msgSend(v5, "removeObjectForKey:", v41);
        else
          v22 = 0;

        BOMTreeIteratorNext((uint64_t)v6, v43, v44, v45, v46, v47, v48, v49);
      }
      while (!BOMTreeIteratorIsAtEnd((uint64_t)v6, v50, v51, v52, v53, v54, v55, v56));
      BOMTreeIteratorFree(v6);
      if (!v22)
      {
        v21 = 0;
        goto LABEL_13;
      }
    }
    v21 = objc_msgSend(v5, "count") == 0;
LABEL_13:

    goto LABEL_14;
  }
  v21 = -1;
LABEL_14:
  os_unfair_lock_unlock(-[CUICommonAssetStorage lock](self, "lock"));
  return v21;
}

- (int)validatekeyformat
{
  id v3;
  id v4;
  int v5;
  int v6;
  int v7;
  int NamedBlock;
  BOOL v9;
  BOOL v10;
  BOOL v11;
  _BOMStorage *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  size_t v19;
  unsigned int *v20;
  _BOMStorage *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unsigned int *v28;
  unsigned int v29;

  if (!BOMStorageGetNamedBlock(-[CUICommonAssetStorage _bomStorage](self, "_bomStorage"), "KEYFORMATWORKAROUND"))return -1;
  v3 = -[CUICommonAssetStorage deploymentPlatformString](self, "deploymentPlatformString");
  v4 = objc_msgSend(-[CUICommonAssetStorage deploymentPlatformVersion](self, "deploymentPlatformVersion"), "componentsSeparatedByString:", CFSTR("."));
  if ((unint64_t)objc_msgSend(v4, "count") < 3)
  {
    if ((unint64_t)objc_msgSend(v4, "count") < 2)
    {
      if (objc_msgSend(v4, "count"))
        v5 = objc_msgSend(objc_msgSend(v4, "objectAtIndex:", 0), "intValue");
      else
        v5 = 0;
      v6 = 0;
    }
    else
    {
      v5 = objc_msgSend(objc_msgSend(v4, "objectAtIndex:", 0), "intValue");
      v6 = objc_msgSend(objc_msgSend(v4, "objectAtIndex:", 1), "intValue");
    }
    v7 = 0;
  }
  else
  {
    v5 = objc_msgSend(objc_msgSend(v4, "objectAtIndex:", 0), "intValue");
    v6 = objc_msgSend(objc_msgSend(v4, "objectAtIndex:", 1), "intValue");
    v7 = objc_msgSend(objc_msgSend(v4, "objectAtIndex:", 2), "intValue");
  }
  if (!objc_msgSend(v3, "isEqualToString:", kCUIPlatformMac[0]))
  {
    if ((objc_msgSend(v3, "isEqualToString:", kCUIPlatformWatch[0]) & 1) == 0)
    {
      v11 = v5 == 9;
      if (v5 >= 9)
      {
        NamedBlock = 0;
        if (!v11 || v6 > 2)
          return NamedBlock;
      }
      goto LABEL_30;
    }
    return 0;
  }
  v9 = v6 < 12 && v5 < 11;
  if (v7 >= 5)
    v9 = 0;
  v10 = v6 < 11 && v5 < 11;
  if (!v9 && !v10)
    return 0;
LABEL_30:
  NamedBlock = BOMStorageGetNamedBlock(-[CUICommonAssetStorage _bomStorage](self, "_bomStorage"), "KEYFORMAT");
  if (NamedBlock)
  {
    v12 = -[CUICommonAssetStorage _bomStorage](self, "_bomStorage");
    v19 = BOMStorageSizeOfBlock((uint64_t)v12, NamedBlock, v13, v14, v15, v16, v17, v18);
    v20 = (unsigned int *)malloc_type_malloc(v19, 0x1DAFE7EuLL);
    v21 = -[CUICommonAssetStorage _bomStorage](self, "_bomStorage");
    BOMStorageCopyFromBlock((uint64_t)v21, NamedBlock, v20, v22, v23, v24, v25, v26);
    v27 = v20[2];
    if ((_DWORD)v27)
    {
      v28 = v20 + 3;
      while (1)
      {
        v29 = *v28++;
        if (v29 >= 0x18)
          break;
        if (!--v27)
          goto LABEL_35;
      }
      NamedBlock = 0;
    }
    else
    {
LABEL_35:
      NamedBlock = 1;
    }
    free(v20);
  }
  return NamedBlock;
}

- (int)validateFile
{
  return !-[CUICommonAssetStorage enumerateKeysAndObjectsUsingBlock:](self, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_8);
}

- (id)nameForLocalizationIdentifier:(unsigned __int16)a3
{
  int v3;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __CFString *v20;
  unsigned __int16 *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  __CFString *v44;

  if (!self->_localizationdb)
    return &stru_1E41B97C0;
  v3 = a3;
  os_unfair_lock_lock(-[CUICommonAssetStorage lock](self, "lock"));
  v5 = BOMTreeIteratorNew((uint64_t)self->_localizationdb, 0, 0, 0);
  v20 = &stru_1E41B97C0;
  if (!BOMTreeIteratorIsAtEnd((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12))
  {
    while (1)
    {
      v21 = (unsigned __int16 *)BOMTreeIteratorValue((uint64_t)v5, v13, v14, v15, v16, v17, v18, v19);
      if (v21)
      {
        if (*v21 == v3)
          break;
      }
      BOMTreeIteratorNext((uint64_t)v5, v22, v23, v24, v25, v26, v27, v28);
      if (BOMTreeIteratorIsAtEnd((uint64_t)v5, v29, v30, v31, v32, v33, v34, v35))
        goto LABEL_9;
    }
    v36 = BOMTreeIteratorKey((uint64_t)v5, v22, v23, v24, v25, v26, v27, v28);
    v20 = (__CFString *)objc_msgSend(objc_alloc((Class)NSString), "initWithBytes:length:encoding:", v36, BOMTreeIteratorKeySize((uint64_t)v5, v37, v38, v39, v40, v41, v42, v43), 4);
    v44 = v20;
  }
LABEL_9:
  BOMTreeIteratorFree(v5);
  os_unfair_lock_unlock(-[CUICommonAssetStorage lock](self, "lock"));
  return v20;
}

- (BOOL)writeToPath:(id)a3 withTreePageSize:(unsigned int)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v6 = BOMTreeStorage((uint64_t)self->_imagedb);
  v7 = BOMStorageNewWithOptionsAndSys((uint64_t)objc_msgSend(a3, "fileSystemRepresentation"), 0, 0);
  if (v7)
  {
    v14 = v7;
    if (__copyBlock(v6, v7, "CARHEADER")
      && __copyBlock(v6, v14, "CARGLOBALS")
      && __copyBlock(v6, v14, "KEYFORMAT")
      && __copyBlock(v6, v14, "KEYFORMATWORKAROUND")
      && __copyBlock(v6, v14, "EXTERNAL_KEYS")
      && __copyBlock(v6, v14, "EXTENDED_METADATA")
      && __copyTree(v6, v14, "RENDITIONS", a4)
      && __copyTree(v6, v14, "COLORS", a4)
      && __copyTree(v6, v14, "FONTS", a4)
      && __copyTree(v6, v14, "FONTSIZES", a4)
      && __copyTree(v6, v14, "BEZELS", a4)
      && __copyTree(v6, v14, "FACETKEYS", a4)
      && __copyTree(v6, v14, "BITMAPKEYS", a4)
      && __copyTree(v6, v14, "APPEARANCEKEYS", a4))
    {
      return __copyTree(v6, v14, "LOCALIZATIONKEYS", a4);
    }
  }
  else
  {
    _CUILog(4, (uint64_t)"CoreUI: Error: CUICommonAssetStorage -writeToPath:withTreePageSize: write file at '%@'", v8, v9, v10, v11, v12, v13, (uint64_t)a3);
  }
  return 0;
}

- (_carheader)header
{
  return self->_header;
}

- (void)setHeader:(_carheader *)a3
{
  self->_header = a3;
}

- (_carextendedMetadata)extendedMetadata
{
  return self->_extendedMetadata;
}

- (void)setExtendedMetadata:(_carextendedMetadata *)a3
{
  self->_extendedMetadata = a3;
}

- (_renditionkeyfmt)keyfmt
{
  return self->_keyfmt;
}

- (void)setKeyfmt:(_renditionkeyfmt *)a3
{
  self->_keyfmt = a3;
}

- (void)setImagedb:(void *)a3
{
  self->_imagedb = a3;
}

- (void)colordb
{
  return self->_colordb;
}

- (void)setColordb:(void *)a3
{
  self->_colordb = a3;
}

- (void)fontdb
{
  return self->_fontdb;
}

- (void)setFontdb:(void *)a3
{
  self->_fontdb = a3;
}

- (void)fontsizedb
{
  return self->_fontsizedb;
}

- (void)setFontsizedb:(void *)a3
{
  self->_fontsizedb = a3;
}

- (void)facetKeysdb
{
  return self->_facetKeysdb;
}

- (void)setFacetKeysdb:(void *)a3
{
  self->_facetKeysdb = a3;
}

- (void)bitmapKeydb
{
  return self->_bitmapKeydb;
}

- (void)setBitmapKeydb:(void *)a3
{
  self->_bitmapKeydb = a3;
}

- (void)appearancedb
{
  return self->_appearancedb;
}

- (void)setAppearancedb:(void *)a3
{
  self->_appearancedb = a3;
}

- (void)setLocalizationdb:(void *)a3
{
  self->_localizationdb = a3;
}

- (NSData)globals
{
  return self->_globals;
}

- (void)setGlobals:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

@end
