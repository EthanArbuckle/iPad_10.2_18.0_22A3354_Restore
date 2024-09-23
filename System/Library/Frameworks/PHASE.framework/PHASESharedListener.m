@implementation PHASESharedListener

- (PHASESharedListener)initWithEngine:(id)a3
{
  -[PHASESharedListener doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (PHASESharedListener)initWithEngine:(id)a3 entityType:(unsigned int)a4
{
  -[PHASESharedListener doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, *(_QWORD *)&a4);

  return 0;
}

- (id)initInternalWithEngine:(id)a3
{
  id v4;
  PHASESharedListener *v5;
  uint64_t v6;
  PHASESharedListener *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PHASESharedListener;
  v5 = -[PHASEListener initWithEngine:entityType:](&v9, sel_initWithEngine_entityType_, v4, 0);
  if (v5)
  {
    v6 = *(_QWORD *)(objc_msgSend(v4, "implementation") + 488);
    if (!v6)
    {
      v7 = 0;
      goto LABEL_6;
    }
    -[PHASEObject setGeoEntityHandle:](v5, "setGeoEntityHandle:", (*(uint64_t (**)(uint64_t))(*(_QWORD *)v6 + 16))(v6));
  }
  v7 = v5;
LABEL_6:

  return v7;
}

- (void)setUpdateMode:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL8 ListenerUpdateModeFromEnum;
  id v9;

  -[PHASEObject engine](self, "engine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v9 = v5;
    v6 = objc_msgSend(v5, "implementation");
    if (v6)
    {
      v7 = *(_QWORD *)(v6 + 488);
      if (v7)
      {
        ListenerUpdateModeFromEnum = Phase::GetListenerUpdateModeFromEnum((Phase::Logger *)a3);
        (*(void (**)(uint64_t, _BOOL8))(*(_QWORD *)v7 + 32))(v7, ListenerUpdateModeFromEnum);
      }
    }
    self->_updateMode = a3;
    v5 = v9;
  }

}

- (void)dealloc
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v7;

  -[PHASEObject engine](self, "engine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "implementation");
    if (v5)
    {
      v6 = *(_QWORD *)(v5 + 488);
      if (v6)
        (*(void (**)(uint64_t))(*(_QWORD *)v6 + 24))(v6);
    }
  }

  v7.receiver = self;
  v7.super_class = (Class)PHASESharedListener;
  -[PHASEObject dealloc](&v7, sel_dealloc);
}

- (void)setGain:(double)a3
{
  NSObject *v5;
  objc_super v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (Phase::CurrentProcessCanModifySharedEntities(void)::onceToken != -1)
    dispatch_once(&Phase::CurrentProcessCanModifySharedEntities(void)::onceToken, &__block_literal_global_4);
  if (Phase::CurrentProcessCanModifySharedEntities(void)::currentProcessCanModifySharedEntities)
  {
    v6.receiver = self;
    v6.super_class = (Class)PHASESharedListener;
    -[PHASEListener setGain:](&v6, sel_setGain_, a3);
  }
  else
  {
    v5 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)self) + 432));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v8 = "PHASESharedListener.mm";
      v9 = 1024;
      v10 = 86;
      _os_log_impl(&dword_2164CC000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d Setting PHASESharedListener's gain has no effect", buf, 0x12u);
    }
  }
}

- (void)setTransform:(double)a3
{
  Phase::Logger *v6;
  Phase::Logger *v7;
  uint64_t v8;
  Phase::Logger *v9;
  Phase::Logger *InstancePtr;
  Phase::Logger *v11;
  uint64_t v12;
  os_signpost_id_t v13;
  os_signpost_id_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  objc_super v22;
  objc_super v23;
  __int128 v24;
  float v25;
  uint64_t v26;
  int v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  double v33;
  __int16 v34;
  double v35;
  __int16 v36;
  double v37;
  __int16 v38;
  double v39;
  __int16 v40;
  double v41;
  __int16 v42;
  double v43;
  __int16 v44;
  double v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "engine");
  v6 = (Phase::Logger *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    if (Phase::CurrentProcessCanModifySharedEntities(void)::onceToken != -1)
      dispatch_once(&Phase::CurrentProcessCanModifySharedEntities(void)::onceToken, &__block_literal_global_4);
    if (Phase::CurrentProcessCanModifySharedEntities(void)::currentProcessCanModifySharedEntities)
    {
      mach_absolute_time();
      v8 = __udivti3();
      v24 = xmmword_2166F7280;
      v25 = 0.0;
      v26 = 0;
      v27 = 1065353216;
      v23.receiver = a1;
      v23.super_class = (Class)PHASESharedListener;
      v9 = (Phase::Logger *)-[PHASEObject validateTransform:outAffine:](&v23, sel_validateTransform_outAffine_, &v24, a2, a3, a4, a5);
      if ((v9 & 1) != 0)
      {
        InstancePtr = (Phase::Logger *)Phase::Logger::GetInstancePtr(v9);
        if (*((_BYTE *)InstancePtr + 440))
        {
          v11 = (Phase::Logger *)objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(InstancePtr) + 432));
          v12 = Phase::Logger::GetInstancePtr(v11);
          v13 = os_signpost_id_generate(**(os_log_t **)(v12 + 432));
          if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            v14 = v13;
            if (os_signpost_enabled((os_log_t)v11))
            {
              v15 = objc_msgSend(a1, "geoEntityHandle");
              *(_DWORD *)buf = 134220032;
              v29 = (const char *)a1;
              v30 = 2048;
              v31 = v15;
              v32 = 2048;
              v33 = *(float *)&v24;
              v34 = 2048;
              v35 = *((float *)&v24 + 1);
              v36 = 2048;
              v37 = *((float *)&v24 + 2);
              v38 = 2048;
              v39 = *((float *)&v24 + 3);
              v40 = 2048;
              v41 = v25;
              v42 = 2048;
              v43 = *(float *)&v26;
              v44 = 2048;
              v45 = *((float *)&v26 + 1);
              _os_signpost_emit_with_name_impl(&dword_2164CC000, (os_log_t)v11, OS_SIGNPOST_EVENT, v14, "Phase_API_Transform_Update", "SharedListener@%p: %llu Update Rotation: [%f, %f, %f, %f], Position: [%f, %f, %f]", buf, 0x5Cu);
            }
          }

        }
        v16 = *(_QWORD *)(-[Phase::Logger implementation](v7, "implementation") + 368);
        (*(void (**)(uint64_t, uint64_t, __int128 *, uint64_t))(*(_QWORD *)v16 + 264))(v16, objc_msgSend(a1, "geoEntityHandle"), &v24, v8);
        v22.receiver = a1;
        v22.super_class = (Class)PHASESharedListener;
        -[PHASEObject _storeTransform:](&v22, sel__storeTransform_, a2, a3, a4, a5);
      }
    }
    else
    {
      v17 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v6) + 432));
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v29 = "PHASESharedListener.mm";
        v30 = 1024;
        LODWORD(v31) = 103;
        _os_log_impl(&dword_2164CC000, v17, OS_LOG_TYPE_ERROR, "%25s:%-5d Setting PHASESharedListener's transform has no effect", buf, 0x12u);
      }
    }
  }

}

- (BOOL)addChild:(id)a3 error:(id *)a4
{
  id v6;
  BOOL v7;
  uint64_t v8;
  Phase::Logger *v9;
  NSObject *v10;
  void *v11;
  objc_super v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  void *v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (Phase::CurrentProcessCanModifySharedEntities(void)::onceToken != -1)
    dispatch_once(&Phase::CurrentProcessCanModifySharedEntities(void)::onceToken, &__block_literal_global_4);
  if (Phase::CurrentProcessCanModifySharedEntities(void)::currentProcessCanModifySharedEntities)
  {
    v13.receiver = self;
    v13.super_class = (Class)PHASESharedListener;
    v7 = -[PHASEObject addChild:error:](&v13, sel_addChild_error_, v6, a4);
  }
  else
  {
    v8 = *MEMORY[0x24BDD0FC8];
    v20 = *MEMORY[0x24BDD0FC8];
    v21[0] = CFSTR("Cannot add child to PHASESharedListener");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v9 = (Phase::Logger *)objc_claimAutoreleasedReturnValue();
    v10 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v9)
                                                                                        + 432)));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      -[Phase::Logger objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v15 = "PHASESharedListener.mm";
      v16 = 1024;
      v17 = 131;
      v18 = 2112;
      v19 = v11;
      _os_log_impl(&dword_2164CC000, v10, OS_LOG_TYPE_ERROR, "%25s:%-5d %@", buf, 0x1Cu);

    }
    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.phase"), 1346913634, v9);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

    v7 = 0;
  }

  return v7;
}

- (void)removeChild:(id)a3
{
  Phase::Logger *v4;
  Phase::Logger *v5;
  NSObject *v6;
  objc_super v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = (Phase::Logger *)a3;
  v5 = v4;
  if (Phase::CurrentProcessCanModifySharedEntities(void)::onceToken != -1)
    dispatch_once(&Phase::CurrentProcessCanModifySharedEntities(void)::onceToken, &__block_literal_global_4);
  if (Phase::CurrentProcessCanModifySharedEntities(void)::currentProcessCanModifySharedEntities)
  {
    v7.receiver = self;
    v7.super_class = (Class)PHASESharedListener;
    -[PHASEObject removeChild:](&v7, sel_removeChild_, v5);
  }
  else
  {
    v6 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v4) + 432));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v9 = "PHASESharedListener.mm";
      v10 = 1024;
      v11 = 148;
      _os_log_impl(&dword_2164CC000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d Cannot remove child from PHASESharedListener", buf, 0x12u);
    }
  }

}

- (void)removeChildren
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (Phase::CurrentProcessCanModifySharedEntities(void)::onceToken != -1)
    dispatch_once(&Phase::CurrentProcessCanModifySharedEntities(void)::onceToken, &__block_literal_global_4);
  if (Phase::CurrentProcessCanModifySharedEntities(void)::currentProcessCanModifySharedEntities)
  {
    v4.receiver = self;
    v4.super_class = (Class)PHASESharedListener;
    -[PHASEObject removeChildren](&v4, sel_removeChildren);
  }
  else
  {
    v3 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)self) + 432));
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v6 = "PHASESharedListener.mm";
      v7 = 1024;
      v8 = 159;
      _os_log_impl(&dword_2164CC000, v3, OS_LOG_TYPE_ERROR, "%25s:%-5d Cannot remove children from PHASESharedListener", buf, 0x12u);
    }
  }
}

- (int64_t)updateMode
{
  return self->_updateMode;
}

@end
