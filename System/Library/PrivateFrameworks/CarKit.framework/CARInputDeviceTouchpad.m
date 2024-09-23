@implementation CARInputDeviceTouchpad

- (CARInputDeviceTouchpad)initWithServiceClient:(__IOHIDServiceClient *)a3 UUID:(id)a4 settings:(id)a5 delegate:(id)a6
{
  id v10;
  id v11;
  CARInputDeviceTouchpad *v12;
  CARInputDeviceTouchpad *v13;
  void *v14;
  char isKindOfClass;
  double v16;
  float v17;
  CGFloat v18;
  CGFloat v19;
  void *v20;
  objc_super v22;

  v10 = a5;
  v11 = a6;
  v22.receiver = self;
  v22.super_class = (Class)CARInputDeviceTouchpad;
  v12 = -[CARInputDevice initWithServiceClient:UUID:](&v22, sel_initWithServiceClient_UUID_, a3, a4);
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_delegate, v11);
    objc_msgSend(v10, "objectForKey:", CFSTR("touchpadSensitivity"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v16 = 0.5;
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v14, "floatValue", 0.5);
      v16 = v17;
    }
    v13->_sensitivity = v16;
    -[CARInputDeviceTouchpad _physicalSizeForTouchpadServiceClient:](v13, "_physicalSizeForTouchpadServiceClient:", a3);
    v13->_physicalSize.width = v18;
    v13->_physicalSize.height = v19;
    v13->_characterRecognitionSupported = -[CARInputDeviceTouchpad _characterRecognitionSupportedForServiceClient:](v13, "_characterRecognitionSupportedForServiceClient:", a3);
    objc_msgSend(v10, "objectForKey:", CFSTR("supportedHapticFeedbackTypes"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v13->_supportedFeedbackTypes = objc_msgSend(v20, "unsignedIntegerValue");

  }
  return v13;
}

- (BOOL)feedbackSupported
{
  return self->_supportedFeedbackTypes != 0;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const __CFString *v11;
  uint64_t v12;
  void *v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = -[CARInputDevice senderID](self, "senderID");
  -[CARInputDevice UUID](self, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CARInputDeviceTouchpad physicalSize](self, "physicalSize");
  v8 = v7;
  -[CARInputDeviceTouchpad physicalSize](self, "physicalSize");
  v10 = v9;
  if (-[CARInputDeviceTouchpad characterRecognitionSupported](self, "characterRecognitionSupported"))
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  -[CARInputDeviceTouchpad sensitivity](self, "sensitivity");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, senderID: %llu, UUID: %@, width: %.2f cm, height: %.2f cm, characterRecognition: %@, sensitivity: %.2f"), v4, self, v5, v6, v8, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)updateSettingsWithSettings:(id)a3
{
  void *v4;
  float v5;
  id v6;

  objc_msgSend(a3, "objectForKey:", CFSTR("touchpadSensitivity"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = v4;
    objc_msgSend(v4, "floatValue");
    -[CARInputDeviceTouchpad setSensitivity:](self, "setSensitivity:", v5);
    v4 = v6;
  }

}

- (void)performFeedbackOfType:(unint64_t)a3
{
  void *v5;
  id v6;

  if ((-[CARInputDeviceTouchpad supportedFeedbackTypes](self, "supportedFeedbackTypes") & a3) != 0)
  {
    -[CARInputDeviceTouchpad delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[CARInputDevice UUID](self, "UUID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "performHapticType:deviceUUID:", a3, v5);

    }
  }
}

- (CGSize)_physicalSizeForTouchpadServiceClient:(__IOHIDServiceClient *)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  v3 = (void *)IOHIDServiceClientCopyProperty(a3, CFSTR("Digitizer"));
  +[CARInputDeviceTouchpad physicalSizeForTouchpadWithDigitizerProperties:](CARInputDeviceTouchpad, "physicalSizeForTouchpadWithDigitizerProperties:", v3);
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

+ (CGSize)physicalSizeForTouchpadWithDigitizerProperties:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const __CFString *v7;
  const __CFString *v8;
  double v9;
  double v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __int16 v16;
  const __CFString *v17;
  void *v18;
  const __CFString *v19;
  uint64_t v20;
  void *v21;
  char v22;
  char v23;
  int v24;
  void *v25;
  float v26;
  float v27;
  void *v28;
  float v29;
  double v30;
  double v31;
  _BOOL4 v32;
  _BOOL4 v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;
  CGSize result;

  v46 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKey:", CFSTR("Transducers"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "firstObject");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "objectForKey:", CFSTR("Elements"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v42;
    v7 = CFSTR("Usage");
    v8 = CFSTR("Unit");
    v9 = 0.0;
    v10 = 0.0;
    v40 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v42 != v6)
          objc_enumerationMutation(v3);
        v12 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        objc_msgSend(v12, "objectForKey:", v7);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "integerValue");

        if ((v14 & 0xFFFFFFFFFFFFFFFELL) == 0x30)
        {
          objc_msgSend(v12, "objectForKey:", v8);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "unsignedIntegerValue");

          if ((v16 & 0xFFF0) == 0x10)
          {
            v17 = v7;
            v18 = v3;
            v19 = v8;
            v20 = v16 & 0xF;
            objc_msgSend(v12, "objectForKey:", CFSTR("UnitExponent"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "integerValue");

            v23 = v22 | 0xF0;
            if ((v22 & 8) == 0)
              v23 = v22;
            v24 = v23;
            objc_msgSend(v12, "objectForKey:", CFSTR("ScaledMax"));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "floatValue");
            v27 = v26;
            objc_msgSend(v12, "objectForKey:", CFSTR("ScaledMin"));
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "floatValue");
            v30 = (float)(v27 - v29);

            v31 = v30 * __exp10f((float)v24);
            if (v20 == 3)
              v31 = v31 * 2.54;
            if (v14 == 48)
            {
              v10 = v31;
            }
            else if (v14 == 49)
            {
              v9 = v31;
            }
            v8 = v19;
            v3 = v18;
            v7 = v17;
            v6 = v40;
          }
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    }
    while (v5);
  }
  else
  {
    v9 = 0.0;
    v10 = 0.0;
  }
  v32 = v9 != 0.0;
  v33 = v10 != 0.0;
  if (v32 && v33)
    v34 = v9;
  else
    v34 = 4.0;
  if (v32 && v33)
    v35 = v10;
  else
    v35 = 4.0;

  v36 = v35;
  v37 = v34;
  result.height = v37;
  result.width = v36;
  return result;
}

- (BOOL)_characterRecognitionSupportedForServiceClient:(__IOHIDServiceClient *)a3
{
  void *v3;
  BOOL v4;

  v3 = (void *)IOHIDServiceClientCopyProperty(a3, CFSTR("Unicode"));
  v4 = v3 != 0;

  return v4;
}

- (id)_initWithSupportedHapticTypes:(unint64_t)a3 physicalSize:(CGSize)a4 characterRecognitionSupported:(BOOL)a5 senderID:(unint64_t)a6 UUID:(id)a7
{
  CGFloat height;
  CGFloat width;
  id v13;
  CARInputDeviceTouchpad *v14;
  CARInputDeviceTouchpad *v15;
  objc_super v17;

  height = a4.height;
  width = a4.width;
  v13 = a7;
  v17.receiver = self;
  v17.super_class = (Class)CARInputDeviceTouchpad;
  v14 = -[CARInputDeviceTouchpad init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    -[CARInputDevice _setUUID:](v14, "_setUUID:", v13);
    -[CARInputDevice _setSenderID:](v15, "_setSenderID:", a6);
    v15->_physicalSize.width = width;
    v15->_physicalSize.height = height;
    v15->_characterRecognitionSupported = a5;
    v15->_supportedFeedbackTypes = a3;
  }

  return v15;
}

- (void)_setDelegate:(id)a3
{
  CARInputDeviceTouchpadDelegate **p_delegate;
  id WeakRetained;
  void *v6;
  id obj;

  obj = a3;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);

  v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)p_delegate, obj);
    v6 = obj;
  }

}

- (double)sensitivity
{
  return self->_sensitivity;
}

- (void)setSensitivity:(double)a3
{
  self->_sensitivity = a3;
}

- (CGSize)physicalSize
{
  double width;
  double height;
  CGSize result;

  width = self->_physicalSize.width;
  height = self->_physicalSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)characterRecognitionSupported
{
  return self->_characterRecognitionSupported;
}

- (unint64_t)supportedFeedbackTypes
{
  return self->_supportedFeedbackTypes;
}

- (CARInputDeviceTouchpadDelegate)delegate
{
  return (CARInputDeviceTouchpadDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
