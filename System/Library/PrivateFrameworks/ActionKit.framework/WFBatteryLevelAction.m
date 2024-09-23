@implementation WFBatteryLevelAction

- (void)runWithInput:(id)a3 error:(id *)a4
{
  __CFString *v6;
  void *v7;
  void *v8;
  float v9;
  double v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  uint64_t v17;
  NSObject *v18;
  int v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  -[WFBatteryLevelAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("Subject"), objc_opt_class());
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!-[__CFString length](v6, "length"))
  {

    v6 = CFSTR("Battery Level");
  }
  -[objc_class currentDevice](getUIDeviceClass(), "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBatteryMonitoringEnabled:", 1);
  if (!-[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("Battery Level")))
  {
    if (-[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("Is Charging")))
    {
      -[WFBatteryLevelAction output](self, "output");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x24BDD16E0];
      v16 = objc_msgSend(v7, "batteryState") == 2;
    }
    else
    {
      if (!-[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("Is Connected to Charger")))
      {
LABEL_20:
        objc_msgSend(v7, "setBatteryMonitoringEnabled:", 0);
        goto LABEL_21;
      }
      -[WFBatteryLevelAction output](self, "output");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x24BDD16E0];
      if (objc_msgSend(v7, "batteryState") == 2)
      {
        v17 = 1;
LABEL_18:
        objc_msgSend(v15, "numberWithBool:", v17);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v13);
        goto LABEL_19;
      }
      v16 = objc_msgSend(v7, "batteryState") == 3;
    }
    v17 = v16;
    goto LABEL_18;
  }
  v8 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v7, "batteryLevel");
  *(float *)&v10 = v9 * 100.0;
  objc_msgSend(v8, "numberWithFloat:", v10);
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    -[WFBatteryLevelAction output](self, "output");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE19588], "itemWithNumber:maximumFractionDigitsForDisplay:", v12, &unk_24F93B3C0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addItem:", v14);

LABEL_19:
    goto LABEL_20;
  }
  getWFActionsLogObject();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    v19 = 136315138;
    v20 = "-[WFBatteryLevelAction runWithInput:error:]";
    _os_log_impl(&dword_22D353000, v18, OS_LOG_TYPE_ERROR, "%s Failed to get battery level.", (uint8_t *)&v19, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BEC4270], 16, 0);
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_21:

}

- (id)outputContentClasses
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  -[WFBatteryLevelAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("Subject"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("Is Charging")) & 1) != 0
    || objc_msgSend(v4, "isEqualToString:", CFSTR("Is Connected to Charger")))
  {
    v12[0] = objc_opt_class();
    v5 = (void *)MEMORY[0x24BDBCE30];
    v6 = v12;
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("Battery Level")))
    {
      v10.receiver = self;
      v10.super_class = (Class)WFBatteryLevelAction;
      -[WFBatteryLevelAction outputContentClasses](&v10, sel_outputContentClasses);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_5;
    }
    v11 = objc_opt_class();
    v5 = (void *)MEMORY[0x24BDBCE30];
    v6 = &v11;
  }
  objc_msgSend(v5, "arrayWithObjects:count:", v6, 1);
  v7 = objc_claimAutoreleasedReturnValue();
LABEL_5:
  v8 = (void *)v7;

  return v8;
}

@end
