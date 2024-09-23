@implementation BKSSceneHostRegistration

- (void)updateSettings:(id)a3
{
  BKSSceneHostSettings *v5;
  BKSSceneHostSettings *v6;

  v5 = (BKSSceneHostSettings *)a3;
  if (self->_sceneHostSettings != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_sceneHostSettings, a3);
    -[BKSTouchEventService _updateRegistration:]((uint64_t)self->_service, self);
    v5 = v6;
  }

}

- (void)invalidate
{
  BKSTouchEventService *service;
  BKSSceneHostRegistration *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  BKSSceneHostRegistration *v12;

  service = self->_service;
  v3 = self;
  if (service)
  {
    v12 = v3;
    os_unfair_lock_lock(&service->_registrationLock);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v12->_contextID);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](service->_registrationLock_registrationsByContextID, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
      objc_msgSend(v5, "removeObject:", v12);
    if (!objc_msgSend(v6, "count"))
      -[NSMutableDictionary removeObjectForKey:](service->_registrationLock_registrationsByContextID, "removeObjectForKey:", v4);
    objc_msgSend(v6, "lastObject");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v7)
      v9 = *(void **)(v7 + 24);
    else
      v9 = 0;
    v10 = v9;

    os_unfair_lock_unlock(&service->_registrationLock);
    -[BSServiceConnection remoteTarget](service->_connection, "remoteTarget");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setSceneHostSettings:forContextID:", v10, v4);

    v3 = v12;
  }

}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", self);
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  BKSSceneHostRegistration *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__BKSSceneHostRegistration_appendDescriptionToFormatter___block_invoke;
  v6[3] = &unk_1E1EA1BF8;
  v7 = v4;
  v8 = self;
  v5 = v4;
  objc_msgSend(v5, "appendProem:block:", self, v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneHostSettings, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

id __57__BKSSceneHostRegistration_appendDescriptionToFormatter___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:format:", *(unsigned int *)(*(_QWORD *)(a1 + 40) + 8), CFSTR("contextID"), 1);
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), CFSTR("sceneHostSettings"));
}

@end
