@implementation HFResidentDeviceStatusDetailsItem

- (HFResidentDeviceStatusDetailsItem)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHome_residentDevice_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFResidentDeviceStatusDetailsItem.m"), 18, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFResidentDeviceStatusDetailsItem init]",
    v5);

  return 0;
}

- (HFResidentDeviceStatusDetailsItem)initWithHome:(id)a3 residentDevice:(id)a4
{
  id v7;
  id v8;
  HFResidentDeviceStatusDetailsItem *v9;
  HFResidentDeviceStatusDetailsItem *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HFResidentDeviceStatusDetailsItem;
  v9 = -[HFResidentDeviceStatusDetailsItem init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_home, a3);
    objc_storeStrong((id *)&v10->_residentDevice, a4);
  }

  return v10;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  int v17;
  char v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  int v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  __CFString **v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;

  -[HFResidentDeviceStatusDetailsItem residentDevice](self, "residentDevice", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    -[HFResidentDeviceStatusDetailsItem residentDevice](self, "residentDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "device");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    _HFLocalizedStringWithDefaultValue(CFSTR("HFResidentDeviceUnknownName"), CFSTR("HFResidentDeviceUnknownName"), 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "homeManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hasOptedToHH2");

  -[HFResidentDeviceStatusDetailsItem residentDevice](self, "residentDevice");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12)
  {
    objc_msgSend(v13, "hf_linkedAccessory");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isReachable");

    if ((v16 & 1) != 0)
    {
LABEL_6:
      v17 = 1;
      goto LABEL_9;
    }
  }
  else
  {
    v18 = objc_msgSend(v13, "hf_isReachable");

    if ((v18 & 1) != 0)
      goto LABEL_6;
  }
  -[HFResidentDeviceStatusDetailsItem home](self, "home");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v19, "hf_shouldHideResidentDeviceReachabilityIssues");

LABEL_9:
  -[HFResidentDeviceStatusDetailsItem residentDevice](self, "residentDevice");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "status");

  -[HFResidentDeviceStatusDetailsItem residentDevice](self, "residentDevice");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "isEnabled");

  v24 = (void *)objc_opt_new();
  v25 = v9;
  v32 = v25;
  if (!v17)
  {
    HFLocalizedStringWithFormat(CFSTR("HFStatusDetailsResidentUnreachableFormat"), CFSTR("%@"), v26, v27, v28, v29, v30, v31, (uint64_t)v25);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v37, CFSTR("description"));

    v33 = v32;
    if (v23)
      goto LABEL_14;
LABEL_15:
    v35 = (void *)MEMORY[0x1E0C9AAB0];
    v36 = HFResultHiddenKey;
    v33 = v32;
    goto LABEL_16;
  }
  if ((v21 & 8) == 0)
    goto LABEL_15;
  HFLocalizedStringWithFormat(CFSTR("HFStatusDetailsResidentLowBatteryTitle"), CFSTR("%@"), v26, v27, v28, v29, v30, v31, (uint64_t)v25);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDetailsResidentLowBatteryDescription"), CFSTR("HFStatusDetailsResidentLowBatteryDescription"), 1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setObject:forKeyedSubscript:", v34, CFSTR("description"));

  if ((v23 & 1) != 0)
  {
LABEL_14:
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v33, CFSTR("title"));
    v35 = &unk_1EA7CC4F0;
    v36 = HFResultDisplayPriorityKey;
    goto LABEL_16;
  }
  v35 = (void *)MEMORY[0x1E0C9AAB0];
  v36 = HFResultHiddenKey;
LABEL_16:
  objc_msgSend(v24, "setObject:forKeyedSubscript:", v35, *v36);
  v38 = (void *)MEMORY[0x1E0D519C0];
  +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v24);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "futureWithResult:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  return v40;
}

- (HMHome)home
{
  return self->_home;
}

- (HMResidentDevice)residentDevice
{
  return self->_residentDevice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_residentDevice, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
