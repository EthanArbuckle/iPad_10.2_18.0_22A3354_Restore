@implementation PHASEExternalOutputStream

- (PHASEExternalOutputStream)init
{
  -[PHASEExternalOutputStream doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

+ (id)new
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (PHASEExternalOutputStream)initWithStreamGroupUUID:(id)a3 streamUUID:(id)a4 engine:(id)a5 streamDefinition:(id)a6 startsPaused:(BOOL)a7 delegate:(id)a8 renderBlock:(id)a9
{
  _BOOL8 v10;
  id v16;
  id v17;
  PHASEExternalOutputStream *v18;
  PHASEExternalOutputStream *v19;
  void *v20;
  id renderBlock;
  objc_super v23;

  v10 = a7;
  v16 = a6;
  v17 = a9;
  v23.receiver = self;
  v23.super_class = (Class)PHASEExternalOutputStream;
  v18 = -[PHASEExternalStream initWithEngine:streamGroupUUID:streamUUID:startsPaused:delegate:](&v23, sel_initWithEngine_streamGroupUUID_streamUUID_startsPaused_delegate_, a5, a3, a4, v10, a8);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_definition, a6);
    v20 = _Block_copy(v17);
    renderBlock = v19->_renderBlock;
    v19->_renderBlock = v20;

  }
  return v19;
}

+ (void)streamWithEngine:(id)a3 definition:(id)a4 startsPaused:(BOOL)a5 delegate:(id)a6 renderBlock:(id)a7 callback:(id)a8
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
  +[PHASEExternalOutputStream streamWithEngine:uuid:definition:startsPaused:delegate:renderBlock:callback:](PHASEExternalOutputStream, "streamWithEngine:uuid:definition:startsPaused:delegate:renderBlock:callback:", v18, v17, v13, v11, v14, v15, v16);

}

+ (void)streamWithEngine:(id)a3 uuid:(id)a4 definition:(id)a5 startsPaused:(BOOL)a6 delegate:(id)a7 renderBlock:(id)a8 callback:(id)a9
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
      v75 = 411;
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
      v75 = 438;
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
                                                                                      + 912)));
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
    v75 = 450;
    v76 = 2080;
    v77 = v49;
    v78 = 2112;
    v79 = v50;
    v80 = 2112;
    v81 = v51;
    v82 = 1024;
    v83 = v11;
    _os_log_impl(&dword_2164CC000, v47, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Creating external output stream: %s, uuid [%@, %@], startsPaused %d", buf, 0x36u);

  }
  objc_initWeak((id *)buf, val);
  objc_initWeak(&location, v59);
  v62[0] = MEMORY[0x24BDAC760];
  v62[1] = 3221225472;
  v62[2] = __105__PHASEExternalOutputStream_streamWithEngine_uuid_definition_startsPaused_delegate_renderBlock_callback___block_invoke;
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
  (*(void (**)(uint64_t, id, id, id, _BOOL8, id, _QWORD *))(*(_QWORD *)v46 + 16))(v46, v63, v28, v65, v11, v67, v62);

  objc_destroyWeak(&v69);
  objc_destroyWeak(&v68);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);
LABEL_19:

}

void __105__PHASEExternalOutputStream_streamWithEngine_uuid_definition_startsPaused_delegate_renderBlock_callback___block_invoke(uint64_t a1, void *a2)
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
  PHASEExternalOutputStream *v12;
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
      v12 = -[PHASEExternalOutputStream initWithStreamGroupUUID:streamUUID:engine:streamDefinition:startsPaused:delegate:renderBlock:]([PHASEExternalOutputStream alloc], "initWithStreamGroupUUID:streamUUID:engine:streamDefinition:startsPaused:delegate:renderBlock:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), WeakRetained, *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 88), v5, *(_QWORD *)(a1 + 64));
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
      v16 = 463;
      v17 = 2080;
      v18 = objc_msgSend(v11, "UTF8String");
      _os_log_impl(&dword_2164CC000, v10, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", buf, 0x1Cu);

    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.phase"), 1346920806, v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[PHASEExternalStream streamUUID](self, "streamUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHASEExternalStream uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHASEExternalOutputStream definition](self, "definition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<PHASEExternalOutputStream: %p, streamUUID=%@, streamGroupUUID=%@, audioSessionToken=0x%x>"), self, v4, v5, objc_msgSend(v6, "audioSessionToken"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (PHASEExternalOutputStreamDefinition)definition
{
  return self->_definition;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_definition, 0);
  objc_storeStrong(&self->_renderBlock, 0);
}

@end
