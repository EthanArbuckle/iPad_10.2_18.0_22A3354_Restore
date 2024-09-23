@implementation CSLockScreenChargingSettings

- (void)setDefaultValues
{
  -[CSLockScreenChargingSettings setAccessoryAnimationDelayInMilliseconds:](self, "setAccessoryAnimationDelayInMilliseconds:", 600.0);
  -[CSLockScreenChargingSettings setOmniAccessoryAnimationDelayInMilliseconds:](self, "setOmniAccessoryAnimationDelayInMilliseconds:", 0.0);
  -[CSLockScreenChargingSettings setAccessoryAnimationBlockingDurationAfterBootInSeconds:](self, "setAccessoryAnimationBlockingDurationAfterBootInSeconds:", 10.0);
  -[CSLockScreenChargingSettings setWirelessChargingDebounceDurationInSeconds:](self, "setWirelessChargingDebounceDurationInSeconds:", 8.0);
  -[CSLockScreenChargingSettings setWirelessChargingFirmwareUpdateDebounceDurationInSeconds:](self, "setWirelessChargingFirmwareUpdateDebounceDurationInSeconds:", 80.0);
  -[CSLockScreenChargingSettings setShowWirelessAndAccessoryAnimations:](self, "setShowWirelessAndAccessoryAnimations:", 0);
  -[CSLockScreenChargingSettings setWarnForIdleDim:](self, "setWarnForIdleDim:", 1);
  -[CSLockScreenChargingSettings setShouldUseBrightnessFloor:](self, "setShouldUseBrightnessFloor:", 0);
  -[CSLockScreenChargingSettings setBrightnessFloor:](self, "setBrightnessFloor:", 140.0);
  -[CSLockScreenChargingSettings setWirelessChargingAnimationType:](self, "setWirelessChargingAnimationType:", 1);
  -[CSLockScreenChargingSettings setWiredChargingAnimationType:](self, "setWiredChargingAnimationType:", 0);
  -[CSLockScreenChargingSettings setShouldFakeA149Attach:](self, "setShouldFakeA149Attach:", 0);
  -[CSLockScreenChargingSettings setUseWhimsicalDesign:](self, "setUseWhimsicalDesign:", 0);
  -[CSLockScreenChargingSettings setShouldShowMaskForAuxiliaryBattery:](self, "setShouldShowMaskForAuxiliaryBattery:", 1);
  -[CSLockScreenChargingSettings setAuxiliaryBoltHeight:](self, "setAuxiliaryBoltHeight:", 15.0);
  -[CSLockScreenChargingSettings setAuxiliaryBoltMaskHeightDifference:](self, "setAuxiliaryBoltMaskHeightDifference:", 9.0);
}

+ (id)settingsControllerModule
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  _QWORD v42[2];
  _QWORD v43[5];
  _QWORD v44[13];

  v44[11] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Accessory Animation Delay (ms)"), CFSTR("accessoryAnimationDelayInMilliseconds"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "between:and:", 0.0, 3000.0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v41, "setStaticTitle:", CFSTR("Accessory Animation Delay (ms)"));
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Faked Animation Delay (ms)"), CFSTR("omniAccessoryAnimationDelayInMilliseconds"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "between:and:", 0.0, 5000.0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Accessory Animation Blocking Duration After Boot (s)"), CFSTR("accessoryAnimationBlockingDurationAfterBootInSeconds"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "between:and:", 0.0, 20.0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Debounce Duration (s)"), CFSTR("wirelessChargingDebounceDurationInSeconds"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "between:and:", 0.0, 20.0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Firmware Update Debounce Duration (s)"), CFSTR("wirelessChargingFirmwareUpdateDebounceDurationInSeconds"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "between:and:", 0.0, 200.0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Warn for idle dim"), CFSTR("warnForIdleDim"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Should Use Floor"), CFSTR("shouldUseBrightnessFloor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Brightness Floor"), CFSTR("brightnessFloor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "between:and:", 0.0, 200.0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Show Wireless/Accessory Animations"), CFSTR("showWirelessAndAccessoryAnimations"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("showWirelessAndAccessoryAnimations == YES"));
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Wireless Charging Animation"), CFSTR("wirelessChargingAnimationType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "possibleValues:titles:", &unk_1E8E892B0, &unk_1E8E892C8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)v8;
  objc_msgSend(v10, "condition:", v8);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Wired Charging Animation"), CFSTR("wiredChargingAnimationType"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "possibleValues:titles:", &unk_1E8E892E0, &unk_1E8E892F8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "condition:", v8);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0D83078];
  v44[0] = v41;
  v44[1] = v40;
  v44[2] = v39;
  v44[3] = v38;
  v44[4] = v37;
  v44[5] = v35;
  v44[6] = v34;
  v44[7] = v33;
  v44[8] = v32;
  v44[9] = v31;
  v44[10] = v30;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sectionWithRows:", v14);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Fake A149 on B390"), CFSTR("shouldFakeA149Attach"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Use new HI design for A149"), CFSTR("useWhimsicalDesign"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Show Auxiliary Mask"), CFSTR("shouldShowMaskForAuxiliaryBattery"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Auxiliary Bolt Height"), CFSTR("auxiliaryBoltHeight"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "between:and:", 6.0, 30.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Bolt Mask Height Difference"), CFSTR("auxiliaryBoltMaskHeightDifference"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "between:and:", 0.0, 20.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (void *)MEMORY[0x1E0D83078];
  v43[0] = v15;
  v43[1] = v16;
  v43[2] = v17;
  v43[3] = v19;
  v43[4] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 5);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "sectionWithRows:title:", v23, CFSTR("A149 Settings"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = (void *)MEMORY[0x1E0D83078];
  v42[0] = v29;
  v42[1] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "moduleWithTitle:contents:", CFSTR("Charging Animation Settings"), v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

- (int64_t)accessoryTypeForAnimationType:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) > 3)
    return 0;
  else
    return qword_1D048E660[a3 - 2];
}

- (double)accessoryAnimationDelayInMilliseconds
{
  return self->_accessoryAnimationDelayInMilliseconds;
}

- (void)setAccessoryAnimationDelayInMilliseconds:(double)a3
{
  self->_accessoryAnimationDelayInMilliseconds = a3;
}

- (double)omniAccessoryAnimationDelayInMilliseconds
{
  return self->_omniAccessoryAnimationDelayInMilliseconds;
}

- (void)setOmniAccessoryAnimationDelayInMilliseconds:(double)a3
{
  self->_omniAccessoryAnimationDelayInMilliseconds = a3;
}

- (double)accessoryAnimationBlockingDurationAfterBootInSeconds
{
  return self->_accessoryAnimationBlockingDurationAfterBootInSeconds;
}

- (void)setAccessoryAnimationBlockingDurationAfterBootInSeconds:(double)a3
{
  self->_accessoryAnimationBlockingDurationAfterBootInSeconds = a3;
}

- (double)wirelessChargingDebounceDurationInSeconds
{
  return self->_wirelessChargingDebounceDurationInSeconds;
}

- (void)setWirelessChargingDebounceDurationInSeconds:(double)a3
{
  self->_wirelessChargingDebounceDurationInSeconds = a3;
}

- (double)wirelessChargingFirmwareUpdateDebounceDurationInSeconds
{
  return self->_wirelessChargingFirmwareUpdateDebounceDurationInSeconds;
}

- (void)setWirelessChargingFirmwareUpdateDebounceDurationInSeconds:(double)a3
{
  self->_wirelessChargingFirmwareUpdateDebounceDurationInSeconds = a3;
}

- (BOOL)showWirelessAndAccessoryAnimations
{
  return self->_showWirelessAndAccessoryAnimations;
}

- (void)setShowWirelessAndAccessoryAnimations:(BOOL)a3
{
  self->_showWirelessAndAccessoryAnimations = a3;
}

- (BOOL)warnForIdleDim
{
  return self->_warnForIdleDim;
}

- (void)setWarnForIdleDim:(BOOL)a3
{
  self->_warnForIdleDim = a3;
}

- (BOOL)shouldUseBrightnessFloor
{
  return self->_shouldUseBrightnessFloor;
}

- (void)setShouldUseBrightnessFloor:(BOOL)a3
{
  self->_shouldUseBrightnessFloor = a3;
}

- (double)brightnessFloor
{
  return self->_brightnessFloor;
}

- (void)setBrightnessFloor:(double)a3
{
  self->_brightnessFloor = a3;
}

- (int64_t)wirelessChargingAnimationType
{
  return self->_wirelessChargingAnimationType;
}

- (void)setWirelessChargingAnimationType:(int64_t)a3
{
  self->_wirelessChargingAnimationType = a3;
}

- (int64_t)wiredChargingAnimationType
{
  return self->_wiredChargingAnimationType;
}

- (void)setWiredChargingAnimationType:(int64_t)a3
{
  self->_wiredChargingAnimationType = a3;
}

- (BOOL)shouldFakeA149Attach
{
  return self->_shouldFakeA149Attach;
}

- (void)setShouldFakeA149Attach:(BOOL)a3
{
  self->_shouldFakeA149Attach = a3;
}

- (BOOL)useWhimsicalDesign
{
  return self->_useWhimsicalDesign;
}

- (void)setUseWhimsicalDesign:(BOOL)a3
{
  self->_useWhimsicalDesign = a3;
}

- (BOOL)shouldShowMaskForAuxiliaryBattery
{
  return self->_shouldShowMaskForAuxiliaryBattery;
}

- (void)setShouldShowMaskForAuxiliaryBattery:(BOOL)a3
{
  self->_shouldShowMaskForAuxiliaryBattery = a3;
}

- (double)auxiliaryBoltHeight
{
  return self->_auxiliaryBoltHeight;
}

- (void)setAuxiliaryBoltHeight:(double)a3
{
  self->_auxiliaryBoltHeight = a3;
}

- (double)auxiliaryBoltMaskHeightDifference
{
  return self->_auxiliaryBoltMaskHeightDifference;
}

- (void)setAuxiliaryBoltMaskHeightDifference:(double)a3
{
  self->_auxiliaryBoltMaskHeightDifference = a3;
}

@end
