@implementation HFAnalyticsAccessCodeEvent

- (HFAnalyticsAccessCodeEvent)initWithData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  char isKindOfClass;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  HFAnalyticsAccessCodeEvent *v22;
  HFAnalyticsAccessCodeEvent *v23;
  uint64_t v24;
  void *v25;
  __CFString *v26;
  uint64_t v27;
  NSNumber *errorCode;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  unint64_t v36;
  void *v37;
  double v38;
  uint64_t v39;
  id v40;
  void *v41;
  id v42;
  id v44;
  _QWORD v45[4];
  id v46;
  _QWORD v47[4];
  id v48[2];
  id location;
  objc_super v50;

  v4 = a3;
  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("home"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (!v7)
    NSLog(CFSTR("Error: HFAnalyticsDataHomeKey is nil"));
  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("operationType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  if (!v10)
    NSLog(CFSTR("Error: HFAnalyticsAccessCodeOperationTypeKey is nil"));
  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pinCodeItem"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v44 = v12;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pinCodeItem"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    NSLog(CFSTR("Error: HFAnalyticsAccessCodeOperationTypeKey is of type HFPinCode, but type HFPinCodeItem was expected!"));
  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("duringOnboarding"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v16 = v15;
  else
    v16 = 0;
  v17 = v16;

  if (v17)
    v18 = v15;
  else
    v18 = (void *)MEMORY[0x1E0C9AAA0];
  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("error"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v20 = v19;
  else
    v20 = 0;
  v21 = v20;

  v50.receiver = self;
  v50.super_class = (Class)HFAnalyticsAccessCodeEvent;
  v22 = -[HFAnalyticsEvent initWithEventType:](&v50, sel_initWithEventType_, 26);
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_home, v6);
    v23->_operationType = objc_msgSend(v10, "integerValue");
    objc_storeStrong((id *)&v23->_pinCodeItem, v12);
    objc_storeStrong((id *)&v23->_duringOnboarding, v18);
    objc_msgSend(v21, "domain");
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)v24;
    if (v24)
      v26 = (__CFString *)v24;
    else
      v26 = CFSTR("nil");
    objc_storeStrong((id *)&v23->_errorDomain, v26);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v21, "code"));
    v27 = objc_claimAutoreleasedReturnValue();
    errorCode = v23->_errorCode;
    v23->_errorCode = (NSNumber *)v27;

    +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFAnalyticsAccessCodeEvent home](v23, "home");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "pinCodeManagerForHome:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = (void *)MEMORY[0x1E0C99E20];
    objc_msgSend(v7, "users");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setWithArray:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "currentUser");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObject:", v35);

    v36 = objc_msgSend(v34, "count");
    objc_initWeak(&location, v23);
    objc_msgSend(v31, "userPinCodes");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (double)v36;
    v39 = MEMORY[0x1E0C809B0];
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __43__HFAnalyticsAccessCodeEvent_initWithData___block_invoke;
    v47[3] = &unk_1EA737C00;
    objc_copyWeak(v48, &location);
    v48[1] = *(id *)&v38;
    v40 = (id)objc_msgSend(v37, "addSuccessBlock:", v47);

    objc_msgSend(v31, "guestPinCodes");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = v39;
    v45[1] = 3221225472;
    v45[2] = __43__HFAnalyticsAccessCodeEvent_initWithData___block_invoke_2;
    v45[3] = &unk_1EA737C28;
    objc_copyWeak(&v46, &location);
    v42 = (id)objc_msgSend(v41, "addSuccessBlock:", v45);

    objc_destroyWeak(&v46);
    objc_destroyWeak(v48);
    objc_destroyWeak(&location);

  }
  return v23;
}

void __43__HFAnalyticsAccessCodeEvent_initWithData___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  unint64_t v5;
  double v6;
  void *v7;
  id WeakRetained;

  v3 = (id *)(a1 + 32);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v5 = objc_msgSend(v4, "count");

  v6 = (double)v5 / *(double *)(a1 + 40);
  if (v6 > 1.0)
    NSLog(CFSTR("Error: Ratio of users with PIN Codes should never go above 1.0"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setRatioOfUserPINCodes:", v7);

}

void __43__HFAnalyticsAccessCodeEvent_initWithData___block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = objc_msgSend(v3, "count");

  objc_msgSend(v4, "numberWithUnsignedInteger:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setTotalGuestPINCodes:", v6);

}

- (id)payload
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)HFAnalyticsAccessCodeEvent;
  -[HFAnalyticsEvent payload](&v31, sel_payload);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  switch(-[HFAnalyticsAccessCodeEvent operationType](self, "operationType"))
  {
    case 0uLL:
      v5 = CFSTR("add");
      break;
    case 1uLL:
      v5 = CFSTR("remove");
      break;
    case 2uLL:
      v5 = CFSTR("modifyValue");
      break;
    case 3uLL:
      v5 = CFSTR("modifyAccessories");
      break;
    case 4uLL:
      -[HFAnalyticsAccessCodeEvent duringOnboarding](self, "duringOnboarding");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "BOOLValue");

      if ((v7 & 1) == 0)
        NSLog(&CFSTR("Error: duringOnboarding should be YES for the operation type HFAnalyticsAccessCodesOperationTypeAddSkippe"
                     "dDuringOnboarding").isa);
      v5 = CFSTR("skippedOnboarding");
      break;
    case 5uLL:
      v5 = CFSTR("share");
      break;
    default:
      v5 = 0;
      break;
  }
  objc_msgSend(v4, "na_safeSetObject:forKey:", v5, CFSTR("operationType"));
  -[HFAnalyticsAccessCodeEvent duringOnboarding](self, "duringOnboarding");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v8, CFSTR("duringOnboarding"));

  -[HFAnalyticsAccessCodeEvent errorCode](self, "errorCode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v9, CFSTR("errorCode"));

  -[HFAnalyticsAccessCodeEvent errorDomain](self, "errorDomain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v10, CFSTR("errorDomain"));

  -[HFAnalyticsAccessCodeEvent pinCodeItem](self, "pinCodeItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[HFAnalyticsAccessCodeEvent pinCodeItem](self, "pinCodeItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isGuest");
    v14 = CFSTR("user");
    if (v13)
      v14 = CFSTR("guest");
    v15 = v14;

  }
  else
  {
    v15 = CFSTR("none");
  }
  objc_msgSend(v4, "na_safeSetObject:forKey:", v15, CFSTR("userType"));
  v16 = (void *)MEMORY[0x1E0CB37E8];
  -[HFAnalyticsAccessCodeEvent pinCodeItem](self, "pinCodeItem");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "pinCodeValue");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "numberWithUnsignedInteger:", objc_msgSend(v18, "length"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v19, CFSTR("codeLength"));

  -[HFAnalyticsAccessCodeEvent pinCodeItem](self, "pinCodeItem");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "accessories");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (double)(unint64_t)objc_msgSend(v21, "count");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v23, CFSTR("countOfAccessoriesEnabled"));

  -[HFAnalyticsAccessCodeEvent home](self, "home");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "hf_accessoriesSupportingAccessCodes");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (double)(unint64_t)objc_msgSend(v25, "count");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v22 / v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v27, CFSTR("ratioOfAccessoriesEnabled"));

  -[HFAnalyticsAccessCodeEvent totalGuestPINCodes](self, "totalGuestPINCodes");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v28, CFSTR("totalCountGuests"));

  -[HFAnalyticsAccessCodeEvent ratioOfUserPINCodes](self, "ratioOfUserPINCodes");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v29, CFSTR("ratioOfUsersWithPIN"));

  return v4;
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
  objc_storeStrong((id *)&self->_home, a3);
}

- (unint64_t)operationType
{
  return self->_operationType;
}

- (void)setOperationType:(unint64_t)a3
{
  self->_operationType = a3;
}

- (HFPinCodeItem)pinCodeItem
{
  return self->_pinCodeItem;
}

- (void)setPinCodeItem:(id)a3
{
  objc_storeStrong((id *)&self->_pinCodeItem, a3);
}

- (NSNumber)duringOnboarding
{
  return self->_duringOnboarding;
}

- (void)setDuringOnboarding:(id)a3
{
  objc_storeStrong((id *)&self->_duringOnboarding, a3);
}

- (NSNumber)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(id)a3
{
  objc_storeStrong((id *)&self->_errorCode, a3);
}

- (NSString)errorDomain
{
  return self->_errorDomain;
}

- (void)setErrorDomain:(id)a3
{
  objc_storeStrong((id *)&self->_errorDomain, a3);
}

- (NSNumber)totalGuestPINCodes
{
  return self->_totalGuestPINCodes;
}

- (void)setTotalGuestPINCodes:(id)a3
{
  objc_storeStrong((id *)&self->_totalGuestPINCodes, a3);
}

- (NSNumber)ratioOfUserPINCodes
{
  return self->_ratioOfUserPINCodes;
}

- (void)setRatioOfUserPINCodes:(id)a3
{
  objc_storeStrong((id *)&self->_ratioOfUserPINCodes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ratioOfUserPINCodes, 0);
  objc_storeStrong((id *)&self->_totalGuestPINCodes, 0);
  objc_storeStrong((id *)&self->_errorDomain, 0);
  objc_storeStrong((id *)&self->_errorCode, 0);
  objc_storeStrong((id *)&self->_duringOnboarding, 0);
  objc_storeStrong((id *)&self->_pinCodeItem, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
