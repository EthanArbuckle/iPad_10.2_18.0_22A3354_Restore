@implementation WFCellularPlan

- (WFCellularPlan)initWithCTXPCServiceSubscriptionContext:(id)a3 client:(id)a4 planItem:(id)a5
{
  id v9;
  id v10;
  id v11;
  WFCellularPlan *v12;
  WFCellularPlan *v13;
  uint64_t v14;
  NSUUID *subscriptionContextUUID;
  uint64_t v16;
  NSString *phoneNumber;
  id WeakRetained;
  void *v19;
  uint64_t v20;
  NSString *label;
  id v22;
  uint64_t v23;
  NSString *iccid;
  WFCellularPlan *v25;
  objc_super v27;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v27.receiver = self;
  v27.super_class = (Class)WFCellularPlan;
  v12 = -[WFCellularPlan init](&v27, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_ctContext, a3);
    objc_storeStrong((id *)&v13->_client, a4);
    objc_storeWeak((id *)&v13->_planItem, v11);
    objc_msgSend(v9, "uuid");
    v14 = objc_claimAutoreleasedReturnValue();
    subscriptionContextUUID = v13->_subscriptionContextUUID;
    v13->_subscriptionContextUUID = (NSUUID *)v14;

    objc_msgSend(v9, "phoneNumber");
    v16 = objc_claimAutoreleasedReturnValue();
    phoneNumber = v13->_phoneNumber;
    v13->_phoneNumber = (NSString *)v16;

    WeakRetained = objc_loadWeakRetained((id *)&v13->_planItem);
    objc_msgSend(WeakRetained, "userLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "label");
    v20 = objc_claimAutoreleasedReturnValue();
    label = v13->_label;
    v13->_label = (NSString *)v20;

    v22 = objc_loadWeakRetained((id *)&v13->_planItem);
    objc_msgSend(v22, "iccid");
    v23 = objc_claimAutoreleasedReturnValue();
    iccid = v13->_iccid;
    v13->_iccid = (NSString *)v23;

    v25 = v13;
  }

  return v13;
}

- (NSArray)availableRATModes
{
  void *v3;
  CTXPCServiceSubscriptionContext *ctContext;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  -[WFCellularPlan client](self, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  ctContext = self->_ctContext;
  v10 = 0;
  objc_msgSend(v3, "getSupportedDataRates:error:", ctContext, &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v10;

  if (v6)
  {
    getWFActionsLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v12 = "-[WFCellularPlan availableRATModes]";
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_22D353000, v7, OS_LOG_TYPE_ERROR, "%s Failed to enumerate supported data rates with error %@", buf, 0x16u);
    }
    v8 = (void *)MEMORY[0x24BDBD1A8];
  }
  else
  {
    objc_msgSend(v5, "rates");
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject if_flatMap:](v7, "if_flatMap:", &__block_literal_global_18597);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSArray *)v8;
}

- (int64_t)currentRATMode
{
  void *v3;
  CTXPCServiceSubscriptionContext *ctContext;
  uint64_t v5;
  id v6;
  NSObject *v7;
  int64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[WFCellularPlan client](self, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  ctContext = self->_ctContext;
  v13 = 0;
  v5 = objc_msgSend(v3, "getMaxDataRate:error:", ctContext, &v13);
  v6 = v13;

  if (v6)
  {
    getWFActionsLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v15 = "-[WFCellularPlan currentRATMode]";
      v16 = 2112;
      v17 = v6;
      _os_log_impl(&dword_22D353000, v7, OS_LOG_TYPE_ERROR, "%s Failed to getMaxDataRate with error %@", buf, 0x16u);
    }
    v8 = 0;
  }
  else
  {
    +[WFCellularPlansManager dataRateToRadioAccessTechnologyModeMapping](WFCellularPlansManager, "dataRateToRadioAccessTechnologyModeMapping");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v10);
    v7 = objc_claimAutoreleasedReturnValue();

    if ((unint64_t)-[NSObject count](v7, "count") < 2)
    {
      -[NSObject firstObject](v7, "firstObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v11, "integerValue");

    }
    else if (-[WFCellularPlan smartDataModeEnabled](self, "smartDataModeEnabled"))
    {
      v8 = 4;
    }
    else
    {
      v8 = 5;
    }
  }

  return v8;
}

- (void)setCurrentRATMode:(int64_t)a3
{
  void *v5;
  _QWORD v6[6];

  +[WFCellularPlansManager dataRateToRadioAccessTechnologyModeMapping](WFCellularPlansManager, "dataRateToRadioAccessTechnologyModeMapping");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __36__WFCellularPlan_setCurrentRATMode___block_invoke;
  v6[3] = &unk_24F8B4138;
  v6[4] = self;
  v6[5] = a3;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v6);

}

- (BOOL)smartDataModeEnabled
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  NSObject *v9;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[WFCellularPlan client](self, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSmartDataModeSupported:", 0);

  if (!v4)
    return 0;
  objc_msgSend(getCTServiceDescriptorClass_18485(), "descriptorWithSubscriptionContext:", self->_ctContext);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCellularPlan client](self, "client");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v7 = objc_msgSend(v6, "smartDataMode:error:", v5, &v11);
  v8 = v11;

  if (v8)
  {
    getWFActionsLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v13 = "-[WFCellularPlan smartDataModeEnabled]";
      v14 = 2112;
      v15 = v8;
      _os_log_impl(&dword_22D353000, v9, OS_LOG_TYPE_ERROR, "%s Failed to get smartDataMode status with error %@", buf, 0x16u);
    }

  }
  return v7;
}

- (void)setSmartDataModeEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  int v9;
  const char *v10;
  __int16 v11;
  _BOOL4 v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x24BDAC8D0];
  getWFActionsLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v9 = 136315394;
    v10 = "-[WFCellularPlan setSmartDataModeEnabled:]";
    v11 = 1024;
    v12 = v3;
    _os_log_impl(&dword_22D353000, v5, OS_LOG_TYPE_DEBUG, "%s Setting smart data mode to enabled: %d", (uint8_t *)&v9, 0x12u);
  }

  objc_msgSend(getCTServiceDescriptorClass_18485(), "descriptorWithSubscriptionContext:", self->_ctContext);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCellularPlan client](self, "client");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "setSmartDataMode:enable:", v6, v3);

}

- (NSString)carrierName
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_planItem);
  objc_msgSend(WeakRetained, "carrierName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)isActive
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_planItem);
  v3 = objc_msgSend(WeakRetained, "isSelected");

  return v3;
}

- (BOOL)isDefaultVoiceLine
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_planItem);
  v3 = objc_msgSend(WeakRetained, "isDefaultVoice");

  return v3;
}

- (BOOL)isDefaultDataLine
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_planItem);
  v3 = objc_msgSend(WeakRetained, "isActiveDataPlan");

  return v3;
}

- (BOOL)isDataOnlyLine
{
  void *v2;
  char v3;

  -[WFCellularPlan ctContext](self, "ctContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSimDataOnly");

  return v3;
}

- (BOOL)dataRoamingEnabled
{
  void *v3;
  void *v4;
  char v5;
  id v6;
  NSObject *v7;
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[WFCellularPlan client](self, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCellularPlan serviceDescriptor](self, "serviceDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v5 = objc_msgSend(v3, "getInternationalDataAccessSync:error:", v4, &v9);
  v6 = v9;

  if (v6)
  {
    getWFActionsLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "-[WFCellularPlan dataRoamingEnabled]";
      v12 = 2112;
      v13 = v6;
      _os_log_impl(&dword_22D353000, v7, OS_LOG_TYPE_ERROR, "%s Failed to get data roaming status: %@", buf, 0x16u);
    }

  }
  return v5;
}

- (void)setDataRoamingEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x24BDAC8D0];
  -[WFCellularPlan client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCellularPlan serviceDescriptor](self, "serviceDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInternationalDataAccessSync:status:", v6, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    getWFActionsLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = 136315394;
      v10 = "-[WFCellularPlan setDataRoamingEnabled:]";
      v11 = 2112;
      v12 = v7;
      _os_log_impl(&dword_22D353000, v8, OS_LOG_TYPE_ERROR, "%s Failed to set Data Roaming setting: %@", (uint8_t *)&v9, 0x16u);
    }

  }
}

- (NSString)currentRATModeLabel
{
  return (NSString *)-[WFCellularPlan labelForRATMode:](self, "labelForRATMode:", -[WFCellularPlan currentRATMode](self, "currentRATMode"));
}

- (id)labelForRATMode:(int64_t)a3
{
  __CFString *v4;
  void *v5;
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__WFCellularPlan_labelForRATMode___block_invoke;
  block[3] = &unk_24F8BB638;
  block[4] = self;
  if (labelForRATMode__onceToken != -1)
    dispatch_once(&labelForRATMode__onceToken, block);
  switch(a3)
  {
    case 1:
      v4 = CFSTR("2G");
      goto LABEL_13;
    case 2:
      if (labelForRATMode__use4GOver3G == 1)
        goto LABEL_12;
      v4 = CFSTR("3G");
      goto LABEL_13;
    case 3:
      if (labelForRATMode__useLTEOver4G == 1)
        v4 = CFSTR("LTE");
      else
LABEL_12:
        v4 = CFSTR("4G");
      goto LABEL_13;
    case 4:
      v4 = CFSTR("5G Auto");
      goto LABEL_13;
    case 5:
      v4 = CFSTR("5G");
LABEL_13:
      WFLocalizedString(v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      WFLocalizedStringWithKey(CFSTR("Unknown (Cellular data mode)"), CFSTR("Unknown"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
  }
  return v5;
}

- (id)serviceDescriptor
{
  return (id)objc_msgSend(getCTServiceDescriptorClass_18485(), "descriptorWithSubscriptionContext:", self->_ctContext);
}

- (NSUUID)subscriptionContextUUID
{
  return self->_subscriptionContextUUID;
}

- (NSString)iccid
{
  return self->_iccid;
}

- (NSString)label
{
  return self->_label;
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (CTXPCServiceSubscriptionContext)ctContext
{
  return self->_ctContext;
}

- (CoreTelephonyClient)client
{
  return self->_client;
}

- (CTCellularPlanItem)planItem
{
  return (CTCellularPlanItem *)objc_loadWeakRetained((id *)&self->_planItem);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_planItem);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_ctContext, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_iccid, 0);
  objc_storeStrong((id *)&self->_subscriptionContextUUID, 0);
}

void __34__WFCellularPlan_labelForRATMode___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
  v17 = 0;
  objc_msgSend(v2, "context:getCarrierBundleValue:error:", v3, &unk_24F93C468, &v17);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v17;

  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v4;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  if (v5)
  {
    getWFActionsLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[WFCellularPlan labelForRATMode:]_block_invoke";
      v20 = 2112;
      v21 = v5;
      _os_log_impl(&dword_22D353000, v8, OS_LOG_TYPE_ERROR, "%s Failed to get DataIndicatorOverride value: %@", buf, 0x16u);
    }

  }
  labelForRATMode__use4GOver3G = objc_msgSend(v7, "isEqualToString:", CFSTR("4G"));
  objc_msgSend(*(id *)(a1 + 32), "client");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
  v16 = 0;
  objc_msgSend(v9, "context:getCarrierBundleValue:error:", v10, &unk_24F93C480, &v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v16;

  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v11;
    else
      v13 = 0;
  }
  else
  {
    v13 = 0;
  }
  v14 = v13;

  if (v12)
  {
    getWFActionsLogObject();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[WFCellularPlan labelForRATMode:]_block_invoke";
      v20 = 2112;
      v21 = v12;
      _os_log_impl(&dword_22D353000, v15, OS_LOG_TYPE_ERROR, "%s Failed to get DataIndicatorOverrideForLTE value: %@", buf, 0x16u);
    }

  }
  labelForRATMode__useLTEOver4G = objc_msgSend(v14, "isEqualToString:", CFSTR("LTE"));

}

void __36__WFCellularPlan_setCurrentRATMode___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  int v15;
  const char *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = (void *)MEMORY[0x24BDD16E0];
  v9 = *(_QWORD *)(a1 + 40);
  v10 = a3;
  objc_msgSend(v8, "numberWithInteger:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = objc_msgSend(v10, "containsObject:", v11);

  if ((_DWORD)v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "client");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setMaxDataRate:rate:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), objc_msgSend(v7, "integerValue"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      getWFActionsLogObject();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = 136315394;
        v16 = "-[WFCellularPlan setCurrentRATMode:]_block_invoke";
        v17 = 2112;
        v18 = v13;
        _os_log_impl(&dword_22D353000, v14, OS_LOG_TYPE_ERROR, "%s Failed to set RAT with error %@", (uint8_t *)&v15, 0x16u);
      }

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "setSmartDataModeEnabled:", *(_QWORD *)(a1 + 40) == 4);
    }
    *a4 = 1;

  }
}

id __35__WFCellularPlan_availableRATModes__block_invoke(uint64_t a1, void *a2)
{
  return +[WFCellularPlansManager modesFromDataRate:](WFCellularPlansManager, "modesFromDataRate:", objc_msgSend(a2, "integerValue"));
}

@end
