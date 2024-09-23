@implementation BLPurchaseDAAPParser

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_212C963AC;
  block[3] = &unk_24CE8A448;
  block[4] = a1;
  if (qword_253DB20E0 != -1)
    dispatch_once(&qword_253DB20E0, block);
  return (id)qword_253DB1FC8;
}

+ (id)decodeHexString:(id)a3
{
  void *v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  char __str[2];
  __int16 v11;

  objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_24CE8D258);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
  v11 = 0;
  if ((unint64_t)objc_msgSend(v4, "length") >= 2)
  {
    v6 = 0;
    v7 = 1;
    do
    {
      __str[0] = objc_msgSend(v4, "characterAtIndex:", v7 - 1);
      __str[1] = objc_msgSend(v4, "characterAtIndex:", v7);
      HIBYTE(v11) = strtol(__str, 0, 16);
      objc_msgSend(v5, "appendBytes:length:", (char *)&v11 + 1, 1);
      ++v6;
      v7 += 2;
    }
    while (v6 < (unint64_t)objc_msgSend(v4, "length") >> 1);
  }
  objc_msgSend(a1, "decodeData:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)decodeData:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  unint64_t v10;
  unsigned int *v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  int v16;
  const char *v17;
  __int16 v18;
  unint64_t v19;
  __int16 v20;
  unint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  +[BLPurchaseDAAPParser sharedInstance](BLPurchaseDAAPParser, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "length");
  if (v5 > 7)
  {
    v10 = v5;
    v11 = (unsigned int *)objc_msgSend(objc_retainAutorelease(v3), "bytes");
    v12 = bswap32(v11[1]);
    v13 = v10 - 8;
    if (v10 - 8 >= v12)
    {
      objc_msgSend(v4, "processResponseCode:bytes:count:", bswap32(*v11), v11 + 2, v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    BLJaliscoLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v16 = 136315650;
      v17 = "+[BLPurchaseDAAPParser decodeData:]";
      v18 = 2048;
      v19 = v12;
      v20 = 2048;
      v21 = v13;
      v7 = "ERROR: %s, Invalid data in DAAP response: trying to read %ld bytes from a buffer of size %ld";
      v8 = v6;
      v9 = 32;
      goto LABEL_7;
    }
  }
  else
  {
    BLJaliscoLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v16) = 0;
      v7 = "DMAPParser processResponse: couldn't get 8-byte message header";
      v8 = v6;
      v9 = 2;
LABEL_7:
      _os_log_impl(&dword_212C78000, v8, OS_LOG_TYPE_ERROR, v7, (uint8_t *)&v16, v9);
    }
  }

  v14 = 0;
LABEL_10:

  return v14;
}

- (unint64_t)SwapInt64BigToHost:(const char *)a3 size:(int64_t)a4
{
  _QWORD *v6;
  unint64_t v7;

  v6 = malloc_type_malloc(a4, 0xB07F0A64uLL);
  memcpy(v6, a3, a4);
  v7 = bswap64(*v6);
  free(v6);
  return v7;
}

- (id)parseUTF8String:(const char *)a3 length:(int64_t)a4
{
  __CFString *v4;

  if (a4 < 1)
  {
    v4 = &stru_24CE8D258;
  }
  else if (a4 == 1 && !*a3)
  {
    v4 = &stru_24CE8D258;
  }
  else
  {
    v4 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", a3, a4, 4);
  }
  return v4;
}

- (id)parseUnicodeCharacter:(const char *)a3 count:(int64_t)a4
{
  if (a4 == 2)
    return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", a3, 2, 2415919360);
  else
    return 0;
}

- (id)parseXMLContent:(const char *)a3 count:(int64_t)a4
{
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (a4 < 1)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v4, 0, 0, &v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v10;
    if (v6)
    {
      BLJaliscoLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v6, "description");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v12 = v8;
        _os_log_impl(&dword_212C78000, v7, OS_LOG_TYPE_ERROR, "Attempting to process XML response: %@", buf, 0xCu);

      }
    }

  }
  return v5;
}

- (id)parseFlavorListing:(const char *)a3 size:(int64_t)a4
{
  void *v7;
  int64_t v8;
  unint64_t v9;
  int64_t v10;
  BOOL v11;
  unsigned int v12;
  const char *v13;
  unsigned int v14;
  void *v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  int v21;
  const char *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  int64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 < 1)
  {
LABEL_12:
    v16 = v7;
  }
  else
  {
    while ((unint64_t)a4 > 3)
    {
      v8 = a4 - 4;
      if ((unint64_t)(a4 - 4) <= 3)
      {
        BLJaliscoLog();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          v21 = 136315650;
          v22 = "-[BLPurchaseDAAPParser parseFlavorListing:size:]";
          v23 = 2048;
          v24 = 4;
          v25 = 2048;
          v26 = v8;
          goto LABEL_20;
        }
LABEL_21:

        goto LABEL_22;
      }
      v9 = bswap32(*((_DWORD *)a3 + 1));
      v10 = a4 - 8;
      v11 = a4 - 8 >= v9;
      a4 = a4 - 8 - v9;
      if (!v11)
      {
        BLJaliscoLog();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          v21 = 136315650;
          v22 = "-[BLPurchaseDAAPParser parseFlavorListing:size:]";
          v23 = 2048;
          v24 = v9;
          v25 = 2048;
          v26 = v10;
LABEL_20:
          _os_log_impl(&dword_212C78000, v18, OS_LOG_TYPE_ERROR, "ERROR: %s, Invalid data in DAAP response: trying to read %ld bytes from a buffer of size %ld", (uint8_t *)&v21, 0x20u);
        }
        goto LABEL_21;
      }
      v14 = *(_DWORD *)a3;
      v13 = a3 + 8;
      v12 = v14;
      if (v14 == 1718183265)
      {
        -[BLPurchaseDAAPParser parseFlavor:size:](self, "parseFlavor:size:", v13, v9);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
          objc_msgSend(v7, "addObject:", v15);

      }
      else
      {
        -[BLPurchaseDAAPParser unknownCode:bytes:size:context:](self, "unknownCode:bytes:size:context:", bswap32(v12), v13, v9, "-[BLPurchaseDAAPParser parseFlavorListing:size:]");
      }
      a3 = &v13[v9];
      if (a4 <= 0)
        goto LABEL_12;
    }
    BLJaliscoLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v21 = 136315650;
      v22 = "-[BLPurchaseDAAPParser parseFlavorListing:size:]";
      v23 = 2048;
      v24 = 4;
      v25 = 2048;
      v26 = a4;
      _os_log_impl(&dword_212C78000, v17, OS_LOG_TYPE_ERROR, "ERROR: %s, Invalid data in DAAP response: trying to read %ld bytes from a buffer of size %ld", (uint8_t *)&v21, 0x20u);
    }

LABEL_22:
    v16 = 0;
  }

  return v16;
}

- (id)parseFlavor:(const char *)a3 size:(int64_t)a4
{
  void *v7;
  int64_t v8;
  unint64_t v9;
  int64_t v10;
  BOOL v11;
  const char *v12;
  unsigned int v13;
  int v14;
  BLPurchaseDAAPParser *v15;
  const char *v16;
  unint64_t v17;
  void *v18;
  const __CFString *v19;
  BLPurchaseDAAPParser *v20;
  const char *v21;
  unint64_t v22;
  void *v23;
  const __CFString *v24;
  id v25;
  NSObject *v26;
  NSObject *v27;
  int v30;
  const char *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  int64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 < 1)
  {
LABEL_32:
    v25 = v7;
    goto LABEL_43;
  }
  while ((unint64_t)a4 > 3)
  {
    v8 = a4 - 4;
    if ((unint64_t)(a4 - 4) <= 3)
    {
      BLJaliscoLog();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v30 = 136315650;
        v31 = "-[BLPurchaseDAAPParser parseFlavor:size:]";
        v32 = 2048;
        v33 = 4;
        v34 = 2048;
        v35 = v8;
        goto LABEL_40;
      }
LABEL_41:

      goto LABEL_42;
    }
    v9 = bswap32(*((_DWORD *)a3 + 1));
    v10 = a4 - 8;
    v11 = a4 - 8 >= v9;
    a4 = a4 - 8 - v9;
    if (!v11)
    {
      BLJaliscoLog();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v30 = 136315650;
        v31 = "-[BLPurchaseDAAPParser parseFlavor:size:]";
        v32 = 2048;
        v33 = v9;
        v34 = 2048;
        v35 = v10;
LABEL_40:
        _os_log_impl(&dword_212C78000, v27, OS_LOG_TYPE_ERROR, "ERROR: %s, Invalid data in DAAP response: trying to read %ld bytes from a buffer of size %ld", (uint8_t *)&v30, 0x20u);
      }
      goto LABEL_41;
    }
    v13 = *(_DWORD *)a3;
    v12 = a3 + 8;
    v14 = bswap32(v13);
    if (v14 > 1634952298)
    {
      if (v14 <= 1634954354)
      {
        if (v14 == 1634952299)
        {
          -[BLPurchaseDAAPParser setUInt8:size:inDict:forKey:](self, "setUInt8:size:inDict:forKey:", v12, v9, v7, CFSTR("daap.songdatakind"));
          goto LABEL_31;
        }
        if (v14 == 1634952813)
        {
          v20 = self;
          v21 = v12;
          v22 = v9;
          v23 = v7;
          v24 = CFSTR("daap.songformat");
LABEL_29:
          -[BLPurchaseDAAPParser setString:size:inDict:forKey:](v20, "setString:size:inDict:forKey:", v21, v22, v23, v24);
        }
      }
      else
      {
        switch(v14)
        {
          case 1634954355:
            -[BLPurchaseDAAPParser setUInt64:size:inDict:forKey:](self, "setUInt64:size:inDict:forKey:", v12, v9, v7, CFSTR("daap.songlongsize"));
            break;
          case 1634956146:
            v15 = self;
            v16 = v12;
            v17 = v9;
            v18 = v7;
            v19 = CFSTR("daap.songsamplerate");
            goto LABEL_27;
          case 1634956397:
            v15 = self;
            v16 = v12;
            v17 = v9;
            v18 = v7;
            v19 = CFSTR("daap.songtime");
            goto LABEL_27;
        }
      }
    }
    else if (v14 <= 1634951793)
    {
      if (v14 == 1634030192)
      {
        v20 = self;
        v21 = v12;
        v22 = v9;
        v23 = v7;
        v24 = CFSTR("com.apple.itunes.item-redownload-param-2");
        goto LABEL_29;
      }
      if (v14 == 1634035300)
      {
        v15 = self;
        v16 = v12;
        v17 = v9;
        v18 = v7;
        v19 = CFSTR("com.apple.itunes.item-flavor-id");
        goto LABEL_27;
      }
    }
    else
    {
      switch(v14)
      {
        case 1634951794:
          -[BLPurchaseDAAPParser setUInt16:size:inDict:forKey:](self, "setUInt16:size:inDict:forKey:", v12, v9, v7, CFSTR("daap.songbitrate"));
          break;
        case 1634952036:
          v15 = self;
          v16 = v12;
          v17 = v9;
          v18 = v7;
          v19 = CFSTR("daap.songcodectype");
          goto LABEL_27;
        case 1634952051:
          v15 = self;
          v16 = v12;
          v17 = v9;
          v18 = v7;
          v19 = CFSTR("daap.songcodecsubtype");
LABEL_27:
          -[BLPurchaseDAAPParser setUInt32:size:inDict:forKey:](v15, "setUInt32:size:inDict:forKey:", v16, v17, v18, v19);
          break;
      }
    }
LABEL_31:
    a3 = &v12[v9];
    if (a4 <= 0)
      goto LABEL_32;
  }
  BLJaliscoLog();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    v30 = 136315650;
    v31 = "-[BLPurchaseDAAPParser parseFlavor:size:]";
    v32 = 2048;
    v33 = 4;
    v34 = 2048;
    v35 = a4;
    _os_log_impl(&dword_212C78000, v26, OS_LOG_TYPE_ERROR, "ERROR: %s, Invalid data in DAAP response: trying to read %ld bytes from a buffer of size %ld", (uint8_t *)&v30, 0x20u);
  }

LABEL_42:
  v25 = 0;
LABEL_43:

  return v25;
}

- (void)setBool:(const char *)a3 size:(int64_t)a4 inDict:(id)a5 forKey:(id)a6
{
  id v9;
  id v10;
  int v11;
  NSObject *v12;
  BOOL v13;
  uint64_t v14;
  void *v15;
  int v16;
  int64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v9 = a5;
  v10 = a6;
  switch(a4)
  {
    case 1:
      v11 = *(unsigned __int8 *)a3;
      goto LABEL_8;
    case 2:
      v11 = *(unsigned __int16 *)a3;
      goto LABEL_8;
    case 4:
      v11 = *(_DWORD *)a3;
LABEL_8:
      v13 = v11 == 0;
      goto LABEL_10;
    case 8:
      v13 = *(_QWORD *)a3 == 0;
LABEL_10:
      v14 = !v13;
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithBool:", v14);
      objc_msgSend(v9, "setObject:forKey:", v15, v10);

      break;
    default:
      BLJaliscoLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v16 = 134218242;
        v17 = a4;
        v18 = 2112;
        v19 = v10;
        _os_log_impl(&dword_212C78000, v12, OS_LOG_TYPE_ERROR, "setBool being passed a %ld byte value for: <%@>!", (uint8_t *)&v16, 0x16u);
      }

      break;
  }

}

- (void)setSInt8:(const char *)a3 size:(int64_t)a4 inDict:(id)a5 forKey:(id)a6
{
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  int v13;
  int64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v9 = a5;
  v10 = a6;
  if (a4 == 1)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithChar:", *a3);
    objc_msgSend(v9, "setObject:forKey:", v11, v10);

  }
  else
  {
    BLJaliscoLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = 134218242;
      v14 = a4;
      v15 = 2112;
      v16 = v10;
      _os_log_impl(&dword_212C78000, v12, OS_LOG_TYPE_ERROR, "setSInt8 being passed a %ld byte value for: <%@>!", (uint8_t *)&v13, 0x16u);
    }

  }
}

- (void)setUInt8:(const char *)a3 size:(int64_t)a4 inDict:(id)a5 forKey:(id)a6
{
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  int v13;
  int64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v9 = a5;
  v10 = a6;
  if (a4 == 1)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedChar:", *(unsigned __int8 *)a3);
    objc_msgSend(v9, "setValue:forKey:", v11, v10);

  }
  else
  {
    BLJaliscoLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = 134218242;
      v14 = a4;
      v15 = 2112;
      v16 = v10;
      _os_log_impl(&dword_212C78000, v12, OS_LOG_TYPE_ERROR, "setUInt8 being passed a %ld byte value for: <%@>!", (uint8_t *)&v13, 0x16u);
    }

  }
}

- (void)setSInt16:(const char *)a3 size:(int64_t)a4 inDict:(id)a5 forKey:(id)a6
{
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  int v13;
  int64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v9 = a5;
  v10 = a6;
  if (a4 == 2)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithShort:", ((int)bswap32(*(unsigned __int16 *)a3) >> 16));
    objc_msgSend(v9, "setObject:forKey:", v11, v10);

  }
  else
  {
    BLJaliscoLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = 134218242;
      v14 = a4;
      v15 = 2112;
      v16 = v10;
      _os_log_impl(&dword_212C78000, v12, OS_LOG_TYPE_ERROR, "setSInt16 being passed a %ld byte value for: <%@>!", (uint8_t *)&v13, 0x16u);
    }

  }
}

- (void)setUInt16:(const char *)a3 size:(int64_t)a4 inDict:(id)a5 forKey:(id)a6
{
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  int v13;
  int64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v9 = a5;
  v10 = a6;
  if (a4 == 2)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedShort:", bswap32(*(unsigned __int16 *)a3) >> 16);
    objc_msgSend(v9, "setObject:forKey:", v11, v10);

  }
  else
  {
    BLJaliscoLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = 134218242;
      v14 = a4;
      v15 = 2112;
      v16 = v10;
      _os_log_impl(&dword_212C78000, v12, OS_LOG_TYPE_ERROR, "setUInt16 being passed a %ld byte value for: <%@>!", (uint8_t *)&v13, 0x16u);
    }

  }
}

- (void)setDate:(const char *)a3 size:(int64_t)a4 inDict:(id)a5 forKey:(id)a6
{
  void *v7;
  double v8;
  id v9;
  id v10;
  id v11;

  if (a4 == 4)
  {
    v7 = (void *)MEMORY[0x24BDBCE60];
    v8 = (double)bswap32(*(_DWORD *)a3);
    v9 = a6;
    v10 = a5;
    objc_msgSend(v7, "dateWithTimeIntervalSince1970:", v8);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v11, v9);

  }
}

- (void)setUInt32:(const char *)a3 size:(int64_t)a4 inDict:(id)a5 forKey:(id)a6
{
  uint64_t v7;
  objc_class *v8;
  id v9;
  id v10;
  id v11;

  if (a4 == 4)
  {
    v7 = bswap32(*(_DWORD *)a3);
    v8 = (objc_class *)MEMORY[0x24BDD16E0];
    v9 = a6;
    v10 = a5;
    v11 = (id)objc_msgSend([v8 alloc], "initWithUnsignedInt:", v7);
    objc_msgSend(v10, "setObject:forKey:", v11, v9);

  }
}

- (void)setFloat32:(const char *)a3 size:(int64_t)a4 inDict:(id)a5 forKey:(id)a6
{
  id v9;
  id v10;
  int v11;
  id v12;
  double v13;
  void *v14;
  NSObject *v15;
  int v16;
  int64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v9 = a5;
  v10 = a6;
  if (a4 == 4)
  {
    v11 = *(_DWORD *)a3;
    v12 = objc_alloc(MEMORY[0x24BDD16E0]);
    LODWORD(v13) = v11;
    v14 = (void *)objc_msgSend(v12, "initWithFloat:", v13);
    objc_msgSend(v9, "setObject:forKey:", v14, v10);

  }
  else
  {
    BLJaliscoLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = 134218242;
      v17 = a4;
      v18 = 2112;
      v19 = v10;
      _os_log_impl(&dword_212C78000, v15, OS_LOG_TYPE_ERROR, "setFloat32 being passed a %ld byte value for: <%@>!", (uint8_t *)&v16, 0x16u);
    }

  }
}

- (void)setUInt64:(const char *)a3 size:(int64_t)a4 inDict:(id)a5 forKey:(id)a6
{
  id v10;
  id v11;
  unint64_t v12;
  void *v13;
  NSObject *v14;
  int v15;
  int64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v10 = a5;
  v11 = a6;
  if (a4 == 8)
  {
    v12 = -[BLPurchaseDAAPParser SwapInt64BigToHost:size:](self, "SwapInt64BigToHost:size:", a3, 8);
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedLongLong:", v12);
    objc_msgSend(v10, "setObject:forKey:", v13, v11);

  }
  else
  {
    BLJaliscoLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = 134218242;
      v16 = a4;
      v17 = 2112;
      v18 = v11;
      _os_log_impl(&dword_212C78000, v14, OS_LOG_TYPE_ERROR, "setUInt64 being passed a %ld byte value for: <%@>!", (uint8_t *)&v15, 0x16u);
    }

  }
}

- (void)setString:(const char *)a3 size:(int64_t)a4 inDict:(id)a5 forKey:(id)a6
{
  id v10;
  id v11;
  id v12;

  if (a4 >= 1)
  {
    v10 = a6;
    v11 = a5;
    -[BLPurchaseDAAPParser parseUTF8String:length:](self, "parseUTF8String:length:", a3, a4);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setValue:forKey:", v12, v10);

  }
}

- (void)unknownCode:(unsigned int)a3 bytes:(const char *)a4 size:(int64_t)a5 context:(const char *)a6
{
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  int v14;
  int v15;
  NSObject *v16;
  int v17;
  int v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int v25;
  __int16 v26;
  int v27;
  __int16 v28;
  int64_t v29;
  __int16 v30;
  NSObject *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  if (a3 == 1634028888)
  {
    BLJaliscoLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v18 = 136315138;
      v19 = a6;
      v8 = "Unexpected xmlcode! at %s";
      v9 = v7;
      v10 = 12;
LABEL_20:
      _os_log_impl(&dword_212C78000, v9, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v18, v10);
    }
  }
  else
  {
    switch(a5)
    {
      case 0:
        BLJaliscoLog();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          v18 = 136316418;
          v19 = a6;
          v20 = 1024;
          v21 = (int)a3 >> 24;
          v22 = 1024;
          v23 = (int)(a3 << 8) >> 24;
          v24 = 1024;
          v25 = (__int16)a3 >> 8;
          v26 = 1024;
          v27 = (char)a3;
          v28 = 2048;
          v29 = 0;
          v8 = "Unknown code at %s: '%c%c%c%c', size=%ld";
          goto LABEL_19;
        }
        break;
      case 1:
        BLJaliscoLog();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          v14 = *(unsigned __int8 *)a4;
          v18 = 136316674;
          v19 = a6;
          v20 = 1024;
          v21 = (int)a3 >> 24;
          v22 = 1024;
          v23 = (int)(a3 << 8) >> 24;
          v24 = 1024;
          v25 = (__int16)a3 >> 8;
          v26 = 1024;
          v27 = (char)a3;
          v28 = 2048;
          v29 = 1;
          v30 = 1024;
          LODWORD(v31) = v14;
          v8 = "Unknown code at %s: '%c%c%c%c', size=%ld, value=%u";
          goto LABEL_16;
        }
        break;
      case 2:
        BLJaliscoLog();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          v15 = *(unsigned __int16 *)a4;
          v18 = 136316674;
          v19 = a6;
          v20 = 1024;
          v21 = (int)a3 >> 24;
          v22 = 1024;
          v23 = (int)(a3 << 8) >> 24;
          v24 = 1024;
          v25 = (__int16)a3 >> 8;
          v26 = 1024;
          v27 = (char)a3;
          v28 = 2048;
          v29 = 2;
          v30 = 1024;
          LODWORD(v31) = v15;
          v8 = "Unknown code at %s: '%c%c%c%c', size=%ld, value=%u";
          goto LABEL_16;
        }
        break;
      case 4:
        BLJaliscoLog();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          v17 = *(_DWORD *)a4;
          v18 = 136316674;
          v19 = a6;
          v20 = 1024;
          v21 = (int)a3 >> 24;
          v22 = 1024;
          v23 = (int)(a3 << 8) >> 24;
          v24 = 1024;
          v25 = (__int16)a3 >> 8;
          v26 = 1024;
          v27 = (char)a3;
          v28 = 2048;
          v29 = 4;
          v30 = 1024;
          LODWORD(v31) = v17;
          v8 = "Unknown code at %s: '%c%c%c%c', size=%ld, value=0x%x";
LABEL_16:
          v9 = v7;
          v10 = 52;
          goto LABEL_20;
        }
        break;
      case 8:
        BLJaliscoLog();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          v18 = 136316418;
          v19 = a6;
          v20 = 1024;
          v21 = (int)a3 >> 24;
          v22 = 1024;
          v23 = (int)(a3 << 8) >> 24;
          v24 = 1024;
          v25 = (__int16)a3 >> 8;
          v26 = 1024;
          v27 = (char)a3;
          v28 = 2048;
          v29 = 8;
          v8 = "Unknown code at %s: '%c%c%c%c', size=%ld";
LABEL_19:
          v9 = v7;
          v10 = 46;
          goto LABEL_20;
        }
        break;
      default:
        objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", a4, a5);
        v7 = objc_claimAutoreleasedReturnValue();
        BLJaliscoLog();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v18 = 136316674;
          v19 = a6;
          v20 = 1024;
          v21 = (int)a3 >> 24;
          v22 = 1024;
          v23 = (int)(a3 << 8) >> 24;
          v24 = 1024;
          v25 = (__int16)a3 >> 8;
          v26 = 1024;
          v27 = (char)a3;
          v28 = 2048;
          v29 = a5;
          v30 = 2112;
          v31 = v7;
          _os_log_impl(&dword_212C78000, v16, OS_LOG_TYPE_ERROR, "Unknown code at %s: '%c%c%c%c', size=%ld, value=%@", (uint8_t *)&v18, 0x38u);
        }

        break;
    }
  }

}

- (id)parseMACAddressListing:(const char *)a3 count:(int64_t)a4
{
  void *v7;
  int64_t v8;
  unint64_t v9;
  int64_t v10;
  BOOL v11;
  unsigned int v12;
  const char *v13;
  unsigned int v14;
  unint64_t v15;
  void *v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  int v22;
  const char *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  int64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 < 1)
  {
LABEL_10:
    v17 = v7;
  }
  else
  {
    while ((unint64_t)a4 > 3)
    {
      v8 = a4 - 4;
      if ((unint64_t)(a4 - 4) <= 3)
      {
        BLJaliscoLog();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          v22 = 136315650;
          v23 = "-[BLPurchaseDAAPParser parseMACAddressListing:count:]";
          v24 = 2048;
          v25 = 4;
          v26 = 2048;
          v27 = v8;
          goto LABEL_18;
        }
LABEL_19:

        goto LABEL_20;
      }
      v9 = bswap32(*((_DWORD *)a3 + 1));
      v10 = a4 - 8;
      v11 = a4 - 8 >= v9;
      a4 = a4 - 8 - v9;
      if (!v11)
      {
        BLJaliscoLog();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          v22 = 136315650;
          v23 = "-[BLPurchaseDAAPParser parseMACAddressListing:count:]";
          v24 = 2048;
          v25 = v9;
          v26 = 2048;
          v27 = v10;
LABEL_18:
          _os_log_impl(&dword_212C78000, v19, OS_LOG_TYPE_ERROR, "ERROR: %s, Invalid data in DAAP response: trying to read %ld bytes from a buffer of size %ld", (uint8_t *)&v22, 0x20u);
        }
        goto LABEL_19;
      }
      v14 = *(_DWORD *)a3;
      v13 = a3 + 8;
      v12 = v14;
      if (v14 == 1634562925)
      {
        v15 = -[BLPurchaseDAAPParser SwapInt64BigToHost:size:](self, "SwapInt64BigToHost:size:", v13, v9);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v16);

      }
      else
      {
        -[BLPurchaseDAAPParser unknownCode:bytes:size:context:](self, "unknownCode:bytes:size:context:", bswap32(v12), v13, v9, "-[BLPurchaseDAAPParser parseMACAddressListing:count:]");
      }
      a3 = &v13[v9];
      if (a4 <= 0)
        goto LABEL_10;
    }
    BLJaliscoLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v22 = 136315650;
      v23 = "-[BLPurchaseDAAPParser parseMACAddressListing:count:]";
      v24 = 2048;
      v25 = 4;
      v26 = 2048;
      v27 = a4;
      _os_log_impl(&dword_212C78000, v18, OS_LOG_TYPE_ERROR, "ERROR: %s, Invalid data in DAAP response: trying to read %ld bytes from a buffer of size %ld", (uint8_t *)&v22, 0x20u);
    }

LABEL_20:
    v17 = 0;
  }

  return v17;
}

- (id)parseServerInfo:(const char *)a3 count:(int64_t)a4
{
  void *v7;
  int64_t v8;
  unint64_t v9;
  int64_t v10;
  BOOL v11;
  const char *v12;
  unsigned int v13;
  uint64_t v14;
  BLPurchaseDAAPParser *v15;
  const char *v16;
  unint64_t v17;
  void *v18;
  const __CFString *v19;
  BLPurchaseDAAPParser *v20;
  const char *v21;
  unint64_t v22;
  void *v23;
  const __CFString *v24;
  BLPurchaseDAAPParser *v25;
  const char *v26;
  unint64_t v27;
  void *v28;
  const __CFString *v29;
  BLPurchaseDAAPParser *v30;
  const char *v31;
  unint64_t v32;
  void *v33;
  const __CFString *v34;
  BLPurchaseDAAPParser *v35;
  const char *v36;
  unint64_t v37;
  void *v38;
  const __CFString *v39;
  BLPurchaseDAAPParser *v40;
  const char *v41;
  unint64_t v42;
  void *v43;
  const __CFString *v44;
  void *v45;
  id v46;
  NSObject *v47;
  NSObject *v48;
  int v51;
  const char *v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  int64_t v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 < 1 || !a3)
  {
LABEL_111:
    v46 = v7;
    goto LABEL_122;
  }
  while ((unint64_t)a4 > 3)
  {
    v8 = a4 - 4;
    if ((unint64_t)(a4 - 4) <= 3)
    {
      BLJaliscoLog();
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        v51 = 136315650;
        v52 = "-[BLPurchaseDAAPParser parseServerInfo:count:]";
        v53 = 2048;
        v54 = 4;
        v55 = 2048;
        v56 = v8;
        goto LABEL_119;
      }
LABEL_120:

      goto LABEL_121;
    }
    v9 = bswap32(*((_DWORD *)a3 + 1));
    v10 = a4 - 8;
    v11 = a4 - 8 >= v9;
    a4 = a4 - 8 - v9;
    if (!v11)
    {
      BLJaliscoLog();
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        v51 = 136315650;
        v52 = "-[BLPurchaseDAAPParser parseServerInfo:count:]";
        v53 = 2048;
        v54 = v9;
        v55 = 2048;
        v56 = v10;
LABEL_119:
        _os_log_impl(&dword_212C78000, v48, OS_LOG_TYPE_ERROR, "ERROR: %s, Invalid data in DAAP response: trying to read %ld bytes from a buffer of size %ld", (uint8_t *)&v51, 0x20u);
      }
      goto LABEL_120;
    }
    v13 = *(_DWORD *)a3;
    v12 = a3 + 8;
    v14 = bswap32(v13);
    if ((int)v14 > 1836278130)
    {
      if ((int)v14 <= 1836281195)
      {
        if ((int)v14 > 1836279159)
        {
          if ((int)v14 <= 1836280183)
          {
            if ((_DWORD)v14 == 1836279160)
            {
              v30 = self;
              v31 = v12;
              v32 = v9;
              v33 = v7;
              v34 = CFSTR("dmap.supportsextensions");
              goto LABEL_103;
            }
            if ((_DWORD)v14 != 1836280169)
              goto LABEL_110;
            v20 = self;
            v21 = v12;
            v22 = v9;
            v23 = v7;
            v24 = CFSTR("dmap.supportsinlinecontaineritems");
          }
          else
          {
            if ((_DWORD)v14 == 1836280184)
            {
              v30 = self;
              v31 = v12;
              v32 = v9;
              v33 = v7;
              v34 = CFSTR("dmap.supportsindex");
              goto LABEL_103;
            }
            if ((_DWORD)v14 != 1836280937)
            {
              if ((_DWORD)v14 != 1836280946)
                goto LABEL_110;
              v30 = self;
              v31 = v12;
              v32 = v9;
              v33 = v7;
              v34 = CFSTR("dmap.loginrequired");
              goto LABEL_103;
            }
            v20 = self;
            v21 = v12;
            v22 = v9;
            v23 = v7;
            v24 = CFSTR("dmap.supportslongitemid");
          }
        }
        else
        {
          if ((int)v14 <= 1836278385)
          {
            if ((_DWORD)v14 == 1836278131)
            {
              v30 = self;
              v31 = v12;
              v32 = v9;
              v33 = v7;
              v34 = CFSTR("dmap.authenticationschemes");
            }
            else
            {
              if ((_DWORD)v14 != 1836278133)
                goto LABEL_110;
              v30 = self;
              v31 = v12;
              v32 = v9;
              v33 = v7;
              v34 = CFSTR("dmap.authenticationmethod");
            }
            goto LABEL_103;
          }
          if ((_DWORD)v14 == 1836278386)
          {
            v30 = self;
            v31 = v12;
            v32 = v9;
            v33 = v7;
            v34 = CFSTR("dmap.supportsbrowse");
LABEL_103:
            -[BLPurchaseDAAPParser setUInt8:size:inDict:forKey:](v30, "setUInt8:size:inDict:forKey:", v31, v32, v33, v34);
            goto LABEL_108;
          }
          if ((_DWORD)v14 == 1836278883)
          {
            v15 = self;
            v16 = v12;
            v17 = v9;
            v18 = v7;
            v19 = CFSTR("dmap.databasescount");
LABEL_107:
            -[BLPurchaseDAAPParser setUInt32:size:inDict:forKey:](v15, "setUInt32:size:inDict:forKey:", v16, v17, v18, v19);
            goto LABEL_108;
          }
          if ((_DWORD)v14 != 1836279140)
            goto LABEL_110;
          v20 = self;
          v21 = v12;
          v22 = v9;
          v23 = v7;
          v24 = CFSTR("supportsEditing");
        }
        goto LABEL_96;
      }
      if ((int)v14 > 1836282988)
      {
        if ((int)v14 <= 1836282995)
        {
          if ((_DWORD)v14 == 1836282989)
          {
            v15 = self;
            v16 = v12;
            v17 = v9;
            v18 = v7;
            v19 = CFSTR("dmap.timeoutinterval");
          }
          else
          {
            if ((_DWORD)v14 != 1836282991)
            {
LABEL_110:
              -[BLPurchaseDAAPParser unknownCode:bytes:size:context:](self, "unknownCode:bytes:size:context:", v14, v12, v9, "-[BLPurchaseDAAPParser parseServerInfo:count:]");
              goto LABEL_108;
            }
            v15 = self;
            v16 = v12;
            v17 = v9;
            v18 = v7;
            v19 = CFSTR("dmap.utcoffset");
          }
          goto LABEL_107;
        }
        if ((_DWORD)v14 == 1886417519)
        {
          v15 = self;
          v16 = v12;
          v17 = v9;
          v18 = v7;
          v19 = CFSTR("ppro");
          goto LABEL_107;
        }
        if ((_DWORD)v14 != 1836283248)
        {
          if ((_DWORD)v14 != 1836282996)
            goto LABEL_110;
          v15 = self;
          v16 = v12;
          v17 = v9;
          v18 = v7;
          v19 = CFSTR("dmap.status");
          goto LABEL_107;
        }
        v30 = self;
        v31 = v12;
        v32 = v9;
        v33 = v7;
        v34 = CFSTR("dmap.supportsupdate");
        goto LABEL_103;
      }
      if ((int)v14 > 1836282232)
      {
        switch((_DWORD)v14)
        {
          case 0x6D737179:
            v30 = self;
            v31 = v12;
            v32 = v9;
            v33 = v7;
            v34 = CFSTR("dmap.supportsquery");
            break;
          case 0x6D737273:
            v30 = self;
            v31 = v12;
            v32 = v9;
            v33 = v7;
            v34 = CFSTR("dmap.supportsresolve");
            break;
          case 0x6D737463:
            v15 = self;
            v16 = v12;
            v17 = v9;
            v18 = v7;
            v19 = CFSTR("dmap.utctime");
            goto LABEL_107;
          default:
            goto LABEL_110;
        }
        goto LABEL_103;
      }
      if ((_DWORD)v14 != 1836281196)
      {
        if ((_DWORD)v14 != 1836281961)
          goto LABEL_110;
        v30 = self;
        v31 = v12;
        v32 = v9;
        v33 = v7;
        v34 = CFSTR("dmap.supportspersistentids");
        goto LABEL_103;
      }
      -[BLPurchaseDAAPParser parseMACAddressListing:count:](self, "parseMACAddressListing:count:", v12, v9);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setValue:forKey:", v45, CFSTR("macAddresses"));

    }
    else
    {
      if ((int)v14 > 1635013461)
      {
        if ((int)v14 > 1835626092)
        {
          if ((int)v14 <= 1835888229)
          {
            if ((_DWORD)v14 == 1835626093)
            {
              v40 = self;
              v41 = v12;
              v42 = v9;
              v43 = v7;
              v44 = CFSTR("dmap.itemname");
            }
            else
            {
              if ((_DWORD)v14 != 1835885676)
                goto LABEL_110;
              v40 = self;
              v41 = v12;
              v42 = v9;
              v43 = v7;
              v44 = CFSTR("model");
            }
            goto LABEL_105;
          }
          if ((_DWORD)v14 == 1835888230)
          {
            v40 = self;
            v41 = v12;
            v42 = v9;
            v43 = v7;
            v44 = CFSTR("manufacturer");
LABEL_105:
            -[BLPurchaseDAAPParser setString:size:inDict:forKey:](v40, "setString:size:inDict:forKey:", v41, v42, v43, v44);
            goto LABEL_108;
          }
          if ((_DWORD)v14 == 1836085871)
          {
            v15 = self;
            v16 = v12;
            v17 = v9;
            v18 = v7;
            v19 = CFSTR("dmap.protocolversion");
            goto LABEL_107;
          }
          if ((_DWORD)v14 != 1836278124)
            goto LABEL_110;
          v30 = self;
          v31 = v12;
          v32 = v9;
          v33 = v7;
          v34 = CFSTR("dmap.supportsautologout");
          goto LABEL_103;
        }
        if ((int)v14 > 1685484664)
        {
          if ((_DWORD)v14 == 1685484665)
          {
            v30 = self;
            v31 = v12;
            v32 = v9;
            v33 = v7;
            v34 = CFSTR("deviceType");
            goto LABEL_103;
          }
          if ((_DWORD)v14 != 1835361395)
          {
            if ((_DWORD)v14 != 1835625572)
              goto LABEL_110;
            v25 = self;
            v26 = v12;
            v27 = v9;
            v28 = v7;
            v29 = CFSTR("dmap.longitemid");
LABEL_101:
            -[BLPurchaseDAAPParser setUInt64:size:inDict:forKey:](v25, "setUInt64:size:inDict:forKey:", v26, v27, v28, v29);
            goto LABEL_108;
          }
          v20 = self;
          v21 = v12;
          v22 = v9;
          v23 = v7;
          v24 = CFSTR("dmap.editcommandssupported");
          goto LABEL_96;
        }
        if ((_DWORD)v14 == 1635013462)
        {
          v15 = self;
          v16 = v12;
          v17 = v9;
          v18 = v7;
          v19 = CFSTR("Client-ATV-Sharing-Version");
          goto LABEL_107;
        }
        if ((_DWORD)v14 != 1635018084)
          goto LABEL_110;
        v35 = self;
        v36 = v12;
        v37 = v9;
        v38 = v7;
        v39 = CFSTR("daap.supportsextradata");
      }
      else
      {
        if ((int)v14 <= 1634030423)
        {
          if ((int)v14 <= 1634027089)
          {
            if ((_DWORD)v14 != 1634026320)
            {
              if ((_DWORD)v14 != 1634027088)
                goto LABEL_110;
              v30 = self;
              v31 = v12;
              v32 = v9;
              v33 = v7;
              v34 = CFSTR("com.apple.itunes.req-fplay");
              goto LABEL_103;
            }
            v20 = self;
            v21 = v12;
            v22 = v9;
            v23 = v7;
            v24 = CFSTR("supportsPurchases");
          }
          else
          {
            switch((_DWORD)v14)
            {
              case 0x61654652:
                v20 = self;
                v21 = v12;
                v22 = v9;
                v23 = v7;
                v24 = CFSTR("com.apple.itunes.supports-fprap");
                break;
              case 0x61654D51:
                v20 = self;
                v21 = v12;
                v22 = v9;
                v23 = v7;
                v24 = CFSTR("com.apple.itunes.playlist-contains-media-type");
                break;
              case 0x61655356:
                v15 = self;
                v16 = v12;
                v17 = v9;
                v18 = v7;
                v19 = CFSTR("com.apple.itunes.music-sharing-version");
                goto LABEL_107;
              default:
                goto LABEL_110;
            }
          }
          goto LABEL_96;
        }
        if ((int)v14 <= 1634759278)
        {
          if ((_DWORD)v14 != 1634030424)
          {
            if ((_DWORD)v14 != 1634038895)
              goto LABEL_110;
            v15 = self;
            v16 = v12;
            v17 = v9;
            v18 = v7;
            v19 = CFSTR("com.apple.itunes.cloud-purchase-token");
            goto LABEL_107;
          }
          v25 = self;
          v26 = v12;
          v27 = v9;
          v28 = v7;
          v29 = CFSTR("com.apple.itunes.supportedextensions");
          goto LABEL_101;
        }
        if ((_DWORD)v14 == 1634759279)
        {
          v15 = self;
          v16 = v12;
          v17 = v9;
          v18 = v7;
          v19 = CFSTR("daap.protocolversion");
          goto LABEL_107;
        }
        if ((_DWORD)v14 != 1634953074)
        {
          if ((_DWORD)v14 != 1634956133)
            goto LABEL_110;
          v20 = self;
          v21 = v12;
          v22 = v9;
          v23 = v7;
          v24 = CFSTR("daap.supportssetproperty");
LABEL_96:
          -[BLPurchaseDAAPParser setBool:size:inDict:forKey:](v20, "setBool:size:inDict:forKey:", v21, v22, v23, v24);
          goto LABEL_108;
        }
        v35 = self;
        v36 = v12;
        v37 = v9;
        v38 = v7;
        v39 = CFSTR("daap.supportsgroups");
      }
      -[BLPurchaseDAAPParser setUInt16:size:inDict:forKey:](v35, "setUInt16:size:inDict:forKey:", v36, v37, v38, v39);
    }
LABEL_108:
    a3 = &v12[v9];
    if (a4 <= 0)
      goto LABEL_111;
  }
  BLJaliscoLog();
  v47 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
  {
    v51 = 136315650;
    v52 = "-[BLPurchaseDAAPParser parseServerInfo:count:]";
    v53 = 2048;
    v54 = 4;
    v55 = 2048;
    v56 = a4;
    _os_log_impl(&dword_212C78000, v47, OS_LOG_TYPE_ERROR, "ERROR: %s, Invalid data in DAAP response: trying to read %ld bytes from a buffer of size %ld", (uint8_t *)&v51, 0x20u);
  }

LABEL_121:
  v46 = 0;
LABEL_122:

  return v46;
}

- (id)parseContentCodes:(const char *)a3 count:(int64_t)a4
{
  id v7;
  int64_t v8;
  unint64_t v9;
  int64_t v10;
  BOOL v11;
  unsigned int v12;
  const char *v13;
  unsigned int v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  int v20;
  const char *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  int64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (a4 < 1)
  {
LABEL_9:
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    while ((unint64_t)a4 > 3)
    {
      v8 = a4 - 4;
      if ((unint64_t)(a4 - 4) <= 3)
      {
        BLJaliscoLog();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          v20 = 136315650;
          v21 = "-[BLPurchaseDAAPParser parseContentCodes:count:]";
          v22 = 2048;
          v23 = 4;
          v24 = 2048;
          v25 = v8;
          goto LABEL_17;
        }
LABEL_18:

        goto LABEL_19;
      }
      v9 = bswap32(*((_DWORD *)a3 + 1));
      v10 = a4 - 8;
      v11 = a4 - 8 >= v9;
      a4 = a4 - 8 - v9;
      if (!v11)
      {
        BLJaliscoLog();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          v20 = 136315650;
          v21 = "-[BLPurchaseDAAPParser parseContentCodes:count:]";
          v22 = 2048;
          v23 = v9;
          v24 = 2048;
          v25 = v10;
LABEL_17:
          _os_log_impl(&dword_212C78000, v17, OS_LOG_TYPE_ERROR, "ERROR: %s, Invalid data in DAAP response: trying to read %ld bytes from a buffer of size %ld", (uint8_t *)&v20, 0x20u);
        }
        goto LABEL_18;
      }
      v14 = *(_DWORD *)a3;
      v13 = a3 + 8;
      v12 = v14;
      if (v14 != 1953788781)
        -[BLPurchaseDAAPParser unknownCode:bytes:size:context:](self, "unknownCode:bytes:size:context:", bswap32(v12), v13, v9, "-[BLPurchaseDAAPParser parseContentCodes:count:]");
      a3 = &v13[v9];
      if (a4 <= 0)
        goto LABEL_9;
    }
    BLJaliscoLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v20 = 136315650;
      v21 = "-[BLPurchaseDAAPParser parseContentCodes:count:]";
      v22 = 2048;
      v23 = 4;
      v24 = 2048;
      v25 = a4;
      _os_log_impl(&dword_212C78000, v16, OS_LOG_TYPE_ERROR, "ERROR: %s, Invalid data in DAAP response: trying to read %ld bytes from a buffer of size %ld", (uint8_t *)&v20, 0x20u);
    }

LABEL_19:
    v15 = 0;
  }

  return v15;
}

- (id)parseError:(const char *)a3 count:(int64_t)a4
{
  int64_t v4;
  void *v7;
  unint64_t v8;
  int64_t v9;
  BOOL v10;
  const char *v11;
  unsigned int v12;
  uint64_t v13;
  const char *v14;
  unint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  NSObject *v20;
  int v22;
  const char *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  int64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  if (a4 < 9)
    return 0;
  v4 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 2);
  while (1)
  {
    if ((unint64_t)v4 <= 3)
    {
      BLJaliscoLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        goto LABEL_22;
      v22 = 136315650;
      v23 = "-[BLPurchaseDAAPParser parseError:count:]";
      v24 = 2048;
      v25 = 4;
      v26 = 2048;
      v27 = v4;
      goto LABEL_21;
    }
    if ((unint64_t)(v4 - 4) <= 3)
    {
      BLJaliscoLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        goto LABEL_22;
      v22 = 136315650;
      v23 = "-[BLPurchaseDAAPParser parseError:count:]";
      v24 = 2048;
      v25 = 4;
      v26 = 2048;
      v27 = v4 - 4;
      goto LABEL_21;
    }
    v8 = bswap32(*((_DWORD *)a3 + 1));
    v9 = v4 - 8;
    v10 = v4 - 8 >= v8;
    v4 = v4 - 8 - v8;
    if (!v10)
      break;
    v12 = *(_DWORD *)a3;
    v11 = a3 + 8;
    v13 = bswap32(v12);
    if ((_DWORD)v13 == 1634030147)
    {
      v14 = v11;
      v15 = v8;
      v16 = v7;
      v17 = CFSTR("com.apple.itunes.reconnect-interval");
    }
    else
    {
      if ((_DWORD)v13 != 1836282996)
      {
        -[BLPurchaseDAAPParser unknownCode:bytes:size:context:](self, "unknownCode:bytes:size:context:", v13, v11, v8, "-[BLPurchaseDAAPParser parseError:count:]");
        goto LABEL_13;
      }
      v14 = v11;
      v15 = v8;
      v16 = v7;
      v17 = CFSTR("dmap.status");
    }
    -[BLPurchaseDAAPParser setUInt32:size:inDict:forKey:](self, "setUInt32:size:inDict:forKey:", v14, v15, v16, v17);
LABEL_13:
    a3 = &v11[v8];
    if (v4 < 1)
    {
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v7);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      return v18;
    }
  }
  BLJaliscoLog();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    v22 = 136315650;
    v23 = "-[BLPurchaseDAAPParser parseError:count:]";
    v24 = 2048;
    v25 = v8;
    v26 = 2048;
    v27 = v9;
LABEL_21:
    _os_log_impl(&dword_212C78000, v20, OS_LOG_TYPE_ERROR, "ERROR: %s, Invalid data in DAAP response: trying to read %ld bytes from a buffer of size %ld", (uint8_t *)&v22, 0x20u);
  }
LABEL_22:

  return 0;
}

- (id)parseLogin:(const char *)a3 count:(int64_t)a4
{
  int64_t v4;
  id v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  int v16;
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  int64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (a4 < 1)
  {
    v6 = 0;
LABEL_12:
    v6 = v6;
    v12 = v6;
  }
  else
  {
    v4 = a4;
    v6 = 0;
    while ((unint64_t)v4 > 3)
    {
      v7 = v4 - 4;
      if ((unint64_t)(v4 - 4) <= 3)
      {
        BLJaliscoLog();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          v16 = 136315650;
          v17 = "-[BLPurchaseDAAPParser parseLogin:count:]";
          v18 = 2048;
          v19 = 4;
          v20 = 2048;
          v21 = v7;
          _os_log_impl(&dword_212C78000, v14, OS_LOG_TYPE_ERROR, "ERROR: %s, Invalid data in DAAP response: trying to read %ld bytes from a buffer of size %ld", (uint8_t *)&v16, 0x20u);
        }

        goto LABEL_19;
      }
      v8 = bswap32(*(_DWORD *)a3);
      v9 = bswap32(*((_DWORD *)a3 + 1));
      v10 = (unsigned int *)(a3 + 8);
      if ((_DWORD)v8 != 1836282996)
      {
        if ((_DWORD)v8 == 1835821412)
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", (int)bswap32(*v10));
          v11 = objc_claimAutoreleasedReturnValue();

          v6 = (id)v11;
        }
        else
        {
          -[BLPurchaseDAAPParser unknownCode:bytes:size:context:](self, "unknownCode:bytes:size:context:", v8, v10, v9, "-[BLPurchaseDAAPParser parseLogin:count:]");
        }
      }
      a3 = (char *)v10 + v9;
      v4 = v4 - 8 - v9;
      if (v4 <= 0)
        goto LABEL_12;
    }
    BLJaliscoLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v16 = 136315650;
      v17 = "-[BLPurchaseDAAPParser parseLogin:count:]";
      v18 = 2048;
      v19 = 4;
      v20 = 2048;
      v21 = v4;
      _os_log_impl(&dword_212C78000, v13, OS_LOG_TYPE_ERROR, "ERROR: %s, Invalid data in DAAP response: trying to read %ld bytes from a buffer of size %ld", (uint8_t *)&v16, 0x20u);
    }

LABEL_19:
    v12 = 0;
  }

  return v12;
}

- (id)parseListingItem:(const char *)a3 count:(int64_t)a4
{
  void *v7;
  const __CFString *v8;
  int64_t v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int *v12;
  int v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  BLPurchaseDAAPParser *v18;
  unsigned int *v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  BLPurchaseDAAPParser *v23;
  unsigned int *v24;
  uint64_t v25;
  void *v26;
  const __CFString *v27;
  BLPurchaseDAAPParser *v28;
  unsigned int *v29;
  uint64_t v30;
  void *v31;
  const __CFString *v32;
  BLPurchaseDAAPParser *v33;
  unsigned int *v34;
  uint64_t v35;
  void *v36;
  const __CFString *v37;
  void *v38;
  void *v39;
  const __CFString *v40;
  BLPurchaseDAAPParser *v41;
  unsigned int *v42;
  uint64_t v43;
  void *v44;
  const __CFString *v45;
  unsigned __int16 v46;
  void *v47;
  void *v48;
  const __CFString *v49;
  int v50;
  unint64_t v51;
  BLPurchaseDAAPParser *v52;
  unsigned int *v53;
  uint64_t v54;
  void *v55;
  const __CFString *v56;
  BLPurchaseDAAPParser *v57;
  unsigned int *v58;
  uint64_t v59;
  void *v60;
  const __CFString *v61;
  float v62;
  id v63;
  double v64;
  unint64_t v65;
  uint64_t v66;
  id v67;
  NSObject *v68;
  NSObject *v69;
  uint64_t v71;
  const __CFString *v72;
  void *v73;
  uint8_t buf[4];
  const char *v75;
  __int16 v76;
  uint64_t v77;
  __int16 v78;
  int64_t v79;
  uint64_t v80;

  v80 = *MEMORY[0x24BDAC8D0];
  +[BLPurchaseDAAPItem item](BLPurchaseDAAPItem, "item");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 < 1)
  {
LABEL_381:
    objc_msgSend(v7, "freeze");
    v67 = v7;
    goto LABEL_389;
  }
  v71 = 0;
  v8 = CFSTR("booklets");
  while ((unint64_t)a4 > 3)
  {
    v9 = a4 - 4;
    if ((unint64_t)(a4 - 4) <= 3)
    {
      BLJaliscoLog();
      v69 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v75 = "-[BLPurchaseDAAPParser parseListingItem:count:]";
        v76 = 2048;
        v77 = 4;
        v78 = 2048;
        v79 = v9;
        _os_log_impl(&dword_212C78000, v69, OS_LOG_TYPE_ERROR, "ERROR: %s, Invalid data in DAAP response: trying to read %ld bytes from a buffer of size %ld", buf, 0x20u);
      }

      goto LABEL_388;
    }
    v11 = *(_DWORD *)a3;
    v10 = *((_DWORD *)a3 + 1);
    v12 = (unsigned int *)(a3 + 8);
    v13 = bswap32(v11);
    v14 = bswap32(v10);
    if (v13 > 1634952812)
    {
      if (v13 <= 1668116593)
      {
        if (v13 <= 1667328367)
        {
          if (v13 <= 1634956148)
          {
            if (v13 <= 1634954338)
            {
              if (v13 > 1634953327)
              {
                if (v13 == 1634953328)
                {
                  v41 = self;
                  v42 = v12;
                  v43 = v14;
                  v44 = v7;
                  v45 = CFSTR("daap.songhasbeenplayed");
                  goto LABEL_350;
                }
                if (v13 == 1634954096)
                {
                  v28 = self;
                  v29 = v12;
                  v30 = v14;
                  v31 = v7;
                  v32 = CFSTR("daap.songuserskipcount");
                  goto LABEL_373;
                }
              }
              else
              {
                if (v13 == 1634952813)
                {
                  v23 = self;
                  v24 = v12;
                  v25 = v14;
                  v26 = v7;
                  v27 = CFSTR("daap.songformat");
                  goto LABEL_358;
                }
                if (v13 == 1634953070)
                {
                  v23 = self;
                  v24 = v12;
                  v25 = v14;
                  v26 = v7;
                  v27 = CFSTR("daap.songgenre");
                  goto LABEL_358;
                }
              }
            }
            else if (v13 <= 1634955380)
            {
              if (v13 == 1634954339)
              {
                v23 = self;
                v24 = v12;
                v25 = v14;
                v26 = v7;
                v27 = CFSTR("daap.songlongcontentdescription");
                goto LABEL_358;
              }
              if (v13 == 1634955363)
              {
                v28 = self;
                v29 = v12;
                v30 = v14;
                v31 = v7;
                v32 = CFSTR("daap.songuserplaycount");
                goto LABEL_373;
              }
            }
            else
            {
              switch(v13)
              {
                case 1634955381:
                  v23 = self;
                  v24 = v12;
                  v25 = v14;
                  v26 = v7;
                  v27 = CFSTR("daap.songpodcasturl");
                  goto LABEL_358;
                case 1634956129:
                  v23 = self;
                  v24 = v12;
                  v25 = v14;
                  v26 = v7;
                  v27 = CFSTR("daap.sortartist");
                  goto LABEL_358;
                case 1634956142:
                  v23 = self;
                  v24 = v12;
                  v25 = v14;
                  v26 = v7;
                  v27 = CFSTR("daap.sortname");
                  goto LABEL_358;
              }
            }
            goto LABEL_345;
          }
          if (v13 <= 1634956651)
          {
            if (v13 > 1634956396)
            {
              if (v13 == 1634956397)
              {
                v28 = self;
                v29 = v12;
                v30 = v14;
                v31 = v7;
                v32 = CFSTR("daap.songtime");
                goto LABEL_373;
              }
              if (v13 != 1634956398)
                goto LABEL_345;
              v52 = self;
              v53 = v12;
              v54 = v14;
              v55 = v7;
              v56 = CFSTR("daap.songtracknumber");
            }
            else
            {
              if (v13 == 1634956149)
              {
                v23 = self;
                v24 = v12;
                v25 = v14;
                v26 = v7;
                v27 = CFSTR("daap.sortalbum");
                goto LABEL_358;
              }
              if (v13 != 1634956387)
                goto LABEL_345;
              v52 = self;
              v53 = v12;
              v54 = v14;
              v55 = v7;
              v56 = CFSTR("daap.songtrackcount");
            }
          }
          else
          {
            if (v13 <= 1634957681)
            {
              if (v13 == 1634956652)
              {
                v23 = self;
                v24 = v12;
                v25 = v14;
                v26 = v7;
                v27 = CFSTR("daap.songdataurl");
                goto LABEL_358;
              }
              if (v13 == 1634956658)
              {
                v41 = self;
                v42 = v12;
                v43 = v14;
                v44 = v7;
                v45 = CFSTR("daap.songuserrating");
                goto LABEL_350;
              }
              goto LABEL_345;
            }
            if (v13 != 1634957682)
            {
              if (v13 == 1667328112)
              {
                v41 = self;
                v42 = v12;
                v43 = v14;
                v44 = v7;
                v45 = CFSTR("hasPassword");
                goto LABEL_350;
              }
              if (v13 == 1667328353)
              {
                v18 = self;
                v19 = v12;
                v20 = v14;
                v21 = v7;
                v22 = CFSTR("selected");
                goto LABEL_362;
              }
              goto LABEL_345;
            }
            v52 = self;
            v53 = v12;
            v54 = v14;
            v55 = v7;
            v56 = CFSTR("daap.songyear");
          }
          goto LABEL_300;
        }
        if (v13 <= 1667584855)
        {
          if (v13 <= 1667330930)
          {
            if (v13 > 1667329909)
            {
              if (v13 == 1667329910)
              {
                v18 = self;
                v19 = v12;
                v20 = v14;
                v21 = v7;
                v22 = CFSTR("supportsMultiSpeakerVolume");
                goto LABEL_362;
              }
              if (v13 == 1667330162)
              {
                v28 = self;
                v29 = v12;
                v30 = v14;
                v31 = v7;
                v32 = CFSTR("dacp.protocolversion");
                goto LABEL_373;
              }
            }
            else
            {
              if (v13 == 1667328368)
              {
                v18 = self;
                v19 = v12;
                v20 = v14;
                v21 = v7;
                v22 = CFSTR("isPlaying");
                goto LABEL_362;
              }
              if (v13 == 1667328374)
              {
                v18 = self;
                v19 = v12;
                v20 = v14;
                v21 = v7;
                v22 = CFSTR("supportsVideo");
                goto LABEL_362;
              }
            }
          }
          else if (v13 <= 1667331683)
          {
            if (v13 == 1667330931)
            {
              v18 = self;
              v19 = v12;
              v20 = v14;
              v21 = v7;
              v22 = CFSTR("supportsSpeakerSelection");
              goto LABEL_362;
            }
            if (v13 == 1667330933)
            {
              v18 = self;
              v19 = v12;
              v20 = v14;
              v21 = v7;
              v22 = CFSTR("supportsSetUserRating");
              goto LABEL_362;
            }
          }
          else
          {
            switch(v13)
            {
              case 1667331684:
                v18 = self;
                v19 = v12;
                v20 = v14;
                v21 = v7;
                v22 = CFSTR("selectedForVideo");
                goto LABEL_362;
              case 1667584343:
                v28 = self;
                v29 = v12;
                v30 = v14;
                v31 = v7;
                v32 = CFSTR("com.apple.itunes.playqueue-warning-threshold");
                goto LABEL_373;
              case 1667584839:
                v18 = self;
                v19 = v12;
                v20 = v14;
                v21 = v7;
                v22 = CFSTR("com.apple.itunes.supports-genius-control");
                goto LABEL_362;
            }
          }
          goto LABEL_345;
        }
        if (v13 <= 1668114787)
        {
          if (v13 <= 1668113004)
          {
            if (v13 == 1667584856)
            {
              v33 = self;
              v34 = v12;
              v35 = v14;
              v36 = v7;
              v37 = CFSTR("kExtDACPSupportediTunesExtensionsCode");
              goto LABEL_371;
            }
            if (v13 == 1668112996)
            {
              v23 = self;
              v24 = v12;
              v25 = v14;
              v26 = v7;
              v27 = CFSTR("libraryDisplayName");
              goto LABEL_358;
            }
          }
          else
          {
            switch(v13)
            {
              case 1668113005:
                v23 = self;
                v24 = v12;
                v25 = v14;
                v26 = v7;
                v27 = CFSTR("libraryServiceDomain");
                goto LABEL_358;
              case 1668113011:
                v23 = self;
                v24 = v12;
                v25 = v14;
                v26 = v7;
                v27 = CFSTR("libraryServiceName");
                goto LABEL_358;
              case 1668113012:
                v23 = self;
                v24 = v12;
                v25 = v14;
                v26 = v7;
                v27 = CFSTR("libraryServiceType");
LABEL_358:
                -[BLPurchaseDAAPParser setString:size:inDict:forKey:](v23, "setString:size:inDict:forKey:", v24, v25, v26, v27);
                goto LABEL_374;
            }
          }
          goto LABEL_345;
        }
        if (v13 > 1668115821)
        {
          switch(v13)
          {
            case 1668115822:
              v28 = self;
              v29 = v12;
              v30 = v14;
              v31 = v7;
              v32 = CFSTR("minimum");
              goto LABEL_373;
            case 1668115832:
              v28 = self;
              v29 = v12;
              v30 = v14;
              v31 = v7;
              v32 = CFSTR("maximum");
              goto LABEL_373;
            case 1668116077:
              v23 = self;
              v24 = v12;
              v25 = v14;
              v26 = v7;
              v27 = CFSTR("name");
              goto LABEL_358;
          }
          goto LABEL_345;
        }
        if (v13 == 1668114788)
        {
          v23 = self;
          v24 = v12;
          v25 = v14;
          v26 = v7;
          v27 = CFSTR("identifier");
          goto LABEL_358;
        }
        v50 = 1668114795;
        goto LABEL_221;
      }
      if (v13 > 1835624552)
      {
        if (v13 > 1836216433)
        {
          if (v13 > 1836279917)
          {
            if (v13 <= 1836282995)
            {
              if (v13 == 1836279918)
              {
                v28 = self;
                v29 = v12;
                v30 = v14;
                v31 = v7;
                v32 = CFSTR("headerItemCount");
                goto LABEL_373;
              }
              if (v13 == 1836281185)
              {
                v33 = self;
                v34 = v12;
                v35 = v14;
                v36 = v7;
                v37 = CFSTR("macAddress");
                goto LABEL_371;
              }
            }
            else
            {
              switch(v13)
              {
                case 1836282996:
                  v28 = self;
                  v29 = v12;
                  v30 = v14;
                  v31 = v7;
                  v32 = CFSTR("dmap.status");
                  goto LABEL_373;
                case 1885434736:
                  v23 = self;
                  v24 = v12;
                  v25 = v14;
                  v26 = v7;
                  v27 = CFSTR("aspectRatio");
                  goto LABEL_358;
                case 1885758580:
                  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v12, v14);
                  v15 = (void *)objc_claimAutoreleasedReturnValue();
                  v47 = v7;
                  v48 = v15;
                  v49 = CFSTR("fileData");
LABEL_364:
                  objc_msgSend(v47, "setObject:forKey:", v48, v49);
                  goto LABEL_365;
              }
            }
          }
          else if (v13 <= 1836278132)
          {
            if (v13 == 1836216434)
            {
              v33 = self;
              v34 = v12;
              v35 = v14;
              v36 = v7;
              v37 = CFSTR("dmap.remotepersistentid");
              goto LABEL_371;
            }
            if (v13 == 1836278131)
            {
              v41 = self;
              v42 = v12;
              v43 = v14;
              v44 = v7;
              v45 = CFSTR("dmap.authenticationschemes");
              goto LABEL_350;
            }
          }
          else
          {
            switch(v13)
            {
              case 1836278133:
                v41 = self;
                v42 = v12;
                v43 = v14;
                v44 = v7;
                v45 = CFSTR("dmap.authenticationmethod");
                goto LABEL_350;
              case 1836279907:
                -[BLPurchaseDAAPParser parseUnicodeCharacter:count:](self, "parseUnicodeCharacter:count:", v12, v14);
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                v47 = v7;
                v48 = v15;
                v49 = CFSTR("headerItemCharacter");
                goto LABEL_364;
              case 1836279913:
                v28 = self;
                v29 = v12;
                v30 = v14;
                v31 = v7;
                v32 = CFSTR("headerItemIndex");
LABEL_373:
                -[BLPurchaseDAAPParser setUInt32:size:inDict:forKey:](v28, "setUInt32:size:inDict:forKey:", v29, v30, v31, v32);
                goto LABEL_374;
            }
          }
          goto LABEL_345;
        }
        if (v13 <= 1835625826)
        {
          if (v13 > 1835625315)
          {
            if (v13 == 1835625316)
            {
              v41 = self;
              v42 = v12;
              v43 = v14;
              v44 = v7;
              v45 = CFSTR("dmap.itemkind");
              goto LABEL_350;
            }
            if (v13 == 1835625572)
            {
              v33 = self;
              v34 = v12;
              v35 = v14;
              v36 = v7;
              v37 = CFSTR("dmap.longitemid");
              goto LABEL_371;
            }
            goto LABEL_345;
          }
          if (v13 == 1835624553)
          {
            v18 = self;
            v19 = v12;
            v20 = v14;
            v21 = v7;
            v22 = CFSTR("dmap.itemhidden");
            goto LABEL_362;
          }
          if (v13 != 1835624804)
            goto LABEL_345;
          if ((_DWORD)v14 == 8)
          {
            v51 = -[BLPurchaseDAAPParser SwapInt64BigToHost:size:](self, "SwapInt64BigToHost:size:", v12, 8);
            goto LABEL_369;
          }
          if ((_DWORD)v14 == 4)
          {
            v51 = bswap32(*v12);
LABEL_369:
            objc_msgSend(v7, "setItemID:", v51);
          }
        }
        else if (v13 <= 1835821427)
        {
          if (v13 == 1835625827)
          {
            v28 = self;
            v29 = v12;
            v30 = v14;
            v31 = v7;
            v32 = CFSTR("dmap.itemcount");
            goto LABEL_373;
          }
          if (v13 != 1835626093)
            goto LABEL_345;
          if (v10)
          {
            -[BLPurchaseDAAPParser parseUTF8String:length:](self, "parseUTF8String:length:", v12, v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "setName:", v15);
            goto LABEL_365;
          }
        }
        else if (v13 != 1835821428)
        {
          if (v13 != 1836082031)
          {
            if (v13 == 1836082546)
            {
              v33 = self;
              v34 = v12;
              v35 = v14;
              v36 = v7;
              v37 = CFSTR("dmap.persistentid");
              goto LABEL_371;
            }
LABEL_345:
            -[BLPurchaseDAAPParser unknownCode:bytes:size:context:](self, "unknownCode:bytes:size:context:");
            goto LABEL_374;
          }
          if ((_DWORD)v14 == 8)
          {
            v33 = self;
            v34 = v12;
            v35 = 8;
            v36 = v7;
            v37 = CFSTR("dmap.parentcontainerid");
            goto LABEL_371;
          }
          if ((_DWORD)v14 == 4)
          {
            v28 = self;
            v29 = v12;
            v30 = 4;
            v31 = v7;
            v32 = CFSTR("dmap.parentcontainerid");
            goto LABEL_373;
          }
        }
      }
      else if (v13 <= 1668444011)
      {
        if (v13 <= 1668117359)
        {
          if (v13 > 1668117345)
          {
            if (v13 == 1668117346)
            {
              v18 = self;
              v19 = v12;
              v20 = v14;
              v21 = v7;
              v22 = CFSTR("supportsBonjourSourcesUpdates");
              goto LABEL_362;
            }
            if (v13 == 1668117347)
            {
              v18 = self;
              v19 = v12;
              v20 = v14;
              v21 = v7;
              v22 = CFSTR("supportsControlPromptRequests");
              goto LABEL_362;
            }
          }
          else
          {
            if (v13 == 1668116594)
            {
              v28 = self;
              v29 = v12;
              v30 = v14;
              v31 = v7;
              v32 = CFSTR("dmcp.protocolversion");
              goto LABEL_373;
            }
            if (v13 == 1668117100)
            {
              v18 = self;
              v19 = v12;
              v20 = v14;
              v21 = v7;
              v22 = CFSTR("supportsRemoteLibrarySelection");
              goto LABEL_362;
            }
          }
          goto LABEL_345;
        }
        if (v13 <= 1668118123)
        {
          if (v13 == 1668117360)
          {
            v18 = self;
            v19 = v12;
            v20 = v14;
            v21 = v7;
            v22 = CFSTR("supportsPlayStatusUpdate");
            goto LABEL_362;
          }
          if (v13 == 1668117366)
          {
            v18 = self;
            v19 = v12;
            v20 = v14;
            v21 = v7;
            v22 = CFSTR("supportsVolume");
            goto LABEL_362;
          }
          goto LABEL_345;
        }
        if (v13 == 1668118124)
        {
          -[BLPurchaseDAAPParser parseListingCollection:count:capacity:](self, "parseListingCollection:count:capacity:", v12, v14, 0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = v7;
          v48 = v15;
          v49 = CFSTR("context");
          goto LABEL_364;
        }
        if (v13 == 1668118127)
        {
          v62 = (float)bswap32(*v12) / 100.0;
          v63 = objc_alloc(MEMORY[0x24BDD16E0]);
          *(float *)&v64 = v62;
          v15 = (void *)objc_msgSend(v63, "initWithFloat:", v64);
          v47 = v7;
          v48 = v15;
          v49 = CFSTR("volume");
          goto LABEL_364;
        }
        if (v13 != 1668118132)
          goto LABEL_345;
        if (v10 == 0x2000000)
        {
          v71 = bswap32(*(unsigned __int16 *)v12) >> 16;
          objc_msgSend((id)objc_opt_class(), "typeForDRCPValueType:", v71);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = v7;
          v39 = v15;
          v40 = CFSTR("type");
LABEL_367:
          objc_msgSend(v38, "setValue:forKey:", v39, v40);
          goto LABEL_365;
        }
      }
      else if (v13 > 1835295338)
      {
        if (v13 <= 1835299699)
        {
          if (v13 == 1835295339)
          {
            v28 = self;
            v29 = v12;
            v30 = v14;
            v31 = v7;
            v32 = CFSTR("dmap.databasekind");
            goto LABEL_373;
          }
          if (v13 != 1835295596)
            goto LABEL_345;
          -[BLPurchaseDAAPParser parseDict:size:intoDict:](self, "parseDict:size:intoDict:", v12, v14, v7);
        }
        else
        {
          if (v13 != 1835299700)
          {
            if (v13 == 1835364978)
            {
              v28 = self;
              v29 = v12;
              v30 = v14;
              v31 = v7;
              v32 = CFSTR("dmap.errorresponse");
              goto LABEL_373;
            }
            if (v13 == 1835492467)
            {
              v41 = self;
              v42 = v12;
              v43 = v14;
              v44 = v7;
              v45 = CFSTR("dmap.groupdownloadstatus");
              goto LABEL_350;
            }
            goto LABEL_345;
          }
          objc_msgSend(v7, "setDownloadStatus:", *(unsigned __int8 *)v12);
        }
      }
      else
      {
        if (v13 <= 1835103851)
        {
          if (v13 == 1668444012)
          {
            v18 = self;
            v19 = v12;
            v20 = v14;
            v21 = v7;
            v22 = CFSTR("readOnly");
            goto LABEL_362;
          }
          if (v13 == 1668702572)
          {
            switch(v71)
            {
              case 1:
                -[BLPurchaseDAAPParser setBool:size:inDict:forKey:](self, "setBool:size:inDict:forKey:", v12, v14, v7, CFSTR("value"));
                v66 = 1;
                goto LABEL_380;
              case 2:
                -[BLPurchaseDAAPParser setUInt16:size:inDict:forKey:](self, "setUInt16:size:inDict:forKey:", v12, v14, v7, CFSTR("value"));
                v66 = 2;
                goto LABEL_380;
              case 3:
                -[BLPurchaseDAAPParser setUInt32:size:inDict:forKey:](self, "setUInt32:size:inDict:forKey:", v12, v14, v7, CFSTR("value"));
                v66 = 3;
                goto LABEL_380;
              case 4:
                -[BLPurchaseDAAPParser setFloat32:size:inDict:forKey:](self, "setFloat32:size:inDict:forKey:", v12, v14, v7, CFSTR("value"));
                v66 = 4;
LABEL_380:
                v71 = v66;
                break;
              case 5:
              case 6:
              case 7:
                v23 = self;
                v24 = v12;
                v25 = v14;
                v26 = v7;
                v27 = CFSTR("value");
                goto LABEL_358;
              default:
                goto LABEL_374;
            }
            goto LABEL_374;
          }
          goto LABEL_345;
        }
        if (v13 == 1835103852)
        {
          v18 = self;
          v19 = v12;
          v20 = v14;
          v21 = v7;
          v22 = CFSTR("dmap.itemavailable");
          goto LABEL_362;
        }
        if (v13 == 1835234403)
        {
          v28 = self;
          v29 = v12;
          v30 = v14;
          v31 = v7;
          v32 = CFSTR("dmap.containercount");
          goto LABEL_373;
        }
        if (v13 != 1835234409)
          goto LABEL_345;
        objc_msgSend(v7, "setContainerItemID:", bswap32(*v12));
      }
    }
    else if (v13 <= 1634030404)
    {
      if (v13 <= 1634027587)
      {
        if (v13 <= 1634026336)
        {
          if (v13 > 1634025832)
          {
            switch(v13)
            {
              case 1634026322:
                v23 = self;
                v24 = v12;
                v25 = v14;
                v26 = v7;
                v27 = CFSTR("com.apple.itunes.content-rating");
                goto LABEL_358;
              case 1634026323:
                if (v10 == 0x4000000)
                {
                  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInt:", bswap32(*v12));
                  objc_msgSend(v15, "stringValue");
                  v16 = v8;
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v7, "setValue:forKey:", v17, CFSTR("com.apple.itunes.artworkchecksum"));
                  goto LABEL_356;
                }
                -[BLPurchaseDAAPParser parseUTF8String:length:](self, "parseUTF8String:length:", v12, v14);
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                v38 = v7;
                v39 = v15;
                v40 = CFSTR("com.apple.itunes.artworkchecksum");
                goto LABEL_367;
              case 1634026324:
                v23 = self;
                v24 = v12;
                v25 = v14;
                v26 = v7;
                v27 = CFSTR("com.apple.itunes.cloud-artwork-token");
                goto LABEL_358;
              case 1634026325:
                v33 = self;
                v34 = v12;
                v35 = v14;
                v36 = v7;
                v37 = CFSTR("com.apple.itunes.cloud-user-id");
                goto LABEL_371;
              default:
                if (v13 == 1634025833)
                {
                  v33 = self;
                  v34 = v12;
                  v35 = v14;
                  v36 = v7;
                  v37 = CFSTR("com.apple.itunes.adam-id");
                  goto LABEL_371;
                }
                if (v13 != 1634026308)
                  goto LABEL_345;
                v23 = self;
                v24 = v12;
                v25 = v14;
                v26 = v7;
                v27 = CFSTR("com.apple.itunes.flat-chapter-data");
                break;
            }
            goto LABEL_358;
          }
          switch(v13)
          {
            case 1633841260:
              v18 = self;
              v19 = v12;
              v20 = v14;
              v21 = v7;
              v22 = CFSTR("daap.baseplaylist");
              goto LABEL_362;
            case 1634025796:
              v33 = self;
              v34 = v12;
              v35 = v14;
              v36 = v7;
              v37 = CFSTR("com.apple.itunes.adam-ids-array");
              goto LABEL_371;
            case 1634025801:
              v33 = self;
              v34 = v12;
              v35 = v14;
              v36 = v7;
              v37 = CFSTR("com.apple.itunes.itms-artistid");
LABEL_371:
              -[BLPurchaseDAAPParser setUInt64:size:inDict:forKey:](v33, "setUInt64:size:inDict:forKey:", v34, v35, v36, v37);
              goto LABEL_374;
          }
          goto LABEL_345;
        }
        if (v13 <= 1634026356)
        {
          if (v13 > 1634026353)
          {
            if (v13 == 1634026354)
            {
              v23 = self;
              v24 = v12;
              v25 = v14;
              v26 = v7;
              v27 = CFSTR("com.apple.itunes.copyright");
              goto LABEL_358;
            }
            if (v13 == 1634026355)
            {
              v28 = self;
              v29 = v12;
              v30 = v14;
              v31 = v7;
              v32 = CFSTR("com.apple.itunes.cloud-connect-status");
              goto LABEL_373;
            }
          }
          else
          {
            if (v13 == 1634026337)
            {
              v23 = self;
              v24 = v12;
              v25 = v14;
              v26 = v7;
              v27 = CFSTR("com.apple.itunes.cloud-artwork-url");
              goto LABEL_358;
            }
            if (v13 == 1634026340)
            {
              v33 = self;
              v34 = v12;
              v35 = v14;
              v36 = v7;
              v37 = CFSTR("com.apple.itunes.cloud-id");
              goto LABEL_371;
            }
          }
          goto LABEL_345;
        }
        if (v13 <= 1634026834)
        {
          if (v13 == 1634026357)
          {
            v23 = self;
            v24 = v12;
            v25 = v14;
            v26 = v7;
            v27 = CFSTR("com.apple.itunes.chapter-metadata-url");
            goto LABEL_358;
          }
          if (v13 == 1634026830)
          {
            v23 = self;
            v24 = v12;
            v25 = v14;
            v26 = v7;
            v27 = CFSTR("com.apple.itunes.episode-num-str");
            goto LABEL_358;
          }
          goto LABEL_345;
        }
        if (v13 == 1634026835)
        {
          v28 = self;
          v29 = v12;
          v30 = v14;
          v31 = v7;
          v32 = CFSTR("com.apple.itunes.episode-sort");
          goto LABEL_373;
        }
        if (v13 == 1634027090)
        {
          v18 = self;
          v19 = v12;
          v20 = v14;
          v21 = v7;
          v22 = CFSTR("com.apple.itunes.supports-fprap");
          goto LABEL_362;
        }
        if (v13 != 1634027587)
          goto LABEL_345;
        if (*(_BYTE *)v12 == 1)
        {
          v41 = self;
          v42 = v12;
          v43 = v14;
          v44 = v7;
          v45 = CFSTR("com.apple.itunes.has-chapter-data");
LABEL_350:
          -[BLPurchaseDAAPParser setUInt8:size:inDict:forKey:](v41, "setUInt8:size:inDict:forKey:", v42, v43, v44, v45);
        }
      }
      else
      {
        if (v13 > 1634029650)
        {
          if (v13 > 1634029679)
          {
            switch(v13)
            {
              case 1634030157:
                v33 = self;
                v34 = v12;
                v35 = v14;
                v36 = v7;
                v37 = CFSTR("com.apple.itunes.remote-itunes-machine-id");
                goto LABEL_371;
              case 1634030158:
              case 1634030159:
              case 1634030161:
              case 1634030162:
              case 1634030164:
                goto LABEL_345;
              case 1634030160:
                v28 = self;
                v29 = v12;
                v30 = v14;
                v31 = v7;
                v32 = CFSTR("com.apple.itunes.rental-pb-start");
                goto LABEL_373;
              case 1634030163:
                v28 = self;
                v29 = v12;
                v30 = v14;
                v31 = v7;
                v32 = CFSTR("com.apple.itunes.rental-start");
                goto LABEL_373;
              case 1634030165:
                v28 = self;
                v29 = v12;
                v30 = v14;
                v31 = v7;
                v32 = CFSTR("com.apple.itunes.rental-pb-duration");
                goto LABEL_373;
              default:
                if (v13 == 1634029680)
                {
                  v18 = self;
                  v19 = v12;
                  v20 = v14;
                  v21 = v7;
                  v22 = CFSTR("com.apple.itunes.publication-is-picture-book");
                  goto LABEL_362;
                }
                if (v13 != 1634030148)
                  goto LABEL_345;
                v28 = self;
                v29 = v12;
                v30 = v14;
                v31 = v7;
                v32 = CFSTR("com.apple.itunes.rental-duration");
                break;
            }
            goto LABEL_373;
          }
          switch(v13)
          {
            case 1634029651:
              v41 = self;
              v42 = v12;
              v43 = v14;
              v44 = v7;
              v45 = CFSTR("com.apple.itunes.special-playlist");
              goto LABEL_350;
            case 1634029665:
              v18 = self;
              v19 = v12;
              v20 = v14;
              v21 = v7;
              v22 = CFSTR("com.apple.itunes.publication-contains-audio");
              goto LABEL_362;
            case 1634029676:
              v18 = self;
              v19 = v12;
              v20 = v14;
              v21 = v7;
              v22 = CFSTR("com.apple.itunes.publication-is-read-aloud");
              goto LABEL_362;
          }
          goto LABEL_345;
        }
        if (v13 > 1634028874)
        {
          if (v13 <= 1634028906)
          {
            if (v13 == 1634028875)
            {
              v41 = self;
              v42 = v12;
              v43 = v14;
              v44 = v7;
              v45 = CFSTR("com.apple.itunes.mediakind");
              goto LABEL_350;
            }
            if (v13 == 1634028888)
            {
              -[BLPurchaseDAAPParser parseXMLContent:count:](self, "parseXMLContent:count:", v12, v14);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v15)
                goto LABEL_365;
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
                goto LABEL_365;
              v47 = v7;
              v48 = v15;
              v49 = CFSTR("com.apple.itunes.movie-info-xml");
              goto LABEL_364;
            }
            goto LABEL_345;
          }
          if (v13 == 1634028907)
          {
            if ((_DWORD)v14 == 4)
            {
              v28 = self;
              v29 = v12;
              v30 = 4;
              v31 = v7;
              v32 = CFSTR("com.apple.itunes.extended-media-kind");
              goto LABEL_373;
            }
            if ((_DWORD)v14 == 1)
            {
              v41 = self;
              v42 = v12;
              v43 = 1;
              v44 = v7;
              v45 = CFSTR("com.apple.itunes.extended-media-kind");
              goto LABEL_350;
            }
            goto LABEL_374;
          }
          if (v13 == 1634029635)
          {
            v41 = self;
            v42 = v12;
            v43 = v14;
            v44 = v7;
            v45 = CFSTR("com.apple.itunes.is-podcast");
            goto LABEL_350;
          }
          v46 = 20553;
LABEL_145:
          v50 = v46 | 0x61650000;
LABEL_221:
          if (v13 != v50)
            goto LABEL_345;
          goto LABEL_374;
        }
        if (v13 <= 1634027605)
        {
          if (v13 == 1634027588)
          {
            v41 = self;
            v42 = v12;
            v43 = v14;
            v44 = v7;
            v45 = CFSTR("com.apple.itunes.is-hd-video");
            goto LABEL_350;
          }
          if (v13 == 1634027603)
          {
            v18 = self;
            v19 = v12;
            v20 = v14;
            v21 = v7;
            v22 = CFSTR("com.apple.itunes.is-homeshare");
            goto LABEL_362;
          }
          goto LABEL_345;
        }
        if (v13 != 1634027606)
        {
          if (v13 == 1634027853)
          {
            v33 = self;
            v34 = v12;
            v35 = v14;
            v36 = v7;
            v37 = CFSTR("com.apple.itunes.itunes-machine-id");
            goto LABEL_371;
          }
          if (v13 == 1634028873)
          {
            v18 = self;
            v19 = v12;
            v20 = v14;
            v21 = v7;
            v22 = CFSTR("com.apple.itunes.mastered-for-itunes");
LABEL_362:
            -[BLPurchaseDAAPParser setBool:size:inDict:forKey:](v18, "setBool:size:inDict:forKey:", v19, v20, v21, v22);
            goto LABEL_374;
          }
          goto LABEL_345;
        }
        if (*(_BYTE *)v12 == 1)
        {
          v41 = self;
          v42 = v12;
          v43 = v14;
          v44 = v7;
          v45 = CFSTR("com.apple.itunes.has-video");
          goto LABEL_350;
        }
      }
    }
    else
    {
      if (v13 <= 1634951520)
      {
        if (v13 > 1634165090)
        {
          if (v13 > 1634354531)
          {
            if (v13 <= 1634363508)
            {
              if (v13 == 1634354532)
              {
                v57 = self;
                v58 = v12;
                v59 = v14;
                v60 = v7;
                v61 = CFSTR("com.apple.itunes.preorder-expected-date");
LABEL_333:
                -[BLPurchaseDAAPParser setDate:size:inDict:forKey:](v57, "setDate:size:inDict:forKey:", v58, v59, v60, v61);
                goto LABEL_374;
              }
              if (v13 == 1634355312)
              {
                v41 = self;
                v42 = v12;
                v43 = v14;
                v44 = v7;
                v45 = CFSTR("com.apple.itunes.store.supports-hls-playback");
                goto LABEL_350;
              }
            }
            else
            {
              switch(v13)
              {
                case 1634363509:
                  v23 = self;
                  v24 = v12;
                  v25 = v14;
                  v26 = v7;
                  v27 = CFSTR("com.apple.itunes.store.hls-playback-url");
                  goto LABEL_358;
                case 1634759277:
                  v41 = self;
                  v42 = v12;
                  v43 = v14;
                  v44 = v7;
                  v45 = CFSTR("daap.playlistrepeatmode");
                  goto LABEL_350;
                case 1634759533:
                  v41 = self;
                  v42 = v12;
                  v43 = v14;
                  v44 = v7;
                  v45 = CFSTR("daap.playlistshufflemode");
                  goto LABEL_350;
              }
            }
          }
          else if (v13 <= 1634168168)
          {
            if (v13 == 1634165091)
            {
              v28 = self;
              v29 = v12;
              v30 = v14;
              v31 = v7;
              v32 = CFSTR("daap.groupalbumcount");
              goto LABEL_373;
            }
            if (v13 == 1634168161)
            {
              v28 = self;
              v29 = v12;
              v30 = v14;
              v31 = v7;
              v32 = CFSTR("daap.groupmatchedqueryalbumcount");
              goto LABEL_373;
            }
          }
          else
          {
            switch(v13)
            {
              case 1634168169:
                v28 = self;
                v29 = v12;
                v30 = v14;
                v31 = v7;
                v32 = CFSTR("daap.groupmatchedqueryitemcount");
                goto LABEL_373;
              case 1634169456:
                v23 = self;
                v24 = v12;
                v25 = v14;
                v26 = v7;
                v27 = CFSTR("daap.songgrouping");
                goto LABEL_358;
              case 1634353740:
                -[BLPurchaseDAAPParser parseBookletListing:count:](self, "parseBookletListing:count:", v12, v14);
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                v72 = v8;
                v73 = v15;
                objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v73, &v72, 1);
                v16 = v8;
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v7, "updateItemWithDictionary:", v17);
LABEL_356:

                v8 = v16;
                goto LABEL_365;
            }
          }
          goto LABEL_345;
        }
        if (v13 <= 1634030420)
        {
          switch(v13)
          {
            case 1634030405:
              v33 = self;
              v34 = v12;
              v35 = v14;
              v36 = v7;
              v37 = CFSTR("com.apple.itunes.store-pers-id");
              goto LABEL_371;
            case 1634030407:
              v18 = self;
              v19 = v12;
              v20 = v14;
              v21 = v7;
              v22 = CFSTR("com.apple.itunes.saved-genius");
              goto LABEL_362;
            case 1634030409:
              if ((_DWORD)v14 == 8)
              {
                v65 = -[BLPurchaseDAAPParser SwapInt64BigToHost:size:](self, "SwapInt64BigToHost:size:", v12, 8);
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v65);
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                v47 = v7;
                v48 = v15;
                v49 = CFSTR("com.apple.itunes.itms-songid");
                goto LABEL_364;
              }
              if ((_DWORD)v14 != 4)
                goto LABEL_374;
              v28 = self;
              v29 = v12;
              v30 = 4;
              v31 = v7;
              v32 = CFSTR("com.apple.itunes.itms-songid");
              break;
            case 1634030414:
              v23 = self;
              v24 = v12;
              v25 = v14;
              v26 = v7;
              v27 = CFSTR("com.apple.itunes.series-name");
              goto LABEL_358;
            case 1634030416:
              v18 = self;
              v19 = v12;
              v20 = v14;
              v21 = v7;
              v22 = CFSTR("com.apple.itunes.smart-playlist");
              goto LABEL_362;
            default:
              goto LABEL_345;
          }
          goto LABEL_373;
        }
        if (v13 > 1634035307)
        {
          if (v13 == 1634035308)
          {
            -[BLPurchaseDAAPParser parseFlavorListing:size:](self, "parseFlavorListing:size:", v12, v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = v7;
            v48 = v15;
            v49 = CFSTR("com.apple.itunes.item-flavor-listing");
            goto LABEL_364;
          }
          if (v13 == 1634038895)
          {
            v28 = self;
            v29 = v12;
            v30 = v14;
            v31 = v7;
            v32 = CFSTR("com.apple.itunes.cloud-purchased-token");
            goto LABEL_373;
          }
          goto LABEL_345;
        }
        if (v13 == 1634030421)
        {
          v28 = self;
          v29 = v12;
          v30 = v14;
          v31 = v7;
          v32 = CFSTR("com.apple.itunes.season-num");
          goto LABEL_373;
        }
        v46 = 21618;
        goto LABEL_145;
      }
      if (v13 > 1634952289)
      {
        switch(v13)
        {
          case 1634952290:
            v18 = self;
            v19 = v12;
            v20 = v14;
            v21 = v7;
            v22 = CFSTR("daap.songdisabled");
            goto LABEL_362;
          case 1634952291:
            v52 = self;
            v53 = v12;
            v54 = v14;
            v55 = v7;
            v56 = CFSTR("daap.songdisccount");
            goto LABEL_300;
          case 1634952299:
            goto LABEL_374;
          case 1634952301:
            v57 = self;
            v58 = v12;
            v59 = v14;
            v60 = v7;
            v61 = CFSTR("daap.songdatemodified");
            goto LABEL_333;
          case 1634952302:
            v52 = self;
            v53 = v12;
            v54 = v14;
            v55 = v7;
            v56 = CFSTR("daap.songdiscnumber");
            goto LABEL_300;
          case 1634952304:
            v57 = self;
            v58 = v12;
            v59 = v14;
            v60 = v7;
            v61 = CFSTR("daap.songdatepurchased");
            goto LABEL_333;
          case 1634952306:
            v57 = self;
            v58 = v12;
            v59 = v14;
            v60 = v7;
            v61 = CFSTR("daap.songdatereleased");
            goto LABEL_333;
          case 1634952308:
            v23 = self;
            v24 = v12;
            v25 = v14;
            v26 = v7;
            v27 = CFSTR("daap.songdescription");
            goto LABEL_358;
          default:
            goto LABEL_345;
        }
        goto LABEL_374;
      }
      if (v13 > 1634951786)
      {
        switch(v13)
        {
          case 1634952046:
            v23 = self;
            v24 = v12;
            v25 = v14;
            v26 = v7;
            v27 = CFSTR("daap.songcontentdescription");
            goto LABEL_358;
          case 1634952047:
          case 1634952049:
          case 1634952051:
            goto LABEL_345;
          case 1634952048:
            v23 = self;
            v24 = v12;
            v25 = v14;
            v26 = v7;
            v27 = CFSTR("daap.songcomposer");
            goto LABEL_358;
          case 1634952050:
            v41 = self;
            v42 = v12;
            v43 = v14;
            v44 = v7;
            v45 = CFSTR("daap.songcontentrating");
            goto LABEL_350;
          case 1634952052:
            v23 = self;
            v24 = v12;
            v25 = v14;
            v26 = v7;
            v27 = CFSTR("daap.songcategory");
            goto LABEL_358;
          default:
            if (v13 == 1634951787)
            {
              v41 = self;
              v42 = v12;
              v43 = v14;
              v44 = v7;
              v45 = CFSTR("daap.bookmarkable");
              goto LABEL_350;
            }
            if (v13 != 1634951791)
              goto LABEL_345;
            v28 = self;
            v29 = v12;
            v30 = v14;
            v31 = v7;
            v32 = CFSTR("daap.songbookmark");
            break;
        }
        goto LABEL_373;
      }
      if (v13 <= 1634951528)
      {
        if (v13 != 1634951521)
        {
          if (v13 != 1634951523)
            goto LABEL_345;
          v52 = self;
          v53 = v12;
          v54 = v14;
          v55 = v7;
          v56 = CFSTR("daap.songartworkcount");
LABEL_300:
          -[BLPurchaseDAAPParser setUInt16:size:inDict:forKey:](v52, "setUInt16:size:inDict:forKey:", v53, v54, v55, v56);
          goto LABEL_374;
        }
        if (v10)
        {
          -[BLPurchaseDAAPParser parseUTF8String:length:](self, "parseUTF8String:length:", v12, v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setSongalbumartist:", v15);
          goto LABEL_365;
        }
      }
      else
      {
        switch(v13)
        {
          case 1634951529:
            objc_msgSend(v7, "setSongalbumid:", -[BLPurchaseDAAPParser SwapInt64BigToHost:size:](self, "SwapInt64BigToHost:size:", v12, v14));
            break;
          case 1634951532:
            if (v10)
            {
              -[BLPurchaseDAAPParser parseUTF8String:length:](self, "parseUTF8String:length:", v12, v14);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "setSongalbum:", v15);
              goto LABEL_365;
            }
            break;
          case 1634951538:
            if (v10)
            {
              -[BLPurchaseDAAPParser parseUTF8String:length:](self, "parseUTF8String:length:", v12, v14);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "setSongartist:", v15);
LABEL_365:

            }
            break;
          default:
            goto LABEL_345;
        }
      }
    }
LABEL_374:
    a3 = (char *)v12 + v14;
    a4 = a4 - 8 - v14;
    if (a4 <= 0)
      goto LABEL_381;
  }
  BLJaliscoLog();
  v68 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v75 = "-[BLPurchaseDAAPParser parseListingItem:count:]";
    v76 = 2048;
    v77 = 4;
    v78 = 2048;
    v79 = a4;
    _os_log_impl(&dword_212C78000, v68, OS_LOG_TYPE_ERROR, "ERROR: %s, Invalid data in DAAP response: trying to read %ld bytes from a buffer of size %ld", buf, 0x20u);
  }

LABEL_388:
  v67 = 0;
LABEL_389:

  return v67;
}

- (id)parseBookletListing:(const char *)a3 count:(int64_t)a4
{
  void *v7;
  int64_t v8;
  unint64_t v9;
  int64_t v10;
  BOOL v11;
  unsigned int v12;
  const char *v13;
  unsigned int v14;
  void *v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  int v21;
  const char *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  int64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v7 = (void *)objc_opt_new();
  if (a4 < 1)
  {
LABEL_10:
    v16 = v7;
  }
  else
  {
    while ((unint64_t)a4 > 3)
    {
      v8 = a4 - 4;
      if ((unint64_t)(a4 - 4) <= 3)
      {
        BLJaliscoLog();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          v21 = 136315650;
          v22 = "-[BLPurchaseDAAPParser parseBookletListing:count:]";
          v23 = 2048;
          v24 = 4;
          v25 = 2048;
          v26 = v8;
          goto LABEL_18;
        }
LABEL_19:

        goto LABEL_20;
      }
      v9 = bswap32(*((_DWORD *)a3 + 1));
      v10 = a4 - 8;
      v11 = a4 - 8 >= v9;
      a4 = a4 - 8 - v9;
      if (!v11)
      {
        BLJaliscoLog();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          v21 = 136315650;
          v22 = "-[BLPurchaseDAAPParser parseBookletListing:count:]";
          v23 = 2048;
          v24 = v9;
          v25 = 2048;
          v26 = v10;
LABEL_18:
          _os_log_impl(&dword_212C78000, v18, OS_LOG_TYPE_ERROR, "ERROR: %s, Invalid data in DAAP response: trying to read %ld bytes from a buffer of size %ld", (uint8_t *)&v21, 0x20u);
        }
        goto LABEL_19;
      }
      v14 = *(_DWORD *)a3;
      v13 = a3 + 8;
      v12 = v14;
      if (v14 == 1765960289)
      {
        -[BLPurchaseDAAPParser parseBookletItem:count:](self, "parseBookletItem:count:", v13, v9);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v15);

      }
      else
      {
        -[BLPurchaseDAAPParser unknownCode:bytes:size:context:](self, "unknownCode:bytes:size:context:", bswap32(v12), v13, v9, "-[BLPurchaseDAAPParser parseBookletListing:count:]");
      }
      a3 = &v13[v9];
      if (a4 <= 0)
        goto LABEL_10;
    }
    BLJaliscoLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v21 = 136315650;
      v22 = "-[BLPurchaseDAAPParser parseBookletListing:count:]";
      v23 = 2048;
      v24 = 4;
      v25 = 2048;
      v26 = a4;
      _os_log_impl(&dword_212C78000, v17, OS_LOG_TYPE_ERROR, "ERROR: %s, Invalid data in DAAP response: trying to read %ld bytes from a buffer of size %ld", (uint8_t *)&v21, 0x20u);
    }

LABEL_20:
    v16 = 0;
  }

  return v16;
}

- (id)parseBookletItem:(const char *)a3 count:(int64_t)a4
{
  void *v7;
  int64_t v8;
  unint64_t v9;
  int64_t v10;
  BOOL v11;
  const char *v12;
  unsigned int v13;
  uint64_t v14;
  BLPurchaseDAAPParser *v15;
  const char *v16;
  unint64_t v17;
  void *v18;
  const __CFString *v19;
  BLPurchaseDAAPParser *v20;
  const char *v21;
  unint64_t v22;
  void *v23;
  const __CFString *v24;
  id v25;
  NSObject *v26;
  NSObject *v27;
  int v30;
  const char *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  int64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v7 = (void *)objc_opt_new();
  if (a4 < 1)
  {
LABEL_19:
    v25 = v7;
    goto LABEL_30;
  }
  while ((unint64_t)a4 > 3)
  {
    v8 = a4 - 4;
    if ((unint64_t)(a4 - 4) <= 3)
    {
      BLJaliscoLog();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v30 = 136315650;
        v31 = "-[BLPurchaseDAAPParser parseBookletItem:count:]";
        v32 = 2048;
        v33 = 4;
        v34 = 2048;
        v35 = v8;
        goto LABEL_27;
      }
LABEL_28:

      goto LABEL_29;
    }
    v9 = bswap32(*((_DWORD *)a3 + 1));
    v10 = a4 - 8;
    v11 = a4 - 8 >= v9;
    a4 = a4 - 8 - v9;
    if (!v11)
    {
      BLJaliscoLog();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v30 = 136315650;
        v31 = "-[BLPurchaseDAAPParser parseBookletItem:count:]";
        v32 = 2048;
        v33 = v9;
        v34 = 2048;
        v35 = v10;
LABEL_27:
        _os_log_impl(&dword_212C78000, v27, OS_LOG_TYPE_ERROR, "ERROR: %s, Invalid data in DAAP response: trying to read %ld bytes from a buffer of size %ld", (uint8_t *)&v30, 0x20u);
      }
      goto LABEL_28;
    }
    v13 = *(_DWORD *)a3;
    v12 = a3 + 8;
    v14 = bswap32(v13);
    if ((int)v14 > 1634353773)
    {
      if ((_DWORD)v14 == 1634353779)
      {
        v20 = self;
        v21 = v12;
        v22 = v9;
        v23 = v7;
        v24 = CFSTR("com.apple.itunes.store.booklet-item-size");
        goto LABEL_16;
      }
      if ((_DWORD)v14 != 1634353774)
      {
LABEL_17:
        -[BLPurchaseDAAPParser unknownCode:bytes:size:context:](self, "unknownCode:bytes:size:context:", v14, v12, v9, "-[BLPurchaseDAAPParser parseBookletItem:count:]");
        goto LABEL_18;
      }
      v15 = self;
      v16 = v12;
      v17 = v9;
      v18 = v7;
      v19 = CFSTR("com.apple.itunes.store.booklet-item-name");
    }
    else
    {
      if ((_DWORD)v14 == 1634353761)
      {
        v20 = self;
        v21 = v12;
        v22 = v9;
        v23 = v7;
        v24 = CFSTR("com.apple.itunes.store.booklet-item-store-id");
LABEL_16:
        -[BLPurchaseDAAPParser setUInt64:size:inDict:forKey:](v20, "setUInt64:size:inDict:forKey:", v21, v22, v23, v24);
        goto LABEL_18;
      }
      if ((_DWORD)v14 != 1634353764)
        goto LABEL_17;
      v15 = self;
      v16 = v12;
      v17 = v9;
      v18 = v7;
      v19 = CFSTR("com.apple.itunes.store.booklet-item-redownload-param");
    }
    -[BLPurchaseDAAPParser setString:size:inDict:forKey:](v15, "setString:size:inDict:forKey:", v16, v17, v18, v19);
LABEL_18:
    a3 = &v12[v9];
    if (a4 <= 0)
      goto LABEL_19;
  }
  BLJaliscoLog();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    v30 = 136315650;
    v31 = "-[BLPurchaseDAAPParser parseBookletItem:count:]";
    v32 = 2048;
    v33 = 4;
    v34 = 2048;
    v35 = a4;
    _os_log_impl(&dword_212C78000, v26, OS_LOG_TYPE_ERROR, "ERROR: %s, Invalid data in DAAP response: trying to read %ld bytes from a buffer of size %ld", (uint8_t *)&v30, 0x20u);
  }

LABEL_29:
  v25 = 0;
LABEL_30:

  return v25;
}

- (id)parseListingCollection:(const char *)a3 count:(int64_t)a4 capacity:(int)a5
{
  void *v8;
  int64_t v9;
  unint64_t v10;
  int64_t v11;
  BOOL v12;
  const char *v13;
  unsigned int v14;
  uint64_t v15;
  void *v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  int v22;
  const char *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  int64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 < 1)
  {
LABEL_11:
    v17 = v8;
  }
  else
  {
    while ((unint64_t)a4 > 3)
    {
      v9 = a4 - 4;
      if ((unint64_t)(a4 - 4) <= 3)
      {
        BLJaliscoLog();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          v22 = 136315650;
          v23 = "-[BLPurchaseDAAPParser parseListingCollection:count:capacity:]";
          v24 = 2048;
          v25 = 4;
          v26 = 2048;
          v27 = v9;
          goto LABEL_19;
        }
LABEL_20:

        goto LABEL_21;
      }
      v10 = bswap32(*((_DWORD *)a3 + 1));
      v11 = a4 - 8;
      v12 = a4 - 8 >= v10;
      a4 = a4 - 8 - v10;
      if (!v12)
      {
        BLJaliscoLog();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          v22 = 136315650;
          v23 = "-[BLPurchaseDAAPParser parseListingCollection:count:capacity:]";
          v24 = 2048;
          v25 = v10;
          v26 = 2048;
          v27 = v11;
LABEL_19:
          _os_log_impl(&dword_212C78000, v19, OS_LOG_TYPE_ERROR, "ERROR: %s, Invalid data in DAAP response: trying to read %ld bytes from a buffer of size %ld", (uint8_t *)&v22, 0x20u);
        }
        goto LABEL_20;
      }
      v14 = *(_DWORD *)a3;
      v13 = a3 + 8;
      v15 = bswap32(v14);
      if ((_DWORD)v15 != 1836282996)
      {
        if ((_DWORD)v15 == 1835821428)
        {
          -[BLPurchaseDAAPParser parseListingItem:count:](self, "parseListingItem:count:", v13, v10);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v16);

        }
        else
        {
          -[BLPurchaseDAAPParser unknownCode:bytes:size:context:](self, "unknownCode:bytes:size:context:", v15, v13, v10, "-[BLPurchaseDAAPParser parseListingCollection:count:capacity:]");
        }
      }
      a3 = &v13[v10];
      if (a4 <= 0)
        goto LABEL_11;
    }
    BLJaliscoLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v22 = 136315650;
      v23 = "-[BLPurchaseDAAPParser parseListingCollection:count:capacity:]";
      v24 = 2048;
      v25 = 4;
      v26 = 2048;
      v27 = a4;
      _os_log_impl(&dword_212C78000, v18, OS_LOG_TYPE_ERROR, "ERROR: %s, Invalid data in DAAP response: trying to read %ld bytes from a buffer of size %ld", (uint8_t *)&v22, 0x20u);
    }

LABEL_21:
    v17 = 0;
  }

  return v17;
}

- (id)parseBrowseResults:(const char *)a3 count:(int64_t)a4
{
  void *v7;
  int64_t v8;
  unint64_t v9;
  int64_t v10;
  BOOL v11;
  unsigned int v12;
  const char *v13;
  unsigned int v14;
  BLPurchaseDAAPItem *v15;
  void *v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  int v22;
  const char *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  int64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 < 1)
  {
LABEL_10:
    v17 = v7;
  }
  else
  {
    while ((unint64_t)a4 > 3)
    {
      v8 = a4 - 4;
      if ((unint64_t)(a4 - 4) <= 3)
      {
        BLJaliscoLog();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          v22 = 136315650;
          v23 = "-[BLPurchaseDAAPParser parseBrowseResults:count:]";
          v24 = 2048;
          v25 = 4;
          v26 = 2048;
          v27 = v8;
          goto LABEL_18;
        }
LABEL_19:

        goto LABEL_20;
      }
      v9 = bswap32(*((_DWORD *)a3 + 1));
      v10 = a4 - 8;
      v11 = a4 - 8 >= v9;
      a4 = a4 - 8 - v9;
      if (!v11)
      {
        BLJaliscoLog();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          v22 = 136315650;
          v23 = "-[BLPurchaseDAAPParser parseBrowseResults:count:]";
          v24 = 2048;
          v25 = v9;
          v26 = 2048;
          v27 = v10;
LABEL_18:
          _os_log_impl(&dword_212C78000, v19, OS_LOG_TYPE_ERROR, "ERROR: %s, Invalid data in DAAP response: trying to read %ld bytes from a buffer of size %ld", (uint8_t *)&v22, 0x20u);
        }
        goto LABEL_19;
      }
      v14 = *(_DWORD *)a3;
      v13 = a3 + 8;
      v12 = v14;
      if (v14 == 1953066093)
      {
        v15 = objc_alloc_init(BLPurchaseDAAPItem);
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", v13, v9, 4);
        -[BLPurchaseDAAPItem setName:](v15, "setName:", v16);
        -[BLPurchaseDAAPItem freeze](v15, "freeze");
        objc_msgSend(v7, "addObject:", v15);

      }
      else
      {
        -[BLPurchaseDAAPParser unknownCode:bytes:size:context:](self, "unknownCode:bytes:size:context:", bswap32(v12), v13, v9, "-[BLPurchaseDAAPParser parseBrowseResults:count:]");
      }
      a3 = &v13[v9];
      if (a4 <= 0)
        goto LABEL_10;
    }
    BLJaliscoLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v22 = 136315650;
      v23 = "-[BLPurchaseDAAPParser parseBrowseResults:count:]";
      v24 = 2048;
      v25 = 4;
      v26 = 2048;
      v27 = a4;
      _os_log_impl(&dword_212C78000, v18, OS_LOG_TYPE_ERROR, "ERROR: %s, Invalid data in DAAP response: trying to read %ld bytes from a buffer of size %ld", (uint8_t *)&v22, 0x20u);
    }

LABEL_20:
    v17 = 0;
  }

  return v17;
}

- (id)parseListingHeader:(const char *)a3 count:(int64_t)a4
{
  void *v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  BOOL v11;
  unsigned int *v12;
  unsigned int v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  BLPurchaseDAAPParser *v19;
  unsigned int *v20;
  unint64_t v21;
  void *v22;
  const __CFString *v23;
  id v24;
  NSObject *v25;
  NSObject *v26;
  int v29;
  const char *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  int64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 < 1)
  {
LABEL_39:
    v24 = v7;
    goto LABEL_50;
  }
  v8 = 0;
  while (1)
  {
    if ((unint64_t)a4 <= 3)
    {
      BLJaliscoLog();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v29 = 136315650;
        v30 = "-[BLPurchaseDAAPParser parseListingHeader:count:]";
        v31 = 2048;
        v32 = 4;
        v33 = 2048;
        v34 = a4;
LABEL_44:
        _os_log_impl(&dword_212C78000, v25, OS_LOG_TYPE_ERROR, "ERROR: %s, Invalid data in DAAP response: trying to read %ld bytes from a buffer of size %ld", (uint8_t *)&v29, 0x20u);
      }
LABEL_45:

      goto LABEL_49;
    }
    if ((unint64_t)(a4 - 4) <= 3)
    {
      BLJaliscoLog();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v29 = 136315650;
        v30 = "-[BLPurchaseDAAPParser parseListingHeader:count:]";
        v31 = 2048;
        v32 = 4;
        v33 = 2048;
        v34 = a4 - 4;
        goto LABEL_44;
      }
      goto LABEL_45;
    }
    v9 = bswap32(*((_DWORD *)a3 + 1));
    v10 = a4 - 8;
    v11 = a4 - 8 >= v9;
    a4 = a4 - 8 - v9;
    if (!v11)
      break;
    v13 = *(_DWORD *)a3;
    v12 = (unsigned int *)(a3 + 8);
    v14 = bswap32(v13);
    if (v14 <= 1836213102)
    {
      if (v14 > 1633838957)
      {
        if (v14 != 1633838958)
        {
          if (v14 == 1668113010)
          {
            v19 = self;
            v20 = v12;
            v21 = v9;
            v22 = v7;
            v23 = CFSTR("dmcp.bonjoursourcesrevision");
            goto LABEL_36;
          }
          if (v14 != 1835819884)
            goto LABEL_37;
          -[BLPurchaseDAAPParser parseListingCollection:count:capacity:](self, "parseListingCollection:count:capacity:", v12, v9, v8);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v7;
          v17 = v15;
          v18 = CFSTR("dmap.listing");
          goto LABEL_27;
        }
      }
      else if (v14 != 1633837420 && v14 != 1633837426 && v14 != 1633837936)
      {
LABEL_37:
        -[BLPurchaseDAAPParser unknownCode:bytes:size:context:](self, "unknownCode:bytes:size:context:");
        goto LABEL_38;
      }
      -[BLPurchaseDAAPParser parseBrowseResults:count:](self, "parseBrowseResults:count:", v12, v9);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v7;
      v17 = v15;
      v18 = CFSTR("items");
LABEL_27:
      objc_msgSend(v16, "setObject:forKey:", v17, v18);

      goto LABEL_38;
    }
    if (v14 <= 1836344174)
    {
      if (v14 == 1836213103)
      {
        -[BLPurchaseDAAPParser setUInt32:size:inDict:forKey:](self, "setUInt32:size:inDict:forKey:", v12, v9, v7, CFSTR("dmap.returnedcount"));
        v8 = bswap32(*v12);
        goto LABEL_38;
      }
      if (v14 != 1836279916)
      {
        if (v14 != 1836282996)
          goto LABEL_37;
        v19 = self;
        v20 = v12;
        v21 = v9;
        v22 = v7;
        v23 = CFSTR("dmap.status");
        goto LABEL_36;
      }
      -[BLPurchaseDAAPParser parseListingCollection:count:capacity:](self, "parseListingCollection:count:capacity:", v12, v9, 30);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v7;
      v17 = v15;
      v18 = CFSTR("headers");
      goto LABEL_27;
    }
    if (v14 <= 1836413809)
    {
      if (v14 == 1836344175)
      {
        v19 = self;
        v20 = v12;
        v21 = v9;
        v22 = v7;
        v23 = CFSTR("dmap.specifiedtotalcount");
LABEL_36:
        -[BLPurchaseDAAPParser setUInt32:size:inDict:forKey:](v19, "setUInt32:size:inDict:forKey:", v20, v21, v22, v23);
        goto LABEL_38;
      }
      if (v14 != 1836409964)
        goto LABEL_37;
      -[BLPurchaseDAAPParser parseDeletedIDsList:count:](self, "parseDeletedIDsList:count:", v12, v9);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v7;
      v17 = v15;
      v18 = CFSTR("dmap.deletedidlisting");
      goto LABEL_27;
    }
    if (v14 == 1836413810)
    {
      v19 = self;
      v20 = v12;
      v21 = v9;
      v22 = v7;
      v23 = CFSTR("dmap.serverrevision");
      goto LABEL_36;
    }
    if (v14 != 1836414073)
      goto LABEL_37;
    -[BLPurchaseDAAPParser setUInt8:size:inDict:forKey:](self, "setUInt8:size:inDict:forKey:", v12, v9, v7, CFSTR("dmap.updatetype"));
LABEL_38:
    a3 = (char *)v12 + v9;
    if (a4 <= 0)
      goto LABEL_39;
  }
  BLJaliscoLog();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    v29 = 136315650;
    v30 = "-[BLPurchaseDAAPParser parseListingHeader:count:]";
    v31 = 2048;
    v32 = v9;
    v33 = 2048;
    v34 = v10;
    _os_log_impl(&dword_212C78000, v26, OS_LOG_TYPE_ERROR, "ERROR: %s, Invalid data in DAAP response: trying to read %ld bytes from a buffer of size %ld", (uint8_t *)&v29, 0x20u);
  }

LABEL_49:
  v24 = 0;
LABEL_50:

  return v24;
}

- (void)parseDict:(const char *)a3 size:(int64_t)a4 intoDict:(id)a5
{
  void *v8;
  unint64_t v9;
  int64_t v10;
  BOOL v11;
  const char *v12;
  unsigned int v13;
  unsigned int v14;
  const __CFString *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  id v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  int64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v24 = a5;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 < 1)
    goto LABEL_24;
  while (1)
  {
    if ((unint64_t)a4 <= 3)
    {
      BLJaliscoLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        goto LABEL_23;
      *(_DWORD *)buf = 136315650;
      v26 = "-[BLPurchaseDAAPParser parseDict:size:intoDict:]";
      v27 = 2048;
      v28 = 4;
      v29 = 2048;
      v30 = a4;
      goto LABEL_22;
    }
    if ((unint64_t)(a4 - 4) <= 3)
    {
      BLJaliscoLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        goto LABEL_23;
      *(_DWORD *)buf = 136315650;
      v26 = "-[BLPurchaseDAAPParser parseDict:size:intoDict:]";
      v27 = 2048;
      v28 = 4;
      v29 = 2048;
      v30 = a4 - 4;
      goto LABEL_22;
    }
    v9 = bswap32(*((_DWORD *)a3 + 1));
    v10 = a4 - 8;
    v11 = a4 - 8 >= v9;
    a4 = a4 - 8 - v9;
    if (!v11)
      break;
    v13 = *(_DWORD *)a3;
    v12 = a3 + 8;
    v14 = bswap32(v13);
    if (v14 == 1835297657)
    {
      v15 = CFSTR("key");
    }
    else
    {
      if (v14 != 1835300460)
        goto LABEL_11;
      v15 = CFSTR("value");
    }
    -[BLPurchaseDAAPParser setString:size:inDict:forKey:](self, "setString:size:inDict:forKey:", v12, v9, v8, v15);
LABEL_11:
    objc_msgSend(v8, "objectForKey:", CFSTR("key"));
    v16 = objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v17 = (void *)v16;
      objc_msgSend(v8, "objectForKey:", CFSTR("value"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        objc_msgSend(v8, "objectForKey:", CFSTR("value"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKey:", CFSTR("key"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setValue:forKey:", v19, v20);

        objc_msgSend(v8, "removeAllObjects");
      }
    }
    a3 = &v12[v9];
    if (a4 <= 0)
      goto LABEL_24;
  }
  BLJaliscoLog();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v26 = "-[BLPurchaseDAAPParser parseDict:size:intoDict:]";
    v27 = 2048;
    v28 = v9;
    v29 = 2048;
    v30 = v10;
LABEL_22:
    _os_log_impl(&dword_212C78000, v21, OS_LOG_TYPE_ERROR, "ERROR: %s, Invalid data in DAAP response: trying to read %ld bytes from a buffer of size %ld", buf, 0x20u);
  }
LABEL_23:

LABEL_24:
  return 0;
}

- (id)parseDeletedIDsList:(const char *)a3 count:(int64_t)a4
{
  void *v7;
  void *v8;
  int64_t v9;
  unint64_t v10;
  int64_t v11;
  BOOL v12;
  unsigned int v13;
  const char *v14;
  unsigned int v15;
  void *v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  int v22;
  const char *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  int64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 < 1)
  {
LABEL_12:
    v17 = v8;
  }
  else
  {
    while ((unint64_t)a4 > 3)
    {
      v9 = a4 - 4;
      if ((unint64_t)(a4 - 4) <= 3)
      {
        BLJaliscoLog();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          v22 = 136315650;
          v23 = "-[BLPurchaseDAAPParser parseDeletedIDsList:count:]";
          v24 = 2048;
          v25 = 4;
          v26 = 2048;
          v27 = v9;
          goto LABEL_20;
        }
LABEL_21:

        goto LABEL_22;
      }
      v10 = bswap32(*((_DWORD *)a3 + 1));
      v11 = a4 - 8;
      v12 = a4 - 8 >= v10;
      a4 = a4 - 8 - v10;
      if (!v12)
      {
        BLJaliscoLog();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          v22 = 136315650;
          v23 = "-[BLPurchaseDAAPParser parseDeletedIDsList:count:]";
          v24 = 2048;
          v25 = v10;
          v26 = 2048;
          v27 = v11;
LABEL_20:
          _os_log_impl(&dword_212C78000, v19, OS_LOG_TYPE_ERROR, "ERROR: %s, Invalid data in DAAP response: trying to read %ld bytes from a buffer of size %ld", (uint8_t *)&v22, 0x20u);
        }
        goto LABEL_21;
      }
      v15 = *(_DWORD *)a3;
      v14 = a3 + 8;
      v13 = v15;
      if (v15 == 1684826477)
        -[BLPurchaseDAAPParser setUInt64:size:inDict:forKey:](self, "setUInt64:size:inDict:forKey:", v14, v10, v7, CFSTR("dmap.longitemid"));
      else
        -[BLPurchaseDAAPParser unknownCode:bytes:size:context:](self, "unknownCode:bytes:size:context:", bswap32(v13), v14, v10, "-[BLPurchaseDAAPParser parseDeletedIDsList:count:]");
      objc_msgSend(v7, "objectForKey:", CFSTR("dmap.longitemid"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
        objc_msgSend(v8, "addObject:", v16);
      objc_msgSend(v7, "removeAllObjects");
      a3 = &v14[v10];

      if (a4 <= 0)
        goto LABEL_12;
    }
    BLJaliscoLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v22 = 136315650;
      v23 = "-[BLPurchaseDAAPParser parseDeletedIDsList:count:]";
      v24 = 2048;
      v25 = 4;
      v26 = 2048;
      v27 = a4;
      _os_log_impl(&dword_212C78000, v18, OS_LOG_TYPE_ERROR, "ERROR: %s, Invalid data in DAAP response: trying to read %ld bytes from a buffer of size %ld", (uint8_t *)&v22, 0x20u);
    }

LABEL_22:
    v17 = 0;
  }

  return v17;
}

- (id)parseControlPromptCollection:(const char *)a3 count:(int64_t)a4
{
  void *v7;
  int64_t v8;
  unint64_t v9;
  int64_t v10;
  BOOL v11;
  const char *v12;
  unsigned int v13;
  uint64_t v14;
  const char *v15;
  unint64_t v16;
  void *v17;
  const __CFString *v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  int v24;
  const char *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  int64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 < 1)
  {
LABEL_15:
    v19 = v7;
    goto LABEL_26;
  }
  while ((unint64_t)a4 > 3)
  {
    v8 = a4 - 4;
    if ((unint64_t)(a4 - 4) <= 3)
    {
      BLJaliscoLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v24 = 136315650;
        v25 = "-[BLPurchaseDAAPParser parseControlPromptCollection:count:]";
        v26 = 2048;
        v27 = 4;
        v28 = 2048;
        v29 = v8;
        goto LABEL_23;
      }
LABEL_24:

      goto LABEL_25;
    }
    v9 = bswap32(*((_DWORD *)a3 + 1));
    v10 = a4 - 8;
    v11 = a4 - 8 >= v9;
    a4 = a4 - 8 - v9;
    if (!v11)
    {
      BLJaliscoLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v24 = 136315650;
        v25 = "-[BLPurchaseDAAPParser parseControlPromptCollection:count:]";
        v26 = 2048;
        v27 = v9;
        v28 = 2048;
        v29 = v10;
LABEL_23:
        _os_log_impl(&dword_212C78000, v21, OS_LOG_TYPE_ERROR, "ERROR: %s, Invalid data in DAAP response: trying to read %ld bytes from a buffer of size %ld", (uint8_t *)&v24, 0x20u);
      }
      goto LABEL_24;
    }
    v13 = *(_DWORD *)a3;
    v12 = a3 + 8;
    v14 = bswap32(v13);
    switch((_DWORD)v14)
    {
      case 0x636D6361:
        v15 = v12;
        v16 = v9;
        v17 = v7;
        v18 = CFSTR("attributes");
        break;
      case 0x636D6376:
        v15 = v12;
        v16 = v9;
        v17 = v7;
        v18 = CFSTR("value");
        break;
      case 0x636D6365:
        v15 = v12;
        v16 = v9;
        v17 = v7;
        v18 = CFSTR("name");
        break;
      default:
        -[BLPurchaseDAAPParser unknownCode:bytes:size:context:](self, "unknownCode:bytes:size:context:", v14, v12, v9, "-[BLPurchaseDAAPParser parseControlPromptCollection:count:]");
        goto LABEL_14;
    }
    -[BLPurchaseDAAPParser setString:size:inDict:forKey:](self, "setString:size:inDict:forKey:", v15, v16, v17, v18);
LABEL_14:
    a3 = &v12[v9];
    if (a4 <= 0)
      goto LABEL_15;
  }
  BLJaliscoLog();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    v24 = 136315650;
    v25 = "-[BLPurchaseDAAPParser parseControlPromptCollection:count:]";
    v26 = 2048;
    v27 = 4;
    v28 = 2048;
    v29 = a4;
    _os_log_impl(&dword_212C78000, v20, OS_LOG_TYPE_ERROR, "ERROR: %s, Invalid data in DAAP response: trying to read %ld bytes from a buffer of size %ld", (uint8_t *)&v24, 0x20u);
  }

LABEL_25:
  v19 = 0;
LABEL_26:

  return v19;
}

- (id)parseControlPromptResponse:(const char *)a3 count:(int64_t)a4
{
  void *v7;
  id v8;
  int64_t v9;
  unsigned int v10;
  unint64_t v11;
  int64_t v12;
  BOOL v13;
  const char *v14;
  unsigned int v15;
  uint64_t v16;
  void *v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  int v23;
  const char *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  int64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (a4 < 1)
  {
LABEL_15:
    if (objc_msgSend(v8, "count"))
      objc_msgSend(v7, "setObject:forKey:", v8, CFSTR("items"));
    v18 = v7;
  }
  else
  {
    while ((unint64_t)a4 > 3)
    {
      v9 = a4 - 4;
      if ((unint64_t)(a4 - 4) <= 3)
      {
        BLJaliscoLog();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          v23 = 136315650;
          v24 = "-[BLPurchaseDAAPParser parseControlPromptResponse:count:]";
          v25 = 2048;
          v26 = 4;
          v27 = 2048;
          v28 = v9;
          goto LABEL_25;
        }
LABEL_26:

        goto LABEL_27;
      }
      v10 = *((_DWORD *)a3 + 1);
      v11 = bswap32(v10);
      v12 = a4 - 8;
      v13 = a4 - 8 >= v11;
      a4 = a4 - 8 - v11;
      if (!v13)
      {
        BLJaliscoLog();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          v23 = 136315650;
          v24 = "-[BLPurchaseDAAPParser parseControlPromptResponse:count:]";
          v25 = 2048;
          v26 = v11;
          v27 = 2048;
          v28 = v12;
LABEL_25:
          _os_log_impl(&dword_212C78000, v20, OS_LOG_TYPE_ERROR, "ERROR: %s, Invalid data in DAAP response: trying to read %ld bytes from a buffer of size %ld", (uint8_t *)&v23, 0x20u);
        }
        goto LABEL_26;
      }
      v15 = *(_DWORD *)a3;
      v14 = a3 + 8;
      v16 = bswap32(v15);
      if ((_DWORD)v16 == 1835295596)
      {
        -[BLPurchaseDAAPParser parseControlPromptCollection:count:](self, "parseControlPromptCollection:count:", v14, v11);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v17);

      }
      else if ((_DWORD)v16 != 1836282996)
      {
        if ((_DWORD)v16 == 1835624804)
        {
          if (v10 == 0x4000000)
            -[BLPurchaseDAAPParser setUInt32:size:inDict:forKey:](self, "setUInt32:size:inDict:forKey:", v14, 4, v7, CFSTR("dmap.itemid"));
          else
            -[BLPurchaseDAAPParser setUInt64:size:inDict:forKey:](self, "setUInt64:size:inDict:forKey:", v14, v11, v7, CFSTR("dmap.itemid"));
        }
        else
        {
          -[BLPurchaseDAAPParser unknownCode:bytes:size:context:](self, "unknownCode:bytes:size:context:", v16, v14, v11, "-[BLPurchaseDAAPParser parseControlPromptResponse:count:]");
        }
      }
      a3 = &v14[v11];
      if (a4 <= 0)
        goto LABEL_15;
    }
    BLJaliscoLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v23 = 136315650;
      v24 = "-[BLPurchaseDAAPParser parseControlPromptResponse:count:]";
      v25 = 2048;
      v26 = 4;
      v27 = 2048;
      v28 = a4;
      _os_log_impl(&dword_212C78000, v19, OS_LOG_TYPE_ERROR, "ERROR: %s, Invalid data in DAAP response: trying to read %ld bytes from a buffer of size %ld", (uint8_t *)&v23, 0x20u);
    }

LABEL_27:
    v18 = 0;
  }

  return v18;
}

- (id)parseGetSpeakersResponse:(const char *)a3 count:(int64_t)a4
{
  void *v7;
  int64_t v8;
  unint64_t v9;
  int64_t v10;
  BOOL v11;
  const char *v12;
  unsigned int v13;
  uint64_t v14;
  void *v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  int v21;
  const char *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  int64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 < 1)
  {
LABEL_11:
    v16 = v7;
  }
  else
  {
    while ((unint64_t)a4 > 3)
    {
      v8 = a4 - 4;
      if ((unint64_t)(a4 - 4) <= 3)
      {
        BLJaliscoLog();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          v21 = 136315650;
          v22 = "-[BLPurchaseDAAPParser parseGetSpeakersResponse:count:]";
          v23 = 2048;
          v24 = 4;
          v25 = 2048;
          v26 = v8;
          goto LABEL_19;
        }
LABEL_20:

        goto LABEL_21;
      }
      v9 = bswap32(*((_DWORD *)a3 + 1));
      v10 = a4 - 8;
      v11 = a4 - 8 >= v9;
      a4 = a4 - 8 - v9;
      if (!v11)
      {
        BLJaliscoLog();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          v21 = 136315650;
          v22 = "-[BLPurchaseDAAPParser parseGetSpeakersResponse:count:]";
          v23 = 2048;
          v24 = v9;
          v25 = 2048;
          v26 = v10;
LABEL_19:
          _os_log_impl(&dword_212C78000, v18, OS_LOG_TYPE_ERROR, "ERROR: %s, Invalid data in DAAP response: trying to read %ld bytes from a buffer of size %ld", (uint8_t *)&v21, 0x20u);
        }
        goto LABEL_20;
      }
      v13 = *(_DWORD *)a3;
      v12 = a3 + 8;
      v14 = bswap32(v13);
      if ((_DWORD)v14 != 1836282996)
      {
        if ((_DWORD)v14 == 1835295596)
        {
          -[BLPurchaseDAAPParser parseListingItem:count:](self, "parseListingItem:count:", v12, v9);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v15);

        }
        else
        {
          -[BLPurchaseDAAPParser unknownCode:bytes:size:context:](self, "unknownCode:bytes:size:context:", v14, v12, v9, "-[BLPurchaseDAAPParser parseGetSpeakersResponse:count:]");
        }
      }
      a3 = &v12[v9];
      if (a4 <= 0)
        goto LABEL_11;
    }
    BLJaliscoLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v21 = 136315650;
      v22 = "-[BLPurchaseDAAPParser parseGetSpeakersResponse:count:]";
      v23 = 2048;
      v24 = 4;
      v25 = 2048;
      v26 = a4;
      _os_log_impl(&dword_212C78000, v17, OS_LOG_TYPE_ERROR, "ERROR: %s, Invalid data in DAAP response: trying to read %ld bytes from a buffer of size %ld", (uint8_t *)&v21, 0x20u);
    }

LABEL_21:
    v16 = 0;
  }

  return v16;
}

- (id)parseDACPPropertyResponse:(const char *)a3 count:(int64_t)a4
{
  void *v7;
  int64_t v8;
  unsigned int v9;
  unint64_t v10;
  int64_t v11;
  BOOL v12;
  int v13;
  unsigned int *v14;
  uint64_t v15;
  BLPurchaseDAAPParser *v16;
  const char *v17;
  unint64_t v18;
  void *v19;
  const __CFString *v20;
  BLPurchaseDAAPParser *v21;
  const char *v22;
  unint64_t v23;
  void *v24;
  const __CFString *v25;
  BLPurchaseDAAPParser *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const __CFString *v30;
  BLPurchaseDAAPParser *v31;
  const char *v32;
  unint64_t v33;
  void *v34;
  const __CFString *v35;
  BLPurchaseDAAPParser *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const __CFString *v40;
  float v41;
  id v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  NSObject *v50;
  NSObject *v51;
  int v54;
  const char *v55;
  __int16 v56;
  uint64_t v57;
  __int16 v58;
  int64_t v59;
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 < 1)
  {
LABEL_116:
    v49 = v7;
    goto LABEL_127;
  }
  while ((unint64_t)a4 > 3)
  {
    v8 = a4 - 4;
    if ((unint64_t)(a4 - 4) <= 3)
    {
      BLJaliscoLog();
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        v54 = 136315650;
        v55 = "-[BLPurchaseDAAPParser parseDACPPropertyResponse:count:]";
        v56 = 2048;
        v57 = 4;
        v58 = 2048;
        v59 = v8;
        goto LABEL_124;
      }
LABEL_125:

      goto LABEL_126;
    }
    v9 = *((_DWORD *)a3 + 1);
    v10 = bswap32(v9);
    v11 = a4 - 8;
    v12 = a4 - 8 >= v10;
    a4 = a4 - 8 - v10;
    if (!v12)
    {
      BLJaliscoLog();
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        v54 = 136315650;
        v55 = "-[BLPurchaseDAAPParser parseDACPPropertyResponse:count:]";
        v56 = 2048;
        v57 = v10;
        v58 = 2048;
        v59 = v11;
LABEL_124:
        _os_log_impl(&dword_212C78000, v51, OS_LOG_TYPE_ERROR, "ERROR: %s, Invalid data in DAAP response: trying to read %ld bytes from a buffer of size %ld", (uint8_t *)&v54, 0x20u);
      }
      goto LABEL_125;
    }
    v13 = bswap32(*(_DWORD *)a3);
    v14 = (unsigned int *)(a3 + 8);
    if (v13 <= 1667331698)
    {
      if (v13 <= 1667329643)
      {
        if (v13 > 1667326322)
        {
          if (v13 <= 1667327602)
          {
            if (v13 == 1667326323)
            {
              v26 = self;
              v27 = a3 + 8;
              v28 = v10;
              v29 = v7;
              v30 = CFSTR("dacp.availableshufflestates");
              goto LABEL_110;
            }
            if (v13 == 1667327589)
            {
              v31 = self;
              v32 = a3 + 8;
              v33 = v10;
              v34 = v7;
              v35 = CFSTR("dacp.fullscreenenabled");
              goto LABEL_93;
            }
          }
          else
          {
            switch(v13)
            {
              case 1667327603:
                v31 = self;
                v32 = a3 + 8;
                v33 = v10;
                v34 = v7;
                v35 = CFSTR("dacp.fullscreen");
                goto LABEL_93;
              case 1667329633:
                v21 = self;
                v22 = a3 + 8;
                v23 = v10;
                v24 = v7;
                v25 = CFSTR("daap.songartist");
                goto LABEL_91;
              case 1667329639:
                v21 = self;
                v22 = a3 + 8;
                v23 = v10;
                v24 = v7;
                v25 = CFSTR("NPGenre");
                goto LABEL_91;
            }
          }
          goto LABEL_76;
        }
        if (v13 > 1634030408)
        {
          switch(v13)
          {
            case 1634030409:
              v26 = self;
              v27 = a3 + 8;
              v28 = v10;
              v29 = v7;
              v30 = CFSTR("com.apple.itunes.itms-songid");
              goto LABEL_110;
            case 1634951529:
              v36 = self;
              v37 = a3 + 8;
              v38 = v10;
              v39 = v7;
              v40 = CFSTR("daap.songalbumid");
LABEL_107:
              -[BLPurchaseDAAPParser setUInt64:size:inDict:forKey:](v36, "setUInt64:size:inDict:forKey:", v37, v38, v39, v40);
              goto LABEL_111;
            case 1667326322:
              v26 = self;
              v27 = a3 + 8;
              v28 = v10;
              v29 = v7;
              v30 = CFSTR("dacp.availablerepeatstates");
LABEL_110:
              -[BLPurchaseDAAPParser setUInt32:size:inDict:forKey:](v26, "setUInt32:size:inDict:forKey:", v27, v28, v29, v30);
              goto LABEL_111;
          }
LABEL_76:
          -[BLPurchaseDAAPParser unknownCode:bytes:size:context:](self, "unknownCode:bytes:size:context:");
          goto LABEL_111;
        }
        if (v13 == 1634026323)
        {
          if (v9 == 0x4000000)
          {
            v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInt:", bswap32(*v14));
            objc_msgSend(v44, "stringValue");
          }
          else
          {
            -[BLPurchaseDAAPParser parseUTF8String:length:](self, "parseUTF8String:length:", a3 + 8, v10);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v44, "longLongValue"));
          }
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setValue:forKey:", v48, CFSTR("com.apple.itunes.artworkchecksum"));

          goto LABEL_115;
        }
        if (v13 != 1634027587)
          goto LABEL_76;
        if (*(_BYTE *)v14 == 1)
        {
          v16 = self;
          v17 = a3 + 8;
          v18 = v10;
          v19 = v7;
          v20 = CFSTR("com.apple.itunes.has-chapter-data");
          goto LABEL_86;
        }
      }
      else
      {
        if (v13 <= 1667330671)
        {
          switch(v13)
          {
            case 1667329644:
              v21 = self;
              v22 = a3 + 8;
              v23 = v10;
              v24 = v7;
              v25 = CFSTR("daap.songalbum");
              goto LABEL_91;
            case 1667329645:
            case 1667329647:
            case 1667329649:
            case 1667329650:
            case 1667329651:
              goto LABEL_76;
            case 1667329646:
              v21 = self;
              v22 = a3 + 8;
              v23 = v10;
              v24 = v7;
              v25 = CFSTR("dmap.itemname");
              goto LABEL_91;
            case 1667329648:
              -[BLPurchaseDAAPParser setUInt32:size:inDict:forKey:](self, "setUInt32:size:inDict:forKey:", a3 + 8, 4, v7, CFSTR("databaseID"));
              -[BLPurchaseDAAPParser setUInt32:size:inDict:forKey:](self, "setUInt32:size:inDict:forKey:", a3 + 12, 4, v7, CFSTR("com.apple.itunes.itms-playlistid"));
              -[BLPurchaseDAAPParser setUInt32:size:inDict:forKey:](self, "setUInt32:size:inDict:forKey:", a3 + 16, 4, v7, CFSTR("dmap.containeritemid"));
              v27 = a3 + 20;
              v26 = self;
              v28 = 4;
              v29 = v7;
              v30 = CFSTR("dmap.itemid");
              goto LABEL_110;
            case 1667329652:
              v26 = self;
              v27 = a3 + 8;
              v28 = v10;
              v29 = v7;
              v30 = CFSTR("dacp.playingtime");
              goto LABEL_110;
            default:
              if (v13 == 1667330156)
              {
                -[BLPurchaseDAAPParser setUInt64:size:inDict:forKey:](self, "setUInt64:size:inDict:forKey:", a3 + 8, 8, v7, CFSTR("databaseID"));
                -[BLPurchaseDAAPParser setUInt64:size:inDict:forKey:](self, "setUInt64:size:inDict:forKey:", a3 + 16, 8, v7, CFSTR("com.apple.itunes.itms-playlistid"));
                -[BLPurchaseDAAPParser setUInt64:size:inDict:forKey:](self, "setUInt64:size:inDict:forKey:", a3 + 24, 8, v7, CFSTR("dmap.containeritemid"));
                v37 = a3 + 32;
                v36 = self;
                v38 = 8;
                v39 = v7;
                v40 = CFSTR("dmap.itemid");
                goto LABEL_107;
              }
              if (v13 != 1667330163)
                goto LABEL_76;
              v16 = self;
              v17 = a3 + 8;
              v18 = v10;
              v19 = v7;
              v20 = CFSTR("dacp.playerstate");
              break;
          }
          goto LABEL_86;
        }
        if (v13 <= 1667330932)
        {
          switch(v13)
          {
            case 1667330672:
              v16 = self;
              v17 = a3 + 8;
              v18 = v10;
              v19 = v7;
              v20 = CFSTR("dacp.repeatstate");
              goto LABEL_86;
            case 1667330920:
              v16 = self;
              v17 = a3 + 8;
              v18 = v10;
              v19 = v7;
              v20 = CFSTR("dacp.shufflestate");
              goto LABEL_86;
            case 1667330932:
              v26 = self;
              v27 = a3 + 8;
              v28 = v10;
              v29 = v7;
              v30 = CFSTR("daap.songtime");
              goto LABEL_110;
          }
          goto LABEL_76;
        }
        if (v13 != 1667330933)
        {
          if (v13 == 1667331683)
          {
            v31 = self;
            v32 = a3 + 8;
            v33 = v10;
            v34 = v7;
            v35 = CFSTR("dacp.volumecontrollable");
            goto LABEL_93;
          }
          if (v13 == 1667331685)
          {
            v31 = self;
            v32 = a3 + 8;
            v33 = v10;
            v34 = v7;
            v35 = CFSTR("dacp.visualizerenabled");
LABEL_93:
            -[BLPurchaseDAAPParser setBool:size:inDict:forKey:](v31, "setBool:size:inDict:forKey:", v32, v33, v34, v35);
            goto LABEL_111;
          }
          goto LABEL_76;
        }
      }
    }
    else
    {
      if (v13 > 1667584835)
      {
        if (v13 > 1668115818)
        {
          if (v13 <= 1668118126)
          {
            if (v13 == 1668115819)
            {
              v26 = self;
              v27 = a3 + 8;
              v28 = v10;
              v29 = v7;
              v30 = CFSTR("mediaKind");
              goto LABEL_110;
            }
            if (v13 == 1668117362)
            {
              v26 = self;
              v27 = a3 + 8;
              v28 = v10;
              v29 = v7;
              v30 = CFSTR("dmcp.playstatusrevision");
              goto LABEL_110;
            }
          }
          else
          {
            switch(v13)
            {
              case 1668118127:
                v41 = (float)bswap32(*v14) / 100.0;
                v42 = objc_alloc(MEMORY[0x24BDD16E0]);
                *(float *)&v43 = v41;
                v44 = (void *)objc_msgSend(v42, "initWithFloat:", v43);
                objc_msgSend(v7, "setObject:forKey:", v44, CFSTR("volume"));
LABEL_115:

                goto LABEL_111;
              case 1836082546:
                v36 = self;
                v37 = a3 + 8;
                v38 = v10;
                v39 = v7;
                v40 = CFSTR("dmap.persistentid");
                goto LABEL_107;
              case 1836282996:
                v26 = self;
                v27 = a3 + 8;
                v28 = v10;
                v29 = v7;
                v30 = CFSTR("dmap.status");
                goto LABEL_110;
            }
          }
        }
        else if (v13 <= 1668113004)
        {
          if (v13 == 1667584836)
          {
            -[BLPurchaseDAAPParser parseXMLContent:count:](self, "parseXMLContent:count:", a3 + 8, v10);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            if (v45)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v45, "objectForKey:", CFSTR("id"));
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v46, "length"))
                  objc_msgSend(v7, "setObject:forKey:", v46, CFSTR("secondScreenAdamID"));
                objc_msgSend(v45, "objectForKey:", CFSTR("url"));
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v47, "length"))
                  objc_msgSend(v7, "setObject:forKey:", v46, CFSTR("secondScreenURL"));

              }
            }

            goto LABEL_111;
          }
          if (v13 == 1668112996)
          {
            v21 = self;
            v22 = a3 + 8;
            v23 = v10;
            v24 = v7;
            v25 = CFSTR("libraryDisplayName");
            goto LABEL_91;
          }
        }
        else
        {
          switch(v13)
          {
            case 1668113005:
              v21 = self;
              v22 = a3 + 8;
              v23 = v10;
              v24 = v7;
              v25 = CFSTR("libraryServiceDomain");
              goto LABEL_91;
            case 1668113011:
              v21 = self;
              v22 = a3 + 8;
              v23 = v10;
              v24 = v7;
              v25 = CFSTR("libraryServiceName");
              goto LABEL_91;
            case 1668113012:
              v21 = self;
              v22 = a3 + 8;
              v23 = v10;
              v24 = v7;
              v25 = CFSTR("libraryServiceType");
LABEL_91:
              -[BLPurchaseDAAPParser setString:size:inDict:forKey:](v21, "setString:size:inDict:forKey:", v22, v23, v24, v25);
              goto LABEL_111;
          }
        }
        goto LABEL_76;
      }
      if (v13 <= 1667583568)
      {
        if (v13 == 1667331699)
        {
          v31 = self;
          v32 = a3 + 8;
          v33 = v10;
          v34 = v7;
          v35 = CFSTR("dacp.visualizer");
          goto LABEL_93;
        }
        if (v13 == 1667581779)
        {
          v31 = self;
          v32 = a3 + 8;
          v33 = v10;
          v34 = v7;
          v35 = CFSTR("com.apple.itunes.can-be-genius-seed");
          goto LABEL_93;
        }
        if (v13 != 1667583313)
          goto LABEL_76;
        if (*(_BYTE *)v14 == 1)
        {
          v16 = self;
          v17 = a3 + 8;
          v18 = v10;
          v19 = v7;
          v20 = CFSTR("com.apple.itunes.manually-queued");
          goto LABEL_86;
        }
      }
      else
      {
        v15 = (v13 - 1667584329);
        if (v15 > 0x2C)
          goto LABEL_71;
        if (((1 << (v13 - 73)) & 0x62041000001) == 0)
        {
          if (v15 == 14)
          {
            v26 = self;
            v27 = a3 + 8;
            v28 = v10;
            v29 = v7;
            v30 = CFSTR("com.apple.itunes.playqueue-warning-threshold");
            goto LABEL_110;
          }
          if (v15 != 44)
          {
LABEL_71:
            if (v13 == 1667583569)
            {
              v26 = self;
              v27 = a3 + 8;
              v28 = v10;
              v29 = v7;
              v30 = CFSTR("com.apple.itunes.num-manually-queued");
              goto LABEL_110;
            }
            if (v13 == 1667584326)
            {
              v21 = self;
              v22 = a3 + 8;
              v23 = v10;
              v24 = v7;
              v25 = CFSTR("com.apple.itunes.active-queue-feed-name");
              goto LABEL_91;
            }
            goto LABEL_76;
          }
          if (*(_BYTE *)v14 == 1)
          {
            v16 = self;
            v17 = a3 + 8;
            v18 = v10;
            v19 = v7;
            v20 = CFSTR("com.apple.itunes.playqueue-mode");
LABEL_86:
            -[BLPurchaseDAAPParser setUInt8:size:inDict:forKey:](v16, "setUInt8:size:inDict:forKey:", v17, v18, v19, v20);
          }
        }
      }
    }
LABEL_111:
    a3 = (char *)v14 + v10;
    if (a4 <= 0)
      goto LABEL_116;
  }
  BLJaliscoLog();
  v50 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
  {
    v54 = 136315650;
    v55 = "-[BLPurchaseDAAPParser parseDACPPropertyResponse:count:]";
    v56 = 2048;
    v57 = 4;
    v58 = 2048;
    v59 = a4;
    _os_log_impl(&dword_212C78000, v50, OS_LOG_TYPE_ERROR, "ERROR: %s, Invalid data in DAAP response: trying to read %ld bytes from a buffer of size %ld", (uint8_t *)&v54, 0x20u);
  }

LABEL_126:
  v49 = 0;
LABEL_127:

  return v49;
}

- (id)processResponseCode:(unsigned int)a3 bytes:(const char *)a4 count:(int64_t)a5
{
  int v5;
  void *v6;

  if ((int)a3 <= 1668113012)
  {
    if ((int)a3 <= 1634759534)
    {
      if ((int)a3 > 1634165099)
      {
        if (a3 == 1634165100 || a3 == 1634165106)
          goto LABEL_36;
        v5 = 1634757753;
      }
      else
      {
        if (a3 == 1633841775 || a3 == 1633968755)
          goto LABEL_36;
        v5 = 1634026066;
      }
      goto LABEL_35;
    }
    if ((int)a3 > 1667326824)
    {
      if ((int)a3 <= 1667330927)
      {
        if (a3 != 1667326825)
        {
          if (a3 != 1667326834)
            goto LABEL_50;
          goto LABEL_45;
        }
        goto LABEL_36;
      }
      if (a3 == 1667330928)
      {
        -[BLPurchaseDAAPParser parseGetSpeakersResponse:count:](self, "parseGetSpeakersResponse:count:", a4, a5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        return v6;
      }
      if (a3 == 1667581769)
      {
        -[BLPurchaseDAAPParser parseListingCollection:count:capacity:](self, "parseListingCollection:count:capacity:", a4, a5, 0);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        return v6;
      }
LABEL_50:
      -[BLPurchaseDAAPParser unknownCode:bytes:size:context:](self, "unknownCode:bytes:size:context:");
      return 0;
    }
    if (a3 != 1634759535)
    {
      if (a3 == 1634890614)
        return 0;
      v5 = 1635148898;
      goto LABEL_35;
    }
    goto LABEL_36;
  }
  if ((int)a3 <= 1835360879)
  {
    if ((int)a3 > 1668117363)
    {
      if (a3 != 1668117364)
      {
        if (a3 == 1668313712)
          goto LABEL_36;
        v5 = 1835234412;
        goto LABEL_35;
      }
    }
    else
    {
      if (a3 == 1668113013)
        goto LABEL_36;
      if (a3 == 1668113264)
      {
        -[BLPurchaseDAAPParser parseControlPromptResponse:count:](self, "parseControlPromptResponse:count:", a4, a5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        return v6;
      }
      if (a3 != 1668114292)
        goto LABEL_50;
    }
    -[BLPurchaseDAAPParser parseDACPPropertyResponse:count:](self, "parseDACPPropertyResponse:count:", a4, a5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    return v6;
  }
  if ((int)a3 > 1835822950)
  {
    if ((int)a3 <= 1836282485)
    {
      if (a3 == 1835822951)
      {
        -[BLPurchaseDAAPParser parseLogin:count:](self, "parseLogin:count:", a4, a5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        return v6;
      }
      v5 = 1836278642;
LABEL_35:
      if (a3 != v5)
        goto LABEL_50;
      goto LABEL_36;
    }
    if (a3 != 1836413028)
    {
      if (a3 == 1836282486)
      {
        -[BLPurchaseDAAPParser parseServerInfo:count:](self, "parseServerInfo:count:", a4, a5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        return v6;
      }
      goto LABEL_50;
    }
LABEL_36:
    -[BLPurchaseDAAPParser parseListingHeader:count:](self, "parseListingHeader:count:", a4, a5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    return v6;
  }
  if (a3 == 1835360880)
    goto LABEL_36;
  if (a3 == 1835361379)
  {
LABEL_45:
    -[BLPurchaseDAAPParser parseListingItem:count:](self, "parseListingItem:count:", a4, a5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    return v6;
  }
  if (a3 != 1835364978)
    goto LABEL_50;
  -[BLPurchaseDAAPParser parseError:count:](self, "parseError:count:", a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  return v6;
}

+ (id)typeForDRCPValueType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0x13)
    return CFSTR("undefined");
  else
    return off_24CE8B5D8[a3 - 1];
}

@end
