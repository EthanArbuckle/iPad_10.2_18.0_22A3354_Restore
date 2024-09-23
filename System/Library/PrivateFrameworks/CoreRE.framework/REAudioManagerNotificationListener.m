@implementation REAudioManagerNotificationListener

- (REAudioManagerNotificationListener)initWithOwner:(void *)a3
{
  REAudioManagerNotificationListener *v4;
  REAudioManagerNotificationListener *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id location;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)REAudioManagerNotificationListener;
  v4 = -[REAudioManagerNotificationListener init](&v18, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_owner = (AudioSceneService *)a3;
    objc_initWeak(&location, v4);
    dispatch_get_global_queue(33, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x24BDAC760];
    v13 = 3221225472;
    v14 = __52__REAudioManagerNotificationListener_initWithOwner___block_invoke;
    v15 = &unk_24ED3F600;
    objc_copyWeak(&v16, &location);
    dispatch_async(v6, &v12);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", v12, v13, v14, v15);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v5, sel_servicesLost_, *MEMORY[0x24BE0A608], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v5, sel_servicesReset_, *MEMORY[0x24BE0A610], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v5, sel_sessionInterrupted_, *MEMORY[0x24BE0A618], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v5, sel_sessionInterrupted_, *MEMORY[0x24BE0A5F0], 0);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  return v5;
}

void __52__REAudioManagerNotificationListener_initWithOwner___block_invoke(uint64_t a1)
{
  os_unfair_lock_s *WeakRetained;
  void *v2;
  uint64_t v3;
  void *v4;
  os_unfair_lock_s *v5;

  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v2 = (void *)MEMORY[0x227694090]();
    objc_msgSend(MEMORY[0x24BE0A620], "sharedInstance");
    v3 = objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock(v5 + 6);
    v4 = *(void **)&v5[4]._os_unfair_lock_opaque;
    *(_QWORD *)&v5[4]._os_unfair_lock_opaque = v3;

    os_unfair_lock_unlock(v5 + 6);
    objc_autoreleasePoolPop(v2);
    WeakRetained = v5;
  }

}

- (AVAudioSession)audioSessionToFollow
{
  UnfairLock *p_audioSessionMutex;
  AVAudioSession *v4;

  p_audioSessionMutex = &self->_audioSessionMutex;
  os_unfair_lock_lock(&self->_audioSessionMutex.m_lock);
  v4 = self->_audioSessionToFollow;
  os_unfair_lock_unlock(&p_audioSessionMutex->m_lock);
  return v4;
}

- (void)stop
{
  id v3;

  self->_owner = 0;
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

}

- (void)dealloc
{
  objc_super v3;

  -[REAudioManagerNotificationListener stop](self, "stop");
  v3.receiver = self;
  v3.super_class = (Class)REAudioManagerNotificationListener;
  -[REAudioManagerNotificationListener dealloc](&v3, sel_dealloc);
}

- (void)servicesLost:(id)a3
{
  id v4;
  AudioSceneService *owner;
  AVAudioSession *v6;
  AVAudioSession *v7;
  re *v8;
  os_log_t *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  _QWORD block[5];
  id v15;
  AudioSceneService *v16;
  uint8_t buf[4];
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  owner = self->_owner;
  if (owner)
  {
    os_unfair_lock_lock(&self->_audioSessionMutex.m_lock);
    v6 = self->_audioSessionToFollow;
    os_unfair_lock_unlock(&self->_audioSessionMutex.m_lock);
    objc_msgSend(v4, "object");
    v7 = (AVAudioSession *)objc_claimAutoreleasedReturnValue();

    v9 = (os_log_t *)re::audioLogObjects(v8);
    v10 = *v9;
    if (v7 == v6)
    {
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_224FE9000, v10, OS_LOG_TYPE_DEFAULT, "AudioManager media services lost notification", buf, 2u);
      }
      (*((void (**)(AudioSceneService *))owner->var0 + 8))(owner);
      v13 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __51__REAudioManagerNotificationListener_servicesLost___block_invoke;
      block[3] = &unk_24ED3F970;
      block[4] = self;
      v15 = v4;
      v16 = owner;
      dispatch_async(v13, block);

    }
    else
    {
      v11 = v10;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v4, "object");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67109120;
        v18 = objc_msgSend(v12, "opaqueSessionID");
        _os_log_impl(&dword_224FE9000, v11, OS_LOG_TYPE_DEFAULT, "[RE/MediaServices] Ignoring media services lost notification for audio session 0x%x", buf, 8u);

      }
    }

  }
}

void __51__REAudioManagerNotificationListener_servicesLost___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
  {
    (*(void (**)(_QWORD, uint64_t))(**(_QWORD **)(a1 + 48) + 136))(*(_QWORD *)(a1 + 48), 2);
  }
  else
  {
    v2 = *re::audioLogObjects((re *)a1);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(a1 + 40);
      v4 = 138412290;
      v5 = v3;
      _os_log_impl(&dword_224FE9000, v2, OS_LOG_TYPE_DEFAULT, "[RE/MediaServices] Media services interrupted, but engine was shutdown. %@", (uint8_t *)&v4, 0xCu);
    }
  }
}

- (void)servicesReset:(id)a3
{
  id v4;
  AudioSceneService *owner;
  AVAudioSession *v6;
  AVAudioSession *v7;
  re *v8;
  os_log_t *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  _QWORD block[5];
  id v15;
  AudioSceneService *v16;
  uint8_t buf[4];
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  owner = self->_owner;
  if (owner)
  {
    os_unfair_lock_lock(&self->_audioSessionMutex.m_lock);
    v6 = self->_audioSessionToFollow;
    os_unfair_lock_unlock(&self->_audioSessionMutex.m_lock);
    objc_msgSend(v4, "object");
    v7 = (AVAudioSession *)objc_claimAutoreleasedReturnValue();

    v9 = (os_log_t *)re::audioLogObjects(v8);
    v10 = *v9;
    if (v7 == v6)
    {
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_224FE9000, v10, OS_LOG_TYPE_DEFAULT, "[RE/MediaServices] AudioManager media services reset notification.", buf, 2u);
      }
      (*((void (**)(AudioSceneService *))owner->var0 + 8))(owner);
      v13 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __52__REAudioManagerNotificationListener_servicesReset___block_invoke;
      block[3] = &unk_24ED3F970;
      block[4] = self;
      v15 = v4;
      v16 = owner;
      dispatch_async(v13, block);

    }
    else
    {
      v11 = v10;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v4, "object");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67109120;
        v18 = objc_msgSend(v12, "opaqueSessionID");
        _os_log_impl(&dword_224FE9000, v11, OS_LOG_TYPE_DEFAULT, "[RE/MediaServices] Ignoring media services reset notification for audio session 0x%x", buf, 8u);

      }
    }

  }
}

void __52__REAudioManagerNotificationListener_servicesReset___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
  {
    (*(void (**)(_QWORD, uint64_t))(**(_QWORD **)(a1 + 48) + 136))(*(_QWORD *)(a1 + 48), 3);
  }
  else
  {
    v2 = *re::audioLogObjects((re *)a1);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(a1 + 40);
      v4 = 138412290;
      v5 = v3;
      _os_log_impl(&dword_224FE9000, v2, OS_LOG_TYPE_DEFAULT, "[RE/MediaServices] Media services restored, but engine was shutdown. %@", (uint8_t *)&v4, 0xCu);
    }
  }
}

- (void)sessionInterrupted:(id)a3
{
  id v4;
  AVAudioSession *v5;
  void *v6;
  AVAudioSession *v7;
  re *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  AudioSceneService *owner;
  NSObject *v13;
  _QWORD block[5];
  id v15;
  AudioSceneService *v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_lock(&self->_audioSessionMutex.m_lock);
  v5 = self->_audioSessionToFollow;
  os_unfair_lock_unlock(&self->_audioSessionMutex.m_lock);
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BE0A5F0]) & 1) != 0)
  {
    objc_msgSend(v4, "object");
    v7 = (AVAudioSession *)objc_claimAutoreleasedReturnValue();

    if (v7 != v5)
    {
      v9 = (id)*re::audioLogObjects(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v4, "object");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v18 = v4;
        v19 = 1024;
        v20 = objc_msgSend(v10, "opaqueSessionID");
        _os_log_impl(&dword_224FE9000, v9, OS_LOG_TYPE_DEFAULT, "Ignoring interruption notification %@ for audio session 0x%x", buf, 0x12u);

      }
      goto LABEL_11;
    }
  }
  else
  {

  }
  v11 = *re::audioLogObjects(v8);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v4;
    _os_log_impl(&dword_224FE9000, v11, OS_LOG_TYPE_DEFAULT, "Session interrupted %@", buf, 0xCu);
  }
  owner = self->_owner;
  if (owner)
  {
    (*((void (**)(AudioSceneService *))owner->var0 + 8))(self->_owner);
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __57__REAudioManagerNotificationListener_sessionInterrupted___block_invoke;
    block[3] = &unk_24ED3F970;
    block[4] = self;
    v15 = v4;
    v16 = owner;
    dispatch_async(v13, block);

  }
LABEL_11:

}

void __57__REAudioManagerNotificationListener_sessionInterrupted___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  re *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  char v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
  {
    objc_msgSend(*(id *)(a1 + 40), "name");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BE0A5F0]);

    if (!v3)
      goto LABEL_5;
    objc_msgSend(*(id *)(a1 + 40), "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "valueForKey:", *MEMORY[0x24BE0A600]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "intValue");

    objc_msgSend(*(id *)(a1 + 40), "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "valueForKey:", *MEMORY[0x24BE0A5F8]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "intValue");

    if (!v7 && (v10 & 1) != 0)
    {
LABEL_5:
      v11 = *re::audioLogObjects(v4);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v14) = 0;
        _os_log_impl(&dword_224FE9000, v11, OS_LOG_TYPE_DEFAULT, "Resetting session and engine", (uint8_t *)&v14, 2u);
      }
      (*(void (**)(_QWORD, _QWORD))(**(_QWORD **)(a1 + 48) + 136))(*(_QWORD *)(a1 + 48), 0);
    }
  }
  else
  {
    v12 = *re::audioLogObjects((re *)a1);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(_QWORD *)(a1 + 40);
      v14 = 138412290;
      v15 = v13;
      _os_log_impl(&dword_224FE9000, v12, OS_LOG_TYPE_DEFAULT, "Session interrupted, but engine was shutdown. %@", (uint8_t *)&v14, 0xCu);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioSessionToFollow, 0);
}

- (id).cxx_construct
{
  *((_DWORD *)self + 6) = 0;
  return self;
}

@end
