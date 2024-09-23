@implementation HFMotionAlarmStatusItem

+ (id)serviceTypes
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0CB9A90]);
}

- (id)defaultTitleForRepresentedHomeKitObjects:(id)a3
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusTitleMotionAlarm"), CFSTR("HFStatusTitleMotionAlarm"), 1);
}

- (id)titleStringForTriggeredServices:(id)a3
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusTitleMotionAlarm"), CFSTR("HFStatusTitleMotionAlarm"), 1);
}

- (id)descriptionStringForTriggeredServices:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  uint64_t v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CBA7E0], "hf_roomsForServices:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    if (objc_msgSend(v4, "count") != 1 && objc_msgSend(v5, "count") != 1)
    {
      v15 = objc_msgSend(v5, "count");
      HFLocalizedStringWithFormat(CFSTR("HFStatusDescriptionMotionAlarm_Multiple"), CFSTR("%lu"), v16, v17, v18, v19, v20, v21, v15);
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    -[HFStatusItem room](self, "room");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {

    }
    else
    {
      objc_msgSend(v5, "anyObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFStatusItem home](self, "home");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "roomForEntireHome");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v8, "isEqual:", v10);

      if ((v11 & 1) == 0)
      {
        objc_msgSend(v5, "anyObject");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "name");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_11;
      }
    }
    v7 = CFSTR("HFStatusDescriptionMotionAlarm_Triggered");
  }
  else
  {
    v7 = CFSTR("HFStatusDescriptionMotionAlarm_Normal");
  }
  _HFLocalizedStringWithDefaultValue(v7, v7, 1);
  v12 = objc_claimAutoreleasedReturnValue();
LABEL_10:
  v13 = (void *)v12;
LABEL_11:

  return v13;
}

- (id)iconDescriptorForRepresentedHomeKitObjects:(id)a3
{
  void *v3;
  HFImageIconDescriptor *v4;

  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:", a3, 24.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HFImageIconDescriptor initWithSystemImageNamed:configuration:]([HFImageIconDescriptor alloc], "initWithSystemImageNamed:configuration:", CFSTR("square.stack.3d.down.dottedline"), v3);

  return v4;
}

@end
