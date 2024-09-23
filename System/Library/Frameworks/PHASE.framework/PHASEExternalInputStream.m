@implementation PHASEExternalInputStream

- (PHASEExternalInputStream)init
{
  -[PHASEExternalInputStream doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

+ (id)new
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (PHASEExternalInputStream)initWithStreamGroupUUID:(id)a3 streamUUID:(id)a4 engine:(id)a5 streamDefinition:(id)a6 startsPaused:(BOOL)a7 delegate:(id)a8 receiverBlock:(id)a9
{
  _BOOL8 v10;
  id v16;
  id v17;
  PHASEExternalInputStream *v18;
  PHASEExternalInputStream *v19;
  void *v20;
  id receiverBlock;
  objc_super v23;

  v10 = a7;
  v16 = a6;
  v17 = a9;
  v23.receiver = self;
  v23.super_class = (Class)PHASEExternalInputStream;
  v18 = -[PHASEExternalStream initWithEngine:streamGroupUUID:streamUUID:startsPaused:delegate:](&v23, sel_initWithEngine_streamGroupUUID_streamUUID_startsPaused_delegate_, a5, a3, a4, v10, a8);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_definition, a6);
    v20 = _Block_copy(v17);
    receiverBlock = v19->_receiverBlock;
    v19->_receiverBlock = v20;

  }
  return v19;
}

+ (void)streamWithEngine:(id)a3 definition:(id)a4 startsPaused:(BOOL)a5 delegate:(id)a6 receiverBlock:(id)a7 callback:(id)a8
{
  _BOOL8 v11;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;

  v11 = a5;
  v18 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v16 = a8;
  v17 = +[PHASEExternalStream newUUID](PHASEExternalStream, "newUUID");
  +[PHASEExternalInputStream streamWithEngine:uuid:definition:startsPaused:delegate:receiverBlock:callback:](PHASEExternalInputStream, "streamWithEngine:uuid:definition:startsPaused:delegate:receiverBlock:callback:", v18, v17, v13, v11, v14, v15, v16);

}

+ (void)streamWithEngine:(id)a3 uuid:(id)a4 definition:(id)a5 startsPaused:(BOOL)a6 delegate:(id)a7 receiverBlock:(id)a8 callback:(id)a9
{
  _BOOL8 v11;
  id v14;
  id v15;
  void (**v16)(id, _QWORD, void *);
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  Phase::Logger *v29;
  NSObject *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  uint64_t v37;
  id v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  Phase::Logger *v45;
  uint64_t v46;
  NSObject *v47;
  id v48;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  Phase::Logger *v56;
  id v57;
  id val;
  id v59;
  id v60;
  id v61;
  _QWORD v62[4];
  id v63;
  id v64;
  id v65;
  void (**v66)(id, _QWORD, void *);
  id v67;
  id v68;
  id v69;
  BOOL v70;
  id location;
  uint8_t buf[4];
  const char *v73;
  __int16 v74;
  int v75;
  __int16 v76;
  uint64_t v77;
  __int16 v78;
  void *v79;
  __int16 v80;
  void *v81;
  __int16 v82;
  _BOOL4 v83;
  uint64_t v84;
  void *v85;
  uint64_t v86;
  _QWORD v87[4];

  v11 = a6;
  v87[1] = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v61 = a4;
  v15 = a5;
  v59 = a7;
  v60 = a8;
  v16 = (void (**)(id, _QWORD, void *))a9;
  val = v14;
  objc_msgSend(v15, "format");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "commonFormat");

  if (v18 != 1)
  {
    v24 = *MEMORY[0x24BDD0FC8];
    v86 = *MEMORY[0x24BDD0FC8];
    v25 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v15, "format");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "stringWithFormat:", CFSTR("Can only create stream with float32 common format, not provided common format %lu"), objc_msgSend(v26, "commonFormat"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v87[0] = v27;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v87, &v86, 1);
    v28 = (id)objc_claimAutoreleasedReturnValue();

    v30 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v29)
                                                                                        + 432)));
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v28, "objectForKeyedSubscript:", v24);
      v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136315650;
      v73 = "PHASEExternalStream.mm";
      v74 = 1024;
      v75 = 1365;
      v76 = 2080;
      v77 = objc_msgSend(v31, "UTF8String");
      _os_log_impl(&dword_2164CC000, v30, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", buf, 0x1Cu);

    }
    goto LABEL_7;
  }
  objc_msgSend(v15, "format");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "channelLayout");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    objc_msgSend(v15, "format");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "channelLayout");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "layoutTag");

    if (v23)
      goto LABEL_16;
  }
  else
  {

  }
  objc_msgSend(v15, "format");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v33, "channelCount") != 1)
  {
    objc_msgSend(v15, "format");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "channelCount");

    if (v35 == 2)
      goto LABEL_12;
    v52 = *MEMORY[0x24BDD0FC8];
    v84 = *MEMORY[0x24BDD0FC8];
    v53 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v15, "format");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "stringWithFormat:", CFSTR("Cannot synthesize audio channel layout with channel count %d. Please provide non-nil channel layout as part of stream definition's format."), objc_msgSend(v54, "channelCount"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = v55;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v85, &v84, 1);
    v28 = (id)objc_claimAutoreleasedReturnValue();

    v30 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v56)
                                                                                        + 432)));
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v28, "objectForKeyedSubscript:", v52);
      v57 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136315650;
      v73 = "PHASEExternalStream.mm";
      v74 = 1024;
      v75 = 1392;
      v76 = 2080;
      v77 = objc_msgSend(v57, "UTF8String");
      _os_log_impl(&dword_2164CC000, v30, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", buf, 0x1Cu);

    }
LABEL_7:

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.phase"), 1346922849, v28);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v16[2](v16, 0, v32);

    goto LABEL_19;
  }

LABEL_12:
  objc_msgSend(v15, "format");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v36, "channelCount") == 1)
    v37 = 6553601;
  else
    v37 = 6619138;

  v38 = objc_alloc(MEMORY[0x24BDB1818]);
  objc_msgSend(v15, "format");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "sampleRate");
  v41 = v40;
  v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB17E8]), "initWithLayoutTag:", v37);
  v43 = (void *)objc_msgSend(v38, "initStandardFormatWithSampleRate:channelLayout:", v42, v41);
  objc_msgSend(v15, "setFormat:", v43);

LABEL_16:
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = (Phase::Logger *)objc_msgSend(v14, "implementation");
  v46 = *((_QWORD *)v45 + 52);
  v47 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v45)
                                                                                      + 432)));
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v15, "description");
    v48 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v49 = objc_msgSend(v48, "UTF8String");
    objc_msgSend(v61, "UUIDString");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "UUIDString");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136316418;
    v73 = "PHASEExternalStream.mm";
    v74 = 1024;
    v75 = 1404;
    v76 = 2080;
    v77 = v49;
    v78 = 2112;
    v79 = v50;
    v80 = 2112;
    v81 = v51;
    v82 = 1024;
    v83 = v11;
    _os_log_impl(&dword_2164CC000, v47, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Creating external input stream: %s, uuid [%@, %@], startsPaused %d", buf, 0x36u);

  }
  objc_initWeak((id *)buf, val);
  objc_initWeak(&location, v59);
  v62[0] = MEMORY[0x24BDAC760];
  v62[1] = 3221225472;
  v62[2] = __106__PHASEExternalInputStream_streamWithEngine_uuid_definition_startsPaused_delegate_receiverBlock_callback___block_invoke;
  v62[3] = &unk_24D57F408;
  objc_copyWeak(&v68, (id *)buf);
  objc_copyWeak(&v69, &location);
  v66 = v16;
  v63 = v61;
  v28 = v44;
  v64 = v28;
  v65 = v15;
  v70 = v11;
  v67 = v60;
  (*(void (**)(uint64_t, id, id, id, _BOOL8, id, _QWORD *))(*(_QWORD *)v46 + 24))(v46, v63, v28, v65, v11, v67, v62);

  objc_destroyWeak(&v69);
  objc_destroyWeak(&v68);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);
LABEL_19:

}

void __106__PHASEExternalInputStream_streamWithEngine_uuid_definition_startsPaused_delegate_receiverBlock_callback___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  Phase::Logger *v9;
  NSObject *v10;
  id v11;
  PHASEExternalInputStream *v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  v5 = objc_loadWeakRetained((id *)(a1 + 80));
  v6 = v5;
  if (WeakRetained && v5)
  {
    if (v3)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      v7 = v3;
    }
    else
    {
      v12 = -[PHASEExternalInputStream initWithStreamGroupUUID:streamUUID:engine:streamDefinition:startsPaused:delegate:receiverBlock:]([PHASEExternalInputStream alloc], "initWithStreamGroupUUID:streamUUID:engine:streamDefinition:startsPaused:delegate:receiverBlock:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), WeakRetained, *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 88), v5, *(_QWORD *)(a1 + 64));
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

      v7 = 0;
    }
  }
  else
  {
    v8 = *MEMORY[0x24BDD0FC8];
    v19 = *MEMORY[0x24BDD0FC8];
    v20[0] = CFSTR("engine and/or delegate has been de-allocated");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v9 = (Phase::Logger *)objc_claimAutoreleasedReturnValue();
    v10 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v9)
                                                                                        + 432)));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      -[Phase::Logger objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", v8);
      v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136315650;
      v14 = "PHASEExternalStream.mm";
      v15 = 1024;
      v16 = 1417;
      v17 = 2080;
      v18 = objc_msgSend(v11, "UTF8String");
      _os_log_impl(&dword_2164CC000, v10, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", buf, 0x1Cu);

    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.phase"), 1346920806, v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

- (void)setMute:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (self->_mute != a3)
  {
    v3 = a3;
    -[PHASEExternalStream engine](self, "engine");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = *(_QWORD *)(objc_msgSend(v5, "implementation") + 416);
      -[PHASEExternalStream uuid](self, "uuid");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHASEExternalStream streamUUID](self, "streamUUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, void *, _BOOL8))(*(_QWORD *)v7 + 64))(v7, v8, v9, v3);

      self->_mute = v3;
    }
    else
    {
      v10 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(0)
                                                                                          + 432)));
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        -[PHASEExternalStream uuid](self, "uuid");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 136315650;
        v13 = "PHASEExternalStream.mm";
        v14 = 1024;
        v15 = 1450;
        v16 = 2112;
        v17 = v11;
        _os_log_impl(&dword_2164CC000, v10, OS_LOG_TYPE_ERROR, "%25s:%-5d Can't mute external input stream %@ with nil engine", (uint8_t *)&v12, 0x1Cu);

      }
    }

  }
}

- (BOOL)registerMutedSpeechActivityNotification:(id)a3 outError:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id mutedSpeechActivityNotificationBlock;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  Phase::Logger *v18;
  NSObject *v19;
  id v20;
  _QWORD v22[4];
  id v23;
  _BYTE location[12];
  __int16 v25;
  int v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (a4)
    *a4 = 0;
  -[PHASEExternalStream engine](self, "engine");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[PHASEExternalInputStream unregisterMutedSpeechActivityNotification](self, "unregisterMutedSpeechActivityNotification");
    v8 = *(_QWORD *)(objc_msgSend(v7, "implementation") + 416);
    v9 = _Block_copy(v6);
    mutedSpeechActivityNotificationBlock = self->_mutedSpeechActivityNotificationBlock;
    self->_mutedSpeechActivityNotificationBlock = v9;

    v11 = self->_mutedSpeechActivityNotificationBlock;
    if (v11)
    {
      objc_initWeak((id *)location, v11);
      -[PHASEExternalStream streamUUID](self, "streamUUID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 3221225472;
      v22[2] = __77__PHASEExternalInputStream_registerMutedSpeechActivityNotification_outError___block_invoke;
      v22[3] = &unk_24D57F4A0;
      objc_copyWeak(&v23, (id *)location);
      (*(void (**)(uint64_t, void *, _QWORD *))(*(_QWORD *)v8 + 72))(v8, v12, v22);

      objc_destroyWeak(&v23);
      objc_destroyWeak((id *)location);
    }
  }
  else
  {
    v13 = *MEMORY[0x24BDD0FC8];
    v29 = *MEMORY[0x24BDD0FC8];
    v14 = (void *)MEMORY[0x24BDD17C8];
    -[PHASEExternalStream streamUUID](self, "streamUUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("Can't register muted speech activity on external input stream %@ with nil engine"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v16;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v18)
                                                                                        + 432)));
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v17, "objectForKeyedSubscript:", v13);
      v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)location = 136315650;
      *(_QWORD *)&location[4] = "PHASEExternalStream.mm";
      v25 = 1024;
      v26 = 1476;
      v27 = 2080;
      v28 = objc_msgSend(v20, "UTF8String");
      _os_log_impl(&dword_2164CC000, v19, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", location, 0x1Cu);

    }
    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.phase"), 1346922849, v17);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  return v7 != 0;
}

void __77__PHASEExternalInputStream_registerMutedSpeechActivityNotification_outError___block_invoke(uint64_t a1, _DWORD *a2)
{
  void (**WeakRetained)(id, PHASEMutedSpeechActivityInfo *);
  PHASEMutedSpeechActivityInfo *v4;
  double v5;
  void (**v6)(id, PHASEMutedSpeechActivityInfo *);

  WeakRetained = (void (**)(id, PHASEMutedSpeechActivityInfo *))objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v4 = objc_alloc_init(PHASEMutedSpeechActivityInfo);
    LODWORD(v5) = *a2;
    -[PHASEMutedSpeechActivityInfo setSpeechActivityHardValue:](v4, "setSpeechActivityHardValue:", *(float *)a2 != 0.0, v5);
    v6[2](v6, v4);

    WeakRetained = v6;
  }

}

- (void)unregisterMutedSpeechActivityNotification
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  -[PHASEExternalStream engine](self, "engine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v6 = v3;
    v4 = *(_QWORD *)(objc_msgSend(v3, "implementation") + 416);
    -[PHASEExternalStream streamUUID](self, "streamUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(*(_QWORD *)v4 + 80))(v4, v5);

    v3 = v6;
  }

}

- (PHASEExternalInputStreamDefinition)definition
{
  return self->_definition;
}

- (BOOL)isMuted
{
  return self->_mute;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_definition, 0);
  objc_storeStrong(&self->_mutedSpeechActivityNotificationBlock, 0);
  objc_storeStrong(&self->_receiverBlock, 0);
}

@end
