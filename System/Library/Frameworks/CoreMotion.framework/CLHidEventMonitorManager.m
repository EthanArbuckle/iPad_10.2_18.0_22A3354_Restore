@implementation CLHidEventMonitorManager

- (CLHidEventMonitorManager)initWithDelegate:(id)a3 queue:(id)a4 matching:(id)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CLHidEventMonitorManager;
  return -[CLHidEventManager initWithDelegate:queue:matching:type:](&v6, sel_initWithDelegate_queue_matching_type_, a3, a4, a5, 1);
}

- (void)addSystemClientMatching:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;

  v7 = (void *)objc_msgSend_matching(self, a2, (uint64_t)a3, v3, v4);
  objc_msgSend_addObject_(v7, v8, (uint64_t)a3, v9, v10);
  v15 = (void *)objc_msgSend_manager(self, v11, v12, v13, v14);
  v20 = objc_msgSend_matching(self, v16, v17, v18, v19);
  objc_msgSend_setMatching_(v15, v21, v20, v22, v23);
}

- (void)removeSystemClientmatching:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;

  v7 = (void *)objc_msgSend_matching(self, a2, (uint64_t)a3, v3, v4);
  objc_msgSend_removeObject_(v7, v8, (uint64_t)a3, v9, v10);
  v15 = (void *)objc_msgSend_manager(self, v11, v12, v13, v14);
  v20 = objc_msgSend_matching(self, v16, v17, v18, v19);
  objc_msgSend_setMatching_(v15, v21, v20, v22, v23);
}

@end
