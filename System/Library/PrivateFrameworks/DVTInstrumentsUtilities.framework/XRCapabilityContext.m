@implementation XRCapabilityContext

+ (void)announceUsedCapability:(id)a3 version:(unint64_t)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  unint64_t v9;

  v5 = a3;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_22635240C;
  v7[3] = &unk_24EDC2E10;
  v8 = v5;
  v9 = a4;
  v6 = v5;
  sub_2263521BC(v7);

}

+ (id)currentContextSet
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  objc_msgSend_weakObjectsHashTable(MEMORY[0x24BDD15C0], a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = sub_226352494;
  v8[3] = &unk_24EDC2E38;
  v6 = v5;
  v9 = v6;
  sub_2263521BC(v8);

  return v6;
}

+ (void)enterContextSet:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v3 = a3;
  sub_2263524E8(0, v4, v5, v6, v7);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v11, v8, (uint64_t)v3, v9, v10);

}

+ (void)leaveContextSet:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v3 = a3;
  sub_2263524E8(1, v4, v5, v6, v7);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObject_(v11, v8, (uint64_t)v3, v9, v10);

}

- (XRCapabilityContext)init
{
  XRCapabilityContext *v2;
  uint64_t v3;
  NSMutableDictionary *capabilities;
  uint64_t v5;
  NSMutableDictionary *unimplementedResponses;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)XRCapabilityContext;
  v2 = -[XRCapabilityContext init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    capabilities = v2->_capabilities;
    v2->_capabilities = (NSMutableDictionary *)v3;

    v5 = objc_opt_new();
    unimplementedResponses = v2->_unimplementedResponses;
    v2->_unimplementedResponses = (NSMutableDictionary *)v5;

    pthread_rwlock_init(&v2->_lock, 0);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  pthread_rwlock_destroy(&self->_lock);
  v3.receiver = self;
  v3.super_class = (Class)XRCapabilityContext;
  -[XRCapabilityContext dealloc](&v3, sel_dealloc);
}

- (void)announceUsedCapability:(id)a3 version:(unint64_t)a4
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  char v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  id v39;

  v39 = a3;
  pthread_rwlock_rdlock(&self->_lock);
  objc_msgSend_objectForKey_(self->_capabilities, v6, (uint64_t)v39, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v9;
  if (v9)
  {
    v14 = objc_msgSend_containsIndex_(v9, v10, a4, v11, v12);
    pthread_rwlock_unlock(&self->_lock);
    if ((v14 & 1) != 0)
      goto LABEL_9;
  }
  else
  {
    pthread_rwlock_unlock(&self->_lock);
  }
  pthread_rwlock_wrlock(&self->_lock);
  objc_msgSend_objectForKey_(self->_capabilities, v15, (uint64_t)v39, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend_addIndex_(v18, v19, a4, v20, v21);
    v13 = v18;
  }
  else
  {
    v22 = objc_alloc(MEMORY[0x24BDD1698]);
    v13 = (void *)objc_msgSend_initWithIndex_(v22, v23, a4, v24, v25);
    objc_msgSend_setObject_forKey_(self->_capabilities, v26, (uint64_t)v13, (uint64_t)v39, v27);
    objc_msgSend_applicationCapabilities(XRCapabilityRegistry, v28, v29, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_unimplementedRecoveryForCapability_(v32, v33, (uint64_t)v39, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(self->_unimplementedResponses, v37, (uint64_t)v36, (uint64_t)v39, v38);

  }
  pthread_rwlock_unlock(&self->_lock);
LABEL_9:

}

- (void)enumerateRequiredCapabilities:(id)a3
{
  id v4;
  NSMutableDictionary *capabilities;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  pthread_rwlock_rdlock(&self->_lock);
  capabilities = self->_capabilities;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = sub_22635286C;
  v10[3] = &unk_24EDC2E60;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(capabilities, v6, (uint64_t)v10, v7, v8);
  pthread_rwlock_unlock(&self->_lock);

}

- (void)addToCurrentContextSet
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  sub_22635296C(0, a2, v2, v3, v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v9, v6, (uint64_t)self, v7, v8);

}

- (void)removeFromCurrentContextSet
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  sub_22635296C(1, a2, v2, v3, v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObject_(v9, v6, (uint64_t)self, v7, v8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unimplementedResponses, 0);
  objc_storeStrong((id *)&self->_capabilities, 0);
}

@end
