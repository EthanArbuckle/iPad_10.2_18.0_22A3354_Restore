@implementation AppleDoubleParser

- (BOOL)isXattrProtected:(const char *)a3
{
  return strncmp(a3, "com.apple.system.", 0x11uLL) == 0;
}

- (BOOL)isXattrNameValid:(attr_entry *)a3
{
  unsigned __int8 *var4;
  int v5;
  unint64_t var3;
  BOOL v7;
  void *v8;

  v5 = a3->var4[0];
  var4 = a3->var4;
  if (!v5)
    return 0;
  var3 = a3->var3;
  if (var3 > 0x7E || a3->var4[var3])
    return 1;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", var4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v8 != 0;

  return v7;
}

- (void)lookupXattrNamed:(id)a3 reply:(id)a4
{
  id v6;
  apple_double_entry *finderinfo;
  apple_double_entry *rsrcfork;
  attr_header *attrHeader;
  attr_entry *firstAttrEntry;
  unsigned int i;
  unint64_t v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  if (!objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.FinderInfo")))
  {
    if (objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.ResourceFork")))
    {
      rsrcfork = self->_rsrcfork;
      if (rsrcfork)
      {
        (*((void (**)(id, _QWORD, _QWORD, _QWORD))v6 + 2))(v6, 0, rsrcfork->var1, rsrcfork->var2);
        goto LABEL_17;
      }
    }
    else
    {
      attrHeader = self->_attrHeader;
      if (attrHeader)
      {
        firstAttrEntry = self->_firstAttrEntry;
        if (firstAttrEntry)
        {
          if (HIWORD(attrHeader->var6[2]))
          {
            for (i = 0; i < HIWORD(self->_attrHeader->var6[2]); ++i)
            {
              if ((unint64_t)&firstAttrEntry->var3 >= -[NSMutableData bytes](self->_rawHeader, "bytes")
                                                            + self->_headerSize)
                break;
              v12 = (unint64_t)firstAttrEntry + ((firstAttrEntry->var3 + 14) & 0x1FC);
              if (v12 > -[NSMutableData bytes](self->_rawHeader, "bytes") + self->_headerSize)
                break;
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", firstAttrEntry->var4);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v14, "isEqualToString:", v13))
              {
                (*((void (**)(id, _QWORD, _QWORD, _QWORD))v6 + 2))(v6, 0, firstAttrEntry->var0, firstAttrEntry->var1);

                goto LABEL_17;
              }
              firstAttrEntry = (attr_entry *)((char *)firstAttrEntry + ((firstAttrEntry->var3 + 14) & 0x1FC));

            }
          }
        }
      }
    }
LABEL_16:
    (*((void (**)(id, uint64_t, _QWORD, _QWORD))v6 + 2))(v6, 93, 0, 0);
    goto LABEL_17;
  }
  finderinfo = self->_finderinfo;
  if (!finderinfo || self->_emptyFinderInfo)
    goto LABEL_16;
  (*((void (**)(id, _QWORD, _QWORD, uint64_t))v6 + 2))(v6, 0, finderinfo->var1, 32);
LABEL_17:

}

- (void)listXattrs:(list_xattrs_result *)a3
{
  unsigned __int8 *var7;
  apple_double_entry *finderinfo;
  unsigned int v7;
  unint64_t var1;
  apple_double_entry *rsrcfork;
  uint64_t v10;
  __int128 v11;
  attr_header *attrHeader;
  attr_entry *firstAttrEntry;
  unsigned int v14;
  unsigned int v15;
  unsigned __int8 *p_var3;
  unint64_t v17;
  uint64_t v18;
  BOOL v19;
  unint64_t v20;
  unsigned int v21;
  attr_entry *v22;
  unint64_t v23;

  var7 = a3->var7;
  finderinfo = self->_finderinfo;
  if (finderinfo && !self->_emptyFinderInfo)
  {
    var1 = finderinfo->var1;
    strcpy((char *)a3->var7, "com.apple.FinderInfo");
    a3->var0 = var1;
    var7 = &a3->var7[21];
    v7 = 21;
  }
  else
  {
    v7 = 0;
  }
  rsrcfork = self->_rsrcfork;
  if (rsrcfork)
  {
    v10 = *(_QWORD *)&rsrcfork->var1;
    *(_QWORD *)&v11 = v10;
    *((_QWORD *)&v11 + 1) = HIDWORD(v10);
    *(_OWORD *)&a3->var1 = v11;
    strcpy((char *)var7, "com.apple.ResourceFork");
    var7 += 23;
    v7 += 23;
  }
  attrHeader = self->_attrHeader;
  if (attrHeader)
  {
    firstAttrEntry = self->_firstAttrEntry;
    if (firstAttrEntry)
    {
      if (HIWORD(attrHeader->var6[2]))
      {
        v14 = 0;
        v15 = 0;
        do
        {
          p_var3 = &firstAttrEntry->var3;
          if ((unint64_t)&firstAttrEntry->var3 >= -[NSMutableData bytes](self->_rawHeader, "bytes")
                                                        + self->_headerSize)
            break;
          v17 = (unint64_t)firstAttrEntry + ((firstAttrEntry->var3 + 14) & 0x1FC);
          if (v17 > -[NSMutableData bytes](self->_rawHeader, "bytes") + self->_headerSize)
            break;
          if (-[AppleDoubleParser isXattrNameValid:](self, "isXattrNameValid:", firstAttrEntry)
            && !-[AppleDoubleParser isXattrProtected:](self, "isXattrProtected:", firstAttrEntry->var4))
          {
            memcpy(var7, firstAttrEntry->var4, *p_var3);
            v18 = *p_var3;
            var7 += v18;
            v7 += v18;
            ++v15;
          }
          else
          {
            LOWORD(v18) = *p_var3;
          }
          firstAttrEntry = (attr_entry *)((char *)firstAttrEntry + (((_WORD)v18 + 14) & 0x1FC));
          ++v14;
        }
        while (v14 < HIWORD(self->_attrHeader->var6[2]));
        v19 = HIWORD(self->_attrHeader->var6[2]) == 0;
      }
      else
      {
        v15 = 0;
        v19 = 1;
      }
      v20 = 8 * v15;
      a3->var5 = v7;
      a3->var6 = v20;
      a3->var3 = v15;
      a3->var4 = v20 + v7;
      if (!v19)
      {
        v21 = 0;
        v22 = self->_firstAttrEntry;
        do
        {
          if ((unint64_t)&v22->var3 >= -[NSMutableData bytes](self->_rawHeader, "bytes") + self->_headerSize)
            break;
          v23 = (unint64_t)v22 + ((v22->var3 + 14) & 0x1FC);
          if (v23 > -[NSMutableData bytes](self->_rawHeader, "bytes") + self->_headerSize)
            break;
          if (-[AppleDoubleParser isXattrNameValid:](self, "isXattrNameValid:", v22))
          {
            if (!-[AppleDoubleParser isXattrProtected:](self, "isXattrProtected:", v22->var4))
            {
              *(_DWORD *)var7 = v22->var0;
              *((_DWORD *)var7 + 1) = v22->var1;
              var7 += 8;
            }
          }
          v22 = (attr_entry *)((char *)v22 + ((v22->var3 + 14) & 0x1FC));
          ++v21;
        }
        while (v21 < HIWORD(self->_attrHeader->var6[2]));
      }
    }
  }
}

- (void)allocateXattrNamed:(id)a3 sized:(unint64_t)a4 how:(unsigned int)a5 reply:(id)a6
{
  char v7;
  id v10;
  id v11;
  _QWORD *v12;
  void (*v13)(void);
  apple_double_entry *rsrcfork;
  unint64_t var2;
  attr_header *attrHeader;
  attr_entry *firstAttrEntry;
  char v18;
  unsigned int i;
  unint64_t v20;
  void *v21;
  unint64_t v22;
  BOOL v23;
  id v24;
  void *v25;
  _BOOL4 v26;
  id v27;
  attr_header *v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  unint64_t v35;
  uint64_t var3;
  unint64_t v37;
  unsigned int v38;
  unint64_t v39;
  BOOL v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  apple_double_entry *v45;
  uint64_t v46;
  uint64_t var1;
  _BOOL4 v48;
  id v49;
  uint64_t v50;
  uint64_t var4;
  BOOL v52;
  id v53;
  attr_header *v54;
  unsigned int v55;
  int v56;
  attr_entry *v57;
  char *v58;
  uint64_t v59;
  id v60;
  attr_header *v61;
  unsigned int v62;
  unsigned int v63;
  unsigned int v64;
  BOOL v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  id v71;
  id v72;
  id v73;
  _QWORD v74[4];
  _QWORD *v75;
  id v76;
  id v77;

  v7 = a5;
  v10 = a3;
  v11 = a6;
  v12 = v11;
  if (self->_readOnly || !self->_isAllocateXattr)
  {
    v13 = (void (*)(void))*((_QWORD *)v11 + 2);
LABEL_3:
    v13();
    goto LABEL_4;
  }
  if (a4 >> 31 || (unint64_t)objc_msgSend(v10, "length") >= 0xFF)
  {
    v13 = (void (*)(void))v12[2];
    goto LABEL_3;
  }
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.FinderInfo")))
  {
    if (a4 != 32)
    {
      v13 = (void (*)(void))v12[2];
      goto LABEL_3;
    }
    if (self->_finderinfo)
    {
      if (self->_emptyFinderInfo)
      {
        if ((v7 & 4) != 0)
          goto LABEL_55;
LABEL_39:
        v13 = (void (*)(void))v12[2];
        goto LABEL_3;
      }
      if ((v7 & 2) == 0)
        goto LABEL_39;
LABEL_40:
      v13 = (void (*)(void))v12[2];
      goto LABEL_3;
    }
LABEL_55:
    v13 = (void (*)(void))v12[2];
    goto LABEL_3;
  }
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.ResourceFork")))
  {
    rsrcfork = self->_rsrcfork;
    if (!rsrcfork)
      goto LABEL_55;
    var2 = rsrcfork->var2;
    if ((_DWORD)var2)
    {
      if ((v7 & 2) != 0)
        goto LABEL_40;
    }
    else if ((v7 & 4) != 0)
    {
      goto LABEL_55;
    }
    if (var2 >= a4)
    {
      v27 = 0;
      goto LABEL_48;
    }
    rsrcfork->var2 = a4;
    if (ftruncate(self->_fileDescriptor, (rsrcfork->var1 + a4)) == -1)
    {
      doubleagent_std_log();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        -[AppleDoubleParser allocateXattrNamed:sized:how:reply:].cold.1(v32);

      v13 = (void (*)(void))v12[2];
      goto LABEL_3;
    }
    v77 = 0;
    v23 = -[AppleDoubleParser updateFileSize:](self, "updateFileSize:", &v77);
    v24 = v77;
    v25 = v24;
    if (v23)
    {
      v76 = v24;
      v26 = -[AppleDoubleParser writeHeaderToDiskUpToLength:error:](self, "writeHeaderToDiskUpToLength:error:", 84, &v76);
      v27 = v76;

      if (!v26)
      {
        doubleagent_std_log();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          -[AppleDoubleParser allocateXattrNamed:sized:how:reply:].cold.2();

        ((void (*)(_QWORD *, uint64_t, _QWORD))v12[2])(v12, objc_msgSend(v27, "code"), 0);
        goto LABEL_49;
      }
      rsrcfork = self->_rsrcfork;
LABEL_48:
      ((void (*)(_QWORD *, _QWORD, _QWORD))v12[2])(v12, 0, rsrcfork->var1);
LABEL_49:

      goto LABEL_4;
    }
    doubleagent_std_log();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      -[AppleDoubleParser allocateXattrNamed:sized:how:reply:].cold.3();

    ((void (*)(_QWORD *, uint64_t, _QWORD))v12[2])(v12, 5, 0);
LABEL_62:

    goto LABEL_4;
  }
  if (!self->_attrHeader || !self->_firstAttrEntry)
    goto LABEL_55;
  v69 = objc_msgSend(v10, "length");
  attrHeader = self->_attrHeader;
  firstAttrEntry = self->_firstAttrEntry;
  LODWORD(v67) = attrHeader->var4;
  HIDWORD(v67) = attrHeader->var3;
  if (HIWORD(attrHeader->var6[2]))
  {
    v18 = v7 & 0xFB;
LABEL_25:
    for (i = 0; i < HIWORD(self->_attrHeader->var6[2]); ++i)
    {
      if ((unint64_t)&firstAttrEntry->var3 >= -[NSMutableData bytes](self->_rawHeader, "bytes", v67)
                                                    + self->_headerSize)
        break;
      v20 = (unint64_t)firstAttrEntry + ((firstAttrEntry->var3 + 14) & 0x1FC);
      if (v20 > -[NSMutableData bytes](self->_rawHeader, "bytes") + self->_headerSize)
        break;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", firstAttrEntry->var4);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "isEqualToString:", v21))
      {

        if ((v7 & 2) != 0)
          goto LABEL_40;
        if (firstAttrEntry->var1 == a4)
          goto LABEL_39;
        v74[0] = MEMORY[0x24BDAC760];
        v74[1] = 3221225472;
        v74[2] = __56__AppleDoubleParser_allocateXattrNamed_sized_how_reply___block_invoke;
        v74[3] = &unk_250B89FB0;
        v75 = v12;
        -[AppleDoubleParser removeXattrNamed:reply:](self, "removeXattrNamed:reply:", v10, v74);

        firstAttrEntry = self->_firstAttrEntry;
        v7 = v18;
        if (HIWORD(self->_attrHeader->var6[2]))
          goto LABEL_25;
        v7 = v18;
        break;
      }
      firstAttrEntry = (attr_entry *)((char *)firstAttrEntry + ((firstAttrEntry->var3 + 14) & 0x1FC));

    }
  }
  if ((unint64_t)&firstAttrEntry->var3 >= -[NSMutableData bytes](self->_rawHeader, "bytes", v67)
                                                + self->_headerSize)
    goto LABEL_37;
  v22 = (unint64_t)firstAttrEntry + ((firstAttrEntry->var3 + 14) & 0x1FC);
  if (v22 > -[NSMutableData bytes](self->_rawHeader, "bytes") + self->_headerSize)
    goto LABEL_37;
  if ((v7 & 4) != 0)
    goto LABEL_55;
  v28 = self->_attrHeader;
  if (HIWORD(v28->var6[2]) == 256)
  {
    doubleagent_std_log();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      -[AppleDoubleParser allocateXattrNamed:sized:how:reply:].cold.4(v29, v30, v31);

    goto LABEL_37;
  }
  v35 = (v69 + 15) & 0xFFFFFFFFFFFFFFFCLL;
  var3 = v28->var3;
  if (v35 + var3 > 0x10000)
  {
LABEL_37:
    v13 = (void (*)(void))v12[2];
    goto LABEL_3;
  }
  v37 = v35 + a4 + (v68 + HIDWORD(v68));
  v38 = v28->var2;
  v39 = v38 - ((_DWORD)var3 + v28->var4);
  v40 = v35 + a4 >= v39;
  v41 = v35 + a4 - v39;
  if (v41 != 0 && v40)
  {
    v42 = (v41 + 4095) & 0xFFFFFFFFFFFFF000;
    v43 = 0x10000 - v38;
    if (v42 < v43)
      v43 = v42;
    if (v37 <= 0x10000)
      v44 = v43;
    else
      v44 = v42;
    v45 = self->_rsrcfork;
    if (v45)
    {
      v46 = v45->var2;
      if ((_DWORD)v46)
      {
        var1 = v45->var1;
        v73 = 0;
        v48 = -[AppleDoubleParser shiftDataDownAtOffset:length:delta:error:](self, "shiftDataDownAtOffset:length:delta:error:", var1, v46, v44, &v73);
        v49 = v73;
        v25 = v49;
        if (!v48)
        {
          ((void (*)(_QWORD *, uint64_t, _QWORD))v12[2])(v12, objc_msgSend(v49, "code"), 0);
          goto LABEL_62;
        }
        v45 = self->_rsrcfork;
        v28 = self->_attrHeader;
        v38 = v28->var2;
      }
      else
      {
        v25 = 0;
      }
      v45->var1 += v44;
    }
    else
    {
      v25 = 0;
    }
    self->_finderinfo->var2 += v44;
    v28->var2 = v38 + v44;
    v37 = v35 + a4 + (v68 + HIDWORD(v68));
  }
  else
  {
    v25 = 0;
  }
  v50 = v28->var3;
  v70 = v37;
  if (v37 <= 0x10000)
  {
    memmove((char *)v28 + v50 + v35, (char *)v28 + v50, v28->var4);
  }
  else
  {
    var4 = v28->var4;
    v72 = v25;
    v52 = -[AppleDoubleParser shiftDataDownAtOffset:length:delta:error:](self, "shiftDataDownAtOffset:length:delta:error:", v50, var4, v35, &v72);
    v53 = v72;

    if (!v52)
    {
      ((void (*)(_QWORD *, uint64_t, _QWORD))v12[2])(v12, objc_msgSend(v53, "code"), 0);

      goto LABEL_4;
    }
    v25 = v53;
  }
  v54 = self->_attrHeader;
  v55 = v54->var3 + v35;
  v54->var3 = v55;
  if (HIWORD(v54->var6[2]))
  {
    v56 = 0;
    v57 = self->_firstAttrEntry;
    while ((unint64_t)&v57->var3 < -[NSMutableData bytes](self->_rawHeader, "bytes") + self->_headerSize)
    {
      v58 = (char *)v57 + ((v57->var3 + 14) & 0x1FC);
      v59 = -[NSMutableData bytes](self->_rawHeader, "bytes");
      v54 = self->_attrHeader;
      if ((unint64_t)v58 <= v59 + self->_headerSize)
      {
        v57->var0 += v35;
        v57 = (attr_entry *)((char *)v57 + ((v57->var3 + 14) & 0x1FC));
        if (++v56 < HIWORD(v54->var6[2]))
          continue;
      }
      goto LABEL_95;
    }
    v54 = self->_attrHeader;
LABEL_95:
    v55 = v54->var3;
  }
  firstAttrEntry->var0 = v54->var4 + v55;
  firstAttrEntry->var1 = a4;
  firstAttrEntry->var3 = objc_msgSend(v10, "length") + 1;
  firstAttrEntry->var2 = 0;
  v60 = objc_retainAutorelease(v10);
  memcpy(firstAttrEntry->var4, (const void *)objc_msgSend(v60, "UTF8String"), objc_msgSend(v60, "length") + 1);
  v61 = self->_attrHeader;
  ++HIWORD(v61->var6[2]);
  v62 = v61->var3;
  v63 = v61->var4 + a4;
  v61->var4 = v63;
  if (v70 <= 0x10000)
    v64 = v63;
  else
    v64 = 0;
  v71 = v25;
  v65 = -[AppleDoubleParser writeHeaderToDiskUpToLength:error:](self, "writeHeaderToDiskUpToLength:error:", v62 + v64, &v71);
  v66 = v71;

  if (v65)
    ((void (*)(_QWORD *, _QWORD, _QWORD))v12[2])(v12, 0, firstAttrEntry->var0);
  else
    ((void (*)(_QWORD *, uint64_t, _QWORD))v12[2])(v12, objc_msgSend(v66, "code"), 0);

LABEL_4:
}

uint64_t __56__AppleDoubleParser_allocateXattrNamed_sized_how_reply___block_invoke(uint64_t result, int a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

- (void)removeXattrNamed:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  attr_header *attrHeader;
  int v10;
  apple_double_entry *finderinfo;
  _OWORD *v12;
  BOOL v13;
  id v14;
  apple_double_entry *rsrcfork;
  uint64_t var2;
  uint64_t v17;
  BOOL v18;
  id v19;
  void *v20;
  BOOL v21;
  attr_header *v22;
  attr_entry *v23;
  unsigned int i;
  unint64_t v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  NSObject *v34;
  int v35;
  uint64_t var0;
  uint64_t v37;
  attr_header *v38;
  uint64_t var3;
  unsigned int v40;
  attr_header *v41;
  uint64_t v42;
  BOOL v43;
  id v44;
  void *v45;
  int v46;
  BOOL v47;
  attr_header *v48;
  unsigned int var4;
  unsigned int v50;
  unsigned int v51;
  BOOL v52;
  id v53;
  __int16 v54;
  unsigned int v55;
  attr_entry *firstAttrEntry;
  unint64_t v57;
  int v58;
  BOOL v59;
  uint64_t v60;
  uint64_t var1;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  uint8_t buf[4];
  const char *v69;
  __int16 v70;
  uint64_t v71;
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))v7;
  if (self->_readOnly)
  {
    (*((void (**)(id, uint64_t, _QWORD))v7 + 2))(v7, 1, 0);
    goto LABEL_39;
  }
  attrHeader = self->_attrHeader;
  if (attrHeader)
    LODWORD(attrHeader) = HIWORD(attrHeader->var6[2]);
  if (self->_rsrcfork)
    v10 = (_DWORD)attrHeader + 1;
  else
    v10 = (int)attrHeader;
  if (self->_finderinfo && !self->_emptyFinderInfo)
    ++v10;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.FinderInfo")))
  {
    finderinfo = self->_finderinfo;
    if (finderinfo && !self->_emptyFinderInfo)
    {
      v12 = (_OWORD *)((char *)&self->_attrHeader->var0.var0 + finderinfo->var1);
      *v12 = 0u;
      v12[1] = 0u;
      v67 = 0;
      v13 = -[AppleDoubleParser writeHeaderToDiskUpToLength:error:](self, "writeHeaderToDiskUpToLength:error:", 84, &v67);
      v14 = v67;
      if (v13)
      {
LABEL_15:
        ((void (**)(_QWORD, _QWORD, BOOL))v8)[2](v8, 0, v10 == 1);
LABEL_24:

        goto LABEL_39;
      }
LABEL_23:
      v8[2](v8, objc_msgSend(v14, "code"), 0);
      goto LABEL_24;
    }
    goto LABEL_38;
  }
  if (!objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.ResourceFork")))
  {
    v22 = self->_attrHeader;
    if (v22 && (v23 = self->_firstAttrEntry) != 0)
    {
      if (HIWORD(v22->var6[2]))
      {
        for (i = 0; i < HIWORD(self->_attrHeader->var6[2]); ++i)
        {
          if ((unint64_t)&v23->var3 >= -[NSMutableData bytes](self->_rawHeader, "bytes") + self->_headerSize)
            break;
          v25 = (unint64_t)v23 + ((v23->var3 + 14) & 0x1FC);
          if (v25 > -[NSMutableData bytes](self->_rawHeader, "bytes") + self->_headerSize)
            break;
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v23->var4);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v6, "isEqualToString:", v26))
          {
            v35 = HIWORD(self->_attrHeader->var6[2]) - 1;

            var0 = v23->var0;
            var1 = v23->var1;
            v37 = (objc_msgSend(v6, "length") + 15) & 0xFFFFFFFC;
            v38 = self->_attrHeader;
            var3 = v38->var3;
            v40 = v38->var4 + var3;
            if (v35 != i)
              memmove(v23, (char *)v23 + v37, (char *)v38 + var3 - ((char *)v23 + v37));
            v41 = self->_attrHeader;
            v42 = v41->var3;
            if (v40 <= 0x10000)
            {
              memmove((char *)v41 + v42 - v37, (char *)v41 + v42, (var0 - v42));
              v47 = v35 == i;
              v46 = var1;
              if (!v47)
                memmove((char *)self->_attrHeader + var0 - v37, (char *)self->_attrHeader + var0 + var1, (self->_attrHeader->var3 - (var1 + var0) + self->_attrHeader->var4));
              bzero((char *)self->_attrHeader+ self->_attrHeader->var3+ self->_attrHeader->var4- (v37 + var1), (v37 + var1));
              v45 = 0;
              v48 = self->_attrHeader;
              v50 = v48->var3;
              var4 = v48->var4;
              LODWORD(v60) = var4 + v50;
              v51 = v50 - v37;
            }
            else
            {
              HIDWORD(v60) = HIDWORD(var0);
              v64 = 0;
              v43 = -[AppleDoubleParser shiftDataUpAtOffset:length:delta:error:](self, "shiftDataUpAtOffset:length:delta:error:", v42, (var0 - v42), v37, &v64);
              v44 = v64;
              v45 = v44;
              if (!v43)
              {
                v8[2](v8, objc_msgSend(v44, "code"), 0);

                goto LABEL_39;
              }
              if (v35 == i)
              {
                v46 = var1;
              }
              else
              {
                v46 = var1;
                v63 = v44;
                v52 = -[AppleDoubleParser shiftDataUpAtOffset:length:delta:error:](self, "shiftDataUpAtOffset:length:delta:error:");
                v53 = v63;

                if (!v52)
                {
                  v8[2](v8, objc_msgSend(v53, "code"), 0);

                  goto LABEL_39;
                }
                v45 = v53;
              }
              v48 = self->_attrHeader;
              var4 = v48->var4;
              v51 = v48->var3 - v37;
              LODWORD(v60) = v51;
            }
            v54 = HIWORD(v48->var6[2]) - 1;
            HIWORD(v48->var6[2]) = v54;
            v48->var3 = v51;
            v48->var4 = var4 - v46;
            if (v54)
            {
              v55 = 0;
              firstAttrEntry = self->_firstAttrEntry;
              do
              {
                if ((unint64_t)&firstAttrEntry->var3 >= -[NSMutableData bytes](self->_rawHeader, "bytes", v60)
                                                              + self->_headerSize)
                  break;
                v57 = (unint64_t)firstAttrEntry + ((firstAttrEntry->var3 + 14) & 0x1FC);
                if (v57 > -[NSMutableData bytes](self->_rawHeader, "bytes") + self->_headerSize)
                  break;
                v58 = firstAttrEntry >= v23 ? var1 : 0;
                firstAttrEntry->var0 -= v58 + v37;
                firstAttrEntry = (attr_entry *)((char *)firstAttrEntry + ((firstAttrEntry->var3 + 14) & 0x1FC));
                ++v55;
              }
              while (v55 < HIWORD(self->_attrHeader->var6[2]));
            }
            v62 = v45;
            v59 = -[AppleDoubleParser writeHeaderToDiskUpToLength:error:](self, "writeHeaderToDiskUpToLength:error:", v60, &v62, v60);
            v14 = v62;

            if (v59)
              goto LABEL_15;
            goto LABEL_23;
          }
          v23 = (attr_entry *)((char *)v23 + ((v23->var3 + 14) & 0x1FC));

        }
      }
      doubleagent_std_log();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v69 = "-[AppleDoubleParser removeXattrNamed:reply:]";
        v70 = 2080;
        v71 = objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
        _os_log_impl(&dword_23A6D3000, v27, OS_LOG_TYPE_DEFAULT, "%s: Couldn't find xattr = %s.", buf, 0x16u);
      }
    }
    else
    {
      doubleagent_std_log();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        -[AppleDoubleParser removeXattrNamed:reply:].cold.4(v27, v28, v29);
    }

    goto LABEL_38;
  }
  rsrcfork = self->_rsrcfork;
  if (!rsrcfork || (var2 = rsrcfork->var2, !(_DWORD)var2))
  {
LABEL_38:
    v8[2](v8, 93, 0);
    goto LABEL_39;
  }
  v17 = (rsrcfork->var1 + var2);
  if (self->_fileSize == v17)
  {
    if (ftruncate(self->_fileDescriptor, v17 - var2) == -1)
    {
      doubleagent_std_log();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        -[AppleDoubleParser removeXattrNamed:reply:].cold.1(v33);

      v8[2](v8, 5, 0);
    }
    else
    {
      v66 = 0;
      v18 = -[AppleDoubleParser updateFileSize:](self, "updateFileSize:", &v66);
      v19 = v66;
      v20 = v19;
      if (v18)
      {
        self->_rsrcfork->var2 = 0;
        v65 = v19;
        v21 = -[AppleDoubleParser writeHeaderToDiskUpToLength:error:](self, "writeHeaderToDiskUpToLength:error:", 84, &v65);
        v14 = v65;

        if (v21)
          goto LABEL_15;
        goto LABEL_23;
      }
      doubleagent_std_log();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        -[AppleDoubleParser removeXattrNamed:reply:].cold.2();

      v8[2](v8, 5, 0);
    }
  }
  else
  {
    doubleagent_std_log();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      -[AppleDoubleParser removeXattrNamed:reply:].cold.3(v30, v31, v32);

    v8[2](v8, 14, 0);
  }
LABEL_39:

}

- (void)swapFileHeader
{
  int8x8_t *fileHeader;
  uint64_t v3;
  unsigned int v4;
  int8x8_t v5;
  unsigned int *v6;

  fileHeader = (int8x8_t *)self->_fileHeader;
  LODWORD(v3) = fileHeader[3].u16[0];
  v4 = bswap32(v3) >> 16;
  v5 = vrev32_s8(*fileHeader);
  if (fileHeader->u32[0] != 333319)
    LOWORD(v3) = v4;
  *fileHeader = v5;
  fileHeader[3].i16[0] = v4;
  if ((_WORD)v3)
  {
    v3 = (unsigned __int16)v3;
    v6 = (unsigned int *)((char *)&fileHeader[4] + 2);
    do
    {
      *((int8x8_t *)v6 - 1) = vrev32_s8(*(int8x8_t *)(v6 - 2));
      *v6 = bswap32(*v6);
      v6 += 3;
      --v3;
    }
    while (v3);
  }
}

- (void)swapAttrHeader:(attr_header *)a3
{
  int8x16_t v3;
  int8x16_t v4;
  unsigned int v5;
  unsigned __int16 v6;
  int v8;
  int8x8_t *p_var7;
  unint64_t v10;

  v3 = *(int8x16_t *)a3->var0.var6;
  v4 = vrev32q_s8(v3);
  v5 = bswap32(HIWORD(a3->var6[2])) >> 16;
  if (v3.i32[0] == 1096045650)
    v6 = HIWORD(a3->var6[2]);
  else
    v6 = v5;
  *(int8x16_t *)a3->var0.var6 = v4;
  a3->var4 = bswap32(a3->var4);
  LOWORD(a3->var6[2]) = bswap32(LOWORD(a3->var6[2])) >> 16;
  HIWORD(a3->var6[2]) = v5;
  if (v6)
  {
    v8 = 0;
    p_var7 = (int8x8_t *)&a3->var7;
    do
    {
      if ((unint64_t)&p_var7[1] + 2 >= -[NSMutableData bytes](self->_rawHeader, "bytes") + self->_headerSize)
        break;
      v10 = (unint64_t)p_var7 + ((p_var7[1].u8[2] + 14) & 0x1FC);
      if (v10 > -[NSMutableData bytes](self->_rawHeader, "bytes") + self->_headerSize)
        break;
      *p_var7 = vrev32_s8(*p_var7);
      p_var7[1].i16[0] = bswap32(p_var7[1].u16[0]) >> 16;
      ++v8;
      p_var7 = (int8x8_t *)((char *)p_var7 + ((p_var7[1].u8[2] + 14) & 0x1FC));
    }
    while ((unsigned __int16)v8 < v6);
  }
}

- (BOOL)shiftDataDownAtOffset:(unsigned int)a3 length:(unsigned int)a4 delta:(unint64_t)a5 error:(id *)a6
{
  BOOL v6;
  uint64_t v12;
  void *v13;
  unsigned int i;
  int fileDescriptor;
  id v16;
  ssize_t v17;
  NSObject *v18;

  v6 = 1;
  if (a4 && a5)
  {
    if (a4 >= 0x1000)
      v12 = 4096;
    else
      v12 = a4;
    objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = a4 + a3 - v12; i >= a3; i -= v12)
    {
      fileDescriptor = self->_fileDescriptor;
      v16 = objc_retainAutorelease(v13);
      v17 = pread(fileDescriptor, (void *)objc_msgSend(v16, "mutableBytes"), v12, i);
      if (v17 == -1)
      {
        doubleagent_std_log();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          -[AppleDoubleParser shiftDataDownAtOffset:length:delta:error:].cold.2(v18);
        goto LABEL_22;
      }
      if (pwrite(self->_fileDescriptor, (const void *)objc_msgSend(objc_retainAutorelease(v16), "bytes"), v17, i + a5) == -1)
      {
        doubleagent_std_log();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          -[AppleDoubleParser shiftDataDownAtOffset:length:delta:error:].cold.3(v18);
        goto LABEL_22;
      }
      if (v12 >= i - a3)
        LODWORD(v12) = i - a3;
      if (!(_DWORD)v12)
        break;
    }
    if (-[AppleDoubleParser updateFileSize:](self, "updateFileSize:", a6))
    {
      v6 = 1;
      goto LABEL_23;
    }
    doubleagent_std_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[AppleDoubleParser shiftDataDownAtOffset:length:delta:error:].cold.1();
LABEL_22:

    v6 = 0;
LABEL_23:

  }
  return v6;
}

- (BOOL)shiftDataUpAtOffset:(unsigned int)a3 length:(unsigned int)a4 delta:(unint64_t)a5 error:(id *)a6
{
  BOOL v6;
  uint64_t v11;
  void *v12;
  unsigned int v13;
  size_t v14;
  int fileDescriptor;
  id v16;
  ssize_t v17;
  NSObject *v18;

  v6 = 1;
  if (a4 && a5)
  {
    if (a4 >= 0x1000)
      v11 = 4096;
    else
      v11 = a4;
    objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = a4 + a3;
    if (a4 + a3 > a3)
    {
      LODWORD(v14) = v11;
      do
      {
        v14 = v14 >= v13 - a3 ? v13 - a3 : v14;
        if (!(_DWORD)v14)
          break;
        fileDescriptor = self->_fileDescriptor;
        v16 = objc_retainAutorelease(v12);
        v17 = pread(fileDescriptor, (void *)objc_msgSend(v16, "mutableBytes"), v14, a3);
        if (v17 == -1)
        {
          doubleagent_std_log();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            -[AppleDoubleParser shiftDataUpAtOffset:length:delta:error:].cold.2(v18);
          goto LABEL_23;
        }
        if (pwrite(self->_fileDescriptor, (const void *)objc_msgSend(objc_retainAutorelease(v16), "bytes"), v17, a3 - a5) == -1)
        {
          doubleagent_std_log();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            -[AppleDoubleParser shiftDataUpAtOffset:length:delta:error:].cold.3(v18);
          goto LABEL_23;
        }
        a3 += v14;
      }
      while (a3 < v13);
    }
    if (-[AppleDoubleParser updateFileSize:](self, "updateFileSize:", a6))
    {
      v6 = 1;
    }
    else
    {
      doubleagent_std_log();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[AppleDoubleParser shiftDataUpAtOffset:length:delta:error:].cold.1();
LABEL_23:

      v6 = 0;
    }

  }
  return v6;
}

- (BOOL)fillEmptyAppleDoubleFile:(id *)a3
{
  id v4;
  uint64_t v5;
  int fileDescriptor;
  id v7;
  ssize_t v8;
  NSObject *v9;

  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", 4096);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = objc_msgSend(v4, "mutableBytes");
  *(_QWORD *)v5 = 0x20007160500;
  *(_WORD *)(v5 + 24) = 512;
  *(_OWORD *)(v5 + 26) = xmmword_23A6D84D0;
  *(_QWORD *)(v5 + 42) = 0x1E010000E20E0000;
  *(_OWORD *)(v5 + 8) = *(_OWORD *)"Mac OS X        ";
  *(_OWORD *)(v5 + 84) = xmmword_23A6D84E0;
  -[AppleDoubleParser initEmptyResourceFork:](self, "initEmptyResourceFork:", v5 + 3810);
  fileDescriptor = self->_fileDescriptor;
  v7 = objc_retainAutorelease(v4);
  v8 = pwrite(fileDescriptor, (const void *)objc_msgSend(v7, "bytes"), 0x1000uLL, 0);
  if (v8 == 4096)
  {
    *(int64x2_t *)&self->_fileSize = vdupq_n_s64(0x1000uLL);
  }
  else
  {
    doubleagent_std_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[AppleDoubleParser fillEmptyAppleDoubleFile:].cold.1(v9);

  }
  return v8 == 4096;
}

- (void)initEmptyResourceFork:(rsrcfork_header *)a3
{
  *(_OWORD *)&a3->var6 = 0u;
  *(_OWORD *)&a3->var0 = 0u;
  *(_OWORD *)a3->var4 = 0u;
  *(_OWORD *)((char *)&a3->var9 + 2) = 0u;
  *(_QWORD *)&a3->var0 = 0x1000000010000;
  *(_QWORD *)&a3->var6 = 0x1000000010000;
  *(_OWORD *)a3->var4 = *(_OWORD *)"This resource fork intentionally left blank   ";
  *(_OWORD *)&a3->var4[16] = 0u;
  a3->var3 = 503316480;
  a3->var9 = 503316480;
  *(_DWORD *)&a3->var14 = 503323648;
  a3->var16 = -1;
  *(_OWORD *)&a3->var5[96] = 0u;
  *(_OWORD *)&a3->var5[112] = 0u;
  *(_OWORD *)&a3->var5[64] = 0u;
  *(_OWORD *)&a3->var5[80] = 0u;
  *(_OWORD *)&a3->var5[32] = 0u;
  *(_OWORD *)&a3->var5[48] = 0u;
  *(_OWORD *)a3->var5 = 0u;
  *(_OWORD *)&a3->var5[16] = 0u;
  *(_OWORD *)&a3->var4[80] = 0u;
  *(_OWORD *)&a3->var4[96] = 0u;
  *(_OWORD *)&a3->var4[48] = 0u;
  *(_OWORD *)&a3->var4[64] = 0u;
  *(_OWORD *)&a3->var4[16] = *(_OWORD *)"rk intentionally left blank   ";
  *(_OWORD *)&a3->var4[32] = 0u;
  strcpy((char *)&a3->var4[31], "y left blank   ");
}

- (BOOL)updateFileSize:(id *)a3
{
  int v5;
  NSObject *v6;
  stat v8;

  memset(&v8, 0, sizeof(v8));
  v5 = fstat(self->_fileDescriptor, &v8);
  if (v5)
  {
    doubleagent_std_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[AppleDoubleParser updateFileSize:].cold.1(v6);

    if (a3)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], *__error(), 0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    -[AppleDoubleParser updateFileSizeExplicit:](self, "updateFileSizeExplicit:", v8.st_size);
  }
  return v5 == 0;
}

- (void)updateFileSizeExplicit:(int64_t)a3
{
  int64_t v3;
  unint64_t v4;

  if ((unint64_t)a3 >= 0x10000)
    v3 = 0x10000;
  else
    v3 = a3;
  if (self->_isAllocateXattr)
    v4 = 0x10000;
  else
    v4 = v3;
  self->_fileSize = a3;
  self->_headerSize = v4;
}

- (BOOL)readRawHeader:(id *)a3
{
  uint64_t *p_headerSize;
  NSMutableData *v5;
  NSMutableData *rawHeader;
  NSMutableData *v7;
  NSObject *v9;
  uint64_t v10;

  p_headerSize = (uint64_t *)&self->_headerSize;
  v5 = (NSMutableData *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", self->_headerSize);
  rawHeader = self->_rawHeader;
  self->_rawHeader = v5;

  v7 = self->_rawHeader;
  if (v7)
  {
    if (pread(self->_fileDescriptor, -[NSMutableData mutableBytes](v7, "mutableBytes"), self->_headerSize, 0) != -1)
      return 1;
    doubleagent_std_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[AppleDoubleParser readRawHeader:].cold.2(v9);
  }
  else
  {
    doubleagent_std_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[AppleDoubleParser readRawHeader:].cold.1(p_headerSize, v9, v10);
  }

  return 0;
}

- (BOOL)writeHeaderToDiskUpToLength:(unsigned int)a3 error:(id *)a4
{
  unsigned int v4;
  ssize_t v6;
  uint64_t v7;
  NSObject *v9;
  NSObject *v10;

  v4 = a3;
  -[AppleDoubleParser swapFileHeader](self, "swapFileHeader", *(_QWORD *)&a3, a4);
  if (self->_attrHeader)
    -[AppleDoubleParser swapAttrHeader:](self, "swapAttrHeader:");
  if (-[NSMutableData length](self->_rawHeader, "length") < v4)
    v4 = -[NSMutableData length](self->_rawHeader, "length");
  v6 = pwrite(self->_fileDescriptor, (const void *)-[NSMutableData bytes](self->_rawHeader, "bytes"), v4, 0);
  if (v6 == -1)
  {
    doubleagent_std_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[AppleDoubleParser writeHeaderToDiskUpToLength:error:].cold.1(v9);

    return 0;
  }
  v7 = v6;
  if (v6 != v4)
  {
    doubleagent_std_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[AppleDoubleParser writeHeaderToDiskUpToLength:error:].cold.2(v4, v7, v10);

    return 0;
  }
  -[AppleDoubleParser swapFileHeader](self, "swapFileHeader");
  if (self->_attrHeader)
    -[AppleDoubleParser swapAttrHeader:](self, "swapAttrHeader:");
  return 1;
}

- (BOOL)parseFileHeader:(id *)a3
{
  apple_double_header *v5;
  unsigned int var1;
  unsigned int var0;
  unsigned int var3;
  uint64_t v9;
  BOOL v10;
  unint64_t v12;
  id v13;
  BOOL result;
  uint64_t v15;
  char *v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  _DWORD *v21;
  unint64_t v22;

  if (self->_headerSize > 0x77)
  {
    v5 = (apple_double_header *)-[NSMutableData bytes](self->_rawHeader, "bytes");
    var0 = v5->var0;
    var1 = v5->var1;
    v5->var0 = bswap32(v5->var0);
    v5->var1 = bswap32(var1);
    var3 = v5->var3;
    v9 = __rev16(var3);
    v5->var3 = v9;
    if (var0 == 118883584)
    {
      v10 = var1 != 512 || var3 == 0;
      if (!v10 && v9 < 0x10)
      {
        v12 = 12 * v9 + 26;
        if (self->_headerSize >= v12)
        {
          v15 = 0;
          while (1)
          {
            v16 = (char *)v5 + 12 * v15;
            *(_DWORD *)(v16 + 26) = bswap32(*(_DWORD *)(v16 + 26));
            v17 = bswap32(*(_DWORD *)(v16 + 30));
            *(_DWORD *)(v16 + 30) = v17;
            v18 = bswap32(*(_DWORD *)(v16 + 34));
            *(_DWORD *)(v16 + 34) = v18;
            if (v12 > v17)
              break;
            v19 = v18 + v17;
            if (v19 > self->_fileSize)
              break;
            v20 = v15;
            v21 = (unsigned int *)((char *)&v5->var4[0].var1 + 2);
            if (v15)
            {
              do
              {
                v22 = *(v21 - 1);
                if (v19 > v22 && *v21 + (int)v22 > v17)
                  goto LABEL_11;
                v21 += 3;
              }
              while (--v20);
            }
            if (++v15 == v9)
            {
              self->_fileHeader = v5;
              return 1;
            }
          }
        }
      }
    }
  }
LABEL_11:
  if (!a3)
    return 0;
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 93, 0);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  result = 0;
  *a3 = v13;
  return result;
}

- (BOOL)parseFinderInfoAndResourceFork:(id *)a3
{
  apple_double_header *fileHeader;
  BOOL v4;
  unint64_t v7;
  unint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  int v19;
  ssize_t v20;
  NSObject *v21;
  NSObject *v23;
  uint8_t v25[4];
  uint64_t v26;
  _OWORD __buf[3];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  fileHeader = self->_fileHeader;
  v4 = 1;
  if (!fileHeader->var3)
    return v4;
  v7 = 0;
  v8 = 0;
  while (1)
  {
    v9 = *(unsigned int *)((char *)&fileHeader->var2[v7 / 4 + 4] + 2);
    if (v9 != 2)
      break;
    v19 = *(unsigned int *)((char *)&fileHeader->var4[v7 / 0xC].var1 + 2);
    if (v19 == 286)
    {
      if (self->_isAllocateXattr)
        goto LABEL_31;
      v20 = pread(self->_fileDescriptor, __buf, 0x2FuLL, *(unsigned int *)((char *)&fileHeader->var4[v7 / 0xC].var0 + 2) + 16);
      if (v20 != 47)
      {
        if (v20 == -1)
        {
          doubleagent_std_log();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            -[AppleDoubleParser parseFinderInfoAndResourceFork:].cold.2(v23);

          return 0;
        }
LABEL_30:
        fileHeader = self->_fileHeader;
LABEL_31:
        if (v8 != fileHeader->var3 - 1)
        {
          doubleagent_std_log();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            -[AppleDoubleParser parseFinderInfoAndResourceFork:].cold.1(v25, &v26, v21);

          self->_readOnly = 1;
          fileHeader = self->_fileHeader;
        }
        self->_rsrcfork = (apple_double_entry *)((char *)&fileHeader->var2[v7 / 4 + 4] + 2);
        goto LABEL_36;
      }
      if (strcmp((const char *)__buf, "This resource fork intentionally left blank   "))
        goto LABEL_30;
      fileHeader = self->_fileHeader;
    }
    else if (v19 || self->_isAllocateXattr)
    {
      goto LABEL_31;
    }
LABEL_36:
    ++v8;
    v7 += 12;
    if (v8 >= fileHeader->var3)
      return 1;
  }
  if (v9 != 9 || *(unsigned int *)((char *)&fileHeader->var4[v7 / 0xC].var1 + 2) < 0x20)
    goto LABEL_36;
  v10 = *(unsigned int *)((char *)&fileHeader->var4[v7 / 0xC].var0 + 2);
  if (v10 <= 0xFFFFFFDF && self->_headerSize >= v10 + 32)
  {
    memset(__buf, 0, 32);
    v11 = (uint64_t *)((char *)fileHeader + v10);
    v12 = *v11;
    v13 = v11[1];
    v15 = v11[2];
    v14 = v11[3];
    if (v12)
      v16 = 0;
    else
      v16 = v13 == 0;
    if (v16 && v15 == 0 && v14 == 0)
      self->_emptyFinderInfo = 1;
    self->_finderinfo = (apple_double_entry *)((char *)&fileHeader->var2[v7 / 4 + 4] + 2);
    goto LABEL_36;
  }
  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 93, 0);
    v4 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    return v4;
  }
  return 0;
}

- (BOOL)parseAttrHeader:(id *)a3
{
  apple_double_header *finderinfo;
  BOOL result;
  uint64_t v7;
  uint64_t v8;
  int8x16_t v9;
  int8x16_t v10;
  unsigned int v11;
  unint64_t v12;
  unint64_t v14;
  unsigned int v15;
  id v16;
  attr_entry *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t var3;
  uint64_t v21;
  uint64_t v22;
  unsigned int v23;
  uint64_t v24;
  BOOL v25;

  finderinfo = (apple_double_header *)self->_finderinfo;
  if (!finderinfo || finderinfo != (apple_double_header *)(&self->_fileHeader->var3 + 1) || finderinfo->var2[0] < 0x24)
    return 1;
  if (finderinfo->var1 == 50)
  {
    v7 = -[NSMutableData bytes](self->_rawHeader, "bytes");
    if (v7)
    {
      v8 = v7;
      v9 = *(int8x16_t *)(v7 + 84);
      v10 = vrev32q_s8(v9);
      *(int8x16_t *)(v7 + 84) = v10;
      v11 = bswap32(*(_DWORD *)(v7 + 100));
      *(_DWORD *)(v7 + 100) = v11;
      *(_WORD *)(v7 + 116) = bswap32(*(unsigned __int16 *)(v7 + 116)) >> 16;
      *(_WORD *)(v7 + 118) = bswap32(*(unsigned __int16 *)(v7 + 118)) >> 16;
      if (v9.i32[0] == 1381258305)
      {
        v12 = v10.u32[3] + (unint64_t)v11;
        if (v10.i32[2] == self->_finderinfo->var2 + self->_finderinfo->var1 && v12 <= v10.u32[2] && v10.i32[3] > 0x77u)
        {
          v14 = -[NSMutableData bytes](self->_rawHeader, "bytes") + *(unsigned int *)(v7 + 96);
          if (v14 <= -[NSMutableData bytes](self->_rawHeader, "bytes") + self->_headerSize)
          {
            v15 = *(unsigned __int16 *)(v8 + 118);
            if (v15 < 0x101)
            {
              v17 = (attr_entry *)(v8 + 120);
              v18 = 0;
              if (*(_WORD *)(v8 + 118))
              {
                v19 = 120;
                while ((unint64_t)&v17[1] <= v14)
                {
                  var3 = v17->var3;
                  if ((unint64_t)&v17->var4[var3] > v14)
                    break;
                  if (strnlen((const char *)v17->var4, v17->var3) != var3 - 1)
                    break;
                  v21 = bswap32(v17->var0);
                  v22 = bswap32(v17->var1);
                  v17->var0 = v21;
                  v17->var1 = v22;
                  v17->var2 = bswap32(v17->var2) >> 16;
                  if (v22 + v21 > (unint64_t)*(unsigned int *)(v8 + 92))
                    break;
                  v23 = *(_DWORD *)(v8 + 96);
                  if (v21 < v23)
                    break;
                  if (v22 + v21 > v12)
                    break;
                  v24 = ((_WORD)var3 + 14) & 0x1FC;
                  v25 = __CFADD__(v19, v24);
                  v19 += v24;
                  if (v25)
                    break;
                  v25 = __CFADD__(v18, v22);
                  v18 += v22;
                  if (v25)
                    break;
                  v17 = (attr_entry *)((char *)v17 + v24);
                  if (!--v15)
                  {
                    v17 = (attr_entry *)(v8 + 120);
                    goto LABEL_31;
                  }
                }
              }
              else
              {
                v23 = *(_DWORD *)(v8 + 96);
                v19 = 120;
LABEL_31:
                if (v19 <= v23 && v18 == *(_DWORD *)(v8 + 100))
                {
                  self->_attrHeader = (attr_header *)v8;
                  self->_firstAttrEntry = v17;
                  return 1;
                }
              }
            }
          }
        }
      }
    }
  }
  if (!a3)
    return 0;
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 93, 0);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  result = 0;
  *a3 = v16;
  return result;
}

- (BOOL)createAttrHeaderIfNeeded:(id *)a3
{
  apple_double_header *fileHeader;
  apple_double_entry *finderinfo;
  size_t v7;
  uint64_t v8;
  uint64_t v9;
  apple_double_entry *rsrcfork;
  uint64_t var2;
  apple_double_entry *v12;
  apple_double_header *v13;
  size_t v14;
  ssize_t v15;
  uint64_t v16;
  NSObject *v18;

  fileHeader = self->_fileHeader;
  if (fileHeader->var3 != 2)
    return 1;
  finderinfo = self->_finderinfo;
  if (*(_OWORD *)&self->_finderinfo != __PAIR128__((unint64_t)&fileHeader->var4[0].var2 + 2, (unint64_t)(&fileHeader->var3 + 1))|| finderinfo->var1 != 50|| finderinfo->var2 != 32|| !self->_isAllocateXattr)
  {
    return 1;
  }
  v7 = 4064 - *(unsigned int *)((char *)&fileHeader->var4[0].var0 + 2);
  v8 = -[NSMutableData bytes](self->_rawHeader, "bytes");
  v9 = v8;
  rsrcfork = self->_rsrcfork;
  if (rsrcfork && (var2 = rsrcfork->var2, (_DWORD)var2))
  {
    if (!-[AppleDoubleParser shiftDataDownAtOffset:length:delta:error:](self, "shiftDataDownAtOffset:length:delta:error:", rsrcfork->var1, var2, v7, a3))
    {
      doubleagent_std_log();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[AppleDoubleParser createAttrHeaderIfNeeded:].cold.3();
      goto LABEL_21;
    }
    v12 = self->_rsrcfork;
    v13 = self->_fileHeader;
    v14 = 120;
  }
  else
  {
    v7 -= 286;
    bzero((void *)(v8 + 82), v7);
    -[AppleDoubleParser initEmptyResourceFork:](self, "initEmptyResourceFork:", (char *)self->_fileHeader + *(unsigned int *)((char *)&self->_fileHeader->var4[1].var0 + 2) + v7);
    v13 = self->_fileHeader;
    v12 = (apple_double_entry *)((char *)&v13->var4[0].var2 + 2);
    *(unsigned int *)((char *)&v13->var4[1].var1 + 2) = 286;
    self->_rsrcfork = (apple_double_entry *)((char *)&v13->var4[0].var2 + 2);
    v14 = 4096;
  }
  self->_finderinfo->var2 += v7;
  v12->var1 += v7;
  *(_QWORD *)(v9 + 84) = 1096045650;
  *(_DWORD *)(v9 + 92) = *(unsigned int *)((char *)&v13->var4[1].var0 + 2);
  *(_DWORD *)(v9 + 96) = 120;
  *(_QWORD *)(v9 + 100) = 0;
  *(_QWORD *)(v9 + 108) = 0;
  *(_DWORD *)(v9 + 116) = 0;
  -[AppleDoubleParser swapFileHeader](self, "swapFileHeader");
  -[AppleDoubleParser swapAttrHeader:](self, "swapAttrHeader:", v9);
  v15 = pwrite(self->_fileDescriptor, (const void *)-[NSMutableData bytes](self->_rawHeader, "bytes"), v14, 0);
  if (v15 == -1)
  {
    doubleagent_std_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[AppleDoubleParser createAttrHeaderIfNeeded:].cold.1(v18);
  }
  else
  {
    v16 = v15;
    if (v15 == v14)
    {
      -[AppleDoubleParser swapFileHeader](self, "swapFileHeader");
      return 1;
    }
    doubleagent_std_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[AppleDoubleParser createAttrHeaderIfNeeded:].cold.2(v14, v16, v18);
  }
LABEL_21:

  return 0;
}

- (AppleDoubleParser)initWithFileDescriptor:(int)a3 fileSize:(int64_t)a4 isAllocateXattr:(BOOL)a5
{
  AppleDoubleParser *v8;
  AppleDoubleParser *v9;
  void *v10;
  id v11;
  AppleDoubleParser *v12;
  BOOL v13;
  id v14;
  BOOL v15;
  BOOL v16;
  id v17;
  BOOL v18;
  BOOL v19;
  BOOL v20;
  NSObject *v21;
  BOOL v22;
  NSObject *v23;
  NSObject *v24;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  objc_super v33;
  uint8_t buf[4];
  const char *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v33.receiver = self;
  v33.super_class = (Class)AppleDoubleParser;
  v8 = -[AppleDoubleParser init](&v33, sel_init);
  v9 = v8;
  if (!v8)
  {
    v11 = 0;
LABEL_5:
    v12 = v9;
    goto LABEL_34;
  }
  v8->_fileDescriptor = a3;
  v8->_isAllocateXattr = a5;
  if (a4 < 0)
  {
    v32 = 0;
    v13 = -[AppleDoubleParser updateFileSize:](v8, "updateFileSize:", &v32);
    v14 = v32;
    v11 = v14;
    if (!v13)
    {
      doubleagent_std_log();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        -[AppleDoubleParser initWithFileDescriptor:fileSize:isAllocateXattr:].cold.7();
      goto LABEL_33;
    }
    v10 = v14;
  }
  else
  {
    -[AppleDoubleParser updateFileSizeExplicit:](v8, "updateFileSizeExplicit:", a4);
    v10 = 0;
  }
  if (v9->_fileSize)
  {
LABEL_9:
    v30 = v10;
    v15 = -[AppleDoubleParser readRawHeader:](v9, "readRawHeader:", &v30);
    v11 = v30;

    if (!v15)
    {
      doubleagent_std_log();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        -[AppleDoubleParser initWithFileDescriptor:fileSize:isAllocateXattr:].cold.5();
      goto LABEL_33;
    }
    v29 = v11;
    v16 = -[AppleDoubleParser parseFileHeader:](v9, "parseFileHeader:", &v29);
    v17 = v29;

    if (v16)
    {
      v28 = v17;
      v18 = -[AppleDoubleParser parseFinderInfoAndResourceFork:](v9, "parseFinderInfoAndResourceFork:", &v28);
      v11 = v28;

      if (!v18)
      {
        doubleagent_std_log();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          -[AppleDoubleParser initWithFileDescriptor:fileSize:isAllocateXattr:].cold.3();
        goto LABEL_33;
      }
      v27 = v11;
      v19 = -[AppleDoubleParser createAttrHeaderIfNeeded:](v9, "createAttrHeaderIfNeeded:", &v27);
      v17 = v27;

      if (v19)
      {
        v26 = v17;
        v20 = -[AppleDoubleParser parseAttrHeader:](v9, "parseAttrHeader:", &v26);
        v11 = v26;

        if (!v20)
        {
          doubleagent_std_log();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            -[AppleDoubleParser initWithFileDescriptor:fileSize:isAllocateXattr:].cold.1();
LABEL_33:

          v12 = 0;
          goto LABEL_34;
        }
        goto LABEL_5;
      }
      doubleagent_std_log();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        -[AppleDoubleParser initWithFileDescriptor:fileSize:isAllocateXattr:].cold.2();
    }
    else
    {
      doubleagent_std_log();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        -[AppleDoubleParser initWithFileDescriptor:fileSize:isAllocateXattr:].cold.4();
    }

    v12 = 0;
    v11 = v17;
    goto LABEL_34;
  }
  if (v9->_isAllocateXattr)
  {
    v31 = v10;
    v22 = -[AppleDoubleParser fillEmptyAppleDoubleFile:](v9, "fillEmptyAppleDoubleFile:", &v31);
    v11 = v31;

    if (!v22)
    {
      doubleagent_std_log();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        -[AppleDoubleParser initWithFileDescriptor:fileSize:isAllocateXattr:].cold.6();
      goto LABEL_33;
    }
    v10 = v11;
    goto LABEL_9;
  }
  doubleagent_std_log();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v35 = "-[AppleDoubleParser initWithFileDescriptor:fileSize:isAllocateXattr:]";
    _os_log_impl(&dword_23A6D3000, v24, OS_LOG_TYPE_DEFAULT, "%s: Couldn't parse an empty AD file (isAllocateXattr = false).", buf, 0xCu);
  }

  v12 = 0;
  v11 = v10;
LABEL_34:

  return v12;
}

- (AppleDoubleParser)initWithFileDescriptor:(int)a3 isAllocateXattr:(BOOL)a4
{
  return -[AppleDoubleParser initWithFileDescriptor:fileSize:isAllocateXattr:](self, "initWithFileDescriptor:fileSize:isAllocateXattr:", *(_QWORD *)&a3, -1, a4);
}

- (int)fileDescriptor
{
  return self->_fileDescriptor;
}

- (void)setFileDescriptor:(int)a3
{
  self->_fileDescriptor = a3;
}

- (NSMutableData)rawHeader
{
  return (NSMutableData *)objc_getProperty(self, a2, 16, 1);
}

- (void)setRawHeader:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (unint64_t)fileSize
{
  return self->_fileSize;
}

- (void)setFileSize:(unint64_t)a3
{
  self->_fileSize = a3;
}

- (unint64_t)headerSize
{
  return self->_headerSize;
}

- (void)setHeaderSize:(unint64_t)a3
{
  self->_headerSize = a3;
}

- (BOOL)emptyFinderInfo
{
  return self->_emptyFinderInfo;
}

- (void)setEmptyFinderInfo:(BOOL)a3
{
  self->_emptyFinderInfo = a3;
}

- (BOOL)readOnly
{
  return self->_readOnly;
}

- (void)setReadOnly:(BOOL)a3
{
  self->_readOnly = a3;
}

- (BOOL)isAllocateXattr
{
  return self->_isAllocateXattr;
}

- (void)setIsAllocateXattr:(BOOL)a3
{
  self->_isAllocateXattr = a3;
}

- (apple_double_header)fileHeader
{
  return self->_fileHeader;
}

- (void)setFileHeader:(apple_double_header *)a3
{
  self->_fileHeader = a3;
}

- (apple_double_entry)finderinfo
{
  return self->_finderinfo;
}

- (void)setFinderinfo:(apple_double_entry *)a3
{
  self->_finderinfo = a3;
}

- (apple_double_entry)rsrcfork
{
  return self->_rsrcfork;
}

- (void)setRsrcfork:(apple_double_entry *)a3
{
  self->_rsrcfork = a3;
}

- (attr_header)attrHeader
{
  return self->_attrHeader;
}

- (void)setAttrHeader:(attr_header *)a3
{
  self->_attrHeader = a3;
}

- (attr_entry)firstAttrEntry
{
  return self->_firstAttrEntry;
}

- (void)setFirstAttrEntry:(attr_entry *)a3
{
  self->_firstAttrEntry = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawHeader, 0);
}

- (void)allocateXattrNamed:(NSObject *)a1 sized:how:reply:.cold.1(NSObject *a1)
{
  int *v2;
  uint64_t v3;
  int v4[6];

  v2 = OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(v2);
  v4[0] = 136315394;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23A6D3000, a1, v3, "%s: Couldn't truncate the file. error = %s.", (uint8_t *)v4);
  OUTLINED_FUNCTION_3();
}

- (void)allocateXattrNamed:sized:how:reply:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23A6D3000, v0, v1, "%s: Couldn't write header to disk. error = %@.", (uint8_t *)v2);
  OUTLINED_FUNCTION_4();
}

- (void)allocateXattrNamed:sized:how:reply:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23A6D3000, v0, v1, "%s: Couldn't update file size. error = %@.", (uint8_t *)v2);
  OUTLINED_FUNCTION_4();
}

- (void)allocateXattrNamed:(uint64_t)a3 sized:how:reply:.cold.4(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 136315394;
  v4 = "-[AppleDoubleParser allocateXattrNamed:sized:how:reply:]";
  v5 = 1024;
  v6 = 256;
  OUTLINED_FUNCTION_9(&dword_23A6D3000, a1, a3, "%s: Can't add any more xattrs, as we've reached the limit (%u).", (uint8_t *)&v3);
  OUTLINED_FUNCTION_4();
}

- (void)removeXattrNamed:(NSObject *)a1 reply:.cold.1(NSObject *a1)
{
  int *v2;
  uint64_t v3;
  int v4[6];

  v2 = OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(v2);
  v4[0] = 136315394;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23A6D3000, a1, v3, "%s: Couldn't truncate the file. error = %s.", (uint8_t *)v4);
  OUTLINED_FUNCTION_3();
}

- (void)removeXattrNamed:reply:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23A6D3000, v0, v1, "%s: Couldn't get file size. error = %@.", (uint8_t *)v2);
  OUTLINED_FUNCTION_4();
}

- (void)removeXattrNamed:(uint64_t)a3 reply:.cold.3(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 136315138;
  v4 = "-[AppleDoubleParser removeXattrNamed:reply:]";
  OUTLINED_FUNCTION_8(&dword_23A6D3000, a1, a3, "%s: Shouldn't reach here. Resource fork is not at EOF.", (uint8_t *)&v3);
  OUTLINED_FUNCTION_4();
}

- (void)removeXattrNamed:(uint64_t)a3 reply:.cold.4(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 136315138;
  v4 = "-[AppleDoubleParser removeXattrNamed:reply:]";
  OUTLINED_FUNCTION_8(&dword_23A6D3000, a1, a3, "%s: There's no attribute header.", (uint8_t *)&v3);
  OUTLINED_FUNCTION_4();
}

- (void)shiftDataDownAtOffset:length:delta:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_23A6D3000, v0, v1, "%s: Couldn't get file size. error = %@.", (uint8_t *)v2);
  OUTLINED_FUNCTION_4();
}

- (void)shiftDataDownAtOffset:(NSObject *)a1 length:delta:error:.cold.2(NSObject *a1)
{
  int *v2;
  uint64_t v3;
  int v4[6];

  v2 = OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(v2);
  v4[0] = 136315394;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23A6D3000, a1, v3, "%s: pread() failed with error = %s.", (uint8_t *)v4);
  OUTLINED_FUNCTION_3();
}

- (void)shiftDataDownAtOffset:(NSObject *)a1 length:delta:error:.cold.3(NSObject *a1)
{
  int *v2;
  uint64_t v3;
  int v4[6];

  v2 = OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(v2);
  v4[0] = 136315394;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23A6D3000, a1, v3, "%s: pwrite() failed with error = %s.", (uint8_t *)v4);
  OUTLINED_FUNCTION_3();
}

- (void)shiftDataUpAtOffset:length:delta:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_23A6D3000, v0, v1, "%s: Couldn't get file size. error = %@.", (uint8_t *)v2);
  OUTLINED_FUNCTION_4();
}

- (void)shiftDataUpAtOffset:(NSObject *)a1 length:delta:error:.cold.2(NSObject *a1)
{
  int *v2;
  uint64_t v3;
  int v4[6];

  v2 = OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(v2);
  v4[0] = 136315394;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23A6D3000, a1, v3, "%s: pread() failed with error = %s.", (uint8_t *)v4);
  OUTLINED_FUNCTION_3();
}

- (void)shiftDataUpAtOffset:(NSObject *)a1 length:delta:error:.cold.3(NSObject *a1)
{
  int *v2;
  uint64_t v3;
  int v4[6];

  v2 = OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(v2);
  v4[0] = 136315394;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23A6D3000, a1, v3, "%s: pwrite() failed with error = %s.", (uint8_t *)v4);
  OUTLINED_FUNCTION_3();
}

- (void)fillEmptyAppleDoubleFile:(NSObject *)a1 .cold.1(NSObject *a1)
{
  int *v2;
  uint64_t v3;
  int v4[6];

  v2 = OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(v2);
  v4[0] = 136315394;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23A6D3000, a1, v3, "%s: pwrite() failed with error = %s.", (uint8_t *)v4);
  OUTLINED_FUNCTION_3();
}

- (void)updateFileSize:(NSObject *)a1 .cold.1(NSObject *a1)
{
  int v2;
  uint64_t v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;

  v2 = *OUTLINED_FUNCTION_5();
  v4 = 136315394;
  v5 = "-[AppleDoubleParser updateFileSize:]";
  v6 = 1024;
  v7 = v2;
  OUTLINED_FUNCTION_9(&dword_23A6D3000, a1, v3, "%s: fstat failed with error = %d", (uint8_t *)&v4);
  OUTLINED_FUNCTION_3();
}

- (void)readRawHeader:(uint64_t)a3 .cold.1(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = 136315394;
  v5 = "-[AppleDoubleParser readRawHeader:]";
  v6 = 2048;
  v7 = v3;
  OUTLINED_FUNCTION_0(&dword_23A6D3000, a2, a3, "%s: seekToOffset failed to init mutable data with size %zu", (uint8_t *)&v4);
  OUTLINED_FUNCTION_4();
}

- (void)readRawHeader:(NSObject *)a1 .cold.2(NSObject *a1)
{
  int *v2;
  uint64_t v3;
  int v4[6];

  v2 = OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(v2);
  v4[0] = 136315394;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23A6D3000, a1, v3, "%s: pread() failed with error = %s.", (uint8_t *)v4);
  OUTLINED_FUNCTION_3();
}

- (void)writeHeaderToDiskUpToLength:(NSObject *)a1 error:.cold.1(NSObject *a1)
{
  int *v2;
  uint64_t v3;
  int v4[6];

  v2 = OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(v2);
  v4[0] = 136315394;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23A6D3000, a1, v3, "%s: pwrite() failed with error = %s.", (uint8_t *)v4);
  OUTLINED_FUNCTION_3();
}

- (void)writeHeaderToDiskUpToLength:(os_log_t)log error:.cold.2(int a1, uint64_t a2, os_log_t log)
{
  int v3;
  const char *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = 136315650;
  v4 = "-[AppleDoubleParser writeHeaderToDiskUpToLength:error:]";
  v5 = 1024;
  v6 = a1;
  v7 = 2048;
  v8 = a2;
  _os_log_error_impl(&dword_23A6D3000, log, OS_LOG_TYPE_ERROR, "%s: pwrite() short write expected %u got %zd", (uint8_t *)&v3, 0x1Cu);
}

- (void)parseFinderInfoAndResourceFork:(NSObject *)a3 .cold.1(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "-[AppleDoubleParser parseFinderInfoAndResourceFork:]";
  OUTLINED_FUNCTION_8(&dword_23A6D3000, a3, (uint64_t)a3, "%s: The resource fork is not the last entry. Setting the file as 'readOnly'.", a1);
}

- (void)parseFinderInfoAndResourceFork:(NSObject *)a1 .cold.2(NSObject *a1)
{
  int *v2;
  uint64_t v3;
  int v4[6];

  v2 = OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(v2);
  v4[0] = 136315394;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23A6D3000, a1, v3, "%s: pread() of rsrcfork failed with error = %s.", (uint8_t *)v4);
  OUTLINED_FUNCTION_3();
}

- (void)createAttrHeaderIfNeeded:(NSObject *)a1 .cold.1(NSObject *a1)
{
  int *v2;
  uint64_t v3;
  int v4[6];

  v2 = OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(v2);
  v4[0] = 136315394;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23A6D3000, a1, v3, "%s: pwrite() failed with error = %s.", (uint8_t *)v4);
  OUTLINED_FUNCTION_3();
}

- (void)createAttrHeaderIfNeeded:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = 136315650;
  v4 = "-[AppleDoubleParser createAttrHeaderIfNeeded:]";
  v5 = 2048;
  v6 = a1;
  v7 = 2048;
  v8 = a2;
  _os_log_error_impl(&dword_23A6D3000, log, OS_LOG_TYPE_ERROR, "%s: pwrite() short write expected %zu got %zd.", (uint8_t *)&v3, 0x20u);
}

- (void)createAttrHeaderIfNeeded:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_23A6D3000, v0, v1, "%s: Couldn't push the resource fork further down the file. error = %@.", (uint8_t *)v2);
  OUTLINED_FUNCTION_4();
}

- (void)initWithFileDescriptor:fileSize:isAllocateXattr:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23A6D3000, v0, v1, "%s: Couldn't parse attr header. error = %@.", (uint8_t *)v2);
  OUTLINED_FUNCTION_4();
}

- (void)initWithFileDescriptor:fileSize:isAllocateXattr:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23A6D3000, v0, v1, "%s: Couldn't create attr header. error = %@.", (uint8_t *)v2);
  OUTLINED_FUNCTION_4();
}

- (void)initWithFileDescriptor:fileSize:isAllocateXattr:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23A6D3000, v0, v1, "%s: Couldn't parse finder info and resource fork. error = %@.", (uint8_t *)v2);
  OUTLINED_FUNCTION_4();
}

- (void)initWithFileDescriptor:fileSize:isAllocateXattr:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23A6D3000, v0, v1, "%s: Couldn't parse file header. error = %@.", (uint8_t *)v2);
  OUTLINED_FUNCTION_4();
}

- (void)initWithFileDescriptor:fileSize:isAllocateXattr:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23A6D3000, v0, v1, "%s: Couldn't read header. error = %@.", (uint8_t *)v2);
  OUTLINED_FUNCTION_4();
}

- (void)initWithFileDescriptor:fileSize:isAllocateXattr:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23A6D3000, v0, v1, "%s: Couldn't fill empty AD file. error = %@.", (uint8_t *)v2);
  OUTLINED_FUNCTION_4();
}

- (void)initWithFileDescriptor:fileSize:isAllocateXattr:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23A6D3000, v0, v1, "%s: Couldn't get file size. error = %@.", (uint8_t *)v2);
  OUTLINED_FUNCTION_4();
}

@end
