@implementation PHASESharedRoot

- (PHASESharedRoot)initWithEngine:(id)a3
{
  -[PHASESharedRoot doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (PHASESharedRoot)initWithEngine:(id)a3 entityType:(unsigned int)a4 shapes:(id)a5
{
  -[PHASESharedRoot doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, *(_QWORD *)&a4, a5);

  return 0;
}

- (PHASESharedRoot)initWithEngine:(id)a3 sessionUUID:(id)a4
{
  id v6;
  id v7;
  PHASESharedRoot *v8;
  PHASESharedRoot *v9;
  objc_super v11[2];
  objc_super v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v11[0].receiver = self;
  v11[0].super_class = (Class)PHASESharedRoot;
  v8 = -[objc_super initWithEngine:entityType:shapes:](v11, sel_initWithEngine_entityType_shapes_, v6, 0, 0);
  if (!v8)
    goto LABEL_4;
  v9 = *(PHASESharedRoot **)(objc_msgSend(v6, "implementation") + 488);
  if (v9)
  {
    v12 = (objc_super)0;
    objc_msgSend(v7, "getUUIDBytes:", &v12);
    v11[1] = v12;
    v8->_sessionUUID = (UniqueObjectId)v12;
    -[PHASEObject setGeoEntityHandle:](v8, "setGeoEntityHandle:", (*((uint64_t (**)(PHASESharedRoot *, unint64_t, unint64_t))v9->super.super.isa + 5))(v9, v8->_sessionUUID.mStorage[0], v8->_sessionUUID.mStorage[1]));
LABEL_4:
    v9 = v8;
  }

  return v9;
}

- (PHASESharedRoot)initWithEngine:(id)a3 session:(id)a4 sessionUUID:(id)a5
{
  id v8;
  id v9;
  id v10;
  PHASESharedRoot *v11;
  uint64_t v12;
  PHASESharedRoot *v13;
  objc_super v15[2];
  objc_super v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15[0].receiver = self;
  v15[0].super_class = (Class)PHASESharedRoot;
  v11 = -[objc_super initWithEngine:entityType:shapes:](v15, sel_initWithEngine_entityType_shapes_, v8, 0, 0);
  if (v11)
  {
    v12 = *(_QWORD *)(objc_msgSend(v8, "implementation") + 488);
    if (!v12)
    {
      v13 = 0;
      goto LABEL_6;
    }
    objc_storeStrong((id *)&v11->_session, a4);
    v16 = (objc_super)0;
    objc_msgSend(v10, "getUUIDBytes:", &v16);
    v15[1] = v16;
    v11->_sessionUUID = (UniqueObjectId)v16;
    -[PHASEObject setGeoEntityHandle:](v11, "setGeoEntityHandle:", (*(uint64_t (**)(uint64_t, unint64_t, unint64_t))(*(_QWORD *)v12 + 40))(v12, v11->_sessionUUID.mStorage[0], v11->_sessionUUID.mStorage[1]));
  }
  v13 = v11;
LABEL_6:

  return v13;
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
        (*(void (**)(uint64_t, unint64_t, unint64_t))(*(_QWORD *)v6 + 48))(v6, self->_sessionUUID.mStorage[0], self->_sessionUUID.mStorage[1]);
    }
  }

  v7.receiver = self;
  v7.super_class = (Class)PHASESharedRoot;
  -[PHASEObject dealloc](&v7, sel_dealloc);
}

- (void)setTransform:(void *)a1
{
  NSObject *v2;
  objc_super v3;
  uint8_t buf[4];
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (Phase::CurrentProcessCanModifySharedEntities(void)::onceToken != -1)
    dispatch_once(&Phase::CurrentProcessCanModifySharedEntities(void)::onceToken, &__block_literal_global_4);
  if (Phase::CurrentProcessCanModifySharedEntities(void)::currentProcessCanModifySharedEntities)
  {
    v3.receiver = a1;
    v3.super_class = (Class)PHASESharedRoot;
    -[PHASEObject setTransform:](&v3, sel_setTransform_);
  }
  else
  {
    v2 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)a1) + 432));
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v5 = "PHASESharedRoot.mm";
      v6 = 1024;
      v7 = 86;
      _os_log_impl(&dword_2164CC000, v2, OS_LOG_TYPE_ERROR, "%25s:%-5d Setting root object's transform has no effect", buf, 0x12u);
    }
  }
}

- (AVAudioSession)session
{
  return (AVAudioSession *)objc_getProperty(self, a2, 128, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
}

@end
