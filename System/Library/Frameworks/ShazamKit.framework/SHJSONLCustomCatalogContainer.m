@implementation SHJSONLCustomCatalogContainer

- (SHJSONLCustomCatalogContainer)init
{
  SHJSONLCustomCatalogContainer *v2;
  SHJSONLCustomCatalogTransformer *v3;
  SHJSONLCustomCatalogTransformer *transformer;
  SHCustomCatalogMemoryStorage *v5;
  SHCustomCatalogStorage *container;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SHJSONLCustomCatalogContainer;
  v2 = -[SHJSONLCustomCatalogContainer init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(SHJSONLCustomCatalogTransformer);
    transformer = v2->_transformer;
    v2->_transformer = v3;

    v5 = objc_alloc_init(SHCustomCatalogMemoryStorage);
    container = v2->_container;
    v2->_container = (SHCustomCatalogStorage *)v5;

  }
  return v2;
}

- (BOOL)loadFromData:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;

  v6 = a3;
  if (objc_msgSend(v6, "length"))
  {
    v7 = objc_alloc_init(MEMORY[0x24BE90540]);
    -[SHJSONLCustomCatalogContainer transformer](self, "transformer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDelegate:", v8);

    -[SHJSONLCustomCatalogContainer container](self, "container");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHJSONLCustomCatalogContainer transformer](self, "transformer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDelegate:", v9);

    v11 = objc_msgSend(v7, "loadData:withCompression:error:", v6, 517, a4);
    -[SHJSONLCustomCatalogContainer transformer](self, "transformer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "reset");

  }
  else
  {
    +[SHError annotateClientError:code:underlyingError:](SHError, "annotateClientError:code:underlyingError:", a4, 300, 0);
    v11 = 0;
  }

  return v11;
}

- (BOOL)loadFromURL:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;

  +[SHJSONLCustomCatalogContainer customCatalogURLFromURL:error:](SHJSONLCustomCatalogContainer, "customCatalogURLFromURL:error:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = objc_alloc_init(MEMORY[0x24BE90540]);
    -[SHJSONLCustomCatalogContainer transformer](self, "transformer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDelegate:", v8);

    -[SHJSONLCustomCatalogContainer container](self, "container");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHJSONLCustomCatalogContainer transformer](self, "transformer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDelegate:", v9);

    v11 = objc_msgSend(v7, "loadDataFromURL:withCompression:error:", v6, 517, a4);
    -[SHJSONLCustomCatalogContainer transformer](self, "transformer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "reset");

  }
  else
  {
    +[SHError annotateClientError:code:underlyingError:](SHError, "annotateClientError:code:underlyingError:", a4, 301, 0);
    v11 = 0;
  }

  return v11;
}

- (NSData)dataRepresentation
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v9 = 0;
  -[SHJSONLCustomCatalogContainer jsonObjectRepresentationWithError:](self, "jsonObjectRepresentationWithError:", &v9);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v9;
  if (!v2)
  {
    sh_log_object();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v3;
      _os_log_impl(&dword_218BF1000, v6, OS_LOG_TYPE_ERROR, "Failed to convert catalog contents to json representation: %@", buf, 0xCu);
    }
    v4 = 0;
    goto LABEL_9;
  }
  v8 = v3;
  objc_msgSend(MEMORY[0x24BE90548], "dataForJSONObjects:compression:error:", v2, 517, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;

  if (!v4)
  {
    sh_log_object();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v5;
      _os_log_impl(&dword_218BF1000, v6, OS_LOG_TYPE_ERROR, "Failed to compress contents: %@", buf, 0xCu);
    }
    v3 = v5;
LABEL_9:

    v5 = v3;
  }

  return (NSData *)v4;
}

- (id)jsonObjectRepresentationWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDBCEB8];
  +[SHJSONLCustomCatalogTransformer outputFileHeader](SHJSONLCustomCatalogTransformer, "outputFileHeader");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayWithObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[SHJSONLCustomCatalogContainer container](self, "container");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "referenceSignatures");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v8;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v13, "signature");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "ID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        +[SHJSONLCustomCatalogTransformer catalogFileRepresentationOfSignature:withID:](SHJSONLCustomCatalogTransformer, "catalogFileRepresentationOfSignature:withID:", v14, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v16);

        -[SHJSONLCustomCatalogContainer mediaItemsForReferenceSignature:](self, "mediaItemsForReferenceSignature:", v13);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "ID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        +[SHJSONLCustomCatalogTransformer catalogFileRepresentationOfMediaItems:withID:error:](SHJSONLCustomCatalogTransformer, "catalogFileRepresentationOfMediaItems:withID:error:", v17, v18, a3);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v19)
        {

          v20 = 0;
          goto LABEL_11;
        }
        objc_msgSend(v6, "addObjectsFromArray:", v19);

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v10)
        continue;
      break;
    }
  }

  v20 = v6;
LABEL_11:

  return v20;
}

- (BOOL)writeToURL:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  char v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  +[SHJSONLCustomCatalogContainer customCatalogURLFromURL:error:](SHJSONLCustomCatalogContainer, "customCatalogURLFromURL:error:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE90548]), "initWithDestination:compression:", v6, 517);
    -[SHJSONLCustomCatalogContainer jsonObjectRepresentationWithError:](self, "jsonObjectRepresentationWithError:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      v10 = v8;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v18;
        while (2)
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v18 != v13)
              objc_enumerationMutation(v10);
            if (!objc_msgSend(v7, "writeObject:error:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i), a4, (_QWORD)v17))
            {

              goto LABEL_14;
            }
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
          if (v12)
            continue;
          break;
        }
      }

      v15 = objc_msgSend(v7, "closeWithError:", a4);
    }
    else
    {
LABEL_14:
      v15 = 0;
    }

  }
  else
  {
    +[SHError annotateClientError:code:underlyingError:](SHError, "annotateClientError:code:underlyingError:", a4, 301, 0);
    v15 = 0;
  }

  return v15;
}

+ (id)customCatalogURLFromURL:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v13;

  v5 = a3;
  if ((objc_msgSend(v5, "isFileURL") & 1) != 0)
  {
    v13 = 0;
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fileExistsAtPath:isDirectory:", v7, &v13);

    if (v13)
    {
      objc_msgSend(v5, "URLByAppendingPathComponent:", CFSTR("Signatures"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDF8238], "SHCustomCatalogContentType");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "preferredFilenameExtension");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "URLByAppendingPathExtension:", v10);
      v5 = (id)objc_claimAutoreleasedReturnValue();

    }
    v5 = v5;
    v11 = v5;
  }
  else
  {
    +[SHError annotateClientError:code:underlyingError:](SHError, "annotateClientError:code:underlyingError:", a4, 301, 0);
    v11 = 0;
  }

  return v11;
}

- (id)mediaItemsForReferenceSignature:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SHJSONLCustomCatalogContainer container](self, "container");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mediaItemsForReferenceSignature:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)referenceSignatureForTrackID:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[SHJSONLCustomCatalogContainer container](self, "container");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "referenceSignatureForTrackID:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)addSignature:(id)a3 representingMediaItems:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[SHJSONLCustomCatalogContainer container](self, "container");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSignature:representingMediaItems:", v7, v6);

}

- (NSArray)referenceSignatures
{
  void *v2;
  void *v3;

  -[SHJSONLCustomCatalogContainer container](self, "container");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "referenceSignatures");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (SHCustomCatalogStorage)container
{
  return self->_container;
}

- (SHJSONLCustomCatalogTransformer)transformer
{
  return self->_transformer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transformer, 0);
  objc_storeStrong((id *)&self->_container, 0);
}

@end
