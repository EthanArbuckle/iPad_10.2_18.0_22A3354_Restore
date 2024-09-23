@implementation AudioComponentMainRegConnection

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_DWORD *)self + 6) = -1;
  *((_BYTE *)self + 28) = 0;
  return self;
}

- (AudioComponentMainRegConnection)initWithRegistrar:(void *)a3 connection:(id)a4
{
  id v6;
  AudioComponentMainRegConnection *v7;
  AudioComponentMainRegConnection *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)AudioComponentMainRegConnection;
  v7 = -[AudioComponentMainRegConnection init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->mImpl = a3;
    objc_storeWeak((id *)&v7->mConnInfo.mConnection, v6);
  }

  return v8;
}

- (void)getComponentList:(id)a3 linkedSDKRequiresEntitlement:(BOOL)a4 includeExtensions:(BOOL)a5 forceWaitForExtensions:(BOOL)a6 reply:(id)a7
{
  _BOOL4 v8;
  _BOOL4 v9;
  void *mImpl;
  id v12;
  id v13;
  os_log_t v14;
  _QWORD *v15;
  NSObject *v16;
  id canUseExtensions;
  uint64_t v18;
  void *v19;
  int mExtUsePermission;
  unsigned __int8 v21;
  uint64_t v22;
  uint64_t v23;
  _BYTE *v24;
  NSObject *v25;
  _BYTE *v26;
  unsigned __int8 v27;
  int v28;
  uint64_t v29;
  _QWORD *v30;
  _QWORD *v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  _QWORD *v38;
  std::__shared_weak_count *v39;
  unint64_t *p_shared_owners;
  unint64_t v41;
  _BYTE v42[24];
  void *v43;
  id v44;
  id v45;
  id v46;
  void *v47;
  BOOL v48;
  _QWORD block[3];
  _QWORD *v50;
  id v51;
  void *v52;
  uint64_t v53;

  v8 = a6;
  v9 = a5;
  v53 = *MEMORY[0x1E0C80C00];
  self->mConnInfo.mLinkedSDKRequiresEntitlement = a4;
  mImpl = self->mImpl;
  v12 = a3;
  v13 = a7;
  if (gAudioComponentLogCategory)
  {
    v14 = *(os_log_t *)gAudioComponentLogCategory;
  }
  else
  {
    v15 = (_QWORD *)operator new();
    v15[1] = 0;
    v14 = os_log_create("com.apple.coreaudio", "audiocomp");
    *v15 = v14;
    gAudioComponentLogCategory = (uint64_t)v15;
  }
  v16 = objc_retainAutorelease(v14);
  canUseExtensions = (id)os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  if ((_DWORD)canUseExtensions)
  {
    *(_DWORD *)v42 = 136315906;
    *(_QWORD *)&v42[4] = "AudioComponentRegistrar.mm";
    *(_WORD *)&v42[12] = 1024;
    *(_DWORD *)&v42[14] = 329;
    *(_WORD *)&v42[18] = 1024;
    *(_DWORD *)&v42[20] = v9;
    LOWORD(v43) = 1024;
    *(_DWORD *)((char *)&v43 + 2) = v8;
    _os_log_impl(&dword_18EE07000, v16, OS_LOG_TYPE_DEFAULT, "%25s:%-5d getComponentList includeExtensions: %d waitForExtensions: %d", v42, 0x1Eu);
  }
  v18 = *((_QWORD *)mImpl + 31);
  if (v18)
  {
    canUseExtensions = *(id *)(*(_QWORD *)v18 + 96);
    v19 = canUseExtensions;
  }
  else
  {
    v19 = 0;
  }
  mExtUsePermission = self->mConnInfo.mExtUsePermission;
  if (mExtUsePermission == -1)
  {
    canUseExtensions = (id)ConnectionInfo::_canUseExtensions(&self->mConnInfo);
    mExtUsePermission = (int)canUseExtensions;
    self->mConnInfo.mExtUsePermission = (int)canUseExtensions;
  }
  if (v9 && !*(_BYTE *)mImpl)
  {
    v21 = atomic_load((unsigned __int8 *)mImpl + 2);
    if ((v21 & 1) == 0 && (PlatformUtilities_iOS::_eaJyFmO((PlatformUtilities_iOS *)canUseExtensions) & 1) == 0)
    {
      v22 = *((_QWORD *)mImpl + 9);
      if (!v22)
        std::__throw_bad_function_call[abi:ne180100]();
      if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)v22 + 48))(v22))
      {
        v23 = MEMORY[0x1E0C809B0];
        *(_QWORD *)v42 = MEMORY[0x1E0C809B0];
        *(_QWORD *)&v42[8] = 3221225472;
        *(_QWORD *)&v42[16] = ___ZN27AudioComponentRegistrarImpl16getComponentListER14ConnectionInfoP8NSStringbbU13block_pointerFvP6NSDatabS5_P7NSArrayE_block_invoke;
        v43 = &unk_1E29222B0;
        v47 = mImpl;
        v48 = mExtUsePermission == 1;
        v44 = v12;
        v45 = v19;
        v46 = v13;
        v24 = v42;
        if (*((_QWORD *)mImpl + 32))
        {
LABEL_18:
          v25 = *((_QWORD *)mImpl + 1);
          block[0] = v23;
          block[1] = 3221225472;
          block[2] = ___ZN27AudioComponentRegistrarImpl21_initialExtensionScanEU13block_pointerFvvE_block_invoke;
          v50 = &unk_1E2922288;
          v51 = v24;
          v52 = mImpl;
          v26 = v24;
          dispatch_async(v25, block);

          goto LABEL_23;
        }
        v29 = operator new();
        *(_DWORD *)v29 = 0;
        std::__function::__value_func<void ()(void)>::__value_func[abi:ne180100]((uint64_t)block, (uint64_t)mImpl + 16);
        *(_QWORD *)(v29 + 8) = v29;
        v30 = (_QWORD *)operator new();
        *v30 = &off_1E2909EF8;
        *(_QWORD *)(v29 + 16) = v30;
        v31 = (_QWORD *)operator new();
        *v31 = &off_1E2917FD8;
        v31[1] = 0;
        v31[2] = 0;
        v31[3] = v30;
        *(_QWORD *)(v29 + 24) = v31;
        v32 = (uint64_t)v50;
        if (v50)
        {
          if (v50 == block)
          {
            *(_QWORD *)(v29 + 56) = v29 + 32;
            (*(void (**)(_QWORD *))(block[0] + 24))(block);
            goto LABEL_29;
          }
          v32 = (*(uint64_t (**)(void))(*v50 + 16))();
        }
        *(_QWORD *)(v29 + 56) = v32;
LABEL_29:
        v33 = (_QWORD *)(v29 + 136);
        v34 = 64;
        do
        {
          v35 = v29 + v34;
          *(_BYTE *)v35 = 0;
          *(_QWORD *)(v35 + 8) = 0;
          *(_QWORD *)(v35 + 16) = 0;
          v34 += 24;
        }
        while ((_QWORD *)(v35 + 24) != v33);
        *v33 = 0;
        *(_QWORD *)(v29 + 144) = 0;
        *(_QWORD *)(v29 + 152) = 0;
        if (initInterAppAudioLogging::once != -1)
          dispatch_once(&initInterAppAudioLogging::once, &__block_literal_global_10577);
        v36 = v50;
        if (v50 == block)
        {
          v37 = 4;
          v36 = block;
        }
        else
        {
          if (!v50)
          {
LABEL_38:
            v38 = (_QWORD *)operator new();
            *v38 = &off_1E2918010;
            v38[1] = 0;
            v38[2] = 0;
            v38[3] = v29;
            v39 = (std::__shared_weak_count *)*((_QWORD *)mImpl + 33);
            *((_QWORD *)mImpl + 32) = v29;
            *((_QWORD *)mImpl + 33) = v38;
            if (v39)
            {
              p_shared_owners = (unint64_t *)&v39->__shared_owners_;
              do
                v41 = __ldaxr(p_shared_owners);
              while (__stlxr(v41 - 1, p_shared_owners));
              if (!v41)
              {
                ((void (*)(std::__shared_weak_count *))v39->__on_zero_shared)(v39);
                std::__shared_weak_count::__release_weak(v39);
              }
            }
            goto LABEL_18;
          }
          v37 = 5;
        }
        (*(void (**)(void))(*v36 + 8 * v37))();
        goto LABEL_38;
      }
    }
  }
  if (mExtUsePermission == 1)
  {
    v27 = atomic_load((unsigned __int8 *)mImpl + 2);
    v28 = v27 & 1;
  }
  else
  {
    v28 = 0;
  }
  AudioComponentRegistrarImpl::replyWithComponentList((uint64_t)mImpl, v28, v12, v19, v13);
LABEL_23:

}

- (void)canRegisterComponent:(id)a3 reply:(id)a4
{
  unsigned __int8 v6;
  OSType componentSubType;
  int v8;
  id v9;
  void *v10;
  int v11;
  id WeakRetained;
  void *v13;
  os_log_t v14;
  _QWORD *v15;
  NSObject *v16;
  _BOOL4 v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  const __CFString *v25;
  const char *v26;
  CFTypeRef v27;
  os_log_t v28;
  _QWORD *v29;
  NSObject *v30;
  uint64_t v31;
  _BOOL8 v32;
  os_log_t v33;
  _QWORD *v34;
  NSObject *v35;
  const char *v36;
  os_log_t v37;
  _QWORD *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void (**v42)(id, _BOOL8);
  __SecTask *task;
  audit_token_t token;
  __int128 v45;
  __int128 v46;
  void *v47;
  unsigned int v48;
  AudioComponentDescription v49;
  uint8_t v50[4];
  const char *v51;
  __int16 v52;
  int v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  const char *v57;
  __int16 v58;
  CFTypeRef v59;
  _BYTE buf[128];
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v42 = (void (**)(id, _BOOL8))a4;
  memset(&v49, 0, sizeof(v49));
  v48 = 0;
  dictionaryToComponentDescription((NSDictionary *)a3, &v49, &v48);
  CAFormatter::CAFormatter((CAFormatter *)&v47, &v49);
  if ((v6 & 1) == 0
  {
    *(_QWORD *)&v61 = CFSTR("sandboxing-required");
    *((_QWORD *)&v61 + 1) = CFSTR("entitlements-required");
    *(_QWORD *)buf = MEMORY[0x1E0C9AAA0];
    *(_QWORD *)&buf[8] = &unk_1E2932E38;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v61, 2);
    AudioComponentRegistrarImpl::componentRequirements(AudioComponentDescription const&)::audibleAudioFileEntitlements = objc_claimAutoreleasedReturnValue();
  }
  if (v49.componentType == 1633969507)
  {
    componentSubType = v49.componentSubType;
    if (v49.componentSubType == 1633771875)
    {
LABEL_8:
      v9 = (id)AudioComponentRegistrarImpl::componentRequirements(AudioComponentDescription const&)::audibleAudioFileEntitlements;
      goto LABEL_10;
    }
    v8 = 1096107074;
  }
  else
  {
    if (v49.componentType != 1634101612)
      goto LABEL_9;
    componentSubType = v49.componentSubType;
    v8 = 1635083362;
  }
  if (componentSubType == v8)
    goto LABEL_8;
LABEL_9:
  v9 = 0;
LABEL_10:
  v40 = v9;
  objc_msgSend(v9, "valueForKey:", CFSTR("entitlements-required"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v41, "count"))
  {
    objc_msgSend(v9, "valueForKey:", CFSTR("sandboxing-required"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "BOOLValue");

    if (!v11)
      goto LABEL_22;
    WeakRetained = objc_loadWeakRetained((id *)&self->mConnInfo.mConnection);
    v13 = WeakRetained;
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained, "auditToken");
    }
    else
    {
      v45 = 0u;
      v46 = 0u;
    }
    *(_OWORD *)buf = v45;
    *(_OWORD *)&buf[16] = v46;
    v17 = sandbox_check_by_audit_token() == 0;

    if (v17)
    {
      if (gAudioComponentLogCategory)
      {
        v37 = *(os_log_t *)gAudioComponentLogCategory;
      }
      else
      {
        v38 = (_QWORD *)operator new();
        v38[1] = 0;
        v37 = os_log_create("com.apple.coreaudio", "audiocomp");
        *v38 = v37;
        gAudioComponentLogCategory = (uint64_t)v38;
      }
      v39 = objc_retainAutorelease(v37);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "AudioComponentRegistrar.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 491;
        *(_WORD *)&buf[18] = 2080;
        *(_QWORD *)&buf[20] = v47;
        _os_log_impl(&dword_18EE07000, v39, OS_LOG_TYPE_INFO, "%25s:%-5d canRegisterComponent %s: NO, for a non-sandboxed process attempting to register a component that requires sandboxing", buf, 0x1Cu);
      }
    }
    else
    {
LABEL_22:
      v18 = objc_loadWeakRetained((id *)&self->mConnInfo.mConnection);
      v19 = v18;
      if (v18)
        objc_msgSend(v18, "auditToken");
      else
        memset(&token, 0, sizeof(token));
      task = SecTaskCreateWithAuditToken(0, &token);

      if (task)
      {
        v63 = 0u;
        v64 = 0u;
        v61 = 0u;
        v62 = 0u;
        v20 = v41;
        v21 = 0;
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v61, buf, 16);
        if (v22)
        {
          v23 = *(_QWORD *)v62;
          do
          {
            for (i = 0; i != v22; ++i)
            {
              if (*(_QWORD *)v62 != v23)
                objc_enumerationMutation(v20);
              v25 = *(const __CFString **)(*((_QWORD *)&v61 + 1) + 8 * i);
              v26 = (const char *)objc_msgSend(v20, "objectForKey:", v25);
              v27 = SecTaskCopyValueForEntitlement(task, v25, 0);
              if (gAudioComponentLogCategory)
              {
                v28 = *(os_log_t *)gAudioComponentLogCategory;
              }
              else
              {
                v29 = (_QWORD *)operator new();
                v29[1] = 0;
                v28 = os_log_create("com.apple.coreaudio", "audiocomp");
                *v29 = v28;
                gAudioComponentLogCategory = (uint64_t)v29;
              }
              v30 = objc_retainAutorelease(v28);
              if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)v50 = 136316162;
                v51 = "AudioComponentRegistrar.mm";
                v52 = 1024;
                v53 = 503;
                v54 = 2112;
                v55 = (void *)v25;
                v56 = 2112;
                v57 = v26;
                v58 = 2112;
                v59 = v27;
                _os_log_impl(&dword_18EE07000, v30, OS_LOG_TYPE_INFO, "%25s:%-5d canRegisterComponent: entitlement \"%@\" requires value %@, prospective registrant has value %@", v50, 0x30u);
              }
              if (v27)
              {
                if (CFEqual(v26, v27))
                  ++v21;
                CFRelease(v27);
              }
            }
            v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v61, buf, 16);
          }
          while (v22);
        }

        v31 = objc_msgSend(v20, "count");
        v32 = v21 == v31;
        if (gAudioComponentLogCategory)
        {
          v33 = *(os_log_t *)gAudioComponentLogCategory;
        }
        else
        {
          v34 = (_QWORD *)operator new();
          v34[1] = 0;
          v33 = os_log_create("com.apple.coreaudio", "audiocomp");
          *v34 = v33;
          gAudioComponentLogCategory = (uint64_t)v34;
        }
        v35 = objc_retainAutorelease(v33);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          v36 = "NO";
          *(_DWORD *)v50 = 136315906;
          if (v21 == v31)
            v36 = "YES, possessing all required entitlements";
          v51 = "AudioComponentRegistrar.mm";
          v52 = 1024;
          v53 = 512;
          v54 = 2080;
          v55 = v47;
          v56 = 2080;
          v57 = v36;
          _os_log_impl(&dword_18EE07000, v35, OS_LOG_TYPE_INFO, "%25s:%-5d canRegisterComponent %s: %s", v50, 0x26u);
        }
        CFRelease(task);
        goto LABEL_56;
      }
    }
    v32 = 0;
LABEL_56:
    v42[2](v42, v32);
    goto LABEL_57;
  }
  if (gAudioComponentLogCategory)
  {
    v14 = *(os_log_t *)gAudioComponentLogCategory;
  }
  else
  {
    v15 = (_QWORD *)operator new();
    v15[1] = 0;
    v14 = os_log_create("com.apple.coreaudio", "audiocomp");
    *v15 = v14;
    gAudioComponentLogCategory = (uint64_t)v15;
  }
  v16 = objc_retainAutorelease(v14);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "AudioComponentRegistrar.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 481;
    *(_WORD *)&buf[18] = 2080;
    *(_QWORD *)&buf[20] = v47;
    _os_log_impl(&dword_18EE07000, v16, OS_LOG_TYPE_DEBUG, "%25s:%-5d canRegisterComponent %s: YES, requiring no entitlements", buf, 0x1Cu);
  }
  v42[2](v42, 1);
LABEL_57:

  if (v47)
    free(v47);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->mConnInfo.mConnection);
}

@end
