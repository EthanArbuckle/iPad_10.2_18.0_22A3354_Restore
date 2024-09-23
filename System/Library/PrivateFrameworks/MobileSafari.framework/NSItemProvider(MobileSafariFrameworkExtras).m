@implementation NSItemProvider(MobileSafariFrameworkExtras)

+ (void)safari_loadObjectsFromItemProviders:()MobileSafariFrameworkExtras usingLoader:completionHandler:
{
  id v7;
  id v8;
  dispatch_group_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  id v17;
  id v18;
  NSObject *v19;
  _QWORD block[4];
  NSObject *v21;
  id v22;
  id v23;
  _QWORD v24[4];
  NSObject *v25;
  id v26;
  uint64_t v27;
  _QWORD aBlock[4];
  id v29;

  v7 = a5;
  v8 = a3;
  v9 = dispatch_group_create();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __113__NSItemProvider_MobileSafariFrameworkExtras__safari_loadObjectsFromItemProviders_usingLoader_completionHandler___block_invoke;
  aBlock[3] = &unk_1E21E6148;
  v12 = v10;
  v29 = v12;
  v13 = _Block_copy(aBlock);
  v24[0] = v11;
  v24[1] = 3221225472;
  v24[2] = __113__NSItemProvider_MobileSafariFrameworkExtras__safari_loadObjectsFromItemProviders_usingLoader_completionHandler___block_invoke_2;
  v24[3] = &unk_1E21E6198;
  v14 = v9;
  v26 = v13;
  v27 = a4;
  v25 = v14;
  v15 = v13;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v24);

  dispatch_get_global_queue(25, 0);
  v16 = objc_claimAutoreleasedReturnValue();
  block[0] = v11;
  block[1] = 3221225472;
  block[2] = __113__NSItemProvider_MobileSafariFrameworkExtras__safari_loadObjectsFromItemProviders_usingLoader_completionHandler___block_invoke_4;
  block[3] = &unk_1E21E2280;
  v21 = v14;
  v22 = v12;
  v23 = v7;
  v17 = v7;
  v18 = v12;
  v19 = v14;
  dispatch_async(v16, block);

}

- (void)safari_loadObjectOfClasses:()MobileSafariFrameworkExtras completionHandler:
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (objc_msgSend(a1, "canLoadObjectOfClass:", v13))
        {
          v18[0] = MEMORY[0x1E0C809B0];
          v18[1] = 3221225472;
          v18[2] = __92__NSItemProvider_MobileSafariFrameworkExtras__safari_loadObjectOfClasses_completionHandler___block_invoke;
          v18[3] = &unk_1E21E61C0;
          v19 = v7;
          v17 = (id)objc_msgSend(a1, "loadObjectOfClass:completionHandler:", v13, v18);

          goto LABEL_12;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
      if (v10)
        continue;
      break;
    }
  }

  v14 = WBS_LOG_CHANNEL_PREFIXItemProvider();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v15 = v14;
    objc_msgSend(v8, "componentsJoinedByString:", CFSTR(", "));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v25 = v16;
    _os_log_impl(&dword_18B7B2000, v15, OS_LOG_TYPE_INFO, "Did not find object matching allowed classes: %{public}@", buf, 0xCu);

  }
LABEL_12:

}

- (void)safari_registerFileRepresentationForQuickLookDocument:()MobileSafariFrameworkExtras
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  objc_msgSend(v4, "fileName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setSuggestedName:", v5);

  objc_msgSend(v4, "inferredUTI");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __101__NSItemProvider_MobileSafariFrameworkExtras__safari_registerFileRepresentationForQuickLookDocument___block_invoke;
  v8[3] = &unk_1E21E61E8;
  v9 = v4;
  v7 = v4;
  objc_msgSend(a1, "registerFileRepresentationForTypeIdentifier:fileOptions:visibility:loadHandler:", v6, 0, 0, v8);

}

@end
