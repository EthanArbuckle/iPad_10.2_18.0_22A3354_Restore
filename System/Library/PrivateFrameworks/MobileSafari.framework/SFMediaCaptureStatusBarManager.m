@implementation SFMediaCaptureStatusBarManager

- (SFMediaRecordingDocument)_recordingDocument
{
  return (SFMediaRecordingDocument *)objc_loadWeakRetained((id *)&self->_recordingDocument);
}

- (void)setRecordingDocument:(id)a3
{
  id WeakRetained;
  void *v5;
  SBSStatusBarStyleOverridesAssertion *statusBarStyleOverride;
  SBSStatusBarStyleOverridesCoordinator *coordinator;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_recordingDocument);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_recordingDocument, obj);
    v5 = obj;
    if (!obj)
    {
      statusBarStyleOverride = self->_statusBarStyleOverride;
      self->_statusBarStyleOverride = 0;

      coordinator = self->_coordinator;
      self->_coordinator = 0;

      v5 = 0;
    }
  }

}

- (BOOL)isRecording
{
  id WeakRetained;
  BOOL v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_recordingDocument);
  v3 = WeakRetained != 0;

  return v3;
}

- (void)recordingDocumentDidBeginMediaCapture:(id)a3 audioOnly:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  int v7;

  v4 = a4;
  v6 = a3;
  -[SFMediaCaptureStatusBarManager setRecordingDocument:](self, "setRecordingDocument:", v6);
  v7 = objc_msgSend(v6, "canOverrideStatusBar");

  if (v7)
    -[SFMediaCaptureStatusBarManager _acquireStatusBarOverrideWithAudioOnly:](self, "_acquireStatusBarOverrideWithAudioOnly:", v4);
}

- (void)recordingDocumentDidEndMediaCapture:(id)a3
{
  if (self->_hasStatusBarOverride)
    -[SFMediaCaptureStatusBarManager _releaseStatusBarOverride](self, "_releaseStatusBarOverride", a3);
  -[SFMediaCaptureStatusBarManager setRecordingDocument:](self, "setRecordingDocument:", 0);
}

- (void)cancelStatusBarOverride
{
  if (self->_hasStatusBarOverride)
    -[SFMediaCaptureStatusBarManager _releaseStatusBarOverride](self, "_releaseStatusBarOverride");
  -[SFMediaCaptureStatusBarManager _cleanUpStatusBarOverride](self, "_cleanUpStatusBarOverride");
}

- (unint64_t)overrideStyleForAudioOnly:(BOOL)a3
{
  if (a3)
    return 0x1000000;
  else
    return 0x20000;
}

- (void)_acquireStatusBarOverride
{
  -[SFMediaCaptureStatusBarManager _acquireStatusBarOverrideWithAudioOnly:](self, "_acquireStatusBarOverrideWithAudioOnly:", 1);
}

- (void)_acquireStatusBarOverrideWithAudioOnly:(BOOL)a3
{
  uint64_t v4;
  _BOOL8 v5;
  unint64_t v6;
  void *v7;
  void *v8;
  SBSStatusBarStyleOverridesAssertion *v9;
  SBSStatusBarStyleOverridesAssertion *statusBarStyleOverride;
  SBSStatusBarStyleOverridesCoordinator *v11;
  SBSStatusBarStyleOverridesCoordinator *coordinator;
  SBSStatusBarStyleOverridesCoordinator *v13;
  void *v14;
  SBSStatusBarStyleOverridesAssertion *v15;
  _QWORD v16[5];
  _QWORD v17[5];
  _QWORD v18[4];
  id v19;
  id location;

  v4 = MEMORY[0x1E0C809B0];
  if (!self->_statusBarStyleOverride)
  {
    v5 = a3;
    objc_initWeak(&location, self);
    v6 = -[SFMediaCaptureStatusBarManager overrideStyleForAudioOnly:](self, "overrideStyleForAudioOnly:", v5);
    v7 = (void *)MEMORY[0x1E0DAAFD8];
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "assertionWithStatusBarStyleOverrides:forPID:exclusive:showsWhenForeground:", v6, objc_msgSend(v8, "processIdentifier"), 1, 1);
    v9 = (SBSStatusBarStyleOverridesAssertion *)objc_claimAutoreleasedReturnValue();
    statusBarStyleOverride = self->_statusBarStyleOverride;
    self->_statusBarStyleOverride = v9;

    v11 = (SBSStatusBarStyleOverridesCoordinator *)objc_alloc_init(MEMORY[0x1E0DAAFE0]);
    coordinator = self->_coordinator;
    self->_coordinator = v11;

    -[SBSStatusBarStyleOverridesCoordinator setDelegate:](self->_coordinator, "setDelegate:", self);
    v13 = self->_coordinator;
    v18[0] = v4;
    v18[1] = 3221225472;
    v18[2] = __73__SFMediaCaptureStatusBarManager__acquireStatusBarOverrideWithAudioOnly___block_invoke;
    v18[3] = &unk_1E21E74F8;
    objc_copyWeak(&v19, &location);
    -[SBSStatusBarStyleOverridesCoordinator setRegisteredStyleOverrides:reply:](v13, "setRegisteredStyleOverrides:reply:", v6, v18);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  -[SFMediaCaptureStatusBarManager statusString](self, "statusString", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSStatusBarStyleOverridesAssertion setStatusString:](self->_statusBarStyleOverride, "setStatusString:", v14);

  v15 = self->_statusBarStyleOverride;
  v16[4] = self;
  v17[0] = v4;
  v17[1] = 3221225472;
  v17[2] = __73__SFMediaCaptureStatusBarManager__acquireStatusBarOverrideWithAudioOnly___block_invoke_3;
  v17[3] = &unk_1E21E2190;
  v17[4] = self;
  v16[0] = v4;
  v16[1] = 3221225472;
  v16[2] = __73__SFMediaCaptureStatusBarManager__acquireStatusBarOverrideWithAudioOnly___block_invoke_2;
  v16[3] = &unk_1E21E2050;
  -[SBSStatusBarStyleOverridesAssertion acquireWithHandler:invalidationHandler:](v15, "acquireWithHandler:invalidationHandler:", v17, v16);
}

void __73__SFMediaCaptureStatusBarManager__acquireStatusBarOverrideWithAudioOnly___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BYTE *WeakRetained;
  void *v6;

  v3 = a2;
  if (v3)
  {
    v4 = WBS_LOG_CHANNEL_PREFIXMediaCapture();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __73__SFMediaCaptureStatusBarManager__acquireStatusBarOverrideWithAudioOnly___block_invoke_cold_1(v4, v3);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v6 = WeakRetained;
    if (WeakRetained)
    {
      if (WeakRetained[24])
        objc_msgSend(WeakRetained, "_releaseStatusBarOverride");
      objc_msgSend(v6, "_didInvalidateStatusBarOverride");
    }

  }
}

uint64_t __73__SFMediaCaptureStatusBarManager__acquireStatusBarOverrideWithAudioOnly___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didAcquireStatusBarOverrideSuccessfully:", a2);
}

uint64_t __73__SFMediaCaptureStatusBarManager__acquireStatusBarOverrideWithAudioOnly___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didInvalidateStatusBarOverride");
}

- (NSString)simplifiedURLString
{
  id WeakRetained;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_recordingDocument);
  objc_msgSend(WeakRetained, "URLString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 511, 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)_releaseStatusBarOverride
{
  -[SBSStatusBarStyleOverridesAssertion invalidate](self->_statusBarStyleOverride, "invalidate");
  self->_hasStatusBarOverride = 0;
}

- (void)_didAcquireStatusBarOverrideSuccessfully:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id WeakRetained;
  uint8_t v15[16];

  v3 = a3;
  v5 = WBS_LOG_CHANNEL_PREFIXMediaCapture();
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_18B7B2000, v6, OS_LOG_TYPE_DEFAULT, "Successfully acquired status bar override", v15, 2u);
    }
    self->_hasStatusBarOverride = 1;
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[SFMediaCaptureStatusBarManager _didAcquireStatusBarOverrideSuccessfully:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    WeakRetained = objc_loadWeakRetained((id *)&self->_recordingDocument);
    objc_msgSend(WeakRetained, "muteMediaCapture");

    -[SFMediaCaptureStatusBarManager setRecordingDocument:](self, "setRecordingDocument:", 0);
  }
}

- (void)_didInvalidateStatusBarOverride
{
  OUTLINED_FUNCTION_7(&dword_18B7B2000, a1, a3, "Status bar override was invalidated", a5, a6, a7, a8, 0);
}

- (void)_cleanUpStatusBarOverride
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_recordingDocument);
  objc_msgSend(WeakRetained, "muteMediaCapture");

  -[SFMediaCaptureStatusBarManager setRecordingDocument:](self, "setRecordingDocument:", 0);
  self->_hasStatusBarOverride = 0;
}

- (BOOL)statusBarCoordinator:(id)a3 receivedTapWithContext:(id)a4 completionBlock:(id)a5
{
  id v6;
  id WeakRetained;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_recordingDocument);
  -[SFMediaCaptureStatusBarManager activateApp](self, "activateApp");
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __94__SFMediaCaptureStatusBarManager_statusBarCoordinator_receivedTapWithContext_completionBlock___block_invoke;
  v11[3] = &unk_1E21E25E0;
  v12 = WeakRetained;
  v13 = v6;
  v8 = v6;
  v9 = WeakRetained;
  dispatch_async(MEMORY[0x1E0C80D38], v11);

  return 1;
}

uint64_t __94__SFMediaCaptureStatusBarManager_statusBarCoordinator_receivedTapWithContext_completionBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "statusBarIndicatorTappedWithCompletionHandler:", *(_QWORD *)(a1 + 40));
}

- (void)statusBarCoordinator:(id)a3 invalidatedRegistrationWithError:(id)a4
{
  id v5;
  id WeakRetained;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_recordingDocument);
  v7 = WBS_LOG_CHANNEL_PREFIXMediaCapture();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    objc_msgSend(v5, "safari_privacyPreservingDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v9;
    _os_log_impl(&dword_18B7B2000, v8, OS_LOG_TYPE_DEFAULT, "Status bar coordinator invalidated: %{public}@", (uint8_t *)&v10, 0xCu);

  }
  if (WeakRetained)
  {
    if (self->_hasStatusBarOverride)
      -[SFMediaCaptureStatusBarManager _releaseStatusBarOverride](self, "_releaseStatusBarOverride");
    -[SFMediaCaptureStatusBarManager _didInvalidateStatusBarOverride](self, "_didInvalidateStatusBarOverride");
  }

}

- (NSString)statusString
{
  return self->_statusString;
}

- (BOOL)_hasStatusBarOverride
{
  return self->_hasStatusBarOverride;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_recordingDocument);
  objc_storeStrong((id *)&self->_statusString, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_statusBarStyleOverride, 0);
}

void __73__SFMediaCaptureStatusBarManager__acquireStatusBarOverrideWithAudioOnly___block_invoke_cold_1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_18B7B2000, v3, OS_LOG_TYPE_ERROR, "Could not register tap handler for status bar override: %{public}@", (uint8_t *)&v5, 0xCu);

}

- (void)_didAcquireStatusBarOverrideSuccessfully:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7(&dword_18B7B2000, a1, a3, "Unable to acquire status bar override", a5, a6, a7, a8, 0);
}

@end
