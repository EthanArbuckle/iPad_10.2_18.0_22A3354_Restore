@implementation CNPhotoPickerCapabilities

+ (BOOL)allowsAvatarUI
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  BOOL result;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2050000000;
  v2 = (void *)getAVTAvatarStoreClass_softClass_39546;
  v17 = getAVTAvatarStoreClass_softClass_39546;
  if (!getAVTAvatarStoreClass_softClass_39546)
  {
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = (uint64_t)__getAVTAvatarStoreClass_block_invoke_39547;
    v12 = &unk_1E204EBC0;
    v13 = &v14;
    __getAVTAvatarStoreClass_block_invoke_39547((uint64_t)&v9);
    v2 = (void *)v15[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v14, 8);
  if (!v3)
    return 0;
  v9 = 0;
  v10 = (uint64_t)&v9;
  v11 = 0x2020000000;
  v4 = getAVTUIAreAvatarsSupportedSymbolLoc_ptr;
  v12 = getAVTUIAreAvatarsSupportedSymbolLoc_ptr;
  if (!getAVTUIAreAvatarsSupportedSymbolLoc_ptr)
  {
    v5 = AvatarUILibrary_39530();
    v4 = dlsym(v5, "AVTUIAreAvatarsSupported");
    *(_QWORD *)(v10 + 24) = v4;
    getAVTUIAreAvatarsSupportedSymbolLoc_ptr = v4;
  }
  _Block_object_dispose(&v9, 8);
  if (v4)
    return ((uint64_t (*)(void))v4)();
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL CNSoftLinkAVTUIAreAvatarsSupported(void)");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("CNAvatarSoftLink.h"), 32, CFSTR("%s"), dlerror(), v9);

  __break(1u);
  return result;
}

+ (BOOL)allowsAvatarStoreAccess
{
  void *v2;
  void *v3;
  uint64_t v4;
  char v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v12;

  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "entitlementVerifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0D13788];
  v12 = 0;
  v5 = objc_msgSend(v3, "currentProcessHasBooleanEntitlement:error:", v4, &v12);
  v6 = v12;

  if ((v5 & 1) == 0)
    _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNPhotoPickerCapabilities.m", 35, 3, CFSTR("Photo Picker doesn't have access to avatar store %@"), v7, v8, v9, v10, (uint64_t)v6);

  return v5;
}

+ (BOOL)allowsAvatarFaceTracking
{
  int v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void *v11;

  v2 = objc_msgSend(a1, "allowsCameraAccess");
  if (v2)
  {
    v8 = 0;
    v9 = &v8;
    v10 = 0x2020000000;
    v3 = getAVTUIIsFacetrackingSupportedSymbolLoc_ptr;
    v11 = getAVTUIIsFacetrackingSupportedSymbolLoc_ptr;
    if (!getAVTUIIsFacetrackingSupportedSymbolLoc_ptr)
    {
      v4 = AvatarUILibrary_39530();
      v3 = dlsym(v4, "AVTUIIsFacetrackingSupported");
      v9[3] = (uint64_t)v3;
      getAVTUIIsFacetrackingSupportedSymbolLoc_ptr = v3;
    }
    _Block_object_dispose(&v8, 8);
    if (v3)
    {
      LOBYTE(v2) = ((uint64_t (*)(void))v3)();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL CNSoftLinkAVTUIIsFacetrackingSupported(void)");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("CNAvatarSoftLink.h"), 33, CFSTR("%s"), dlerror());

      __break(1u);
    }
  }
  return v2;
}

+ (BOOL)isCameraTCCEnabled
{
  if (isCameraTCCEnabled_onceToken != -1)
    dispatch_once(&isCameraTCCEnabled_onceToken, &__block_literal_global_39529);
  return isCameraTCCEnabled_enabled;
}

+ (BOOL)allowsCameraAccess
{
  BOOL v2;
  char v3;
  void *v4;

  v2 = 1;
  v3 = objc_msgSend(MEMORY[0x1E0DC3880], "isSourceTypeAvailable:", 1);
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "userInterfaceIdiom") == 1)
    v2 = objc_msgSend((id)*MEMORY[0x1E0DC4730], "applicationState") != 2;

  return v3 & v2 & objc_msgSend((id)objc_opt_class(), "isCameraTCCEnabled");
}

+ (BOOL)allowsPhotoLibraryAccess
{
  if (allowsPhotoLibraryAccess_onceToken != -1)
    dispatch_once(&allowsPhotoLibraryAccess_onceToken, &__block_literal_global_7_39523);
  return allowsPhotoLibraryAccess_enabled;
}

void __53__CNPhotoPickerCapabilities_allowsPhotoLibraryAccess__block_invoke()
{
  void *v0;
  void *v1;
  char v2;
  BOOL v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForInfoDictionaryKey:", CFSTR("NSPhotoLibraryUsageDescription"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v1 = v4;
  if (v4)
  {
    v2 = 1;
  }
  else
  {
    v3 = TCCAccessPreflight() == 0;
    v1 = 0;
    v2 = v3;
  }
  allowsPhotoLibraryAccess_enabled = v2;

}

uint64_t __47__CNPhotoPickerCapabilities_isCameraTCCEnabled__block_invoke()
{
  uint64_t result;

  result = TCCAccessPreflight();
  isCameraTCCEnabled_enabled = (_DWORD)result == 0;
  return result;
}

@end
