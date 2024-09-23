@implementation GCDualSenseAdaptiveTrigger

- (void)dealloc
{
  objc_super v3;

  -[GCDualSenseAdaptiveTrigger stopObservingChangesForAdaptiveTriggers:](self, "stopObservingChangesForAdaptiveTriggers:", self->_adaptiveTriggers);
  v3.receiver = self;
  v3.super_class = (Class)GCDualSenseAdaptiveTrigger;
  -[GCDualSenseAdaptiveTrigger dealloc](&v3, sel_dealloc);
}

- (void)setModeSlopeFeedbackWithStartPosition:(float)startPosition endPosition:(float)endPosition startStrength:(float)startStrength endStrength:(float)endStrength
{
  GCDeviceAdaptiveTriggersPayload *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;

  if (startPosition <= endPosition)
  {
    v11 = [GCDeviceAdaptiveTriggersPayload alloc];
    *(float *)&v15 = fmaxf(startPosition, 0.0);
    if (*(float *)&v15 > 1.0)
      *(float *)&v15 = 1.0;
    *(float *)&v12 = fmaxf(endPosition, 0.0);
    if (*(float *)&v12 > 1.0)
      *(float *)&v12 = 1.0;
    *(float *)&v13 = fmaxf(startStrength, 0.0);
    if (*(float *)&v13 > 1.0)
      *(float *)&v13 = 1.0;
    *(float *)&v14 = fmaxf(endStrength, 0.0);
    if (*(float *)&v14 > 1.0)
      *(float *)&v14 = 1.0;
    v16 = -[GCDeviceAdaptiveTriggersPayload initSlopeFeedbackWithStartPosition:endPosition:startStrength:endStrength:](v11, "initSlopeFeedbackWithStartPosition:endPosition:startStrength:endStrength:", v15, v12, v13, v14);
    -[GCDualSenseAdaptiveTrigger sendAdaptiveTriggerPayload:](self, "sendAdaptiveTriggerPayload:", v16);

  }
  else
  {
    +[NSException raise:format:](&off_254DEE1B8, "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("endPosition must be larger than startPosition"));
  }
}

- (void)setModeFeedbackWithStartPosition:(float)startPosition resistiveStrength:(float)resistiveStrength
{
  GCDeviceAdaptiveTriggersPayload *v7;
  double v8;
  double v9;
  id v10;

  v7 = [GCDeviceAdaptiveTriggersPayload alloc];
  *(float *)&v9 = fmaxf(startPosition, 0.0);
  if (*(float *)&v9 > 1.0)
    *(float *)&v9 = 1.0;
  *(float *)&v8 = fmaxf(resistiveStrength, 0.0);
  if (*(float *)&v8 > 1.0)
    *(float *)&v8 = 1.0;
  v10 = -[GCDeviceAdaptiveTriggersPayload initFeedbackWithStartPosition:resistiveStrength:](v7, "initFeedbackWithStartPosition:resistiveStrength:", v9, v8);
  -[GCDualSenseAdaptiveTrigger sendAdaptiveTriggerPayload:](self, "sendAdaptiveTriggerPayload:", v10);

}

- (void)setModeWeaponWithStartPosition:(float)startPosition endPosition:(float)endPosition resistiveStrength:(float)resistiveStrength
{
  GCDeviceAdaptiveTriggersPayload *v9;
  double v10;
  double v11;
  double v12;
  id v13;

  v9 = [GCDeviceAdaptiveTriggersPayload alloc];
  *(float *)&v12 = fmaxf(startPosition, 0.0);
  if (*(float *)&v12 > 1.0)
    *(float *)&v12 = 1.0;
  if (startPosition >= endPosition)
    *(float *)&v10 = startPosition;
  else
    *(float *)&v10 = endPosition;
  if (*(float *)&v10 > 1.0)
    *(float *)&v10 = 1.0;
  *(float *)&v11 = fmaxf(resistiveStrength, 0.0);
  if (*(float *)&v11 > 1.0)
    *(float *)&v11 = 1.0;
  v13 = -[GCDeviceAdaptiveTriggersPayload initWeaponWithStartPosition:endPosition:resistiveStrength:](v9, "initWeaponWithStartPosition:endPosition:resistiveStrength:", v12, v10, v11);
  -[GCDualSenseAdaptiveTrigger sendAdaptiveTriggerPayload:](self, "sendAdaptiveTriggerPayload:", v13);

}

- (void)setModeFeedbackWithResistiveStrengths:(GCDualSenseAdaptiveTriggerPositionalResistiveStrengths *)positionalResistiveStrengths
{
  float32x4_t v10;
  id v11;
  int8x16_t v12;
  int8x16_t v13;
  _OWORD v14[2];
  int8x8_t v15;

  _Q1 = vmaxnmq_f32(*(float32x4_t *)positionalResistiveStrengths->values, (float32x4_t)0);
  __asm { FMOV            V3.4S, #1.0 }
  v13 = vbslq_s8((int8x16_t)vcgtq_f32(_Q1, _Q3), (int8x16_t)_Q3, (int8x16_t)_Q1);
  v10 = vmaxnmq_f32(*(float32x4_t *)&positionalResistiveStrengths->values[4], (float32x4_t)0);
  v12 = vbslq_s8((int8x16_t)vcgtq_f32(v10, _Q3), (int8x16_t)_Q3, (int8x16_t)v10);
  *(float32x2_t *)v10.f32 = vmaxnm_f32(*(float32x2_t *)&positionalResistiveStrengths->values[8], 0);
  __asm { FMOV            V1.2S, #1.0 }
  v14[0] = v13;
  v14[1] = v12;
  v15 = vbsl_s8((int8x8_t)vcgt_f32(*(float32x2_t *)v10.f32, *(float32x2_t *)_Q1.f32), *(int8x8_t *)_Q1.f32, *(int8x8_t *)v10.f32);
  v11 = -[GCDeviceAdaptiveTriggersPayload initFeedbackWithResistiveStrengths:]([GCDeviceAdaptiveTriggersPayload alloc], "initFeedbackWithResistiveStrengths:", v14);
  -[GCDualSenseAdaptiveTrigger sendAdaptiveTriggerPayload:](self, "sendAdaptiveTriggerPayload:", v11);

}

- (void)setModeVibrationWithStartPosition:(float)startPosition amplitude:(float)amplitude frequency:(float)frequency
{
  GCDeviceAdaptiveTriggersPayload *v9;
  double v10;
  double v11;
  double v12;
  id v13;

  v9 = [GCDeviceAdaptiveTriggersPayload alloc];
  *(float *)&v12 = fmaxf(startPosition, 0.0);
  if (*(float *)&v12 > 1.0)
    *(float *)&v12 = 1.0;
  *(float *)&v10 = fmaxf(amplitude, 0.0);
  if (*(float *)&v10 > 1.0)
    *(float *)&v10 = 1.0;
  *(float *)&v11 = fmaxf(frequency, 0.0);
  if (*(float *)&v11 > 1.0)
    *(float *)&v11 = 1.0;
  v13 = -[GCDeviceAdaptiveTriggersPayload initVibrationWithStartPosition:amplitude:frequency:](v9, "initVibrationWithStartPosition:amplitude:frequency:", v12, v10, v11);
  -[GCDualSenseAdaptiveTrigger sendAdaptiveTriggerPayload:](self, "sendAdaptiveTriggerPayload:", v13);

}

- (void)setModeVibrationWithAmplitudes:(GCDualSenseAdaptiveTriggerPositionalAmplitudes *)positionalAmplitudes frequency:(float)frequency
{
  float32x4_t v12;
  id v13;
  int8x16_t v14;
  int8x16_t v15;
  _OWORD v16[2];
  int8x8_t v17;

  _Q1 = vmaxnmq_f32(*(float32x4_t *)positionalAmplitudes->values, (float32x4_t)0);
  __asm { FMOV            V3.4S, #1.0 }
  v15 = vbslq_s8((int8x16_t)vcgtq_f32(_Q1, _Q3), (int8x16_t)_Q3, (int8x16_t)_Q1);
  v12 = vmaxnmq_f32(*(float32x4_t *)&positionalAmplitudes->values[4], (float32x4_t)0);
  v14 = vbslq_s8((int8x16_t)vcgtq_f32(v12, _Q3), (int8x16_t)_Q3, (int8x16_t)v12);
  *(float32x2_t *)v12.f32 = vmaxnm_f32(*(float32x2_t *)&positionalAmplitudes->values[8], 0);
  __asm { FMOV            V1.2S, #1.0 }
  v16[0] = v15;
  v16[1] = v14;
  v17 = vbsl_s8((int8x8_t)vcgt_f32(*(float32x2_t *)v12.f32, *(float32x2_t *)_Q1.f32), *(int8x8_t *)_Q1.f32, *(int8x8_t *)v12.f32);
  v13 = -[GCDeviceAdaptiveTriggersPayload initVibrationWithAmplitudes:frequency:]([GCDeviceAdaptiveTriggersPayload alloc], "initVibrationWithAmplitudes:frequency:", v16, COERCE_DOUBLE(__PAIR64__(v14.u32[1], LODWORD(frequency))));
  -[GCDualSenseAdaptiveTrigger sendAdaptiveTriggerPayload:](self, "sendAdaptiveTriggerPayload:", v13);

}

- (void)setModeOff
{
  id v3;

  v3 = -[GCDeviceAdaptiveTriggersPayload initOff]([GCDeviceAdaptiveTriggersPayload alloc], "initOff");
  -[GCDualSenseAdaptiveTrigger sendAdaptiveTriggerPayload:](self, "sendAdaptiveTriggerPayload:", v3);

}

- (void)locateControllerManagerApp
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  GCControllerHIDInfo *hidInfo;
  void *v13;
  void *v14;
  char isKindOfClass;
  _GCControllerManagerAppClient *v16;
  NSObject *p_super;
  const char *v18;
  uint8_t v19[16];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  if (!self->_controllerManagerApp)
  {
    -[GCControllerElement device](self, "device");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v20 = 0u;
    v21 = 0u;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
    v22 = 0uLL;
    v23 = 0uLL;
    objc_msgSend(v4, "components");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v21;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v21 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          if (objc_msgSend(v11, "conformsToProtocol:", &unk_254DCA8F0))
          {
            objc_storeStrong((id *)&self->_hidInfo, v11);

            goto LABEL_15;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v8)
          continue;
        break;
      }
    }

LABEL_15:
    hidInfo = self->_hidInfo;
    if (hidInfo
      && (-[GCControllerHIDInfo registryID](hidInfo, "registryID"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          v13,
          v13))
    {
      +[_GCControllerManager sharedInstance](_GCControllerManager, "sharedInstance");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        +[_GCControllerManager sharedInstance](_GCControllerManager, "sharedInstance");
        v16 = (_GCControllerManagerAppClient *)objc_claimAutoreleasedReturnValue();
        p_super = &self->_controllerManagerApp->super.super;
        self->_controllerManagerApp = v16;
        goto LABEL_19;
      }
      if (!gc_isInternalBuild())
        goto LABEL_24;
      getGCLogger();
      p_super = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
        goto LABEL_19;
      *(_WORD *)v19 = 0;
      v18 = "Unable to _controllerManagerApp";
    }
    else
    {
      if (!gc_isInternalBuild())
        goto LABEL_24;
      getGCLogger();
      p_super = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
      {
LABEL_19:

LABEL_24:
        return;
      }
      *(_WORD *)v19 = 0;
      v18 = "Unable to locate _hidInfo || _hidInfo.registryID";
    }
    _os_log_impl(&dword_215181000, p_super, OS_LOG_TYPE_DEFAULT, v18, v19, 2u);
    goto LABEL_19;
  }
}

- (void)locateAdaptiveTriggerComponent
{
  GCAdaptiveTriggers **p_adaptiveTriggers;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSObject *v13;
  uint8_t v14[16];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  p_adaptiveTriggers = &self->_adaptiveTriggers;
  if (!self->_adaptiveTriggers)
  {
    -[GCControllerElement device](self, "device");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v15 = 0u;
    v16 = 0u;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v17 = 0uLL;
    v18 = 0uLL;
    objc_msgSend(v5, "components");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");

    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          if (objc_msgSend(v12, "conformsToProtocol:", &unk_254DD5018))
          {
            objc_storeStrong((id *)p_adaptiveTriggers, v12);
            -[GCDualSenseAdaptiveTrigger observeChangesForAdaptiveTriggers:](self, "observeChangesForAdaptiveTriggers:", *p_adaptiveTriggers);
            goto LABEL_15;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v9)
          continue;
        break;
      }
    }
LABEL_15:

    if (!*p_adaptiveTriggers && gc_isInternalBuild())
    {
      getGCLogger();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_215181000, v13, OS_LOG_TYPE_DEFAULT, "Unable to locate GCAdaptiveTriggers", v14, 2u);
      }

    }
  }
}

- (void)sendAdaptiveTriggerPayload:(id)a3
{
  GCAdaptiveTriggers *adaptiveTriggers;
  void *v5;
  GCAdaptiveTriggers *v6;
  id v7;

  v7 = a3;
  -[GCDualSenseAdaptiveTrigger locateAdaptiveTriggerComponent](self, "locateAdaptiveTriggerComponent");
  adaptiveTriggers = self->_adaptiveTriggers;
  if (adaptiveTriggers)
  {
    if (self->_index)
      -[GCAdaptiveTriggers rightTrigger](adaptiveTriggers, "rightTrigger");
    else
      -[GCAdaptiveTriggers leftTrigger](adaptiveTriggers, "leftTrigger");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isEqual:", v7) & 1) == 0)
    {
      v6 = self->_adaptiveTriggers;
      if (self->_index)
        -[GCAdaptiveTriggers setRightTrigger:](v6, "setRightTrigger:", v7);
      else
        -[GCAdaptiveTriggers setLeftTrigger:](v6, "setLeftTrigger:", v7);
    }

  }
}

- (void)sendAdaptiveTriggerPayloadDict:(id)a3
{
  _GCControllerManagerAppClient *controllerManagerApp;
  void *v5;
  GCAdaptiveTriggers *adaptiveTriggers;
  id v7;
  id v8;

  v8 = a3;
  -[GCDualSenseAdaptiveTrigger locateControllerManagerApp](self, "locateControllerManagerApp");
  controllerManagerApp = self->_controllerManagerApp;
  if (controllerManagerApp)
  {
    -[GCControllerHIDInfo registryID](self->_hidInfo, "registryID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_GCControllerManagerAppClient setProperty:forKey:forHIDServiceClientWithRegistryID:](controllerManagerApp, "setProperty:forKey:forHIDServiceClientWithRegistryID:", v8, CFSTR("AdaptiveTriggerPayload"), v5);

    LODWORD(v5) = self->_index;
    adaptiveTriggers = self->_adaptiveTriggers;
    v7 = -[GCDeviceAdaptiveTriggersPayload initOff]([GCDeviceAdaptiveTriggersPayload alloc], "initOff");
    if ((_DWORD)v5)
      -[GCAdaptiveTriggers setRightTrigger:](adaptiveTriggers, "setRightTrigger:", v7);
    else
      -[GCAdaptiveTriggers setLeftTrigger:](adaptiveTriggers, "setLeftTrigger:", v7);

  }
}

- (void)observeChangesForAdaptiveTriggers:(id)a3
{
  id v4;
  const __CFString *v5;
  id v6;

  v4 = a3;
  if (v4)
  {
    if (self->_index)
      v5 = CFSTR("rightStatus");
    else
      v5 = CFSTR("leftStatus");
    v6 = v4;
    objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, v5, 0, 0);
    v4 = v6;
  }

}

- (void)stopObservingChangesForAdaptiveTriggers:(id)a3
{
  id v4;
  const __CFString *v5;
  id v6;

  v4 = a3;
  if (v4)
  {
    if (self->_index)
      v5 = CFSTR("rightStatus");
    else
      v5 = CFSTR("leftStatus");
    v6 = v4;
    objc_msgSend(v4, "removeObserver:forKeyPath:", self, v5);
    v4 = v6;
  }

}

- (void)updateStatus
{
  int index;
  GCAdaptiveTriggers *adaptiveTriggers;
  void *v5;
  unsigned int v6;
  void *v7;
  float v8;
  double v9;
  void *v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  id v16;

  index = self->_index;
  adaptiveTriggers = self->_adaptiveTriggers;
  if (index)
    -[GCAdaptiveTriggers rightStatus](adaptiveTriggers, "rightStatus");
  else
    -[GCAdaptiveTriggers leftStatus](adaptiveTriggers, "leftStatus");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "mode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntValue");

  if (-[GCDualSenseAdaptiveTrigger mode](self, "mode") != v6)
    -[GCDualSenseAdaptiveTrigger setMode:](self, "setMode:", v6);
  objc_msgSend(v16, "armPosition");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (float)objc_msgSend(v7, "unsignedIntValue") / 9.0;

  -[GCDualSenseAdaptiveTrigger armPosition](self, "armPosition");
  if (v8 != *(float *)&v9)
  {
    *(float *)&v9 = v8;
    -[GCDualSenseAdaptiveTrigger setArmPosition:](self, "setArmPosition:", v9);
  }
  objc_msgSend(v16, "status");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsignedIntValue");

  switch(-[GCDualSenseAdaptiveTrigger mode](self, "mode"))
  {
    case GCDualSenseAdaptiveTriggerModeFeedback:
      v12 = v11 == 1;
      break;
    case GCDualSenseAdaptiveTriggerModeWeapon:
      v13 = 2;
      if (v11 == 2)
        v13 = 4;
      v14 = v11 == 1;
      v15 = 3;
      goto LABEL_20;
    case GCDualSenseAdaptiveTriggerModeVibration:
      if (v11 == 1)
        v12 = 6;
      else
        v12 = 5;
      break;
    case GCDualSenseAdaptiveTriggerModeSlopeFeedback:
      v13 = 7;
      if (v11 == 2)
        v13 = 9;
      v14 = v11 == 1;
      v15 = 8;
LABEL_20:
      if (v14)
        v12 = v15;
      else
        v12 = v13;
      break;
    default:
      v12 = -1;
      break;
  }
  if (v12 != -[GCDualSenseAdaptiveTrigger status](self, "status"))
    -[GCDualSenseAdaptiveTrigger setStatus:](self, "setStatus:", v12);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  void *v11;
  objc_super v12;

  v10 = a3;
  v11 = v10;
  if (self->_adaptiveTriggers == a4)
  {
    if ((objc_msgSend(v10, "isEqualToString:", CFSTR("leftStatus")) & 1) != 0
      || objc_msgSend(v11, "isEqualToString:", CFSTR("rightStatus")))
    {
      -[GCDualSenseAdaptiveTrigger updateStatus](self, "updateStatus");
    }
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)GCDualSenseAdaptiveTrigger;
    -[GCDualSenseAdaptiveTrigger observeValueForKeyPath:ofObject:change:context:](&v12, sel_observeValueForKeyPath_ofObject_change_context_, v10, a4, a5, a6);
  }

}

- (GCDualSenseAdaptiveTriggerMode)mode
{
  return self->_mode;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (GCDualSenseAdaptiveTriggerStatus)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (float)armPosition
{
  return self->_armPosition;
}

- (void)setArmPosition:(float)a3
{
  self->_armPosition = a3;
}

- (int)index
{
  return self->_index;
}

- (void)setIndex:(int)a3
{
  self->_index = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adaptiveTriggers, 0);
  objc_storeStrong((id *)&self->_hidInfo, 0);
  objc_storeStrong((id *)&self->_controllerManagerApp, 0);
}

@end
