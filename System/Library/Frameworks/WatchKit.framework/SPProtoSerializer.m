@implementation SPProtoSerializer

+ (id)dataWithObject:(id)a3
{
  id v3;
  void *v4;
  SPProtoSockPuppetObject *v5;
  void *v6;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[SPCacheMessage toProto:](SPCacheMessage, "toProto:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc_init(SPProtoSockPuppetObject);
    -[SPProtoSockPuppetObject setType:](v5, "setType:", 1);
    -[SPProtoSockPuppetObject setCacheMessage:](v5, "setCacheMessage:", v4);
    -[SPProtoSockPuppetObject data](v5, "data");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)objectWithData:(id)a3
{
  id v3;
  SPProtoSockPuppetObject *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = -[SPProtoSockPuppetObject initWithData:]([SPProtoSockPuppetObject alloc], "initWithData:", v3);

  if (-[SPProtoSockPuppetObject type](v4, "type") == 1)
  {
    -[SPProtoSockPuppetObject cacheMessage](v4, "cacheMessage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[SPCacheMessage fromProto:](SPCacheMessage, "fromProto:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)protoSPObjectWithNumber:(id)a3 forKey:(id)a4
{
  id v5;
  id v6;
  SPProtoSockPuppetObject *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(SPProtoSockPuppetObject);
  -[SPProtoSockPuppetObject setKey:](v7, "setKey:", v6);

  -[SPProtoSockPuppetObject setType:](v7, "setType:", 5);
  v8 = objc_retainAutorelease(v5);
  v9 = (const char *)objc_msgSend(v8, "objCType");
  if (strcmp(v9, "B"))
  {
    if (strcmp(v9, "q"))
    {
      if (!strcmp(v9, "Q"))
      {
        -[SPProtoSockPuppetObject setSubtype:](v7, "setSubtype:", 8);
        -[SPProtoSockPuppetObject setNuint64:](v7, "setNuint64:", objc_msgSend(v8, "unsignedIntegerValue"));
        goto LABEL_18;
      }
      if (!strcmp(v9, "c"))
      {
        -[SPProtoSockPuppetObject setSubtype:](v7, "setSubtype:", 9);
        v12 = objc_msgSend(v8, "charValue");
      }
      else
      {
        if (strcmp(v9, "s"))
        {
          if (!strcmp(v9, "i"))
          {
            -[SPProtoSockPuppetObject setSubtype:](v7, "setSubtype:", 11);
            v11 = (int)objc_msgSend(v8, "intValue");
            goto LABEL_13;
          }
          if (!strcmp(v9, "f"))
          {
            -[SPProtoSockPuppetObject setSubtype:](v7, "setSubtype:", 13);
            objc_msgSend(v8, "floatValue");
            -[SPProtoSockPuppetObject setNfloat:](v7, "setNfloat:");
            goto LABEL_18;
          }
          if (!strcmp(v9, "d"))
          {
            -[SPProtoSockPuppetObject setSubtype:](v7, "setSubtype:", 14);
            objc_msgSend(v8, "doubleValue");
            -[SPProtoSockPuppetObject setNdouble:](v7, "setNdouble:");
            goto LABEL_18;
          }
          -[SPProtoSockPuppetObject setSubtype:](v7, "setSubtype:", 15);
          v10 = objc_msgSend(v8, "longLongValue");
LABEL_12:
          v11 = v10;
LABEL_13:
          -[SPProtoSockPuppetObject setNint64:](v7, "setNint64:", v11);
          goto LABEL_18;
        }
        -[SPProtoSockPuppetObject setSubtype:](v7, "setSubtype:", 10);
        v12 = objc_msgSend(v8, "shortValue");
      }
      -[SPProtoSockPuppetObject setNint32:](v7, "setNint32:", v12);
      goto LABEL_18;
    }
    -[SPProtoSockPuppetObject setSubtype:](v7, "setSubtype:", 7);
    v10 = objc_msgSend(v8, "integerValue");
    goto LABEL_12;
  }
  -[SPProtoSockPuppetObject setSubtype:](v7, "setSubtype:", 6);
  -[SPProtoSockPuppetObject setNBOOL:](v7, "setNBOOL:", objc_msgSend(v8, "BOOLValue"));
LABEL_18:

  return v7;
}

+ (id)numberWithSPProtoSockPuppetObject:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v7;
  void *v8;

  v3 = a3;
  switch(objc_msgSend(v3, "subtype"))
  {
    case 6u:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v3, "nBOOL"));
      v4 = objc_claimAutoreleasedReturnValue();
      break;
    case 8u:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v3, "nuint64"));
      v4 = objc_claimAutoreleasedReturnValue();
      break;
    case 9u:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithChar:", (char)objc_msgSend(v3, "nint32"));
      v4 = objc_claimAutoreleasedReturnValue();
      break;
    case 0xAu:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithShort:", (__int16)objc_msgSend(v3, "nint32"));
      v4 = objc_claimAutoreleasedReturnValue();
      break;
    case 0xDu:
      v8 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v3, "nfloat");
      objc_msgSend(v8, "numberWithFloat:");
      v4 = objc_claimAutoreleasedReturnValue();
      break;
    case 0xEu:
      v7 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v3, "ndouble");
      objc_msgSend(v7, "numberWithDouble:");
      v4 = objc_claimAutoreleasedReturnValue();
      break;
    default:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v3, "nint64"));
      v4 = objc_claimAutoreleasedReturnValue();
      break;
  }
  v5 = (void *)v4;

  return v5;
}

+ (id)protoSPObjectWithString:(id)a3 forKey:(id)a4
{
  id v5;
  id v6;
  SPProtoSockPuppetObject *v7;
  SPProtoSockPuppetObject *v8;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(SPProtoSockPuppetObject);
  v8 = v7;
  if (v5)
    -[SPProtoSockPuppetObject setKey:](v7, "setKey:", v5);
  -[SPProtoSockPuppetObject setType:](v8, "setType:", 2);
  -[SPProtoSockPuppetObject setText:](v8, "setText:", v6);

  return v8;
}

+ (id)protoSPObjectWithData:(id)a3 forKey:(id)a4
{
  id v5;
  id v6;
  SPProtoSockPuppetObject *v7;
  SPProtoSockPuppetObject *v8;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(SPProtoSockPuppetObject);
  v8 = v7;
  if (v5)
    -[SPProtoSockPuppetObject setKey:](v7, "setKey:", v5);
  -[SPProtoSockPuppetObject setType:](v8, "setType:", 4);
  -[SPProtoSockPuppetObject setObject:](v8, "setObject:", v6);

  return v8;
}

+ (id)protoSPObjectWithObject:(id)a3 forKey:(id)a4
{
  id v5;
  id v6;
  SPProtoSockPuppetObject *v7;
  SPProtoSockPuppetObject *v8;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(SPProtoSockPuppetObject);
  v8 = v7;
  if (v5)
    -[SPProtoSockPuppetObject setKey:](v7, "setKey:", v5);
  -[SPProtoSockPuppetObject setType:](v8, "setType:", 3);
  -[SPProtoSockPuppetObject setObject:](v8, "setObject:", v6);

  return v8;
}

+ (id)protoSPObjectWithDictionary:(id)a3 forKey:(id)a4
{
  id v5;
  id v6;
  SPProtoSockPuppetObject *v7;
  SPProtoSockPuppetObject *v8;
  void *v9;
  void *v10;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(SPProtoSockPuppetObject);
  v8 = v7;
  if (v5)
    -[SPProtoSockPuppetObject setKey:](v7, "setKey:", v5);
  -[SPProtoSockPuppetObject setType:](v8, "setType:", 16);
  +[SPProtoSerializer spPlistWithDictionary:](SPProtoSerializer, "spPlistWithDictionary:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "data");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPProtoSockPuppetObject setObject:](v8, "setObject:", v10);

  return v8;
}

+ (id)protoSPObjectWithArray:(id)a3 forKey:(id)a4
{
  id v5;
  id v6;
  SPProtoSockPuppetObject *v7;
  SPProtoSockPuppetObject *v8;
  void *v9;
  void *v10;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(SPProtoSockPuppetObject);
  v8 = v7;
  if (v5)
    -[SPProtoSockPuppetObject setKey:](v7, "setKey:", v5);
  -[SPProtoSockPuppetObject setType:](v8, "setType:", 17);
  +[SPProtoSerializer spPlistWithArray:](SPProtoSerializer, "spPlistWithArray:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "data");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPProtoSockPuppetObject setObject:](v8, "setObject:", v10);

  return v8;
}

+ (id)spPlistWithArray:(id)a3
{
  id v3;
  SPProtoSockPuppetPlist *v4;
  id v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t i;
  NSObject *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  __int128 v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  void *v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(SPProtoSockPuppetPlist);
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v43, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v33;
    *(_QWORD *)&v7 = 136446722;
    v26 = v7;
    v27 = v5;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v33 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          +[SPProtoSerializer protoSPObjectWithString:forKey:](SPProtoSerializer, "protoSPObjectWithString:forKey:", v11, 0);
          v12 = objc_claimAutoreleasedReturnValue();
LABEL_16:
          v13 = (void *)v12;
          -[SPProtoSockPuppetPlist addObject:](v4, "addObject:", v12, v26);
          goto LABEL_17;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          +[SPProtoSerializer protoSPObjectWithNumber:forKey:](SPProtoSerializer, "protoSPObjectWithNumber:forKey:", v11, 0);
          v12 = objc_claimAutoreleasedReturnValue();
          goto LABEL_16;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          +[SPProtoSerializer protoSPObjectWithData:forKey:](SPProtoSerializer, "protoSPObjectWithData:forKey:", v11, 0);
          v12 = objc_claimAutoreleasedReturnValue();
          goto LABEL_16;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          +[SPProtoSerializer protoSPObjectWithDictionary:forKey:](SPProtoSerializer, "protoSPObjectWithDictionary:forKey:", v11, 0);
          v12 = objc_claimAutoreleasedReturnValue();
          goto LABEL_16;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          +[SPProtoSerializer protoSPObjectWithArray:forKey:](SPProtoSerializer, "protoSPObjectWithArray:forKey:", v11, 0);
          v12 = objc_claimAutoreleasedReturnValue();
          goto LABEL_16;
        }
        v30 = 0u;
        v31 = 0u;
        v28 = 0u;
        v29 = 0u;
        if (__allowedClasses_onceToken != -1)
          dispatch_once(&__allowedClasses_onceToken, &__block_literal_global_8);
        v14 = (id)__allowedClasses___allowedClasses;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v42, 16);
        if (v15)
        {
          v16 = v15;
          v17 = 0;
          v18 = *(_QWORD *)v29;
          do
          {
            for (i = 0; i != v16; ++i)
            {
              if (*(_QWORD *)v29 != v18)
                objc_enumerationMutation(v14);
              v17 |= objc_opt_isKindOfClass();
            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v42, 16);
          }
          while (v16);

          v5 = v27;
          if ((v17 & 1) != 0)
            goto LABEL_34;
        }
        else
        {

        }
        wk_default_log();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          v22 = (void *)objc_opt_class();
          *(_DWORD *)buf = v26;
          v37 = "+[SPProtoSerializer spPlistWithArray:]";
          v38 = 1024;
          v39 = 208;
          v40 = 2114;
          v41 = v22;
          v23 = v22;
          _os_log_error_impl(&dword_215918000, v20, OS_LOG_TYPE_ERROR, "%{public}s:%d: obj is of class %{public}@ which is not an allowed class", buf, 0x1Cu);

        }
LABEL_34:
        spUtils_serializeObject(v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[SPProtoSerializer protoSPObjectWithObject:forKey:](SPProtoSerializer, "protoSPObjectWithObject:forKey:", v13, 0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[SPProtoSockPuppetPlist addObject:](v4, "addObject:", v21);

LABEL_17:
        ++v10;
      }
      while (v10 != v8);
      v24 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v43, 16);
      v8 = v24;
    }
    while (v24);
  }

  return v4;
}

+ (id)spPlistWithDictionary:(id)a3
{
  id v3;
  SPProtoSockPuppetPlist *v4;
  id v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t i;
  NSObject *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  __int128 v27;
  SPProtoSockPuppetPlist *v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  void *v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(SPProtoSockPuppetPlist);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v34, v45, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v35;
    *(_QWORD *)&v7 = 136446722;
    v27 = v7;
    v28 = v4;
    v29 = *(_QWORD *)v35;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v35 != v9)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v10);
        objc_msgSend(v5, "objectForKeyedSubscript:", v11, v27);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          +[SPProtoSerializer protoSPObjectWithString:forKey:](SPProtoSerializer, "protoSPObjectWithString:forKey:", v12, v11);
          v13 = objc_claimAutoreleasedReturnValue();
LABEL_16:
          v14 = (void *)v13;
          -[SPProtoSockPuppetPlist addObject:](v4, "addObject:", v13);
          goto LABEL_17;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          +[SPProtoSerializer protoSPObjectWithNumber:forKey:](SPProtoSerializer, "protoSPObjectWithNumber:forKey:", v12, v11);
          v13 = objc_claimAutoreleasedReturnValue();
          goto LABEL_16;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          +[SPProtoSerializer protoSPObjectWithData:forKey:](SPProtoSerializer, "protoSPObjectWithData:forKey:", v12, v11);
          v13 = objc_claimAutoreleasedReturnValue();
          goto LABEL_16;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          +[SPProtoSerializer protoSPObjectWithDictionary:forKey:](SPProtoSerializer, "protoSPObjectWithDictionary:forKey:", v12, v11);
          v13 = objc_claimAutoreleasedReturnValue();
          goto LABEL_16;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          +[SPProtoSerializer protoSPObjectWithArray:forKey:](SPProtoSerializer, "protoSPObjectWithArray:forKey:", v12, v11);
          v13 = objc_claimAutoreleasedReturnValue();
          goto LABEL_16;
        }
        v32 = 0u;
        v33 = 0u;
        v30 = 0u;
        v31 = 0u;
        if (__allowedClasses_onceToken != -1)
          dispatch_once(&__allowedClasses_onceToken, &__block_literal_global_8);
        v15 = (id)__allowedClasses___allowedClasses;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v44, 16);
        if (v16)
        {
          v17 = v16;
          v18 = 0;
          v19 = *(_QWORD *)v31;
          do
          {
            for (i = 0; i != v17; ++i)
            {
              if (*(_QWORD *)v31 != v19)
                objc_enumerationMutation(v15);
              v18 |= objc_opt_isKindOfClass();
            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v44, 16);
          }
          while (v17);

          v4 = v28;
          if ((v18 & 1) != 0)
            goto LABEL_34;
        }
        else
        {

        }
        wk_default_log();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          v23 = (void *)objc_opt_class();
          *(_DWORD *)buf = v27;
          v39 = "+[SPProtoSerializer spPlistWithDictionary:]";
          v40 = 1024;
          v41 = 254;
          v42 = 2114;
          v43 = v23;
          v24 = v23;
          _os_log_error_impl(&dword_215918000, v21, OS_LOG_TYPE_ERROR, "%{public}s:%d: obj is of class %{public}@ which is not an allowed class", buf, 0x1Cu);

        }
LABEL_34:
        spUtils_serializeObject(v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        +[SPProtoSerializer protoSPObjectWithObject:forKey:](SPProtoSerializer, "protoSPObjectWithObject:forKey:", v14, v11);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[SPProtoSockPuppetPlist addObject:](v4, "addObject:", v22);

        v9 = v29;
LABEL_17:

        ++v10;
      }
      while (v10 != v8);
      v25 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v34, v45, 16);
      v8 = v25;
    }
    while (v25);
  }

  return v4;
}

+ (id)dictionaryWithSPPlist:(id)a3
{
  id v3;
  void *v4;
  __int128 v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  const char *v14;
  void *v15;
  SPProtoSockPuppetPlist *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  SPProtoSockPuppetPlist *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v26;
  _BYTE buf[24];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "objectsCount"))
  {
    v6 = 0;
    *(_QWORD *)&v5 = 136446466;
    v26 = v5;
    while (1)
    {
      objc_msgSend(v3, "objectAtIndex:", v6, v26, *(_OWORD *)buf, *(_QWORD *)&buf[16], v28);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "type") == 2)
        break;
      if (objc_msgSend(v7, "type") == 5)
      {
        +[SPProtoSerializer numberWithSPProtoSockPuppetObject:](SPProtoSerializer, "numberWithSPProtoSockPuppetObject:", v7);
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      }
      if (objc_msgSend(v7, "type") == 4)
      {
        objc_msgSend(v7, "object");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v10)
        {
          wk_default_log();
          v11 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            goto LABEL_34;
          *(_DWORD *)buf = v26;
          *(_QWORD *)&buf[4] = "+[SPProtoSerializer dictionaryWithSPPlist:]";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 279;
          v13 = v11;
          v14 = "%{public}s:%d: SPProtoSerializerTypeData, object field is empty";
          goto LABEL_14;
        }
        objc_msgSend(v7, "object");
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      }
      if (objc_msgSend(v7, "type") == 17)
      {
        objc_msgSend(v7, "object");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          v16 = [SPProtoSockPuppetPlist alloc];
          objc_msgSend(v7, "object");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = -[SPProtoSockPuppetPlist initWithData:](v16, "initWithData:", v17);

          +[SPProtoSerializer arrayWithSPPlist:](SPProtoSerializer, "arrayWithSPPlist:", v11);
          v18 = objc_claimAutoreleasedReturnValue();
          goto LABEL_28;
        }
        wk_default_log();
        v11 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          goto LABEL_34;
        *(_DWORD *)buf = v26;
        *(_QWORD *)&buf[4] = "+[SPProtoSerializer dictionaryWithSPPlist:]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 287;
        v13 = v11;
        v14 = "%{public}s:%d: SPProtoSerializerTypeData, object field is empty";
        goto LABEL_14;
      }
      if (objc_msgSend(v7, "type") == 16)
      {
        objc_msgSend(v7, "object");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          v20 = [SPProtoSockPuppetPlist alloc];
          objc_msgSend(v7, "object");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = -[SPProtoSockPuppetPlist initWithData:](v20, "initWithData:", v21);

          +[SPProtoSerializer dictionaryWithSPPlist:](SPProtoSerializer, "dictionaryWithSPPlist:", v11);
          v18 = objc_claimAutoreleasedReturnValue();
          goto LABEL_28;
        }
        wk_default_log();
        v11 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
LABEL_34:

          goto LABEL_35;
        }
        *(_DWORD *)buf = v26;
        *(_QWORD *)&buf[4] = "+[SPProtoSerializer dictionaryWithSPPlist:]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 295;
        v13 = v11;
        v14 = "%{public}s:%d: SPProtoSerializerTypeData, object field is empty";
        goto LABEL_14;
      }
      if (objc_msgSend(v7, "type") == 3)
      {
        objc_msgSend(v7, "object");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22)
        {
          objc_msgSend(v7, "object");
          v11 = objc_claimAutoreleasedReturnValue();
          if (__allowedClasses_onceToken != -1)
            dispatch_once(&__allowedClasses_onceToken, &__block_literal_global_8);
          spUtils_deserializeObject(v11, (void *)__allowedClasses___allowedClasses);
          v18 = objc_claimAutoreleasedReturnValue();
LABEL_28:
          v23 = (void *)v18;
          objc_msgSend(v7, "key");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKey:", v23, v24);

          goto LABEL_34;
        }
        wk_default_log();
        v11 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          goto LABEL_34;
        *(_DWORD *)buf = v26;
        *(_QWORD *)&buf[4] = "+[SPProtoSerializer dictionaryWithSPPlist:]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 301;
        v13 = v11;
        v14 = "%{public}s:%d: SPProtoSerializerTypeObject, object field is empty";
LABEL_14:
        _os_log_error_impl(&dword_215918000, v13, OS_LOG_TYPE_ERROR, v14, buf, 0x12u);
        goto LABEL_34;
      }
LABEL_35:

      if (++v6 >= (unint64_t)objc_msgSend(v3, "objectsCount"))
        goto LABEL_38;
    }
    objc_msgSend(v7, "text");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      wk_default_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        goto LABEL_34;
      *(_DWORD *)buf = v26;
      *(_QWORD *)&buf[4] = "+[SPProtoSerializer dictionaryWithSPPlist:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 271;
      v13 = v11;
      v14 = "%{public}s:%d: SPProtoSerializerTypeString, text field is empty";
      goto LABEL_14;
    }
    objc_msgSend(v7, "text");
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_11:
    v11 = v9;
    objc_msgSend(v7, "key");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, v12);

    goto LABEL_34;
  }
LABEL_38:

  return v4;
}

+ (id)arrayWithSPPlist:(id)a3
{
  id v3;
  void *v4;
  __int128 v5;
  unint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  SPProtoSockPuppetPlist *v13;
  void *v14;
  void *v15;
  void *v16;
  SPProtoSockPuppetPlist *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  const char *v21;
  void *v22;
  void *v23;
  __int128 v25;
  _BYTE buf[24];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "objectsCount"))
  {
    v6 = 0;
    *(_QWORD *)&v5 = 136446466;
    v25 = v5;
    do
    {
      objc_msgSend(v3, "objectAtIndex:", v6, v25, *(_OWORD *)buf, *(_QWORD *)&buf[16], v27);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "type") == 2)
      {
        objc_msgSend(v7, "text");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
        {
          objc_msgSend(v7, "text");
          v9 = objc_claimAutoreleasedReturnValue();
LABEL_11:
          v11 = v9;
          objc_msgSend(v4, "addObject:", v9);
          goto LABEL_13;
        }
        wk_default_log();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v25;
          *(_QWORD *)&buf[4] = "+[SPProtoSerializer arrayWithSPPlist:]";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 318;
          v20 = v11;
          v21 = "%{public}s:%d: SPProtoSerializerTypeString, text field is empty";
          goto LABEL_35;
        }
      }
      else
      {
        if (objc_msgSend(v7, "type") == 5)
        {
          +[SPProtoSerializer numberWithSPProtoSockPuppetObject:](SPProtoSerializer, "numberWithSPProtoSockPuppetObject:", v7);
          v9 = objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
        if (objc_msgSend(v7, "type") == 4)
        {
          objc_msgSend(v7, "object");
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (v10)
          {
            objc_msgSend(v7, "object");
            v9 = objc_claimAutoreleasedReturnValue();
            goto LABEL_11;
          }
          wk_default_log();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v25;
            *(_QWORD *)&buf[4] = "+[SPProtoSerializer arrayWithSPPlist:]";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 326;
            v20 = v11;
            v21 = "%{public}s:%d: SPProtoSerializerTypeData, object field is empty";
LABEL_35:
            _os_log_error_impl(&dword_215918000, v20, OS_LOG_TYPE_ERROR, v21, buf, 0x12u);
          }
        }
        else if (objc_msgSend(v7, "type") == 17)
        {
          objc_msgSend(v7, "object");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
          {
            v13 = [SPProtoSockPuppetPlist alloc];
            objc_msgSend(v7, "object");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = -[SPProtoSockPuppetPlist initWithData:](v13, "initWithData:", v14);

            +[SPProtoSerializer arrayWithSPPlist:](SPProtoSerializer, "arrayWithSPPlist:", v11);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v15);

          }
          else
          {
            wk_default_log();
            v11 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v25;
              *(_QWORD *)&buf[4] = "+[SPProtoSerializer arrayWithSPPlist:]";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 334;
              v20 = v11;
              v21 = "%{public}s:%d: SPProtoSerializerTypeData, object field is empty";
              goto LABEL_35;
            }
          }
        }
        else
        {
          if (objc_msgSend(v7, "type") != 16)
          {
            if (objc_msgSend(v7, "type") != 3)
              goto LABEL_14;
            objc_msgSend(v7, "object");
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v22)
            {
              wk_default_log();
              v11 = objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
                goto LABEL_13;
              *(_DWORD *)buf = v25;
              *(_QWORD *)&buf[4] = "+[SPProtoSerializer arrayWithSPPlist:]";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 348;
              v20 = v11;
              v21 = "%{public}s:%d: SPProtoSerializerTypeObject, object field is empty";
              goto LABEL_35;
            }
            objc_msgSend(v7, "object");
            v11 = objc_claimAutoreleasedReturnValue();
            if (__allowedClasses_onceToken != -1)
              dispatch_once(&__allowedClasses_onceToken, &__block_literal_global_8);
            spUtils_deserializeObject(v11, (void *)__allowedClasses___allowedClasses);
            v19 = objc_claimAutoreleasedReturnValue();
            goto LABEL_29;
          }
          objc_msgSend(v7, "object");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            v17 = [SPProtoSockPuppetPlist alloc];
            objc_msgSend(v7, "object");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = -[SPProtoSockPuppetPlist initWithData:](v17, "initWithData:", v18);

            +[SPProtoSerializer dictionaryWithSPPlist:](SPProtoSerializer, "dictionaryWithSPPlist:", v11);
            v19 = objc_claimAutoreleasedReturnValue();
LABEL_29:
            v23 = (void *)v19;
            objc_msgSend(v4, "addObject:", v19);

            goto LABEL_13;
          }
          wk_default_log();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v25;
            *(_QWORD *)&buf[4] = "+[SPProtoSerializer arrayWithSPPlist:]";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 342;
            v20 = v11;
            v21 = "%{public}s:%d: SPProtoSerializerTypeData, object field is empty";
            goto LABEL_35;
          }
        }
      }
LABEL_13:

LABEL_14:
      ++v6;
    }
    while (v6 < objc_msgSend(v3, "objectsCount"));
  }

  return v4;
}

@end
