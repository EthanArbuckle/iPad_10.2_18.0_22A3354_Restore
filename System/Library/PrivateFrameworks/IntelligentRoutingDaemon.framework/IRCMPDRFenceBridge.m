@implementation IRCMPDRFenceBridge

- (IRCMPDRFenceBridge)initWithFenceIdentifier:(id)a3
{
  id v4;
  IRCMPDRFenceBridge *v5;
  IRCMPDRFenceBridge *v6;
  void *v7;
  id v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)IRCMPDRFenceBridge;
  v5 = -[IRCMPDRFenceBridge init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    -[IRCMPDRFenceBridge setLock:](v5, "setLock:", 0);
    objc_msgSend(CFSTR("com.apple.intelligentrouting.fence."), "stringByAppendingString:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[IRCMPDRFenceBridge setFenceIdentifier:](v6, "setFenceIdentifier:", v7);

    v8 = objc_alloc_init(MEMORY[0x24BDC1410]);
    -[IRCMPDRFenceBridge setFenceManager:](v6, "setFenceManager:", v8);

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  if (-[IRCMPDRFenceBridge isFenceActive](self, "isFenceActive"))
  {
    -[IRCMPDRFenceBridge fenceManager](self, "fenceManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[IRCMPDRFenceBridge fenceIdentifier](self, "fenceIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "clearFence:", v4);

  }
  if (-[IRCMPDRFenceBridge isSessionStarted](self, "isSessionStarted"))
  {
    -[IRCMPDRFenceBridge fenceManager](self, "fenceManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endSession");

  }
  v6.receiver = self;
  v6.super_class = (Class)IRCMPDRFenceBridge;
  -[IRCMPDRFenceBridge dealloc](&v6, sel_dealloc);
}

- (void)startSession
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[IRCMPDRFenceBridge _startSession](self, "_startSession");
  os_unfair_lock_unlock(p_lock);
}

- (void)endSession
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (+[IRCMPDRFenceBridge isAvailable](IRCMPDRFenceBridge, "isAvailable")
    && -[IRCMPDRFenceBridge isSessionStarted](self, "isSessionStarted"))
  {
    -[IRCMPDRFenceBridge fenceManager](self, "fenceManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endSession");

    -[IRCMPDRFenceBridge setIsSessionStarted:](self, "setIsSessionStarted:", 0);
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)setFence:(float)a3 withCompletion:(id)a4
{
  void (**v6)(_QWORD);
  os_unfair_lock_s *p_lock;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  NSObject *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(_QWORD))a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (+[IRCMPDRFenceBridge isAvailable](IRCMPDRFenceBridge, "isAvailable")
    && -[IRCMPDRFenceBridge isSessionStarted](self, "isSessionStarted"))
  {
    if (-[IRCMPDRFenceBridge isFenceActive](self, "isFenceActive"))
    {
      -[IRCMPDRFenceBridge fenceManager](self, "fenceManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[IRCMPDRFenceBridge fenceIdentifier](self, "fenceIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "clearFence:", v9);

    }
    v10 = (id)*MEMORY[0x24BE5B270];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      -[IRCMPDRFenceBridge fenceIdentifier](self, "fenceIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(float *)&v12 = a3;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v23 = v11;
      v24 = 2112;
      v25 = v13;
      _os_log_impl(&dword_23FFBA000, v10, OS_LOG_TYPE_INFO, "#pdr-fence-bridge, Setting PDR fence (%@) with radius %@", buf, 0x16u);

    }
    objc_initWeak((id *)buf, self);
    -[IRCMPDRFenceBridge fenceManager](self, "fenceManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[IRCMPDRFenceBridge fenceIdentifier](self, "fenceIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __46__IRCMPDRFenceBridge_setFence_withCompletion___block_invoke;
    v20[3] = &unk_251045CA0;
    objc_copyWeak(&v21, (id *)buf);
    *(float *)&v16 = a3;
    objc_msgSend(v14, "setFence:withRadius:withCompletion:", v15, v20, v16);

    -[IRCMPDRFenceBridge setIsFenceActive:](self, "setIsFenceActive:", 1);
    -[IRCMPDRFenceBridge setCompletionHandler:](self, "setCompletionHandler:", v6);
    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v17 = (id)*MEMORY[0x24BE5B270];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", +[IRCMPDRFenceBridge isAvailable](IRCMPDRFenceBridge, "isAvailable"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[IRCMPDRFenceBridge isSessionStarted](self, "isSessionStarted"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v23 = v18;
      v24 = 2112;
      v25 = v19;
      _os_log_error_impl(&dword_23FFBA000, v17, OS_LOG_TYPE_ERROR, "#pdr-fence-bridge, [ErrorId - Pedestrian fence set fail] Failed to set pedestrian fence, isAvailable:%@, isSessionStarted:%@", buf, 0x16u);

    }
    v6[2](v6);
  }
  os_unfair_lock_unlock(p_lock);

}

void __46__IRCMPDRFenceBridge_setFence_withCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id WeakRetained;
  void *v5;
  id v6;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_handleFenceCompletionWithError:", v6);

}

- (void)clearFence
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (-[IRCMPDRFenceBridge isFenceActive](self, "isFenceActive"))
  {
    -[IRCMPDRFenceBridge fenceManager](self, "fenceManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[IRCMPDRFenceBridge fenceIdentifier](self, "fenceIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clearFence:", v5);

    -[IRCMPDRFenceBridge setIsFenceActive:](self, "setIsFenceActive:", 0);
    -[IRCMPDRFenceBridge setCompletionHandler:](self, "setCompletionHandler:", 0);
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)_startSession
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, void *, void *);
  void *v7;
  id v8;
  id location;

  if (+[IRCMPDRFenceBridge isAvailable](IRCMPDRFenceBridge, "isAvailable"))
  {
    if (!-[IRCMPDRFenceBridge isSessionStarted](self, "isSessionStarted"))
    {
      objc_initWeak(&location, self);
      -[IRCMPDRFenceBridge fenceManager](self, "fenceManager");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = MEMORY[0x24BDAC760];
      v5 = 3221225472;
      v6 = __35__IRCMPDRFenceBridge__startSession__block_invoke;
      v7 = &unk_251045CC8;
      objc_copyWeak(&v8, &location);
      objc_msgSend(v3, "startSessionWithStatusHandler:", &v4);

      -[IRCMPDRFenceBridge setIsSessionStarted:](self, "setIsSessionStarted:", 1, v4, v5, v6, v7);
      objc_destroyWeak(&v8);
      objc_destroyWeak(&location);
    }
  }
}

void __35__IRCMPDRFenceBridge__startSession__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v8 = *MEMORY[0x24BE5B270];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_INFO))
    {
      v9 = 138412290;
      v10 = v5;
      _os_log_impl(&dword_23FFBA000, v8, OS_LOG_TYPE_INFO, "#pdr-fence-bridge, startSessionWithStatusHandler: %@", (uint8_t *)&v9, 0xCu);
    }
    if (v6)
      objc_msgSend(WeakRetained, "_handleFenceCompletionWithError:", v6);
  }

}

- (void)_handleFenceCompletionWithError:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void (**v10)(void);
  uint8_t v11[24];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  v5 = *MEMORY[0x24BE5B270];
  if (v4)
  {
    v6 = v5;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "localizedDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[IRCMPDRFenceBridge fenceIdentifier](self, "fenceIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[IRCMPDRFenceBridge _handleFenceCompletionWithError:].cold.1(v7, v8, v11, v6);
    }

    -[IRCMPDRFenceBridge setIsSessionStarted:](self, "setIsSessionStarted:", 0);
    -[IRCMPDRFenceBridge _startSession](self, "_startSession");
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_23FFBA000, v5, OS_LOG_TYPE_INFO, "#pdr-fence-bridge, PDR fence completed sucessfully", v11, 2u);
  }
  -[IRCMPDRFenceBridge completionHandler](self, "completionHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[IRCMPDRFenceBridge completionHandler](self, "completionHandler");
    v10 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v10[2]();

    -[IRCMPDRFenceBridge setCompletionHandler:](self, "setCompletionHandler:", 0);
  }
  -[IRCMPDRFenceBridge setIsFenceActive:](self, "setIsFenceActive:", 0);
  os_unfair_lock_unlock(&self->_lock);

}

+ (BOOL)isAvailable
{
  uint64_t v2;

  LODWORD(v2) = objc_msgSend(MEMORY[0x24BDC1410], "isAvailable");
  if ((_DWORD)v2)
    return ((unint64_t)objc_msgSend(MEMORY[0x24BDC1410], "availableFenceTypes") >> 1) & 1;
  return v2;
}

- (CMPedestrianFenceManager)fenceManager
{
  return self->_fenceManager;
}

- (void)setFenceManager:(id)a3
{
  objc_storeStrong((id *)&self->_fenceManager, a3);
}

- (NSString)fenceIdentifier
{
  return self->_fenceIdentifier;
}

- (void)setFenceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_fenceIdentifier, a3);
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (BOOL)isFenceActive
{
  return self->_isFenceActive;
}

- (void)setIsFenceActive:(BOOL)a3
{
  self->_isFenceActive = a3;
}

- (BOOL)isSessionStarted
{
  return self->_isSessionStarted;
}

- (void)setIsSessionStarted:(BOOL)a3
{
  self->_isSessionStarted = a3;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_fenceIdentifier, 0);
  objc_storeStrong((id *)&self->_fenceManager, 0);
}

- (void)_handleFenceCompletionWithError:(uint8_t *)buf .cold.1(void *a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_error_impl(&dword_23FFBA000, log, OS_LOG_TYPE_ERROR, "#pdr-fence-bridge, [ErrorId - PDR fence completion error] PDR fence completed with error: %@ and identifier %@", buf, 0x16u);

}

@end
