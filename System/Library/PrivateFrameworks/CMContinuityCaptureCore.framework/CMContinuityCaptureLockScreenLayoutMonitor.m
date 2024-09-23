@implementation CMContinuityCaptureLockScreenLayoutMonitor

- (CMContinuityCaptureLockScreenLayoutMonitor)init
{
  CMContinuityCaptureLockScreenLayoutMonitor *v2;
  CMContinuityCaptureLockScreenLayoutMonitor *v3;
  void *v4;
  CMContinuityCaptureLockScreenLayoutMonitor *v5;
  uint64_t v6;
  FBSDisplayLayoutMonitor *layoutMonitor;
  _QWORD v9[4];
  CMContinuityCaptureLockScreenLayoutMonitor *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CMContinuityCaptureLockScreenLayoutMonitor;
  v2 = -[CMContinuityCaptureLockScreenLayoutMonitor init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lockScreenInLayout = 0;
    v2->_shieldFrontMostInLayout = 1;
    objc_msgSend(MEMORY[0x24BE38448], "configurationForDefaultMainDisplayMonitor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setNeedsUserInteractivePriority:", 1);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __50__CMContinuityCaptureLockScreenLayoutMonitor_init__block_invoke;
    v9[3] = &unk_24F06C148;
    v5 = v3;
    v10 = v5;
    objc_msgSend(v4, "setTransitionHandler:", v9);
    objc_msgSend(MEMORY[0x24BE38438], "monitorWithConfiguration:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    layoutMonitor = v5->_layoutMonitor;
    v5->_layoutMonitor = (FBSDisplayLayoutMonitor *)v6;

  }
  return v3;
}

void __50__CMContinuityCaptureLockScreenLayoutMonitor_init__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __50__CMContinuityCaptureLockScreenLayoutMonitor_init__block_invoke_2;
  v6[3] = &unk_24F06ADE8;
  v7 = *(id *)(a1 + 32);
  v8 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

uint64_t __50__CMContinuityCaptureLockScreenLayoutMonitor_init__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleLayout:", *(_QWORD *)(a1 + 40));
}

- (void)dealloc
{
  FBSDisplayLayoutMonitor *layoutMonitor;
  objc_super v4;

  -[FBSDisplayLayoutMonitor invalidate](self->_layoutMonitor, "invalidate");
  layoutMonitor = self->_layoutMonitor;
  self->_layoutMonitor = 0;

  v4.receiver = self;
  v4.super_class = (Class)CMContinuityCaptureLockScreenLayoutMonitor;
  -[CMContinuityCaptureLockScreenLayoutMonitor dealloc](&v4, sel_dealloc);
}

- (BOOL)lockScreenInLayout
{
  return self->_lockScreenInLayout;
}

- (void)_handleLayout:(id)a3
{
  id v4;
  NSObject *v5;
  int lockScreenInLayout;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  int v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  const char *v23;
  void *v24;
  int v25;
  void *v26;
  int v27;
  void *v28;
  char v29;
  int v30;
  _BOOL4 v31;
  NSObject *v32;
  _BOOL4 shieldFrontMostInLayout;
  _BOOL4 v34;
  NSObject *v35;
  int v36;
  NSObject *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  CMContinuityCaptureLockScreenLayoutMonitor *v41;
  uint64_t v42;
  int v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t buf[4];
  CMContinuityCaptureLockScreenLayoutMonitor *v49;
  __int16 v50;
  _BYTE v51[10];
  _BYTE v52[128];
  _QWORD v53[3];

  v53[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  CMContinuityCaptureLog(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v49 = self;
    v50 = 2112;
    *(_QWORD *)v51 = v4;
    _os_log_impl(&dword_227C5D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ New layout: %@", buf, 0x16u);
  }

  lockScreenInLayout = self->_lockScreenInLayout;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  if (!v4)
  {
    CMContinuityCaptureLog(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v49 = self;
      _os_log_impl(&dword_227C5D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Ignoring nil layout", buf, 0xCu);
    }
    goto LABEL_48;
  }
  v53[0] = *MEMORY[0x24BE38288];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v53, 1);
  v7 = objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "displayBacklightLevel"))
  {
    self->_lockScreenInLayout = 1;
    CMContinuityCaptureLog(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v49 = self;
      _os_log_impl(&dword_227C5D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Ignoring layout with minimum (0) backlight level.", buf, 0xCu);
    }
    goto LABEL_47;
  }
  objc_msgSend(v4, "elements");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bs_firstObjectPassingTest:", &__block_literal_global_6);
  v9 = objc_claimAutoreleasedReturnValue();

  if (v9)
    v43 = -[NSObject sb_isTransitioning](v9, "sb_isTransitioning");
  else
    v43 = 0;
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  objc_msgSend(v4, "elements");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
  if (!v11)
  {

    v30 = 0;
    self->_lockScreenInLayout = 0;
    v42 = -1;
    v39 = -1;
    goto LABEL_38;
  }
  v12 = v11;
  v36 = lockScreenInLayout;
  v37 = v9;
  v38 = v4;
  v41 = self;
  v13 = 0;
  v14 = *(_QWORD *)v45;
  v15 = *MEMORY[0x24BEB0C68];
  v39 = -1;
  v40 = *MEMORY[0x24BE38278];
  v42 = -1;
  do
  {
    for (i = 0; i != v12; ++i)
    {
      if (*(_QWORD *)v45 != v14)
        objc_enumerationMutation(v10);
      v17 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
      objc_msgSend(v17, "identifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[NSObject containsObject:](v7, "containsObject:", v18);

      if (v19)
      {
        CMContinuityCaptureLog(0);
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v17, "identifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v49 = v41;
          v50 = 2112;
          *(_QWORD *)v51 = v21;
          v22 = v20;
          v23 = "%{public}@ Ignoring %@ in layout";
          goto LABEL_23;
        }
        goto LABEL_24;
      }
      objc_msgSend(v17, "identifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "isEqualToString:", v15) & v43;

      if (v25 == 1)
      {
        CMContinuityCaptureLog(0);
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v17, "identifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v49 = v41;
          v50 = 2112;
          *(_QWORD *)v51 = v21;
          v22 = v20;
          v23 = "%{public}@ Ignoring %@ in layout during shield transition period";
LABEL_23:
          _os_log_impl(&dword_227C5D000, v22, OS_LOG_TYPE_DEFAULT, v23, buf, 0x16u);

        }
LABEL_24:

        continue;
      }
      if (objc_msgSend(v17, "level") > v42)
        v42 = objc_msgSend(v17, "level");
      objc_msgSend(v17, "bundleIdentifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "isEqualToString:", CFSTR("com.apple.ContinuityCaptureShieldUI"));

      if (v27 && objc_msgSend(v17, "level") > v39)
        v39 = objc_msgSend(v17, "level");
      objc_msgSend(v17, "identifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "isEqualToString:", v40);

      v13 |= v29;
    }
    v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
  }
  while (v12);

  v30 = v13 & 1;
  self = v41;
  v41->_lockScreenInLayout = v30;
  lockScreenInLayout = v36;
  if (v39 == -1)
    v39 = -1;
  else
    v41->_firstShieldLayoutReceived = 1;
  v9 = v37;
  v4 = v38;
LABEL_38:
  if (self->_firstShieldLayoutReceived)
  {
    v31 = v39 >= v42;
    if (self->_shieldFrontMostInLayout != v31 || v30 != lockScreenInLayout)
    {
      self->_shieldFrontMostInLayout = v31;
      CMContinuityCaptureLog(0);
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        shieldFrontMostInLayout = self->_shieldFrontMostInLayout;
        v34 = self->_lockScreenInLayout;
        *(_DWORD *)buf = 138543874;
        v49 = self;
        v50 = 1024;
        *(_DWORD *)v51 = shieldFrontMostInLayout;
        *(_WORD *)&v51[4] = 1024;
        *(_DWORD *)&v51[6] = v34;
        _os_log_impl(&dword_227C5D000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@ Update layout change, shieldFrontMostInLayout:%d lockScreenInLayout:%d", buf, 0x18u);
      }

      -[CMContinuityCaptureLockScreenLayoutMonitor delegate](self, "delegate");
      v35 = objc_claimAutoreleasedReturnValue();
      -[NSObject lockScreenLayoutMonitor:didUpdateLayoutWithShieldFrontMost:lockscreenInLayout:](v35, "lockScreenLayoutMonitor:didUpdateLayoutWithShieldFrontMost:lockscreenInLayout:", self, self->_shieldFrontMostInLayout, self->_lockScreenInLayout);
      goto LABEL_46;
    }
  }
  else
  {
    CMContinuityCaptureLog(0);
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v49 = self;
      _os_log_impl(&dword_227C5D000, v35, OS_LOG_TYPE_INFO, "%{public}@ Ignoring layout. Haven't received first layout with ShieldUI in it.", buf, 0xCu);
    }
LABEL_46:

  }
LABEL_47:

LABEL_48:
}

uint64_t __60__CMContinuityCaptureLockScreenLayoutMonitor__handleLayout___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.ContinuityCaptureShieldUI"));

  return v3;
}

- (CMContinuityCaptureLockScreenLayoutMonitorDelegate)delegate
{
  return (CMContinuityCaptureLockScreenLayoutMonitorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_layoutMonitor, 0);
}

@end
