@implementation HUServiceDetailsResetAccessoryItem

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  _HULocalizedStringWithDefaultValue(CFSTR("HUServiceDetailsResetHomePodDeviceButton"), CFSTR("HUServiceDetailsResetHomePodDeviceButton"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0D519C0];
  v5 = (void *)MEMORY[0x1E0D314B8];
  v6 = *MEMORY[0x1E0D30BA0];
  v11[0] = *MEMORY[0x1E0D30D18];
  v11[1] = v6;
  v12[0] = v3;
  v12[1] = CFSTR("AccessoryDetails.ResetHomePodButton");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "outcomeWithResults:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "futureWithResult:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
