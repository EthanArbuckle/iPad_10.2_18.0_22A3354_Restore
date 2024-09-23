@implementation LNRuntimeAssertionsTakingConnectionOperation

- (LNRuntimeAssertionsTakingConnectionOperation)initWithIdentifier:(id)a3 connectionInterface:(id)a4 systemProtocols:(id)a5 priority:(int64_t)a6 queue:(id)a7 activity:(id)a8
{
  id v14;
  LNRuntimeAssertionsTakingConnectionOperation *v15;
  id v16;
  NSSet *v17;
  void *v18;
  int v19;
  void *v20;
  int v21;
  NSSet *runtimeAssertions;
  LNRuntimeAssertionsTakingConnectionOperation *v23;
  objc_super v25;

  v14 = a5;
  v25.receiver = self;
  v25.super_class = (Class)LNRuntimeAssertionsTakingConnectionOperation;
  v15 = -[LNInterfaceConnectionOperation initWithIdentifier:connectionInterface:priority:queue:activity:](&v25, sel_initWithIdentifier_connectionInterface_priority_queue_activity_, a3, a4, a6, a7, a8);
  if (v15)
  {
    v16 = v14;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v17 = (NSSet *)objc_claimAutoreleasedReturnValue();
    -[NSSet addObject:](v17, "addObject:", CFSTR("com.apple.link.runtimeAssertion.Location"));
    objc_msgSend(MEMORY[0x1E0D43E18], "audioRecordingProtocol");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v16, "containsObject:", v18);

    if (v19)
      -[NSSet addObject:](v17, "addObject:", CFSTR("com.apple.link.runtimeAssertion.AudioRecording"));
    objc_msgSend(MEMORY[0x1E0D43E18], "audioStartingProtocol");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v16, "containsObject:", v20);

    if (v21)
      -[NSSet addObject:](v17, "addObject:", CFSTR("com.apple.link.runtimeAssertion.AudioPlayback"));

    runtimeAssertions = v15->_runtimeAssertions;
    v15->_runtimeAssertions = v17;

    v23 = v15;
  }

  return v15;
}

- (void)acquireRuntimeAssertions
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  void **v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  const char *v16;
  NSObject *v17;
  os_log_type_t v18;
  void *v19;
  int v20;
  NSObject *v21;
  void *v22;
  void *v23;
  int v24;
  NSObject *v25;
  void *v26;
  int v27;
  NSObject *v28;
  void *v29;
  void *v30;
  id v31;
  __int128 buf;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  -[LNConnectionOperation connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[LNRuntimeAssertionsTakingConnectionOperation runtimeAssertions](self, "runtimeAssertions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", CFSTR("com.apple.link.runtimeAssertion.AudioPlayback"));

  if (v6)
  {
    getLNLogCategoryConnection();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v4;
      _os_log_impl(&dword_1A18F6000, v7, OS_LOG_TYPE_DEBUG, "Acquiring audio playback assertion for %@", (uint8_t *)&buf, 0xCu);
    }

    objc_msgSend(getAVSystemControllerClass(), "sharedAVSystemController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v33 = 0x2020000000;
    v9 = (void **)getAVSystemController_AllowAppToInitiatePlaybackTemporarilyAttributeSymbolLoc_ptr;
    v34 = getAVSystemController_AllowAppToInitiatePlaybackTemporarilyAttributeSymbolLoc_ptr;
    if (!getAVSystemController_AllowAppToInitiatePlaybackTemporarilyAttributeSymbolLoc_ptr)
    {
      v10 = MediaExperienceLibrary();
      v9 = (void **)dlsym(v10, "AVSystemController_AllowAppToInitiatePlaybackTemporarilyAttribute");
      *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v9;
      getAVSystemController_AllowAppToInitiatePlaybackTemporarilyAttributeSymbolLoc_ptr = (uint64_t)v9;
    }
    _Block_object_dispose(&buf, 8);
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getAVSystemController_AllowAppToInitiatePlaybackTemporarilyAttribute(void)");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "handleFailureInFunction:file:lineNumber:description:", v30, CFSTR("LNRuntimeAssertionsTakingConnectionOperation.m"), 22, CFSTR("%s"), dlerror());

      __break(1u);
    }
    v11 = *v9;
    v31 = 0;
    v12 = v11;
    objc_msgSend(v8, "setAttribute:forKey:error:", v4, v12, &v31);
    v13 = v31;

    getLNLogCategoryConnection();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v13)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v13;
        v16 = "Failed to acquire audio playback assertion: %@";
        v17 = v15;
        v18 = OS_LOG_TYPE_ERROR;
LABEL_12:
        _os_log_impl(&dword_1A18F6000, v17, v18, v16, (uint8_t *)&buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v4;
      v16 = "Acquired audio playback assertion for %@";
      v17 = v15;
      v18 = OS_LOG_TYPE_DEBUG;
      goto LABEL_12;
    }

  }
  -[LNRuntimeAssertionsTakingConnectionOperation runtimeAssertions](self, "runtimeAssertions");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "containsObject:", CFSTR("com.apple.link.runtimeAssertion.Location"));

  if (v20)
  {
    getLNLogCategoryConnection();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v4;
      _os_log_impl(&dword_1A18F6000, v21, OS_LOG_TYPE_DEBUG, "Acquiring CLInUseAssertion for %@", (uint8_t *)&buf, 0xCu);
    }

    v22 = (void *)objc_msgSend(MEMORY[0x1E0C9E3A8], "newAssertionForBundleIdentifier:withReason:level:", v4, CFSTR("User is directly engaging with the app by running a Link action"), 1);
    -[LNRuntimeAssertionsTakingConnectionOperation setLocationAssertion:](self, "setLocationAssertion:", v22);

  }
  -[LNRuntimeAssertionsTakingConnectionOperation runtimeAssertions](self, "runtimeAssertions");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "containsObject:", CFSTR("com.apple.link.runtimeAssertion.AudioRecording"));

  if (v24)
  {
    getLNLogCategoryConnection();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v4;
      _os_log_impl(&dword_1A18F6000, v25, OS_LOG_TYPE_DEBUG, "Acquiring audio recording assertion for %@", (uint8_t *)&buf, 0xCu);
    }

    objc_msgSend(getAVSystemControllerClass(), "sharedAVSystemController");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "allowAppToInitiateRecordingTemporarily:", v4);

    if (v27)
    {
      getLNLogCategoryConnection();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 67109120;
        DWORD1(buf) = v27;
        _os_log_impl(&dword_1A18F6000, v28, OS_LOG_TYPE_ERROR, "Failed to acquire audio recording assertion: %d. Are you entitled correctly?", (uint8_t *)&buf, 8u);
      }

    }
  }

}

- (NSSet)runtimeAssertions
{
  return self->_runtimeAssertions;
}

- (void)setLocationAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_locationAssertion, a3);
}

- (void)invalidateRuntimeAssertions
{
  id v2;

  -[LNRuntimeAssertionsTakingConnectionOperation locationAssertion](self, "locationAssertion");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

}

- (CLInUseAssertion)locationAssertion
{
  return self->_locationAssertion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationAssertion, 0);
  objc_storeStrong((id *)&self->_runtimeAssertions, 0);
}

- (void)setRuntimeAssertions:(id)a3
{
  objc_storeStrong((id *)&self->_runtimeAssertions, a3);
}

@end
