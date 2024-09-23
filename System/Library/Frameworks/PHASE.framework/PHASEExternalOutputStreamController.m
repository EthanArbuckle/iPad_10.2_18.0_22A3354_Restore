@implementation PHASEExternalOutputStreamController

- (PHASEExternalOutputStreamController)init
{
  -[PHASEExternalOutputStreamController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

+ (id)new
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (PHASEExternalOutputStreamController)initWithEngine:(id)a3 streamGroupUUID:(id)a4 gainMetaParameterDefinition:(id)a5 mixerDefinition:(id)a6 source:(id)a7 listener:(id)a8 group:(id)a9 normalize:(BOOL)a10 targetLKFS:(id)a11 calibrationMode:(int64_t)a12 level:(double)a13 outError:(id *)a14
{
  PHASEExternalOutputStreamController *v21;
  PHASEExternalOutputStreamController *v22;
  NSMutableDictionary *v23;
  NSMutableDictionary *soundEvents;
  NSMutableDictionary *v25;
  NSMutableDictionary *metaParameters;
  void *v27;
  uint64_t v28;
  uint64_t i;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  NSMutableDictionary *v35;
  PHASENumberMetaParameter *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  PHASENumberMetaParameter *v46;
  void *v47;
  void *v48;
  int v49;
  uint64_t v50;
  void *v51;
  void *v52;
  Phase::Logger *v53;
  NSObject *v54;
  id v55;
  uint64_t v56;
  PHASEExternalOutputStreamController *v57;
  NSMutableDictionary *v58;
  PHASENumberMetaParameter *v59;
  void *v60;
  void *v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  PHASENumberMetaParameter *v67;
  void *v68;
  id *p_gainMetaParameterDefinition;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id obj;
  id v78;
  id v79;
  uint64_t v80;
  id v81;
  uint64_t v82;
  void *v83;
  PHASEExternalOutputStreamController *v84;
  void *v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  objc_super v90;
  uint8_t buf[4];
  const char *v92;
  __int16 v93;
  int v94;
  __int16 v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  _BYTE v99[128];
  uint64_t v100;

  v100 = *MEMORY[0x24BDAC8D0];
  obj = a3;
  v71 = a4;
  v72 = a5;
  v78 = a6;
  v73 = a7;
  v74 = a8;
  v75 = a9;
  v76 = a11;
  if (a14)
    *a14 = 0;
  v90.receiver = self;
  v90.super_class = (Class)PHASEExternalOutputStreamController;
  v21 = -[PHASEExternalOutputStreamController init](&v90, sel_init);
  v22 = v21;
  v84 = v21;
  if (!v21)
    goto LABEL_27;
  objc_storeWeak((id *)&v21->_engine, obj);
  objc_storeStrong((id *)&v84->_streamGroupUUID, a4);
  p_gainMetaParameterDefinition = (id *)&v84->_gainMetaParameterDefinition;
  objc_storeStrong((id *)&v84->_gainMetaParameterDefinition, a5);
  objc_storeStrong((id *)&v84->_mixerDefinition, a6);
  objc_storeStrong((id *)&v84->_source, a7);
  objc_storeStrong((id *)&v84->_listener, a8);
  objc_storeStrong((id *)&v84->_group, a9);
  v84->_level = a13;
  v84->_normalize = a10;
  objc_storeStrong((id *)&v84->_targetLKFS, a11);
  v84->_calibrationMode = a12;
  v84->_controlToken.mStorage[0] = 0;
  v84->_controlToken.mStorage[1] = 0;
  v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  soundEvents = v84->_soundEvents;
  v84->_soundEvents = v23;

  v25 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  metaParameters = v84->_metaParameters;
  v84->_metaParameters = v25;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v86 = 0u;
    v87 = 0u;
    v88 = 0u;
    v89 = 0u;
    v81 = v78;
    objc_msgSend(v81, "spatialPipeline");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "entries");
    v79 = (id)objc_claimAutoreleasedReturnValue();

    v28 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v86, v99, 16);
    if (v28)
    {
      v80 = *(_QWORD *)v87;
      do
      {
        v82 = v28;
        for (i = 0; i != v82; ++i)
        {
          if (*(_QWORD *)v87 != v80)
            objc_enumerationMutation(v79);
          v30 = *(_QWORD *)(*((_QWORD *)&v86 + 1) + 8 * i);
          objc_msgSend(v81, "spatialPipeline");
          v31 = objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v31, "entries");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "objectForKey:", v30);
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v33, "sendLevelMetaParameterDefinition");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v31) = v34 == 0;

          if ((v31 & 1) == 0)
          {
            v35 = v84->_metaParameters;
            v36 = [PHASENumberMetaParameter alloc];
            objc_msgSend(v33, "sendLevelMetaParameterDefinition");
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v83, "identifier");
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "sendLevelMetaParameterDefinition");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "value");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "doubleValue");
            v40 = v39;
            objc_msgSend(v33, "sendLevelMetaParameterDefinition");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "minimum");
            v43 = v42;
            objc_msgSend(v33, "sendLevelMetaParameterDefinition");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "maximum");
            v46 = -[PHASENumberMetaParameter initWithUID:value:rangeMin:rangeMax:delegate:](v36, "initWithUID:value:rangeMin:rangeMax:delegate:", v85, v84, v40, v43, v45);
            objc_msgSend(v33, "sendLevelMetaParameterDefinition");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "identifier");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setValue:forKey:](v35, "setValue:forKey:", v46, v48);

          }
        }
        v28 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v86, v99, 16);
      }
      while (v28);
    }

    v49 = 6553601;
    goto LABEL_18;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v78, "inputChannelLayout");
    v81 = (id)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v81, "layoutTag");
LABEL_18:
    v84->_channelLayoutTag = v49;

  }
  v22 = v84;
  if ((v84->_channelLayoutTag | 0x10000) != 0x10000)
  {
    if (*p_gainMetaParameterDefinition)
    {
      v58 = v84->_metaParameters;
      v59 = [PHASENumberMetaParameter alloc];
      objc_msgSend(*p_gainMetaParameterDefinition, "identifier");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*p_gainMetaParameterDefinition, "value");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "doubleValue");
      v63 = v62;
      objc_msgSend(*p_gainMetaParameterDefinition, "minimum");
      v65 = v64;
      objc_msgSend(*p_gainMetaParameterDefinition, "maximum");
      v67 = -[PHASENumberMetaParameter initWithUID:value:rangeMin:rangeMax:delegate:](v59, "initWithUID:value:rangeMin:rangeMax:delegate:", v60, v84, v63, v65, v66);
      objc_msgSend(*p_gainMetaParameterDefinition, "identifier");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setValue:forKey:](v58, "setValue:forKey:", v67, v68);

      v22 = v84;
    }
LABEL_27:
    v57 = v22;
    goto LABEL_28;
  }
  v50 = *MEMORY[0x24BDD0FC8];
  v97 = *MEMORY[0x24BDD0FC8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("PHASEExternalOutputStreamController's mixer definition can't use channel bitmap or channel descriptions"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = v51;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v98, &v97, 1);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  v54 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v53)
                                                                                      + 432)));
  if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v52, "objectForKeyedSubscript:", v50);
    v55 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v56 = objc_msgSend(v55, "UTF8String");
    *(_DWORD *)buf = 136315650;
    v92 = "PHASEExternalStream.mm";
    v93 = 1024;
    v94 = 669;
    v95 = 2080;
    v96 = v56;
    _os_log_impl(&dword_2164CC000, v54, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", buf, 0x1Cu);

  }
  if (a14)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.phase"), 1346922849, v52);
    *a14 = (id)objc_claimAutoreleasedReturnValue();
  }

  v57 = 0;
LABEL_28:

  return v57;
}

+ (void)controllerWithEngine:(id)a3 streamUUID:(id)a4 mixerDefinition:(id)a5 source:(id)a6 listener:(id)a7 callback:(id)a8
{
  +[PHASEExternalOutputStreamController controllerWithEngine:streamUUID:gainMetaParameterDefinition:mixerDefinition:source:listener:callback:](PHASEExternalOutputStreamController, "controllerWithEngine:streamUUID:gainMetaParameterDefinition:mixerDefinition:source:listener:callback:", a3, a4, 0, a5, a6, a7, a8);
}

+ (void)controllerWithEngine:(id)a3 streamUUID:(id)a4 gainMetaParameterDefinition:(id)a5 mixerDefinition:(id)a6 source:(id)a7 listener:(id)a8 callback:(id)a9
{
  +[PHASEExternalOutputStreamController controllerWithEngine:streamUUID:gainMetaParameterDefinition:mixerDefinition:source:listener:referenceGainDBSPL:callback:](PHASEExternalOutputStreamController, "controllerWithEngine:streamUUID:gainMetaParameterDefinition:mixerDefinition:source:listener:referenceGainDBSPL:callback:", a3, a4, a5, a6, a7, a8, 75.0);
}

+ (void)controllerWithEngine:(id)a3 streamUUID:(id)a4 gainMetaParameterDefinition:(id)a5 mixerDefinition:(id)a6 source:(id)a7 listener:(id)a8 referenceGainDBSPL:(double)a9 callback:(id)a10
{
  uint64_t v10;

  LOBYTE(v10) = 1;
  +[PHASEExternalOutputStreamController controllerWithEngine:streamUUID:gainMetaParameterDefinition:mixerDefinition:source:listener:normalize:calibrationMode:level:callback:](PHASEExternalOutputStreamController, "controllerWithEngine:streamUUID:gainMetaParameterDefinition:mixerDefinition:source:listener:normalize:calibrationMode:level:callback:", a3, a4, a5, a6, a7, a8, a9, v10, 2, a10);
}

+ (void)controllerWithEngine:(id)a3 streamUUID:(id)a4 gainMetaParameterDefinition:(id)a5 mixerDefinition:(id)a6 source:(id)a7 listener:(id)a8 normalize:(BOOL)a9 calibrationMode:(int64_t)a10 level:(double)a11 callback:(id)a12
{
  uint64_t v12;

  LOBYTE(v12) = a9;
  +[PHASEExternalOutputStreamController controllerWithEngine:streamUUID:gainMetaParameterDefinition:mixerDefinition:source:listener:group:normalize:calibrationMode:level:callback:](PHASEExternalOutputStreamController, "controllerWithEngine:streamUUID:gainMetaParameterDefinition:mixerDefinition:source:listener:group:normalize:calibrationMode:level:callback:", a3, a4, a5, a6, a7, a8, a11, 0, v12, a10, a12);
}

+ (void)controllerWithEngine:(id)a3 streamUUID:(id)a4 gainMetaParameterDefinition:(id)a5 mixerDefinition:(id)a6 source:(id)a7 listener:(id)a8 group:(id)a9 normalize:(BOOL)a10 calibrationMode:(int64_t)a11 level:(double)a12 callback:(id)a13
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  uint64_t v27;
  id v28;

  v28 = a3;
  v19 = a4;
  v20 = a5;
  v21 = a6;
  v22 = a7;
  v23 = a8;
  v24 = a9;
  v25 = a13;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", -12.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v27) = a10;
  +[PHASEExternalOutputStreamController controllerWithEngine:streamUUID:gainMetaParameterDefinition:mixerDefinition:source:listener:group:normalize:targetLKFS:calibrationMode:level:callback:](PHASEExternalOutputStreamController, "controllerWithEngine:streamUUID:gainMetaParameterDefinition:mixerDefinition:source:listener:group:normalize:targetLKFS:calibrationMode:level:callback:", v28, v19, v20, v21, v22, v23, a12, v24, v27, v26, a11, v25);

}

+ (void)controllerWithEngine:(id)a3 streamUUID:(id)a4 gainMetaParameterDefinition:(id)a5 mixerDefinition:(id)a6 source:(id)a7 listener:(id)a8 group:(id)a9 normalize:(BOOL)a10 targetLKFS:(id)a11 calibrationMode:(int64_t)a12 level:(double)a13 callback:(id)a14
{
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  void (**v31)(id, _QWORD, id);
  PHASEExternalOutputStreamController *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  void *v38;
  void *v39;
  _QWORD v40[4];
  PHASEExternalOutputStreamController *v41;
  id v42;
  void (**v43)(id, _QWORD, id);
  _QWORD v44[4];
  id v45;
  id location;
  id v47[2];

  v20 = a3;
  v21 = a4;
  v22 = a5;
  v23 = a6;
  v24 = a7;
  v25 = v22;
  v26 = v24;
  v27 = a8;
  v28 = a9;
  v29 = a11;
  v30 = v20;
  v31 = (void (**)(id, _QWORD, id))a14;
  v39 = v27;
  v47[0] = 0;
  LOBYTE(v36) = a10;
  v32 = -[PHASEExternalOutputStreamController initWithEngine:streamGroupUUID:gainMetaParameterDefinition:mixerDefinition:source:listener:group:normalize:targetLKFS:calibrationMode:level:outError:]([PHASEExternalOutputStreamController alloc], "initWithEngine:streamGroupUUID:gainMetaParameterDefinition:mixerDefinition:source:listener:group:normalize:targetLKFS:calibrationMode:level:outError:", v30, v21, v22, v23, v26, v27, a13, v28, v36, v29, a12, v47);
  v33 = v47[0];
  if (v33 || !v32)
  {
    v31[2](v31, 0, v33);
  }
  else
  {
    v37 = v23;
    objc_initWeak(&location, v32);
    v38 = v30;
    v34 = *(_QWORD *)(objc_msgSend(v30, "implementation") + 416);
    v35 = MEMORY[0x24BDAC760];
    v44[0] = MEMORY[0x24BDAC760];
    v44[1] = 3221225472;
    v44[2] = __189__PHASEExternalOutputStreamController_controllerWithEngine_streamUUID_gainMetaParameterDefinition_mixerDefinition_source_listener_group_normalize_targetLKFS_calibrationMode_level_callback___block_invoke;
    v44[3] = &unk_24D57F430;
    objc_copyWeak(&v45, &location);
    v40[0] = v35;
    v40[1] = 3221225472;
    v40[2] = __189__PHASEExternalOutputStreamController_controllerWithEngine_streamUUID_gainMetaParameterDefinition_mixerDefinition_source_listener_group_normalize_targetLKFS_calibrationMode_level_callback___block_invoke_2;
    v40[3] = &unk_24D57F458;
    v41 = v32;
    v42 = 0;
    v43 = v31;
    (*(void (**)(uint64_t, id, _QWORD *, _QWORD *))(*(_QWORD *)v34 + 40))(v34, v21, v44, v40);

    objc_destroyWeak(&v45);
    objc_destroyWeak(&location);
    v30 = v38;
    v23 = v37;
  }

}

void __189__PHASEExternalOutputStreamController_controllerWithEngine_streamUUID_gainMetaParameterDefinition_mixerDefinition_source_listener_group_normalize_targetLKFS_calibrationMode_level_callback___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id WeakRetained;
  void *v9;
  id v10;

  v10 = a2;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v9 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "updateStreamGroupUUID:streamUUID:state:", v10, v7, a4);

}

void __189__PHASEExternalOutputStreamController_controllerWithEngine_streamUUID_gainMetaParameterDefinition_mixerDefinition_source_listener_group_normalize_targetLKFS_calibrationMode_level_callback___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;

  v11 = a4;
  if (v11)
  {
    v7 = *(id *)(a1 + 32);
    objc_sync_enter(v7);
    v8 = *(_QWORD *)(a1 + 32);
    *(_QWORD *)(v8 + 16) = 0;
    *(_QWORD *)(v8 + 24) = 0;
    objc_sync_exit(v7);

  }
  else
  {
    v9 = *(id *)(a1 + 32);
    objc_sync_enter(v9);
    v10 = *(_QWORD *)(a1 + 32);
    *(_QWORD *)(v10 + 16) = a2;
    *(_QWORD *)(v10 + 24) = a3;
    objc_sync_exit(v9);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (id)metaParametersForStreamUUID:(id)a3
{
  id v4;
  PHASEExternalOutputStreamController *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[NSMutableDictionary objectForKey:](v5->_soundEvents, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "metaParameters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v5);
  return v7;
}

- (id)soundEventForStreamUUID:(id)a3
{
  id v4;
  PHASEExternalOutputStreamController *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[NSMutableDictionary objectForKey:](v5->_soundEvents, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  return v6;
}

- (void)setMetaParameter:(id)a3 value:(double)a4 withTimeInterval:(double)a5
{
  id v8;
  PHASEExternalOutputStreamController *v9;
  void *v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  Phase::Logger *v18;
  NSObject *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  id v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = self;
  objc_sync_enter(v9);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[NSMutableDictionary allKeys](v9->_soundEvents, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
  if (v11)
  {
    v13 = *(_QWORD *)v22;
    *(_QWORD *)&v12 = 136315650;
    v20 = v12;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v22 != v13)
          objc_enumerationMutation(v10);
        -[NSMutableDictionary objectForKey:](v9->_soundEvents, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v14), v20);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "metaParameters");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKey:", v8);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          objc_msgSend(v17, "fadeToValue:duration:", a4, a5);
        }
        else
        {
          v19 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v18) + 432));
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v20;
            v26 = "PHASEExternalStream.mm";
            v27 = 1024;
            v28 = 907;
            v29 = 2112;
            v30 = v8;
            _os_log_impl(&dword_2164CC000, v19, OS_LOG_TYPE_ERROR, "%25s:%-5d setting unknown meta parameter UID %@", buf, 0x1Cu);
          }
        }

        ++v14;
      }
      while (v11 != v14);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
    }
    while (v11);
  }

  objc_sync_exit(v9);
}

- (void)updateStreamGroupUUID:(id)a3 streamUUID:(id)a4 state:(int64_t)a5
{
  id v8;
  id v9;
  PHASEExternalOutputStreamController *v10;
  Phase::Logger *v11;
  Phase::Logger *v12;
  PHASESoundEvent *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  PHASEExternalOutputStreamNodeDefinition *v18;
  PHASEMixerDefinition *mixerDefinition;
  uint64_t channelLayoutTag;
  void *v21;
  PHASEExternalOutputStreamNodeDefinition *v22;
  void *v23;
  void *v24;
  PHASESoundEvent *v25;
  PHASESource *source;
  PHASEListener *listener;
  Phase::Logger *v28;
  NSObject *v29;
  void *v30;
  int64_t state;
  NSObject *v32;
  NSMutableDictionary *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  BOOL v41;
  void *v42;
  Phase::Logger *v43;
  id v44;
  PHASEExternalOutputStreamNodeDefinition *v45;
  id WeakRetained;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  id v52;
  uint8_t v53[128];
  uint8_t buf[4];
  const char *v55;
  __int16 v56;
  int v57;
  __int16 v58;
  id v59;
  __int16 v60;
  id v61;
  __int16 v62;
  Phase::Logger *v63;
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = self;
  objc_sync_enter(v10);
  v47 = v9;
  v11 = (Phase::Logger *)objc_msgSend(v8, "isEqual:", v10->_streamGroupUUID);
  if ((v11 & 1) != 0)
  {
    if (a5 == 1)
    {
      -[NSMutableDictionary objectForKey:](v10->_soundEvents, "objectForKey:", v9);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stopAndInvalidate");
      -[NSMutableDictionary removeObjectForKey:](v10->_soundEvents, "removeObjectForKey:", v9);

    }
    else if (!a5)
    {
      WeakRetained = objc_loadWeakRetained((id *)&v10->_engine);
      if (WeakRetained)
      {
        -[NSMutableDictionary objectForKey:](v10->_soundEvents, "objectForKey:", v9);
        v12 = (Phase::Logger *)objc_claimAutoreleasedReturnValue();
        v13 = (PHASESoundEvent *)v12;
        if (v12)
        {
          v14 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v12) + 432));
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315906;
            v55 = "PHASEExternalStream.mm";
            v56 = 1024;
            v57 = 947;
            v58 = 2112;
            v59 = v9;
            v60 = 2112;
            v61 = v8;
            _os_log_impl(&dword_2164CC000, v14, OS_LOG_TYPE_ERROR, "%25s:%-5d got creation update for already-known external stream %@ in stream group %@", buf, 0x26u);
          }
        }
        else
        {
          v44 = +[PHASEExternalStream newUUID](PHASEExternalStream, "newUUID");
          v18 = [PHASEExternalOutputStreamNodeDefinition alloc];
          mixerDefinition = v10->_mixerDefinition;
          channelLayoutTag = v10->_channelLayoutTag;
          objc_msgSend(v44, "UUIDString");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = -[PHASEExternalOutputStreamNodeDefinition initWithExternalOutputStreamUUID:mixerDefinition:channelLayoutTag:uid:](v18, "initWithExternalOutputStreamUUID:mixerDefinition:channelLayoutTag:uid:", v9, mixerDefinition, channelLayoutTag, v21);

          v45 = v22;
          -[PHASEExternalOutputStreamNodeDefinition setNormalize:](v22, "setNormalize:", v10->_normalize);
          -[PHASEExternalOutputStreamNodeDefinition setTargetLKFS:](v22, "setTargetLKFS:", v10->_targetLKFS);
          objc_msgSend(v47, "UUIDString");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[PHASEGeneratorNodeDefinition mixerDefinition](v22, "mixerDefinition");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setIdentifier:", v23);

          -[PHASEGeneratorNodeDefinition setCalibrationMode:level:](v22, "setCalibrationMode:level:", v10->_calibrationMode, v10->_level);
          -[PHASEGeneratorNodeDefinition setGainMetaParameterDefinition:](v22, "setGainMetaParameterDefinition:", v10->_gainMetaParameterDefinition);
          -[PHASEGeneratorNodeDefinition setGroup:](v22, "setGroup:", v10->_group);
          v25 = [PHASESoundEvent alloc];
          source = v10->_source;
          listener = v10->_listener;
          v52 = 0;
          v13 = -[PHASESoundEvent initWithEngine:rootNode:source:listener:error:](v25, "initWithEngine:rootNode:source:listener:error:", WeakRetained, v22, source, listener, &v52);
          v28 = (Phase::Logger *)v52;
          v43 = v28;
          if (!v13 || v28)
          {
            v32 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v28) + 432));
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136316162;
              v55 = "PHASEExternalStream.mm";
              v56 = 1024;
              v57 = 987;
              v58 = 2112;
              v59 = v8;
              v60 = 2112;
              v61 = v47;
              v62 = 2112;
              v63 = v43;
              _os_log_impl(&dword_2164CC000, v32, OS_LOG_TYPE_ERROR, "%25s:%-5d Controller for external stream group %@ failed to create sound event for stream ID %@: %@", buf, 0x30u);
            }
          }
          else
          {
            v29 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(0)
                                                                                                + 432)));
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              -[PHASESoundEvent description](v13, "description");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136316162;
              v55 = "PHASEExternalStream.mm";
              v56 = 1024;
              v57 = 992;
              v58 = 2112;
              v59 = v30;
              v60 = 2112;
              v61 = v8;
              v62 = 2112;
              v63 = (Phase::Logger *)v47;
              _os_log_impl(&dword_2164CC000, v29, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %@ created for external stream group %@ for stream ID %@", buf, 0x30u);

            }
            state = v10->_state;
            if (state == 1)
            {
              -[PHASESoundEvent prepareWithCompletion:](v13, "prepareWithCompletion:", 0);
            }
            else if (state == 2)
            {
              -[PHASESoundEvent startWithCompletion:](v13, "startWithCompletion:", 0);
            }
            v50 = 0u;
            v51 = 0u;
            v48 = 0u;
            v49 = 0u;
            v33 = v10->_metaParameters;
            v34 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
            if (v34)
            {
              v35 = *(_QWORD *)v49;
              do
              {
                for (i = 0; i != v34; ++i)
                {
                  if (*(_QWORD *)v49 != v35)
                    objc_enumerationMutation(v33);
                  v37 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i);
                  -[NSMutableDictionary objectForKey:](v10->_metaParameters, "objectForKey:", v37);
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  -[PHASESoundEvent metaParameters](v13, "metaParameters");
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v39, "objectForKey:", v37);
                  v40 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v38)
                    v41 = v40 == 0;
                  else
                    v41 = 1;
                  if (v41)
                    std::terminate();
                  objc_msgSend(v38, "value");
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v40, "setValue:", v42);

                }
                v34 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
              }
              while (v34);
            }

            -[NSMutableDictionary setObject:forKey:](v10->_soundEvents, "setObject:forKey:", v13, v47);
          }

        }
      }
      else
      {
        v17 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(0) + 432));
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v55 = "PHASEExternalStream.mm";
          v56 = 1024;
          v57 = 938;
          v58 = 2112;
          v59 = v8;
          _os_log_impl(&dword_2164CC000, v17, OS_LOG_TYPE_ERROR, "%25s:%-5d Controller for external stream group %@ has nil engine", buf, 0x1Cu);
        }
      }

    }
  }
  else
  {
    v15 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v11) + 432));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v55 = "PHASEExternalStream.mm";
      v56 = 1024;
      v57 = 926;
      v58 = 2112;
      v59 = v8;
      _os_log_impl(&dword_2164CC000, v15, OS_LOG_TYPE_ERROR, "%25s:%-5d got update for unknown external stream group UUID %@", buf, 0x1Cu);
    }
  }
  objc_sync_exit(v10);

}

- (NSDictionary)metaParameters
{
  PHASEExternalOutputStreamController *v2;
  NSMutableDictionary *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_metaParameters;
  objc_sync_exit(v2);

  return (NSDictionary *)v3;
}

- (NSDictionary)mixers
{
  PHASEExternalOutputStreamController *v2;
  id v3;
  NSMutableDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = v2->_soundEvents;
  v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v4);
        -[NSMutableDictionary objectForKey:](v2->_soundEvents, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v7), (_QWORD)v12);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "mixers");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addEntriesFromDictionary:", v9);

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  v10 = (void *)objc_msgSend(v3, "copy");
  objc_sync_exit(v2);

  return (NSDictionary *)v10;
}

- (BOOL)prepareAndReturnError:(id *)a3
{
  PHASEExternalOutputStreamController *v4;
  int64_t state;
  uint64_t v6;
  void *v7;
  void *v8;
  Phase::Logger *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x24BDAC8D0];
  v4 = self;
  objc_sync_enter(v4);
  if (a3)
    *a3 = 0;
  state = v4->_state;
  if (state)
  {
    v6 = *MEMORY[0x24BDD0FC8];
    v28 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Can't prepare external stream controller for stream group UUID %@ multiple times"), v4->_streamGroupUUID);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v9)
                                                                                        + 432)));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", v6);
      v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136315650;
      v23 = "PHASEExternalStream.mm";
      v24 = 1024;
      v25 = 1069;
      v26 = 2080;
      v27 = objc_msgSend(v11, "UTF8String");
      _os_log_impl(&dword_2164CC000, v10, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", buf, 0x1Cu);

    }
    if (a3)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.phase"), 1346922849, v8);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v4->_state = 1;
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[NSMutableDictionary allKeys](v4->_soundEvents, "allKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v18;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v8);
          -[NSMutableDictionary objectForKey:](v4->_soundEvents, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v14));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "prepareWithCompletion:", 0);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v12);
    }
  }

  objc_sync_exit(v4);
  return state == 0;
}

- (BOOL)startAndReturnError:(id *)a3
{
  PHASEExternalOutputStreamController *v4;
  unint64_t state;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  Phase::Logger *v13;
  NSObject *v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x24BDAC8D0];
  v4 = self;
  objc_sync_enter(v4);
  if (a3)
    *a3 = 0;
  state = v4->_state;
  if (state >= 2)
  {
    v11 = *MEMORY[0x24BDD0FC8];
    v28 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Can't start external stream controller for stream group UUID %@ multiple times"), v4->_streamGroupUUID);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v13)
                                                                                        + 432)));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", v11);
      v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136315650;
      v23 = "PHASEExternalStream.mm";
      v24 = 1024;
      v25 = 1106;
      v26 = 2080;
      v27 = objc_msgSend(v15, "UTF8String");
      _os_log_impl(&dword_2164CC000, v14, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", buf, 0x1Cu);

    }
    if (a3)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.phase"), 1346922849, v6);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v4->_state = 2;
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[NSMutableDictionary allKeys](v4->_soundEvents, "allKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v18 != v8)
            objc_enumerationMutation(v6);
          -[NSMutableDictionary objectForKey:](v4->_soundEvents, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "startWithCompletion:", 0);

        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v7);
    }
  }

  objc_sync_exit(v4);
  return state < 2;
}

- (void)stopAndInvalidate
{
  PHASEExternalOutputStreamController *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  id WeakRetained;
  void *v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  v2->_state = 3;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[NSMutableDictionary allKeys](v2->_soundEvents, "allKeys", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v3);
        -[NSMutableDictionary objectForKey:](v2->_soundEvents, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "stopAndInvalidate");

      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

  -[NSMutableDictionary removeAllObjects](v2->_soundEvents, "removeAllObjects");
  WeakRetained = objc_loadWeakRetained((id *)&v2->_engine);
  v9 = WeakRetained;
  if (WeakRetained && (v2->_controlToken.mStorage[0] || v2->_controlToken.mStorage[1]))
  {
    v10 = objc_msgSend(WeakRetained, "implementation");
    (*(void (**)(_QWORD, NSUUID *, unint64_t, unint64_t, void *))(**(_QWORD **)(v10 + 416)
                                                                                         + 48))(*(_QWORD *)(v10 + 416), v2->_streamGroupUUID, v2->_controlToken.mStorage[0], v2->_controlToken.mStorage[1], &__block_literal_global_180);
    v2->_controlToken.mStorage[0] = 0;
    v2->_controlToken.mStorage[1] = 0;
  }

  objc_sync_exit(v2);
}

- (void)dealloc
{
  objc_super v3;

  -[PHASEExternalOutputStreamController stopAndInvalidate](self, "stopAndInvalidate");
  v3.receiver = self;
  v3.super_class = (Class)PHASEExternalOutputStreamController;
  -[PHASEExternalOutputStreamController dealloc](&v3, sel_dealloc);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<PHASEExternalOutputStreamController: %p, streamGroupUUID=%@>"), self, self->_streamGroupUUID);
}

+ (double)recommendedTargetLKFSForVoiceStreams
{
  return -24.0;
}

+ (double)recommendedAbsoluteCalibrationLevelForVoiceStreamsAtRecommendedTargetLKFS
{
  return 74.0;
}

+ (double)recommendedAbsoluteCalibrationLevelForVoiceStreams
{
  double v2;
  double v3;
  double v4;

  +[PHASEExternalOutputStreamController recommendedTargetLKFSForVoiceStreams](PHASEExternalOutputStreamController, "recommendedTargetLKFSForVoiceStreams");
  v3 = v2;
  +[PHASEExternalOutputStreamController recommendedAbsoluteCalibrationLevelForVoiceStreamsAtRecommendedTargetLKFS](PHASEExternalOutputStreamController, "recommendedAbsoluteCalibrationLevelForVoiceStreamsAtRecommendedTargetLKFS");
  return -12.0 - v3 + v4;
}

+ (double)recommendedRolloffFactorForVoiceStreams
{
  return 0.75;
}

- (PHASEMixer)mixer
{
  return self->_mixer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mixer, 0);
  objc_storeStrong((id *)&self->_targetLKFS, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_mixerDefinition, 0);
  objc_storeStrong((id *)&self->_gainMetaParameterDefinition, 0);
  objc_storeStrong((id *)&self->_streamGroupUUID, 0);
  objc_storeStrong((id *)&self->_metaParameters, 0);
  objc_storeStrong((id *)&self->_soundEvents, 0);
  objc_destroyWeak((id *)&self->_engine);
}

@end
