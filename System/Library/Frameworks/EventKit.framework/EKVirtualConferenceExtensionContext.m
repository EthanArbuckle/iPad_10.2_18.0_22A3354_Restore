@implementation EKVirtualConferenceExtensionContext

+ (id)_allowedItemPayloadClasses
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, v4, objc_opt_class(), 0);
}

- (int)requestType
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;

  -[EKVirtualConferenceExtensionContext inputItems](self, "inputItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("_EKVirtualConferenceRequestTypeKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(CFSTR("_EKVirtualConferenceRequestTypeRoomTypes"), "isEqualToString:", v5) & 1) != 0)
  {
    v6 = 1;
  }
  else if ((objc_msgSend(CFSTR("_EKVirutalConferenceRequestTypeJoinMethodsForRoomType"), "isEqualToString:", v5) & 1) != 0)
  {
    v6 = 2;
  }
  else if ((objc_msgSend(CFSTR("_EKVirtualConferenceRequestTypeURLInvalidate"), "isEqualToString:", v5) & 1) != 0)
  {
    v6 = 5;
  }
  else if (objc_msgSend(CFSTR("_EKVirtualConferenceRequestTypeURLRenew"), "isEqualToString:", v5))
  {
    v6 = 4;
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (NSString)roomTypeIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[EKVirtualConferenceExtensionContext inputItems](self, "inputItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("_EKVirtualConferenceRequestRoomTypeIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (NSURL)URLForInvalidation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[EKVirtualConferenceExtensionContext inputItems](self, "inputItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("_EKVirtualConferenceRequestURLParameterForInvalidation"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v5;
}

- (NSURL)URLForRenewal
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[EKVirtualConferenceExtensionContext inputItems](self, "inputItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("_EKVirtualConferenceRequestURLParameterForRenewal"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v5;
}

- (NSDate)renewalDate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[EKVirtualConferenceExtensionContext inputItems](self, "inputItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("_EKVirtualConferenceRequestDateParameterForRenewal"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v5;
}

- (void)completeRequestWithAvailableRoomTypes:(id)a3 completionHandler:(id)a4
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[2];
  _QWORD v27[2];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v20 = a4;
  if (-[EKVirtualConferenceExtensionContext requestType](self, "requestType") != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EKVirtualConferenceExtensionContext.m"), 115, CFSTR("Invalid completion method called for request type"));

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v7;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        v14 = objc_alloc_init(MEMORY[0x1E0CB35E8]);
        v26[0] = CFSTR("_EKVirtualConferenceRoomTypeTitleKey");
        objc_msgSend(v13, "title");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v26[1] = CFSTR("_EKVirtualConferenceRoomTypeIdentifierKey");
        v27[0] = v15;
        objc_msgSend(v13, "identifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v27[1] = v16;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setUserInfo:", v17);

        objc_msgSend(v8, "addObject:", v14);
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    }
    while (v10);
  }

  if (objc_msgSend(v8, "count"))
    v18 = v8;
  else
    v18 = 0;
  -[EKVirtualConferenceExtensionContext completeRequestReturningItems:completionHandler:](self, "completeRequestReturningItems:completionHandler:", v18, v20);

}

- (void)completeRequestWithVirtualConference:(id)a3 completionHandler:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  EKVirtualConferenceExtensionContext *v34;
  void *v35;
  id obj;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v33 = a4;
  if (-[EKVirtualConferenceExtensionContext requestType](self, "requestType") != 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EKVirtualConferenceExtensionContext.m"), 130, CFSTR("Invalid completion method called for request type"));

  }
  v34 = self;
  v8 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v7, "URLDescriptors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "arrayWithCapacity:", objc_msgSend(v9, "count") + 1);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v35 = v7;
  objc_msgSend(v7, "URLDescriptors");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v39 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        v15 = objc_alloc_init(MEMORY[0x1E0CB35E8]);
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 3);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKey:", CFSTR("_EKVirtualConferenceJoinMethodTypeIdentifierKey"), CFSTR("_EKVirtualConferenceTypeIdentifierKey"));
        objc_msgSend(v14, "URL");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKey:", v17, CFSTR("_EKVirtualConferenceJoinMethodURLKey"));

        objc_msgSend(v14, "title");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "length");

        if (v19)
        {
          objc_msgSend(v14, "title");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setObject:forKey:", v20, CFSTR("_EKVirtualConferenceJoinMethodTitleKey"));

        }
        objc_msgSend(v15, "setUserInfo:", v16);
        objc_msgSend(v37, "addObject:", v15);

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    }
    while (v11);
  }

  objc_msgSend(v35, "URLDescriptors");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "count");

  if (v22)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "title");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "length");

    if (v25)
    {
      objc_msgSend(v35, "title");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setObject:forKey:", v26, CFSTR("_EKVirtualConferenceInfoTitleKey"));

    }
    objc_msgSend(v35, "conferenceDetails");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "length");

    if (v28)
    {
      objc_msgSend(v35, "conferenceDetails");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setObject:forKey:", v29, CFSTR("_EKVirtualConferenceInfoDetailsKey"));

    }
    if (objc_msgSend(v23, "count"))
    {
      objc_msgSend(v23, "setObject:forKey:", CFSTR("_EKVirtualConferenceInfoTypeIdentifierKey"), CFSTR("_EKVirtualConferenceTypeIdentifierKey"));
      v30 = objc_alloc_init(MEMORY[0x1E0CB35E8]);
      objc_msgSend(v30, "setUserInfo:", v23);
      objc_msgSend(v37, "addObject:", v30);

    }
  }
  if (objc_msgSend(v37, "count"))
    v31 = v37;
  else
    v31 = 0;
  -[EKVirtualConferenceExtensionContext completeRequestReturningItems:completionHandler:](v34, "completeRequestReturningItems:completionHandler:", v31, v33);

}

- (void)completeRequestWithInvalidationSuccess:(BOOL)a3 error:(id)a4 completionHandler:(id)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  const __CFString **v11;
  const __CFString **v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  _QWORD v20[2];

  v5 = a3;
  v20[1] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  if (-[EKVirtualConferenceExtensionContext requestType](self, "requestType") != 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EKVirtualConferenceExtensionContext.m"), 171, CFSTR("Invalid completion method called for request type"));

  }
  v9 = objc_alloc_init(MEMORY[0x1E0CB35E8]);
  if (v5)
  {
    v19 = CFSTR("_EKVirtualConferenceInvalidationResultKey");
    v20[0] = CFSTR("_EKVirtualConferenceInvalidationResultSucceeded");
    v10 = (void *)MEMORY[0x1E0C99D80];
    v11 = (const __CFString **)v20;
    v12 = &v19;
  }
  else
  {
    v17 = CFSTR("_EKVirtualConferenceInvalidationResultKey");
    v18 = CFSTR("_EKVirtualConferenceInvalidationResultFailed");
    v10 = (void *)MEMORY[0x1E0C99D80];
    v11 = &v18;
    v12 = &v17;
  }
  objc_msgSend(v10, "dictionaryWithObjects:forKeys:count:", v11, v12, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setUserInfo:", v13);

  v16 = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKVirtualConferenceExtensionContext completeRequestReturningItems:completionHandler:](self, "completeRequestReturningItems:completionHandler:", v14, v8);

}

- (void)completeRequestWithRenewalSuccess:(BOOL)a3 error:(id)a4 completionHandler:(id)a5
{
  _BOOL4 v6;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  _QWORD v17[2];

  v6 = a3;
  v17[1] = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  if (-[EKVirtualConferenceExtensionContext requestType](self, "requestType") != 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EKVirtualConferenceExtensionContext.m"), 186, CFSTR("Invalid completion method called for request type"));

  }
  v11 = objc_alloc_init(MEMORY[0x1E0CB35E8]);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v6)
    v14 = CFSTR("_EKVirtualConferenceRenewalResultSucceeded");
  else
    v14 = CFSTR("_EKVirtualConferenceRenewalResultFailed");
  objc_msgSend(v12, "setObject:forKey:", v14, CFSTR("_EKVirtualConferenceRenewalResultKey"));
  if (v9)
    objc_msgSend(v13, "setObject:forKey:", v9, CFSTR("_EKVirtualConferenceErrorResultKey"));
  objc_msgSend(v11, "setUserInfo:", v13);
  v17[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKVirtualConferenceExtensionContext completeRequestReturningItems:completionHandler:](self, "completeRequestReturningItems:completionHandler:", v15, v10);

}

@end
