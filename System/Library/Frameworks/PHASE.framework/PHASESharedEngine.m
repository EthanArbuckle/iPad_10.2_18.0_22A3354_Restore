@implementation PHASESharedEngine

- (PHASESharedEngine)initWithUpdateMode:(int64_t)a3 error:(id *)a4
{
  PHASESharedEngine *v5;
  uint64_t v6;
  Phase::Logger *v7;
  NSObject *v8;
  void *v9;
  objc_super v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  void *v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  if (a4)
    *a4 = 0;
  v11.receiver = self;
  v11.super_class = (Class)PHASESharedEngine;
  v5 = -[PHASEEngine initWithUpdateMode:](&v11, sel_initWithUpdateMode_, a3);
  v6 = *MEMORY[0x24BDD0FC8];
  v18 = *MEMORY[0x24BDD0FC8];
  v19[0] = CFSTR("PHASESharedEngine not available");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
  v7 = (Phase::Logger *)objc_claimAutoreleasedReturnValue();
  v8 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v7)
                                                                                     + 432)));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    -[Phase::Logger objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v13 = "PHASEEngine.mm";
    v14 = 1024;
    v15 = 1567;
    v16 = 2112;
    v17 = v9;
    _os_log_impl(&dword_2164CC000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d %@", buf, 0x1Cu);

  }
  if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.phase"), 1346913634, v7);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0;
}

- (id)rootObject
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  Phase::Logger *v7;
  Phase::Logger *v8;
  NSObject *v9;
  objc_super v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  Phase::Logger *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE0A628]);
  objc_msgSend(MEMORY[0x24BDB1858], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithSession:", v4);

  v12 = 0;
  -[PHASESharedEngine rootObjectForSessionIOBinding:error:](self, "rootObjectForSessionIOBinding:error:", v5, &v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (Phase::Logger *)v12;
  v8 = v7;
  if (!v6)
  {
    v9 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v7) + 432));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v14 = "PHASEEngine.mm";
      v15 = 1024;
      v16 = 1583;
      v17 = 2112;
      v18 = v8;
      _os_log_impl(&dword_2164CC000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to create root for [AVAudioSession sharedInstance]: %@", buf, 0x1Cu);
    }
    v11.receiver = self;
    v11.super_class = (Class)PHASESharedEngine;
    -[PHASEEngine rootObject](&v11, sel_rootObject);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (PHASESharedListener)sharedListener
{
  PHASESharedListener *sharedListener;
  PHASESharedListener *v4;
  PHASESharedListener *v5;

  sharedListener = self->_sharedListener;
  if (!sharedListener)
  {
    v4 = -[PHASESharedListener initInternalWithEngine:]([PHASESharedListener alloc], "initInternalWithEngine:", self);
    v5 = self->_sharedListener;
    self->_sharedListener = v4;

    sharedListener = self->_sharedListener;
  }
  return sharedListener;
}

- (id)sessionRootObjects
{
  NSMutableDictionary *sessionRootObjects;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;

  sessionRootObjects = self->_sessionRootObjects;
  if (!sessionRootObjects)
  {
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v5 = self->_sessionRootObjects;
    self->_sessionRootObjects = v4;

    sessionRootObjects = self->_sessionRootObjects;
  }
  return sessionRootObjects;
}

- (id)rootObjectForSessionUUID:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  PHASESharedRoot *v8;
  void *v9;
  uint64_t v10;
  Phase::Logger *v11;
  NSObject *v12;
  void *v13;
  int v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (a4)
    *a4 = 0;
  if (Phase::CurrentProcessCanModifySharedEntities(void)::onceToken != -1)
    dispatch_once(&Phase::CurrentProcessCanModifySharedEntities(void)::onceToken, &__block_literal_global_4);
  if (Phase::CurrentProcessCanModifySharedEntities(void)::currentProcessCanModifySharedEntities)
  {
    -[PHASESharedEngine sessionRootObjects](self, "sessionRootObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v6);
    v8 = (PHASESharedRoot *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v8 = -[PHASESharedRoot initWithEngine:sessionUUID:]([PHASESharedRoot alloc], "initWithEngine:sessionUUID:", self, v6);
      -[PHASESharedEngine sessionRootObjects](self, "sessionRootObjects");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKey:", v8, v6);

    }
  }
  else
  {
    v10 = *MEMORY[0x24BDD0FC8];
    v21 = *MEMORY[0x24BDD0FC8];
    v22[0] = CFSTR("Insufficient permissions to access root object by UUID");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v11 = (Phase::Logger *)objc_claimAutoreleasedReturnValue();
    v12 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v11)
                                                                                        + 432)));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      -[Phase::Logger objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 136315650;
      v16 = "PHASEEngine.mm";
      v17 = 1024;
      v18 = 1621;
      v19 = 2112;
      v20 = v13;
      _os_log_impl(&dword_2164CC000, v12, OS_LOG_TYPE_ERROR, "%25s:%-5d %@", (uint8_t *)&v15, 0x1Cu);

    }
    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.phase"), 1346913634, v11);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

    v8 = 0;
  }

  return v8;
}

- (id)rootObjectForSessionIOBinding:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  Phase::Logger *v14;
  void *v15;
  PHASESharedRoot *v16;
  PHASESharedRoot *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  Phase::Logger *v24;
  NSObject *v25;
  void *v26;
  uint64_t v28;
  const __CFString *v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  void *v35;
  uint64_t v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = v6;
  if (a4)
    *a4 = 0;
  objc_msgSend(v6, "session");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

LABEL_9:
    v20 = *MEMORY[0x24BDD0FC8];
    v36 = *MEMORY[0x24BDD0FC8];
    v37[0] = CFSTR("rootObjectForSessionIOBinding:error: not implemented");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
    v14 = (Phase::Logger *)objc_claimAutoreleasedReturnValue();
    v21 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v14)
                                                                                        + 432)));
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      -[Phase::Logger objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v31 = "PHASEEngine.mm";
      v32 = 1024;
      v33 = 1654;
      v34 = 2112;
      v35 = v22;
      _os_log_impl(&dword_2164CC000, v21, OS_LOG_TYPE_ERROR, "%25s:%-5d %@", buf, 0x1Cu);

    }
    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.phase"), 1346913634, v14);
      v16 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    }
LABEL_18:
    v16 = 0;
    goto LABEL_19;
  }
  objc_msgSend(v7, "session");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "spatialTrackingLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    goto LABEL_9;
  v11 = objc_alloc(MEMORY[0x24BDD1880]);
  objc_msgSend(v7, "session");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "spatialTrackingLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (Phase::Logger *)objc_msgSend(v11, "initWithUUIDString:", v13);

  if (!v14)
  {
    v23 = *MEMORY[0x24BDD0FC8];
    v28 = *MEMORY[0x24BDD0FC8];
    v29 = CFSTR("AVAudioSessionIOBinding has invalid session");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
    v24 = (Phase::Logger *)objc_claimAutoreleasedReturnValue();
    v25 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v24)
                                                                                        + 432)));
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      -[Phase::Logger objectForKeyedSubscript:](v24, "objectForKeyedSubscript:", v23);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v31 = "PHASEEngine.mm";
      v32 = 1024;
      v33 = 1669;
      v34 = 2112;
      v35 = v26;
      _os_log_impl(&dword_2164CC000, v25, OS_LOG_TYPE_ERROR, "%25s:%-5d %@", buf, 0x1Cu);

    }
    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.phase"), 1346913634, v24);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

    v14 = 0;
    goto LABEL_18;
  }
  -[PHASESharedEngine sessionRootObjects](self, "sessionRootObjects");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKey:", v14);
  v16 = (PHASESharedRoot *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    v17 = [PHASESharedRoot alloc];
    objc_msgSend(v7, "session");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[PHASESharedRoot initWithEngine:session:sessionUUID:](v17, "initWithEngine:session:sessionUUID:", self, v18, v14);

    -[PHASESharedEngine sessionRootObjects](self, "sessionRootObjects");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKey:", v16, v14);

  }
LABEL_19:

  return v16;
}

- (void)gatherSharedEntityDebugInformation:(id)a3
{
  _QWORD **v4;
  id v5;

  v5 = a3;
  v4 = -[PHASEEngine implementation](self, "implementation");
  (*(void (**)(_QWORD *, id))(*v4[61] + 80))(v4[61], v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionRootObjects, 0);
  objc_storeStrong((id *)&self->_sharedListener, 0);
}

@end
