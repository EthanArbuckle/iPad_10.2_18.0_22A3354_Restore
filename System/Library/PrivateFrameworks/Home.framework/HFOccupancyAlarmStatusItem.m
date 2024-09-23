@implementation HFOccupancyAlarmStatusItem

+ (id)serviceTypes
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0CB9A98]);
}

- (id)iconDescriptorForRepresentedHomeKitObjects:(id)a3
{
  void *v3;
  HFImageIconDescriptor *v4;

  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:", a3, 24.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HFImageIconDescriptor initWithSystemImageNamed:configuration:]([HFImageIconDescriptor alloc], "initWithSystemImageNamed:configuration:", CFSTR("figure.walk"), v3);

  return v4;
}

- (id)defaultTitleForRepresentedHomeKitObjects:(id)a3
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusTitleOccupancyAlarm"), CFSTR("HFStatusTitleOccupancyAlarm"), 1);
}

- (id)titleStringForTriggeredServices:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  uint64_t v10;
  void *v11;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  objc_msgSend(MEMORY[0x1E0CBA7E0], "hf_roomsForServices:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFStatusItem room](self, "room");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

LABEL_4:
    _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusTitleOccupancyAlarm"), CFSTR("HFStatusTitleOccupancyAlarm"), 1);
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  objc_msgSend(v4, "anyObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFStatusItem home](self, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "roomForEntireHome");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "isEqual:", v8);

  if ((v9 & 1) != 0)
    goto LABEL_4;
  if (objc_msgSend(v4, "count") == 1)
  {
    objc_msgSend(v4, "anyObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  v14 = objc_msgSend(v4, "count");
  HFLocalizedStringWithFormat(CFSTR("HFStatusTitleOccupancyAlarm_Multiple"), CFSTR("%lu"), v15, v16, v17, v18, v19, v20, v14);
  v10 = objc_claimAutoreleasedReturnValue();
LABEL_5:
  v11 = (void *)v10;
LABEL_6:

  return v11;
}

- (id)descriptionStringForTriggeredServices:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;

  v4 = (void *)MEMORY[0x1E0CBA7E0];
  v5 = a3;
  objc_msgSend(v4, "hf_roomsForServices:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "count");

  if (v7)
  {
    -[HFStatusItem room](self, "room");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {

    }
    else
    {
      objc_msgSend(v6, "anyObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFStatusItem home](self, "home");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "roomForEntireHome");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v10, "isEqual:", v12);

      if ((v13 & 1) == 0)
      {
        v9 = CFSTR("HFStatusDescriptionOccupancyAlarm_WithRooms");
        goto LABEL_8;
      }
    }
    v9 = CFSTR("HFStatusDescriptionOccupancyAlarm_Triggered");
  }
  else
  {
    v9 = CFSTR("HFStatusDescriptionOccupancyAlarm_Normal");
  }
LABEL_8:
  _HFLocalizedStringWithDefaultValue(v9, v9, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

@end
