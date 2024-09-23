@implementation SHCustomCatalog

- (SHCustomCatalog)init
{
  void *v3;
  SHCustomCatalog *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[SHCustomCatalog initWithConfiguration:error:](self, "initWithConfiguration:error:", v3, 0);

  return v4;
}

- (SHCustomCatalog)initWithDataRepresentation:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  SHCustomCatalog *v8;

  v6 = a3;
  v7 = (void *)objc_opt_new();
  v8 = -[SHCustomCatalog initWithConfiguration:dataRepresentation:error:](self, "initWithConfiguration:dataRepresentation:error:", v7, v6, a4);

  return v8;
}

- (SHCustomCatalog)initWithConfiguration:(id)a3 dataRepresentation:(id)a4 error:(id *)a5
{
  id v8;
  SHCustomCatalog *v9;
  SHCustomCatalog *v10;
  SHCustomCatalog *v11;

  v8 = a4;
  v9 = -[SHCustomCatalog initWithConfiguration:error:](self, "initWithConfiguration:error:", a3, a5);
  v10 = v9;
  if (v9
    && !-[SHCustomCatalog addCustomCatalogDataRepresentation:error:](v9, "addCustomCatalogDataRepresentation:error:", v8, a5))
  {
    v11 = 0;
  }
  else
  {
    v11 = v10;
  }

  return v11;
}

- (SHCustomCatalog)initWithConfiguration:(id)a3 error:(id *)a4
{
  id v7;
  SHCustomCatalog *v8;
  SHCustomCatalog *v9;
  SHJSONLCustomCatalogContainer *v10;
  SHCustomCatalogContainer *customCatalogContainer;
  objc_super v13;

  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SHCustomCatalog;
  v8 = -[SHCatalog initWithConfiguration:error:](&v13, sel_initWithConfiguration_error_, v7, a4);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->__configuration, a3);
    v10 = objc_alloc_init(SHJSONLCustomCatalogContainer);
    customCatalogContainer = v9->_customCatalogContainer;
    v9->_customCatalogContainer = (SHCustomCatalogContainer *)v10;

  }
  return v9;
}

- (BOOL)addCustomCatalogFromURL:(NSURL *)customCatalogURL error:(NSError *)error
{
  NSURL *v6;
  void *v7;
  char v8;

  v6 = customCatalogURL;
  -[SHCustomCatalog customCatalogContainer](self, "customCatalogContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "loadFromURL:error:", v6, error);

  +[SHError remapErrorToClientErrorPointer:](SHError, "remapErrorToClientErrorPointer:", error);
  return v8;
}

- (BOOL)addCustomCatalog:(id)a3 error:(id *)a4
{
  void *v6;

  objc_msgSend(a3, "dataRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = -[SHCustomCatalog addCustomCatalogDataRepresentation:error:](self, "addCustomCatalogDataRepresentation:error:", v6, a4);

  return (char)a4;
}

- (BOOL)addCustomCatalogDataRepresentation:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  char v8;

  v6 = a3;
  -[SHCustomCatalog customCatalogContainer](self, "customCatalogContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "loadFromData:error:", v6, a4);

  if ((v8 & 1) == 0)
    +[SHError remapErrorToClientErrorPointer:](SHError, "remapErrorToClientErrorPointer:", a4);
  return v8;
}

- (BOOL)writeToURL:(NSURL *)destinationURL error:(NSError *)error
{
  NSURL *v6;
  void *v7;
  char v8;

  v6 = destinationURL;
  -[SHCustomCatalog customCatalogContainer](self, "customCatalogContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "writeToURL:error:", v6, error);

  +[SHError remapErrorToClientErrorPointer:](SHError, "remapErrorToClientErrorPointer:", error);
  return v8;
}

- (NSData)dataRepresentation
{
  void *v2;
  void *v3;

  -[SHCustomCatalog customCatalogContainer](self, "customCatalogContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (BOOL)addReferenceSignature:(SHSignature *)signature representingMediaItems:(NSArray *)mediaItems error:(NSError *)error
{
  NSArray *v8;
  SHSignature *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  v8 = mediaItems;
  v9 = signature;
  -[SHSignature duration](v9, "duration");
  v11 = v10;
  -[SHCatalog minimumQuerySignatureDuration](self, "minimumQuerySignatureDuration");
  v13 = v12;
  if (v11 < v12)
  {
    v15 = (void *)MEMORY[0x24BDD17C8];
    -[SHCatalog minimumQuerySignatureDuration](self, "minimumQuerySignatureDuration");
    v17 = v16;
    -[SHSignature duration](v9, "duration");
    v19 = v18;

    objc_msgSend(v15, "stringWithFormat:", CFSTR("The minimum signature duration allowed is %.2f secs, this signature is only %.2f secs"), v17, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = *MEMORY[0x24BDD0FD8];
    v24[0] = v20;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[SHError annotateClientError:code:underlyingError:keyOverrides:](SHError, "annotateClientError:code:underlyingError:keyOverrides:", error, 201, 0, v21);

    +[SHError remapErrorToClientErrorPointer:](SHError, "remapErrorToClientErrorPointer:", error);
  }
  else
  {
    -[SHCustomCatalog customCatalogContainer](self, "customCatalogContainer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSignature:representingMediaItems:", v9, v8);

  }
  return v11 >= v13;
}

- (void)enumerateWithBlock:(id)a3
{
  void (**v4)(id, void *, void *, _BYTE *);
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  char v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, void *, void *, _BYTE *))a3;
  v19 = 0;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[SHCustomCatalog customCatalogContainer](self, "customCatalogContainer", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "referenceSignatures");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v9)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v10);
      objc_msgSend(v11, "signature");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SHCustomCatalog customCatalogContainer](self, "customCatalogContainer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "mediaItemsForReferenceSignature:", v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v12, v14, &v19);

      if (v19)
        break;
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
        if (v8)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (id)_createMatcher
{
  void *v3;
  int v4;
  SHCustomCatalogTrackerMatcher *v5;
  void *v6;
  void *v7;
  SHCustomCatalogTrackerMatcher *v8;
  __objc2_class **v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __33__SHCustomCatalog__createMatcher__block_invoke;
  v11[3] = &unk_24D9B7C48;
  v11[4] = &v12;
  -[SHCustomCatalog enumerateWithBlock:](self, "enumerateWithBlock:", v11);
  -[SHCustomCatalog _configuration](self, "_configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsSignatureTracking");

  if (v4)
  {
    v5 = [SHCustomCatalogTrackerMatcher alloc];
    -[SHCustomCatalog _customCatalogConfiguration](self, "_customCatalogConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHCustomCatalog customCatalogContainer](self, "customCatalogContainer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[SHCustomCatalogTrackerMatcher initWithCustomCatalogConfiguration:container:](v5, "initWithCustomCatalogConfiguration:container:", v6, v7);

  }
  else
  {
    if (*((_BYTE *)v13 + 24))
      v9 = off_24D9B61B0;
    else
      v9 = off_24D9B60D8;
    v8 = (SHCustomCatalogTrackerMatcher *)objc_msgSend(objc_alloc(*v9), "initWithCustomCatalog:", self);
  }
  _Block_object_dispose(&v12, 8);
  return v8;
}

void __33__SHCustomCatalog__createMatcher__block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v11, "timeRanges");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "count"))
        {

        }
        else
        {
          objc_msgSend(v11, "frequencySkewRanges");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "count");

          if (!v14)
            continue;
        }
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
        *a4 = 1;
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

}

- (SHCustomCatalogConfiguration)_configuration
{
  return self->__configuration;
}

- (SHCustomCatalogContainer)customCatalogContainer
{
  return self->_customCatalogContainer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customCatalogContainer, 0);
  objc_storeStrong((id *)&self->__configuration, 0);
}

@end
