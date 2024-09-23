@implementation BNBannerController

- (BNPresenting)presenter
{
  return self->_presenter;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    BNRegisterBannerKitLogging();
}

- (BNBannerController)initWithAuthority:(id)a3 pender:(id)a4 presenter:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  BNBannerController *v13;
  BNBannerController *v14;
  BNPenderQueue *v15;
  BNRequesterPending *pender;
  BNRequesterPending *v17;
  objc_class *v18;
  void *v19;
  void *v21;
  void *v22;
  objc_super v23;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (v9)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BNBannerController.m"), 58, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("authority"));

    if (v12)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BNBannerController.m"), 59, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("presenter"));

LABEL_3:
  v23.receiver = self;
  v23.super_class = (Class)BNBannerController;
  v13 = -[BNBannerController init](&v23, sel_init);
  v14 = v13;
  if (v13)
  {
    -[BNBannerController _setAuthority:](v13, "_setAuthority:", v9);
    if (v10)
      v15 = (BNPenderQueue *)v10;
    else
      v15 = objc_alloc_init(BNPenderQueue);
    pender = v14->_pender;
    v14->_pender = (BNRequesterPending *)v15;

    v17 = v14->_pender;
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[BNRequesterPending setPenderIdentifier:](v17, "setPenderIdentifier:", v19);

    objc_storeStrong((id *)&v14->_presenter, a5);
  }

  return v14;
}

- (BOOL)postPresentable:(id)a3 withOptions:(unint64_t)a4 userInfo:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  _BOOL4 v15;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = (void *)BNLogPosting;
  if (os_log_type_enabled((os_log_t)BNLogPosting, OS_LOG_TYPE_DEFAULT))
  {
    v13 = v12;
    BNEffectivePresentableDescription(v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543362;
    v18 = v14;
    _os_log_impl(&dword_1B9628000, v13, OS_LOG_TYPE_DEFAULT, "Asked to post presentable: %{public}@", (uint8_t *)&v17, 0xCu);

  }
  v15 = -[BNBannerController _shouldPostPresentable:userInfo:error:](self, "_shouldPostPresentable:userInfo:error:", v10, v11, a6);
  if (v15)
  {
    -[BNRequesterPending enqueuePresentable:withOptions:userInfo:](self->_pender, "enqueuePresentable:withOptions:userInfo:", v10, a4, v11);
    -[BNBannerController _presentNextPendingPresentableIfPossible](self, "_presentNextPendingPresentableIfPossible");
  }

  return v15;
}

- (id)revokePresentablesWithIdentification:(id)a3 reason:(id)a4 options:(unint64_t)a5 userInfo:(id)a6 error:(id *)a7
{
  return -[BNBannerController _revokePresentablesWithIdentification:reason:options:animated:userInfo:error:](self, "_revokePresentablesWithIdentification:reason:options:animated:userInfo:error:", a3, a4, a5, 0, a6, a7);
}

- (BOOL)revokePresentableWithRequestIdentifier:(id)a3 requesterIdentifier:(id)a4 reason:(id)a5 options:(unint64_t)a6 userInfo:(id)a7 error:(id *)a8
{
  id v14;
  id v15;
  void *v16;
  void *v17;

  v14 = a7;
  v15 = a5;
  +[BNPresentableIdentification identificationWithRequesterIdentifier:requestIdentifier:](BNPresentableIdentification, "identificationWithRequesterIdentifier:requestIdentifier:", a4, a3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[BNBannerController revokePresentablesWithIdentification:reason:options:userInfo:error:](self, "revokePresentablesWithIdentification:reason:options:userInfo:error:", v16, v15, a6, v14, a8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17 != 0;
}

- (BOOL)revokeAllPresentablesWithRequesterIdentifier:(id)a3 reason:(id)a4 options:(unint64_t)a5 userInfo:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;

  v12 = a6;
  v13 = a4;
  +[BNPresentableIdentification identificationWithRequesterIdentifier:](BNPresentableIdentification, "identificationWithRequesterIdentifier:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[BNBannerController revokePresentablesWithIdentification:reason:options:userInfo:error:](self, "revokePresentablesWithIdentification:reason:options:userInfo:error:", v14, v13, a5, v12, a7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15 != 0;
}

- (BOOL)setSuspended:(BOOL)a3 forReason:(id)a4 revokingCurrent:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v7;
  _BOOL8 v8;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id obj;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  const __CFString *v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  id v34;
  _BYTE v35[128];
  uint64_t v36;

  v7 = a5;
  v8 = a3;
  v36 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  if (v10)
  {
    -[BNRequesterPending setSuspended:forReason:](self->_pender, "setSuspended:forReason:", v8, v10);
    if (-[BNBannerController _isSuspended](self, "_isSuspended"))
    {
      -[BNBannerController _cancelAutoDequeueTimer](self, "_cancelAutoDequeueTimer");
      if (v7)
      {
        v27 = 0u;
        v28 = 0u;
        v25 = 0u;
        v26 = 0u;
        -[BNPresenting presentedPresentables](self->_presenter, "presentedPresentables");
        obj = (id)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v26;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v26 != v13)
                objc_enumerationMutation(obj);
              v15 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
              +[BNPresentableIdentification uniqueIdentificationForPresentable:](BNPresentableIdentification, "uniqueIdentificationForPresentable:", v15);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = 0;
              -[BNBannerController revokePresentablesWithIdentification:reason:options:animated:userInfo:error:](self, "revokePresentablesWithIdentification:reason:options:animated:userInfo:error:", v16, CFSTR("BNBannerControllerBannerRevocationReasonSuspensionDismissal"), 1, 1, 0, &v24);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = v24;

              if (!v17)
              {
                v19 = BNLogPosting;
                if (os_log_type_enabled((os_log_t)BNLogPosting, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543618;
                  v32 = v15;
                  v33 = 2114;
                  v34 = v18;
                  _os_log_error_impl(&dword_1B9628000, v19, OS_LOG_TYPE_ERROR, "Error attempting to revoke posted presentable: presentable: %{public}@; error: %{public}@",
                    buf,
                    0x16u);
                }
              }

            }
            v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
          }
          while (v12);
        }

      }
    }
    else
    {
      -[BNBannerController _presentNextPendingPresentableIfPossible](self, "_presentNextPendingPresentableIfPossible");
      -[BNBannerController _startAutoDequeueTimerIfNecessary](self, "_startAutoDequeueTimerIfNecessary");
    }
  }
  else if (a6)
  {
    v20 = (void *)MEMORY[0x1E0CB35C8];
    v29 = *MEMORY[0x1E0CB2D50];
    v30 = CFSTR("Missing 'reason' argument");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("BNBannerSourceErrorDomain"), 2, v21);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v10 != 0;
}

- (void)bannerAuthority:(id)a3 mayChangeDecisionForResponsiblePresentable:(id)a4
{
  -[BNBannerController _resumeForResponsiblePresentableIfNecessary:](self, "_resumeForResponsiblePresentableIfNecessary:", a4);
}

- (void)_setAuthority:(id)a3
{
  BNConsidering *v5;
  char v6;
  char v7;
  char v8;
  BNConsidering *v9;

  v5 = (BNConsidering *)a3;
  if (self->_authority != v5)
  {
    v9 = v5;
    objc_storeStrong((id *)&self->_authority, a3);
    *(_BYTE *)&self->_bannerAuthorityFlags = *(_BYTE *)&self->_bannerAuthorityFlags & 0xFE | objc_opt_respondsToSelector() & 1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = 2;
    else
      v6 = 0;
    *(_BYTE *)&self->_bannerAuthorityFlags = *(_BYTE *)&self->_bannerAuthorityFlags & 0xFD | v6;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = 4;
    else
      v7 = 0;
    *(_BYTE *)&self->_bannerAuthorityFlags = *(_BYTE *)&self->_bannerAuthorityFlags & 0xFB | v7;
    v8 = objc_opt_respondsToSelector();
    v5 = v9;
    if ((v8 & 1) != 0)
    {
      -[BNConsidering setDelegate:](self->_authority, "setDelegate:", self);
      v5 = v9;
    }
  }

}

- (BOOL)_shouldPostPresentable:(id)a3 userInfo:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  BNConsidering *authority;
  uint64_t v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  BOOL v16;
  void *v17;
  void *v18;
  id v20;
  uint64_t v21;
  const __CFString *v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    if (a5)
    {
      v17 = (void *)MEMORY[0x1E0CB35C8];
      v21 = *MEMORY[0x1E0CB2D50];
      v22 = CFSTR("Missing 'presentable' argument");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("BNBannerSourceErrorDomain"), 2, v18);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      v16 = 0;
      goto LABEL_12;
    }
LABEL_11:
    v16 = 1;
    goto LABEL_12;
  }
  if ((*(_BYTE *)&self->_bannerAuthorityFlags & 1) == 0)
    goto LABEL_11;
  authority = self->_authority;
  v20 = 0;
  v11 = -[BNConsidering shouldPostPresentable:userInfo:reason:](authority, "shouldPostPresentable:userInfo:reason:", v8, v9, &v20);
  v12 = v20;
  if (v11 == -1)
  {
    v13 = (void *)BNLogPosting;
    if (os_log_type_enabled((os_log_t)BNLogPosting, OS_LOG_TYPE_DEFAULT))
    {
      v14 = v13;
      BNEffectivePresentableDescription(v8);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v24 = v15;
      v25 = 2114;
      v26 = v12;
      _os_log_impl(&dword_1B9628000, v14, OS_LOG_TYPE_DEFAULT, "Authority denied request to post presentable: %{public}@ (%{public}@)", buf, 0x16u);

    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v8, "presentableWillNotAppearAsBanner:withReason:", v8, v12);
  }

  v16 = v11 != -1;
LABEL_12:

  return v16;
}

- (BOOL)_shouldPresentPresentable:(id)a3 withPresentedPresentables:(id)a4 responsiblePresentable:(id *)a5
{
  id v9;
  id v10;
  BOOL v11;
  uint64_t v12;
  void *v14;

  v9 = a3;
  v10 = a4;
  if ((*(_BYTE *)&self->_bannerAuthorityFlags & 2) == 0)
  {
    v11 = 0;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BNBannerController.m"), 170, CFSTR("The authority needs to provide a concrete decision"));

    goto LABEL_8;
  }
  v12 = -[BNConsidering shouldPresentPresentable:withPresentedPresentables:responsiblePresentable:](self->_authority, "shouldPresentPresentable:withPresentedPresentables:responsiblePresentable:", v9, v10, a5);
  v11 = v12 == 1;
  if (v12 != -1 && v12 != 1)
    goto LABEL_7;
LABEL_8:

  return v11;
}

- (BOOL)_shouldMorphToPresentable:(id)a3 withPresentedPresentables:(id)a4 responsiblePresentable:(id *)a5
{
  return (*(_BYTE *)&self->_bannerAuthorityFlags & 4) != 0
      && -[BNConsidering shouldMorphToPresentable:withPresentedPresentables:responsiblePresentable:](self->_authority, "shouldMorphToPresentable:withPresentedPresentables:responsiblePresentable:", a3, a4, a5) == 1;
}

- (id)_suspensionReasonForEnqueuedPresentable:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "requesterIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  objc_msgSend(v3, "requestIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v9[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR("."));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_suspendPenderForRequesterIdentifier:(id)a3 withResponsiblePresentable:(id)a4
{
  id v7;
  void *v8;
  id v9;
  NSMapTable *presentablesInducingSuspensionToSuspendedRequesterIDs;
  NSMapTable *v11;
  NSMapTable *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v7 = a4;
  if (objc_msgSend(v15, "length"))
  {
    if (v7)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BNBannerController.m"), 184, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[penderRequesterID length] > 0"));

    if (v7)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BNBannerController.m"), 185, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("responsiblePresentable"));

LABEL_3:
  -[BNBannerController _suspensionReasonForEnqueuedPresentable:](self, "_suspensionReasonForEnqueuedPresentable:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BNRequesterPending setSuspended:forRequesterWithIdentifier:reason:](self->_pender, "setSuspended:forRequesterWithIdentifier:reason:", 1, v15, v8);
  -[NSMapTable objectForKey:](self->_presentablesInducingSuspensionToSuspendedRequesterIDs, "objectForKey:", v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    presentablesInducingSuspensionToSuspendedRequesterIDs = self->_presentablesInducingSuspensionToSuspendedRequesterIDs;
    if (!presentablesInducingSuspensionToSuspendedRequesterIDs)
    {
      v11 = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 512, 0, 0);
      v12 = self->_presentablesInducingSuspensionToSuspendedRequesterIDs;
      self->_presentablesInducingSuspensionToSuspendedRequesterIDs = v11;

      presentablesInducingSuspensionToSuspendedRequesterIDs = self->_presentablesInducingSuspensionToSuspendedRequesterIDs;
    }
    -[NSMapTable setObject:forKey:](presentablesInducingSuspensionToSuspendedRequesterIDs, "setObject:forKey:", v9, v7);
  }
  objc_msgSend(v9, "addObject:", v15);

}

- (void)_resumeForResponsiblePresentableIfNecessary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSMapTable *presentablesInducingSuspensionToSuspendedRequesterIDs;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[NSMapTable objectForKey:](self->_presentablesInducingSuspensionToSuspendedRequesterIDs, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[BNBannerController _suspensionReasonForEnqueuedPresentable:](self, "_suspensionReasonForEnqueuedPresentable:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 0u;
      v14 = 0u;
      v15 = 0u;
      v16 = 0u;
      v7 = (void *)objc_msgSend(v5, "copy", 0);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v14;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v14 != v10)
              objc_enumerationMutation(v7);
            -[BNRequesterPending setSuspended:forRequesterWithIdentifier:reason:](self->_pender, "setSuspended:forRequesterWithIdentifier:reason:", 0, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11++), v6);
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        }
        while (v9);
      }

      -[NSMapTable removeObjectForKey:](self->_presentablesInducingSuspensionToSuspendedRequesterIDs, "removeObjectForKey:", v4);
      if (!-[NSMapTable count](self->_presentablesInducingSuspensionToSuspendedRequesterIDs, "count"))
      {
        presentablesInducingSuspensionToSuspendedRequesterIDs = self->_presentablesInducingSuspensionToSuspendedRequesterIDs;
        self->_presentablesInducingSuspensionToSuspendedRequesterIDs = 0;

      }
      -[BNBannerController _presentNextPendingPresentableIfPossible](self, "_presentNextPendingPresentableIfPossible");
      -[BNBannerController _startAutoDequeueTimerIfNecessary](self, "_startAutoDequeueTimerIfNecessary");

    }
  }

}

- (BOOL)_presentPresentableWithContext:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  id v12;
  uint64_t v13;
  void *v14;
  _BOOL4 v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  BOOL v21;
  id v22;
  NSObject *v23;
  void *v25;
  SEL v26;
  id v27;
  id v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "presentable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)BNLogPosting;
  if (os_log_type_enabled((os_log_t)BNLogPosting, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    BNEffectivePresentableDescription(v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v31 = v9;
    _os_log_impl(&dword_1B9628000, v8, OS_LOG_TYPE_DEFAULT, "Attempting to present presentable: %{public}@", buf, 0xCu);

  }
  if (v5)
  {
    -[BNPresenting topPresentables](self->_presenter, "topPresentables");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0;
    v11 = -[BNBannerController _shouldPresentPresentable:withPresentedPresentables:responsiblePresentable:](self, "_shouldPresentPresentable:withPresentedPresentables:responsiblePresentable:", v6, v10, &v29);
    v12 = v29;
    if (v11)
    {
      v26 = a2;
      v13 = objc_msgSend(v5, "presentationOptions");
      objc_msgSend(v5, "userInfo");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 0;
      v15 = -[BNBannerController _shouldMorphToPresentable:withPresentedPresentables:responsiblePresentable:](self, "_shouldMorphToPresentable:withPresentedPresentables:responsiblePresentable:", v6, v10, &v28);
      v16 = v28;

      if (v15)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          -[BNPresenting morphFromPresentable:toPresentable:withOptions:userInfo:](self->_presenter, "morphFromPresentable:toPresentable:withOptions:userInfo:", v16, v6, v13, v14);
      }
      else
      {
        -[BNPresenting presentPresentable:withOptions:userInfo:](self->_presenter, "presentPresentable:withOptions:userInfo:", v6, v13, v14);
      }
      if ((BNPresentationOptionsPrivateSuspend & v13) != 0)
      {
        objc_msgSend(v14, "objectForKey:", CFSTR("BNBannerPresentationOptionsSuspendReason"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v20)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", v26, self, CFSTR("BNBannerController.m"), 236, CFSTR("Use of 'BNPresentationOptionsSuspend' option requires specifying a reason in userInfo with 'kBNBannerPresentationOptionsSuspendReasonKey'"));

        }
        v27 = 0;
        v21 = -[BNBannerController setSuspended:forReason:revokingCurrent:error:](self, "setSuspended:forReason:revokingCurrent:error:", 1, v20, 0, &v27);
        v22 = v27;
        if (!v21)
        {
          v23 = BNLogPosting;
          if (os_log_type_enabled((os_log_t)BNLogPosting, OS_LOG_TYPE_ERROR))
            -[BNBannerController _presentPresentableWithContext:].cold.1((uint64_t)v20, (uint64_t)v22, v23);
        }

      }
    }
    else
    {
      v17 = (void *)BNLogPosting;
      if (os_log_type_enabled((os_log_t)BNLogPosting, OS_LOG_TYPE_DEFAULT))
      {
        v18 = v17;
        BNEffectivePresentableDescription(v6);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v31 = v19;
        _os_log_impl(&dword_1B9628000, v18, OS_LOG_TYPE_DEFAULT, "Authority denied request to present presentable: %{public}@", buf, 0xCu);

      }
      if (!v12)
      {
        objc_msgSend(v10, "firstObject");
        v12 = (id)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v6, "requesterIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[BNBannerController _suspendPenderForRequesterIdentifier:withResponsiblePresentable:](self, "_suspendPenderForRequesterIdentifier:withResponsiblePresentable:", v14, v12);
      v16 = v12;
    }

  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11;
}

- (BOOL)_isSuspended
{
  return -[BNRequesterPending isSuspended](self->_pender, "isSuspended");
}

- (id)_activeSuspensionReasons
{
  return (id)-[BNRequesterPending activeSuspensionReasons](self->_pender, "activeSuspensionReasons");
}

- (BOOL)_presentNextPendingPresentableIfPossible:(id *)a3
{
  BNBannerController *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;

  v4 = self;
  if (-[BNBannerController _isSuspended](self, "_isSuspended"))
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    -[BNBannerController _activeSuspensionReasons](v4, "_activeSuspensionReasons");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("suspended: %@"), v6);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v4) = 0;
  }
  else
  {
    -[BNRequesterPending peekPresentable](v4->_pender, "peekPresentable");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v8;
    if (v8)
    {
      objc_msgSend(v8, "postingContext");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v4) = -[BNBannerController _presentPresentableWithContext:](v4, "_presentPresentableWithContext:", v9);
      if ((_DWORD)v4)
      {
        objc_msgSend(v6, "dequeue");
        v7 = 0;
      }
      else
      {
        v7 = CFSTR("presentation failed");
      }

    }
    else
    {
      LOBYTE(v4) = 0;
      v7 = CFSTR("no pending presentable");
    }
  }

  if (a3 && v7)
    *a3 = objc_retainAutorelease(v7);

  return (char)v4;
}

- (BOOL)_presentNextPendingPresentableIfPossible
{
  BOOL v2;
  id v3;
  NSObject *v4;
  id v6;
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  v2 = -[BNBannerController _presentNextPendingPresentableIfPossible:](self, "_presentNextPendingPresentableIfPossible:", &v6);
  v3 = v6;
  if (!v2)
  {
    v4 = BNLogPosting;
    if (os_log_type_enabled((os_log_t)BNLogPosting, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v8 = v3;
      _os_log_impl(&dword_1B9628000, v4, OS_LOG_TYPE_DEFAULT, "Not presenting next pending presentable: %{public}@", buf, 0xCu);
    }
  }

  return v2;
}

- (id)_revokePresentablesWithIdentification:(id)a3 reason:(id)a4 options:(unint64_t)a5 animated:(id)a6 userInfo:(id)a7 error:(id *)a8
{
  char v11;
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  BNBannerController *v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  id *v28;
  void *v29;
  void *v30;
  void *v31;
  id *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  BNBannerController *v40;
  void *v41;
  id *v43;
  id *v44;
  id v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;
  const __CFString *v52;
  uint64_t v53;
  void *v54;
  uint8_t v55[128];
  uint8_t buf[4];
  id v57;
  __int16 v58;
  id v59;
  __int16 v60;
  void *v61;
  uint64_t v62;

  v11 = a5;
  v62 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a7;
  v18 = (id)BNLogPosting;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v45 = v17;
    v19 = self;
    BNPresentableIdentificationDescription(v14);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(v16, "BOOLValue");
      NSStringFromBOOL();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = 0;
    }
    *(_DWORD *)buf = 138543874;
    v57 = v20;
    v58 = 2114;
    v59 = v15;
    v60 = 2114;
    v61 = v21;
    _os_log_impl(&dword_1B9628000, v18, OS_LOG_TYPE_DEFAULT, "Asked to revoke presentables with identification %{public}@ with reason '%{public}@' (animated=%{public}@)", buf, 0x20u);
    if (v16)

    self = v19;
    v17 = v45;
  }

  if (v14)
  {
    if ((v11 & 1) != 0)
    {
      v22 = 0;
    }
    else
    {
      -[BNRequesterPending pullPresentablesWithIdentification:](self->_pender, "pullPresentablesWithIdentification:", v14);
      v22 = (id)objc_claimAutoreleasedReturnValue();
      v47 = 0u;
      v48 = 0u;
      v49 = 0u;
      v50 = 0u;
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
      if (v23)
      {
        v24 = v23;
        v43 = a8;
        v46 = v17;
        v25 = *(_QWORD *)v48;
        do
        {
          for (i = 0; i != v24; ++i)
          {
            if (*(_QWORD *)v48 != v25)
              objc_enumerationMutation(v22);
            v27 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v27, "presentableWillNotAppearAsBanner:withReason:", v27, CFSTR("BNBannerControllerBannerRejectionReasonRevokedWhilePended"));
          }
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
        }
        while (v24);
        a8 = v43;
        v17 = v46;
      }
    }
    if (v16)
      -[BNPresenting dismissPresentablesWithIdentification:reason:animated:userInfo:](self->_presenter, "dismissPresentablesWithIdentification:reason:animated:userInfo:", v14, v15, objc_msgSend(v16, "BOOLValue"), v17);
    else
      -[BNPresenting dismissPresentablesWithIdentification:reason:userInfo:](self->_presenter, "dismissPresentablesWithIdentification:reason:userInfo:", v14, v15, v17);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v31;
    if (v31)
    {
      if (!v22)
      {
        v22 = v31;
LABEL_33:
        -[BNBannerController _resumeForResponsiblePresentableIfNecessaryWithIdentification:](self, "_resumeForResponsiblePresentableIfNecessaryWithIdentification:", v14);
        goto LABEL_34;
      }
      objc_msgSend(v22, "arrayByAddingObjectsFromArray:", v31);
      v32 = a8;
      v33 = objc_claimAutoreleasedReturnValue();

      v22 = (id)v33;
      a8 = v32;
    }
    if (a8 && !v22)
    {
      v44 = a8;
      v34 = (void *)MEMORY[0x1E0CB3940];
      BNPresentableIdentificationDescription(v14);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "stringWithFormat:", CFSTR("No pending or presented presentables with identification %@"), v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      v37 = (void *)MEMORY[0x1E0CB35C8];
      v53 = *MEMORY[0x1E0CB2D50];
      v54 = v36;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1);
      v38 = v16;
      v39 = v17;
      v40 = self;
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "errorWithDomain:code:userInfo:", CFSTR("BNBannerSourceErrorDomain"), 3, v41);
      *v44 = (id)objc_claimAutoreleasedReturnValue();

      self = v40;
      v17 = v39;
      v16 = v38;

      v22 = 0;
    }
    goto LABEL_33;
  }
  if (!a8)
  {
    v22 = 0;
    goto LABEL_35;
  }
  v28 = a8;
  v29 = (void *)MEMORY[0x1E0CB35C8];
  v51 = *MEMORY[0x1E0CB2D50];
  v52 = CFSTR("Missing 'presentableIdentification' argument");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "errorWithDomain:code:userInfo:", CFSTR("BNBannerSourceErrorDomain"), 2, v30);
  v22 = 0;
  *v28 = (id)objc_claimAutoreleasedReturnValue();
LABEL_34:

LABEL_35:
  return v22;
}

- (void)_startAutoDequeueTimerIfNecessary
{
  void *v3;
  NSObject *v4;
  void *v5;
  NSTimer *v6;
  NSTimer *autoDequeueTimer;
  _QWORD v8[4];
  id v9;
  uint8_t buf[8];
  id location;

  if (!self->_autoDequeueTimer)
  {
    -[BNRequesterPending peekPresentable](self->_pender, "peekPresentable");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_initWeak(&location, self);
      v4 = BNLogPosting;
      if (os_log_type_enabled((os_log_t)BNLogPosting, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B9628000, v4, OS_LOG_TYPE_DEFAULT, "Scheduling auto dequeue timer", buf, 2u);
      }
      v5 = (void *)MEMORY[0x1E0C99E88];
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __55__BNBannerController__startAutoDequeueTimerIfNecessary__block_invoke;
      v8[3] = &unk_1E70443F8;
      objc_copyWeak(&v9, &location);
      objc_msgSend(v5, "scheduledTimerWithTimeInterval:repeats:block:", 0, v8, 2.0);
      v6 = (NSTimer *)objc_claimAutoreleasedReturnValue();
      autoDequeueTimer = self->_autoDequeueTimer;
      self->_autoDequeueTimer = v6;

      objc_destroyWeak(&v9);
      objc_destroyWeak(&location);
    }
  }
}

void __55__BNBannerController__startAutoDequeueTimerIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_autoDequeueTimer");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v3)
    objc_msgSend(WeakRetained, "_setAutoDequeueTimer:", 0);
  v6 = BNLogPosting;
  if (os_log_type_enabled((os_log_t)BNLogPosting, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B9628000, v6, OS_LOG_TYPE_DEFAULT, "Auto dequeue timer expired – attempting to present next pending presentable", buf, 2u);
  }
  v10 = 0;
  v7 = objc_msgSend(WeakRetained, "_presentNextPendingPresentableIfPossible:", &v10);
  v8 = v10;
  if (v7)
  {
    objc_msgSend(WeakRetained, "_startAutoDequeueTimerIfNecessary");
  }
  else
  {
    v9 = BNLogPosting;
    if (os_log_type_enabled((os_log_t)BNLogPosting, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v12 = v8;
      _os_log_impl(&dword_1B9628000, v9, OS_LOG_TYPE_DEFAULT, "Auto dequeue timer failed to present next pending presentable: %{public}@", buf, 0xCu);
    }
  }

}

- (void)_cancelAutoDequeueTimer
{
  NSTimer *autoDequeueTimer;

  -[NSTimer invalidate](self->_autoDequeueTimer, "invalidate");
  autoDequeueTimer = self->_autoDequeueTimer;
  self->_autoDequeueTimer = 0;

}

- (void)_resumeForResponsiblePresentableIfNecessaryWithIdentification:(id)a3
{
  id v5;
  NSMapTable *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BNBannerController.m"), 354, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("presentableIdentification"));

  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = self->_presentablesInducingSuspensionToSuspendedRequesterIDs;
  v7 = (id)-[NSMapTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        if (BNIsPresentableIdentifiedByIdentification(v10, v5, 0))
        {
          v7 = v10;
          goto LABEL_13;
        }
      }
      v7 = (id)-[NSMapTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_13:

  -[BNBannerController _resumeForResponsiblePresentableIfNecessary:](self, "_resumeForResponsiblePresentableIfNecessary:", v7);
}

- (BNConsidering)authority
{
  return self->_authority;
}

- (BNRequesterPending)pender
{
  return self->_pender;
}

- (NSTimer)_autoDequeueTimer
{
  return self->_autoDequeueTimer;
}

- (void)_setAutoDequeueTimer:(id)a3
{
  objc_storeStrong((id *)&self->_autoDequeueTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoDequeueTimer, 0);
  objc_storeStrong((id *)&self->_presenter, 0);
  objc_storeStrong((id *)&self->_pender, 0);
  objc_storeStrong((id *)&self->_authority, 0);
  objc_storeStrong((id *)&self->_presentablesInducingSuspensionToSuspendedRequesterIDs, 0);
}

- (id)revokePresentablesWithIdentification:(id)a3 reason:(id)a4 options:(unint64_t)a5 animated:(BOOL)a6 userInfo:(id)a7 error:(id *)a8
{
  _BOOL8 v9;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;

  v9 = a6;
  v14 = (void *)MEMORY[0x1E0CB37E8];
  v15 = a7;
  v16 = a4;
  v17 = a3;
  objc_msgSend(v14, "numberWithBool:", v9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[BNBannerController _revokePresentablesWithIdentification:reason:options:animated:userInfo:error:](self, "_revokePresentablesWithIdentification:reason:options:animated:userInfo:error:", v17, v16, a5, v18, v15, a8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (BOOL)revokePresentableWithRequestIdentifier:(id)a3 requesterIdentifier:(id)a4 reason:(id)a5 options:(unint64_t)a6 animated:(BOOL)a7 userInfo:(id)a8 error:(id *)a9
{
  _BOOL8 v9;
  id v15;
  id v16;
  void *v17;
  void *v18;

  v9 = a7;
  v15 = a8;
  v16 = a5;
  +[BNPresentableIdentification identificationWithRequesterIdentifier:requestIdentifier:](BNPresentableIdentification, "identificationWithRequesterIdentifier:requestIdentifier:", a4, a3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[BNBannerController revokePresentablesWithIdentification:reason:options:animated:userInfo:error:](self, "revokePresentablesWithIdentification:reason:options:animated:userInfo:error:", v17, v16, a6, v9, v15, a9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18 != 0;
}

- (void)_presentPresentableWithContext:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_1B9628000, log, OS_LOG_TYPE_ERROR, "Error attempting to suspend: reason: %{public}@; error: %{public}@",
    (uint8_t *)&v3,
    0x16u);
}

@end
