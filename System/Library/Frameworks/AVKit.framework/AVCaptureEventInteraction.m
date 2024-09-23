@implementation AVCaptureEventInteraction

uint64_t __60__AVCaptureEventInteraction__captureButtonsConfigurationSet__block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0DC42C0], "behaviorOptions");
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    -[AVCaptureEventInteraction _setUpPhysicalButtonInteractionIfNeeded]((uint64_t)self);
    -[AVCaptureEventInteraction _updatePhysicalButtonInteractionEnabled](self, "_updatePhysicalButtonInteractionEnabled");
  }
}

- (AVCaptureEventInteraction)initWithPrimaryEventHandler:(id)a3 secondaryEventHandler:(id)a4
{
  id v6;
  id v7;
  AVCaptureEventInteraction *v8;
  AVCaptureEventAction *v9;
  AVCaptureEventAction *v10;
  AVCaptureEventAction *primaryAction;
  AVCaptureEventAction *v12;
  AVCaptureEventAction *secondaryAction;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)AVCaptureEventInteraction;
  v8 = -[AVCaptureEventInteraction init](&v15, sel_init);
  if (v8)
  {
    v9 = -[AVCaptureEventAction initWithSource:eventHandler:]([AVCaptureEventAction alloc], "initWithSource:eventHandler:", 0, v6);
    v10 = -[AVCaptureEventAction initWithSource:eventHandler:]([AVCaptureEventAction alloc], "initWithSource:eventHandler:", 1, v7);
    primaryAction = v8->_primaryAction;
    v8->_primaryAction = v9;
    v12 = v9;

    secondaryAction = v8->_secondaryAction;
    v8->_secondaryAction = v10;

    v8->_enabled = 1;
  }

  return v8;
}

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

- (void)didMoveToView:(id)a3
{
  id v4;
  id WeakRetained;
  id obj;

  v4 = a3;
  if (self)
  {
    obj = v4;
    WeakRetained = objc_loadWeakRetained((id *)&self->_view);

    v4 = obj;
    if (WeakRetained != obj)
    {
      objc_storeWeak((id *)&self->_view, obj);
      -[AVCaptureEventInteraction _setUpPhysicalButtonInteractionIfNeeded]((uint64_t)self);
      -[AVCaptureEventInteraction _updatePhysicalButtonInteractionViewIfNeeded](self, "_updatePhysicalButtonInteractionViewIfNeeded");
      v4 = obj;
    }
  }

}

- (void)_setUpPhysicalButtonInteractionIfNeeded
{
  id WeakRetained;
  int v3;
  uint64_t v4;
  void *v5;
  id v6;

  if (a1)
  {
    if (!*(_QWORD *)(a1 + 32))
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
      if (WeakRetained)
      {
        v3 = *(unsigned __int8 *)(a1 + 40);

        if (v3)
        {
          +[AVCaptureEventInteraction _captureButtonsConfigurationSet](AVCaptureEventInteraction, "_captureButtonsConfigurationSet");
          v6 = (id)objc_claimAutoreleasedReturnValue();
          v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC42D0]), "initWithConfigurations:delegate:", v6, a1);
          v5 = *(void **)(a1 + 32);
          *(_QWORD *)(a1 + 32) = v4;

          objc_msgSend((id)a1, "_updatePhysicalButtonInteractionEnabled");
          objc_msgSend((id)a1, "_updatePhysicalButtonInteractionViewIfNeeded");

        }
      }
    }
  }
}

- (void)_updatePhysicalButtonInteractionViewIfNeeded
{
  _UIPhysicalButtonInteraction *v3;
  id WeakRetained;
  id v5;
  void *v6;
  NSObject *v7;
  int v8;
  _UIPhysicalButtonInteraction *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = self->_physicalButtonInteraction;
  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    -[_UIPhysicalButtonInteraction view](v3, "view");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5 != WeakRetained)
    {
      objc_msgSend(v5, "removeInteraction:", v3);
      objc_msgSend(WeakRetained, "addInteraction:", v3);
      _AVLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = 138412802;
        v9 = v3;
        v10 = 2112;
        v11 = v6;
        v12 = 2112;
        v13 = WeakRetained;
        _os_log_impl(&dword_1AC4B1000, v7, OS_LOG_TYPE_DEFAULT, "Updated view for interaction: %@\n\tfrom %@\n\tto: %@", (uint8_t *)&v8, 0x20u);
      }

    }
  }

}

- (void)_updatePhysicalButtonInteractionEnabled
{
  _UIPhysicalButtonInteraction *v3;
  int enabled;
  NSObject *v5;
  _DWORD v6[2];
  __int16 v7;
  _UIPhysicalButtonInteraction *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = self->_physicalButtonInteraction;
  enabled = self->_enabled;
  if (enabled != -[_UIPhysicalButtonInteraction _isEnabled](v3, "_isEnabled"))
  {
    -[_UIPhysicalButtonInteraction _setEnabled:](v3, "_setEnabled:", enabled != 0);
    _AVLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6[0] = 67109378;
      v6[1] = enabled;
      v7 = 2112;
      v8 = v3;
      _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "Updated enablement state to %d for interaction: %@", (uint8_t *)v6, 0x12u);
    }

  }
}

+ (id)_captureButtonsConfigurationSet
{
  return (id)objc_msgSend(MEMORY[0x1E0DC42C8], "_cameraShutterConfigurationsWithOptionsProvider:", &__block_literal_global_18499);
}

- (AVCaptureEventInteraction)initWithEventHandler:(id)a3
{
  return -[AVCaptureEventInteraction initWithPrimaryEventHandler:secondaryEventHandler:](self, "initWithPrimaryEventHandler:secondaryEventHandler:", a3, a3);
}

- (void)_physicalButtonInteraction:(id)a3 handleAction:(id)a4 withActiveActions:(id)a5
{
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  AVCaptureEventInteraction *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = objc_msgSend(v6, "_button");
  v8 = v6;
  v22 = v8;
  if (v7 == 5)
  {
    if (self && self->_enabled)
    {
      v9 = objc_msgSend(v8, "_stagePhase");
      if ((unint64_t)objc_msgSend(v22, "_numberOfStages") < 2)
      {
        v12 = 0;
      }
      else
      {
        v10 = objc_msgSend(v22, "_stage");
        v11 = v10 != objc_msgSend(v22, "_numberOfStages") - 1 || v9 == 1;
        v12 = !v11;
      }
      v17 = objc_msgSend(v22, "_state");
      v18 = objc_msgSend(v22, "_numberOfStages");
      if (v12)
      {
        if (v9)
        {
          v19 = v22;
          if (v9 == 3)
          {
            v9 = 2;
          }
          else
          {
            if (v9 != 2)
            {
              _AVLog();
              v21 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 134217984;
                v24 = v9;
                _os_log_impl(&dword_1AC4B1000, v21, OS_LOG_TYPE_DEFAULT, "Invalid _UIPhysicalButtonStagePhase %ld. Cannot be converted to AVCaptureEventPhase.", buf, 0xCu);
              }

              __assert_rtn("AVCaptureEventPhaseFromPhysicalButtonStagePhase", "AVCaptureEvent.m", 87, "NO");
            }
            v9 = 1;
          }
          goto LABEL_27;
        }
LABEL_25:
        v19 = v22;
LABEL_27:
        v16 = objc_msgSend(v19, "_button");
        v15 = self;
        goto LABEL_28;
      }
      v11 = v18 == 1;
      v8 = v22;
      if (v11 && v17 != 1)
      {
        v9 = AVCaptureEventPhaseFromPhysicalButtonState(v17);
        goto LABEL_25;
      }
    }
  }
  else if (self)
  {
    v13 = objc_msgSend(v8, "_state");
    v8 = v22;
    if (self->_enabled && v13 != 1)
    {
      v14 = objc_msgSend(v22, "_button");
      v9 = AVCaptureEventPhaseFromPhysicalButtonState(v13);
      v15 = self;
      v16 = v14;
LABEL_28:
      -[AVCaptureEventInteraction _actionForPhysicalButton:]((uint64_t)v15, v16);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "sendPhaseUpdate:", v9);

      v8 = v22;
    }
  }

}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_physicalButtonInteraction, 0);
  objc_storeStrong((id *)&self->_secondaryAction, 0);
  objc_storeStrong((id *)&self->_primaryAction, 0);
  objc_destroyWeak((id *)&self->_view);
}

- (id)_actionForPhysicalButton:(uint64_t)a1
{
  uint64_t v2;
  id v3;

  v2 = a2 - 1;
  if ((unint64_t)(a2 - 1) <= 4 && ((0x17u >> v2) & 1) != 0)
    v3 = *(id *)(a1 + qword_1AC5F8128[v2]);
  else
    v3 = 0;
  return v3;
}

@end
