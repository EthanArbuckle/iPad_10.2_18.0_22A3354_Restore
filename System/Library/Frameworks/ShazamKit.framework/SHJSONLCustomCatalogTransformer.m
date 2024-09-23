@implementation SHJSONLCustomCatalogTransformer

- (void)reset
{
  -[SHJSONLCustomCatalogTransformer setError:](self, "setError:", 0);
  -[SHJSONLCustomCatalogTransformer setHeader:](self, "setHeader:", 0);
}

- (BOOL)parsedJSONObject:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;

  v6 = a3;
  if (!+[SHJSONLCustomCatalogTransformer objectIsMediaItem:](SHJSONLCustomCatalogTransformer, "objectIsMediaItem:", v6))
  {
    if (!+[SHJSONLCustomCatalogTransformer objectIsSignature:](SHJSONLCustomCatalogTransformer, "objectIsSignature:", v6))
    {
      if (!+[SHJSONLCustomCatalogTransformer objectIsHeader:](SHJSONLCustomCatalogTransformer, "objectIsHeader:", v6))goto LABEL_16;
      -[SHJSONLCustomCatalogTransformer header](self, "header");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
        -[SHJSONLCustomCatalogTransformer setHeader:](self, "setHeader:", v6);
        goto LABEL_16;
      }
      goto LABEL_9;
    }
    -[SHJSONLCustomCatalogTransformer error](self, "error");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      -[SHJSONLCustomCatalogTransformer header](self, "header");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        v18 = 0;
        +[SHJSONLCustomCatalogTransformer signatureFromFileRow:error:](SHJSONLCustomCatalogTransformer, "signatureFromFileRow:error:", v6, &v18);
        v13 = objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v14 = (void *)v13;
          -[SHJSONLCustomCatalogTransformer delegate](self, "delegate");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          +[SHJSONLCustomCatalogTransformer IDFromFileRow:](SHJSONLCustomCatalogTransformer, "IDFromFileRow:", v6);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "producedSignature:forID:", v14, v16);

          goto LABEL_16;
        }
      }
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  -[SHJSONLCustomCatalogTransformer error](self, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
LABEL_8:

    goto LABEL_9;
  }
  -[SHJSONLCustomCatalogTransformer header](self, "header");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
LABEL_9:
    +[SHError annotateClientError:code:underlyingError:](SHError, "annotateClientError:code:underlyingError:", a4, 300, 0);
    LOBYTE(a4) = 0;
    goto LABEL_17;
  }
  +[SHJSONLCustomCatalogTransformer mediaItemFromFileRow:error:](SHJSONLCustomCatalogTransformer, "mediaItemFromFileRow:error:", v6, a4);
  a4 = (id *)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    -[SHJSONLCustomCatalogTransformer delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[SHJSONLCustomCatalogTransformer IDFromFileRow:](SHJSONLCustomCatalogTransformer, "IDFromFileRow:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "producedMediaItem:forID:", a4, v10);

LABEL_16:
    LOBYTE(a4) = 1;
  }
LABEL_17:

  return (char)a4;
}

+ (BOOL)objectIsHeader:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("type"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("header")))
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("name"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("version"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v6 != 0;

      }
      else
      {
        v7 = 0;
      }

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (BOOL)objectIsMediaItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("type"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("media")))
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("id"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("data"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v6 != 0;

      }
      else
      {
        v7 = 0;
      }

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (BOOL)objectIsSignature:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("type"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("signature")))
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("id"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("data"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v6 != 0;

      }
      else
      {
        v7 = 0;
      }

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)IDFromFileRow:(id)a3
{
  return (id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("id"));
}

+ (id)headerFromFileRow:(id)a3
{
  return a3;
}

+ (id)mediaItemFromFileRow:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("data"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SHMediaItemSerialization propertiesFromSerializationFormat:error:](SHMediaItemSerialization, "propertiesFromSerializationFormat:error:", v5, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SHMediaItem mediaItemWithProperties:](SHMediaItem, "mediaItemWithProperties:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)signatureFromFileRow:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  SHSignature *v13;
  void *v14;
  SHSignature *v15;
  SHSignature *v16;
  uint64_t v18;

  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("data"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v6, 0);
  if (v7)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB1880]), "initWithHostTime:", mach_absolute_time());
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("id"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v9);
    v11 = v10;
    if (v10)
    {
      v12 = v10;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v14 = v12;

    v18 = 0;
    v15 = -[SHSignature initWithID:dataRepresentation:startTime:error:]([SHSignature alloc], "initWithID:dataRepresentation:startTime:error:", v14, v7, v8, &v18);
    v13 = v15;
    if (v15)
      v16 = v15;

  }
  else
  {
    +[SHError annotateClientError:code:underlyingError:](SHError, "annotateClientError:code:underlyingError:", a4, 200, 0);
    v13 = 0;
  }

  return v13;
}

+ (id)catalogFileRepresentationOfSignature:(id)a3 withID:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x24BDAC8D0];
  v10[0] = CFSTR("type");
  v10[1] = CFSTR("id");
  v11[0] = CFSTR("signature");
  v11[1] = a4;
  v10[2] = CFSTR("data");
  v5 = a4;
  objc_msgSend(a3, "dataRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "base64EncodedStringWithOptions:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)catalogFileRepresentationOfMediaItems:(id)a3 withID:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[3];
  _QWORD v27[3];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v23;
    while (2)
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v23 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v14), "properties", (_QWORD)v22);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        +[SHMediaItemSerialization serializationFormatForProperties:error:](SHMediaItemSerialization, "serializationFormatForProperties:error:", v15, a5);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v16)
        {

          v20 = 0;
          goto LABEL_11;
        }
        v17 = (void *)MEMORY[0x24BDBCED8];
        v26[0] = CFSTR("type");
        v26[1] = CFSTR("id");
        v27[0] = CFSTR("media");
        v27[1] = v8;
        v26[2] = CFSTR("data");
        v27[2] = v16;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 3);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "dictionaryWithDictionary:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "addObject:", v19);
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
      if (v12)
        continue;
      break;
    }
  }

  v20 = (void *)objc_msgSend(v9, "copy");
LABEL_11:

  return v20;
}

+ (id)outputFileHeader
{
  _QWORD v3[3];
  _QWORD v4[4];

  v4[3] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("type");
  v3[1] = CFSTR("name");
  v4[0] = CFSTR("header");
  v4[1] = CFSTR("Shazam Catalog");
  v3[2] = CFSTR("version");
  v4[2] = &unk_24D9C5158;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (SHCustomCatalogStorage)delegate
{
  return (SHCustomCatalogStorage *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (NSDictionary)header
{
  return self->_header;
}

- (void)setHeader:(id)a3
{
  objc_storeStrong((id *)&self->_header, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_header, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
