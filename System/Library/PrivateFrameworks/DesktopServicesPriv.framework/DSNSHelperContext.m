@implementation DSNSHelperContext

- (DSNSHelperContext)initWithOptions:(unsigned int)a3 delegate:(id)a4
{
  uint64_t v4;
  DSNSHelperContext *v5;
  uint64_t v6;
  objc_super v8;

  v4 = *(_QWORD *)&a3;
  v8.receiver = self;
  v8.super_class = (Class)DSNSHelperContext;
  v5 = -[DSNSHelperContext init](&v8, sel_init, *(_QWORD *)&a3, a4);
  if (v5)
  {
    v6 = operator new();
    TDSHelperContext::TDSHelperContext(v6, v4, 0, 0);
    v5->impl = (void *)v6;
  }
  return v5;
}

- (void)dealloc
{
  void *impl;
  objc_super v4;

  impl = self->impl;
  if (impl)
    (*(void (**)(void *, SEL))(*(_QWORD *)impl + 8))(impl, a2);
  v4.receiver = self;
  v4.super_class = (Class)DSNSHelperContext;
  -[DSNSHelperContext dealloc](&v4, sel_dealloc);
}

- (BOOL)launchDesktopServicesHelper:(id *)a3
{
  int v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = TDSHelperContext::LaunchDesktopServicesHelper((TDSHelperContext *)self->impl, 0, 1);
  v5 = v4;
  if (a3 && v4)
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v10 = *MEMORY[0x1E0CB2D50];
    DSLocalizedErrorStringForKey(CFSTR("HelperCommunicationFailed"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v5, v8);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5 == 0;
}

- (BOOL)createLockNamed:(id)a3 destinationURL:(id)a4 sourceURL:(id)a5 groupUUID:(id)a6 isDuplication:(BOOL)a7 groupCount:(int64_t)a8 clonedInstead:(BOOL *)a9 error:(id *)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  TCFURLInfo *v20;
  int v21;
  BOOL v22;
  void *v23;
  __CFString *v24;
  void *v25;
  void *v27;
  BOOL v28;
  const __CFString *v29;
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  if (-[DSNSHelperContext launchDesktopServicesHelper:](self, "launchDesktopServicesHelper:", a10))
  {
    v29 = &stru_1E8752DF8;
    CFRetain(&stru_1E8752DF8);
    v28 = 0;
    v20 = (TCFURLInfo *)TDSHelperContext::FilesCopyChildCreateLock((uint64_t)self->impl, v17, v18, v16, v19, a8, 0, 0, a7, (const void **)&v29, &v28);
    v21 = (int)v20;
    if (a9)
      *a9 = v28;
    v22 = (_DWORD)v20 == 0;
    if (a10 && (_DWORD)v20)
    {
      v23 = (void *)MEMORY[0x1E0CB35C8];
      v30 = *MEMORY[0x1E0CB2D50];
      TCFURLInfo::LocalizedCopyErrorMessage(v20, (const __CFURL *)v18, (TString *)&v27);
      v24 = v27;
      v31[0] = v24;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v21, v25);
      *a10 = (id)objc_claimAutoreleasedReturnValue();

      TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v27);
    }
    TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v29);
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (unint64_t)resolveConflictAtURL:(id)a3 withStrategy:(id)a4
{
  id v5;
  id v6;
  unint64_t v7;
  dispatch_semaphore_t v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  const void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  CFUserNotificationRef v19;
  NSObject *v20;
  SInt32 error;
  _QWORD block[4];
  id v24;
  id v25;
  NSObject *v26;
  const void **v27;
  CFUserNotificationRef v28;
  const void **v29;
  uint64_t v30;
  uint64_t v31;
  uint8_t buf[8];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "type") != 1)
  {
    if (!objc_msgSend(v6, "type"))
    {
      v7 = 2;
      goto LABEL_28;
    }
    if (objc_msgSend(v6, "type") == 4)
    {
      v7 = 1;
      goto LABEL_28;
    }
    if (objc_msgSend(v6, "type") == 3)
    {
      v8 = dispatch_semaphore_create(0);
      v28 = 0;
      v29 = (const void **)&v28;
      v30 = 0x2020000000;
      v31 = 0;
      dispatch_get_global_queue(0, 0);
      v9 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __55__DSNSHelperContext_resolveConflictAtURL_withStrategy___block_invoke;
      block[3] = &unk_1E87519B8;
      v10 = v6;
      v24 = v10;
      v25 = v5;
      v27 = (const void **)&v28;
      v11 = v8;
      v26 = v11;
      dispatch_async(v9, block);

      dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
      v12 = v29[3];
      if (v12 == (const void *)1)
      {
        v13 = 4;
      }
      else
      {
        if (v12 != (const void *)2)
        {
LABEL_26:
          v7 = (unint64_t)v29[3];

          _Block_object_dispose(&v28, 8);
          goto LABEL_27;
        }
        v13 = 0;
      }
      objc_msgSend(v10, "setType:", v13);
      goto LABEL_26;
    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedAlertTitle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0C9B800]);

    objc_msgSend(v6, "localizedAlertMessageForSourceFileURL:", v5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0C9B810]);

    objc_msgSend(v6, "localizedTitleForResolution:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "length"))
      -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0C9B838]);
    objc_msgSend(v6, "localizedTitleForResolution:", 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "length"))
      -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0C9B830]);
    objc_msgSend(v6, "localizedTitleForResolution:", 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "length"))
      -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v18, *MEMORY[0x1E0C9B868]);
    error = 0;
    v19 = CFUserNotificationCreate(0, 0.0, 3uLL, &error, (CFDictionaryRef)v11);
    v28 = v19;
    if (error)
    {
      LogObj(2);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = error;
        _os_log_impl(&dword_1CBC4A000, v20, OS_LOG_TYPE_ERROR, "CFUserNotificationCreate failed with %d", buf, 8u);
      }

    }
    else
    {
      *(_QWORD *)buf = 0;
      if (!CFUserNotificationReceiveResponse(v19, 0.0, (CFOptionFlags *)buf))
      {
        if ((buf[0] & 3) == 2)
        {
          objc_msgSend(v6, "setType:", 0);
          v7 = 2;
          goto LABEL_23;
        }
        if ((buf[0] & 3) == 1)
        {
          objc_msgSend(v6, "setType:", 4);
          v7 = 1;
          goto LABEL_23;
        }
      }
    }
    v7 = 0;
LABEL_23:
    TRef<__CFUserNotification *,TRetainReleasePolicy<__CFUserNotification *>>::~TRef((const void **)&v28);

LABEL_27:
    goto LABEL_28;
  }
  v7 = 0;
LABEL_28:

  return v7;
}

void __55__DSNSHelperContext_resolveConflictAtURL_withStrategy___block_invoke(uint64_t a1)
{
  void (**v2)(_QWORD, _QWORD, _QWORD);
  uint64_t v3;
  id v4;
  __int128 v5;
  _QWORD v6[4];
  __int128 v7;

  objc_msgSend(*(id *)(a1 + 32), "conflictHandler");
  v2 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__DSNSHelperContext_resolveConflictAtURL_withStrategy___block_invoke_2;
  v6[3] = &unk_1E8751990;
  v5 = *(_OWORD *)(a1 + 48);
  v4 = (id)v5;
  v7 = v5;
  ((void (**)(_QWORD, uint64_t, _QWORD *))v2)[2](v2, v3, v6);

}

intptr_t __55__DSNSHelperContext_resolveConflictAtURL_withStrategy___block_invoke_2(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)createLockInDestinationURL:(id)a3 sourceURL:(id)a4 groupUUID:(id)a5 groupCount:(int64_t)a6 conflictStrategy:(id)a7 isDuplication:(BOOL)a8 clonedInstead:(BOOL *)a9 resultName:(id *)a10 error:(id *)a11
{
  id v14;
  id v15;
  BOOL v16;
  void *v17;
  __CFString *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  BOOL v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  int v29;
  unint64_t v30;
  void *v31;
  int v32;
  uint64_t v33;
  void *v35;
  id v36;
  unsigned int v37;
  void *v38;
  id v39;
  int v40;
  _BOOL4 v42;
  id v43;
  id v45;
  id v46;
  id v47;
  __CFString *v48;
  BOOL v49[9];

  v42 = a8;
  v45 = a3;
  v14 = a4;
  v43 = a5;
  v15 = a7;
  *a9 = 0;
  *a10 = 0;
  v49[0] = 0;
  v36 = v15;
  v39 = v14;
  v16 = objc_msgSend(v15, "type") == 0;
  objc_msgSend(v14, "lastPathComponent");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (BRContainerClass() && objc_msgSend(v14, "br_isDocumentsContainer"))
  {
    TCFURLInfo::StringProperty((TCFURLInfo *)v14, (const __CFString *)*MEMORY[0x1E0C9B580], (TString *)&v48);
    if (CFStringGetLength(v48))
    {
      v18 = v48;

      v17 = v18;
    }
    TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v48);
  }
  v47 = &unk_1E875AD70;
  v37 = objc_msgSend(MEMORY[0x1E0CB3940], "ds_fileNameHasClaimedFileExtension:", v17) ^ 1;
  objc_msgSend(v17, "fp_stringByDeletingPathBounceNo:andPathExtension:isFolder:", &v47, 0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v47;
  v20 = v17;
  v40 = 0;
  v21 = 0;
  v22 = (void *)*MEMORY[0x1E0CB2F90];
  v35 = v20;
  while (1)
  {
    v46 = v21;
    v23 = -[DSNSHelperContext createLockNamed:destinationURL:sourceURL:groupUUID:isDuplication:groupCount:clonedInstead:error:](self, "createLockNamed:destinationURL:sourceURL:groupUUID:isDuplication:groupCount:clonedInstead:error:", v20, v45, v14, v43, v42, a6, v49, &v46);
    v24 = v46;

    if (v23)
    {
      v20 = objc_retainAutorelease(v20);
      *a10 = v20;
      *a9 = v49[0];
      goto LABEL_37;
    }
    objc_msgSend(v24, "domain");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25 != v22)
    {

LABEL_32:
      v21 = v24;
      goto LABEL_34;
    }
    if (objc_msgSend(v24, "code") == -48)
    {

    }
    else
    {
      v26 = objc_msgSend(v24, "code");

      if (v26 != -8011)
        goto LABEL_32;
    }
    if (v16)
      goto LABEL_13;
    objc_msgSend(v45, "URLByAppendingPathComponent:", v20);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[DSNSHelperContext resolveConflictAtURL:withStrategy:](self, "resolveConflictAtURL:withStrategy:", v28, v36);
    switch(v30)
    {
      case 0uLL:
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v22, -128, 0);
        v29 = 0;
        v31 = v24;
        v24 = (id)objc_claimAutoreleasedReturnValue();
LABEL_25:

        v16 = 0;
        goto LABEL_26;
      case 1uLL:
        objc_msgSend((id)objc_opt_class(), "wrapperWithURL:readonly:error:", v28, 0, 0);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (v31)
        {
          v32 = TDSHelperContext::FilesCopyDeleteItem((uint64_t)self->impl, v31, 2u, 1, 1);
          if (v32)
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v22, v32, 0);
            v33 = objc_claimAutoreleasedReturnValue();

            v29 = 0;
            v24 = (id)v33;
          }
          else
          {
            ++v40;
            v29 = 1;
          }
        }
        else
        {
          v29 = 0;
        }
        goto LABEL_25;
      case 2uLL:

LABEL_13:
        objc_msgSend(v38, "fp_bouncedNameWithIndex:isDir:", objc_msgSend(v19, "integerValue"), v37);
        v27 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v19, "integerValue") + 1);
        v16 = 1;
        v28 = v19;
        v21 = v24;
        v19 = (id)objc_claimAutoreleasedReturnValue();
        v29 = 1;
        v20 = (id)v27;
        goto LABEL_27;
    }
    v16 = 0;
    v29 = 0;
LABEL_26:
    v21 = v24;
LABEL_27:

    if (!v29)
      break;
    v14 = v39;
    if (v40 >= 2)
      goto LABEL_34;
  }
  v14 = v39;
LABEL_34:
  if (a11)
  {
    v24 = objc_retainAutorelease(v21);
    *a11 = v24;
  }
  else
  {
    v24 = v21;
  }
LABEL_37:

  return v23;
}

- (BOOL)copyRootMetadataAtURL:(id)a3 toDestinationURL:(id)a4 targetName:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  TCFURLInfo *v13;
  int v14;
  BOOL v15;
  void *v16;
  __CFString *v17;
  void *v18;
  void *v20;
  int v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (-[DSNSHelperContext launchDesktopServicesHelper:](self, "launchDesktopServicesHelper:", a6))
  {
    v21 = 0;
    v13 = (TCFURLInfo *)TDSHelperContext::FilesCopySetRootMetadata((uint64_t)self->impl, v10, v11, v12, 0x15u, &v21);
    v14 = (int)v13;
    v15 = (_DWORD)v13 == 0;
    if (a6 && (_DWORD)v13)
    {
      v16 = (void *)MEMORY[0x1E0CB35C8];
      v22 = *MEMORY[0x1E0CB2D50];
      TCFURLInfo::LocalizedCopyErrorMessage(v13, (const __CFURL *)v10, (TString *)&v20);
      v17 = v20;
      v23[0] = v17;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v14, v18);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

      TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v20);
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)sizeURL:(id)a3 destinationURL:(id)a4 targetName:(id)a5 coordinate:(BOOL)a6 spaceNeeds:(DestinationSpaceNeeds *)a7 groupUUID:(id)a8 error:(id *)a9
{
  _BOOL4 v11;
  id v15;
  id v16;
  id v17;
  id v18;
  __int16 v19;
  TCFURLInfo *v20;
  int v21;
  void *v22;
  __CFString *v23;
  void *v24;
  BOOL v25;
  void *v27;
  __CFString *v28;
  void *v29;
  TString v30;
  int64_t v31;
  uint64_t v32;
  __CFString *v33;
  uint64_t v34;
  _QWORD v35[2];

  v11 = a6;
  v35[1] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a8;
  v31 = 0;
  if (v11)
    v19 = 0x2000;
  else
    v19 = 0;
  v20 = (TCFURLInfo *)TDSHelperContext::FilesCopyOperationSize((uint64_t)self->impl, v15, v16, v17, 2u, v19, &a7->var0, 0, v18, &v31);
  v21 = (int)v20;
  if ((_DWORD)v20)
  {
    if (a9)
    {
      v22 = (void *)MEMORY[0x1E0CB35C8];
      v34 = *MEMORY[0x1E0CB2D50];
      TCFURLInfo::LocalizedCopyErrorMessage(v20, (const __CFURL *)v15, &v30);
      v23 = v30.fString.fRef;
      v35[0] = v23;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v21, v24);
      *a9 = (id)objc_claimAutoreleasedReturnValue();

LABEL_7:
      TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v30.fString.fRef);
    }
  }
  else
  {
    if (!a7 || (a7->var18 & 0x100000) == 0)
    {
      v25 = 1;
      goto LABEL_12;
    }
    if (a9)
    {
      v27 = (void *)MEMORY[0x1E0CB35C8];
      v32 = *MEMORY[0x1E0CB2D50];
      TCFURLInfo::LocalizedCopyErrorMessage((TCFURLInfo *)0xFFFFFAE3, (const __CFURL *)v15, &v30);
      v28 = v30.fString.fRef;
      v33 = v28;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -1309, v29);
      *a9 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
  }
  v25 = 0;
LABEL_12:

  return v25;
}

- (BOOL)ensureFreeSpace:(int64_t)a3 onVolume:(id)a4 error:(id *)a5
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int64_t v13;
  void *v14;
  uint64_t v15;
  int64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  dispatch_semaphore_t v22;
  NSObject *v23;
  void *v24;
  id v25;
  void *v26;
  BOOL v27;
  void *v28;
  void *v29;
  void *v30;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  _QWORD v37[4];
  NSObject *v38;
  uint64_t v39;
  void *v40;
  _QWORD v41[3];
  _QWORD v42[3];
  _QWORD v43[2];
  _QWORD v44[2];
  _QWORD v45[4];

  v45[2] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v9 = *MEMORY[0x1E0C99BB8];
  v45[0] = *MEMORY[0x1E0C99CF0];
  v8 = v45[0];
  v45[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resourceValuesForKeys:error:", v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "longLongValue");

  objc_msgSend(v11, "objectForKeyedSubscript:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "longLongValue");

  v16 = a3 - v15;
  if (a3 <= v15)
  {
    v27 = 1;
  }
  else
  {
    if (v13 <= a3)
    {
      v27 = 0;
    }
    else
    {
      v43[0] = CFSTR("CACHE_DELETE_VOLUME");
      objc_msgSend(v7, "path");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v43[1] = CFSTR("CACHE_DELETE_URGENCY");
      v44[0] = v17;
      v44[1] = &unk_1E875AD88;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, v43, 2);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      v34 = (void *)CacheDeleteCopyPurgeableSpaceWithInfo();
      objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_AMOUNT"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        v33 = v18;
        if (objc_msgSend(v18, "longLongValue") + v15 <= a3)
        {
          v27 = 0;
          v21 = v33;
        }
        else
        {
          v41[0] = CFSTR("CACHE_DELETE_VOLUME");
          objc_msgSend(v7, "path");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v42[0] = v19;
          v41[1] = CFSTR("CACHE_DELETE_AMOUNT");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v16);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v41[2] = CFSTR("CACHE_DELETE_URGENCY");
          v42[1] = v20;
          v42[2] = &unk_1E875AD88;
          v21 = v33;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 3);
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          v22 = dispatch_semaphore_create(0);
          v37[0] = MEMORY[0x1E0C809B0];
          v37[1] = 3221225472;
          v37[2] = __52__DSNSHelperContext_ensureFreeSpace_onVolume_error___block_invoke;
          v37[3] = &unk_1E87519E0;
          v23 = v22;
          v38 = v23;
          v24 = (void *)MEMORY[0x1D17A5A30](v37);
          CacheDeletePurgeSpaceWithInfo();

          dispatch_semaphore_wait(v23, 0xFFFFFFFFFFFFFFFFLL);
          objc_msgSend(v7, "removeCachedResourceValueForKey:", v9);
          v36 = 0;
          LODWORD(v20) = objc_msgSend(v7, "getResourceValue:forKey:error:", &v36, v9, 0);
          v25 = v36;
          v26 = v25;
          if ((_DWORD)v20)
            v27 = objc_msgSend(v25, "longLongValue") > a3;
          else
            v27 = 0;

        }
      }
      else
      {
        v27 = 0;
        v21 = 0;
      }

    }
    if (a5 && !v27)
    {
      v28 = (void *)MEMORY[0x1E0CB35C8];
      v39 = *MEMORY[0x1E0CB2D50];
      DSLocalizedErrorStringForKey(CFSTR("NotEnoughSpace"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v29;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -34, v30);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      v27 = 0;
    }
  }

  return v27;
}

intptr_t __52__DSNSHelperContext_ensureFreeSpace_onVolume_error___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)clearCopyStateForSources:(id)a3 destination:(id)a4 targetNames:(id)a5 groupUUID:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  const __CFURL *v16;
  TCFURLInfo *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  std::__shared_weak_count *v22;
  unint64_t *p_shared_owners;
  unint64_t v24;
  id v25;
  TCFURLInfo *v26;
  std::__shared_weak_count *v27;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v25 = a6;
  v13 = objc_msgSend(v10, "count");
  if (v13)
  {
    for (i = 0; i != v13; ++i)
    {
      objc_msgSend(v12, "objectAtIndexedSubscript:", i);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "URLByAppendingPathComponent:", v15);
      v16 = (const __CFURL *)objc_claimAutoreleasedReturnValue();

      _ZNSt3__115allocate_sharedB8ne180100I10TCFURLInfoNS_9allocatorIS1_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&v26);
      TCFURLInfo::Initialize((TString *)v26, v16, 1, 0);
      if (TCFURLInfo::IsLockFile((CFURLRef *)v26)
        || (v17 = v26, TCFURLInfo::CheckPrefetchState((CFIndex)v26, 1), (*((_WORD *)v17 + 38) & 1) != 0))
      {
        objc_msgSend((id)objc_opt_class(), "wrapperWithURL:readonly:error:", v16, 0, 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)objc_opt_class();
        objc_msgSend(v10, "objectAtIndexedSubscript:", i);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "wrapperWithURL:readonly:error:", v20, 0, 0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        TDSHelperContext::FilesCopyDeleteLock((uint64_t)self->impl, v18, v21, v25);
      }
      v22 = v27;
      if (v27)
      {
        p_shared_owners = (unint64_t *)&v27->__shared_owners_;
        do
          v24 = __ldaxr(p_shared_owners);
        while (__stlxr(v24 - 1, p_shared_owners));
        if (!v24)
        {
          ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
          std::__shared_weak_count::__release_weak(v22);
        }
      }

    }
  }

}

- (BOOL)preflightAndCloneIfPossible:(id)a3 toURL:(id)a4 groupUUID:(id)a5 sourceURLsToCopy:(id *)a6 isDuplication:(BOOL)a7 targetNames:(id *)a8 maxFileSize:(unint64_t *)a9 conflictStrategy:(id)a10 receiveTargets:(id)a11 error:(id *)a12
{
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSURL *v18;
  void *v19;
  TCFURLInfo *v20;
  NSURL *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  int v26;
  BOOL v27;
  uint64_t v28;
  _BOOL4 v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  uint64_t v34;
  const __CFString *v35;
  void *v36;
  TCFURLInfo *v37;
  unsigned int v38;
  BOOL v39;
  void *v40;
  id v41;
  NSObject *v42;
  NSURL *v43;
  void *v44;
  int IsDataless;
  _BOOL4 v46;
  id v47;
  void *v48;
  std::__shared_weak_count *v49;
  unint64_t *p_shared_owners;
  unint64_t v51;
  id v52;
  BOOL v53;
  void *v54;
  NSObject *v55;
  id v56;
  std::__shared_weak_count *v57;
  unint64_t *v58;
  unint64_t v59;
  void *v61;
  _BOOL4 v62;
  id v63;
  NSObject *v64;
  id v65;
  void *v66;
  id *v67;
  id v69;
  id v70;
  id v71;
  id v72;
  void *v73;
  _BOOL4 v74;
  id v75;
  id v76;
  uint64_t v78;
  uint64_t v79;
  char v80;
  __CFURL *v81;
  uint64_t v82;
  id obj;
  id v84;
  id v85;
  _QWORD block[4];
  id v87;
  id v88;
  id v89;
  id v90;
  uint64_t v91;
  id v92;
  id v93;
  id v94;
  char v95;
  id v96[2];
  TCFURLInfo *v97;
  std::__shared_weak_count *v98;
  id v99[2];
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  TCFURLInfo *v104;
  std::__shared_weak_count *v105;
  _BYTE buf[12];
  __int16 v107;
  id v108;
  uint64_t v109;
  id v110;
  _BYTE v111[128];
  _BYTE v112[24];
  uint64_t v113;
  unint64_t v114;
  uint64_t v115;
  uint64_t v116;

  v74 = a7;
  v116 = *MEMORY[0x1E0C80C00];
  v69 = a3;
  v81 = (__CFURL *)a4;
  v76 = a5;
  v75 = a10;
  v70 = a11;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v115 = 0;
  bzero(v112, 0x879uLL);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v71 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v72 = (id)objc_claimAutoreleasedReturnValue();
  _ZNSt3__115allocate_sharedB8ne180100I10TCFURLInfoNS_9allocatorIS1_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&v104);
  TCFURLInfo::Initialize((TString *)v104, v81, 0, 0);
  v102 = 0u;
  v103 = 0u;
  v100 = 0u;
  v101 = 0u;
  obj = v69;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v100, v111, 16);
  v67 = a8;
  if (!v15)
  {
    v84 = 0;
    v80 = 1;
    goto LABEL_47;
  }
  v84 = 0;
  v82 = *(_QWORD *)v101;
  v78 = *MEMORY[0x1E0CB2F90];
  v79 = *MEMORY[0x1E0CB2D50];
  v80 = 1;
  do
  {
    v16 = 0;
    do
    {
      v17 = v15;
      if (*(_QWORD *)v101 != v82)
        objc_enumerationMutation(obj);
      v18 = *(NSURL **)(*((_QWORD *)&v100 + 1) + 8 * v16);
      v19 = (void *)MEMORY[0x1D17A5880]();
      StScopedResourceAccess::StScopedResourceAccess((StScopedResourceAccess *)v99, v18);
      _ZNSt3__115allocate_sharedB8ne180100I10TCFURLInfoNS_9allocatorIS1_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&v97);
      v20 = (TCFURLInfo *)TCFURLInfo::Initialize((TString *)v97, (const __CFURL *)v18, 1, 0);
      if ((_DWORD)v20 == -43)
        v21 = (NSURL *)_CFURLCopyPromiseURLOfLogicalURL();
      else
        v21 = 0;
      StScopedResourceAccess::StScopedResourceAccess((StScopedResourceAccess *)v96, v21);
      if (v21)
        v20 = (TCFURLInfo *)TCFURLInfo::Initialize((TString *)v97, (const __CFURL *)v21, 1, 0);
      if (!(_DWORD)v20)
      {
        v27 = TCFURLInfo::AreOnSameVolume((TCFURLInfo ***)&v104, (const __CFURL *)&v97);
        v95 = 0;
        v28 = objc_msgSend(obj, "count");
        v93 = 0;
        v94 = 0;
        v29 = -[DSNSHelperContext createLockInDestinationURL:sourceURL:groupUUID:groupCount:conflictStrategy:isDuplication:clonedInstead:resultName:error:](self, "createLockInDestinationURL:sourceURL:groupUUID:groupCount:conflictStrategy:isDuplication:clonedInstead:resultName:error:", v81, v18, v76, v28, v75, v74, &v95, &v94, &v93);
        v30 = v94;
        v31 = v93;
        v32 = v31;
        if (!v29)
        {
          v33 = v84;
          v84 = v31;
          goto LABEL_36;
        }
        if (v95)
        {
          -[DSNSHelperContext copyRootMetadataAtURL:toDestinationURL:targetName:error:](self, "copyRootMetadataAtURL:toDestinationURL:targetName:error:", v18, v81, v30, 0);
          -[__CFURL URLByAppendingPathComponent:](v81, "URLByAppendingPathComponent:", v30);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "setObject:forKeyedSubscript:", v33, v18);
LABEL_36:

          v80 &= v27;
          v26 = 2 * (v84 != 0);
          goto LABEL_37;
        }
        objc_msgSend(v71, "addObject:", v18);
        objc_msgSend(v72, "addObject:", v30);
        if (UseFileProviderFramework())
        {
          FPItemManagerInstance();
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v36 || (v37 = v97, TCFURLInfo::CheckPrefetchState((CFIndex)v97, 1), (*((_WORD *)v37 + 38) & 1) == 0))
          {
            v38 = 0;
            goto LABEL_31;
          }
          v39 = URLMightBeInFileProvider(*(_QWORD *)v97) == 0;

          if (!v39)
          {
            FPItemManagerInstance();
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = *(id *)v97;
            v92 = 0;
            objc_msgSend(v40, "itemForURL:error:", v41, &v92);
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            v65 = v92;

            if (v66)
            {
              +[FIProviderDomain providerDomainForItem:cachePolicy:error:](FIProviderDomain, "providerDomainForItem:cachePolicy:error:", v66, 1, 0);
              v42 = objc_claimAutoreleasedReturnValue();
              if (-[NSObject isUsingFPFS](v42, "isUsingFPFS")
                && objc_msgSend(v66, "isCloudItem"))
              {
                v38 = objc_msgSend(v66, "isRecursivelyDownloaded") ^ 1;
LABEL_30:

                v36 = v65;
LABEL_31:

LABEL_32:
                IsDataless = TCFURLInfo::IsDataless((const __CFURL **)v97, v34, v35);
                v90 = 0;
                v46 = -[DSNSHelperContext sizeURL:destinationURL:targetName:coordinate:spaceNeeds:groupUUID:error:](self, "sizeURL:destinationURL:targetName:coordinate:spaceNeeds:groupUUID:error:", v18, v81, v30, IsDataless | v38, v112, v76, &v90);
                v47 = v90;
                v33 = v47;
                if (v46)
                {
                  -[__CFURL URLByAppendingPathComponent:](v81, "URLByAppendingPathComponent:", v30);
                  v48 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v73, "setObject:forKeyedSubscript:", v48, v18);
                }
                else
                {
                  v48 = v84;
                  v84 = v47;
                }

                goto LABEL_36;
              }
            }
            else
            {
              LogObj(2);
              v42 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
              {
                v64 = v42;
                v91 = *(_QWORD *)v97;
                NodeEventRefFromNodeEvent((id *)&v91);
                v43 = (NSURL *)objc_claimAutoreleasedReturnValue();
                SanitizedURL(v43);
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                *(_QWORD *)&buf[4] = v44;
                v107 = 2112;
                v108 = v65;
                _os_log_impl(&dword_1CBC4A000, v64, OS_LOG_TYPE_ERROR, "FPItemManager itemForURL failed for %{public}@: %@", buf, 0x16u);

                v38 = 0;
                v42 = v64;
                goto LABEL_30;
              }
            }
            v38 = 0;
            goto LABEL_30;
          }
        }
        v38 = 0;
        goto LABEL_32;
      }
      v22 = (void *)MEMORY[0x1E0CB35C8];
      v109 = v79;
      TCFURLInfo::LocalizedCopyErrorMessage(v20, (const __CFURL *)v18, (TString *)buf);
      v23 = *(id *)buf;
      v110 = v23;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v110, &v109, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "errorWithDomain:code:userInfo:", v78, (int)v20, v24);
      v25 = objc_claimAutoreleasedReturnValue();

      TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)buf);
      v26 = 2;
      v84 = (id)v25;
LABEL_37:
      StScopedResourceAccess::~StScopedResourceAccess(v96);

      v49 = v98;
      if (v98)
      {
        p_shared_owners = (unint64_t *)&v98->__shared_owners_;
        do
          v51 = __ldaxr(p_shared_owners);
        while (__stlxr(v51 - 1, p_shared_owners));
        if (!v51)
        {
          ((void (*)(std::__shared_weak_count *))v49->__on_zero_shared)(v49);
          std::__shared_weak_count::__release_weak(v49);
        }
      }
      StScopedResourceAccess::~StScopedResourceAccess(v99);
      objc_autoreleasePoolPop(v19);
      if (v26)
        goto LABEL_47;
      ++v16;
      v15 = v17;
    }
    while (v16 != v17);
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v100, v111, 16);
  }
  while (v15);
LABEL_47:

  v52 = v84;
  if (v84)
  {
LABEL_48:
    -[DSNSHelperContext clearCopyStateForSources:destination:targetNames:groupUUID:](self, "clearCopyStateForSources:destination:targetNames:groupUUID:", v71, v81, v72, v76);
    v53 = 0;
    if (a12)
    {
      v52 = objc_retainAutorelease(v52);
      *a12 = v52;
    }
  }
  else
  {
    if (!TCFURLInfo::GetVolumeInfoRecord((CFURLRef *)v104, buf)
      && ((buf[0] & 0x10) == 0 || (v80 & 1) == 0)
      && (*(_WORD *)buf & 0x2000) == 0)
    {
      v61 = (void *)TCFURLInfo::CopyVolumeURL((CFURLRef *)v104);
      v89 = 0;
      v62 = -[DSNSHelperContext ensureFreeSpace:onVolume:error:](self, "ensureFreeSpace:onVolume:error:", v113, v61, &v89);
      v63 = v89;
      if (v62)
      {

      }
      else
      {
        v52 = v63;

        if (v52)
          goto LABEL_48;
      }
    }
    *a6 = objc_retainAutorelease(v71);
    v52 = 0;
    *v67 = objc_retainAutorelease(v72);
    *a9 = v114;
    v53 = 1;
  }
  if (v70)
  {
    v85 = v52;
    v54 = (void *)objc_msgSend(v73, "copy");
    dispatch_get_global_queue(0, 0);
    v55 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __158__DSNSHelperContext_preflightAndCloneIfPossible_toURL_groupUUID_sourceURLsToCopy_isDuplication_targetNames_maxFileSize_conflictStrategy_receiveTargets_error___block_invoke;
    block[3] = &unk_1E8751A08;
    v87 = v54;
    v88 = v70;
    v56 = v54;
    dispatch_async(v55, block);

    v52 = v85;
  }
  v57 = v105;
  if (v105)
  {
    v58 = (unint64_t *)&v105->__shared_owners_;
    do
      v59 = __ldaxr(v58);
    while (__stlxr(v59 - 1, v58));
    if (!v59)
    {
      ((void (*)(std::__shared_weak_count *))v57->__on_zero_shared)(v57);
      std::__shared_weak_count::__release_weak(v57);
    }
  }

  return v53;
}

uint64_t __158__DSNSHelperContext_preflightAndCloneIfPossible_toURL_groupUUID_sourceURLsToCopy_isDuplication_targetNames_maxFileSize_conflictStrategy_receiveTargets_error___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)stopAccessingURLs:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "stopAccessingSecurityScopedResource", (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (BOOL)copyItemsAtURLs:(id)a3 toURL:(id)a4 options:(unint64_t)a5 conflictStrategy:(id)a6 receiveTargets:(id)a7 error:(id *)a8
{
  DSConflictStrategy *v11;
  void *v12;
  uint64_t v13;
  const __CFString *v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  BOOL v35;
  int v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  BOOL v41;
  void *v42;
  void *v43;
  uint64_t v45;
  uint64_t v46;
  char v47;
  id v48;
  void *v49;
  DSNSURLBatchEnumerator *v50;
  void *v51;
  id v52;
  id v53;
  void *v54;
  id v55;
  void *v56;
  DSConflictStrategy *v57;
  id v58;
  char v60;
  id v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  id v67;
  id v68;
  id v69;
  uint64_t v70;
  id v71;
  _QWORD v72[6];
  id v73;
  id v74[2];
  NSURL *v75;
  uint64_t v76;
  void *v77;
  _BYTE v78[128];
  void *v79;
  uint8_t buf[4];
  NSURL *v81;
  __int16 v82;
  id v83;
  uint64_t v84;
  _QWORD v85[4];

  v60 = a5;
  v85[1] = *MEMORY[0x1E0C80C00];
  v62 = a3;
  v75 = (NSURL *)a4;
  v11 = (DSConflictStrategy *)a6;
  v58 = a7;
  if (!v11)
  {
    v11 = objc_alloc_init(DSConflictStrategy);
    -[DSConflictStrategy setType:](v11, "setType:", 1);
  }
  v57 = v11;
  -[DSConflictStrategy validate](v11, "validate");
  if (objc_msgSend(v62, "count"))
  {
    -[NSURL path](v75, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "length");

    if (v13)
    {
      StScopedResourceAccess::StScopedResourceAccess((StScopedResourceAccess *)v74, v75);
      if ((TCFURLInfo::GetNumericalProperty((const __CFURL *)v75, (const __CFString *)*MEMORY[0x1E0C9AC48], v14) & 0x40000000) != 0)
      {
        LOBYTE(v71) = 0;
        v15 = objc_alloc_init(MEMORY[0x1E0CB3600]);
        v73 = 0;
        v72[0] = MEMORY[0x1E0C809B0];
        v72[1] = 3321888768;
        v72[2] = __89__DSNSHelperContext_copyItemsAtURLs_toURL_options_conflictStrategy_receiveTargets_error___block_invoke;
        v72[3] = &__block_descriptor_48_ea8_32c102_ZTSKZ89__DSNSHelperContext_copyItemsAtURLs_toURL_options_conflictStrategy_receiveTargets_error__E3__1_e15_v16__0__NSURL_8l;
        v72[4] = &v71;
        v72[5] = &v75;
        objc_msgSend(v15, "coordinateReadingItemAtURL:options:error:byAccessor:", v75, 1, &v73, v72);
        v16 = v73;
        if (!(_BYTE)v71)
        {
          LogObj(2);
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v81 = v75;
            v82 = 2114;
            v83 = v16;
            _os_log_impl(&dword_1CBC4A000, v17, OS_LOG_TYPE_ERROR, "Failed to coordinate for copy on %@: %{public}@", buf, 0x16u);
          }

        }
      }
      objc_msgSend(MEMORY[0x1E0D87CD0], "attributeWithDomain:name:", CFSTR("com.apple.DesktopServicesHelper"), CFSTR("FileCopy"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_alloc(MEMORY[0x1E0D87C98]);
      objc_msgSend(MEMORY[0x1E0D87DF8], "currentProcess");
      v19 = objc_claimAutoreleasedReturnValue();
      v79 = v51;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v79, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = (void *)objc_msgSend(v18, "initWithExplanation:target:attributes:", CFSTR("DesktopServices file copy"), v19, v20);

      objc_msgSend(v49, "acquireWithInvalidationHandler:", &__block_literal_global_208);
      v48 = v49;
      v71 = v48;
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v69 = 0;
      v70 = 0;
      v67 = 0;
      v68 = 0;
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v19) = -[DSNSHelperContext preflightAndCloneIfPossible:toURL:groupUUID:sourceURLsToCopy:isDuplication:targetNames:maxFileSize:conflictStrategy:receiveTargets:error:](self, "preflightAndCloneIfPossible:toURL:groupUUID:sourceURLsToCopy:isDuplication:targetNames:maxFileSize:conflictStrategy:receiveTargets:error:", v62, v75, &v70, v57, v58, &v67);
      v21 = v69;
      v52 = v68;
      v53 = v67;
      v56 = v21;
      if ((v19 & 1) != 0)
      {
        if (!objc_msgSend(v21, "count"))
        {
          v41 = 1;
          goto LABEL_43;
        }
        if (-[DSNSHelperContext launchDesktopServicesHelper:](self, "launchDesktopServicesHelper:", a8))
        {
          v50 = -[DSNSURLBatchEnumerator initWithURLs:targets:batchSize:]([DSNSURLBatchEnumerator alloc], "initWithURLs:targets:batchSize:", v21, v52, 200);
          v55 = 0;
          v22 = 0;
          v45 = *MEMORY[0x1E0CB2F90];
          v46 = *MEMORY[0x1E0CB2D50];
          v47 = 1;
          do
          {
            -[DSNSURLBatchEnumerator nextBatch](v50, "nextBatch");
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v23)
              break;
            v24 = (void *)MEMORY[0x1D17A5880]();
            objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("SourceURLs"));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("TargetNames"));
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v65 = 0u;
            v66 = 0u;
            v63 = 0u;
            v64 = 0u;
            v28 = v25;
            v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v63, v78, 16);
            if (v29)
            {
              v30 = *(_QWORD *)v64;
              do
              {
                for (i = 0; i != v29; ++i)
                {
                  if (*(_QWORD *)v64 != v30)
                    objc_enumerationMutation(v28);
                  v32 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
                  objc_msgSend(v32, "startAccessingSecurityScopedResource");
                  objc_msgSend(v27, "addObject:", v32);
                }
                v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v63, v78, 16);
              }
              while (v29);
            }

            LogObj(2);
            v33 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
            {
              v34 = objc_msgSend(v28, "count");
              *(_DWORD *)buf = 134217984;
              v81 = (NSURL *)v34;
              _os_log_impl(&dword_1CBC4A000, v33, OS_LOG_TYPE_DEBUG, "Copying next batch of %lu", buf, 0xCu);
            }

            v35 = (v60 & 2) != 0 || (unint64_t)objc_msgSend(v62, "count") > 0xC8;
            *(_DWORD *)buf = 0;
            v36 = TDSHelperContext::PerformFilesCopy((uint64_t)self->impl, v28, v75, v26, v54, v70, v35, v60 & 1, buf);
            if (v36)
            {
              v37 = (void *)MEMORY[0x1E0CB35C8];
              v76 = v46;
              DSLocalizedErrorStringForKey(CFSTR("UnknownError"));
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v77 = v38;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v77, &v76, 1);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "errorWithDomain:code:userInfo:", v45, v36, v39);
              v40 = objc_claimAutoreleasedReturnValue();

              -[DSNSHelperContext stopAccessingURLs:](self, "stopAccessingURLs:", v27);
              v47 = 0;
              v55 = (id)v40;
            }
            else
            {
              -[DSNSHelperContext stopAccessingURLs:](self, "stopAccessingURLs:", v27);
            }

            objc_autoreleasePoolPop(v24);
            v22 = v23;
          }
          while (!v36);
          if (a8 && v55)
            *a8 = objc_retainAutorelease(v55);

          v41 = v47 & 1;
          goto LABEL_43;
        }
      }
      else if (a8)
      {
        v41 = 0;
        *a8 = objc_retainAutorelease(v53);
LABEL_43:

        StDefer<-[DSNSHelperContext copyItemsAtURLs:toURL:options:conflictStrategy:receiveTargets:error:]::$_0,(void *)0>::~StDefer(&v71);
        StScopedResourceAccess::~StScopedResourceAccess(v74);

        v43 = v52;
        goto LABEL_44;
      }
      v41 = 0;
      goto LABEL_43;
    }
  }
  if (a8)
  {
    v42 = (void *)MEMORY[0x1E0CB35C8];
    v84 = *MEMORY[0x1E0CB2D50];
    DSLocalizedErrorStringForKey(CFSTR("NoSourceOrDestination"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v85[0] = v56;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v85, &v84, 1);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50);
    v41 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_44:

    goto LABEL_45;
  }
  v41 = 0;
LABEL_45:

  return v41;
}

void __89__DSNSHelperContext_copyItemsAtURLs_toURL_options_conflictStrategy_receiveTargets_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  LogObj(2);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = **(_QWORD **)(a1 + 40);
    v6 = 138412546;
    v7 = v5;
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_1CBC4A000, v4, OS_LOG_TYPE_INFO, "Successfully coordinated for copy %@ -> %@", (uint8_t *)&v6, 0x16u);
  }

  **(_BYTE **)(a1 + 32) = 1;
}

void __89__DSNSHelperContext_copyItemsAtURLs_toURL_options_conflictStrategy_receiveTargets_error___block_invoke_206(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  LogObj(2);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1CBC4A000, v4, OS_LOG_TYPE_ERROR, "DS file copy assertion invalidated with error: %@", (uint8_t *)&v5, 0xCu);
  }

}

- (id)copyItemsAtURLs:(void *) toURL:options:conflictStrategy:receiveTargets:error:
{
  objc_msgSend(*a1, "invalidate");

  return a1;
}

@end
