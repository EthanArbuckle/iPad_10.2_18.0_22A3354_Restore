@implementation NSItemProvider(UTType)

- (void)initWithContentsOfURL:()UTType contentType:openInPlace:coordinated:visibility:
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v22[4];
  id v23;
  char v24;
  id v25;

  v11 = a3;
  v12 = a4;
  v13 = (void *)objc_msgSend(a1, "init");
  if (v13)
  {
    if (v12)
    {
      _typeIdentifierFromUTType(v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }
    if (!objc_msgSend(v14, "length"))
    {
      v25 = 0;
      if (objc_msgSend(v11, "getResourceValue:forKey:error:", &v25, *MEMORY[0x1E0C998E0], 0))
      {
        objc_msgSend(v25, "identifier");
        v15 = objc_claimAutoreleasedReturnValue();

        v14 = (void *)v15;
      }
    }
    if (!objc_msgSend(v14, "length"))
    {
      objc_msgSend(v11, "pathExtension");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "length"))
      {
        +[UTType typeWithFilenameExtension:](UTType, "typeWithFilenameExtension:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (v17)
        {
          objc_msgSend(v17, "identifier");
          v19 = objc_claimAutoreleasedReturnValue();

          v14 = (void *)v19;
        }

      }
    }
    if (!objc_msgSend(v14, "length"))
    {
      -[_UTConstantType identifier](&off_1ECD256F0, "identifier");
      v20 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v20;
    }
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __95__NSItemProvider_UTType__initWithContentsOfURL_contentType_openInPlace_coordinated_visibility___block_invoke;
    v22[3] = &unk_1E35CEA30;
    v23 = v11;
    v24 = a5;
    objc_msgSend(v13, "registerFileRepresentationForTypeIdentifier:fileOptions:visibility:loadHandler:", v14, a5, a7, v22);

  }
  return v13;
}

- (void)registerDataRepresentationForContentType:()UTType visibility:loadHandler:
{
  id v8;
  id v9;

  v8 = a5;
  _typeIdentifierFromUTType(a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "registerDataRepresentationForTypeIdentifier:visibility:loadHandler:", v9, a4, v8);

}

- (void)registerFileRepresentationForContentType:()UTType visibility:openInPlace:loadHandler:
{
  id v10;
  id v11;

  v10 = a6;
  _typeIdentifierFromUTType(a3);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "registerFileRepresentationForTypeIdentifier:fileOptions:visibility:loadHandler:", v11, a5, a4, v10);

}

- (id)registeredContentTypes
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "registeredTypeIdentifiers");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  _utTypesFromTypeIdentifiers(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)registeredContentTypesForOpenInPlace
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "registeredTypeIdentifiersWithFileOptions:", 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  _utTypesFromTypeIdentifiers(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)registeredContentTypesConformingToContentType:()UTType
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "registeredContentTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v12, "conformsToType:", v4, (_QWORD)v14))
          objc_msgSend(v6, "addObject:", v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  return v6;
}

- (id)loadDataRepresentationForContentType:()UTType completionHandler:
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  _typeIdentifierFromUTType(a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "loadDataRepresentationForTypeIdentifier:completionHandler:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)loadFileRepresentationForContentType:()UTType openInPlace:completionHandler:
{
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v8 = a5;
  _typeIdentifierFromUTType(a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    objc_msgSend(a1, "loadInPlaceFileRepresentationForTypeIdentifier:completionHandler:", v9, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __93__NSItemProvider_UTType__loadFileRepresentationForContentType_openInPlace_completionHandler___block_invoke;
    v12[3] = &unk_1E35CEA58;
    v13 = v8;
    objc_msgSend(a1, "loadFileRepresentationForTypeIdentifier:completionHandler:", v9, v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

@end
