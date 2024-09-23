@implementation BatteryDrainInputs

- (BOOL)validateAndInitializeParameters:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSSet *v16;
  void *v17;
  NSArray *v18;
  NSArray *accessoryDetectorModelNumbers;
  BOOL v20;
  char v22;

  v22 = 0;
  v4 = a3;
  -[BatteryDrainInputs setDrainAudio:](self, "setDrainAudio:", objc_msgSend(v4, "dk_BOOLFromRequiredKey:failed:", CFSTR("drainAudio"), &v22));
  -[BatteryDrainInputs setDrainDisplay:](self, "setDrainDisplay:", objc_msgSend(v4, "dk_BOOLFromRequiredKey:failed:", CFSTR("drainDisplay"), &v22));
  -[BatteryDrainInputs setDrainCPU:](self, "setDrainCPU:", objc_msgSend(v4, "dk_BOOLFromRequiredKey:failed:", CFSTR("drainCPU"), &v22));
  -[BatteryDrainInputs setDrainGPU:](self, "setDrainGPU:", objc_msgSend(v4, "dk_BOOLFromRequiredKey:failed:", CFSTR("drainGPU"), &v22));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_stringFromKey:maxLength:defaultValue:failed:", CFSTR("audioFilename"), 1024, &stru_100010B88, &v22));
  -[BatteryDrainInputs setAudioFilename:](self, "setAudioFilename:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_numberFromKey:lowerBound:upperBound:defaultValue:failed:", CFSTR("audioVolume"), &off_100010E80, &off_100010E90, &off_100010E90, &v22));
  -[BatteryDrainInputs setAudioVolume:](self, "setAudioVolume:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_numberFromKey:lowerBound:upperBound:defaultValue:failed:", CFSTR("displayBrightness"), &off_100010E80, &off_100010E90, &off_100010E90, &v22));
  -[BatteryDrainInputs setDisplayBrightness:](self, "setDisplayBrightness:", v7);

  -[BatteryDrainInputs setAutoBrightnessOff:](self, "setAutoBrightnessOff:", objc_msgSend(v4, "dk_BOOLFromRequiredKey:failed:", CFSTR("autoBrightnessOff"), &v22));
  -[BatteryDrainInputs setLowPowerModeOff:](self, "setLowPowerModeOff:", objc_msgSend(v4, "dk_BOOLFromRequiredKey:failed:", CFSTR("lowPowerModeOff"), &v22));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_numberFromKey:lowerBound:upperBound:defaultValue:failed:", CFSTR("drainCPUIterationDelay"), &off_100010E08, &off_100010E20, &off_100010E08, &v22));
  -[BatteryDrainInputs setCpuDrainIterationDelay:](self, "setCpuDrainIterationDelay:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_numberFromKey:lowerBound:upperBound:defaultValue:failed:", CFSTR("drainGPUIterationDelay"), &off_100010E08, &off_100010E20, &off_100010E08, &v22));
  -[BatteryDrainInputs setGpuDrainIterationDelay:](self, "setGpuDrainIterationDelay:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_numberFromKey:lowerBound:upperBound:defaultValue:failed:", CFSTR("targetBatteryPercentage"), &off_100010E80, &off_100010EA0, &off_100010E80, &v22));
  -[BatteryDrainInputs setTargetBatteryPercentage:](self, "setTargetBatteryPercentage:", v10);

  -[BatteryDrainInputs setDisableUSBCharging:](self, "setDisableUSBCharging:", objc_msgSend(v4, "dk_BOOLFromKey:defaultValue:failed:", CFSTR("disableUSBCharging"), 0, &v22));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_dictionaryFromRequiredKey:failed:", CFSTR("interruptDetectors"), &v22));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dk_dictionaryFromRequiredKey:failed:", CFSTR("accessory"), &v22));
  self->_accessoryDetectorActive = objc_msgSend(v12, "dk_BOOLFromKey:defaultValue:failed:", CFSTR("active"), 0, &v22);
  if (!v22 && -[BatteryDrainInputs isAccessoryDetectorActive](self, "isAccessoryDetectorActive"))
  {
    v16 = +[NSSet setWithObject:](NSSet, "setWithObject:", objc_opt_class(NSString, v13, v14, v15));
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "dk_arrayFromRequiredKey:types:maxLength:failed:validator:", CFSTR("modelNumbers"), v17, 50, &v22, &stru_100010518));
    accessoryDetectorModelNumbers = self->_accessoryDetectorModelNumbers;
    self->_accessoryDetectorModelNumbers = v18;

  }
  v20 = v22 == 0;

  return v20;
}

- (BOOL)validateAndInitializeSpecifications:(id)a3
{
  void *v4;
  char v6;

  v6 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dk_numberFromKey:lowerBound:upperBound:defaultValue:failed:", CFSTR("drainCPUMatrixLength"), &off_100010E38, &off_100010E50, &off_100010E68, &v6));
  -[BatteryDrainInputs setCpuDrainMatrixLength:](self, "setCpuDrainMatrixLength:", v4);

  return v6 == 0;
}

- (BOOL)drainAudio
{
  return self->_drainAudio;
}

- (void)setDrainAudio:(BOOL)a3
{
  self->_drainAudio = a3;
}

- (BOOL)drainDisplay
{
  return self->_drainDisplay;
}

- (void)setDrainDisplay:(BOOL)a3
{
  self->_drainDisplay = a3;
}

- (BOOL)autoBrightnessOff
{
  return self->_autoBrightnessOff;
}

- (void)setAutoBrightnessOff:(BOOL)a3
{
  self->_autoBrightnessOff = a3;
}

- (BOOL)drainCPU
{
  return self->_drainCPU;
}

- (void)setDrainCPU:(BOOL)a3
{
  self->_drainCPU = a3;
}

- (BOOL)drainGPU
{
  return self->_drainGPU;
}

- (void)setDrainGPU:(BOOL)a3
{
  self->_drainGPU = a3;
}

- (BOOL)lowPowerModeOff
{
  return self->_lowPowerModeOff;
}

- (void)setLowPowerModeOff:(BOOL)a3
{
  self->_lowPowerModeOff = a3;
}

- (BOOL)disableUSBCharging
{
  return self->_disableUSBCharging;
}

- (void)setDisableUSBCharging:(BOOL)a3
{
  self->_disableUSBCharging = a3;
}

- (NSNumber)cpuDrainMatrixLength
{
  return self->_cpuDrainMatrixLength;
}

- (void)setCpuDrainMatrixLength:(id)a3
{
  objc_storeStrong((id *)&self->_cpuDrainMatrixLength, a3);
}

- (NSNumber)cpuDrainIterationDelay
{
  return self->_cpuDrainIterationDelay;
}

- (void)setCpuDrainIterationDelay:(id)a3
{
  objc_storeStrong((id *)&self->_cpuDrainIterationDelay, a3);
}

- (NSNumber)gpuDrainIterationDelay
{
  return self->_gpuDrainIterationDelay;
}

- (void)setGpuDrainIterationDelay:(id)a3
{
  objc_storeStrong((id *)&self->_gpuDrainIterationDelay, a3);
}

- (NSNumber)targetBatteryPercentage
{
  return self->_targetBatteryPercentage;
}

- (void)setTargetBatteryPercentage:(id)a3
{
  objc_storeStrong((id *)&self->_targetBatteryPercentage, a3);
}

- (NSString)audioFilename
{
  return (NSString *)objc_loadWeakRetained((id *)&self->_audioFilename);
}

- (void)setAudioFilename:(id)a3
{
  objc_storeWeak((id *)&self->_audioFilename, a3);
}

- (NSNumber)audioVolume
{
  return (NSNumber *)objc_loadWeakRetained((id *)&self->_audioVolume);
}

- (void)setAudioVolume:(id)a3
{
  objc_storeWeak((id *)&self->_audioVolume, a3);
}

- (NSNumber)displayBrightness
{
  return (NSNumber *)objc_loadWeakRetained((id *)&self->_displayBrightness);
}

- (void)setDisplayBrightness:(id)a3
{
  objc_storeWeak((id *)&self->_displayBrightness, a3);
}

- (NSArray)accessoryDetectorModelNumbers
{
  return self->_accessoryDetectorModelNumbers;
}

- (BOOL)isAccessoryDetectorActive
{
  return self->_accessoryDetectorActive;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryDetectorModelNumbers, 0);
  objc_destroyWeak((id *)&self->_displayBrightness);
  objc_destroyWeak((id *)&self->_audioVolume);
  objc_destroyWeak((id *)&self->_audioFilename);
  objc_storeStrong((id *)&self->_targetBatteryPercentage, 0);
  objc_storeStrong((id *)&self->_gpuDrainIterationDelay, 0);
  objc_storeStrong((id *)&self->_cpuDrainIterationDelay, 0);
  objc_storeStrong((id *)&self->_cpuDrainMatrixLength, 0);
}

@end
