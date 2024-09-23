@implementation CSPowerAssertionAccessory

- (CSPowerAssertionAccessory)initWithName:(id)a3 timeout:(double)a4
{
  __CFString *v7;
  CSPowerAssertionAccessory *v8;
  IOPMAssertionID *v9;
  NSString **p_name;
  _DWORD *v11;
  IOReturn v12;
  BOOL v13;
  uint64_t v14;
  NSString *v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  CSPowerAssertionAccessory *v19;
  IOReturn v20;
  BOOL v21;
  NSObject *v22;
  uint64_t v23;
  NSString *v24;
  objc_super v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  NSString *v30;
  __int16 v31;
  double v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = (__CFString *)a3;
  if (+[CSUtils deviceRequirePowerAssertionHeld](CSUtils, "deviceRequirePowerAssertionHeld"))
  {
    v26.receiver = self;
    v26.super_class = (Class)CSPowerAssertionAccessory;
    v8 = -[CSPowerAssertionAccessory init](&v26, sel_init);
    v9 = (IOPMAssertionID *)v8;
    if (v8)
    {
      p_name = &v8->_name;
      objc_storeStrong((id *)&v8->_name, a3);
      v9[2] = 0;
      v11 = v9 + 2;
      if (a4 == 0.0)
      {
        v12 = IOPMAssertionCreateWithName(CFSTR("PreventUserIdleSystemSleep"), 0xFFu, CFSTR("com.apple.corespeech.powerassertion"), v9 + 2);
        if (*v11)
          v13 = v12 == 0;
        else
          v13 = 0;
        if (!v13)
          goto LABEL_16;
        v14 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          v15 = *p_name;
          *(_DWORD *)buf = 136315394;
          v28 = "-[CSPowerAssertionAccessory initWithName:timeout:]";
          v29 = 2114;
          v30 = v15;
          v16 = "%s Taking power assertion %{public}@";
          v17 = v14;
          v18 = 22;
LABEL_21:
          _os_log_impl(&dword_1B502E000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
        }
      }
      else
      {
        v20 = IOPMAssertionCreateWithDescription(CFSTR("PreventUserIdleSystemSleep"), CFSTR("com.apple.corespeech.powerassertion"), 0, v7, 0, a4, CFSTR("TimeoutActionRelease"), v9 + 2);
        if (*v11)
          v21 = v20 == 0;
        else
          v21 = 0;
        if (!v21)
        {
LABEL_16:
          v22 = CSLogContextFacilityCoreSpeech;
          if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315138;
            v28 = "-[CSPowerAssertionAccessory initWithName:timeout:]";
            _os_log_error_impl(&dword_1B502E000, v22, OS_LOG_TYPE_ERROR, "%s Could not take power assertion", buf, 0xCu);
          }

          v9 = 0;
          goto LABEL_22;
        }
        v23 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          v24 = *p_name;
          *(_DWORD *)buf = 136315650;
          v28 = "-[CSPowerAssertionAccessory initWithName:timeout:]";
          v29 = 2114;
          v30 = v24;
          v31 = 2050;
          v32 = a4;
          v16 = "%s Taking power assertion %{public}@ for a max of %{public}lf seconds";
          v17 = v23;
          v18 = 32;
          goto LABEL_21;
        }
      }
    }
LABEL_22:
    self = v9;
    v19 = self;
    goto LABEL_23;
  }
  v19 = 0;
LABEL_23:

  return v19;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_assertionID)
    -[CSPowerAssertionAccessory invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)CSPowerAssertionAccessory;
  -[CSPowerAssertionAccessory dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  IOReturn v3;
  NSObject *v4;
  NSString *name;
  NSString *v6;
  int v7;
  const char *v8;
  __int16 v9;
  NSString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = IOPMAssertionRelease(self->_assertionID);
  v4 = CSLogContextFacilityCoreSpeech;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      name = self->_name;
      v7 = 136315394;
      v8 = "-[CSPowerAssertionAccessory invalidate]";
      v9 = 2114;
      v10 = name;
      _os_log_error_impl(&dword_1B502E000, v4, OS_LOG_TYPE_ERROR, "%s Fail to release power assertion %{public}@", (uint8_t *)&v7, 0x16u);
    }
  }
  else if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v6 = self->_name;
    v7 = 136315394;
    v8 = "-[CSPowerAssertionAccessory invalidate]";
    v9 = 2114;
    v10 = v6;
    _os_log_impl(&dword_1B502E000, v4, OS_LOG_TYPE_DEFAULT, "%s Successfully released power assertion %{public}@", (uint8_t *)&v7, 0x16u);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
