@implementation _NBMetadataHelper

- (_NBMetadataHelper)init
{
  _NBMetadataHelper *v2;
  NSCache *v3;
  NSCache *metadataCache;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_NBMetadataHelper;
  v2 = -[_NBMetadataHelper init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init(MEMORY[0x24BDBCE40]);
    metadataCache = v2->_metadataCache;
    v2->_metadataCache = v3;

  }
  return v2;
}

+ (id)phoneNumberDataMap
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39___NBMetadataHelper_phoneNumberDataMap__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_253EC09F8 != -1)
    dispatch_once(&qword_253EC09F8, block);
  return (id)_MergedGlobals_31;
}

+ (id)CCode2CNMap
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32___NBMetadataHelper_CCode2CNMap__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_253EC0A08 != -1)
    dispatch_once(&qword_253EC0A08, block);
  return (id)qword_253EC0A00;
}

+ (id)CN2CCodeMap
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "phoneNumberDataMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("countryCodeToRegionCodeMap"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)getAllMetadata
{
  unint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  _NBMetadataHelper *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  unint64_t v21;
  _NBMetadataHelper *v22;
  unint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v28;
  id obj;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v3 = 0x24BDBC000uLL;
  objc_msgSend(MEMORY[0x24BDBCEA0], "ISOCountryCodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x24BDBCEB8]);
  v6 = objc_msgSend(v4, "count");
  v7 = v5;
  v8 = self;
  v9 = (void *)objc_msgSend(v7, "initWithCapacity:", v6);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v4;
  v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v33)
  {
    v32 = *(_QWORD *)v35;
    v31 = *MEMORY[0x24BDBCAE8];
    v10 = *MEMORY[0x24BDBCB18];
    v30 = *MEMORY[0x24BDBCB18];
    v28 = v9;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v35 != v32)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v11);
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", v12, v31, v28);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v3 + 3744), "localeIdentifierFromComponents:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v3 + 3744), "currentLocale");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "displayNameForKey:value:", v10, v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v17 = objc_alloc_init(MEMORY[0x24BDBCED8]);
        v18 = v10;
        v19 = v17;
        if (v16)
        {
          objc_msgSend(v17, "setObject:forKey:", v16, CFSTR("name"));
          if (!v12)
            goto LABEL_9;
LABEL_8:
          objc_msgSend(v19, "setObject:forKey:", v12, CFSTR("code"));
          goto LABEL_9;
        }
        v21 = v3;
        v22 = v8;
        v23 = v21;
        objc_msgSend(*(id *)(v21 + 3744), "systemLocale");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "displayNameForKey:value:", v18, v14);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25)
          objc_msgSend(v19, "setObject:forKey:", v25, CFSTR("name"));

        v8 = v22;
        v3 = v23;
        v9 = v28;
        if (v12)
          goto LABEL_8;
LABEL_9:
        -[_NBMetadataHelper getMetadataForRegion:](v8, "getMetadataForRegion:", v12);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
          objc_msgSend(v19, "setObject:forKey:", v20, CFSTR("metadata"));
        objc_msgSend(v9, "addObject:", v19);

        ++v11;
        v10 = v30;
      }
      while (v33 != v11);
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      v33 = v26;
    }
    while (v26);
  }

  return v9;
}

+ (id)regionCodeFromCountryCode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_msgSend(a1, "CN2CCodeMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v7, "count"))
    v8 = v7;
  else
    v8 = 0;

  return v8;
}

+ (id)countryCodeFromRegionCode:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "CCode2CNMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)getMetadataForRegion:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _NBPhoneMetaData *v8;
  void *v9;
  void *v10;
  void *v11;

  StringByTrimming(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(v4, "uppercaseString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSCache objectForKey:](self->_metadataCache, "objectForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "phoneNumberDataMap");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("countryToMetadata"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "objectForKeyedSubscript:", v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        v8 = -[_NBPhoneMetaData initWithEntry:]([_NBPhoneMetaData alloc], "initWithEntry:", v11);
        -[NSCache setObject:forKey:](self->_metadataCache, "setObject:forKey:", v8, v5);
      }
      else
      {
        v8 = 0;
      }

    }
  }
  else
  {
    v8 = 0;
    v5 = v4;
  }

  return v8;
}

- (id)getMetadataForNonGeographicalRegion:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NBMetadataHelper getMetadataForRegion:](self, "getMetadataForRegion:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (BOOL)hasValue:(id)a3
{
  void *v3;
  BOOL v4;

  StringByTrimming(a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length") != 0;

  return v4;
}

+ (id)jsonObjectFromZippedDataWithBytes:(char *)a3 compressedLength:(unint64_t)a4 expandedLength:(unint64_t)a5
{
  uInt v5;
  void *v7;
  id v8;
  void *v9;
  uint64_t v11;
  z_stream strm;

  v5 = a4;
  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  memset(&strm, 0, sizeof(strm));
  inflateInit2_(&strm, 16, "1.2.12", 112);
  strm.next_in = (Bytef *)a3;
  strm.avail_in = v5;
  v8 = objc_retainAutorelease(v7);
  strm.next_out = (Bytef *)objc_msgSend(v8, "bytes");
  strm.avail_out = objc_msgSend(v8, "length");
  inflate(&strm, 4);
  inflateEnd(&strm);
  v11 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v8, 0, &v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSCache)metadataCache
{
  return self->_metadataCache;
}

- (void)setMetadataCache:(id)a3
{
  objc_storeStrong((id *)&self->_metadataCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataCache, 0);
}

@end
