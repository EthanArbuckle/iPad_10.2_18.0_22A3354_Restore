@implementation PHASEExternalStream

- (PHASEExternalStream)init
{
  -[PHASEExternalStream doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

+ (id)new
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (PHASEExternalStream)initWithEngine:(id)a3 streamGroupUUID:(id)a4 streamUUID:(id)a5 startsPaused:(BOOL)a6 delegate:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  PHASEExternalStream *v15;
  uint64_t v16;
  NSUUID *streamGroupUUID;
  uint64_t v18;
  NSUUID *streamUUID;
  objc_super v21;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  v21.receiver = self;
  v21.super_class = (Class)PHASEExternalStream;
  v15 = -[PHASEExternalStream init](&v21, sel_init);
  if (v15)
  {
    v16 = objc_msgSend(v12, "copy");
    streamGroupUUID = v15->_streamGroupUUID;
    v15->_streamGroupUUID = (NSUUID *)v16;

    v18 = objc_msgSend(v13, "copy");
    streamUUID = v15->_streamUUID;
    v15->_streamUUID = (NSUUID *)v18;

    objc_storeWeak((id *)&v15->_delegate, v14);
    objc_storeWeak((id *)&v15->_engine, v11);
    atomic_store(0, (unsigned __int8 *)&v15->_invalidated);
  }

  return v15;
}

- (void)dealloc
{
  objc_super v3;

  -[PHASEExternalStream stopAndInvalidate](self, "stopAndInvalidate");
  v3.receiver = self;
  v3.super_class = (Class)PHASEExternalStream;
  -[PHASEExternalStream dealloc](&v3, sel_dealloc);
}

+ (id)newUUID
{
  return objc_alloc_init(MEMORY[0x24BDD1880]);
}

- (void)setPause:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  void (**v6)(id, void *);
  id WeakRetained;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[2];

  v4 = a3;
  v14[1] = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, void *))a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  v8 = WeakRetained;
  if (WeakRetained)
  {
    v9 = objc_msgSend(WeakRetained, "implementation");
    (*(void (**)(_QWORD, NSUUID *, NSUUID *, _BOOL8, void (**)(id, void *)))(**(_QWORD **)(v9 + 416)
                                                                                                 + 56))(*(_QWORD *)(v9 + 416), self->_streamGroupUUID, self->_streamUUID, v4, v6);
  }
  else
  {
    v13 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("External stream %@ (%@) has nil engine"), self->_streamGroupUUID, self->_streamUUID);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.phase"), 1346922849, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v12);

  }
}

- (void)pause
{
  NSUUID *v3;
  NSUUID *v4;
  _QWORD v5[4];
  NSUUID *v6;

  v3 = self->_streamUUID;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __28__PHASEExternalStream_pause__block_invoke;
  v5[3] = &unk_24D57F398;
  v6 = v3;
  v4 = v3;
  -[PHASEExternalStream setPause:completion:](self, "setPause:completion:", 1, v5);

}

void __28__PHASEExternalStream_pause__block_invoke(uint64_t a1, void *a2)
{
  Phase::Logger *v3;
  Phase::Logger *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  Phase::Logger *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v3) + 432));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 136315906;
      v8 = "PHASEExternalStream.mm";
      v9 = 1024;
      v10 = 176;
      v11 = 2112;
      v12 = v6;
      v13 = 2112;
      v14 = v4;
      _os_log_impl(&dword_2164CC000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d failed to pause stream %@: %@", (uint8_t *)&v7, 0x26u);
    }
  }

}

- (void)resume
{
  NSUUID *v3;
  NSUUID *v4;
  _QWORD v5[4];
  NSUUID *v6;

  v3 = self->_streamUUID;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __29__PHASEExternalStream_resume__block_invoke;
  v5[3] = &unk_24D57F398;
  v6 = v3;
  v4 = v3;
  -[PHASEExternalStream setPause:completion:](self, "setPause:completion:", 0, v5);

}

void __29__PHASEExternalStream_resume__block_invoke(uint64_t a1, void *a2)
{
  Phase::Logger *v3;
  Phase::Logger *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  Phase::Logger *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v3) + 432));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 136315906;
      v8 = "PHASEExternalStream.mm";
      v9 = 1024;
      v10 = 188;
      v11 = 2112;
      v12 = v6;
      v13 = 2112;
      v14 = v4;
      _os_log_impl(&dword_2164CC000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d failed to resume stream %@: %@", (uint8_t *)&v7, 0x26u);
    }
  }

}

- (id)engine
{
  return objc_loadWeakRetained((id *)&self->_engine);
}

- (NSUUID)uuid
{
  return self->_streamGroupUUID;
}

- (id)streamUUID
{
  return self->_streamUUID;
}

- (void)stopAndInvalidate
{
  atomic<BOOL> *p_invalidated;
  unsigned __int8 v4;
  void *v5;
  NSUUID *v6;
  NSUUID *v7;
  uint64_t v8;
  NSUUID *v9;
  NSUUID *v10;
  _QWORD v11[4];
  NSUUID *v12;
  NSUUID *v13;

  p_invalidated = &self->_invalidated;
  do
    v4 = __ldaxr((unsigned __int8 *)p_invalidated);
  while (__stlxr(1u, (unsigned __int8 *)p_invalidated));
  if ((v4 & 1) == 0)
  {
    -[PHASEExternalStream engine](self, "engine");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = self->_streamGroupUUID;
      v7 = self->_streamUUID;
      v8 = *(_QWORD *)(objc_msgSend(v5, "implementation") + 416);
      (*(void (**)(uint64_t, NSUUID *, NSUUID *, uint64_t, void *))(*(_QWORD *)v8 + 56))(v8, v6, v7, 1, &__block_literal_global_3);
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __40__PHASEExternalStream_stopAndInvalidate__block_invoke_2;
      v11[3] = &unk_24D57F3E0;
      v9 = v7;
      v12 = v9;
      v10 = v6;
      v13 = v10;
      (*(void (**)(uint64_t, NSUUID *, NSUUID *, _QWORD *))(*(_QWORD *)v8 + 32))(v8, v10, v9, v11);
      (*(void (**)(uint64_t, NSUUID *))(*(_QWORD *)v8 + 80))(v8, v9);

    }
  }
}

void __40__PHASEExternalStream_stopAndInvalidate__block_invoke_2(Phase::Logger *a1, uint64_t a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    v3 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(a1) + 432));
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = *((_QWORD *)a1 + 4);
      v5 = *((_QWORD *)a1 + 5);
      v6 = 136315906;
      v7 = "PHASEExternalStream.mm";
      v8 = 1024;
      v9 = 233;
      v10 = 2112;
      v11 = v4;
      v12 = 2112;
      v13 = v5;
      _os_log_impl(&dword_2164CC000, v3, OS_LOG_TYPE_ERROR, "%25s:%-5d failed to invalidate stream %@ in group %@", (uint8_t *)&v6, 0x26u);
    }
  }
}

- (PHASEExternalStreamDelegate)delegate
{
  return (PHASEExternalStreamDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)paused
{
  return self->_paused;
}

- (unsigned)latencyInFrames
{
  return self->_latencyInFrames;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_engine);
  objc_storeStrong((id *)&self->_streamUUID, 0);
  objc_storeStrong((id *)&self->_streamGroupUUID, 0);
}

@end
