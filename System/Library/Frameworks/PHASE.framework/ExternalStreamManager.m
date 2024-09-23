@implementation ExternalStreamManager

- (ExternalStreamManager)initWithTaskManager:(void *)a3 engineMode:(int64_t)a4 engineFormat:(id)a5 maximumFramesToRender:(unsigned int)a6 enableAudioIssueDetector:(BOOL)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  objc_super v17;

  v12 = a5;
  v17.receiver = self;
  v17.super_class = (Class)ExternalStreamManager;
  v13 = -[ExternalStreamManager init](&v17, sel_init);
  if (v13)
  {
    v14 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v15 = (void *)*((_QWORD *)v13 + 1);
    *((_QWORD *)v13 + 1) = v14;

    *((_QWORD *)v13 + 2) = Phase::Controller::TaskManager::GetService<Phase::Controller::VoiceManager>((Phase::Logger *)a3, 8);
    *((_QWORD *)v13 + 3) = Phase::Controller::TaskManager::GetService<Phase::Controller::SessionManager>((Phase::Logger *)a3, 20);
    objc_storeStrong((id *)v13 + 4, a5);
    *((_DWORD *)v13 + 10) = a6;
    *((_BYTE *)v13 + 44) = a7;
  }

  return (ExternalStreamManager *)v13;
}

- (void)removeAllResourcesAttributedToClientID:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t k;
  uint64_t v23;
  void *v24;
  void *v25;
  int v26;
  id obj;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  ExternalStreamManager *v33;
  void *v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v35 = a3;
  v33 = self;
  v4 = (void *)objc_msgSend(*((id *)self + 1), "copy");
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v29 = v4;
  objc_msgSend(v4, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
  if (v30)
  {
    v28 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v30; ++i)
      {
        if (*(_QWORD *)v45 != v28)
          objc_enumerationMutation(obj);
        v5 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i);
        objc_msgSend(v29, "objectForKey:", v5);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "controllingClientID");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "isEqual:", v35);

        if (v7)
          -[ExternalStreamManager abandonControlOfExternalStreamGroupID:withCallback:](v33, "abandonControlOfExternalStreamGroupID:withCallback:", v5, &__block_literal_global_1);
        objc_msgSend(v32, "outputStreams");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = (void *)objc_msgSend(v8, "copy");

        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
        objc_msgSend(v34, "allKeys");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
        if (v10)
        {
          v11 = *(_QWORD *)v41;
          do
          {
            for (j = 0; j != v10; ++j)
            {
              if (*(_QWORD *)v41 != v11)
                objc_enumerationMutation(v9);
              v13 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * j);
              objc_msgSend(v34, "objectForKey:", v13);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "attributedClientID");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(v15, "isEqual:", v35);

              if (v16)
                -[ExternalStreamManager removeExternalOutputStreamGroupID:streamID:withCallback:](v33, "removeExternalOutputStreamGroupID:streamID:withCallback:", v5, v13, &__block_literal_global_111);

            }
            v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
          }
          while (v10);
        }

        objc_msgSend(v32, "inputStreams");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)objc_msgSend(v17, "copy");

        v38 = 0u;
        v39 = 0u;
        v36 = 0u;
        v37 = 0u;
        objc_msgSend(v18, "allKeys");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
        if (v20)
        {
          v21 = *(_QWORD *)v37;
          do
          {
            for (k = 0; k != v20; ++k)
            {
              if (*(_QWORD *)v37 != v21)
                objc_enumerationMutation(v19);
              v23 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * k);
              objc_msgSend(v18, "objectForKey:", v23);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "attributedClientID");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = objc_msgSend(v25, "isEqual:", v35);

              if (v26)
                -[ExternalStreamManager removeExternalInputStreamGroupID:streamID:](v33, "removeExternalInputStreamGroupID:streamID:", v5, v23);

            }
            v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
          }
          while (v20);
        }

      }
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
    }
    while (v30);
  }

}

- (void)addExternalOutputStreamGroupID:(id)a3 streamID:(id)a4 attributedTo:(id)a5 definition:(id)a6 startsPaused:(BOOL)a7 renderBlock:(id)a8 withCallback:(id)a9
{
  _BOOL8 v10;
  id v15;
  id v16;
  id v17;
  Phase *v18;
  _BOOL4 IsFeatureEnabled_SessionBasedMuting;
  ManagedStreamGroup *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  Phase::Logger *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  ManagedOutputStream *v31;
  Phase::Logger *v32;
  NSObject *v33;
  void *v34;
  BOOL v35;
  void (**v36)(_QWORD, _QWORD, _QWORD, _QWORD);
  id v37;
  id v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  id v44;
  __int16 v45;
  id v46;
  uint64_t v47;
  _QWORD v48[2];

  v10 = a7;
  v48[1] = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v16 = a4;
  v37 = a5;
  v38 = a6;
  v17 = a8;
  v18 = (Phase *)a9;
  IsFeatureEnabled_SessionBasedMuting = Phase::IsFeatureEnabled_SessionBasedMuting(v18);
  if (IsFeatureEnabled_SessionBasedMuting)
    os_unfair_recursive_lock_lock_with_options();
  objc_msgSend(*((id *)self + 1), "objectForKey:", v15);
  v20 = (ManagedStreamGroup *)objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
    v20 = objc_alloc_init(ManagedStreamGroup);
    objc_msgSend(*((id *)self + 1), "setObject:forKey:", v20, v15);
  }
  -[ManagedStreamGroup outputStreams](v20, "outputStreams");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectForKey:", v16);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    v23 = *MEMORY[0x24BDD0FC8];
    v47 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("stream group %@ already has output stream %@"), v15, v16);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = v24;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v48, &v47, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v26)
                                                                                        + 432)));
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v25, "objectForKeyedSubscript:", v23);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v40 = "ExternalStreamManager.mm";
      v41 = 1024;
      v42 = 301;
      v43 = 2112;
      v44 = v28;
      _os_log_impl(&dword_2164CC000, v27, OS_LOG_TYPE_ERROR, "%25s:%-5d %@", buf, 0x1Cu);

    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.phase"), 1346925413, v25);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[ManagedStreamGroup outputStreams](v20, "outputStreams");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = -[ManagedOutputStream initWithPaused:attributedTo:definition:renderBlock:]([ManagedOutputStream alloc], "initWithPaused:attributedTo:definition:renderBlock:", v10, v37, v38, v17);
    objc_msgSend(v30, "setObject:forKey:", v31, v16);

    v33 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v32) + 912));
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v40 = "ExternalStreamManager.mm";
      v41 = 1024;
      v42 = 312;
      v43 = 2112;
      v44 = v16;
      v45 = 2112;
      v46 = v15;
      _os_log_impl(&dword_2164CC000, v33, OS_LOG_TYPE_DEFAULT, "%25s:%-5d added external output stream %@ to group %@", buf, 0x26u);
    }
    v29 = 0;
  }
  (*((void (**)(Phase *, void *))v18 + 2))(v18, v29);
  if (!v29)
  {
    -[ManagedStreamGroup stateChangeBlock](v20, "stateChangeBlock");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v34 == 0;

    if (!v35)
    {
      -[ManagedStreamGroup stateChangeBlock](v20, "stateChangeBlock");
      v36 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id, id, _QWORD))v36)[2](v36, v15, v16, 0);

    }
  }

  if (IsFeatureEnabled_SessionBasedMuting)
    os_unfair_recursive_lock_unlock();

}

- (BOOL)addExternalInputStreamGroupID:(id)a3 streamID:(id)a4 attributedTo:(id)a5 definition:(id)a6 isPaused:(BOOL)a7 canRecord:(BOOL)a8 fader:(shared_ptr<caulk:(id)a10 :(id *)a11 synchronized<Phase::Controller::ExternalStreamFader>>)a9 pauseStateDidUpdateCallback:error:
{
  _BOOL8 v11;
  _BOOL8 v12;
  id v17;
  id v18;
  _BOOL4 IsFeatureEnabled_SessionBasedMuting;
  ManagedStreamGroup *v20;
  void *v21;
  void *v22;
  BOOL v23;
  uint64_t v24;
  void *v25;
  void *v26;
  Phase::Logger *v27;
  NSObject *v28;
  void *v29;
  id v30;
  ManagedInputStream *v31;
  std::__shared_weak_count *v32;
  unint64_t *p_shared_owners;
  unint64_t v34;
  Phase *v35;
  std::__shared_weak_count *v36;
  unint64_t *v37;
  unint64_t v38;
  unsigned __int16 SessionInputMuteState;
  int v40;
  void *v41;
  Phase::Logger *v42;
  NSObject *v43;
  const char *v44;
  int v46;
  _BOOL4 v47;
  id v48;
  __shared_weak_count *v49;
  id v50;
  uint64_t v51;
  std::__shared_weak_count *v52;
  uint8_t buf[4];
  const char *v54;
  __int16 v55;
  int v56;
  __int16 v57;
  id v58;
  __int16 v59;
  id v60;
  __int16 v61;
  _BOOL4 v62;
  __int16 v63;
  const char *v64;
  uint64_t v65;
  _QWORD v66[3];

  v11 = a8;
  v12 = a7;
  v66[1] = *MEMORY[0x24BDAC8D0];
  v17 = a3;
  v18 = a4;
  v48 = a5;
  v50 = a6;
  v49 = a9.__cntrl_;
  IsFeatureEnabled_SessionBasedMuting = Phase::IsFeatureEnabled_SessionBasedMuting((Phase *)v49);
  if (IsFeatureEnabled_SessionBasedMuting)
    os_unfair_recursive_lock_lock_with_options();
  v47 = IsFeatureEnabled_SessionBasedMuting;
  objc_msgSend(*((id *)self + 1), "objectForKey:", v17);
  v20 = (ManagedStreamGroup *)objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
    v20 = objc_alloc_init(ManagedStreamGroup);
    objc_msgSend(*((id *)self + 1), "setObject:forKey:");
  }
  -[ManagedStreamGroup inputStreams](v20, "inputStreams");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectForKey:", v18);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22 == 0;

  if (v22)
  {
    v24 = *MEMORY[0x24BDD0FC8];
    v65 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("stream group %@ already has input stream %@"), v17, v18);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v66[0] = v25;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v66, &v65, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v27)
                                                                                        + 432)));
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v26, "objectForKeyedSubscript:", v24);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v54 = "ExternalStreamManager.mm";
      v55 = 1024;
      v56 = 349;
      v57 = 2112;
      v58 = v29;
      _os_log_impl(&dword_2164CC000, v28, OS_LOG_TYPE_ERROR, "%25s:%-5d %@", buf, 0x1Cu);

    }
    if (a10)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.phase"), 1346925413, v26);
      v30 = (id)objc_claimAutoreleasedReturnValue();
LABEL_32:
      *(_QWORD *)a10 = v30;
      goto LABEL_35;
    }
    goto LABEL_34;
  }
  v31 = [ManagedInputStream alloc];
  v32 = (std::__shared_weak_count *)*((_QWORD *)a9.__ptr_ + 1);
  v51 = *(_QWORD *)a9.__ptr_;
  v52 = v32;
  if (v32)
  {
    p_shared_owners = (unint64_t *)&v32->__shared_owners_;
    do
      v34 = __ldxr(p_shared_owners);
    while (__stxr(v34 + 1, p_shared_owners));
  }
  v35 = -[ManagedInputStream initWithPaused:attributedTo:definition:canRecord:fader:pauseStateDidUpdateCallback:](v31, "initWithPaused:attributedTo:definition:canRecord:fader:pauseStateDidUpdateCallback:", v12, v48, v50, v11, &v51, v49);
  v26 = v35;
  v36 = v52;
  if (v52)
  {
    v37 = (unint64_t *)&v52->__shared_owners_;
    do
      v38 = __ldaxr(v37);
    while (__stlxr(v38 - 1, v37));
    if (!v38)
    {
      ((void (*)(std::__shared_weak_count *))v36->__on_zero_shared)(v36);
      std::__shared_weak_count::__release_weak(v36);
    }
  }
  if (Phase::IsFeatureEnabled_SessionBasedMuting(v35))
  {
    SessionInputMuteState = Phase::Controller::SessionManager::GetSessionInputMuteState(*((id **)self + 3), objc_msgSend(v50, "audioSessionToken"), 0);
    v40 = SessionInputMuteState;
    if (SessionInputMuteState >= 0x100u)
    {
      objc_msgSend(v26, "setIsMuted:", SessionInputMuteState != 0);
      v46 = 0;
      goto LABEL_23;
    }
  }
  else
  {
    v40 = 0;
  }
  v46 = 1;
LABEL_23:
  -[ManagedStreamGroup inputStreams](v20, "inputStreams");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setObject:forKey:", v26, v18);

  v42 = (Phase::Logger *)-[ExternalStreamManager _setPauseExternalInputStreamWithoutNotifyingClient:isPaused:fromPlatformCallback:error:](self, "_setPauseExternalInputStreamWithoutNotifyingClient:isPaused:fromPlatformCallback:error:", v26, v12, 0, a10);
  if ((v42 & 1) == 0)
  {
    -[ExternalStreamManager removeExternalInputStreamGroupID:streamID:](self, "removeExternalInputStreamGroupID:streamID:", v17, v18);
LABEL_34:
    v23 = 0;
    goto LABEL_35;
  }
  v43 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v42) + 912));
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    v44 = "MUTED";
    *(_DWORD *)buf = 136316418;
    v54 = "ExternalStreamManager.mm";
    v55 = 1024;
    v56 = 390;
    if (!v40)
      v44 = "UNMUTED";
    v57 = 2112;
    v58 = v18;
    v59 = 2112;
    if (v46)
      v44 = "UNKNOWN";
    v60 = v17;
    v61 = 1024;
    v62 = v12;
    v63 = 2080;
    v64 = v44;
    _os_log_impl(&dword_2164CC000, v43, OS_LOG_TYPE_DEFAULT, "%25s:%-5d added external input stream %@ to group %@ with initial pause state %d initial input mute state %s", buf, 0x36u);
  }
  if (a10)
  {
    v30 = 0;
    goto LABEL_32;
  }
  v23 = 1;
LABEL_35:

  if (v47)
    os_unfair_recursive_lock_unlock();

  return v23;
}

- (void)removeExternalInputStreamGroupID:(id)a3 streamID:(id)a4
{
  id v6;
  Phase *v7;
  _BOOL4 IsFeatureEnabled_SessionBasedMuting;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  Phase::Logger *v13;
  void *v14;
  Phase::Logger *v15;
  NSObject *v16;
  void **v17;
  void *v18;
  Phase::Logger *v19;
  NSObject *v20;
  void *v21;
  int v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  const char *v26;
  NSObject *v27;
  os_log_type_t v28;
  uint32_t v29;
  void *v30;
  void *v31;
  _BOOL4 v32;
  NSObject *v33;
  int v34;
  const char *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  Phase *v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (Phase *)a4;
  IsFeatureEnabled_SessionBasedMuting = Phase::IsFeatureEnabled_SessionBasedMuting(v7);
  if (IsFeatureEnabled_SessionBasedMuting)
    os_unfair_recursive_lock_lock_with_options();
  objc_msgSend(*((id *)self + 1), "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "inputStreams");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v10, "inputStreams");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "removeObjectForKey:", v7);

      v16 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v15) + 912));
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v34 = 136315906;
        v35 = "ExternalStreamManager.mm";
        v36 = 1024;
        v37 = 419;
        v38 = 2112;
        v39 = v7;
        v40 = 2112;
        v41 = v6;
        _os_log_impl(&dword_2164CC000, v16, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Removed external input stream %@ from group %@.", (uint8_t *)&v34, 0x26u);
      }
      v17 = (void **)*((_QWORD *)self + 3);
      objc_msgSend(v12, "definition");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v17) = Phase::Controller::SessionManager::SetSessionPlayState(v17, objc_msgSend(v18, "audioSessionToken"), (uint64_t)v12, 1u, 0, 0, 0);

      if ((v17 & 1) == 0)
      {
        v20 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v19)
                                                                                            + 912)));
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v12, "definition");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "audioSessionToken");
          v34 = 136315650;
          v35 = "ExternalStreamManager.mm";
          v36 = 1024;
          v37 = 430;
          v38 = 1024;
          LODWORD(v39) = v22;
          _os_log_impl(&dword_2164CC000, v20, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Failed to stop audio session 0x%x while removing input stream (potentially invalid)", (uint8_t *)&v34, 0x18u);

        }
      }
      objc_msgSend(v10, "outputStreams");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v23, "count"))
      {

LABEL_23:
        goto LABEL_24;
      }
      objc_msgSend(v10, "inputStreams");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v30, "count"))
      {

        goto LABEL_23;
      }
      objc_msgSend(v10, "controllingClientID");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v31 == 0;

      if (!v32)
        goto LABEL_23;
      v33 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)objc_msgSend(*((id *)self + 1), "removeObjectForKey:", v6))
                                                       + 912));
      if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        goto LABEL_23;
      v34 = 136315650;
      v35 = "ExternalStreamManager.mm";
      v36 = 1024;
      v37 = 437;
      v38 = 2112;
      v39 = (Phase *)v6;
      v26 = "%25s:%-5d Removed external stream group %@";
      v27 = v33;
      v28 = OS_LOG_TYPE_DEFAULT;
      v29 = 28;
    }
    else
    {
      v25 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v13) + 912));
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        goto LABEL_23;
      v34 = 136315906;
      v35 = "ExternalStreamManager.mm";
      v36 = 1024;
      v37 = 414;
      v38 = 2112;
      v39 = v7;
      v40 = 2112;
      v41 = v6;
      v26 = "%25s:%-5d Could not find stream %@ to remove in group %@.";
      v27 = v25;
      v28 = OS_LOG_TYPE_ERROR;
      v29 = 38;
    }
    _os_log_impl(&dword_2164CC000, v27, v28, v26, (uint8_t *)&v34, v29);
    goto LABEL_23;
  }
  v24 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(0) + 912));
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    v34 = 136315650;
    v35 = "ExternalStreamManager.mm";
    v36 = 1024;
    v37 = 407;
    v38 = 2112;
    v39 = (Phase *)v6;
    _os_log_impl(&dword_2164CC000, v24, OS_LOG_TYPE_ERROR, "%25s:%-5d Could not find stream group %@ to remove.", (uint8_t *)&v34, 0x1Cu);
  }
LABEL_24:

  if (IsFeatureEnabled_SessionBasedMuting)
    os_unfair_recursive_lock_unlock();

}

- (void)setMuteExternalInputStreamGroupID:(id)a3 streamID:(id)a4 isMuted:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  Phase *v9;
  _BOOL4 IsFeatureEnabled_SessionBasedMuting;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  Phase::Logger *v15;
  NSObject *v16;
  const char *v17;
  void *v18;
  uint64_t v19;
  int v20;
  NSObject *v21;
  NSObject *v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  id v28;
  __int16 v29;
  Phase *v30;
  uint64_t v31;

  v5 = a5;
  v31 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (Phase *)a4;
  IsFeatureEnabled_SessionBasedMuting = Phase::IsFeatureEnabled_SessionBasedMuting(v9);
  if (IsFeatureEnabled_SessionBasedMuting)
    os_unfair_recursive_lock_lock_with_options();
  objc_msgSend(*((id *)self + 1), "objectForKey:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "inputStreams");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v16 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v15) + 912));
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = "False";
        v24 = "ExternalStreamManager.mm";
        v25 = 1024;
        v26 = 472;
        *(_DWORD *)buf = 136315906;
        if (v5)
          v17 = "True";
        v27 = 2080;
        v28 = (id)v17;
        v29 = 2112;
        v30 = v9;
        _os_log_impl(&dword_2164CC000, v16, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Setting Mute %s state on external input stream %@", buf, 0x26u);
      }
      objc_msgSend(v14, "definition");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "audioSessionToken");

      objc_msgSend(v14, "setIsMuted:", v5);
      v20 = 0;
    }
    else
    {
      v22 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v15) + 912));
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v24 = "ExternalStreamManager.mm";
        v25 = 1024;
        v26 = 467;
        v27 = 2112;
        v28 = v9;
        _os_log_impl(&dword_2164CC000, v22, OS_LOG_TYPE_ERROR, "%25s:%-5d Could not find stream %@ to mute.", buf, 0x1Cu);
      }
      v19 = 0;
      v20 = 1;
    }

  }
  else
  {
    v21 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(0) + 912));
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v24 = "ExternalStreamManager.mm";
      v25 = 1024;
      v26 = 460;
      v27 = 2112;
      v28 = v8;
      _os_log_impl(&dword_2164CC000, v21, OS_LOG_TYPE_ERROR, "%25s:%-5d Could not find stream group %@ to mute.", buf, 0x1Cu);
    }
    v14 = 0;
    v19 = 0;
    v20 = 1;
  }

  if (IsFeatureEnabled_SessionBasedMuting)
    os_unfair_recursive_lock_unlock();
  if (!v20)
    Phase::Controller::SessionManager::SetSessionInputMuteState(*((void ***)self + 3), v19, v14, v5, 0);

}

- (void)_setSessionInputStreamState:(id)a3 muted:(BOOL)a4 fromPlatformCallback:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  uint64_t v8;
  int v9;
  int v10;
  void **v11;
  void *v12;
  id v13;

  v5 = a5;
  v6 = a4;
  v13 = a3;
  if (objc_msgSend(v13, "isStreamPaused"))
    v8 = 2;
  else
    v8 = 1;
  if (objc_msgSend(v13, "canRecord"))
    v9 = 1;
  else
    v9 = 9;
  if (v6)
    v10 = 4;
  else
    v10 = 0;
  v11 = (void **)*((_QWORD *)self + 3);
  objc_msgSend(v13, "definition");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  Phase::Controller::SessionManager::SetSessionPlayState(v11, objc_msgSend(v12, "audioSessionToken"), (uint64_t)v13, v9 | v10, v8, v5, 0);

}

- (unint64_t)_fadeInputStreamsInSessionToken:(unsigned int)a3 isMuted:(BOOL)a4 fadeTimeInSeconds:(float)a5 synchronous:(BOOL)a6
{
  _BOOL4 v7;
  uint64_t v9;
  unint64_t v10;
  const char *v11;
  double v12;
  float v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  uint64_t v24;
  Phase::Logger *v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  NSObject *v29;
  float v30;
  _QWORD *v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  _BOOL8 v35;
  id obj;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  const char *v41;
  _BOOL4 v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  float v53[2];
  __int128 v54;
  uint64_t v55;
  void **v56;
  _BYTE lock[28];
  __int16 v58;
  _BYTE v59[14];
  _BYTE v60[128];
  _BYTE v61[128];
  _QWORD v62[3];
  _QWORD *v63;
  uint64_t v64;

  v43 = a6;
  v7 = a4;
  v64 = *MEMORY[0x24BDAC8D0];
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  objc_msgSend(*((id *)self + 1), "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
  if (v9)
  {
    v10 = 0;
    v38 = *(_QWORD *)v50;
    v39 = v9;
    v11 = "Unmuting";
    if (v7)
      v11 = "Muting";
    v41 = v11;
    v12 = a5;
    if (v7)
      v13 = 0.0;
    else
      v13 = 1.0;
    if (a5 < 0.0)
      a5 = 0.0;
    while (1)
    {
      for (i = 0; i != v39; ++i)
      {
        if (*(_QWORD *)v50 != v38)
          objc_enumerationMutation(obj);
        objc_msgSend(*((id *)self + 1), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = 0u;
        v48 = 0u;
        v45 = 0u;
        v46 = 0u;
        objc_msgSend(v14, "inputStreams");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "allKeys");
        v44 = (id)objc_claimAutoreleasedReturnValue();

        v16 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v45, v60, 16);
        if (v16)
        {
          v17 = *(_QWORD *)v46;
          do
          {
            for (j = 0; j != v16; ++j)
            {
              if (*(_QWORD *)v46 != v17)
                objc_enumerationMutation(v44);
              v19 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * j);
              objc_msgSend(v14, "inputStreams");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "objectForKey:", v19);
              v21 = (void *)objc_claimAutoreleasedReturnValue();

              if (v21)
              {
                objc_msgSend(v21, "definition");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                v23 = objc_msgSend(v22, "audioSessionToken") == a3;

                if (v23)
                {
                  objc_msgSend(v21, "fader");
                  v24 = *(_QWORD *)lock;
                  os_unfair_lock_lock(*(os_unfair_lock_t *)lock);
                  v26 = *(std::__shared_weak_count **)&lock[8];
                  if (*(_QWORD *)&lock[8])
                  {
                    v27 = (unint64_t *)(*(_QWORD *)&lock[8] + 8);
                    do
                      v28 = __ldaxr(v27);
                    while (__stlxr(v28 - 1, v27));
                    if (!v28)
                    {
                      ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
                      std::__shared_weak_count::__release_weak(v26);
                    }
                  }
                  v29 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v25) + 912));
                  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)lock = 136316162;
                    *(_QWORD *)&lock[4] = "ExternalStreamManager.mm";
                    *(_WORD *)&lock[12] = 1024;
                    *(_DWORD *)&lock[14] = 515;
                    *(_WORD *)&lock[18] = 2080;
                    *(_QWORD *)&lock[20] = v41;
                    v58 = 1024;
                    *(_DWORD *)v59 = a3;
                    *(_WORD *)&v59[4] = 2048;
                    *(double *)&v59[6] = v12;
                    _os_log_impl(&dword_2164CC000, v29, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s input for session %d over %f seconds.", lock, 0x2Cu);
                  }
                  *(float *)(v24 + 52) = v13;
                  v62[0] = &unk_24D579958;
                  v62[1] = Phase::CurveFunction::Linear<float>;
                  v63 = v62;
                  if (a5 == 0.0)
                  {
                    *(float *)(v24 + 40) = v13;
                    v30 = v13;
                  }
                  else
                  {
                    v30 = *(float *)(v24 + 40);
                  }
                  v53[0] = 0.0;
                  v53[1] = v30;
                  *(float *)lock = a5;
                  *(float *)&lock[4] = v13;
                  *(_QWORD *)&v59[2] = &lock[8];
                  *(_QWORD *)&lock[8] = &unk_24D579958;
                  *(_QWORD *)&lock[16] = Phase::CurveFunction::Linear<float>;
                  Phase::Envelope<float>::Envelope((Phase::Logger *)&v54, v53, (float *)lock);
                  std::vector<Phase::Envelope<float>::SegmentInternal,std::allocator<Phase::Envelope<float>::SegmentInternal>>::__vdeallocate((void **)(v24 + 8));
                  *(_OWORD *)(v24 + 8) = v54;
                  *(_QWORD *)(v24 + 24) = v55;
                  v54 = 0uLL;
                  v55 = 0;
                  v56 = (void **)&v54;
                  std::vector<Phase::Envelope<double>::Segment,std::allocator<Phase::Envelope<double>::Segment>>::__destroy_vector::operator()[abi:ne180100](&v56);
                  v31 = *(_QWORD **)&v59[2];
                  if (*(_BYTE **)&v59[2] == &lock[8])
                  {
                    v31 = &lock[8];
                    v32 = 4;
LABEL_33:
                    (*(void (**)(void))(*v31 + 8 * v32))();
                  }
                  else if (*(_QWORD *)&v59[2])
                  {
                    v32 = 5;
                    goto LABEL_33;
                  }
                  *(_DWORD *)(v24 + 32) = 0;
                  v33 = v63;
                  if (v63 == v62)
                  {
                    v33 = v62;
                    v34 = 4;
LABEL_38:
                    (*(void (**)(void))(*v33 + 8 * v34))();
                  }
                  else if (v63)
                  {
                    v34 = 5;
                    goto LABEL_38;
                  }
                  objc_msgSend(v21, "setIsFading:", 1);
                  if (v43)
                  {
                    v35 = (objc_msgSend(v21, "isMuted") & 1) != 0 || *(float *)(v24 + 52) == 0.0;
                    -[ExternalStreamManager _setSessionInputStreamState:muted:fromPlatformCallback:](self, "_setSessionInputStreamState:muted:fromPlatformCallback:", v21, v35, 1);
                  }
                  ++v10;
                  os_unfair_lock_unlock((os_unfair_lock_t)v24);
                }
              }

            }
            v16 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v45, v60, 16);
          }
          while (v16);
        }

      }
      v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
      if (!v39)
        goto LABEL_51;
    }
  }
  v10 = 0;
LABEL_51:

  return v10;
}

- (unint64_t)setExternalInputStreamSessionMute:(unsigned int)a3 isMuted:(BOOL)a4 fadeTimeInSeconds:(float)a5
{
  _BOOL8 v6;
  uint64_t v7;
  uint64_t IsFeatureEnabled_SessionBasedMuting;
  int v10;
  double v11;
  unint64_t v12;
  ExternalStreamManager *v14;
  uint64_t v15;
  _DWORD *v16;
  NSObject *v17;
  Phase::Logger *InstancePtr;
  NSObject *v19;
  std::runtime_error *exception;
  BOOL v21;
  unint64_t v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  unint64_t v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v6 = a4;
  v7 = *(_QWORD *)&a3;
  v31 = *MEMORY[0x24BDAC8D0];
  IsFeatureEnabled_SessionBasedMuting = Phase::IsFeatureEnabled_SessionBasedMuting((Phase *)self);
  v10 = IsFeatureEnabled_SessionBasedMuting;
  if ((_DWORD)IsFeatureEnabled_SessionBasedMuting)
    IsFeatureEnabled_SessionBasedMuting = os_unfair_recursive_lock_lock_with_options();
  if (Phase::IsFeatureEnabled_SessionBasedMuting((Phase *)IsFeatureEnabled_SessionBasedMuting))
  {
    *(float *)&v11 = a5;
    v12 = -[ExternalStreamManager _fadeInputStreamsInSessionToken:isMuted:fadeTimeInSeconds:synchronous:](self, "_fadeInputStreamsInSessionToken:isMuted:fadeTimeInSeconds:synchronous:", v7, v6, 1, v11);
    if (v10)
LABEL_5:
      os_unfair_recursive_lock_unlock();
  }
  else
  {
    v14 = self;
    v15 = **((_QWORD **)v14 + 7);
    v22 = 0;
    v21 = 1;
    v16 = Phase::LockFreeQueueMPSC::GetWriteBuffer((Phase::LockFreeQueueMPSC *)v15, 32, &v22, &v21);
    if (!v16)
    {
      InstancePtr = (Phase::Logger *)Phase::Logger::GetInstancePtr(0);
      Phase::Logger::DumpTailspinWithThrottleAsync(InstancePtr, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
      v19 = objc_retainAutorelease(**(id **)(v15 + 48));
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v24 = "CommandQueue.hpp";
        v25 = 1024;
        v26 = 100;
        _os_log_impl(&dword_2164CC000, v19, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::runtime_error) [true is true]: \"CommandQueue unable to retrieve write buffer; buffe"
          "r is full, unable to grow.\",
          buf,
          0x12u);
      }
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
    }
    if (v21)
    {
      v17 = objc_retainAutorelease(**(id **)(v15 + 48));
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315906;
        v24 = "CommandQueue.hpp";
        v25 = 1024;
        v26 = 89;
        v27 = 2048;
        v28 = v22;
        v29 = 2048;
        v30 = 32;
        _os_log_impl(&dword_2164CC000, v17, OS_LOG_TYPE_DEBUG, "%25s:%-5d Warning: CommandQueue grew buffer to %zu bytes to accommodate extra %zu bytes - this usually means the system is under load or the command queue is too small.", buf, 0x26u);
      }
    }
    *(_QWORD *)v16 = &off_24D57CA90;
    *((_QWORD *)v16 + 1) = v14;
    v16[4] = v7;
    *((_BYTE *)v16 + 20) = v6;
    *((float *)v16 + 6) = a5;
    Phase::LockFreeQueueSPSC::CommitBytes((Phase::LockFreeQueueSPSC *)v15, 32);
    atomic_store(0, (unsigned __int8 *)(v15 + 40));

    v12 = 0;
    if (v10)
      goto LABEL_5;
  }
  return v12;
}

- (void)setExternalInputStreamSession:(unsigned int)a3 isActive:(BOOL)a4
{
  ExternalStreamManager *v5;
  _BOOL4 IsFeatureEnabled_SessionBasedMuting;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  BOOL v20;
  Phase::Logger *v21;
  Phase::Logger *v22;
  NSObject *v23;
  int v24;
  BOOL v25;
  Phase::Logger *v26;
  uint64_t v27;
  NSObject *v28;
  char *v29;
  _BOOL4 v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  ExternalStreamManager *v36;
  _BOOL4 v37;
  id obj;
  id v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t buf[4];
  const char *v50;
  __int16 v51;
  int v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  Phase::Logger *v56;
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v37 = a4;
  v5 = self;
  v59 = *MEMORY[0x24BDAC8D0];
  IsFeatureEnabled_SessionBasedMuting = Phase::IsFeatureEnabled_SessionBasedMuting((Phase *)self);
  if (IsFeatureEnabled_SessionBasedMuting)
  {
    v29 = (char *)v5 + 88;
    os_unfair_recursive_lock_lock_with_options();
  }
  else
  {
    v29 = 0;
  }
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v30 = IsFeatureEnabled_SessionBasedMuting;
  objc_msgSend(*((id *)v5 + 1), "allKeys", v29);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
  if (!v8)
    goto LABEL_33;
  v32 = *(_QWORD *)v46;
  v31 = v7;
  v36 = v5;
  do
  {
    v9 = 0;
    v33 = v8;
    do
    {
      if (*(_QWORD *)v46 != v32)
        objc_enumerationMutation(v7);
      v35 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * v9);
      objc_msgSend(*((id *)v5 + 1), "objectForKey:");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      objc_msgSend(v10, "inputStreams");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v9;
      objc_msgSend(v11, "allKeys");
      obj = (id)objc_claimAutoreleasedReturnValue();

      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v57, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v42;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v42 != v13)
              objc_enumerationMutation(obj);
            v15 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i);
            objc_msgSend(v10, "inputStreams");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "objectForKey:", v15);
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            if (v17)
            {
              objc_msgSend(v17, "definition");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = objc_msgSend(v18, "audioSessionToken") == a3;

              if (v19)
              {
                if (v37)
                {
                  if ((objc_msgSend(v17, "shouldResumeWithSession") & 1) == 0)
                    goto LABEL_29;
                  v40 = 0;
                  v20 = -[ExternalStreamManager _setPauseExternalInputStreamGroupID:streamID:isPaused:fromPlatformCallback:error:](v36, "_setPauseExternalInputStreamGroupID:streamID:isPaused:fromPlatformCallback:error:", v35, v15, 0, 1, &v40);
                  v21 = (Phase::Logger *)v40;
                  v22 = v21;
                  if (!v20)
                  {
                    v23 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v21) + 912));
                    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 136315906;
                      v50 = "ExternalStreamManager.mm";
                      v51 = 1024;
                      v52 = 594;
                      v53 = 2112;
                      v54 = v15;
                      v55 = 2112;
                      v56 = v22;
                      _os_log_impl(&dword_2164CC000, v23, OS_LOG_TYPE_ERROR, "%25s:%-5d failed to resume input stream %@ after session interruption: %@", buf, 0x26u);
                    }
                  }
                  objc_msgSend(v17, "setShouldResumeWithSession:", 0);
                }
                else
                {
                  v24 = objc_msgSend(v17, "isStreamPaused");
                  v39 = 0;
                  v25 = -[ExternalStreamManager _setPauseExternalInputStreamGroupID:streamID:isPaused:fromPlatformCallback:error:](v36, "_setPauseExternalInputStreamGroupID:streamID:isPaused:fromPlatformCallback:error:", v35, v15, 1, 1, &v39);
                  v26 = (Phase::Logger *)v39;
                  v22 = v26;
                  if (v25)
                  {
                    v27 = v24 ^ 1u;
                  }
                  else
                  {
                    v28 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v26) + 912));
                    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 136315906;
                      v50 = "ExternalStreamManager.mm";
                      v51 = 1024;
                      v52 = 615;
                      v53 = 2112;
                      v54 = v15;
                      v55 = 2112;
                      v56 = v22;
                      _os_log_impl(&dword_2164CC000, v28, OS_LOG_TYPE_ERROR, "%25s:%-5d failed to pause input stream %@ for session interruption: %@", buf, 0x26u);
                    }
                    v27 = 0;
                  }
                  objc_msgSend(v17, "setShouldResumeWithSession:", v27);
                }

              }
            }
LABEL_29:

          }
          v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v57, 16);
        }
        while (v12);
      }

      v9 = v34 + 1;
      v7 = v31;
      v5 = v36;
    }
    while (v34 + 1 != v33);
    v8 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
  }
  while (v8);
LABEL_33:

  if (v30)
    os_unfair_recursive_lock_unlock();
}

- (void)updateExternalInputStreamRecordingAbility:(id)a3 streamID:(id)a4 canRecord:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  Phase *v9;
  _BOOL4 IsFeatureEnabled_SessionBasedMuting;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  Phase::Logger *v15;
  NSObject *v16;
  const char *v17;
  BOOL v18;
  Phase::Logger *v19;
  Phase::Logger *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  id v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  id v30;
  __int16 v31;
  Phase *v32;
  uint64_t v33;

  v5 = a5;
  v33 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (Phase *)a4;
  IsFeatureEnabled_SessionBasedMuting = Phase::IsFeatureEnabled_SessionBasedMuting(v9);
  if (IsFeatureEnabled_SessionBasedMuting)
    os_unfair_recursive_lock_lock_with_options();
  objc_msgSend(*((id *)self + 1), "objectForKey:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "inputStreams");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v16 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v15) + 912));
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = "Cannot Record";
        v26 = "ExternalStreamManager.mm";
        v27 = 1024;
        v28 = 649;
        *(_DWORD *)buf = 136315906;
        if (v5)
          v17 = "Can Record";
        v29 = 2080;
        v30 = (id)v17;
        v31 = 2112;
        v32 = v9;
        _os_log_impl(&dword_2164CC000, v16, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Setting %s state on external input stream %@", buf, 0x26u);
      }
      objc_msgSend(v14, "setCanRecord:", v5);
      v24 = 0;
      v18 = -[ExternalStreamManager _setPauseExternalInputStreamWithoutNotifyingClient:isPaused:fromPlatformCallback:error:](self, "_setPauseExternalInputStreamWithoutNotifyingClient:isPaused:fromPlatformCallback:error:", v14, objc_msgSend(v14, "isStreamPaused"), 0, &v24);
      v19 = (Phase::Logger *)v24;
      v20 = v19;
      if (!v18)
      {
        v21 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v19) + 912));
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315906;
          v26 = "ExternalStreamManager.mm";
          v27 = 1024;
          v28 = 662;
          v29 = 2112;
          v30 = v9;
          v31 = 2112;
          v32 = v20;
          _os_log_impl(&dword_2164CC000, v21, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to update record state on input stream %@: %@", buf, 0x26u);
        }
      }

    }
    else
    {
      v23 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v15) + 912));
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v26 = "ExternalStreamManager.mm";
        v27 = 1024;
        v28 = 644;
        v29 = 2112;
        v30 = v9;
        _os_log_impl(&dword_2164CC000, v23, OS_LOG_TYPE_ERROR, "%25s:%-5d Could not find stream %@ to pause.", buf, 0x1Cu);
      }
    }

  }
  else
  {
    v22 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(0) + 912));
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v26 = "ExternalStreamManager.mm";
      v27 = 1024;
      v28 = 637;
      v29 = 2112;
      v30 = v8;
      _os_log_impl(&dword_2164CC000, v22, OS_LOG_TYPE_ERROR, "%25s:%-5d Could not find stream group %@ to pause.", buf, 0x1Cu);
    }
  }

  if (IsFeatureEnabled_SessionBasedMuting)
    os_unfair_recursive_lock_unlock();

}

- (void)update
{
  void *v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  uint64_t v12;
  void *v13;
  void *v14;
  Phase *v15;
  unint64_t *p_shared_owners;
  unint64_t v17;
  _BOOL8 v18;
  _BOOL4 IsFeatureEnabled_SessionBasedMuting;
  id obj;
  uint64_t v21;
  uint64_t v22;
  os_unfair_lock_t lock;
  std::__shared_weak_count *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  IsFeatureEnabled_SessionBasedMuting = Phase::IsFeatureEnabled_SessionBasedMuting((Phase *)self);
  if (IsFeatureEnabled_SessionBasedMuting)
    os_unfair_recursive_lock_lock_with_options();
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(*((id *)self + 1), "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  obj = v3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v4)
  {
    v21 = *(_QWORD *)v30;
    do
    {
      v22 = v4;
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v30 != v21)
          objc_enumerationMutation(obj);
        objc_msgSend(*((id *)self + 1), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 0u;
        v28 = 0u;
        v25 = 0u;
        v26 = 0u;
        objc_msgSend(v6, "inputStreams");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "allKeys");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        if (v9)
        {
          v10 = *(_QWORD *)v26;
          do
          {
            for (j = 0; j != v9; ++j)
            {
              if (*(_QWORD *)v26 != v10)
                objc_enumerationMutation(v8);
              v12 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j);
              objc_msgSend(v6, "inputStreams");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "objectForKey:", v12);
              v14 = (void *)objc_claimAutoreleasedReturnValue();

              if (v14 && objc_msgSend(v14, "isFading"))
              {
                objc_msgSend(v14, "fader");
                os_unfair_lock_lock(lock);
                if (v24)
                {
                  p_shared_owners = (unint64_t *)&v24->__shared_owners_;
                  do
                    v17 = __ldaxr(p_shared_owners);
                  while (__stlxr(v17 - 1, p_shared_owners));
                  if (!v17)
                  {
                    ((void (*)())v24->__on_zero_shared)();
                    std::__shared_weak_count::__release_weak(v24);
                  }
                }
                if (LOBYTE(lock[14]._os_unfair_lock_opaque))
                {
                  if (!Phase::IsFeatureEnabled_SessionBasedMuting(v15))
                  {
                    v18 = (objc_msgSend(v14, "isMuted") & 1) != 0 || *(float *)&lock[13]._os_unfair_lock_opaque == 0.0;
                    -[ExternalStreamManager _setSessionInputStreamState:muted:fromPlatformCallback:](self, "_setSessionInputStreamState:muted:fromPlatformCallback:", v14, v18, 0);
                  }
                  objc_msgSend(v14, "setIsFading:", 0);
                }
                os_unfair_lock_unlock(lock);
              }

            }
            v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          }
          while (v9);
        }

      }
      v3 = obj;
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v4);
  }

  Phase::Commandable<128,Phase::LockFreeQueueMPSC>::ExecuteCommands((uint64_t)self + 48);
  if (IsFeatureEnabled_SessionBasedMuting)
    os_unfair_recursive_lock_unlock();
}

- (BOOL)_setPauseExternalInputStreamWithoutNotifyingClient:(id)a3 isPaused:(BOOL)a4 fromPlatformCallback:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v7;
  _BOOL8 v8;
  id v10;
  void *v11;
  uint64_t v12;
  int v13;
  int v14;
  int v15;
  int v16;
  void **v17;
  void *v18;
  BOOL v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  Phase::Logger *v25;
  NSObject *v26;
  void *v27;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  void *v34;
  uint64_t v35;
  _QWORD v36[2];

  v7 = a5;
  v8 = a4;
  v36[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = v10;
  if (v8)
    v12 = 2;
  else
    v12 = 1;
  v13 = objc_msgSend(v10, "canRecord");
  v14 = objc_msgSend(v11, "isMuted");
  if (v13)
    v15 = 1;
  else
    v15 = 9;
  if (v14)
    v16 = 4;
  else
    v16 = 0;
  v17 = (void **)*((_QWORD *)self + 3);
  objc_msgSend(v11, "definition");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = Phase::Controller::SessionManager::SetSessionPlayState(v17, objc_msgSend(v18, "audioSessionToken"), (uint64_t)v11, v16 | v15, v12, v7, 0);

  if (v19)
  {
    if (a6)
      *a6 = 0;
    objc_msgSend(v11, "setStreamPaused:", v8);
    objc_msgSend(v11, "setShouldResumeWithSession:", 0);
  }
  else
  {
    v20 = *MEMORY[0x24BDD0FC8];
    v35 = *MEMORY[0x24BDD0FC8];
    v21 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v11, "definition");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringWithFormat:", CFSTR("failed to set session 0x%x state"), objc_msgSend(v22, "audioSessionToken"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v23;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v25)
                                                                                        + 912)));
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v24, "objectForKeyedSubscript:", v20);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v30 = "ExternalStreamManager.mm";
      v31 = 1024;
      v32 = 718;
      v33 = 2112;
      v34 = v27;
      _os_log_impl(&dword_2164CC000, v26, OS_LOG_TYPE_ERROR, "%25s:%-5d %@", buf, 0x1Cu);

    }
    if (a6)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.phase"), 1346924646, v24);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v11, "setStreamPaused:", 1);
    objc_msgSend(v11, "setShouldResumeWithSession:", 0);

  }
  return v19;
}

- (BOOL)setPauseExternalInputStreamGroupID:(id)a3 streamID:(id)a4 isPaused:(BOOL)a5 error:(id *)a6
{
  return -[ExternalStreamManager _setPauseExternalInputStreamGroupID:streamID:isPaused:fromPlatformCallback:error:](self, "_setPauseExternalInputStreamGroupID:streamID:isPaused:fromPlatformCallback:error:", a3, a4, a5, 0, a6);
}

- (BOOL)_setPauseExternalInputStreamGroupID:(id)a3 streamID:(id)a4 isPaused:(BOOL)a5 fromPlatformCallback:(BOOL)a6 error:(id *)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  id v12;
  Phase *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  Phase::Logger *v18;
  NSObject *v19;
  const char *v20;
  void *v21;
  BOOL v22;
  void (**v23)(_QWORD, _QWORD);
  uint64_t v24;
  const char *v25;
  void *v26;
  Phase::Logger *v27;
  NSObject *v28;
  char *v29;
  uint64_t v30;
  const char *v31;
  void *v32;
  void *v33;
  Phase::Logger *v34;
  NSObject *v35;
  char *v36;
  Phase *v38;
  _BOOL4 IsFeatureEnabled_SessionBasedMuting;
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  int v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  Phase *v47;
  __int16 v48;
  int v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  _QWORD v53[2];

  v8 = a6;
  v9 = a5;
  v53[1] = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = (Phase *)a4;
  IsFeatureEnabled_SessionBasedMuting = Phase::IsFeatureEnabled_SessionBasedMuting(v13);
  if (IsFeatureEnabled_SessionBasedMuting)
    os_unfair_recursive_lock_lock_with_options();
  objc_msgSend(*((id *)self + 1), "objectForKey:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (!v14)
  {
    v24 = *MEMORY[0x24BDD0FC8];
    v52 = *MEMORY[0x24BDD0FC8];
    v25 = "resume";
    if (v9)
      v25 = "pause";
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Could not find stream group %@ to %s"), v12, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v53[0] = v26;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v53, &v52, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v27)
                                                                                        + 912)));
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v17, "objectForKeyedSubscript:", v24);
      v29 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v41 = "ExternalStreamManager.mm";
      v42 = 1024;
      v43 = 770;
      v44 = 2112;
      v45 = v29;
      _os_log_impl(&dword_2164CC000, v28, OS_LOG_TYPE_ERROR, "%25s:%-5d %@", buf, 0x1Cu);

    }
    if (a7)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.phase"), 1346924147, v17);
      v22 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  objc_msgSend(v14, "inputStreams");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKey:", v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    v30 = *MEMORY[0x24BDD0FC8];
    v50 = *MEMORY[0x24BDD0FC8];
    v31 = "resume";
    if (v9)
      v31 = "pause";
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Could not find stream %@ to %s"), v13, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v32;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v35 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v34)
                                                                                        + 912)));
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v33, "objectForKeyedSubscript:", v30);
      v36 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v41 = "ExternalStreamManager.mm";
      v42 = 1024;
      v43 = 785;
      v44 = 2112;
      v45 = v36;
      _os_log_impl(&dword_2164CC000, v35, OS_LOG_TYPE_ERROR, "%25s:%-5d %@", buf, 0x1Cu);

    }
    if (a7)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.phase"), 1346924147, v33);
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }

    v17 = 0;
LABEL_24:
    v22 = 0;
    goto LABEL_25;
  }
  v19 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v18)
                                                                                      + 912)));
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v38 = v13;
    if (v9)
      v20 = "Pausing";
    else
      v20 = "Resuming";
    objc_msgSend(v17, "definition");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136316162;
    v41 = "ExternalStreamManager.mm";
    v42 = 1024;
    v43 = 794;
    v44 = 2080;
    v45 = v20;
    v46 = 2112;
    v13 = v38;
    v47 = v38;
    v48 = 1024;
    v49 = objc_msgSend(v21, "audioSessionToken");
    _os_log_impl(&dword_2164CC000, v19, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s external input stream %@ in session 0x%x", buf, 0x2Cu);

  }
  v22 = -[ExternalStreamManager _setPauseExternalInputStreamWithoutNotifyingClient:isPaused:fromPlatformCallback:error:](self, "_setPauseExternalInputStreamWithoutNotifyingClient:isPaused:fromPlatformCallback:error:", v17, v9, v8, a7);
  objc_msgSend(v17, "pauseStateDidUpdateCallback");
  v23 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v23[2](v23, objc_msgSend(v17, "isStreamPaused"));

LABEL_25:
  if (IsFeatureEnabled_SessionBasedMuting)
    os_unfair_recursive_lock_unlock();

  return v22;
}

- (void)claimControlOfExternalStreamGroupID:(id)a3 attributedTo:(id)a4 stateChangeBlock:(id)a5 withCallback:(id)a6
{
  id v10;
  id v11;
  Phase *v12;
  _BOOL4 IsFeatureEnabled_SessionBasedMuting;
  ManagedStreamGroup *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  Phase::Logger *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t v34[128];
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  id v40;
  uint64_t v41;
  _QWORD v42[4];

  v42[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v29 = a4;
  v11 = a5;
  v12 = (Phase *)a6;
  IsFeatureEnabled_SessionBasedMuting = Phase::IsFeatureEnabled_SessionBasedMuting(v12);
  if (IsFeatureEnabled_SessionBasedMuting)
    os_unfair_recursive_lock_lock_with_options();
  objc_msgSend(*((id *)self + 1), "objectForKey:", v10);
  v14 = (ManagedStreamGroup *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    v14 = objc_alloc_init(ManagedStreamGroup);
    objc_msgSend(*((id *)self + 1), "setObject:forKey:");
  }
  -[ManagedStreamGroup controllingClientID](v14, "controllingClientID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = *MEMORY[0x24BDD0FC8];
    v41 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("stream group %@ is already controlled"), v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = v17;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v42, &v41, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v19)
                                                                                        + 912)));
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v18, "objectForKeyedSubscript:", v16);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v36 = "ExternalStreamManager.mm";
      v37 = 1024;
      v38 = 826;
      v39 = 2112;
      v40 = v21;
      _os_log_impl(&dword_2164CC000, v20, OS_LOG_TYPE_ERROR, "%25s:%-5d %@", buf, 0x1Cu);

    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.phase"), 1346921331, v18);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[ManagedStreamGroup setStateChangeBlock:](v14, "setStateChangeBlock:", v11);
    v23 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)-[ManagedStreamGroup setControllingClientID:](v14, "setControllingClientID:", v29))
                                                     + 912));
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v36 = "ExternalStreamManager.mm";
      v37 = 1024;
      v38 = 833;
      v39 = 2112;
      v40 = v10;
      _os_log_impl(&dword_2164CC000, v23, OS_LOG_TYPE_DEFAULT, "%25s:%-5d claimed control of external stream group %@", buf, 0x1Cu);
    }
    v22 = 0;
  }
  (*((void (**)(Phase *, void *))v12 + 2))(v12, v22);
  if (!v22)
  {
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    -[ManagedStreamGroup outputStreams](v14, "outputStreams");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "allKeys");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v26)
    {
      v27 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v31 != v27)
            objc_enumerationMutation(v25);
          (*((void (**)(id, id, _QWORD, _QWORD))v11 + 2))(v11, v10, *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i), 0);
        }
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v26);
    }

  }
  if (IsFeatureEnabled_SessionBasedMuting)
    os_unfair_recursive_lock_unlock();

}

- (void)abandonControlOfExternalStreamGroupID:(id)a3 withCallback:(id)a4
{
  id v6;
  Phase *v7;
  _BOOL4 IsFeatureEnabled_SessionBasedMuting;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  Phase::Logger *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  Phase::Logger *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  _BOOL4 v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  id v37;
  uint64_t v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (Phase *)a4;
  IsFeatureEnabled_SessionBasedMuting = Phase::IsFeatureEnabled_SessionBasedMuting(v7);
  if (IsFeatureEnabled_SessionBasedMuting)
    os_unfair_recursive_lock_lock_with_options();
  objc_msgSend(*((id *)self + 1), "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "controllingClientID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v10, "setControllingClientID:", 0);
      v12 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)objc_msgSend(v10, "setStateChangeBlock:", 0))
                                                       + 912));
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v33 = "ExternalStreamManager.mm";
        v34 = 1024;
        v35 = 873;
        v36 = 2112;
        v37 = v6;
        _os_log_impl(&dword_2164CC000, v12, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Abandoned control of external stream group %@", buf, 0x1Cu);
      }
      objc_msgSend(v10, "outputStreams");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "count"))
      {

      }
      else
      {
        objc_msgSend(v10, "inputStreams");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "count") == 0;

        if (v28)
        {
          v29 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)objc_msgSend(*((id *)self + 1), "removeObjectForKey:", v6))
                                                           + 912));
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            v33 = "ExternalStreamManager.mm";
            v34 = 1024;
            v35 = 879;
            v36 = 2112;
            v37 = v6;
            _os_log_impl(&dword_2164CC000, v29, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Removed external stream group %@", buf, 0x1Cu);
          }
        }
      }
      v20 = 0;
    }
    else
    {
      v21 = *MEMORY[0x24BDD0FC8];
      v30 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("stream %@ is not currently under control"), v6);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v22;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v24)
                                                                                          + 912)));
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v23, "objectForKeyedSubscript:", v21);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v33 = "ExternalStreamManager.mm";
        v34 = 1024;
        v35 = 866;
        v36 = 2112;
        v37 = v26;
        _os_log_impl(&dword_2164CC000, v25, OS_LOG_TYPE_ERROR, "%25s:%-5d %@", buf, 0x1Cu);

      }
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.phase"), 1346925939, v23);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v14 = *MEMORY[0x24BDD0FC8];
    v38 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("stream group not found for UUID %@"), v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v15;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v17)
                                                                                        + 912)));
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v16, "objectForKeyedSubscript:", v14);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v33 = "ExternalStreamManager.mm";
      v34 = 1024;
      v35 = 859;
      v36 = 2112;
      v37 = v19;
      _os_log_impl(&dword_2164CC000, v18, OS_LOG_TYPE_ERROR, "%25s:%-5d %@", buf, 0x1Cu);

    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.phase"), 1346924147, v16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  (*((void (**)(Phase *, void *))v7 + 2))(v7, v20);

  if (IsFeatureEnabled_SessionBasedMuting)
    os_unfair_recursive_lock_unlock();

}

- (void)removeExternalOutputStreamGroupID:(id)a3 streamID:(id)a4 withCallback:(id)a5
{
  id v8;
  id v9;
  Phase *v10;
  _BOOL4 IsFeatureEnabled_SessionBasedMuting;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  Phase::Logger *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  Phase::Logger *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  Phase::Logger *v29;
  void *v30;
  void *v31;
  void *v32;
  _BOOL4 v33;
  NSObject *v34;
  void *v35;
  BOOL v36;
  void (**v37)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  id v43;
  __int16 v44;
  id v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  _QWORD v49[2];

  v49[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (Phase *)a5;
  IsFeatureEnabled_SessionBasedMuting = Phase::IsFeatureEnabled_SessionBasedMuting(v10);
  if (IsFeatureEnabled_SessionBasedMuting)
    os_unfair_recursive_lock_lock_with_options();
  objc_msgSend(*((id *)self + 1), "objectForKey:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
  {
    v20 = *MEMORY[0x24BDD0FC8];
    v48 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("can't remove stream %@ for unknown group %@"), v9, v8);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = v21;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v49, &v48, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v23)
                                                                                        + 912)));
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v22, "objectForKeyedSubscript:", v20);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v39 = "ExternalStreamManager.mm";
      v40 = 1024;
      v41 = 899;
      v42 = 2112;
      v43 = v25;
      _os_log_impl(&dword_2164CC000, v24, OS_LOG_TYPE_ERROR, "%25s:%-5d %@", buf, 0x1Cu);

    }
    goto LABEL_11;
  }
  objc_msgSend(v12, "outputStreams");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    v27 = *MEMORY[0x24BDD0FC8];
    v46 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("can't remove unknown stream %@ in group %@"), v9, v8);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v28;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v29)
                                                                                        + 912)));
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v22, "objectForKeyedSubscript:", v27);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v39 = "ExternalStreamManager.mm";
      v40 = 1024;
      v41 = 906;
      v42 = 2112;
      v43 = v30;
      _os_log_impl(&dword_2164CC000, v24, OS_LOG_TYPE_ERROR, "%25s:%-5d %@", buf, 0x1Cu);

    }
LABEL_11:

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.phase"), 1346924147, v22);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_21;
  }
  objc_msgSend(v13, "outputStreams");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "removeObjectForKey:", v9);

  v18 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v17) + 912));
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v39 = "ExternalStreamManager.mm";
    v40 = 1024;
    v41 = 912;
    v42 = 2112;
    v43 = v9;
    v44 = 2112;
    v45 = v8;
    _os_log_impl(&dword_2164CC000, v18, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Removed external output stream %@ from group %@", buf, 0x26u);
  }
  objc_msgSend(v13, "outputStreams");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "count"))
  {

  }
  else
  {
    objc_msgSend(v13, "inputStreams");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v31, "count"))
    {

    }
    else
    {
      objc_msgSend(v13, "controllingClientID");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v32 == 0;

      if (v33)
      {
        v34 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)objc_msgSend(*((id *)self + 1), "removeObjectForKey:", v8))
                                                         + 912));
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v39 = "ExternalStreamManager.mm";
          v40 = 1024;
          v41 = 918;
          v42 = 2112;
          v43 = v8;
          _os_log_impl(&dword_2164CC000, v34, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Removed external stream group %@", buf, 0x1Cu);
        }
      }
    }
  }
  v26 = 0;
LABEL_21:
  (*((void (**)(Phase *, void *))v10 + 2))(v10, v26);
  if (!v26)
  {
    objc_msgSend(v13, "stateChangeBlock");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v35 == 0;

    if (!v36)
    {
      objc_msgSend(v13, "stateChangeBlock");
      v37 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id, id, uint64_t))v37)[2](v37, v8, v9, 1);

    }
  }

  if (IsFeatureEnabled_SessionBasedMuting)
    os_unfair_recursive_lock_unlock();

}

- (BOOL)setPauseExternalOutputStreamGroupID:(id)a3 streamID:(id)a4 isPaused:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  id v10;
  Phase *v11;
  _BOOL4 IsFeatureEnabled_SessionBasedMuting;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t HasExternalStream;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  void *v23;
  Phase::Logger *v24;
  NSObject *v25;
  void *v26;
  BOOL v27;
  uint64_t v28;
  const char *v29;
  void *v30;
  void *v31;
  Phase::Logger *v32;
  NSObject *v33;
  void *v34;
  uint64_t v36;
  void *v37;
  _BYTE buf[18];
  __int16 v39;
  void *v40;
  uint64_t v41;
  _QWORD v42[2];

  v7 = a5;
  v42[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = (Phase *)a4;
  IsFeatureEnabled_SessionBasedMuting = Phase::IsFeatureEnabled_SessionBasedMuting(v11);
  if (IsFeatureEnabled_SessionBasedMuting)
    os_unfair_recursive_lock_lock_with_options();
  objc_msgSend(*((id *)self + 1), "objectForKey:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
  {
    v21 = *MEMORY[0x24BDD0FC8];
    v41 = *MEMORY[0x24BDD0FC8];
    v22 = "resume";
    if (v7)
      v22 = "pause";
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Could not find stream group %@ to %s"), v10, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = v23;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v42, &v41, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v24)
                                                                                        + 912)));
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v16, "objectForKeyedSubscript:", v21);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "ExternalStreamManager.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 946;
      v39 = 2112;
      v40 = v26;
      _os_log_impl(&dword_2164CC000, v25, OS_LOG_TYPE_ERROR, "%25s:%-5d %@", buf, 0x1Cu);

    }
    if (a6)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.phase"), 1346924147, v16);
      v27 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_27;
    }
    goto LABEL_22;
  }
  objc_msgSend(v13, "outputStreams");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKey:", v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    v28 = *MEMORY[0x24BDD0FC8];
    v36 = *MEMORY[0x24BDD0FC8];
    v29 = "resume";
    if (v7)
      v29 = "pause";
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Could not find output stream %@ to %s"), v11, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v30;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v32)
                                                                                        + 912)));
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v31, "objectForKeyedSubscript:", v28);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "ExternalStreamManager.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 961;
      v39 = 2112;
      v40 = v34;
      _os_log_impl(&dword_2164CC000, v33, OS_LOG_TYPE_ERROR, "%25s:%-5d %@", buf, 0x1Cu);

    }
    if (a6)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.phase"), 1346924147, v31);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }

    v16 = 0;
LABEL_22:
    v27 = 0;
    goto LABEL_27;
  }
  objc_msgSend(v16, "setStreamPaused:", v7);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = 0;
  -[Phase getUUIDBytes:](v11, "getUUIDBytes:", buf);
  v17 = *(_QWORD *)buf;
  v18 = *(_QWORD *)&buf[8];
  HasExternalStream = Phase::Controller::VoiceManager::HasExternalStream(*((Phase::Controller::VoiceManager **)self + 2), *(UniqueObjectId *)buf);
  if (HIDWORD(HasExternalStream) || !(_BYTE)HasExternalStream)
  {
    v20 = **((_QWORD **)self + 2);
    if (v7)
      Phase::Controller::VoiceManager::Implementation::PauseExternalStream(v20, v17, v18);
    else
      Phase::Controller::VoiceManager::Implementation::ResumeExternalStream(v20, v17, v18);
  }
  if (a6)
    *a6 = 0;
  v27 = 1;
LABEL_27:

  if (IsFeatureEnabled_SessionBasedMuting)
    os_unfair_recursive_lock_unlock();

  return v27;
}

- (BOOL)streamIsPaused:(id)a3 error:(id *)a4
{
  Phase *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  Phase::Logger *v18;
  NSObject *v19;
  void *v20;
  char v21;
  id *v23;
  _BOOL4 IsFeatureEnabled_SessionBasedMuting;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  void *v34;
  uint64_t v35;
  void *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v6 = (Phase *)a3;
  IsFeatureEnabled_SessionBasedMuting = Phase::IsFeatureEnabled_SessionBasedMuting(v6);
  if (!IsFeatureEnabled_SessionBasedMuting)
  {
    if (!a4)
      goto LABEL_6;
    goto LABEL_5;
  }
  os_unfair_recursive_lock_lock_with_options();
  if (a4)
LABEL_5:
    *a4 = 0;
LABEL_6:
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(*((id *)self + 1), "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = a4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v26;
LABEL_8:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v26 != v9)
        objc_enumerationMutation(v7);
      objc_msgSend(*((id *)self + 1), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v10));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "outputStreams");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKey:", v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
        break;
      objc_msgSend(v11, "inputStreams");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKey:", v6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        v21 = objc_msgSend(v15, "isStreamPaused");
        v13 = v15;
        goto LABEL_21;
      }

      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
        if (v8)
          goto LABEL_8;
        goto LABEL_15;
      }
    }
    v21 = objc_msgSend(v13, "isStreamPaused");
LABEL_21:

    goto LABEL_22;
  }
LABEL_15:

  v16 = *MEMORY[0x24BDD0FC8];
  v35 = *MEMORY[0x24BDD0FC8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("stream not found for UUID %@"), v6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v17;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v18)
                                                                                      + 912)));
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", v16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v30 = "ExternalStreamManager.mm";
    v31 = 1024;
    v32 = 1023;
    v33 = 2112;
    v34 = v20;
    _os_log_impl(&dword_2164CC000, v19, OS_LOG_TYPE_ERROR, "%25s:%-5d %@", buf, 0x1Cu);

  }
  if (v23)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.phase"), 1346924147, v7);
    v21 = 0;
    *v23 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = 0;
  }
LABEL_22:

  if (IsFeatureEnabled_SessionBasedMuting)
    os_unfair_recursive_lock_unlock();

  return v21;
}

- (id)formatForStream:(id)a3 error:(id *)a4
{
  Phase *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  Phase::Logger *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  id *v24;
  _BOOL4 IsFeatureEnabled_SessionBasedMuting;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  void *v35;
  uint64_t v36;
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v6 = (Phase *)a3;
  IsFeatureEnabled_SessionBasedMuting = Phase::IsFeatureEnabled_SessionBasedMuting(v6);
  if (!IsFeatureEnabled_SessionBasedMuting)
  {
    if (!a4)
      goto LABEL_6;
    goto LABEL_5;
  }
  os_unfair_recursive_lock_lock_with_options();
  if (a4)
LABEL_5:
    *a4 = 0;
LABEL_6:
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend(*((id *)self + 1), "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = a4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v27;
LABEL_8:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v27 != v9)
        objc_enumerationMutation(v7);
      objc_msgSend(*((id *)self + 1), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v10));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "outputStreams");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKey:", v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
        break;
      objc_msgSend(v11, "inputStreams");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKey:", v6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        objc_msgSend(v15, "definition");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "format");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v15;
        goto LABEL_21;
      }

      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
        if (v8)
          goto LABEL_8;
        goto LABEL_15;
      }
    }
    objc_msgSend(v13, "definition");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "format");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_21:

    goto LABEL_22;
  }
LABEL_15:

  v16 = *MEMORY[0x24BDD0FC8];
  v36 = *MEMORY[0x24BDD0FC8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("stream not found for UUID %@"), v6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v17;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v18)
                                                                                      + 912)));
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", v16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v31 = "ExternalStreamManager.mm";
    v32 = 1024;
    v33 = 1058;
    v34 = 2112;
    v35 = v20;
    _os_log_impl(&dword_2164CC000, v19, OS_LOG_TYPE_ERROR, "%25s:%-5d %@", buf, 0x1Cu);

  }
  if (v24)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.phase"), 1346924147, v7);
    v21 = 0;
    *v24 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = 0;
  }
LABEL_22:

  if (IsFeatureEnabled_SessionBasedMuting)
    os_unfair_recursive_lock_unlock();

  return v21;
}

- (int64_t)typeForStream:(id)a3 error:(id *)a4
{
  Phase *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  Phase::Logger *v18;
  NSObject *v19;
  void *v20;
  int64_t v21;
  void *v22;
  id *v24;
  _BOOL4 IsFeatureEnabled_SessionBasedMuting;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  void *v35;
  uint64_t v36;
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v6 = (Phase *)a3;
  IsFeatureEnabled_SessionBasedMuting = Phase::IsFeatureEnabled_SessionBasedMuting(v6);
  if (!IsFeatureEnabled_SessionBasedMuting)
  {
    if (!a4)
      goto LABEL_6;
    goto LABEL_5;
  }
  os_unfair_recursive_lock_lock_with_options();
  if (a4)
LABEL_5:
    *a4 = 0;
LABEL_6:
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend(*((id *)self + 1), "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = a4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v27;
LABEL_8:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v27 != v9)
        objc_enumerationMutation(v7);
      objc_msgSend(*((id *)self + 1), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v10));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "outputStreams");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKey:", v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
        break;
      objc_msgSend(v11, "inputStreams");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKey:", v6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        objc_msgSend(v15, "definition");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v22, "streamType");
        v13 = v15;
        goto LABEL_21;
      }

      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
        if (v8)
          goto LABEL_8;
        goto LABEL_15;
      }
    }
    objc_msgSend(v13, "definition");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v22, "streamType");
LABEL_21:

    goto LABEL_22;
  }
LABEL_15:

  v16 = *MEMORY[0x24BDD0FC8];
  v36 = *MEMORY[0x24BDD0FC8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("stream not found for UUID %@"), v6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v17;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v18)
                                                                                      + 912)));
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", v16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v31 = "ExternalStreamManager.mm";
    v32 = 1024;
    v33 = 1093;
    v34 = 2112;
    v35 = v20;
    _os_log_impl(&dword_2164CC000, v19, OS_LOG_TYPE_ERROR, "%25s:%-5d %@", buf, 0x1Cu);

  }
  if (v24)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.phase"), 1346924147, v7);
    v21 = 0;
    *v24 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = 0;
  }
LABEL_22:

  if (IsFeatureEnabled_SessionBasedMuting)
    os_unfair_recursive_lock_unlock();

  return v21;
}

- (unsigned)sessionIdForStream:(id)a3 error:(id *)a4
{
  Phase *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  Phase::Logger *v18;
  NSObject *v19;
  void *v20;
  unsigned int v21;
  void *v22;
  id *v24;
  _BOOL4 IsFeatureEnabled_SessionBasedMuting;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  void *v35;
  uint64_t v36;
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v6 = (Phase *)a3;
  IsFeatureEnabled_SessionBasedMuting = Phase::IsFeatureEnabled_SessionBasedMuting(v6);
  if (!IsFeatureEnabled_SessionBasedMuting)
  {
    if (!a4)
      goto LABEL_6;
    goto LABEL_5;
  }
  os_unfair_recursive_lock_lock_with_options();
  if (a4)
LABEL_5:
    *a4 = 0;
LABEL_6:
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend(*((id *)self + 1), "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = a4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v27;
LABEL_8:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v27 != v9)
        objc_enumerationMutation(v7);
      objc_msgSend(*((id *)self + 1), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v10));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "outputStreams");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKey:", v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
        break;
      objc_msgSend(v11, "inputStreams");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKey:", v6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        objc_msgSend(v15, "definition");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v22, "audioSessionToken");
        v13 = v15;
        goto LABEL_21;
      }

      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
        if (v8)
          goto LABEL_8;
        goto LABEL_15;
      }
    }
    objc_msgSend(v13, "definition");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v22, "audioSessionToken");
LABEL_21:

    goto LABEL_22;
  }
LABEL_15:

  v16 = *MEMORY[0x24BDD0FC8];
  v36 = *MEMORY[0x24BDD0FC8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("stream not found for UUID %@"), v6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v17;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v18)
                                                                                      + 912)));
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", v16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v31 = "ExternalStreamManager.mm";
    v32 = 1024;
    v33 = 1129;
    v34 = 2112;
    v35 = v20;
    _os_log_impl(&dword_2164CC000, v19, OS_LOG_TYPE_ERROR, "%25s:%-5d %@", buf, 0x1Cu);

  }
  if (v24)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.phase"), 1346924147, v7);
    v21 = 0;
    *v24 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = 0;
  }
LABEL_22:

  if (IsFeatureEnabled_SessionBasedMuting)
    os_unfair_recursive_lock_unlock();

  return v21;
}

- (unique_ptr<Phase::Controller::StreamRenderer,)createRendererForStream:(id)a3 outputChannelLayout:(unsigned int)a4 normalize:(BOOL)a5 targetLKFS:(double)a6 error:(id *)a7
{
  Phase::Controller::StreamRenderer **v7;
  Phase::Controller::StreamRenderer **v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  Phase::Logger *v22;
  NSObject *v23;
  void *v24;
  id v25;
  uint64_t InstancePtr;
  uint64_t v27;
  void *v28;
  _BOOL4 v29;
  Phase::Controller::DeviceInfo *v30;
  uint64_t AcousticID;
  void *v32;
  int v33;
  int v34;
  Phase::Logger *v35;
  NSObject *v36;
  Phase::Logger *v37;
  int v38;
  void *v39;
  Phase::Logger *v40;
  NSObject *v41;
  const char *v42;
  NSObject *v43;
  os_log_type_t v44;
  uint32_t v45;
  NSObject *v46;
  int v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  Phase::Controller::StreamRenderer *v54;
  uint64_t v55;
  Phase::Logger *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  NSURL *v61;
  Phase::Logger *v62;
  NSObject *v63;
  void *v64;
  NSObject *v65;
  void *v66;
  id v67;
  uint64_t v68;
  id v69;
  uint64_t v70;
  void *v71;
  int v72;
  int v73;
  NSObject *v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  Phase::Controller::StreamRenderer *v82;
  Phase::Logger *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  NSObject *v87;
  unique_ptr<Phase::Controller::StreamRenderer, std::default_delete<Phase::Controller::StreamRenderer>> v88;
  NSObject *v89;
  id v90;
  uint64_t v91;
  NSObject *v92;
  id v93;
  uint64_t v94;
  id v95;
  uint64_t v96;
  void *v97;
  int v98;
  int v99;
  NSURL *v100;
  id v101;
  id v102;
  void *v103;
  uint64_t v104;
  void *v105;
  _BOOL4 v106;
  void *v107;
  void *v108;
  Phase::Controller::StreamRenderer **v109;
  _BOOL4 IsFeatureEnabled_SessionBasedMuting;
  Phase::Logger *v112;
  Phase *v113;
  Phase::Controller::StreamRenderer *v114;
  _BYTE v115[7];
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  _BYTE buf[38];
  __int16 v121;
  _BYTE v122[10];
  id v123;
  _QWORD v124[2];
  _QWORD v125[2];
  _BYTE v126[23];
  uint64_t v127;
  void *v128;
  _BYTE v129[128];
  uint64_t v130;

  v106 = a5;
  v11 = v7;
  v130 = *MEMORY[0x24BDAC8D0];
  v113 = (Phase *)a3;
  IsFeatureEnabled_SessionBasedMuting = Phase::IsFeatureEnabled_SessionBasedMuting(v113);
  if (!IsFeatureEnabled_SessionBasedMuting)
  {
    if (!a7)
      goto LABEL_6;
    goto LABEL_5;
  }
  os_unfair_recursive_lock_lock_with_options();
  if (a7)
LABEL_5:
    *a7 = 0;
LABEL_6:
  v118 = 0u;
  v119 = 0u;
  v116 = 0u;
  v117 = 0u;
  objc_msgSend(*((id *)self + 1), "allKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v109 = v11;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v116, v129, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v117;
LABEL_8:
    v15 = 0;
    while (1)
    {
      if (*(_QWORD *)v117 != v14)
        objc_enumerationMutation(v12);
      v16 = *(void **)(*((_QWORD *)&v116 + 1) + 8 * v15);
      objc_msgSend(*((id *)self + 1), "objectForKey:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "outputStreams");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKey:", v113);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
        break;

      if (v13 == ++v15)
      {
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v116, v129, 16);
        if (v13)
          goto LABEL_8;
        goto LABEL_14;
      }
    }
    v101 = v16;

    v103 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB17E8]), "initWithLayoutTag:", a4);
    v25 = objc_alloc(MEMORY[0x24BDB1818]);
    objc_msgSend(*((id *)self + 4), "sampleRate");
    v112 = (Phase::Logger *)objc_msgSend(v25, "initStandardFormatWithSampleRate:channelLayout:", v103);
    InstancePtr = Phase::Logger::GetInstancePtr(v112);
    v27 = 2;
    if (v106)
      v27 = 0;
    if (*(_DWORD *)(InstancePtr + 1536))
      v27 |= 0x80uLL;
    v104 = v27;
    objc_msgSend(v19, "definition");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "streamType") == 1;

    if (!v29)
      goto LABEL_48;
    if (Phase::gPreferredTuningDirectory)
    {
      v102 = (id)Phase::gPreferredTuningDirectory;
LABEL_45:
      v104 |= 4uLL;
      v47 = 1;
      goto LABEL_49;
    }
    v30 = (Phase::Controller::DeviceInfo *)objc_alloc_init(MEMORY[0x24BDD1580]);
    AcousticID = Phase::Controller::DeviceInfo::GetAcousticID(v30);
    if ((AcousticID & 0xFF00000000) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("/Library/Audio/Tunings/%d/PHASE/Voice"), AcousticID);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v126[0] = 0;
      v33 = -[Phase::Controller::DeviceInfo fileExistsAtPath:isDirectory:](v30, "fileExistsAtPath:isDirectory:", v32, v126);
      if (v126[0])
        v34 = v33;
      else
        v34 = 0;
      if (v34 == 1)
      {
        objc_storeStrong((id *)&Phase::gPreferredTuningDirectory, v32);
        v36 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v35) + 912));
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          *(_QWORD *)&buf[4] = "ExternalStreamManager.mm";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 47;
          *(_WORD *)&buf[18] = 2112;
          *(_QWORD *)&buf[20] = v32;
          _os_log_impl(&dword_2164CC000, v36, OS_LOG_TYPE_DEFAULT, "%25s:%-5d using AID-specific tuning directory %@", buf, 0x1Cu);
        }
      }

    }
    if (!Phase::gPreferredTuningDirectory)
    {
      v126[0] = 0;
      v37 = (Phase::Logger *)-[Phase::Controller::DeviceInfo fileExistsAtPath:isDirectory:](v30, "fileExistsAtPath:isDirectory:", CFSTR("/Library/Audio/Tunings/Generic/PHASE/Voice"), v126);
      if (v126[0])
        v38 = (int)v37;
      else
        v38 = 0;
      if (v38 == 1)
      {
        v39 = (void *)Phase::gPreferredTuningDirectory;
        Phase::gPreferredTuningDirectory = (uint64_t)CFSTR("/Library/Audio/Tunings/Generic/PHASE/Voice");

        v41 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v40) + 912));
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          *(_QWORD *)&buf[4] = "ExternalStreamManager.mm";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 59;
          *(_WORD *)&buf[18] = 2112;
          *(_QWORD *)&buf[20] = CFSTR("/Library/Audio/Tunings/Generic/PHASE/Voice");
          v42 = "%25s:%-5d using generic tuning directory %@";
          v43 = v41;
          v44 = OS_LOG_TYPE_DEFAULT;
          v45 = 28;
LABEL_43:
          _os_log_impl(&dword_2164CC000, v43, v44, v42, buf, v45);
        }
      }
      else
      {
        v46 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v37) + 912));
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "ExternalStreamManager.mm";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 63;
          v42 = "%25s:%-5d cannot find tuning directory";
          v43 = v46;
          v44 = OS_LOG_TYPE_ERROR;
          v45 = 18;
          goto LABEL_43;
        }
      }
    }

    v102 = (id)Phase::gPreferredTuningDirectory;
    if (v102)
      goto LABEL_45;
    v48 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(0) + 912));
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "ExternalStreamManager.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1211;
      _os_log_impl(&dword_2164CC000, v48, OS_LOG_TYPE_ERROR, "%25s:%-5d cannot find directory for voice tunings", buf, 0x12u);
    }
LABEL_48:
    v47 = 0;
    v102 = 0;
LABEL_49:
    objc_msgSend(v19, "definition");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "format");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "definition");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v51, "maximumFramesToRender");
    objc_msgSend(v19, "renderBlock");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = (Phase::Controller::StreamRenderer *)operator new();
    v55 = *((unsigned int *)self + 10);
    buf[0] = 0;
    buf[24] = 0;
    Phase::Controller::StreamRenderer::StreamRenderer(v54, v50, v112, v52, v55, v104, v53, buf);
    v114 = v54;

    if (!*((_QWORD *)v54 + 6))
    {
      v65 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v56)
                                                                                          + 912)));
      if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v19, "definition");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "format");
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v107, "description");
        v67 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v68 = objc_msgSend(v67, "UTF8String");
        -[Phase::Logger description](v112, "description");
        v69 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v70 = objc_msgSend(v69, "UTF8String");
        objc_msgSend(v19, "definition");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = objc_msgSend(v71, "maximumFramesToRender");
        v73 = *((_DWORD *)self + 10);
        *(_DWORD *)buf = 136316418;
        *(_QWORD *)&buf[4] = "ExternalStreamManager.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 1257;
        *(_WORD *)&buf[18] = 2080;
        *(_QWORD *)&buf[20] = v68;
        *(_WORD *)&buf[28] = 2080;
        *(_QWORD *)&buf[30] = v70;
        v121 = 1024;
        *(_DWORD *)v122 = v72;
        *(_WORD *)&v122[4] = 1024;
        *(_DWORD *)&v122[6] = v73;
        _os_log_impl(&dword_2164CC000, v65, OS_LOG_TYPE_ERROR, "%25s:%-5d Error: could not create stream renderer: inputFormat %s, outputFormat %s, inputMaxFrameCount %u, outputMaxFrameCount %u for external stream!", buf, 0x32u);

      }
      *v109 = 0;
      goto LABEL_58;
    }
    if (v47)
    {
      v57 = (void *)MEMORY[0x24BDBCF48];
      v125[0] = v102;
      v125[1] = CFSTR("gen-far-end-voice.dspg");
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v125, 2);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "fileURLWithPathComponents:", v58);
      v100 = (NSURL *)objc_claimAutoreleasedReturnValue();

      v59 = (void *)MEMORY[0x24BDBCF48];
      v124[0] = v102;
      v124[1] = CFSTR("gen-far-end-voice.austrip");
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v124, 2);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "fileURLWithPathComponents:", v60);
      v61 = (NSURL *)objc_claimAutoreleasedReturnValue();

      v62 = (Phase::Logger *)Phase::Controller::StreamRenderer::ConfigureDSPGraph(v54, v100, v61);
      if ((_DWORD)v62)
      {
        v63 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v62)
                                                                                            + 912)));
        if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
        {
          -[NSURL lastPathComponent](v100, "lastPathComponent");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315906;
          *(_QWORD *)&buf[4] = "ExternalStreamManager.mm";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 1271;
          *(_WORD *)&buf[18] = 2112;
          *(_QWORD *)&buf[20] = v64;
          *(_WORD *)&buf[28] = 2112;
          *(_QWORD *)&buf[30] = v102;
          _os_log_impl(&dword_2164CC000, v63, OS_LOG_TYPE_DEFAULT, "%25s:%-5d loaded voice tuning %@ from %@", buf, 0x26u);

        }
      }
      else
      {
        v74 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v62) + 912));
        if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "ExternalStreamManager.mm";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 1275;
          _os_log_impl(&dword_2164CC000, v74, OS_LOG_TYPE_ERROR, "%25s:%-5d failed to configure voice tuning graph, removing from downlink chain", buf, 0x12u);
        }
        objc_msgSend(v19, "definition");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "format");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "definition");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v78 = objc_msgSend(v77, "maximumFramesToRender");
        objc_msgSend(v19, "renderBlock");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        v80 = operator new();
        v81 = *((unsigned int *)self + 10);
        buf[0] = 0;
        *(_OWORD *)&buf[1] = *(_OWORD *)v126;
        *(_QWORD *)&buf[16] = *(_QWORD *)&v126[15];
        buf[24] = 0;
        *(_DWORD *)&buf[25] = *(_DWORD *)v115;
        *(_DWORD *)&buf[28] = *(_DWORD *)&v115[3];
        Phase::Controller::StreamRenderer::StreamRenderer(v80, v76, v112, v78, v81, v104 & 0xFFFFFFFFFFFFFFFBLL, v79, buf);
        v82 = (Phase::Controller::StreamRenderer *)v80;
        v114 = (Phase::Controller::StreamRenderer *)v80;
        Phase::Controller::StreamRenderer::~StreamRenderer(v54);
        MEMORY[0x2199F9D70]();

        if (!*(_QWORD *)(v80 + 48))
        {
          v92 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v83)
                                                                                              + 912)));
          if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v19, "definition");
            v105 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v105, "format");
            v108 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v108, "description");
            v93 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v94 = objc_msgSend(v93, "UTF8String");
            -[Phase::Logger description](v112, "description");
            v95 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v96 = objc_msgSend(v95, "UTF8String");
            objc_msgSend(v19, "definition");
            v97 = (void *)objc_claimAutoreleasedReturnValue();
            v98 = objc_msgSend(v97, "maximumFramesToRender");
            v99 = *((_DWORD *)self + 10);
            *(_DWORD *)buf = 136316418;
            *(_QWORD *)&buf[4] = "ExternalStreamManager.mm";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 1295;
            *(_WORD *)&buf[18] = 2080;
            *(_QWORD *)&buf[20] = v94;
            *(_WORD *)&buf[28] = 2080;
            *(_QWORD *)&buf[30] = v96;
            v121 = 1024;
            *(_DWORD *)v122 = v98;
            *(_WORD *)&v122[4] = 1024;
            *(_DWORD *)&v122[6] = v99;
            _os_log_impl(&dword_2164CC000, v92, OS_LOG_TYPE_ERROR, "%25s:%-5d Error: could not create fallback stream renderer: inputFormat %s, outputFormat %s, inputMaxFrameCount %u, outputMaxFrameCount %u for external stream!", buf, 0x32u);

          }
          *v109 = 0;

          v54 = v82;
          goto LABEL_58;
        }
        v54 = (Phase::Controller::StreamRenderer *)v80;
      }

    }
    if (!v106)
    {
LABEL_67:
      v87 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v56) + 912));
      if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        *(_QWORD *)&buf[4] = "ExternalStreamManager.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 1318;
        *(_WORD *)&buf[18] = 2048;
        *(_QWORD *)&buf[20] = v114;
        *(_WORD *)&buf[28] = 2112;
        *(_QWORD *)&buf[30] = v112;
        v121 = 2112;
        *(_QWORD *)v122 = v113;
        *(_WORD *)&v122[8] = 2112;
        v123 = v101;
        _os_log_impl(&dword_2164CC000, v87, OS_LOG_TYPE_DEFAULT, "%25s:%-5d created renderer %p w/ output format %@ for external stream %@ in group %@", buf, 0x3Au);
      }
      *v109 = v114;
      goto LABEL_70;
    }
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.audio.PHASE"));
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "URLForResource:withExtension:subdirectory:", CFSTR("MPEGDefault12LKFSStandardV2"), CFSTR("aupreset"), CFSTR("AUPresets/AULoudnessNormalizer"));
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = Phase::Controller::StreamRenderer::SetPreset((uint64_t)v54, 0, v85, a6);
    if ((v86 & 1) != 0)
    {

      goto LABEL_67;
    }
    v89 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)v86)
                                                                                        + 912)));
    if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v85, "description");
      v90 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v91 = objc_msgSend(v90, "UTF8String");
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "ExternalStreamManager.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1312;
      *(_WORD *)&buf[18] = 2080;
      *(_QWORD *)&buf[20] = v91;
      _os_log_impl(&dword_2164CC000, v89, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to load preset '%s' for stream renderer!", buf, 0x1Cu);

    }
    *v109 = 0;

    v54 = v114;
    if (!v114)
      goto LABEL_70;
LABEL_58:
    Phase::Controller::StreamRenderer::~StreamRenderer(v54);
    MEMORY[0x2199F9D70]();
LABEL_70:

    goto LABEL_71;
  }
LABEL_14:

  v20 = *MEMORY[0x24BDD0FC8];
  v127 = *MEMORY[0x24BDD0FC8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("stream not found for UUID %@"), v113);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v128 = v21;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v128, &v127, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v22)
                                                                                      + 912)));
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v19, "objectForKeyedSubscript:", v20);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "ExternalStreamManager.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1169;
    *(_WORD *)&buf[18] = 2112;
    *(_QWORD *)&buf[20] = v24;
    _os_log_impl(&dword_2164CC000, v23, OS_LOG_TYPE_ERROR, "%25s:%-5d %@", buf, 0x1Cu);

  }
  if (a7)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.phase"), 1346924147, v19);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  *v109 = 0;
LABEL_71:

  if (IsFeatureEnabled_SessionBasedMuting)
    os_unfair_recursive_lock_unlock();

  return v88;
}

- (unint64_t)addControllerPauseStateDidUpdateCallback:(id)a3
{
  unint64_t v3;
  id v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  uint8x8_t v9;
  _QWORD **v10;
  _QWORD *i;
  unint64_t v12;
  _QWORD *v13;
  float v14;
  float v15;
  _BOOL8 v16;
  unint64_t v17;
  unint64_t v18;
  int8x8_t prime;
  void *v20;
  void *v21;
  uint64_t v22;
  _QWORD *v23;
  unint64_t v24;
  uint8x8_t v25;
  unint64_t v26;
  uint8x8_t v27;
  uint64_t v28;
  _QWORD *v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  unint64_t v34;
  void *v35;
  void *v37;

  v5 = a3;
  v6 = *((_QWORD *)self + 17) + 1;
  *((_QWORD *)self + 17) = v6;
  v7 = _Block_copy(v5);
  v8 = *((_QWORD *)self + 13);
  if (v8)
  {
    v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      v3 = v6;
      if (v8 <= v6)
        v3 = v6 % v8;
    }
    else
    {
      v3 = (v8 - 1) & v6;
    }
    v10 = *(_QWORD ***)(*((_QWORD *)self + 12) + 8 * v3);
    if (v10)
    {
      for (i = *v10; i; i = (_QWORD *)*i)
      {
        v12 = i[1];
        if (v12 == v6)
        {
          if (i[2] == v6)
            goto LABEL_74;
        }
        else
        {
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= v8)
              v12 %= v8;
          }
          else
          {
            v12 &= v8 - 1;
          }
          if (v12 != v3)
            break;
        }
      }
    }
  }
  i = operator new(0x20uLL);
  v13 = (_QWORD *)((char *)self + 112);
  *i = 0;
  i[1] = v6;
  i[2] = v6;
  i[3] = 0;
  v14 = (float)(unint64_t)(*((_QWORD *)self + 15) + 1);
  v15 = *((float *)self + 32);
  if (!v8 || (float)(v15 * (float)v8) < v14)
  {
    v16 = 1;
    if (v8 >= 3)
      v16 = (v8 & (v8 - 1)) != 0;
    v17 = v16 | (2 * v8);
    v18 = vcvtps_u32_f32(v14 / v15);
    if (v17 <= v18)
      prime = (int8x8_t)v18;
    else
      prime = (int8x8_t)v17;
    if (*(_QWORD *)&prime == 1)
    {
      prime = (int8x8_t)2;
    }
    else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
    {
      prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
      v8 = *((_QWORD *)self + 13);
    }
    if (*(_QWORD *)&prime > v8)
      goto LABEL_30;
    if (*(_QWORD *)&prime < v8)
    {
      v26 = vcvtps_u32_f32((float)*((unint64_t *)self + 15) / *((float *)self + 32));
      if (v8 < 3 || (v27 = (uint8x8_t)vcnt_s8((int8x8_t)v8), v27.i16[0] = vaddlv_u8(v27), v27.u32[0] > 1uLL))
      {
        v26 = std::__next_prime(v26);
      }
      else
      {
        v28 = 1 << -(char)__clz(v26 - 1);
        if (v26 >= 2)
          v26 = v28;
      }
      if (*(_QWORD *)&prime <= v26)
        prime = (int8x8_t)v26;
      if (*(_QWORD *)&prime >= v8)
      {
        v8 = *((_QWORD *)self + 13);
      }
      else
      {
        if (prime)
        {
LABEL_30:
          if (*(_QWORD *)&prime >> 61)
            std::__throw_bad_array_new_length[abi:ne180100]();
          v20 = operator new(8 * *(_QWORD *)&prime);
          v21 = (void *)*((_QWORD *)self + 12);
          *((_QWORD *)self + 12) = v20;
          if (v21)
            operator delete(v21);
          v22 = 0;
          *((int8x8_t *)self + 13) = prime;
          do
            *(_QWORD *)(*((_QWORD *)self + 12) + 8 * v22++) = 0;
          while (*(_QWORD *)&prime != v22);
          v23 = (_QWORD *)*v13;
          if (*v13)
          {
            v24 = v23[1];
            v25 = (uint8x8_t)vcnt_s8(prime);
            v25.i16[0] = vaddlv_u8(v25);
            if (v25.u32[0] > 1uLL)
            {
              if (v24 >= *(_QWORD *)&prime)
                v24 %= *(_QWORD *)&prime;
            }
            else
            {
              v24 &= *(_QWORD *)&prime - 1;
            }
            *(_QWORD *)(*((_QWORD *)self + 12) + 8 * v24) = v13;
            v29 = (_QWORD *)*v23;
            if (*v23)
            {
              do
              {
                v30 = v29[1];
                if (v25.u32[0] > 1uLL)
                {
                  if (v30 >= *(_QWORD *)&prime)
                    v30 %= *(_QWORD *)&prime;
                }
                else
                {
                  v30 &= *(_QWORD *)&prime - 1;
                }
                if (v30 != v24)
                {
                  v31 = *((_QWORD *)self + 12);
                  if (!*(_QWORD *)(v31 + 8 * v30))
                  {
                    *(_QWORD *)(v31 + 8 * v30) = v23;
                    goto LABEL_55;
                  }
                  *v23 = *v29;
                  *v29 = **(_QWORD **)(*((_QWORD *)self + 12) + 8 * v30);
                  **(_QWORD **)(*((_QWORD *)self + 12) + 8 * v30) = v29;
                  v29 = v23;
                }
                v30 = v24;
LABEL_55:
                v23 = v29;
                v29 = (_QWORD *)*v29;
                v24 = v30;
              }
              while (v29);
            }
          }
          v8 = (unint64_t)prime;
          goto LABEL_59;
        }
        v37 = (void *)*((_QWORD *)self + 12);
        *((_QWORD *)self + 12) = 0;
        if (v37)
          operator delete(v37);
        v8 = 0;
        *((_QWORD *)self + 13) = 0;
      }
    }
LABEL_59:
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v8 <= v6)
        v3 = v6 % v8;
      else
        v3 = v6;
    }
    else
    {
      v3 = (v8 - 1) & v6;
    }
  }
  v32 = *((_QWORD *)self + 12);
  v33 = *(_QWORD **)(v32 + 8 * v3);
  if (v33)
  {
    *i = *v33;
LABEL_72:
    *v33 = i;
    goto LABEL_73;
  }
  *i = *v13;
  *v13 = i;
  *(_QWORD *)(v32 + 8 * v3) = v13;
  if (*i)
  {
    v34 = *(_QWORD *)(*i + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v34 >= v8)
        v34 %= v8;
    }
    else
    {
      v34 &= v8 - 1;
    }
    v33 = (_QWORD *)(*((_QWORD *)self + 12) + 8 * v34);
    goto LABEL_72;
  }
LABEL_73:
  ++*((_QWORD *)self + 15);
LABEL_74:
  v35 = (void *)i[3];
  i[3] = v7;

  return v6;
}

- (void)removeControllerPauseStateDidUpdateCallback:(unint64_t)a3
{
  unint64_t v3;
  uint8x8_t v4;
  unint64_t v5;
  uint64_t v6;
  void **v7;
  _QWORD *v8;
  unint64_t v9;
  unint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;

  v3 = *((_QWORD *)self + 13);
  if (!v3)
    return;
  v4 = (uint8x8_t)vcnt_s8((int8x8_t)v3);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    v5 = a3;
    if (v3 <= a3)
      v5 = a3 % v3;
  }
  else
  {
    v5 = (v3 - 1) & a3;
  }
  v6 = *((_QWORD *)self + 12);
  v7 = *(void ***)(v6 + 8 * v5);
  if (!v7)
    return;
  v8 = *v7;
  if (!*v7)
    return;
  v9 = v3 - 1;
  while (1)
  {
    v10 = v8[1];
    if (v10 == a3)
      break;
    if (v4.u32[0] > 1uLL)
    {
      if (v10 >= v3)
        v10 %= v3;
    }
    else
    {
      v10 &= v9;
    }
    if (v10 != v5)
      return;
LABEL_17:
    v8 = (_QWORD *)*v8;
    if (!v8)
      return;
  }
  if (v8[2] != a3)
    goto LABEL_17;
  v11 = (_QWORD *)*v8;
  if (v4.u32[0] > 1uLL)
  {
    if (v3 <= a3)
      a3 %= v3;
  }
  else
  {
    a3 &= v9;
  }
  v12 = *(_QWORD **)(v6 + 8 * a3);
  do
  {
    v13 = v12;
    v12 = (_QWORD *)*v12;
  }
  while (v12 != v8);
  if (v13 == (_QWORD *)((char *)self + 112))
    goto LABEL_36;
  v14 = v13[1];
  if (v4.u32[0] > 1uLL)
  {
    if (v14 >= v3)
      v14 %= v3;
  }
  else
  {
    v14 &= v9;
  }
  if (v14 == a3)
  {
LABEL_38:
    if (v11)
    {
      v15 = v11[1];
      goto LABEL_40;
    }
  }
  else
  {
LABEL_36:
    if (!v11)
      goto LABEL_37;
    v15 = v11[1];
    if (v4.u32[0] > 1uLL)
    {
      v16 = v11[1];
      if (v15 >= v3)
        v16 = v15 % v3;
    }
    else
    {
      v16 = v15 & v9;
    }
    if (v16 != a3)
    {
LABEL_37:
      *(_QWORD *)(v6 + 8 * a3) = 0;
      v11 = (_QWORD *)*v8;
      goto LABEL_38;
    }
LABEL_40:
    if (v4.u32[0] > 1uLL)
    {
      if (v15 >= v3)
        v15 %= v3;
    }
    else
    {
      v15 &= v9;
    }
    if (v15 != a3)
    {
      *(_QWORD *)(*((_QWORD *)self + 12) + 8 * v15) = v13;
      v11 = (_QWORD *)*v8;
    }
  }
  *v13 = v11;
  *v8 = 0;
  --*((_QWORD *)self + 15);

  operator delete(v8);
}

- (void)updateController:(id)a3 pauseState:(BOOL)a4
{
  _BOOL8 v4;
  Phase *v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t **j;
  void (**v14)(void *, _QWORD, Phase *, _BOOL8);
  char *v15;
  _BOOL4 IsFeatureEnabled_SessionBasedMuting;
  id obj;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v4 = a4;
  v24 = *MEMORY[0x24BDAC8D0];
  v6 = (Phase *)a3;
  IsFeatureEnabled_SessionBasedMuting = Phase::IsFeatureEnabled_SessionBasedMuting(v6);
  if (IsFeatureEnabled_SessionBasedMuting)
  {
    v15 = (char *)self + 88;
    os_unfair_recursive_lock_lock_with_options();
  }
  else
  {
    v15 = 0;
  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(*((id *)self + 1), "allKeys", v15);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v18 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v18)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(*((id *)self + 1), "objectForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "outputStreams");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKey:", v6);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_msgSend(v12, "setControllerPaused:", v4);
          for (j = (uint64_t **)*((_QWORD *)self + 14); j; j = (uint64_t **)*j)
          {
            v14 = (void (**)(void *, _QWORD, Phase *, _BOOL8))_Block_copy(j[3]);
            v14[2](v14, v9, v6, v4);

          }
        }

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v7);
  }

  if (IsFeatureEnabled_SessionBasedMuting)
    os_unfair_recursive_lock_unlock();

}

- (void)gatherDebugInformation:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t j;
  void *v10;
  PHASEExternalStreamDebugInfo *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  void *v20;
  PHASEExternalStreamDebugInfo *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _BOOL4 IsFeatureEnabled_SessionBasedMuting;
  Phase *v29;
  id obj;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v35;
  uint64_t i;
  id v37;
  id v38;
  PHASEExternalStreamGroupDebugInfo *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v29 = (Phase *)a3;
  IsFeatureEnabled_SessionBasedMuting = Phase::IsFeatureEnabled_SessionBasedMuting(v29);
  if (IsFeatureEnabled_SessionBasedMuting)
    os_unfair_recursive_lock_lock_with_options();
  v32 = (void *)objc_opt_new();
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  obj = *((id *)self + 1);
  v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
  if (v33)
  {
    v31 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v33; ++i)
      {
        if (*(_QWORD *)v49 != v31)
          objc_enumerationMutation(obj);
        v3 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        v39 = objc_alloc_init(PHASEExternalStreamGroupDebugInfo);
        v35 = v3;
        objc_msgSend(*((id *)self + 1), "objectForKey:", v3);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "controllingClientID");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        -[PHASEExternalStreamGroupDebugInfo setControlled:](v39, "setControlled:", v5 != 0);

        v6 = (void *)objc_opt_new();
        v46 = 0u;
        v47 = 0u;
        v44 = 0u;
        v45 = 0u;
        objc_msgSend(v4, "outputStreams");
        v37 = (id)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
        if (v7)
        {
          v8 = *(_QWORD *)v45;
          do
          {
            for (j = 0; j != v7; ++j)
            {
              if (*(_QWORD *)v45 != v8)
                objc_enumerationMutation(v37);
              v10 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * j);
              v11 = objc_alloc_init(PHASEExternalStreamDebugInfo);
              objc_msgSend(v4, "outputStreams");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "objectForKey:", v10);
              v13 = (void *)objc_claimAutoreleasedReturnValue();

              -[PHASEExternalStreamDebugInfo setStreamPaused:](v11, "setStreamPaused:", objc_msgSend(v13, "isStreamPaused"));
              -[PHASEExternalStreamDebugInfo setInput:](v11, "setInput:", 0);
              objc_msgSend(v13, "definition");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "format");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              -[PHASEExternalStreamDebugInfo setClientFormat:](v11, "setClientFormat:", v15);

              -[PHASEExternalStreamGroupDebugInfo setControllerPaused:](v39, "setControllerPaused:", objc_msgSend(v13, "isControllerPaused"));
              objc_msgSend(v10, "UUIDString");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "setObject:forKey:", v11, v16);

            }
            v7 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
          }
          while (v7);
        }

        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
        objc_msgSend(v4, "inputStreams");
        v38 = (id)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
        if (v17)
        {
          v18 = *(_QWORD *)v41;
          do
          {
            for (k = 0; k != v17; ++k)
            {
              if (*(_QWORD *)v41 != v18)
                objc_enumerationMutation(v38);
              v20 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * k);
              v21 = objc_alloc_init(PHASEExternalStreamDebugInfo);
              objc_msgSend(v4, "inputStreams");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "objectForKey:", v20);
              v23 = (void *)objc_claimAutoreleasedReturnValue();

              -[PHASEExternalStreamDebugInfo setStreamPaused:](v21, "setStreamPaused:", objc_msgSend(v23, "isStreamPaused"));
              -[PHASEExternalStreamDebugInfo setInput:](v21, "setInput:", 1);
              objc_msgSend(v23, "definition");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "format");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              -[PHASEExternalStreamDebugInfo setClientFormat:](v21, "setClientFormat:", v25);

              objc_msgSend(v20, "UUIDString");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "setObject:forKey:", v21, v26);

            }
            v17 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
          }
          while (v17);
        }

        -[PHASEExternalStreamGroupDebugInfo setStreams:](v39, "setStreams:", v6);
        objc_msgSend(v35, "UUIDString");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setObject:forKey:", v39, v27);

      }
      v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
    }
    while (v33);
  }

  (*((void (**)(Phase *, void *, _QWORD))v29 + 2))(v29, v32, 0);
  if (IsFeatureEnabled_SessionBasedMuting)
    os_unfair_recursive_lock_unlock();

}

- (void).cxx_destruct
{
  id *v3;
  id *v4;
  void *v5;

  v3 = (id *)*((_QWORD *)self + 14);
  if (v3)
  {
    do
    {
      v4 = (id *)*v3;

      operator delete(v3);
      v3 = v4;
    }
    while (v4);
  }
  v5 = (void *)*((_QWORD *)self + 12);
  *((_QWORD *)self + 12) = 0;
  if (v5)
    operator delete(v5);
  Phase::Commandable<128,Phase::LockFreeQueueMPSC>::~Commandable((_QWORD *)self + 6);
  objc_storeStrong((id *)self + 4, 0);
  objc_storeStrong((id *)self + 1, 0);
}

- (id).cxx_construct
{
  char *v3;
  uint64_t InstancePtr;

  v3 = (char *)self + 48;
  InstancePtr = Phase::Logger::GetInstancePtr((Phase::Logger *)self);
  Phase::Commandable<128,Phase::LockFreeQueueMPSC>::Commandable((uint64_t)v3, *(_QWORD *)(InstancePtr + 912), 1, 0x20000);
  *((_QWORD *)self + 6) = off_24D57CA60;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 104) = 0u;
  *((_QWORD *)self + 15) = 0;
  *((_DWORD *)self + 32) = 1065353216;
  return self;
}

- (uint64_t)setExternalInputStreamSessionMute:(uint64_t)a1 isMuted:fadeTimeInSeconds:
{

  return a1;
}

- (void)setExternalInputStreamSessionMute:(uint64_t)a1 isMuted:fadeTimeInSeconds:
{

  JUMPOUT(0x2199F9D70);
}

- (uint64_t)setExternalInputStreamSessionMute:isMuted:fadeTimeInSeconds:
{
  LODWORD(a2) = *(_DWORD *)(a1 + 24);
  return objc_msgSend(*(id *)(a1 + 8), "_fadeInputStreamsInSessionToken:isMuted:fadeTimeInSeconds:synchronous:", *(unsigned int *)(a1 + 16), *(unsigned __int8 *)(a1 + 20), 0, a2);
}

@end
