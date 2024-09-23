@implementation HFResidentDeviceItem

- (HFResidentDeviceItem)initWithResidentDevice:(id)a3
{
  id v5;
  HFResidentDeviceItem *v6;
  HFResidentDeviceItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFResidentDeviceItem;
  v6 = -[HFResidentDeviceItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_residentDevice, a3);

  return v7;
}

- (HFResidentDeviceItem)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithResidentDevice_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFResidentDeviceItem.m"), 34, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFResidentDeviceItem init]",
    v5);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc((Class)objc_opt_class());
  -[HFResidentDeviceItem residentDevice](self, "residentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithResidentDevice:", v5);

  objc_msgSend(v6, "copyLatestResultsFromItem:", self);
  return v6;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFResidentDeviceItem residentDevice](self, "residentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hf_prettyDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItem latestResults](self, "latestResults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, \"%@\" %@>"), v5, self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  HFMutableItemUpdateOutcome *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  __CFString *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v14[5];

  v4 = objc_alloc_init(HFMutableItemUpdateOutcome);
  -[HFResidentDeviceItem residentDevice](self, "residentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFResidentDeviceItem residentDevice](self, "residentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isCurrentDevice");

  if ((v8 & 1) != 0)
  {
    v9 = CFSTR("HFResidentDeviceItemCurrentDeviceName");
LABEL_5:
    _HFLocalizedStringWithDefaultValue(v9, v9, 1);
    v10 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v10;
    goto LABEL_6;
  }
  if (!objc_msgSend(v6, "length"))
  {
    v9 = CFSTR("HFResidentDeviceUnknownName");
    goto LABEL_5;
  }
LABEL_6:
  -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v6, CFSTR("title"));
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __52__HFResidentDeviceItem__subclass_updateWithOptions___block_invoke;
  v14[3] = &unk_1EA7273E0;
  v14[4] = self;
  __52__HFResidentDeviceItem__subclass_updateWithOptions___block_invoke((uint64_t)v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v11, CFSTR("description"));

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id __52__HFResidentDeviceItem__subclass_updateWithOptions___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  char v5;
  void *v6;
  char v7;
  __CFString *v8;
  void *v10;
  char v11;
  void *v12;
  char v13;

  objc_msgSend(*(id *)(a1 + 32), "residentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEnabled");

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "residentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "hf_isReachable");

    if ((v5 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "residentDevice");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "status");

      if ((v7 & 1) != 0)
      {
        objc_msgSend(*(id *)(a1 + 32), "residentDevice");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "status");

        if ((v11 & 8) != 0)
        {
          v8 = CFSTR("HFResidentDeviceItemDescriptionLowBattery");
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 32), "residentDevice");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "status");

          if ((v13 & 2) != 0)
            v8 = CFSTR("HFResidentDeviceItemDescriptionConnected");
          else
            v8 = CFSTR("HFResidentDeviceItemDescriptionStandby");
        }
      }
      else
      {
        v8 = CFSTR("HFResidentDeviceItemDescriptionDisconnected");
      }
    }
    else
    {
      v8 = CFSTR("HFResidentDeviceItemDescriptionUnreachable");
    }
  }
  else
  {
    v8 = CFSTR("HFResidentDeviceItemDescriptionDisabled");
  }
  _HFLocalizedStringWithDefaultValue(v8, v8, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (HMResidentDevice)residentDevice
{
  return self->_residentDevice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_residentDevice, 0);
}

@end
