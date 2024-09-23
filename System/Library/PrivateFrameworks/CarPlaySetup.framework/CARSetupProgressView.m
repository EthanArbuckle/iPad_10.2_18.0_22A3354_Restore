@implementation CARSetupProgressView

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[CARSetupProgressView animatedObservedProgress](self, "animatedObservedProgress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    NSStringFromSelector(sel_fractionCompleted);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, v4, 0);

  }
  v5.receiver = self;
  v5.super_class = (Class)CARSetupProgressView;
  -[CARSetupProgressView dealloc](&v5, sel_dealloc);
}

- (void)setObservedProgress:(id)a3 animated:(BOOL)a4
{
  id v5;
  void *v6;

  if (a4)
  {
    v5 = a3;
    NSStringFromSelector(sel_fractionCompleted);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:forKeyPath:options:context:", self, v6, 0, 0);

    -[CARSetupProgressView setAnimatedObservedProgress:](self, "setAnimatedObservedProgress:", v5);
  }
  else
  {
    -[CARSetupProgressView setObservedProgress:](self, "setObservedProgress:", a3);
  }

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v7 = a4;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __71__CARSetupProgressView_observeValueForKeyPath_ofObject_change_context___block_invoke;
  v9[3] = &unk_250986E78;
  v9[4] = self;
  v10 = v7;
  v8 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], v9);

}

void __71__CARSetupProgressView_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  float v5;
  NSObject *v6;
  double v7;

  objc_msgSend(*(id *)(a1 + 32), "animatedObservedProgress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && objc_msgSend(v2, "isEqual:", *(_QWORD *)(a1 + 40)))
  {
    objc_msgSend(v3, "fractionCompleted");
    v5 = v4;
    CARSetupLogForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __71__CARSetupProgressView_observeValueForKeyPath_ofObject_change_context___block_invoke_cold_1(v6, v5);

    *(float *)&v7 = v5;
    objc_msgSend(*(id *)(a1 + 32), "setProgress:animated:", 1, v7);
  }

}

- (NSProgress)animatedObservedProgress
{
  return self->_animatedObservedProgress;
}

- (void)setAnimatedObservedProgress:(id)a3
{
  objc_storeStrong((id *)&self->_animatedObservedProgress, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animatedObservedProgress, 0);
}

void __71__CARSetupProgressView_observeValueForKeyPath_ofObject_change_context___block_invoke_cold_1(os_log_t log, float a2)
{
  int v2;
  double v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 134217984;
  v3 = a2;
  _os_log_debug_impl(&dword_237AF2000, log, OS_LOG_TYPE_DEBUG, "setting progress view to %f", (uint8_t *)&v2, 0xCu);
}

@end
