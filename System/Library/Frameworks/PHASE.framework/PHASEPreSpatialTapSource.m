@implementation PHASEPreSpatialTapSource

- (PHASEPreSpatialTapSource)init
{
  -[PHASEPreSpatialTapSource doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

+ (id)new
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (PHASEPreSpatialTapSource)initWithEngine:(id)a3 identifier:(id)a4 binding:(int64_t)a5
{
  return -[PHASEPreSpatialTapSource initWithEngine:identifier:binding:tapType:](self, "initWithEngine:identifier:binding:tapType:", a3, a4, a5, 0);
}

- (PHASEPreSpatialTapSource)initWithEngine:(id)a3 identifier:(id)a4 binding:(int64_t)a5 tapType:(int64_t)a6
{
  id v10;
  id v11;
  PHASEPreSpatialTapSource *v12;
  PHASEPreSpatialTapSource *v13;
  void *v14;
  uint64_t v15;
  AVAudioFormat *format;
  uint64_t v17;
  NSString *v18;
  uint64_t StringHashId;
  PHASEPreSpatialTapSource *v20;
  objc_super v22;

  v10 = a3;
  v11 = a4;
  v22.receiver = self;
  v22.super_class = (Class)PHASEPreSpatialTapSource;
  v12 = -[PHASEPreSpatialTapSource init](&v22, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_weakEngine, v10);
    objc_storeStrong((id *)&v13->_identifier, a4);
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB17E8]), "initWithLayoutTag:", 6553601);
    v15 = objc_msgSend(objc_alloc(MEMORY[0x24BDB1818]), "initWithCommonFormat:sampleRate:interleaved:channelLayout:", 1, 0, v14, 48000.0);
    format = v13->_format;
    v13->_format = (AVAudioFormat *)v15;

    v17 = *(_QWORD *)(objc_msgSend(v10, "implementation") + 424);
    StringHashId = Phase::GetStringHashId((Phase *)v13->_identifier, v18);
    (*(void (**)(uint64_t, uint64_t, _QWORD, int64_t, int64_t))(*(_QWORD *)v17 + 16))(v17, StringHashId, 0, a5, a6);
    v20 = v13;

  }
  return v13;
}

- (PHASEPreSpatialTapSource)initWithEngine:(id)a3 identifier:(id)a4
{
  return -[PHASEPreSpatialTapSource initWithEngine:identifier:binding:](self, "initWithEngine:identifier:binding:", a3, a4, 1);
}

- (PHASEPreSpatialTapSource)initWithEngine:(id)a3 description:(id)a4
{
  id v6;
  id v7;
  void *v8;
  PHASEPreSpatialTapSource *v9;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "uidString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PHASEPreSpatialTapSource initWithEngine:identifier:binding:tapType:](self, "initWithEngine:identifier:binding:tapType:", v6, v8, objc_msgSend(v7, "binding"), objc_msgSend(v7, "type"));

  return v9;
}

- (void)dealloc
{
  id WeakRetained;
  void *v4;
  uint64_t v5;
  NSString *v6;
  uint64_t StringHashId;
  objc_super v8;

  WeakRetained = objc_loadWeakRetained((id *)&self->_weakEngine);
  v4 = WeakRetained;
  if (WeakRetained && objc_msgSend(WeakRetained, "implementation"))
  {
    v5 = *(_QWORD *)(objc_msgSend(v4, "implementation") + 424);
    StringHashId = Phase::GetStringHashId((Phase *)self->_identifier, v6);
    (*(void (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)v5 + 24))(v5, StringHashId, 0);
  }

  v8.receiver = self;
  v8.super_class = (Class)PHASEPreSpatialTapSource;
  -[PHASEPreSpatialTapSource dealloc](&v8, sel_dealloc);
}

- (void)addSubmixId:(UniqueObjectId)a3
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v6;
  NSString *v7;
  uint64_t StringHashId;
  id WeakRetained;

  v3 = a3.mStorage[1];
  v4 = a3.mStorage[0];
  WeakRetained = objc_loadWeakRetained((id *)&self->_weakEngine);
  if (WeakRetained)
  {
    v6 = *(_QWORD *)(objc_msgSend(WeakRetained, "implementation") + 424);
    StringHashId = Phase::GetStringHashId((Phase *)self->_identifier, v7);
    (*(void (**)(uint64_t, uint64_t, _QWORD, unint64_t, unint64_t))(*(_QWORD *)v6 + 32))(v6, StringHashId, 0, v4, v3);
  }

}

- (void)removeSubmixId:(UniqueObjectId)a3
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v6;
  NSString *v7;
  uint64_t StringHashId;
  id WeakRetained;

  v3 = a3.mStorage[1];
  v4 = a3.mStorage[0];
  WeakRetained = objc_loadWeakRetained((id *)&self->_weakEngine);
  if (WeakRetained)
  {
    v6 = *(_QWORD *)(objc_msgSend(WeakRetained, "implementation") + 424);
    StringHashId = Phase::GetStringHashId((Phase *)self->_identifier, v7);
    (*(void (**)(uint64_t, uint64_t, _QWORD, unint64_t, unint64_t))(*(_QWORD *)v6 + 40))(v6, StringHashId, 0, v4, v3);
  }

}

- (void)addMixer:(id)a3
{
  id v4;
  Phase::Logger *WeakRetained;
  Phase::Logger *v6;
  std::__shared_weak_count *v7;
  Phase::ActionTreeObject *v8;
  NSObject *v9;
  Phase *v10;
  NSString *v11;
  uint64_t StringHashId;
  uint64_t SubmixIdFromHashName;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSString *v17;
  uint64_t v18;
  unint64_t *p_shared_owners;
  unint64_t v20;
  uint64_t v21;
  _BYTE buf[18];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WeakRetained = (Phase::Logger *)objc_loadWeakRetained((id *)&self->_weakEngine);
  v6 = WeakRetained;
  if (!WeakRetained)
    goto LABEL_18;
  if (!v4
    || (objc_msgSend(v4, "weakActionTreeObject"),
        WeakRetained = *(Phase::Logger **)&buf[8],
        v21 = 0,
        !*(_QWORD *)&buf[8]))
  {
    v7 = 0;
    goto LABEL_7;
  }
  v7 = std::__shared_weak_count::lock(*(std::__shared_weak_count **)&buf[8]);
  if (v7)
  {
    v8 = *(Phase::ActionTreeObject **)buf;
    v21 = *(_QWORD *)buf;
  }
  else
  {
    v8 = 0;
  }
  std::__shared_weak_count::__release_weak(*(std::__shared_weak_count **)&buf[8]);
  if (!v8)
  {
LABEL_7:
    v9 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(WeakRetained) + 432));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "PHASETaps.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 503;
      _os_log_impl(&dword_2164CC000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to get an Action Tree Object. The PHASEMixer will not be added to the Tap.", buf, 0x12u);
    }
    goto LABEL_13;
  }
  objc_msgSend(v4, "identifier", v21, v7);
  v10 = (Phase *)objc_claimAutoreleasedReturnValue();
  StringHashId = Phase::GetStringHashId(v10, v11);
  SubmixIdFromHashName = Phase::ActionTreeObject::FindSubmixIdFromHashName(v8, StringHashId);
  v15 = v14;

  if (SubmixIdFromHashName | v15)
  {
    v16 = *(_QWORD *)(-[Phase::Logger implementation](v6, "implementation") + 424);
    v18 = Phase::GetStringHashId((Phase *)self->_identifier, v17);
    (*(void (**)(uint64_t, uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)v16 + 32))(v16, v18, 0, SubmixIdFromHashName, v15);
  }
LABEL_13:
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v20 = __ldaxr(p_shared_owners);
    while (__stlxr(v20 - 1, p_shared_owners));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
LABEL_18:

}

- (void)removeMixer:(id)a3
{
  id v4;
  Phase::Logger *WeakRetained;
  Phase::Logger *v6;
  std::__shared_weak_count *v7;
  Phase::ActionTreeObject *v8;
  NSObject *v9;
  Phase *v10;
  NSString *v11;
  uint64_t StringHashId;
  uint64_t SubmixIdFromHashName;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSString *v17;
  uint64_t v18;
  unint64_t *p_shared_owners;
  unint64_t v20;
  uint64_t v21;
  _BYTE buf[18];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WeakRetained = (Phase::Logger *)objc_loadWeakRetained((id *)&self->_weakEngine);
  v6 = WeakRetained;
  if (!WeakRetained)
    goto LABEL_18;
  if (!v4
    || (objc_msgSend(v4, "weakActionTreeObject"),
        WeakRetained = *(Phase::Logger **)&buf[8],
        v21 = 0,
        !*(_QWORD *)&buf[8]))
  {
    v7 = 0;
    goto LABEL_7;
  }
  v7 = std::__shared_weak_count::lock(*(std::__shared_weak_count **)&buf[8]);
  if (v7)
  {
    v8 = *(Phase::ActionTreeObject **)buf;
    v21 = *(_QWORD *)buf;
  }
  else
  {
    v8 = 0;
  }
  std::__shared_weak_count::__release_weak(*(std::__shared_weak_count **)&buf[8]);
  if (!v8)
  {
LABEL_7:
    v9 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(WeakRetained) + 432));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "PHASETaps.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 530;
      _os_log_impl(&dword_2164CC000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to get an Action Tree Object. The PHASEMixer will not be removed from the Tap.", buf, 0x12u);
    }
    goto LABEL_13;
  }
  objc_msgSend(v4, "identifier", v21, v7);
  v10 = (Phase *)objc_claimAutoreleasedReturnValue();
  StringHashId = Phase::GetStringHashId(v10, v11);
  SubmixIdFromHashName = Phase::ActionTreeObject::FindSubmixIdFromHashName(v8, StringHashId);
  v15 = v14;

  if (SubmixIdFromHashName | v15)
  {
    v16 = *(_QWORD *)(-[Phase::Logger implementation](v6, "implementation") + 424);
    v18 = Phase::GetStringHashId((Phase *)self->_identifier, v17);
    (*(void (**)(uint64_t, uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)v16 + 40))(v16, v18, 0, SubmixIdFromHashName, v15);
  }
LABEL_13:
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v20 = __ldaxr(p_shared_owners);
    while (__stlxr(v20 - 1, p_shared_owners));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
LABEL_18:

}

- (void)addSource:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;
  Phase::Logger *v7;
  NSObject *v8;
  uint64_t v9;
  NSString *v10;
  uint64_t StringHashId;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_weakEngine);
  if (WeakRetained)
  {
    objc_msgSend(v4, "engine");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (WeakRetained == v6)
    {
      v9 = *(_QWORD *)(objc_msgSend(WeakRetained, "implementation") + 424);
      StringHashId = Phase::GetStringHashId((Phase *)self->_identifier, v10);
      (*(void (**)(uint64_t, uint64_t, _QWORD, uint64_t))(*(_QWORD *)v9 + 48))(v9, StringHashId, 0, objc_msgSend(v4, "geoEntityHandle"));
    }
    else
    {
      v8 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v7) + 432));
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v12 = 136315394;
        v13 = "PHASETaps.mm";
        v14 = 1024;
        v15 = 543;
        _os_log_impl(&dword_2164CC000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d PHASEPreSpatialTapSource addSource failed: PHASESource is from a different engine instance", (uint8_t *)&v12, 0x12u);
      }
    }
  }

}

- (void)removeSource:(id)a3
{
  id WeakRetained;
  void *v5;
  uint64_t v6;
  NSString *v7;
  uint64_t StringHashId;
  id v9;

  v9 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_weakEngine);
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = *(_QWORD *)(objc_msgSend(WeakRetained, "implementation") + 424);
    StringHashId = Phase::GetStringHashId((Phase *)self->_identifier, v7);
    (*(void (**)(uint64_t, uint64_t, _QWORD, uint64_t))(*(_QWORD *)v6 + 56))(v6, StringHashId, 0, objc_msgSend(v9, "geoEntityHandle"));
  }

}

- (AVAudioFormat)format
{
  return self->_format;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_format, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_weakEngine);
}

@end
