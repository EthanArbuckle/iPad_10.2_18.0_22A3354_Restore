@implementation AMAmbientIlluminationTrigger

- (AMAmbientIlluminationTrigger)init
{
  id v3;
  AMAmbientIlluminationTrigger *v4;

  v3 = objc_alloc_init(MEMORY[0x24BE1A2D0]);
  v4 = -[AMAmbientIlluminationTrigger initWithBrightnessSystemClient:](self, "initWithBrightnessSystemClient:", v3);

  return v4;
}

- (AMAmbientIlluminationTrigger)initWithBrightnessSystemClient:(id)a3
{
  id v5;
  AMAmbientIlluminationTrigger *v6;
  AMAmbientIlluminationTrigger *v7;
  BrightnessSystemClient *brightnessSystemClient;
  void *v9;
  double v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, void *);
  void *v15;
  id v16;
  id location;
  objc_super v18;

  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)AMAmbientIlluminationTrigger;
  v6 = -[AMAmbientIlluminationTrigger init](&v18, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_brightnessSystemClient, a3);
    objc_initWeak(&location, v7);
    brightnessSystemClient = v7->_brightnessSystemClient;
    v12 = MEMORY[0x24BDAC760];
    v13 = 3221225472;
    v14 = __63__AMAmbientIlluminationTrigger_initWithBrightnessSystemClient___block_invoke;
    v15 = &unk_25075F948;
    objc_copyWeak(&v16, &location);
    -[BrightnessSystemClient registerNotificationBlock:forProperties:](brightnessSystemClient, "registerNotificationBlock:forProperties:", &v12, &unk_2507626F0);
    v9 = (void *)-[BrightnessSystemClient copyPropertyForKey:](v7->_brightnessSystemClient, "copyPropertyForKey:", CFSTR("TrustedLux"), v12, v13, v14, v15);
    objc_msgSend(v9, "doubleValue");
    v7->_ambientLux = v10;
    *(int64x2_t *)&v7->_activationThresholdLux = vdupq_n_s64(0xFFEFFFFFFFFFFFFFLL);
    v7->_triggered = 0;

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __63__AMAmbientIlluminationTrigger_initWithBrightnessSystemClient___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;

  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  LODWORD(a1) = objc_msgSend(v6, "isEqualToString:", CFSTR("TrustedLux"));

  if ((_DWORD)a1)
  {
    v8 = objc_opt_class();
    v9 = v5;
    if (v8)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v10 = v9;
      else
        v10 = 0;
    }
    else
    {
      v10 = 0;
    }
    v11 = v10;

    if (v11)
    {
      v12 = WeakRetained;
      v13 = v11;
      BSDispatchMain();

    }
  }

}

uint64_t __63__AMAmbientIlluminationTrigger_initWithBrightnessSystemClient___block_invoke_2(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "doubleValue");
  return objc_msgSend(v1, "_setAmbientLux:");
}

- (void)setActivationThresholdLux:(double)a3
{
  self->_activationThresholdLux = a3;
  -[AMAmbientIlluminationTrigger _evaluateTrigger](self, "_evaluateTrigger");
}

- (void)setDeactivationThresholdLux:(double)a3
{
  self->_deactivationThresholdLux = a3;
  -[AMAmbientIlluminationTrigger _evaluateTrigger](self, "_evaluateTrigger");
}

- (void)_setTriggered:(BOOL)a3
{
  NSObject *v4;
  _BOOL4 triggered;
  double ambientLux;
  double deactivationThresholdLux;
  double activationThresholdLux;
  void *v9;
  _DWORD v10[2];
  __int16 v11;
  double v12;
  __int16 v13;
  double v14;
  __int16 v15;
  double v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (self->_triggered != a3)
  {
    self->_triggered = a3;
    AMLogRedMode();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      triggered = self->_triggered;
      deactivationThresholdLux = self->_deactivationThresholdLux;
      ambientLux = self->_ambientLux;
      activationThresholdLux = self->_activationThresholdLux;
      v10[0] = 67109888;
      v10[1] = triggered;
      v11 = 2048;
      v12 = ambientLux;
      v13 = 2048;
      v14 = activationThresholdLux;
      v15 = 2048;
      v16 = deactivationThresholdLux;
      _os_log_impl(&dword_235FFE000, v4, OS_LOG_TYPE_DEFAULT, "ambient illumination trigger triggered: %{BOOL}u [ ambient lux: %f  on threshold: %f  off threshold: %f ]", (uint8_t *)v10, 0x26u);
    }

    -[AMAmbientIlluminationTrigger delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "ambientIlluminationTrigger:didUpdateTriggered:", self, self->_triggered);

  }
}

- (double)_effectiveDeactivationThresholdLux
{
  double v3;
  double v4;
  double result;

  -[AMAmbientIlluminationTrigger activationThresholdLux](self, "activationThresholdLux");
  v4 = v3;
  -[AMAmbientIlluminationTrigger deactivationThresholdLux](self, "deactivationThresholdLux");
  if (v4 >= result)
    return v4;
  return result;
}

- (void)_setAmbientLux:(double)a3
{
  self->_ambientLux = a3;
  -[AMAmbientIlluminationTrigger _evaluateTrigger](self, "_evaluateTrigger");
}

- (void)_evaluateTrigger
{
  double v3;
  double v4;
  double v5;
  uint64_t v6;
  double v7;
  double v8;

  -[AMAmbientIlluminationTrigger _ambientLux](self, "_ambientLux");
  v4 = v3;
  if (self->_triggered)
  {
    -[AMAmbientIlluminationTrigger _effectiveDeactivationThresholdLux](self, "_effectiveDeactivationThresholdLux");
LABEL_3:
    if (v4 <= v5)
      return;
    v6 = 0;
    goto LABEL_10;
  }
  -[AMAmbientIlluminationTrigger activationThresholdLux](self, "activationThresholdLux");
  v8 = v7;
  if (self->_triggered)
  {
    -[AMAmbientIlluminationTrigger _effectiveDeactivationThresholdLux](self, "_effectiveDeactivationThresholdLux");
    if (v4 > v8)
      goto LABEL_3;
  }
  else if (v4 > v7)
  {
    return;
  }
  v6 = 1;
LABEL_10:
  -[AMAmbientIlluminationTrigger _setTriggered:](self, "_setTriggered:", v6);
}

- (double)activationThresholdLux
{
  return self->_activationThresholdLux;
}

- (double)deactivationThresholdLux
{
  return self->_deactivationThresholdLux;
}

- (BOOL)isTriggered
{
  return self->_triggered;
}

- (double)_ambientLux
{
  return self->_ambientLux;
}

- (AMAmbientIlluminationTriggerDelegate)delegate
{
  return (AMAmbientIlluminationTriggerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_brightnessSystemClient, 0);
}

@end
