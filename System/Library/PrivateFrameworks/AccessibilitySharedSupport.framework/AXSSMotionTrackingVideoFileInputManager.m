@implementation AXSSMotionTrackingVideoFileInputManager

- (AXSSMotionTrackingVideoFileInputManager)init
{
  AXSSMotionTrackingVideoFileInputManager *v2;
  uint64_t v3;
  NSMutableArray *videoFileInputNames;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AXSSMotionTrackingVideoFileInputManager;
  v2 = -[AXSSMotionTrackingVideoFileInputManager init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    videoFileInputNames = v2->__videoFileInputNames;
    v2->__videoFileInputNames = (NSMutableArray *)v3;

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (self->__monitoring)
  {
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:", self);

  }
  v4.receiver = self;
  v4.super_class = (Class)AXSSMotionTrackingVideoFileInputManager;
  -[AXSSMotionTrackingVideoFileInputManager dealloc](&v4, sel_dealloc);
}

- (NSArray)videoFileInputNames
{
  return (NSArray *)(id)-[NSMutableArray copy](self->__videoFileInputNames, "copy");
}

- (void)startMonitoring
{
  void *v3;

  if (!-[AXSSMotionTrackingVideoFileInputManager _monitoring](self, "_monitoring"))
  {
    -[AXSSMotionTrackingVideoFileInputManager set_monitoring:](self, "set_monitoring:", 1);
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__videoFileInputNamesChanged_, CFSTR("com.apple.accessibility.MotionTracking.testVideoFileInputNamesChanged"), 0);

    -[AXSSMotionTrackingVideoFileInputManager _update](self, "_update");
  }
}

- (void)stopMonitoring
{
  void *v3;

  if (-[AXSSMotionTrackingVideoFileInputManager _monitoring](self, "_monitoring"))
  {
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:", self);

    -[AXSSMotionTrackingVideoFileInputManager set_monitoring:](self, "set_monitoring:", 0);
  }
}

- (void)_update
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  if (objc_msgSend((id)objc_opt_class(), "allowVideoFileInput"))
  {
    if (_update_onceToken != -1)
      dispatch_once(&_update_onceToken, &__block_literal_global_0);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)_update_s_userDefaults, "objectForKey:", CFSTR("testVideoFileInputNames"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __50__AXSSMotionTrackingVideoFileInputManager__update__block_invoke_2;
      v13[3] = &unk_1E5F98B10;
      v14 = v12;
      objc_msgSend(v3, "enumerateObjectsUsingBlock:", v13);

    }
    -[AXSSMotionTrackingVideoFileInputManager _videoFileInputNames](self, "_videoFileInputNames");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v12, "isEqual:", v4);

    if ((v5 & 1) == 0)
    {
      NSStringFromSelector(sel_videoFileInputNames);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXSSMotionTrackingVideoFileInputManager willChangeValueForKey:](self, "willChangeValueForKey:", v6);

      -[AXSSMotionTrackingVideoFileInputManager _videoFileInputNames](self, "_videoFileInputNames");
      v7 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v7, "setArray:", v12);

      NSStringFromSelector(sel_videoFileInputNames);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXSSMotionTrackingVideoFileInputManager didChangeValueForKey:](self, "didChangeValueForKey:", v8);

      -[AXSSMotionTrackingVideoFileInputManager delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v7) = objc_opt_respondsToSelector();

      if ((v7 & 1) != 0)
      {
        -[AXSSMotionTrackingVideoFileInputManager delegate](self, "delegate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_msgSend(v12, "copy");
        objc_msgSend(v10, "motionTrackingVideoFileInputManager:updatedVideoFileInputNames:", self, v11);

      }
    }

  }
}

void __50__AXSSMotionTrackingVideoFileInputManager__update__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.accessibility.MotionTracking"));
  v1 = (void *)_update_s_userDefaults;
  _update_s_userDefaults = v0;

}

void __50__AXSSMotionTrackingVideoFileInputManager__update__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v3, "length"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

- (AXSSMotionTrackingVideoFileInputManagerDelegate)delegate
{
  return (AXSSMotionTrackingVideoFileInputManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)_monitoring
{
  return self->__monitoring;
}

- (void)set_monitoring:(BOOL)a3
{
  self->__monitoring = a3;
}

- (NSMutableArray)_videoFileInputNames
{
  return self->__videoFileInputNames;
}

- (void)set_videoFileInputNames:(id)a3
{
  objc_storeStrong((id *)&self->__videoFileInputNames, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__videoFileInputNames, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
