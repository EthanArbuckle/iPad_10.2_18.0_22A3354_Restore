@implementation NTKDArgonInternalKeyFetcher

- (void)fetchNewRecordsSinceChangeToken:(id)a3 forReason:(int64_t)a4 completion:(id)a5
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a5;
  NTKFaceSupportInternalDirectory((uint64_t)v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    objc_msgSend(v8, "contentsOfDirectoryAtPath:error:", v7, &v28);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v28;

    if (v9)
    {
      v22 = v10;
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v11 = v9;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v25;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v25 != v14)
              objc_enumerationMutation(v11);
            v16 = v7;
            objc_msgSend(v7, "stringByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            +[NTKArgonKeyDescriptor unfilteredKeyDescriptorFromBundle:](NTKArgonKeyDescriptor, "unfilteredKeyDescriptorFromBundle:", v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (v19)
              objc_msgSend(v23, "addObject:", v19);

            v7 = v16;
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
        }
        while (v13);
      }

      v20 = (void *)objc_msgSend(v23, "copy");
      (*((void (**)(id, void *, _QWORD, _QWORD))v5 + 2))(v5, v20, 0, 0);

      v10 = v22;
    }
    else
    {
      (*((void (**)(id, _QWORD, _QWORD, id))v5 + 2))(v5, 0, 0, v10);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, _QWORD, _QWORD))v5 + 2))(v5, v21, 0, 0);

  }
}

@end
