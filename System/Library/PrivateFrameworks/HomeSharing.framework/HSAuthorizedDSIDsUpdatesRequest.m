@implementation HSAuthorizedDSIDsUpdatesRequest

- (HSAuthorizedDSIDsUpdatesRequest)init
{
  HSAuthorizedDSIDsUpdatesRequest *v2;
  HSAuthorizedDSIDsUpdatesRequest *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HSAuthorizedDSIDsUpdatesRequest;
  v2 = -[HSRequest initWithAction:](&v5, sel_initWithAction_, CFSTR("authorized-dsids-updates"));
  v3 = v2;
  if (v2)
    -[HSRequest setValue:forArgument:](v2, "setValue:forArgument:", CFSTR("1"), CFSTR("revision-number"));
  return v3;
}

- (id)canonicalResponseForResponse:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  +[HSResponse responseWithResponse:](HSAuthorizedDSIDsUpdatesResponse, "responseWithResponse:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "responseData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HSResponseDataParser parseResponseData:](HSResponseDataParser, "parseResponseData:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v5, "count"));
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
        v11 = 0;
        do
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "objectForKey:", CFSTR("com.apple.itunes.drm-user-id"), (_QWORD)v14);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
            objc_msgSend(v6, "addObject:", v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }

    objc_msgSend(v3, "setAuthorizedDSIDs:", v6);
  }

  return v3;
}

@end
