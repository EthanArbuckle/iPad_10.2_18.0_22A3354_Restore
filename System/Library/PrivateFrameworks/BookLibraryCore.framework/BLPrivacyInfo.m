@implementation BLPrivacyInfo

+ (id)sharedPrivacyInfo
{
  if (qword_254B61C50 != -1)
    dispatch_once(&qword_254B61C50, &unk_24CE8B530);
  return (id)qword_254B61C58;
}

- (BLPrivacyInfo)init
{
  BLPrivacyInfo *v2;
  BLPrivacyInfo *v3;
  NSNumber *cachedValue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BLPrivacyInfo;
  v2 = -[BLPrivacyInfo init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    cachedValue = v2->_cachedValue;
    v2->_cachedValue = 0;

    v3->_lock._os_unfair_lock_opaque = 0;
    -[BLPrivacyInfo _startObservingNotifications](v3, "_startObservingNotifications");
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[BLPrivacyInfo _stopObservingNotifications](self, "_stopObservingNotifications");
  v3.receiver = self;
  v3.super_class = (Class)BLPrivacyInfo;
  -[BLPrivacyInfo dealloc](&v3, sel_dealloc);
}

- (void)_startObservingNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x24BE0FBE8], "sharedProvider");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:accountTypes:", self, 1);

}

- (void)_stopObservingNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x24BE0FBE8], "sharedProvider");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:accountTypes:", self, 1);

}

- (BOOL)isGDPRPrivacyAcknowledgementRequired
{
  os_unfair_lock_s *p_lock;
  NSNumber *cachedValue;
  _BOOL4 v5;
  NSObject *p_super;
  NSObject *v7;
  int v8;
  NSObject *v9;
  NSNumber *v10;
  int v12;
  _BOOL4 v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  cachedValue = self->_cachedValue;
  if (cachedValue)
  {
    v5 = -[NSNumber BOOLValue](cachedValue, "BOOLValue");
    BLJaliscoLog();
    p_super = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG))
    {
      v12 = 67109120;
      v13 = v5;
      _os_log_impl(&dword_212C78000, p_super, OS_LOG_TYPE_DEBUG, "isGDPRPrivacyAcknowledgementRequired: Got cached value %{BOOL}d", (uint8_t *)&v12, 8u);
    }
    goto LABEL_11;
  }
  BLJaliscoLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v12) = 0;
    _os_log_impl(&dword_212C78000, v7, OS_LOG_TYPE_DEBUG, "isGDPRPrivacyAcknowledgementRequired: No cached value", (uint8_t *)&v12, 2u);
  }

  v8 = BUIsGDPRAcknowledgementNeededForBooks();
  BLJaliscoLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v12 = 67109120;
    v13 = v8;
    _os_log_impl(&dword_212C78000, v9, OS_LOG_TYPE_DEBUG, "isGDPRPrivacyAcknowledgementRequired: Got %{BOOL}d", (uint8_t *)&v12, 8u);
  }

  if ((v8 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
    v10 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v5) = 0;
    p_super = &self->_cachedValue->super.super;
    self->_cachedValue = v10;
LABEL_11:

    goto LABEL_12;
  }
  LOBYTE(v5) = 1;
LABEL_12:
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (void)clearCachedValue
{
  os_unfair_lock_s *p_lock;
  NSNumber *cachedValue;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  cachedValue = self->_cachedValue;
  self->_cachedValue = 0;

  os_unfair_lock_unlock(p_lock);
}

- (void)account:(unint64_t)a3 didChangeWithReason:(unint64_t)a4
{
  if (a4 - 101 <= 1)
    MEMORY[0x24BEDD108](self, sel_clearCachedValue);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedValue, 0);
}

@end
