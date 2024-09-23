@implementation _COCapabilityObserver

- (_COCapabilityObserver)initWithCapability:(id)a3 cluster:(id)a4 block:(id)a5
{
  id v8;
  id v9;
  id v10;
  _COCapabilityObserver *v11;
  uint64_t v12;
  NSString *capability;
  uint64_t v14;
  id cluster;
  uint64_t v16;
  id block;
  NSObject *v18;
  NSString *v20;
  id v21;
  objc_super v22;
  uint8_t buf[4];
  _COCapabilityObserver *v24;
  __int16 v25;
  NSString *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v22.receiver = self;
  v22.super_class = (Class)_COCapabilityObserver;
  v11 = -[_COCapabilityObserver init](&v22, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    capability = v11->_capability;
    v11->_capability = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    cluster = v11->_cluster;
    v11->_cluster = (id)v14;

    v16 = objc_msgSend(v10, "copy");
    block = v11->_block;
    v11->_block = (id)v16;

    *(_WORD *)&v11->_notified = 0;
    COLogForCategory(3);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      v20 = v11->_capability;
      v21 = v11->_cluster;
      *(_DWORD *)buf = 134218498;
      v24 = v11;
      v25 = 2112;
      v26 = v20;
      v27 = 2112;
      v28 = v21;
      _os_log_debug_impl(&dword_21214B000, v18, OS_LOG_TYPE_DEBUG, "%p observing Capability(%@) in Cluster(%@)", buf, 0x20u);
    }

  }
  return v11;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[_COCapabilityObserver capability](self, "capability");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_COCapabilityObserver cluster](self, "cluster");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_COCapabilityObserver notified](self, "notified");
  v7 = -[_COCapabilityObserver lastValue](self, "lastValue");
  v8 = 78;
  if (v7)
    v9 = 89;
  else
    v9 = 78;
  if (v6)
    v8 = 89;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("{ Capability Observer = %p, for Capability(%@) in Cluster(%@), notified(%c) lastValue(%c) }"), self, v4, v5, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)notify:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v5;
  uint64_t v6;
  _BOOL4 v7;
  int v8;
  NSObject *v9;
  int v10;
  _BYTE v11[12];
  __int16 v12;
  _COCapabilityObserver *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x24BDAC8D0];
  if (!-[_COCapabilityObserver notified](self, "notified"))
  {
    COLogForCategory(3);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v11 = 134218498;
      if (v3)
        v10 = 89;
      else
        v10 = 78;
      *(_QWORD *)&v11[4] = self;
      v12 = 2112;
      v13 = self;
      v14 = 1024;
      v15 = v10;
      _os_log_impl(&dword_21214B000, v9, OS_LOG_TYPE_DEFAULT, "Observer(%p/%@) invoking block for initial value(%c)", v11, 0x1Cu);
    }

    -[_COCapabilityObserver setNotified:](self, "setNotified:", 1);
    goto LABEL_15;
  }
  v5 = -[_COCapabilityObserver lastValue](self, "lastValue");
  COLogForCategory(3);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT);
  if (v5 != v3)
  {
    if (v7)
    {
      *(_DWORD *)v11 = 134218498;
      if (v3)
        v8 = 89;
      else
        v8 = 78;
      *(_QWORD *)&v11[4] = self;
      v12 = 2112;
      v13 = self;
      v14 = 1024;
      v15 = v8;
      _os_log_impl(&dword_21214B000, (os_log_t)v6, OS_LOG_TYPE_DEFAULT, "Observer(%p/%@) invoking block for changed value(%c)", v11, 0x1Cu);
    }

LABEL_15:
    -[_COCapabilityObserver setLastValue:](self, "setLastValue:", v3, *(_QWORD *)v11);
    -[_COCapabilityObserver block](self, "block");
    v6 = objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _BOOL8))(v6 + 16))(v6, v3);
    goto LABEL_16;
  }
  if (v7)
  {
    *(_DWORD *)v11 = 134218242;
    *(_QWORD *)&v11[4] = self;
    v12 = 2112;
    v13 = self;
    _os_log_impl(&dword_21214B000, (os_log_t)v6, OS_LOG_TYPE_DEFAULT, "Observer(%p/%@) not invoking block due to no change", v11, 0x16u);
  }
LABEL_16:

}

- (NSString)capability
{
  return self->_capability;
}

- (id)cluster
{
  return self->_cluster;
}

- (id)block
{
  return self->_block;
}

- (BOOL)notified
{
  return self->_notified;
}

- (void)setNotified:(BOOL)a3
{
  self->_notified = a3;
}

- (BOOL)lastValue
{
  return self->_lastValue;
}

- (void)setLastValue:(BOOL)a3
{
  self->_lastValue = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong(&self->_cluster, 0);
  objc_storeStrong((id *)&self->_capability, 0);
}

@end
