@implementation AVMetadataItem

+ (BOOL)_clientExpectsISOUserDataKeysInQuickTimeUserDataKeySpace
{
  return dyld_program_sdk_at_least() ^ 1;
}

uint64_t __58__AVMetadataItem_metadataItemsFromArray_withKey_keySpace___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t result;
  void *v10;
  void *v11;
  const void *v12;
  CFTypeID v13;
  CFTypeID v14;
  CFTypeID v15;
  int v16;
  CFTypeID v17;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v4 = (void *)objc_msgSend(a2, "keySpace");
  if (!objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("comn")))
  {
    v10 = *(void **)(a1 + 32);
    if (v10)
    {
      result = objc_msgSend(v10, "isEqualToString:", v4);
      if (!(_DWORD)result)
        return result;
    }
    v11 = (void *)objc_msgSend(a2, "key");
    v12 = *(const void **)(a1 + 40);
    if (!v12)
      return 1;
    if (v11)
    {
      v13 = CFGetTypeID(v12);
      v14 = CFGetTypeID(v11);
      v15 = CFGetTypeID(*(CFTypeRef *)(a1 + 40));
      if (v13 == v14)
      {
        if (v15 != CFNumberGetTypeID()
          || (objc_msgSend(v4, "isEqualToString:", CFSTR("udta")) & 1) == 0
          && !objc_msgSend(v4, "isEqualToString:", CFSTR("itsk")))
        {
          v8 = *(void **)(a1 + 40);
          v7 = v11;
          return objc_msgSend(v8, "isEqual:", v7);
        }
        v16 = objc_msgSend(*(id *)(a1 + 40), "intValue");
        return v16 == objc_msgSend(v11, "intValue");
      }
      if (v15 == CFStringGetTypeID())
      {
        v17 = CFGetTypeID(v11);
        if (v17 == CFNumberGetTypeID())
        {
          result = FigMetadataStringKeyToOSTypeKeyWithKeySpace();
          if (!(_DWORD)result)
            return result;
          v16 = 0;
          return v16 == objc_msgSend(v11, "intValue");
        }
      }
    }
    return 0;
  }
  v5 = *(void **)(a1 + 40);
  v6 = objc_msgSend(a2, "commonKey");
  v7 = (void *)v6;
  if (v5)
  {
    v8 = v5;
    return objc_msgSend(v8, "isEqual:", v7);
  }
  return v6 != 0;
}

- (AVMetadataKeySpace)keySpace
{
  -[AVMetadataItem _makePropertiesReady](self, "_makePropertiesReady");
  return self->_priv->keySpace;
}

- (AVMetadataKey)commonKey
{
  -[AVMetadataItem _makePropertiesReady](self, "_makePropertiesReady");
  return self->_priv->commonKey;
}

- (AVMetadataItem)init
{
  AVMetadataItem *v2;
  AVMetadataItemInternal *v3;
  uint64_t v4;
  __int128 v5;
  int64_t v6;
  AVMetadataItemInternal *priv;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AVMetadataItem;
  v2 = -[AVMetadataItem init](&v9, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(AVMetadataItemInternal);
    v2->_priv = v3;
    if (v3)
    {
      v4 = MEMORY[0x1E0CA2E18];
      v5 = *MEMORY[0x1E0CA2E18];
      *(_OWORD *)&v3->time.value = *MEMORY[0x1E0CA2E18];
      v6 = *(_QWORD *)(v4 + 16);
      v3->time.epoch = v6;
      priv = v2->_priv;
      *(_OWORD *)&priv->duration.value = v5;
      priv->duration.epoch = v6;
      v2->_priv->preferredStorageLocation = (NSString *)objc_msgSend(CFSTR("default"), "copy");
      CFRetain(v2->_priv);
    }
    else
    {

      return 0;
    }
  }
  return v2;
}

- (id)_figMetadataDictionary
{
  return -[AVMetadataItem _figMetadataDictionaryWithValue:diviningValueDataType:](self, "_figMetadataDictionaryWithValue:diviningValueDataType:", 1, 0);
}

- (id)_figMetadataDictionaryWithValue:(BOOL)a3 diviningValueDataType:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v7;
  NSString *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  const void *v14;
  NSString *v15;
  NSLocale *v16;
  NSDate *v17;
  id v18;
  NSString *v19;
  _QWORD *v20;
  CMTimeValue value;
  void *v22;
  CGImageSource *v23;
  CGImageSource *v24;
  id v25;
  CMTime v27;
  CMTime v28[2];

  v4 = a4;
  v5 = a3;
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", -[AVMetadataItem extraAttributes](self, "extraAttributes"));
  v8 = -[AVMetadataItem keySpace](self, "keySpace");
  if (v8)
    objc_msgSend(v7, "setValue:forKey:", v8, *MEMORY[0x1E0CC47B0]);
  v9 = -[AVMetadataItem key](self, "key");
  if (v9)
    objc_msgSend(v7, "setValue:forKey:", v9, *MEMORY[0x1E0CC47A8]);
  if (v5)
  {
    v10 = -[AVMetadataItem value](self, "value");
    if (v10)
    {
      v11 = v10;
      v12 = -[AVMetadataItem _copyValueAsCFTypeWithFormatDescription:error:](self, "_copyValueAsCFTypeWithFormatDescription:error:", 0, 0);
      v13 = *MEMORY[0x1E0CC47E8];
      if (v12)
      {
        v14 = v12;
        objc_msgSend(v7, "setValue:forKey:", v12, v13);
        CFRelease(v14);
      }
      else
      {
        objc_msgSend(v7, "setValue:forKey:", v11, v13);
      }
    }
  }
  v15 = -[AVMetadataItem extendedLanguageTag](self, "extendedLanguageTag");
  if (v15)
    objc_msgSend(v7, "setValue:forKey:", v15, *MEMORY[0x1E0CC4798]);
  v16 = -[AVMetadataItem locale](self, "locale");
  if (v16)
    objc_msgSend(v7, "setValue:forKey:", v16, *MEMORY[0x1E0CC47C0]);
  memset(&v28[1], 0, sizeof(CMTime));
  if (self)
  {
    -[AVMetadataItem time](self, "time");
    if ((v28[1].flags & 1) != 0)
    {
      v28[0] = v28[1];
      objc_msgSend(v7, "setValue:forKey:", AVDictionaryWithTime(v28), *MEMORY[0x1E0CC47D8]);
    }
    memset(v28, 0, 24);
    -[AVMetadataItem duration](self, "duration");
    if ((v28[0].flags & 1) != 0)
    {
      v27 = v28[0];
      objc_msgSend(v7, "setValue:forKey:", AVDictionaryWithTime(&v27), *MEMORY[0x1E0CC4790]);
    }
  }
  else
  {
    memset(v28, 0, 24);
  }
  v17 = -[AVMetadataItem startDate](self, "startDate");
  if (v17)
    objc_msgSend(v7, "setValue:forKey:", v17, *MEMORY[0x1E0CC47D0]);
  v18 = -[AVMetadataItem discoveryTimestamp](self, "discoveryTimestamp");
  if (v18)
    objc_msgSend(v7, "setValue:forKey:", v18, *MEMORY[0x1E0CC4788]);
  if (v4)
  {
    -[AVMetadataItem value](self, "value");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = -[AVMetadataItem dataType](self, "dataType");
      v20 = (_QWORD *)MEMORY[0x1E0CC4750];
      if (v19)
      {
        v27.value = 0;
        value = 0;
        if (FigMetadataGetDataTypeWithNamespaceForCoreMediaDataType() && v27.value)
        {
          v22 = (void *)objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:");
          if (objc_msgSend(v22, "conformsToType:", *MEMORY[0x1E0CEC520]))
            value = v27.value;
          else
            value = 0;
        }
        if (!value)
          goto LABEL_37;
      }
      else
      {
        v23 = CGImageSourceCreateWithData((CFDataRef)-[AVMetadataItem value](self, "value"), 0);
        if (!v23)
          goto LABEL_37;
        v24 = v23;
        value = (CMTimeValue)CGImageSourceGetType(v23);
        CFRelease(v24);
        if (!value)
          goto LABEL_37;
      }
      objc_msgSend(v7, "setValue:forKey:", value, *MEMORY[0x1E0CC4778]);
      objc_msgSend(v7, "setValue:forKey:", *v20, *MEMORY[0x1E0CC4780]);
    }
  }
LABEL_37:
  v25 = -[AVMetadataItem preferredStorageLocation](self, "preferredStorageLocation");
  if (v25)
    objc_msgSend(v7, "setValue:forKey:", v25, *MEMORY[0x1E0CC47C8]);
  objc_msgSend(v7, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AVMetadataItem _preferredStorageLocationWasSet](self, "_preferredStorageLocationWasSet")), CFSTR("storageLocationWasSetKey"));
  return v7;
}

- (id)discoveryTimestamp
{
  -[AVMetadataItem _makePropertiesReady](self, "_makePropertiesReady");
  return self->_priv->discoveryTimestamp;
}

- (void)_copyValueAsCFTypeWithFormatDescription:(opaqueCMFormatDescription *)a3 error:(id *)a4
{
  id v7;
  void *result;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  CFDictionaryRef DictionaryRepresentation;
  CGPoint v16;
  CGPoint v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  unint64_t v22;
  _BYTE v23[128];
  uint64_t v24;
  CGPoint v25;
  CGSize v26;
  CGRect v27;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = -[AVMetadataItem value](self, "value");
  v22 = 0;
  result = (void *)softLinkAVMetadataObjectCreateBoxedMetadataFromObjectAndFormatDescription((uint64_t)v7, (uint64_t)a3, (uint64_t)&v22);
  if ((unint64_t)result | v22)
    goto LABEL_24;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (CMMetadataDataTypeRegistryDataTypeConformsToDataType((CFStringRef)self->_priv->dataType, (CFStringRef)*MEMORY[0x1E0CA2430])|| CMMetadataDataTypeRegistryDataTypeConformsToDataType((CFStringRef)self->_priv->dataType, (CFStringRef)*MEMORY[0x1E0CA2438])))
  {
    v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      v16 = (CGPoint)*MEMORY[0x1E0C9D538];
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v7);
          v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v13);
          v17 = v16;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && AVCGPointFromNSValue(v14, &v17))
          {
            DictionaryRepresentation = CGPointCreateDictionaryRepresentation(v17);
            objc_msgSend(v9, "addObject:", DictionaryRepresentation);
            CFRelease(DictionaryRepresentation);
          }
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v11);
    }
    result = (void *)objc_msgSend(v9, "count", v16);
    if (result)
    {
      result = v9;
LABEL_17:
      result = (void *)CFRetain(result);
    }
  }
  else if (CMMetadataDataTypeRegistryDataTypeConformsToDataType((CFStringRef)self->_priv->dataType, (CFStringRef)*MEMORY[0x1E0CA2428]))
  {
    objc_msgSend(v7, "pointValue");
    result = CGPointCreateDictionaryRepresentation(v25);
  }
  else if (CMMetadataDataTypeRegistryDataTypeConformsToDataType((CFStringRef)self->_priv->dataType, (CFStringRef)*MEMORY[0x1E0CA23E8]))
  {
    objc_msgSend(v7, "sizeValue");
    result = CGSizeCreateDictionaryRepresentation(v26);
  }
  else if (CMMetadataDataTypeRegistryDataTypeConformsToDataType((CFStringRef)self->_priv->dataType, (CFStringRef)*MEMORY[0x1E0CA2448]))
  {
    objc_msgSend(v7, "rectValue");
    result = CGRectCreateDictionaryRepresentation(v27);
  }
  else if (CMMetadataDataTypeRegistryDataTypeConformsToDataType((CFStringRef)self->_priv->dataType, (CFStringRef)*MEMORY[0x1E0CA2410]))
  {
    result = -[AVMetadataItem _createJSONEncodedDataFromValue:error:](self, "_createJSONEncodedDataFromValue:error:", v7, &v22);
    if (result)
      goto LABEL_17;
  }
  else
  {
    if (v7)
    {
      result = v7;
      goto LABEL_17;
    }
    result = 0;
  }
LABEL_24:
  if (a4)
    *a4 = (id)v22;
  return result;
}

- (id)_initWithFigMetadataDictionary:(id)a3
{
  AVMetadataItem *v4;
  AVMetadataItem *v5;

  v4 = -[AVMetadataItem init](self, "init");
  v5 = v4;
  if (v4)
    -[AVMetadataItem _extractPropertiesFromDictionary:](v4, "_extractPropertiesFromDictionary:", a3);
  return v5;
}

- (void)_updateIdentifier
{
  NSString *v3;
  NSString *identifier;
  NSString *v5;

  v3 = +[AVMetadataItem identifierForKey:keySpace:](AVMetadataItem, "identifierForKey:keySpace:", self->_priv->key, self->_priv->keySpace);
  identifier = self->_priv->identifier;
  if (identifier != v3)
  {
    v5 = v3;

    self->_priv->identifier = (NSString *)-[NSString copy](v5, "copy");
  }
}

- (void)_extractPropertiesFromDictionary:(id)a3
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const void *v14;
  uint64_t v15;
  CFTypeID v16;
  NSString *v17;
  void *v18;
  void *v19;
  NSString *v20;
  void *v21;
  void *v22;
  CFTypeID v23;
  const __CFDictionary *v24;
  CFTypeID v25;
  const __CFDictionary *v26;
  void *v27;
  void *v28;
  void *v29;
  __CFString *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t ISO639_1FromISO639_2T;
  void *CoreMediaDataType;
  AVMetadataItemInternal *priv;
  AVMetadataItemInternal *v36;
  __CFString *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  NSString *v43;
  void *v44;
  CFTypeRef cf;
  CFTypeRef cfa;
  CFTypeRef v47;
  const __CFDictionary *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  NSString *v61;
  void *v62;
  const __CFDictionary *v63;
  void *v64;
  void *v65;
  CMTime v66;

  if (!a3 || self->_priv->extras)
    return;
  v40 = *MEMORY[0x1E0CC47B0];
  v5 = objc_msgSend(a3, "objectForKey:");
  v58 = *MEMORY[0x1E0CC47A8];
  v6 = (void *)objc_msgSend(a3, "objectForKey:");
  v41 = *MEMORY[0x1E0CC47C0];
  v7 = objc_msgSend(a3, "objectForKey:");
  v57 = *MEMORY[0x1E0CC4798];
  v8 = (void *)objc_msgSend(a3, "objectForKey:");
  v56 = *MEMORY[0x1E0CC47B8];
  v9 = (__CFString *)objc_msgSend(a3, "objectForKey:");
  v59 = *MEMORY[0x1E0CC47E8];
  v10 = (void *)objc_msgSend(a3, "objectForKey:");
  v55 = *MEMORY[0x1E0CC47D8];
  cf = (CFTypeRef)objc_msgSend(a3, "objectForKey:");
  v54 = *MEMORY[0x1E0CC4790];
  v47 = (CFTypeRef)objc_msgSend(a3, "objectForKey:");
  v53 = *MEMORY[0x1E0CC47D0];
  v60 = objc_msgSend(a3, "objectForKey:");
  v50 = objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CC4778]);
  v11 = objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CC4780]);
  v42 = objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CC4768]);
  v12 = objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CC4770]);
  v52 = *MEMORY[0x1E0CC4788];
  v49 = objc_msgSend(a3, "objectForKey:");
  v43 = +[AVMetadataItem identifierForKey:keySpace:](AVMetadataItem, "identifierForKey:keySpace:", v6, v5);
  v51 = *MEMORY[0x1E0CC47C8];
  v39 = objc_msgSend(a3, "objectForKey:");
  v65 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("storageLocationWasSetKey"));
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = (void *)v5;
    else
      v13 = 0;
    v64 = v13;
  }
  else
  {
    v64 = 0;
  }
  v14 = v10;
  if (v6
    && (!objc_msgSend(v6, "conformsToProtocol:", &unk_1EE2B1580)
     || (objc_msgSend(v6, "conformsToProtocol:", &unk_1EE2B3C90) & 1) == 0))
  {
    v6 = 0;
  }
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v7;
    else
      v15 = 0;
    v62 = (void *)v15;
    if (!v8)
      goto LABEL_20;
  }
  else
  {
    v62 = 0;
    if (!v8)
      goto LABEL_20;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    v8 = 0;
LABEL_20:
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v9 = (__CFString *)AVLanguageCodeFromPackedLanguageCode(v9);
      else
        v9 = 0;
    }
  }
  if (v10)
  {
    v16 = CFGetTypeID(v10);
    if (v16 == FigBoxedMetadataGetTypeID())
    {
      v14 = v10;
    }
    else
    {
      v14 = v10;
      if (!objc_msgSend(v10, "conformsToProtocol:", &unk_1EE2B1580)
        || (objc_msgSend(v10, "conformsToProtocol:", &unk_1EE2B3C90) & 1) == 0)
      {
        v14 = 0;
      }
    }
  }
  if (v11)
  {
    objc_opt_class();
    objc_opt_isKindOfClass();
  }
  v17 = v43;
  if (v42)
  {
    objc_opt_class();
    objc_opt_isKindOfClass();
  }
  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v18 = (void *)v12;
    else
      v18 = 0;
    v44 = v18;
  }
  else
  {
    v44 = 0;
  }
  v19 = (void *)v60;
  if (v17)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v20 = v17;
    else
      v20 = 0;
    v61 = v20;
  }
  else
  {
    v61 = 0;
  }
  v21 = v6;
  if (cf)
  {
    v22 = v62;
    v23 = CFGetTypeID(cf);
    if (v23 == CFDictionaryGetTypeID())
      v24 = (const __CFDictionary *)cf;
    else
      v24 = 0;
  }
  else
  {
    v22 = v62;
    v24 = 0;
  }
  v63 = v24;
  if (v47)
  {
    v25 = CFGetTypeID(v47);
    if (v25 == CFDictionaryGetTypeID())
      v26 = (const __CFDictionary *)v47;
    else
      v26 = 0;
  }
  else
  {
    v26 = 0;
  }
  v27 = v22;
  cfa = v14;
  v48 = v26;
  if (v19)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v28 = v19;
    else
      v28 = 0;
  }
  else
  {
    v28 = 0;
  }
  v29 = (void *)v49;
  if (v49)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      v29 = 0;
  }
  v30 = 0;
  if (objc_msgSend(v65, "BOOLValue"))
  {
    if (v39)
    {
      v30 = (__CFString *)v39;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        v30 = 0;
    }
  }
  self->_priv->keySpace = (NSString *)objc_msgSend(v64, "copy");
  self->_priv->key = objc_msgSend(v21, "copyWithZone:", -[AVMetadataItem zone](self, "zone"));
  self->_priv->identifier = (NSString *)-[NSString copy](v61, "copy");
  if (v9)
  {
    v32 = v40;
    v31 = v41;
    if (!v8)
    {
      ISO639_1FromISO639_2T = FigMetadataGetISO639_1FromISO639_2T();
      if (ISO639_1FromISO639_2T)
        v8 = (void *)ISO639_1FromISO639_2T;
      else
        v8 = v9;
    }
    if (!v27)
      goto LABEL_81;
    goto LABEL_79;
  }
  v32 = v40;
  v31 = v41;
  if (v27)
  {
LABEL_79:
    if (!v8)
      v8 = (void *)AVExtendedLanguageTagFromLocale(v27);
  }
LABEL_81:
  if (v8 && !v9)
    v9 = (__CFString *)AVLanguageCodeFromExtendedLanguageTag(v8);
  if (v8 && !v27)
    v27 = (void *)objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v8);
  self->_priv->extendedLanguageTag = (NSString *)objc_msgSend(v8, "copy");
  self->_priv->locale = (NSLocale *)objc_msgSend(v27, "copy");
  self->_priv->languageCode = (NSString *)-[__CFString copy](v9, "copy");
  if (v50)
  {
    objc_msgSend(v44, "longValue");
    CoreMediaDataType = (void *)FigMetadataGetCoreMediaDataType();
  }
  else
  {
    CoreMediaDataType = 0;
  }
  self->_priv->dataType = (NSString *)objc_msgSend(CoreMediaDataType, "copy");
  if (!self->_priv->value)
    self->_priv->value = -[AVMetadataItem _valueFromCFType:](self, "_valueFromCFType:", cfa);
  -[AVMetadataItem _updateCommonKey](self, "_updateCommonKey");
  if (v63)
  {
    priv = self->_priv;
    CMTimeMakeFromDictionary(&v66, v63);
    priv->time = ($95D729B680665BEAEFA1D6FCA8238556)v66;
  }
  if (v48)
  {
    v36 = self->_priv;
    CMTimeMakeFromDictionary(&v66, v48);
    v36->duration = ($95D729B680665BEAEFA1D6FCA8238556)v66;
  }
  if (v28)
    self->_priv->startDate = (NSDate *)objc_msgSend(v28, "copy");
  if (v29)
    self->_priv->discoveryTimestamp = (NSDate *)objc_msgSend(v29, "copy");
  if (v30)
    v37 = v30;
  else
    v37 = CFSTR("default");
  self->_priv->preferredStorageLocation = (NSString *)-[__CFString copy](v37, "copy");
  self->_priv->preferredStorageLocationWasSet = objc_msgSend(v65, "BOOLValue");
  v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", a3);
  objc_msgSend(v38, "removeObjectForKey:", v32);
  objc_msgSend(v38, "removeObjectForKey:", v58);
  objc_msgSend(v38, "removeObjectForKey:", v57);
  objc_msgSend(v38, "removeObjectForKey:", v56);
  objc_msgSend(v38, "removeObjectForKey:", v31);
  objc_msgSend(v38, "removeObjectForKey:", v55);
  objc_msgSend(v38, "removeObjectForKey:", v54);
  objc_msgSend(v38, "removeObjectForKey:", v53);
  objc_msgSend(v38, "removeObjectForKey:", v59);
  objc_msgSend(v38, "removeObjectForKey:", v52);
  objc_msgSend(v38, "removeObjectForKey:", v51);
  objc_msgSend(v38, "removeObjectForKey:", CFSTR("storageLocationWasSetKey"));
  self->_priv->extras = (NSDictionary *)objc_msgSend(v38, "copy");

}

+ (AVMetadataIdentifier)identifierForKey:(id)key keySpace:(AVMetadataKeySpace)keySpace
{
  AVMetadataIdentifier result;
  CFStringRef identifierOut;

  result = 0;
  if (key && keySpace)
  {
    identifierOut = 0;
    if (CMMetadataCreateIdentifierForKeyAndKeySpace((CFAllocatorRef)*MEMORY[0x1E0C9AE00], key, (CFStringRef)keySpace, &identifierOut))
    {
      return 0;
    }
    else
    {
      return (AVMetadataIdentifier)(id)identifierOut;
    }
  }
  return result;
}

- (void)_updateCommonKey
{
  AVMetadataItemInternal *priv;
  uint64_t keySpace;

  priv = self->_priv;
  keySpace = (uint64_t)priv->keySpace;
  if (keySpace)
  {
    if (priv->key)
    {
      self->_priv->commonKey = (NSString *)FigMetadataGetCommonKey();
      if (self->_priv->commonKey)
        return;
      if (AVMetadataGetCommonKeyForIdentifier_commonKeysForMetadataIdentifiersOnce != -1)
        dispatch_once(&AVMetadataGetCommonKeyForIdentifier_commonKeysForMetadataIdentifiersOnce, &__block_literal_global_369);
      keySpace = objc_msgSend((id)AVMetadataGetCommonKeyForIdentifier_commonKeysForMetadataIdentifiers, "objectForKeyedSubscript:");
      priv = self->_priv;
    }
    else
    {
      keySpace = 0;
    }
  }
  priv->commonKey = (NSString *)keySpace;
}

- (id)_valueFromCFType:(void *)a3
{
  CFTypeID v5;
  NSString *dataType;
  void *v7;
  OpaqueCMBlockBuffer *BlockBuffer;
  size_t DataLength;
  void *v10;
  CFTypeID v11;
  uint64_t v12;
  CFTypeID v13;
  CFTypeID v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  const __CFDictionary *v19;
  CGSize v20;
  CGPoint v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  CGRect point;
  __int128 v28;
  uint64_t v29;
  CGPoint v30;
  CGFloat v31;
  __int128 v32;
  uint64_t v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v7 = 0;
    goto LABEL_30;
  }
  v5 = CFGetTypeID(a3);
  if (v5 == FigBoxedMetadataGetTypeID())
  {
    dataType = self->_priv->dataType;
    -[AVMetadataItem time](self, "time");
    -[AVMetadataItem duration](self, "duration");
    point.origin = v30;
    point.size.width = v31;
    v32 = v28;
    v33 = v29;
    v7 = (void *)((uint64_t (*)(uint64_t, uint64_t, __int128 *, __int128 *))softLinkAVMetadataMakeMetadataObjectFromBoxedMetadata[0])((uint64_t)a3, (uint64_t)dataType, (__int128 *)&point, &v32);
    if (!v7)
    {
      BlockBuffer = (OpaqueCMBlockBuffer *)FigBoxedMetadataGetBlockBuffer();
      DataLength = CMBlockBufferGetDataLength(BlockBuffer);
      v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", DataLength);
      v10 = (void *)objc_msgSend(v7, "mutableBytes");
      if (v10)
        CMBlockBufferCopyDataBytes(BlockBuffer, 0, DataLength, v10);
      else
        FigSignalErrorAt();
    }
    goto LABEL_30;
  }
  v11 = CFGetTypeID(a3);
  if (v11 == CFDataGetTypeID()
    && CMMetadataDataTypeRegistryDataTypeConformsToDataType((CFStringRef)self->_priv->dataType, (CFStringRef)*MEMORY[0x1E0CA2410]))
  {
    v12 = objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, 0, 0);
LABEL_28:
    v7 = (void *)v12;
    goto LABEL_30;
  }
  v13 = CFGetTypeID(a3);
  if (v13 == CFDictionaryGetTypeID())
  {
    if (CMMetadataDataTypeRegistryDataTypeConformsToDataType((CFStringRef)self->_priv->dataType, (CFStringRef)*MEMORY[0x1E0CA2428]))
    {
      point.origin = (CGPoint)*MEMORY[0x1E0C9D538];
      CGPointMakeWithDictionaryRepresentation((CFDictionaryRef)a3, &point.origin);
      v12 = AVNSValueWithCGPoint(point.origin.x, point.origin.y);
      goto LABEL_28;
    }
    if (CMMetadataDataTypeRegistryDataTypeConformsToDataType((CFStringRef)self->_priv->dataType, (CFStringRef)*MEMORY[0x1E0CA2448]))
    {
      v20 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
      point.origin = (CGPoint)*MEMORY[0x1E0C9D648];
      point.size = v20;
      CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)a3, &point);
      v12 = AVNSValueWithCGRect(point.origin.x, point.origin.y, point.size.width, point.size.height);
      goto LABEL_28;
    }
    if (CMMetadataDataTypeRegistryDataTypeConformsToDataType((CFStringRef)self->_priv->dataType, (CFStringRef)*MEMORY[0x1E0CA23E8]))
    {
      point.origin = (CGPoint)*MEMORY[0x1E0C9D820];
      CGSizeMakeWithDictionaryRepresentation((CFDictionaryRef)a3, (CGSize *)&point);
      v12 = AVNSValueWithCGSize(point.origin.x, point.origin.y);
      goto LABEL_28;
    }
LABEL_29:
    v7 = a3;
    goto LABEL_30;
  }
  v14 = CFGetTypeID(a3);
  if (v14 != CFArrayGetTypeID()
    || !CMMetadataDataTypeRegistryDataTypeConformsToDataType((CFStringRef)self->_priv->dataType, (CFStringRef)*MEMORY[0x1E0CA2430])&& !CMMetadataDataTypeRegistryDataTypeConformsToDataType((CFStringRef)self->_priv->dataType, (CFStringRef)*MEMORY[0x1E0CA2438]))
  {
    goto LABEL_29;
  }
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v15 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v23, v34, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v24;
    v22 = (CGPoint)*MEMORY[0x1E0C9D538];
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v24 != v17)
          objc_enumerationMutation(a3);
        v19 = *(const __CFDictionary **)(*((_QWORD *)&v23 + 1) + 8 * i);
        point.origin = v22;
        CGPointMakeWithDictionaryRepresentation(v19, &point.origin);
        objc_msgSend(v7, "addObject:", AVNSValueWithCGPoint(point.origin.x, point.origin.y));
      }
      v16 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v23, v34, 16);
    }
    while (v16);
  }
LABEL_30:
  if (objc_msgSend(v7, "conformsToProtocol:", &unk_1EE2B1580, v22)
    && objc_msgSend(v7, "conformsToProtocol:", &unk_1EE2B3C90))
  {
    return (id)objc_msgSend(v7, "copyWithZone:", -[AVMetadataItem zone](self, "zone"));
  }
  else
  {
    return 0;
  }
}

+ (void)initialize
{
  objc_opt_class();
}

- (NSDictionary)extraAttributes
{
  -[AVMetadataItem _makePropertiesReady](self, "_makePropertiesReady");
  return self->_priv->extras;
}

- (NSData)dataValue
{
  NSData *v2;

  v2 = -[AVMetadataItem value](self, "value");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || !v2)
    return v2;
  if ((dyld_program_sdk_at_least() & 1) != 0)
    return 0;
  return (NSData *)objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v2, 200, 0, 0);
}

- (NSString)stringValue
{
  NSString *v2;

  v2 = -[AVMetadataItem value](self, "value");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (NSString *)-[NSString stringValue](v2, "stringValue");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (NSString *)-[NSString absoluteString](v2, "absoluteString");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (dyld_program_sdk_at_least() & 1) != 0)
    return 0;
  return -[NSString description](v2, "description");
}

- (id)key
{
  -[AVMetadataItem _makePropertiesReady](self, "_makePropertiesReady");
  return self->_priv->key;
}

uint64_t __62__AVMetadataItem_metadataItemsFromArray_filteredByIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v4;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v4 = *(void **)(a1 + 32);
  if (v4)
    return objc_msgSend(v4, "isEqualToString:", objc_msgSend(a2, "identifier"));
  else
    return 1;
}

- (AVMetadataIdentifier)identifier
{
  -[AVMetadataItem _makePropertiesReady](self, "_makePropertiesReady");
  return self->_priv->identifier;
}

- (void)_makePropertiesReady
{
  AVMetadataItemInternal *priv;
  OpaqueFigMetadataReader *reader;
  int64_t itemIndex;
  unsigned int (*v6)(OpaqueFigMetadataReader *, _QWORD, _QWORD, int64_t, _QWORD, _QWORD, CFTypeRef *);
  BOOL v7;
  CFTypeRef cf;

  cf = 0;
  priv = self->_priv;
  reader = priv->reader;
  if (reader)
  {
    if (!priv->extras)
    {
      itemIndex = priv->itemIndex;
      v6 = *(unsigned int (**)(OpaqueFigMetadataReader *, _QWORD, _QWORD, int64_t, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 48);
      if (v6)
      {
        if (v6(reader, 0, 0, itemIndex, *MEMORY[0x1E0C9AE00], 0, &cf))
          v7 = 1;
        else
          v7 = cf == 0;
        if (!v7)
        {
          -[AVMetadataItem _extractPropertiesFromDictionary:](self, "_extractPropertiesFromDictionary:");
          if (cf)
            CFRelease(cf);
        }
      }
    }
  }
}

- (id)value
{
  -[AVMetadataItem _makeValueReady](self, "_makeValueReady");
  return self->_priv->value;
}

- (void)_makeValueReady
{
  AVMetadataItemInternal *priv;
  OpaqueFigMetadataReader *reader;
  int64_t itemIndex;
  uint64_t (*v6)(OpaqueFigMetadataReader *, _QWORD, _QWORD, int64_t, _QWORD, CFTypeRef *, CFTypeRef *);
  int v7;
  CFTypeRef v8;
  CFTypeRef cf;
  CFTypeRef v10;

  cf = 0;
  v10 = 0;
  priv = self->_priv;
  reader = priv->reader;
  if (reader && !priv->value)
  {
    itemIndex = priv->itemIndex;
    v6 = *(uint64_t (**)(OpaqueFigMetadataReader *, _QWORD, _QWORD, int64_t, _QWORD, CFTypeRef *, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 48);
    if (v6)
    {
      v7 = v6(reader, 0, 0, itemIndex, *MEMORY[0x1E0C9AE00], &v10, &cf);
      v8 = cf;
      if (!v7)
      {
        -[AVMetadataItem _extractPropertiesFromDictionary:](self, "_extractPropertiesFromDictionary:", cf);
        self->_priv->value = -[AVMetadataItem _valueFromCFType:](self, "_valueFromCFType:", v10);
        v8 = cf;
      }
      if (v8)
        CFRelease(v8);
    }
    if (v10)
      CFRelease(v10);
  }
}

- (void)dealloc
{
  AVMetadataItemInternal *priv;
  OpaqueFigMetadataReader *reader;
  objc_super v5;

  priv = self->_priv;
  if (priv)
  {
    reader = priv->reader;
    if (reader)
    {
      CFRelease(reader);
      priv = self->_priv;
    }

    CFRelease(self->_priv);
  }
  v5.receiver = self;
  v5.super_class = (Class)AVMetadataItem;
  -[AVMetadataItem dealloc](&v5, sel_dealloc);
}

uint64_t __88__AVMetadataItem_metadataItemsFromArray_filteredAndSortedAccordingToPreferredLanguages___block_invoke_2(id *a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(a1[4], "containsIndex:", a2);
  if ((result & 1) == 0)
    return objc_msgSend(a1[5], "addObject:", objc_msgSend(a1[6], "objectAtIndex:", a2));
  return result;
}

+ (AVMetadataKeySpace)keySpaceForIdentifier:(AVMetadataIdentifier)identifier
{
  CFStringRef keySpaceOut;

  if (!identifier)
    return 0;
  keySpaceOut = 0;
  if (CMMetadataCreateKeySpaceFromIdentifier((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFStringRef)identifier, &keySpaceOut))
  {
    return 0;
  }
  else
  {
    return (AVMetadataKeySpace)(id)keySpaceOut;
  }
}

+ (id)keyForIdentifier:(AVMetadataIdentifier)identifier
{
  CFTypeRef keyOut;

  if (!identifier)
    return 0;
  keyOut = 0;
  if (CMMetadataCreateKeyFromIdentifier((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFStringRef)identifier, &keyOut))
    return 0;
  else
    return (id)(id)keyOut;
}

+ (NSArray)metadataItemsFromArray:(NSArray *)metadataItems withKey:(id)key keySpace:(AVMetadataKeySpace)keySpace
{
  _QWORD v6[6];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__AVMetadataItem_metadataItemsFromArray_withKey_keySpace___block_invoke;
  v6[3] = &unk_1E3030998;
  v6[4] = keySpace;
  v6[5] = key;
  return -[NSArray objectsAtIndexes:](metadataItems, "objectsAtIndexes:", -[NSArray indexesOfObjectsPassingTest:](metadataItems, "indexesOfObjectsPassingTest:", v6));
}

+ (NSArray)metadataItemsFromArray:(NSArray *)metadataItems filteredAndSortedAccordingToPreferredLanguages:(NSArray *)preferredLanguages
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  id v12;
  NSArray *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  NSIndexSet *v21;
  _QWORD v23[7];
  _QWORD v24[5];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  AVAllAvailableNSBundleCompatibleLanguageTagsForObjects(metadataItems);
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](preferredLanguages, "count"));
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](preferredLanguages, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v30 != v9)
          objc_enumerationMutation(preferredLanguages);
        v11 = objc_msgSend(MEMORY[0x1E0C99DC8], "canonicalLocaleIdentifierFromString:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i));
        if (v11)
          objc_msgSend(v6, "addObject:", v11);
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](preferredLanguages, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v8);
  }
  v12 = (id)FigCopyRankedLanguagesAccordingToPreferredLanguages();
  v13 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = (void *)objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v15 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v26;
    v18 = MEMORY[0x1E0C809B0];
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v26 != v17)
          objc_enumerationMutation(v12);
        v20 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j);
        v24[0] = v18;
        v24[1] = 3221225472;
        v24[2] = __88__AVMetadataItem_metadataItemsFromArray_filteredAndSortedAccordingToPreferredLanguages___block_invoke;
        v24[3] = &unk_1E3030948;
        v24[4] = v20;
        v21 = -[NSArray indexesOfObjectsPassingTest:](metadataItems, "indexesOfObjectsPassingTest:", v24);
        v23[0] = v18;
        v23[1] = 3221225472;
        v23[2] = __88__AVMetadataItem_metadataItemsFromArray_filteredAndSortedAccordingToPreferredLanguages___block_invoke_2;
        v23[3] = &unk_1E3030970;
        v23[4] = v14;
        v23[5] = v13;
        v23[6] = metadataItems;
        -[NSIndexSet enumerateIndexesUsingBlock:](v21, "enumerateIndexesUsingBlock:", v23);
        objc_msgSend(v14, "addIndexes:", v21);
      }
      v16 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v16);
  }
  return v13;
}

uint64_t __88__AVMetadataItem_metadataItemsFromArray_filteredAndSortedAccordingToPreferredLanguages___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ((v4 = objc_msgSend(a2, "unicodeLanguageIdentifier")) != 0 || (v4 = objc_msgSend(a2, "unicodeLanguageCode")) != 0))
  {
    return objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", v4);
  }
  else
  {
    return 0;
  }
}

- (id)unicodeLanguageIdentifier
{
  id result;

  result = -[AVMetadataItem extendedLanguageTag](self, "extendedLanguageTag");
  if (result)
    return (id)objc_msgSend(MEMORY[0x1E0C99DC8], "canonicalLocaleIdentifierFromString:", result);
  return result;
}

- (NSString)extendedLanguageTag
{
  -[AVMetadataItem _makePropertiesReady](self, "_makePropertiesReady");
  return self->_priv->extendedLanguageTag;
}

+ (id)_metadataItemWithFigMetadataDictionary:(id)a3 containerURL:(id)a4 securityOptions:(unsigned int)a5
{
  AVLazyValueLoadingMetadataItem *v10;
  _QWORD v11[5];
  unsigned int v12;

  if (!a4
    || objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CC47E8])
    || !objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CC47E0]))
  {
    return (id)objc_msgSend(objc_alloc((Class)a1), "_initWithFigMetadataDictionary:", a3);
  }
  v10 = [AVLazyValueLoadingMetadataItem alloc];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __86__AVMetadataItem__metadataItemWithFigMetadataDictionary_containerURL_securityOptions___block_invoke;
  v11[3] = &unk_1E30309C0;
  v11[4] = a4;
  v12 = a5;
  return -[AVLazyValueLoadingMetadataItem _initWithFigMetadataDictionary:valueLoadingHandler:](v10, "_initWithFigMetadataDictionary:valueLoadingHandler:", a3, v11);
}

+ (id)_metadataItemWithFigMetadataDictionary:(id)a3
{
  return (id)objc_msgSend(a1, "_metadataItemWithFigMetadataDictionary:containerURL:securityOptions:", a3, 0, 0);
}

- (void)_updateLanguageInformationFromExtendedLanguageTag:(id)a3
{
  NSLocale *v5;
  AVMetadataItemInternal *priv;
  NSLocale *locale;
  NSString *v8;

  if (a3)
    v5 = (NSLocale *)objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", a3);
  else
    v5 = 0;
  priv = self->_priv;
  locale = priv->locale;
  if (locale != v5)
  {

    self->_priv->locale = (NSLocale *)-[NSLocale copy](v5, "copy");
    priv = self->_priv;
  }

  if (a3)
    v8 = (NSString *)objc_msgSend((id)AVLanguageCodeFromExtendedLanguageTag(a3), "copy");
  else
    v8 = 0;
  self->_priv->languageCode = v8;
}

- (AVKeyValueStatus)statusOfValueForKey:(NSString *)key error:(NSError *)outError
{
  return 2;
}

- (void)loadValuesAsynchronouslyForKeys:(NSArray *)keys completionHandler:(void *)handler
{
  if (handler)
    (*((void (**)(void *))handler + 2))(handler);
}

+ (NSArray)metadataItemsFromArray:(NSArray *)metadataItems filteredByIdentifier:(AVMetadataIdentifier)identifier
{
  _QWORD v8[5];

  if (-[NSString isEqualToString:](+[AVMetadataItem keySpaceForIdentifier:](AVMetadataItem, "keySpaceForIdentifier:", identifier), "isEqualToString:", CFSTR("comn")))
  {
    return (NSArray *)objc_msgSend(a1, "metadataItemsFromArray:withKey:keySpace:", metadataItems, +[AVMetadataItem keyForIdentifier:](AVMetadataItem, "keyForIdentifier:", identifier), CFSTR("comn"));
  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __62__AVMetadataItem_metadataItemsFromArray_filteredByIdentifier___block_invoke;
  v8[3] = &unk_1E3030948;
  v8[4] = identifier;
  return -[NSArray objectsAtIndexes:](metadataItems, "objectsAtIndexes:", -[NSArray indexesOfObjectsPassingTest:](metadataItems, "indexesOfObjectsPassingTest:", v8));
}

- (void)_updateLanguageInformationFromLocale:(id)a3
{
  NSString *v4;
  NSString *v5;

  v4 = (NSString *)objc_msgSend((id)AVExtendedLanguageTagFromLocale(a3), "copy");

  self->_priv->extendedLanguageTag = v4;
  if (v4)
    v5 = (NSString *)objc_msgSend((id)AVLanguageCodeFromExtendedLanguageTag(v4), "copy");
  else
    v5 = 0;
  self->_priv->languageCode = v5;
}

- (id)_keyAsString
{
  char isKindOfClass;
  NSObject *key;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return self->_priv->key;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  key = self->_priv->key;
  if ((isKindOfClass & 1) != 0)
    return (id)AVStringForOSType(-[NSObject intValue](key, "intValue"));
  else
    return (id)-[NSObject description](key, "description");
}

- (NSNumber)numberValue
{
  NSNumber *v3;
  id v4;
  NSLocale *v5;

  v3 = -[AVMetadataItem value](self, "value");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
      v5 = -[AVMetadataItem locale](self, "locale");
      if (v5)
        objc_msgSend(v4, "setLocale:", v5);
      v3 = (NSNumber *)objc_msgSend(v4, "numberFromString:", v3);

    }
    else
    {
      return 0;
    }
  }
  return v3;
}

- (NSDate)dateValue
{
  NSDate *v2;

  v2 = -[AVMetadataItem value](self, "value");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      return (NSDate *)(id)FigCFDateCreateFromString();
    return 0;
  }
  return v2;
}

- (CGImage)imageValue
{
  return 0;
}

+ (NSArray)metadataItemsFromArray:(NSArray *)metadataItems withLocale:(NSLocale *)locale
{
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v7[0] = -[NSLocale localeIdentifier](locale, "localeIdentifier");
  return (NSArray *)objc_msgSend(a1, "metadataItemsFromArray:filteredAndSortedAccordingToPreferredLanguages:", metadataItems, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1));
}

+ (id)metadataItemsFromArray:(id)a3 withStringValue:(id)a4
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__AVMetadataItem_metadataItemsFromArray_withStringValue___block_invoke;
  v5[3] = &unk_1E3030948;
  v5[4] = a4;
  return (id)objc_msgSend(a3, "objectsAtIndexes:", objc_msgSend(a3, "indexesOfObjectsPassingTest:", v5));
}

uint64_t __57__AVMetadataItem_metadataItemsFromArray_withStringValue___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", objc_msgSend(a2, "stringValue"));
}

+ (NSArray)metadataItemsFromArray:(NSArray *)metadataItems filteredByMetadataItemFilter:(AVMetadataItemFilter *)metadataItemFilter
{
  NSDictionary *v5;
  NSDictionary *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = -[AVMetadataItemFilter whitelist](metadataItemFilter, "whitelist");
  if (!v5)
    return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v6 = v5;
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](metadataItems, "count"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](metadataItems, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(metadataItems);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        v13 = -[NSDictionary valueForKey:](v6, "valueForKey:", objc_msgSend(v12, "keySpace"));
        if (v13)
        {
          v14 = (void *)v13;
          v15 = (void *)objc_msgSend(v12, "key");
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v15 = (void *)AVStringForOSType(objc_msgSend(v15, "unsignedIntValue"));
          if (objc_msgSend(v14, "containsObject:", v15))
            objc_msgSend(v7, "addObject:", v12);
        }
      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](metadataItems, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v7);
}

- (id)_initWithReader:(OpaqueFigMetadataReader *)a3 itemIndex:(int64_t)a4
{
  AVMetadataItem *v6;
  AVMetadataItem *v7;

  v6 = -[AVMetadataItem init](self, "init");
  v7 = v6;
  if (v6)
  {
    v6->_priv->itemIndex = a4;
    v6->_priv->reader = (OpaqueFigMetadataReader *)CFRetain(a3);
    v7->_priv->preferredStorageLocation = (NSString *)objc_msgSend(CFSTR("default"), "copy");
  }
  return v7;
}

uint64_t __86__AVMetadataItem__metadataItemWithFigMetadataDictionary_containerURL_securityOptions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v11;
  _QWORD v12[6];

  v3 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "metadataItem"), "extraAttributes"), "objectForKey:", CFSTR("URL"));
  v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "metadataItem"), "extraAttributes"), "objectForKey:", CFSTR("baseURL"));
  if (v3
    && ((v5 = (void *)MEMORY[0x1E0C99E98], !v4)
      ? (v6 = 0)
      : (v6 = objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v4)),
        (v7 = objc_msgSend(v5, "URLWithString:relativeToURL:", v3, v6)) != 0))
  {
    v8 = v7;
    if (FigIsReferenceAllowedBySecurityPolicy())
    {
      v9 = (void *)objc_msgSend(MEMORY[0x1E0C92C98], "sharedSession");
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __AVMetadataItemLoadValueFromURI_block_invoke;
      v12[3] = &unk_1E3030AD8;
      v12[4] = a2;
      v12[5] = v8;
      return objc_msgSend((id)objc_msgSend(v9, "dataTaskWithURL:completionHandler:", v8, v12), "resume");
    }
    v11 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v8, *MEMORY[0x1E0CB3308]);
  }
  else
  {
    v11 = 0;
  }
  return objc_msgSend(a2, "respondWithError:", AVLocalizedError(CFSTR("AVFoundationErrorDomain"), -11842, v11));
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  -[AVMetadataItem _makeValueReady](self, "_makeValueReady");
  -[AVMetadataItem _makePropertiesReady](self, "_makePropertiesReady");
  return -[AVMetadataItem _initWithFigMetadataDictionary:](+[AVMutableMetadataItem allocWithZone:](AVMutableMetadataItem, "allocWithZone:", a3), "_initWithFigMetadataDictionary:", -[AVMetadataItem _figMetadataDictionary](self, "_figMetadataDictionary"));
}

- (id)description
{
  char isKindOfClass;
  AVMetadataItemInternal *priv;
  uint64_t v5;
  objc_class *v6;
  NSString *v7;
  objc_class *v8;
  NSString *v9;
  id v10;
  AVMetadataItemInternal *v11;
  NSString *commonKey;
  NSString *extendedLanguageTag;
  NSString *dataType;
  const __CFAllocator *v15;
  const __CFString *v16;
  const __CFString *v17;
  AVMetadataItemInternal *v18;
  NSDate *startDate;
  NSDictionary *extras;
  objc_class *v21;
  NSString *keySpace;
  NSString *v24;
  NSString *v25;
  uint64_t v26;
  void *v27;
  CMTime time;

  -[AVMetadataItem _makeValueReady](self, "_makeValueReady");
  -[AVMetadataItem _makePropertiesReady](self, "_makePropertiesReady");
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  priv = self->_priv;
  if ((isKindOfClass & 1) != 0)
    v5 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" length=%lu"), -[NSObject length](priv->value, "length"));
  else
    v5 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("=%@"), priv->value);
  v26 = v5;
  v27 = (void *)MEMORY[0x1E0CB3940];
  v6 = (objc_class *)objc_opt_class();
  v25 = NSStringFromClass(v6);
  v7 = -[AVMetadataItem identifier](self, "identifier");
  keySpace = self->_priv->keySpace;
  v24 = v7;
  -[AVMetadataItem key](self, "key");
  v8 = (objc_class *)objc_opt_class();
  v9 = NSStringFromClass(v8);
  v10 = -[AVMetadataItem _keyAsString](self, "_keyAsString");
  v11 = self->_priv;
  commonKey = v11->commonKey;
  extendedLanguageTag = v11->extendedLanguageTag;
  dataType = v11->dataType;
  v15 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  time = (CMTime)v11->time;
  v16 = (id)CMTimeCopyDescription(v15, &time);
  time = (CMTime)self->_priv->duration;
  v17 = (id)CMTimeCopyDescription(v15, &time);
  v18 = self->_priv;
  startDate = v18->startDate;
  extras = v18->extras;
  v21 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v27, "stringWithFormat:", CFSTR("<%@: %p, identifier=%@, keySpace=%@, key class = %@, key=%@, commonKey=%@, extendedLanguageTag=%@, dataType=%@, time=%@, duration=%@, startDate=%@, extras=%@, value class=%@, value%@>"), v25, self, v24, keySpace, v9, v10, commonKey, extendedLanguageTag, dataType, v16, v17, startDate, extras, NSStringFromClass(v21), v26);
}

- (id)intrinsicAttributesOfExtraAttributes:(id)a3
{
  id v3;

  v3 = (id)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v3, "removeObjectForKey:", *MEMORY[0x1E0CC4778]);
  objc_msgSend(v3, "removeObjectForKey:", *MEMORY[0x1E0CC4780]);
  objc_msgSend(v3, "removeObjectForKey:", *MEMORY[0x1E0CC4768]);
  objc_msgSend(v3, "removeObjectForKey:", *MEMORY[0x1E0CC4770]);
  return v3;
}

- (BOOL)_areExtraAttributesOf:(id)a3 comparableToExtraAttributesOf:(id)a4
{
  id v6;
  id v7;

  v6 = -[AVMetadataItem intrinsicAttributesOfExtraAttributes:](self, "intrinsicAttributesOfExtraAttributes:", a3);
  v7 = -[AVMetadataItem intrinsicAttributesOfExtraAttributes:](self, "intrinsicAttributesOfExtraAttributes:", a4);
  if (objc_msgSend(v6, "count") || objc_msgSend(v7, "count"))
    return objc_msgSend(v6, "isEqualToDictionary:", v7);
  else
    return 1;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  id v7;
  uint64_t v8;
  NSString *v9;
  uint64_t v10;
  NSLocale *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  NSDictionary *v18;
  id v19;
  uint64_t v20;
  id v21;
  NSDate *v22;
  CMTime time2;
  CMTime time1;
  CMTime v25;
  CMTime v26;
  CMTime v27[2];
  uint64_t v28;
  uint64_t v29;

  if (a3 == self)
  {
    LOBYTE(v13) = 1;
  }
  else
  {
    v28 = v3;
    v29 = v4;
    if (!a3)
      goto LABEL_17;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_17;
    v7 = -[AVMetadataItem key](self, "key");
    v8 = objc_msgSend(a3, "key");
    v9 = -[AVMetadataItem keySpace](self, "keySpace");
    v10 = objc_msgSend(a3, "keySpace");
    v11 = -[AVMetadataItem locale](self, "locale");
    v12 = objc_msgSend(a3, "locale");
    memset(&v27[1], 0, sizeof(CMTime));
    if (self)
    {
      -[AVMetadataItem time](self, "time");
      memset(v27, 0, 24);
      objc_msgSend(a3, "time");
      memset(&v26, 0, sizeof(v26));
      -[AVMetadataItem duration](self, "duration");
    }
    else
    {
      memset(v27, 0, 24);
      objc_msgSend(a3, "time");
      memset(&v26, 0, sizeof(v26));
    }
    memset(&v25, 0, sizeof(v25));
    objc_msgSend(a3, "duration");
    v22 = -[AVMetadataItem startDate](self, "startDate");
    v14 = objc_msgSend(a3, "startDate");
    v21 = -[AVMetadataItem value](self, "value");
    v20 = objc_msgSend(a3, "value");
    v18 = -[AVMetadataItem extraAttributes](self, "extraAttributes");
    v17 = objc_msgSend(a3, "extraAttributes");
    v19 = -[AVMetadataItem preferredStorageLocation](self, "preferredStorageLocation");
    v15 = objc_msgSend(a3, "preferredStorageLocation");
    if (((v7 == (id)v8 || objc_msgSend(v7, "isEqual:", v8))
       && (v9 == (NSString *)v10 || (-[NSString isEqual:](v9, "isEqual:", v10) & 1) != 0)
       || (v13 = -[NSString isEqualToString:](-[AVMetadataItem identifier](self, "identifier"), "isEqualToString:", objc_msgSend(a3, "identifier"))) != 0)&& (v11 == (NSLocale *)v12 || (v13 = -[NSLocale isEqual:](v11, "isEqual:", v12)) != 0))
    {
      time1 = v27[1];
      time2 = v27[0];
      if (CMTimeCompare(&time1, &time2) || (time1 = v26, time2 = v25, CMTimeCompare(&time1, &time2)))
      {
LABEL_17:
        LOBYTE(v13) = 0;
        return v13;
      }
      if ((v22 == (NSDate *)v14 || (v13 = -[NSDate isEqual:](v22, "isEqual:", v14)) != 0)
        && (v21 == (id)v20 || (v13 = objc_msgSend(v21, "isEqual:")) != 0)
        && (v19 == (id)v15 || (v13 = objc_msgSend(v19, "isEqualToString:", v15)) != 0))
      {
        LOBYTE(v13) = v18 == (NSDictionary *)v17
                   || -[AVMetadataItem _areExtraAttributesOf:comparableToExtraAttributesOf:](self, "_areExtraAttributesOf:comparableToExtraAttributesOf:");
      }
    }
  }
  return v13;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  const __CFAllocator *v6;
  uint64_t v7;
  NSUInteger v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CMTime v13;
  CMTime time;

  if (-[AVMetadataItem identifier](self, "identifier"))
  {
    v3 = -[NSString hash](-[AVMetadataItem identifier](self, "identifier"), "hash");
  }
  else
  {
    v4 = objc_msgSend(-[AVMetadataItem key](self, "key"), "hash");
    v3 = -[NSString hash](-[AVMetadataItem keySpace](self, "keySpace"), "hash") ^ v4;
  }
  v5 = -[NSLocale hash](-[AVMetadataItem locale](self, "locale"), "hash");
  if (self)
    -[AVMetadataItem time](self, "time");
  else
    memset(&time, 0, sizeof(time));
  v6 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v7 = -[__CFDictionary hash](CMTimeCopyAsDictionary(&time, (CFAllocatorRef)*MEMORY[0x1E0C9AE00]), "hash");
  if (self)
    -[AVMetadataItem duration](self, "duration");
  else
    memset(&v13, 0, sizeof(v13));
  v8 = v5 ^ v3 ^ v7;
  v9 = -[__CFDictionary hash](CMTimeCopyAsDictionary(&v13, v6), "hash");
  v10 = v8 ^ v9 ^ -[NSDate hash](-[AVMetadataItem startDate](self, "startDate"), "hash");
  v11 = objc_msgSend(-[AVMetadataItem value](self, "value"), "hash");
  return v10 ^ v11 ^ objc_msgSend(-[AVMetadataItem intrinsicAttributesOfExtraAttributes:](self, "intrinsicAttributesOfExtraAttributes:", -[AVMetadataItem extraAttributes](self, "extraAttributes")), "hash");
}

+ (id)_metadataArrayWithSmartDeferredLoadingForMetataArray:(id)a3 error:(id *)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  const __CFString *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (!v7)
    return v6;
  v8 = v7;
  v9 = *(_QWORD *)v17;
  while (2)
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v17 != v9)
        objc_enumerationMutation(a3);
      v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
      if (-[NSString isEqualToString:](+[AVMetadataItem identifierForKey:keySpace:](AVMetadataItem, "identifierForKey:keySpace:", objc_msgSend(v11, "key"), objc_msgSend(v11, "keySpace")), "isEqualToString:", CFSTR("mdta/com.apple.quicktime.aime-data")))
      {
        v12 = (id)objc_msgSend(v11, "mutableCopy");
        if ((objc_msgSend(v12, "_preferredStorageLocationWasSet") & 1) != 0)
        {
          if ((objc_msgSend((id)objc_msgSend(v11, "preferredStorageLocation"), "isEqualToString:", CFSTR("default")) & 1) != 0)
          {
            v13 = CFSTR("Invalid metadata key specified for default storage location.");
LABEL_16:
            v14 = (void *)AVErrorForClientProgrammingError(objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v13, 0));
            if (v14)
            {
              v6 = 0;
              if (a4)
                *a4 = v14;
            }
            return v6;
          }
        }
        else
        {
          objc_msgSend(v12, "setPreferredStorageLocation:", CFSTR("forDeferredLoading"));
        }
      }
      else
      {
        v12 = v11;
        if ((objc_msgSend((id)objc_msgSend(v11, "preferredStorageLocation"), "isEqualToString:", CFSTR("forDeferredLoading")) & 1) != 0)
        {
          v13 = CFSTR("Invalid metadata key specified for deferred loading.");
          goto LABEL_16;
        }
      }
      objc_msgSend(v6, "addObject:", v12);
    }
    v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
      continue;
    return v6;
  }
}

- (id)_figMetadataFormat
{
  id *v3;

  if (-[NSString isEqualToString:](self->_priv->keySpace, "isEqualToString:", CFSTR("mdta")))
  {
    v3 = (id *)&AVMetadataFormatQuickTimeMetadata;
    return *v3;
  }
  if (-[NSString isEqualToString:](self->_priv->keySpace, "isEqualToString:", CFSTR("udta")))
  {
    v3 = (id *)&AVMetadataFormatQuickTimeUserData;
    return *v3;
  }
  if (-[NSString isEqualToString:](self->_priv->keySpace, "isEqualToString:", CFSTR("uiso")))
  {
    v3 = (id *)&AVMetadataFormatISOUserData;
    return *v3;
  }
  if (-[NSString isEqualToString:](self->_priv->keySpace, "isEqualToString:", CFSTR("itsk"))
    || -[NSString isEqualToString:](self->_priv->keySpace, "isEqualToString:", CFSTR("itlk")))
  {
    v3 = (id *)&AVMetadataFormatiTunesMetadata;
    return *v3;
  }
  if (-[NSString isEqualToString:](self->_priv->keySpace, "isEqualToString:", CFSTR("org.id3")))
    return CFSTR("org.id3");
  else
    return 0;
}

- (id)_figMetadataSpecificationReturningError:(id *)a3
{
  NSString *v5;
  id v6;
  id v7;
  NSString *v8;
  NSString *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  objc_class *v16;
  NSString *v17;
  uint64_t v19;
  uint64_t v20;

  v5 = -[AVMetadataItem identifier](self, "identifier");
  v6 = -[AVMetadataItem _serializationDataType](self, "_serializationDataType");
  v7 = -[AVMetadataItem _conformingDataTypes](self, "_conformingDataTypes");
  v8 = -[AVMetadataItem extendedLanguageTag](self, "extendedLanguageTag");
  if (!v6)
  {
    v14 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Metadata item %p has no data type"), self, v19, v20);
LABEL_11:
    v13 = (void *)AVErrorForClientProgrammingError(objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], v14, 0));
    v12 = 0;
    goto LABEL_12;
  }
  if (!v5)
  {
    v15 = (void *)MEMORY[0x1E0CB3940];
    v16 = (objc_class *)objc_opt_class();
    v17 = NSStringFromClass(v16);
    v14 = objc_msgSend(v15, "stringWithFormat:", CFSTR("Metadata item %p has no identifier.  If the item was given a key and key space, use +[%@ %@] to check whether an identifier can be made from that key and key space"), self, v17, NSStringFromSelector(sel_identifierForKey_keySpace_));
    goto LABEL_11;
  }
  v9 = v8;
  v10 = -[AVMetadataItem value](self, "value");
  v11 = (void *)((uint64_t (*)(uint64_t))softLinkAVMetadataMakeDependentSpecificationsForValue[0])((uint64_t)v10);
  v12 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  objc_msgSend(v12, "setObject:forKey:", v5, *MEMORY[0x1E0CA2528]);
  objc_msgSend(v12, "setObject:forKey:", v6, *MEMORY[0x1E0CA2518]);
  if (objc_msgSend(v7, "count"))
    objc_msgSend(v12, "setObject:forKey:", v7, *MEMORY[0x1E0CA4BD0]);
  if (v9)
    objc_msgSend(v12, "setObject:forKey:", v9, *MEMORY[0x1E0CA2520]);
  v13 = (void *)objc_msgSend(v11, "count");
  if (v13)
  {
    objc_msgSend(v12, "setObject:forKey:", v11, *MEMORY[0x1E0CA4BD8]);
    v13 = 0;
  }
LABEL_12:
  if (a3 && !v12)
    *a3 = v13;
  return v12;
}

- (id)_createJSONEncodedDataFromValue:(id)a3 error:(id *)a4
{
  if (objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:"))
    return (id)objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", a3, 0, a4);
  if (a4)
    *a4 = (id)AVErrorForClientProgrammingError(objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("+[NSJSONSerialization isValidJSONObject:] returned NO for the AVMetadataItem's value"), 0));
  return 0;
}

+ (id)_isoUserDataKeysRequiringKeySpaceConversion
{
  if (_isoUserDataKeysRequiringKeySpaceConversion_onceToken != -1)
    dispatch_once(&_isoUserDataKeysRequiringKeySpaceConversion_onceToken, &__block_literal_global_1);
  return (id)_isoUserDataKeysRequiringKeySpaceConversion_conversionList;
}

uint64_t __61__AVMetadataItem__isoUserDataKeysRequiringKeySpaceConversion__block_invoke()
{
  uint64_t result;

  result = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("cprt"), CFSTR("auth"), CFSTR("perf"), CFSTR("gnre"), CFSTR("yrrc"), CFSTR("loci"), CFSTR("titl"), CFSTR("dscp"), 0);
  _isoUserDataKeysRequiringKeySpaceConversion_conversionList = result;
  return result;
}

+ (id)_replaceQuickTimeUserDataKeySpaceWithISOUserDataKeySpaceIfRequired:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  char isKindOfClass;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (+[AVMetadataItem _clientExpectsISOUserDataKeysInQuickTimeUserDataKeySpace](AVMetadataItem, "_clientExpectsISOUserDataKeysInQuickTimeUserDataKeySpace"))
  {
    v4 = +[AVMetadataItem _isoUserDataKeysRequiringKeySpaceConversion](AVMetadataItem, "_isoUserDataKeysRequiringKeySpaceConversion");
  }
  else
  {
    v4 = (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("cprt"));
  }
  v5 = v4;
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a3, "count"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(a3);
        v11 = *(id *)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v11, "keySpace"), "isEqualToString:", CFSTR("udta")))
        {
          objc_msgSend(v11, "key");
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();
          v13 = objc_msgSend(v11, "key");
          if ((isKindOfClass & 1) != 0)
          {
            if ((objc_msgSend(v5, "containsObject:", v13) & 1) != 0)
              goto LABEL_15;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0
              && objc_msgSend(v5, "containsObject:", AVStringForOSType(objc_msgSend((id)objc_msgSend(v11, "key"), "intValue"))))
            {
LABEL_15:
              v11 = (id)objc_msgSend(v11, "mutableCopy");
              objc_msgSend(v11, "setKeySpace:", CFSTR("uiso"));
            }
          }
        }
        objc_msgSend(v6, "addObject:", v11);
      }
      v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }
  return v6;
}

+ (id)_figMetadataPropertyFromMetadataItems:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v23 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = +[AVMetadataItem _replaceQuickTimeUserDataKeySpaceWithISOUserDataKeySpaceIfRequired:](AVMetadataItem, "_replaceQuickTimeUserDataKeySpaceWithISOUserDataKeySpaceIfRequired:", a3);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v30 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "_figMetadataFormat");
        v13 = objc_msgSend(v11, "_figMetadataDictionaryWithValue:diviningValueDataType:", 1, 1);
        v14 = (void *)v4;
        if (v12)
        {
          v14 = (void *)objc_msgSend(v5, "valueForKey:", v12);
          if (!v14)
          {
            v14 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            objc_msgSend(v5, "setValue:forKey:", v14, v12);
          }
        }
        objc_msgSend(v14, "addObject:", v13);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v8);
  }
  v24 = (void *)v4;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v15 = (void *)objc_msgSend(v5, "allKeys");
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v26;
    v19 = *MEMORY[0x1E0CC47F8];
    v20 = *MEMORY[0x1E0CC47F0];
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v26 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(v23, "addObject:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", objc_msgSend(v5, "valueForKey:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j)), v19, *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j), v20, 0));
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v17);
  }
  if (objc_msgSend(v24, "count"))
    objc_msgSend(v23, "addObject:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v24, *MEMORY[0x1E0CC47F8], 0));
  if (objc_msgSend(v23, "count"))
    return v23;
  else
    return 0;
}

- (NSLocale)locale
{
  -[AVMetadataItem _makePropertiesReady](self, "_makePropertiesReady");
  return self->_priv->locale;
}

- (id)languageCode
{
  -[AVMetadataItem _makePropertiesReady](self, "_makePropertiesReady");
  return self->_priv->languageCode;
}

- (id)unicodeLanguageCode
{
  id result;

  result = -[AVMetadataItem languageCode](self, "languageCode");
  if (result)
    return (id)objc_msgSend(MEMORY[0x1E0C99DC8], "canonicalLocaleIdentifierFromString:", result);
  return result;
}

- (CMTime)time
{
  uint64_t v4;
  CMTime *v5;

  v4 = *(_QWORD *)&self->timescale;
  if ((*(_BYTE *)(v4 + 100) & 1) == 0)
  {
    v5 = self;
    self = (CMTime *)-[CMTime _makePropertiesReady](self, "_makePropertiesReady");
    v4 = *(_QWORD *)&v5->timescale;
  }
  *(_OWORD *)&retstr->value = *(_OWORD *)(v4 + 88);
  retstr->epoch = *(_QWORD *)(v4 + 104);
  return self;
}

- (CMTime)duration
{
  uint64_t v4;
  CMTime *v5;

  v4 = *(_QWORD *)&self->timescale;
  if ((*(_BYTE *)(v4 + 124) & 1) == 0)
  {
    v5 = self;
    self = (CMTime *)-[CMTime _makePropertiesReady](self, "_makePropertiesReady");
    v4 = *(_QWORD *)&v5->timescale;
  }
  *(_OWORD *)&retstr->value = *(_OWORD *)(v4 + 112);
  retstr->epoch = *(_QWORD *)(v4 + 128);
  return self;
}

- (NSDate)startDate
{
  -[AVMetadataItem _makePropertiesReady](self, "_makePropertiesReady");
  return self->_priv->startDate;
}

- (NSString)dataType
{
  -[AVMetadataItem _makePropertiesReady](self, "_makePropertiesReady");
  return self->_priv->dataType;
}

+ (id)dataTypeForValue:(id)a3
{
  CFIndex ByteSize;
  id result;
  id *v6;
  uint64_t v7;
  CFIndex v8;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    switch(CFNumberGetType((CFNumberRef)a3))
    {
      case kCFNumberSInt8Type:
LABEL_4:
        v6 = (id *)MEMORY[0x1E0CA2468];
        return *v6;
      case kCFNumberSInt16Type:
LABEL_19:
        v6 = (id *)MEMORY[0x1E0CA2450];
        return *v6;
      case kCFNumberSInt32Type:
LABEL_20:
        v6 = (id *)MEMORY[0x1E0CA2458];
        return *v6;
      case kCFNumberSInt64Type:
LABEL_21:
        v6 = (id *)MEMORY[0x1E0CA2460];
        return *v6;
      case kCFNumberFloat32Type:
        goto LABEL_17;
      case kCFNumberFloat64Type:
        goto LABEL_23;
      case kCFNumberCharType:
      case kCFNumberShortType:
      case kCFNumberIntType:
      case kCFNumberLongType:
      case kCFNumberLongLongType:
      case kCFNumberCFIndexType:
      case kCFNumberNSIntegerType:
        ByteSize = CFNumberGetByteSize((CFNumberRef)a3);
        result = 0;
        switch(ByteSize)
        {
          case 1:
            goto LABEL_4;
          case 2:
            goto LABEL_19;
          case 4:
            goto LABEL_20;
          case 8:
            goto LABEL_21;
          default:
            return result;
        }
        return result;
      case kCFNumberFloatType:
      case kCFNumberDoubleType:
      case kCFNumberCGFloatType:
        v8 = CFNumberGetByteSize((CFNumberRef)a3);
        if (v8 == 8)
        {
LABEL_23:
          v6 = (id *)MEMORY[0x1E0CA23F8];
        }
        else
        {
          if (v8 != 4)
            return 0;
LABEL_17:
          v6 = (id *)MEMORY[0x1E0CA23F0];
        }
        break;
      default:
        return 0;
    }
    return *v6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = objc_msgSend(a3, "fastestEncoding");
    if (v7 == 10 || v7 == 2483028224 || v7 == 2415919360)
      v6 = (id *)MEMORY[0x1E0CA2490];
    else
      v6 = (id *)MEMORY[0x1E0CA2498];
    return *v6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = (id *)MEMORY[0x1E0CA2440];
    return *v6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  if (AVCGPointFromNSValue(a3, 0))
  {
    v6 = (id *)MEMORY[0x1E0CA2428];
    return *v6;
  }
  if (AVCGRectFromNSValue(a3, 0))
  {
    v6 = (id *)MEMORY[0x1E0CA2448];
    return *v6;
  }
  if (AVCGSizeFromNSValue(a3, 0))
    return (id)*MEMORY[0x1E0CA23E8];
  else
    return 0;
}

- (id)_serializationDataType
{
  id result;

  result = -[AVMetadataItem dataType](self, "dataType");
  if (!result)
    return (id)objc_msgSend((id)objc_opt_class(), "dataTypeForValue:", -[AVMetadataItem value](self, "value"));
  return result;
}

- (id)_conformingDataTypes
{
  NSDictionary *v2;

  v2 = -[AVMetadataItem extraAttributes](self, "extraAttributes");
  return -[NSDictionary objectForKey:](v2, "objectForKey:", *MEMORY[0x1E0CC4768]);
}

- (id)preferredStorageLocation
{
  -[AVMetadataItem _makePropertiesReady](self, "_makePropertiesReady");
  return self->_priv->preferredStorageLocation;
}

- (BOOL)_preferredStorageLocationWasSet
{
  -[AVMetadataItem _makePropertiesReady](self, "_makePropertiesReady");
  return self->_priv->preferredStorageLocationWasSet;
}

+ (AVMetadataItem)metadataItemWithPropertiesOfMetadataItem:(AVMetadataItem *)metadataItem valueLoadingHandler:(void *)handler
{
  return (AVMetadataItem *)+[AVLazyValueLoadingMetadataItem metadataItemWithPropertiesOfMetadataItem:valueLoadingHandler:](AVLazyValueLoadingMetadataItem, "metadataItemWithPropertiesOfMetadataItem:valueLoadingHandler:", metadataItem, handler);
}

+ (id)metadataItemsFromArray:(id)a3 filteredByIdentifiers:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(a3);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v11, "identifier")
          && objc_msgSend(a4, "containsObject:", objc_msgSend(v11, "identifier")))
        {
          objc_msgSend(v6, "addObject:", v11);
        }
      }
      v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }
  return (id)objc_msgSend(v6, "copy");
}

@end
