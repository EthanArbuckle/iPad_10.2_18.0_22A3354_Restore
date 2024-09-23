@implementation NSItemProvider(LPExtras)

- (void)_lp_loadFirstDataRepresentationMatchingMIMETypePredicate:()LPExtras completionHandler:
{
  uint64_t (**v6)(id, id);
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(a1, "registeredTypeIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v22;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v22 != v10)
        objc_enumerationMutation(v8);
      v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v11);
      +[LPMIMETypeRegistry MIMETypeForUTI:](LPMIMETypeRegistry, "MIMETypeForUTI:", v12);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      if ((v6[2](v6, v13) & 1) != 0)
        break;

      if (v9 == ++v11)
      {
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v9)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v14 = v12;

    if (!v14)
      goto LABEL_12;
    dispatch_get_global_queue(25, 0);
    v15 = objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __103__NSItemProvider_LPExtras___lp_loadFirstDataRepresentationMatchingMIMETypePredicate_completionHandler___block_invoke;
    v17[3] = &unk_1E44A8468;
    v17[4] = a1;
    v16 = v14;
    v18 = v16;
    v20 = v7;
    v13 = v13;
    v19 = v13;
    dispatch_async(v15, v17);

  }
  else
  {
LABEL_9:

    v13 = 0;
LABEL_12:
    v16 = 0;
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
  }

}

+ (id)_lp_itemProviderWithData:()LPExtras MIMEType:
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;

  v5 = a3;
  +[LPMIMETypeRegistry UTIForMIMEType:](LPMIMETypeRegistry, "UTIForMIMEType:", a4);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = 0;
  if (v5 && v6)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0CB36C8]);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __62__NSItemProvider_LPExtras___lp_itemProviderWithData_MIMEType___block_invoke;
    v10[3] = &unk_1E44A8490;
    v11 = v5;
    objc_msgSend(v8, "registerDataRepresentationForTypeIdentifier:visibility:loadHandler:", v7, 0, v10);

  }
  return v8;
}

@end
