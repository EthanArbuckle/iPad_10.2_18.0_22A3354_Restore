@implementation WFGetDeviceDetailsAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[5];
  _QWORD v26[5];
  id v27;

  -[WFGetDeviceDetailsAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFDeviceDetail"), objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("Device Model")))
  {
    objc_msgSend(MEMORY[0x24BEC1440], "currentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedModel");
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_12:
    v11 = (void *)v6;

    if (v11)
    {
      -[WFGetDeviceDetailsAction output](self, "output");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x24BE19450];
      v14 = (void *)MEMORY[0x24BE19428];
      -[WFGetDeviceDetailsAction appDescriptor](self, "appDescriptor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "attributionSetWithAppDescriptor:disclosureLevel:", v15, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "itemWithObject:attributionSet:", v11, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addItem:", v17);

    }
    v18 = 0;
    goto LABEL_15;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("Device Name")))
  {
    objc_msgSend(MEMORY[0x24BEC1440], "currentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("Device Hostname")))
  {
    objc_msgSend(MEMORY[0x24BEC1440], "currentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hostname");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("Screen Width")))
  {
    v7 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BEC1440], "currentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "screenBounds");
    v9 = v8;
LABEL_11:
    objc_msgSend(v7, "numberWithDouble:", v9);
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("Screen Height")))
  {
    v7 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BEC1440], "currentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "screenBounds");
    v9 = v10;
    goto LABEL_11;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("Device Is Watch")))
  {
    v19 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BEC1440], "currentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "numberWithBool:", objc_msgSend(v5, "idiom") == 3);
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  if (!objc_msgSend(v4, "isEqualToString:", CFSTR("Current Volume")))
  {
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("Current Appearance")))
    {
      objc_msgSend(MEMORY[0x24BEC1440], "currentDevice");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = MEMORY[0x24BDAC760];
      v26[1] = 3221225472;
      v26[2] = __55__WFGetDeviceDetailsAction_runAsynchronouslyWithInput___block_invoke;
      v26[3] = &unk_24F8B7478;
      v26[4] = self;
      objc_msgSend(v24, "getAppearanceWithCompletion:", v26);
    }
    else
    {
      if (!objc_msgSend(v4, "isEqualToString:", CFSTR("Current Brightness")))
      {
        if (objc_msgSend(v4, "isEqualToString:", CFSTR("System Version")))
        {
          objc_msgSend(MEMORY[0x24BEC1440], "currentDevice");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "systemVersion");
          v6 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (!objc_msgSend(v4, "isEqualToString:", CFSTR("System Build Number")))
          {
            -[WFGetDeviceDetailsAction finishRunningWithError:](self, "finishRunningWithError:", 0);
            goto LABEL_17;
          }
          objc_msgSend(MEMORY[0x24BEC1440], "currentDevice");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "systemBuildNumber");
          v6 = objc_claimAutoreleasedReturnValue();
        }
        goto LABEL_12;
      }
      objc_msgSend(MEMORY[0x24BEC1440], "currentDevice");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x24BDAC760];
      v25[1] = 3221225472;
      v25[2] = __55__WFGetDeviceDetailsAction_runAsynchronouslyWithInput___block_invoke_2;
      v25[3] = &unk_24F8B74A0;
      v25[4] = self;
      objc_msgSend(v24, "getBrightnessWithCompletion:", v25);
    }

    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x24BEC1440], "currentDevice");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  objc_msgSend(v20, "volumeWithError:", &v27);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v27;

  if (!v21)
  {
    -[WFGetDeviceDetailsAction finishRunningWithError:](self, "finishRunningWithError:", v18);
    goto LABEL_16;
  }
  -[WFGetDeviceDetailsAction output](self, "output");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE19588], "itemWithNumber:maximumFractionDigitsForDisplay:", v21, &unk_24F93B360);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addItem:", v23);

  -[WFGetDeviceDetailsAction finishRunningWithError:](self, "finishRunningWithError:", 0);
  v11 = 0;
LABEL_15:
  -[WFGetDeviceDetailsAction finishRunningWithError:](self, "finishRunningWithError:", v18);

LABEL_16:
LABEL_17:

}

- (id)iconSymbolName
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BEC1440], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "symbolName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)setParameterState:(id)a3 forKey:(id)a4
{
  id v6;
  _BOOL4 v7;
  objc_super v9;

  v6 = a4;
  v9.receiver = self;
  v9.super_class = (Class)WFGetDeviceDetailsAction;
  v7 = -[WFGetDeviceDetailsAction setParameterState:forKey:](&v9, sel_setParameterState_forKey_, a3, v6);
  if (v7 && objc_msgSend(v6, "isEqualToString:", CFSTR("WFDeviceDetail")))
  {
    -[WFGetDeviceDetailsAction nameUpdated](self, "nameUpdated");
    -[WFGetDeviceDetailsAction outputDetailsUpdated](self, "outputDetailsUpdated");
  }

  return v7;
}

- (id)localizedDefaultOutputNameWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  -[WFGetDeviceDetailsAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("WFDeviceDetail"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFGetDeviceDetailsAction parameterForKey:](self, "parameterForKey:", CFSTR("WFDeviceDetail"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedLabelForPossibleState:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)WFGetDeviceDetailsAction;
    -[WFGetDeviceDetailsAction localizedDefaultOutputNameWithContext:](&v12, sel_localizedDefaultOutputNameWithContext_, v4);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  return v10;
}

- (id)outputContentClasses
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t *v7;
  uint64_t v8;
  void *v9;
  objc_super v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  -[WFGetDeviceDetailsAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("WFDeviceDetail"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("Device Model")) & 1) != 0
      || (objc_msgSend(v5, "isEqualToString:", CFSTR("Device Name")) & 1) != 0
      || objc_msgSend(v5, "isEqualToString:", CFSTR("System Version")))
    {
      v15[0] = objc_opt_class();
      v6 = (void *)MEMORY[0x24BDBCE30];
      v7 = v15;
    }
    else if (objc_msgSend(v5, "isEqualToString:", CFSTR("Device Is Watch")))
    {
      v14 = objc_opt_class();
      v6 = (void *)MEMORY[0x24BDBCE30];
      v7 = &v14;
    }
    else if (objc_msgSend(v5, "isEqualToString:", CFSTR("Current Appearance")))
    {
      v13 = objc_opt_class();
      v6 = (void *)MEMORY[0x24BDBCE30];
      v7 = &v13;
    }
    else
    {
      v12 = objc_opt_class();
      v6 = (void *)MEMORY[0x24BDBCE30];
      v7 = &v12;
    }
    objc_msgSend(v6, "arrayWithObjects:count:", v7, 1);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)WFGetDeviceDetailsAction;
    -[WFGetDeviceDetailsAction outputContentClasses](&v11, sel_outputContentClasses);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;

  return v9;
}

void __55__WFGetDeviceDetailsAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;

  v5 = a2;
  v6 = *(void **)(a1 + 32);
  v14 = v5;
  if (v5)
  {
    objc_msgSend(v6, "output");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x24BE19450];
    v9 = (void *)MEMORY[0x24BE19390];
    objc_msgSend(*(id *)(a1 + 32), "appDescriptor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "locationWithAppDescriptor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "itemWithObject:origin:disclosureLevel:", v14, v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addItem:", v12);

    v6 = *(void **)(a1 + 32);
    v13 = 0;
  }
  else
  {
    v13 = a3;
  }
  objc_msgSend(v6, "finishRunningWithError:", v13);

}

void __55__WFGetDeviceDetailsAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (a2)
  {
    objc_msgSend(MEMORY[0x24BE19588], "itemWithNumber:maximumFractionDigitsForDisplay:", a2, &unk_24F93B378);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v3 = (void *)MEMORY[0x24BE19428];
    objc_msgSend(*(id *)(a1 + 32), "appDescriptor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "attributionSetWithAppDescriptor:disclosureLevel:", v4, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAttributionSet:", v5);

    objc_msgSend(*(id *)(a1 + 32), "output");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addItem:", v7);

    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:");
  }
}

@end
