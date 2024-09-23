@implementation SLBatchRequest

- (SLBatchRequest)initWithServiceType:(id)a3 URL:(id)a4 parameters:(id)a5 requestMethod:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  SLBatchRequest *v13;
  uint64_t v14;
  NSMutableArray *requests;
  SLBatchRequest *v16;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.social.facebook")))
  {
    v18.receiver = self;
    v18.super_class = (Class)SLBatchRequest;
    v13 = -[SLRequest initWithServiceType:URL:parameters:requestMethod:](&v18, sel_initWithServiceType_URL_parameters_requestMethod_, v10, v11, v12, a6);
    if (v13)
    {
      v14 = objc_opt_new();
      requests = v13->_requests;
      v13->_requests = (NSMutableArray *)v14;

    }
    self = v13;
    v16 = self;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)addRequest:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[SLRequest multiPartBoundary](self, "multiPartBoundary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMultiPartBoundary:", v4);

  -[NSMutableArray addObject:](self->_requests, "addObject:", v5);
}

- (id)preparedURLRequest
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  uint64_t v21;
  NSMutableArray *obj;
  void *v23;
  objc_super v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v23 = (void *)objc_opt_new();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = self->_requests;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v31 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v7, "dictionaryRepresentationForJSONSerialization");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "addObject:", v8);

        v28 = 0u;
        v29 = 0u;
        v26 = 0u;
        v27 = 0u;
        objc_msgSend(v7, "multiParts");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v27;
          do
          {
            for (j = 0; j != v11; ++j)
            {
              if (*(_QWORD *)v27 != v12)
                objc_enumerationMutation(v9);
              v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * j);
              objc_msgSend(v14, "uniqueIdentifier");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "setName:", v15);

              -[SLRequest addMultiPart:](self, "addMultiPart:", v14);
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
          }
          while (v11);
        }

      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v4);
  }

  v25 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v23, 0, &v25);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Failed to serialize batch request data into JSON"));
  if (v16)
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v16, 4);
    -[SLRequest setParameterValue:forKey:](self, "setParameterValue:forKey:", v17, CFSTR("batch"));
    v20 = v17;
    _SLLog(v21, 6, CFSTR("Batch: %@"));

  }
  v24.receiver = self;
  v24.super_class = (Class)SLBatchRequest;
  -[SLRequest preparedURLRequest](&v24, sel_preparedURLRequest, v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requests, 0);
}

@end
