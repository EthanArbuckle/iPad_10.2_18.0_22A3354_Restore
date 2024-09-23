@implementation CORoleDefaultsMonitor

- (CORoleDefaultsMonitor)initWithDelegate:(id)a3
{
  id v4;
  CORoleDefaultsMonitor *v5;
  CORoleDefaultsMonitor *v6;
  uint64_t v7;
  NSUserDefaults *SoundBoardDefaults;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CORoleDefaultsMonitor;
  v5 = -[CORoleDefaultsMonitor init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v6->_result = 0;
    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.soundboard"));
    SoundBoardDefaults = v6->_SoundBoardDefaults;
    v6->_SoundBoardDefaults = (NSUserDefaults *)v7;

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[CORoleDefaultsMonitor SoundBoardDefaults](self, "SoundBoardDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("stereo_leader_info"), 0);

  -[CORoleDefaultsMonitor SoundBoardDefaults](self, "SoundBoardDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:forKeyPath:context:", self, CFSTR("stereo_temporary_leader"), 0);

  v5.receiver = self;
  v5.super_class = (Class)CORoleDefaultsMonitor;
  -[CORoleDefaultsMonitor dealloc](&v5, sel_dealloc);
}

- (void)activate
{
  -[NSUserDefaults addObserver:forKeyPath:options:context:](self->_SoundBoardDefaults, "addObserver:forKeyPath:options:context:", self, CFSTR("stereo_leader_info"), 4, 0);
  -[NSUserDefaults addObserver:forKeyPath:options:context:](self->_SoundBoardDefaults, "addObserver:forKeyPath:options:context:", self, CFSTR("stereo_temporary_leader"), 4, 0);
}

- (void)_updateState
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  NSObject *v6;
  int v7;
  unint64_t v8;
  __int16 v9;
  unint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = -[CORoleDefaultsMonitor result](self, "result");
  v4 = -[CORoleDefaultsMonitor _getCurrentResult](self, "_getCurrentResult");
  if (v4 != v3)
  {
    v5 = v4;
    COCoreLogForCategory(4);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 134218240;
      v8 = v3;
      v9 = 2048;
      v10 = v5;
      _os_log_impl(&dword_215E92000, v6, OS_LOG_TYPE_DEFAULT, "Monitored result changed from %lu to %lu", (uint8_t *)&v7, 0x16u);
    }

    -[CORoleDefaultsMonitor setResult:](self, "setResult:", v5);
    -[CORoleDefaultsMonitor _notifyDelegate:](self, "_notifyDelegate:", v5);
  }
}

- (unint64_t)_getCurrentResult
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  int v8;

  -[CORoleDefaultsMonitor SoundBoardDefaults](self, "SoundBoardDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("stereo_temporary_leader"));
  objc_msgSend(v2, "dictionaryForKey:", CFSTR("stereo_leader_info"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((v3 & 1) != 0)
  {
    v6 = 2;
  }
  else if (v4)
  {
    objc_msgSend(v4, "valueForKey:", CFSTR("stereo_leader"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "BOOLValue");

    if (v8)
      v6 = 2;
    else
      v6 = 3;
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7;

  v7 = a3;
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("stereo_leader_info")) & 1) != 0
    || objc_msgSend(v7, "isEqualToString:", CFSTR("stereo_temporary_leader")))
  {
    -[CORoleDefaultsMonitor _updateState](self, "_updateState");
  }

}

- (void)_notifyDelegate:(unint64_t)a3
{
  void *v5;
  id v6;

  -[CORoleDefaultsMonitor delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, "monitor:defaultChanged:", self, a3);
    v5 = v6;
  }

}

- (CORoleDefaultsMonitorDelegate)delegate
{
  return (CORoleDefaultsMonitorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (unint64_t)result
{
  return self->_result;
}

- (void)setResult:(unint64_t)a3
{
  self->_result = a3;
}

- (NSUserDefaults)SoundBoardDefaults
{
  return self->_SoundBoardDefaults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_SoundBoardDefaults, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
