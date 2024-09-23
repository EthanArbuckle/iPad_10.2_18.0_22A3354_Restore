@implementation MRUVolumeController

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[MPVolumeController volumeControlLabel](self, "volumeControlLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p (%@)>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setDelegate:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MRUVolumeController;
  v4 = a3;
  -[MPVolumeController setDelegate:](&v5, sel_setDelegate_, v4);
  objc_storeWeak((id *)&self->_shadowDelegate, v4);

}

- (float)volumeValue
{
  float result;
  objc_super v3;

  if (self->_optimisticValue)
  {
    -[NSNumber floatValue](self->_optimisticValue, "floatValue");
  }
  else
  {
    v3.receiver = self;
    v3.super_class = (Class)MRUVolumeController;
    -[MPVolumeController volumeValue](&v3, sel_volumeValue);
  }
  return result;
}

- (void)setVolumeValue:(float)a3
{
  double v5;
  void *v6;
  void *v7;
  double v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MRUVolumeController;
  -[MPVolumeController setVolumeValue:](&v9, sel_setVolumeValue_);
  *(float *)&v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUVolumeController setOptimisticValue:](self, "setOptimisticValue:", v6);

  -[MRUVolumeController coordinationDelegate](self, "coordinationDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v8 = a3;
  objc_msgSend(v7, "volumeController:volumeValueDidChange:", self, v8);

}

- (void)setOptimisticValue:(id)a3
{
  id v5;
  NSObject *v6;
  float v7;
  id WeakRetained;
  char v9;
  id v10;
  NSTimer *v11;
  NSTimer *optimisticTimer;
  _QWORD v13[5];
  objc_super v14;
  uint8_t buf[4];
  MRUVolumeController *v16;
  __int16 v17;
  double v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!self->_optimisticValue)
  {
    MCLogCategoryVolume();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "floatValue");
      *(_DWORD *)buf = 138412546;
      v16 = self;
      v17 = 2048;
      v18 = v7;
      _os_log_impl(&dword_1AA991000, v6, OS_LOG_TYPE_DEFAULT, "%@ - Start optimistic state with: %.2f", buf, 0x16u);
    }

  }
  v14.receiver = self;
  v14.super_class = (Class)MRUVolumeController;
  -[MPVolumeController setDelegate:](&v14, sel_setDelegate_, 0);
  objc_storeStrong((id *)&self->_optimisticValue, a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_shadowDelegate);
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    v10 = objc_loadWeakRetained((id *)&self->_shadowDelegate);
    objc_msgSend(v5, "floatValue");
    objc_msgSend(v10, "volumeController:volumeValueDidChange:", self);

  }
  -[NSTimer invalidate](self->_optimisticTimer, "invalidate");
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __42__MRUVolumeController_setOptimisticValue___block_invoke;
  v13[3] = &unk_1E5819368;
  v13[4] = self;
  objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:repeats:block:", 0, v13, 2.0);
  v11 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  optimisticTimer = self->_optimisticTimer;
  self->_optimisticTimer = v11;

}

void __42__MRUVolumeController_setOptimisticValue___block_invoke(uint64_t a1)
{
  float v2;
  float v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  float v10;
  int v11;
  void *v12;
  __int16 v13;
  double v14;
  __int16 v15;
  double v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "floatValue");
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 32);
  *(_QWORD *)(v4 + 32) = 0;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = 0;

  objc_msgSend(*(id *)(a1 + 32), "restoreDelegate");
  MCLogCategoryVolume();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(void **)(a1 + 32);
    objc_msgSend(v9, "volumeValue");
    v11 = 138412802;
    v12 = v9;
    v13 = 2048;
    v14 = v10;
    v15 = 2048;
    v16 = v3;
    _os_log_impl(&dword_1AA991000, v8, OS_LOG_TYPE_DEFAULT, "%@ Finish optimistic state with value: %.2f (optimistic=%.2f)", (uint8_t *)&v11, 0x20u);
  }

}

- (void)beginEqualization
{
  MRUVolumeControllerDelegate **p_shadowDelegate;
  id WeakRetained;
  char v5;
  id v6;

  p_shadowDelegate = &self->_shadowDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_shadowDelegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)p_shadowDelegate);
    objc_msgSend(v6, "volumeControllerWillBeginEqualization:", self);

  }
}

- (void)finishEqualization
{
  MRUVolumeControllerDelegate **p_shadowDelegate;
  id WeakRetained;
  char v5;
  id v6;

  p_shadowDelegate = &self->_shadowDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_shadowDelegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)p_shadowDelegate);
    objc_msgSend(v6, "volumeControllerDidFinishEqualization:", self);

  }
}

- (void)restoreDelegate
{
  MRUVolumeControllerDelegate **p_shadowDelegate;
  id WeakRetained;
  id v5;
  char v6;
  void *v7;
  id v8;
  char v9;
  void *v10;
  id v11;
  char v12;
  void *v13;
  id v14;
  char v15;
  void *v16;
  objc_super v17;

  p_shadowDelegate = &self->_shadowDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_shadowDelegate);
  v17.receiver = self;
  v17.super_class = (Class)MRUVolumeController;
  -[MPVolumeController setDelegate:](&v17, sel_setDelegate_, WeakRetained);

  v5 = objc_loadWeakRetained((id *)p_shadowDelegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[MPVolumeController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRUVolumeController volumeValue](self, "volumeValue");
    objc_msgSend(v7, "volumeController:volumeValueDidChange:", self);

  }
  v8 = objc_loadWeakRetained((id *)p_shadowDelegate);
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[MPVolumeController delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "volumeController:volumeControlAvailableDidChange:", self, -[MPVolumeController isVolumeControlAvailable](self, "isVolumeControlAvailable"));

  }
  v11 = objc_loadWeakRetained((id *)p_shadowDelegate);
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    -[MPVolumeController delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "volumeController:volumeControlCapabilitiesDidChange:", self, -[MPVolumeController volumeCapabilities](self, "volumeCapabilities"));

  }
  v14 = objc_loadWeakRetained((id *)p_shadowDelegate);
  v15 = objc_opt_respondsToSelector();

  if ((v15 & 1) != 0)
  {
    -[MPVolumeController delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "volumeController:mutedStateDidChange:", self, -[MPVolumeController isMuted](self, "isMuted"));

  }
}

- (NSNumber)optimisticValue
{
  return self->_optimisticValue;
}

- (MRUVolumeControllerCoordinationDelegate)coordinationDelegate
{
  return (MRUVolumeControllerCoordinationDelegate *)objc_loadWeakRetained((id *)&self->_coordinationDelegate);
}

- (void)setCoordinationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_coordinationDelegate, a3);
}

- (MRUVolumeControllerDelegate)shadowDelegate
{
  return (MRUVolumeControllerDelegate *)objc_loadWeakRetained((id *)&self->_shadowDelegate);
}

- (void)setShadowDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_shadowDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_shadowDelegate);
  objc_destroyWeak((id *)&self->_coordinationDelegate);
  objc_storeStrong((id *)&self->_optimisticValue, 0);
  objc_storeStrong((id *)&self->_optimisticTimer, 0);
}

@end
