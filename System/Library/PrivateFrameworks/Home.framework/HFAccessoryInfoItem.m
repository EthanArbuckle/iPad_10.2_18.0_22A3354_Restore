@implementation HFAccessoryInfoItem

+ (id)localizedStringForCharacteristic:(id)a3
{
  id v3;
  __CFString *v4;
  __CFString *v5;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB8948]) & 1) != 0)
  {
    v4 = CFSTR("HFAccessoryInfoDetailsManufacturer");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB8950]) & 1) != 0)
  {
    v4 = CFSTR("HFAccessoryInfoDetailsModel");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB8A20]) & 1) != 0)
  {
    v4 = CFSTR("HFAccessoryInfoDetailsSerialNumber");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB88C8]) & 1) != 0)
  {
    v4 = CFSTR("HFAccessoryInfoDetailsFirmwareVersion");
  }
  else
  {
    if (!objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB8A40]))
    {
      v5 = &stru_1EA741FF8;
      goto LABEL_12;
    }
    v4 = CFSTR("HFAccessoryInfoDetailsSoftwareVersion");
  }
  _HFLocalizedStringWithDefaultValue(v4, v4, 1);
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return v5;
}

+ (id)accessibilityStringForCharacteristic:(id)a3
{
  id v3;
  const __CFString *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB8948]) & 1) != 0)
  {
    v4 = CFSTR("AccessoryDetails.Manufacturer");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB8950]) & 1) != 0)
  {
    v4 = CFSTR("AccessoryDetails.Model");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB8A20]) & 1) != 0)
  {
    v4 = CFSTR("AccessoryDetails.SerialNumber");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB88C8]) & 1) != 0)
  {
    v4 = CFSTR("AccessoryDetails.FirmwareVersion");
  }
  else if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB8A40]))
  {
    v4 = CFSTR("AccessoryDetails.SoftwareVersion");
  }
  else
  {
    v4 = &stru_1EA741FF8;
  }

  return (id)v4;
}

- (HFAccessoryInfoItem)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithAccessory_infoType_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFAccessoryInfoItem.m"), 69, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFAccessoryInfoItem init]",
    v5);

  return 0;
}

- (HFAccessoryInfoItem)initWithAccessory:(id)a3 infoType:(unint64_t)a4
{
  return -[HFAccessoryInfoItem initWithAccessory:infoType:home:](self, "initWithAccessory:infoType:home:", a3, a4, 0);
}

- (HFAccessoryInfoItem)initWithAccessory:(id)a3 infoType:(unint64_t)a4 home:(id)a5
{
  id v9;
  id v10;
  HFAccessoryInfoItem *v11;
  HFAccessoryInfoItem *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HFAccessoryInfoItem;
  v11 = -[HFAccessoryInfoItem init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_accessory, a3);
    v12->_infoType = a4;
    objc_storeStrong((id *)&v12->_home, a5);
  }

  return v12;
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
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  HFItemUpdateOutcome *v27;
  void *v28;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0C99E60];
  -[HFAccessoryInfoItem accessory](self, "accessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithObject:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("dependentHomeKitObjects"));

  +[HFAccessoryInfoDetailsItemProvider preferredCharacteristicOrderArray](HFAccessoryInfoDetailsItemProvider, "preferredCharacteristicOrderArray");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "diagnosticInfoManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFAccessoryInfoItem accessory](self, "accessory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "softwareVersionForAccessory:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  switch(-[HFAccessoryInfoItem infoType](self, "infoType"))
  {
    case 0uLL:
      v13 = 0;
      v14 = 0;
      LODWORD(v15) = 1;
      goto LABEL_4;
    case 1uLL:
      -[HFAccessoryInfoItem accessory](self, "accessory");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "firmwareVersion");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = *MEMORY[0x1E0CB88C8];
      v16 = objc_msgSend(v8, "indexOfObject:", *MEMORY[0x1E0CB88C8]);
      +[HFAccessoryInfoItem localizedStringForCharacteristic:](HFAccessoryInfoItem, "localizedStringForCharacteristic:", v18);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFAccessoryInfoItem accessory](self, "accessory");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v19, "hf_isHomePod") & 1) != 0)
      {
        LODWORD(v15) = 1;
        goto LABEL_16;
      }
      -[HFAccessoryInfoItem accessory](self, "accessory");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v15) = objc_msgSend(v20, "hf_isAppleTV");
      goto LABEL_15;
    case 2uLL:
      if (v12)
      {
        objc_msgSend(v12, "localizedDescription");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[HFAccessoryInfoItem accessory](self, "accessory");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "softwareVersion");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "localizedDescription");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v23 = *MEMORY[0x1E0CB8A40];
      v16 = objc_msgSend(v8, "indexOfObject:", *MEMORY[0x1E0CB8A40]);
      +[HFAccessoryInfoItem localizedStringForCharacteristic:](HFAccessoryInfoItem, "localizedStringForCharacteristic:", v23);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFAccessoryInfoItem accessory](self, "accessory");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v19, "hf_isHomePod") & 1) != 0)
      {
        LODWORD(v15) = 0;
      }
      else
      {
        -[HFAccessoryInfoItem accessory](self, "accessory");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v15) = objc_msgSend(v20, "hf_isAppleTV") ^ 1;
LABEL_15:

      }
LABEL_16:

LABEL_17:
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("title"));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("description"));
      if (objc_msgSend(v14, "length"))
        v15 = v15;
      else
        v15 = 1;
      if (_os_feature_enabled_impl())
      {
        -[HFAccessoryInfoItem home](self, "home");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v24, "hf_currentUserIsRestrictedGuest") | v15;

      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v15);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v25, CFSTR("hidden"));

      if (v16 == 0x7FFFFFFFFFFFFFFFLL)
        v16 = objc_msgSend(v8, "count");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v16);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v26, CFSTR("accessoryInfoDetailPreferredOrder"));

      v27 = -[HFItemUpdateOutcome initWithResults:]([HFItemUpdateOutcome alloc], "initWithResults:", v4);
      objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      return v28;
    case 3uLL:
      v16 = objc_msgSend(v8, "indexOfObject:", CFSTR("HFAccessoryInfoTypeNetworkPreferredOrderKey"));
      LODWORD(v15) = 0;
      v13 = 0;
      v14 = 0;
      goto LABEL_17;
    default:
      LODWORD(v15) = 0;
      v13 = 0;
      v14 = 0;
LABEL_4:
      v16 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_17;
  }
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
  objc_storeStrong((id *)&self->_home, a3);
}

- (HMAccessory)accessory
{
  return self->_accessory;
}

- (unint64_t)infoType
{
  return self->_infoType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
