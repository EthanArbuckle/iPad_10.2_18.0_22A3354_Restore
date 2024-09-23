@implementation SSCoreHapticsInfo

- (SSCoreHapticsInfo)init
{
  SSCoreHapticsInfo *v2;
  uint64_t v3;
  NSMutableDictionary *SSIDToPlayerMap;
  dispatch_queue_t v5;
  OS_dispatch_object *fObj;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SSCoreHapticsInfo;
  v2 = -[SSCoreHapticsInfo init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    SSIDToPlayerMap = v2->_SSIDToPlayerMap;
    v2->_SSIDToPlayerMap = (NSMutableDictionary *)v3;

    v5 = dispatch_queue_create("SSIDPlayerDictQueue", MEMORY[0x1E0C80D50]);
    fObj = v2->_SSIDMapQueue.fObj.fObj;
    v2->_SSIDMapQueue.fObj.fObj = (OS_dispatch_object *)v5;

  }
  return v2;
}

- (void)registerSSID:(unint64_t)a3 withPlayer:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  NSObject *fObj;
  id v10;
  _QWORD block[5];
  id v12;
  unint64_t v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  unint64_t v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (kSystemSoundClientLogSubsystem)
  {
    v7 = *(id *)kSystemSoundClientLogSubsystem;
    if (!v7)
      goto LABEL_8;
  }
  else
  {
    v7 = MEMORY[0x1E0C81028];
    v8 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    v15 = "SSCoreHapticsPlayer.mm";
    v16 = 1024;
    v17 = 61;
    v18 = 2048;
    v19 = a3;
    v20 = 2048;
    v21 = v6;
    _os_log_impl(&dword_1A0F4D000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d registering SSID %ld <-> SSCoreHapticsPlayer %p", buf, 0x26u);
  }

LABEL_8:
  fObj = self->_SSIDMapQueue.fObj.fObj;
  applesauce::dispatch::v1::queue::operator*(fObj);
  objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__SSCoreHapticsInfo_registerSSID_withPlayer___block_invoke;
  block[3] = &unk_1E450BFD8;
  block[4] = self;
  v12 = v6;
  v13 = a3;
  v10 = v6;
  dispatch_barrier_async(fObj, block);

}

- (void)unregisterSSID:(unint64_t)a3
{
  OS_dispatch_object *fObj;
  NSObject *v6;
  _QWORD v7[6];

  fObj = self->_SSIDMapQueue.fObj.fObj;
  applesauce::dispatch::v1::queue::operator*(fObj);
  v6 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __36__SSCoreHapticsInfo_unregisterSSID___block_invoke;
  v7[3] = &unk_1E450C000;
  v7[4] = self;
  v7[5] = a3;
  dispatch_barrier_async(v6, v7);

}

- (unint64_t)generateNewSSIDForPlayer:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = -[SSCoreHapticsInfo generateNewSSIDForPlayer:]::currentToken++;
    -[SSCoreHapticsInfo registerSSID:withPlayer:](self, "registerSSID:withPlayer:", v5, v4);
  }
  else
  {
    if (kSystemSoundClientLogSubsystem)
    {
      v5 = *(id *)kSystemSoundClientLogSubsystem;
      if (!v5)
        goto LABEL_10;
    }
    else
    {
      v5 = MEMORY[0x1E0C81028];
      v6 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v8 = 136315394;
      v9 = "SSCoreHapticsPlayer.mm";
      v10 = 1024;
      v11 = 77;
      _os_log_impl(&dword_1A0F4D000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d SSCoreHapticsPlayer invalid!", (uint8_t *)&v8, 0x12u);
    }

    v5 = 0;
  }
LABEL_10:

  return (unint64_t)v5;
}

- (id)getPlayerForSSID:(unint64_t)a3
{
  OS_dispatch_object *fObj;
  NSObject *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  _QWORD block[7];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  unint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__2818;
  v17 = __Block_byref_object_dispose__2819;
  v18 = 0;
  fObj = self->_SSIDMapQueue.fObj.fObj;
  applesauce::dispatch::v1::queue::operator*(fObj);
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__SSCoreHapticsInfo_getPlayerForSSID___block_invoke;
  block[3] = &unk_1E450C028;
  block[4] = self;
  block[5] = &v13;
  block[6] = a3;
  dispatch_sync(v6, block);

  v7 = (void *)v14[5];
  if (v7)
  {
    v8 = v7;
  }
  else
  {
    if (kSystemSoundClientLogSubsystem)
    {
      v9 = *(id *)kSystemSoundClientLogSubsystem;
      if (!v9)
        goto LABEL_10;
    }
    else
    {
      v9 = MEMORY[0x1E0C81028];
      v10 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v20 = "SSCoreHapticsPlayer.mm";
      v21 = 1024;
      v22 = 97;
      v23 = 2048;
      v24 = a3;
      _os_log_impl(&dword_1A0F4D000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d No player associated with SSID %ld", buf, 0x1Cu);
    }

  }
LABEL_10:
  _Block_object_dispose(&v13, 8);

  return v7;
}

- (void)disposeSSID:(unint64_t)a3
{
  NSObject *v5;
  id v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  unint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (kSystemSoundClientLogSubsystem)
  {
    v5 = *(id *)kSystemSoundClientLogSubsystem;
    if (!v5)
      goto LABEL_8;
  }
  else
  {
    v5 = MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v7 = 136315650;
    v8 = "SSCoreHapticsPlayer.mm";
    v9 = 1024;
    v10 = 105;
    v11 = 2048;
    v12 = a3;
    _os_log_impl(&dword_1A0F4D000, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d disposing SSID %ld and its SSCoreHapticsPlayer", (uint8_t *)&v7, 0x1Cu);
  }

LABEL_8:
  -[SSCoreHapticsInfo unregisterSSID:](self, "unregisterSSID:", a3);
}

- (void).cxx_destruct
{
  OS_dispatch_object *fObj;

  fObj = self->_SSIDMapQueue.fObj.fObj;
  self->_SSIDMapQueue.fObj.fObj = 0;

  objc_storeStrong((id *)&self->_SSIDToPlayerMap, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  return self;
}

void __38__SSCoreHapticsInfo_getPlayerForSSID___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1[4] + 8);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1[6]);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[5] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __36__SSCoreHapticsInfo_unregisterSSID___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeObjectForKey:");

}

void __45__SSCoreHapticsInfo_registerSSID_withPlayer___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = a1[5];
  v2 = *(void **)(a1[4] + 8);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1[6]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v1);

}

+ (id)instance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__SSCoreHapticsInfo_instance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[SSCoreHapticsInfo instance]::onceToken != -1)
    dispatch_once(&+[SSCoreHapticsInfo instance]::onceToken, block);
  return (id)+[SSCoreHapticsInfo instance]::inst;
}

void __29__SSCoreHapticsInfo_instance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)+[SSCoreHapticsInfo instance]::inst;
  +[SSCoreHapticsInfo instance]::inst = (uint64_t)v1;

}

@end
