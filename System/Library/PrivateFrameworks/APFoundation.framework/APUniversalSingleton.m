@implementation APUniversalSingleton

- (APUniversalSingleton)init
{
  APUniversalSingleton *v2;
  NSDictionary *v3;
  NSDictionary *singletons;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)APUniversalSingleton;
  v2 = -[APUniversalSingleton init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99D80]);
    singletons = v2->_singletons;
    v2->_singletons = v3;

    v5 = dispatch_queue_create("com.apple.ap.universalsingleton", MEMORY[0x1E0C80D50]);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

  }
  return v2;
}

- (void)_setValue:(id)a3 forSingletonKey:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *queue;
  _QWORD block[5];
  id v19;
  id v20;

  v6 = a3;
  v7 = a4;
  objc_msgSend__valueForSingletonKey_(self, v8, (uint64_t)v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    APSimulateCrashNoKillProcess((const char *)5, CFSTR("Error - Singleton instance for %@ already exists."), v11, v12, v13, v14, v15, v16, (uint64_t)v7);
  }
  else
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1CF252C20;
    block[3] = &unk_1E8C48370;
    block[4] = self;
    v19 = v6;
    v20 = v7;
    dispatch_barrier_async(queue, block);

  }
}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)APUniversalSingleton;
  -[APUniversalSingleton methodSignatureForSelector:](&v11, sel_methodSignatureForSelector_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    NSStringFromSelector(a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_hasPrefix_(v5, v6, (uint64_t)CFSTR("set"), v7))
      objc_msgSend_signatureWithObjCTypes_(MEMORY[0x1E0C99DD8], v8, (uint64_t)"v@:@", v9);
    else
      objc_msgSend_signatureWithObjCTypes_(MEMORY[0x1E0C99DD8], v8, (uint64_t)"@@:", v9);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

+ (id)sharedInstance
{
  uint64_t v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  APUniversalSingleton *v7;
  APUniversalSingleton *v8;

  if (qword_1ED2BC9C8 != -1)
    dispatch_once(&qword_1ED2BC9C8, &unk_1E8C47FF0);
  objc_msgSend_lock((void *)qword_1ED2BC9C0, a2, v2, v3);
  v7 = (APUniversalSingleton *)(id)qword_1ED2BC9D0;
  if (!qword_1ED2BC9D0)
  {
    v8 = objc_alloc_init(APUniversalSingleton);

    objc_storeStrong((id *)&qword_1ED2BC9D0, v8);
    v7 = v8;
  }
  objc_msgSend_unlock((void *)qword_1ED2BC9C0, v4, v5, v6);
  return v7;
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  id v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  id location;

  v4 = a3;
  v8 = (const char *)objc_msgSend_selector(v4, v5, v6, v7);
  NSStringFromSelector(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ap_propertyName(v9, v10, v11, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    if (objc_msgSend_hasPrefix_(v9, v13, (uint64_t)CFSTR("set"), v14))
    {
      location = 0;
      objc_msgSend_getArgument_atIndex_(v4, v16, (uint64_t)&location, 2);
      v18 = objc_loadWeakRetained(&location);
      objc_msgSend__setValue_forSingletonKey_(self, v19, (uint64_t)v18, (uint64_t)v15);

      objc_destroyWeak(&location);
    }
    else
    {
      objc_msgSend__valueForSingletonKey_(self, v16, (uint64_t)v9, v17);
      location = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setReturnValue_(v4, v20, (uint64_t)&location, v21);

    }
  }

}

- (id)_valueForSingletonKey:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_1CF276644;
  v16 = sub_1CF276654;
  v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1CF260A94;
  block[3] = &unk_1E8C48420;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

+ (void)resetSingleton
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  if (qword_1ED2BC9C8 != -1)
    dispatch_once(&qword_1ED2BC9C8, &unk_1E8C47FF0);
  objc_msgSend_lock((void *)qword_1ED2BC9C0, a2, v2, v3);
  v4 = (void *)qword_1ED2BC9D0;
  qword_1ED2BC9D0 = 0;

  objc_msgSend_unlock((void *)qword_1ED2BC9C0, v5, v6, v7);
}

+ (BOOL)isSingletonSet
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  if (qword_1ED2BC9C8 != -1)
    dispatch_once(&qword_1ED2BC9C8, &unk_1E8C47FF0);
  objc_msgSend_lock((void *)qword_1ED2BC9C0, a2, v2, v3);
  v4 = qword_1ED2BC9D0 != 0;
  objc_msgSend_unlock((void *)qword_1ED2BC9C0, v5, v6, v7);
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_singletons, 0);
}

@end
