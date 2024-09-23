@implementation HSAccessoryTuple

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HSAccessoryTuple userFriendlyAccessoryLocalizedCapitalizedDescription](self, "userFriendlyAccessoryLocalizedCapitalizedDescription"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[HSSetupContentProvider stringForHSProxCardSetupUIStep:](HSSetupContentProvider, "stringForHSProxCardSetupUIStep:", -[HSAccessoryTuple currentStep](self, "currentStep")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HSAccessoryTuple accessory](self, "accessory"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ <accessoryCategoryOrPrimaryServiceType %@, currentStep %@, accessory %@>"), v5, v6, v7, v8));

  return v9;
}

- (HMAccessory)accessory
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HSAccessoryTuple configuration](self, "configuration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "addedAccessory"));

  return (HMAccessory *)v3;
}

- (void)setAccessory:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[HSAccessoryTuple configuration](self, "configuration"));
  objc_msgSend(v5, "setAddedAccessory:", v4);

}

- (NSString)accessoryCategoryOrPrimaryServiceType
{
  void *v3;
  void *v4;
  void *v5;
  NSString *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSString *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSAccessoryTuple accessory](self, "accessory"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "hf_categoryOrPrimaryServiceType"));
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[HSAccessoryTuple configuration](self, "configuration"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "setupDescription"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "category"));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "categoryType"));
    v11 = (void *)v10;
    v12 = HMAccessoryCategoryTypeOther;
    if (v10)
      v12 = (NSString *)v10;
    v6 = v12;

  }
  return v6;
}

- (NSString)userFriendlyAccessoryLocalizedCapitalizedDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSAccessoryTuple accessory](self, "accessory"));
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "hf_userFriendlyLocalizedCapitalizedDescription"));
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[HSAccessoryTuple accessoryCategoryOrPrimaryServiceType](self, "accessoryCategoryOrPrimaryServiceType"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[HMAccessory hf_userFriendlyLocalizedCapitalizedDescription:](HMAccessory, "hf_userFriendlyLocalizedCapitalizedDescription:", v6));

  }
  return (NSString *)v5;
}

- (NSString)userFriendlyAccessoryLocalizedLowercaseDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSAccessoryTuple accessory](self, "accessory"));
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "hf_userFriendlyLocalizedLowercaseDescription"));
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[HSAccessoryTuple accessoryCategoryOrPrimaryServiceType](self, "accessoryCategoryOrPrimaryServiceType"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[HMAccessory hf_userFriendlyLocalizedLowercaseDescription:](HMAccessory, "hf_userFriendlyLocalizedLowercaseDescription:", v6));

  }
  return (NSString *)v5;
}

- (NSString)titleForAccessory
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSAccessoryTuple userFriendlyAccessoryLocalizedCapitalizedDescription](self, "userFriendlyAccessoryLocalizedCapitalizedDescription"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSAccessoryTuple titleForAccessoryWithDefaultValue:](self, "titleForAccessoryWithDefaultValue:", v3));

  return (NSString *)v4;
}

- (id)titleForAccessoryWithDefaultValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  unsigned int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v33;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSAccessoryTuple configuration](self, "configuration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userGivenAccessoryName"));

  if (!v6)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[HSAccessoryTuple accessory](self, "accessory"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "hf_primaryService"));

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[HSAccessoryTuple accessory](self, "accessory"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "configuredName"));

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "serviceType"));
    v13 = objc_msgSend(v12, "isEqualToString:", HMServiceTypeTelevision);

    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "configuredName"));

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[HSAccessoryTuple configuration](self, "configuration"));
      v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "home"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v16, "roomForEntireHome"));
      v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "name"));

      LOBYTE(v16) = objc_msgSend(v14, "isEqualToString:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[HSAccessoryTuple configuration](self, "configuration"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "roomName"));
      v21 = objc_msgSend(v14, "isEqualToString:", v20);

      if ((v16 & 1) != 0 || v21)
      {
        v8 = v4;
LABEL_21:

        goto LABEL_22;
      }

      if (!v14)
        goto LABEL_7;
    }
    else
    {
      v14 = v11;
      if (!v11)
      {
LABEL_7:
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[HSAccessoryTuple configuration](self, "configuration"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "setupDescription"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "hf_marketingName"));
        v25 = v24;
        if (v24)
        {
          v18 = v24;
        }
        else
        {
          v33 = (void *)objc_claimAutoreleasedReturnValue(-[HSAccessoryTuple configuration](self, "configuration"));
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "setupDescription"));
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "accessoryName"));
          v28 = v27;
          if (v27)
          {
            v18 = v27;
          }
          else
          {
            v29 = (void *)objc_claimAutoreleasedReturnValue(-[HSAccessoryTuple accessory](self, "accessory"));
            v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "name"));

          }
        }

        goto LABEL_17;
      }
    }
    v18 = v14;
LABEL_17:
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[HFUtilities sanitizeAutoGeneratedHomeKitName:](HFUtilities, "sanitizeAutoGeneratedHomeKitName:", v18));
    if (objc_msgSend(v30, "length"))
      v31 = v30;
    else
      v31 = v4;
    v8 = v31;

    goto LABEL_21;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HSAccessoryTuple configuration](self, "configuration"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userGivenAccessoryName"));
LABEL_22:

  return v8;
}

- (id)_moveToNextStep
{
  void *v4;
  int64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  int64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  HSAccessoryTuple *v18;
  uint8_t buf[4];
  void *v20;

  if (-[HSAccessoryTuple isSetupComplete](self, "isSetupComplete"))
    return (id)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", &__kCFBooleanTrue));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSAccessoryTuple stateMachine](self, "stateMachine"));
  v5 = -[HSAccessoryTuple currentStep](self, "currentStep");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HSAccessoryTuple configuration](self, "configuration"));
  -[HSAccessoryTuple setCurrentStep:](self, "setCurrentStep:", objc_msgSend(v4, "stepFollowingStep:withConfiguration:", v5, v6));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[HSSetupContentProvider stringForHSProxCardSetupUIStep:](HSSetupContentProvider, "stringForHSProxCardSetupUIStep:", -[HSAccessoryTuple currentStep](self, "currentStep")));
  v8 = HFLogForCategory(58);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Calculating potential skip of: %@", buf, 0xCu);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HSAccessoryTuple stateMachine](self, "stateMachine"));
  v11 = -[HSAccessoryTuple currentStep](self, "currentStep");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[HSAccessoryTuple configuration](self, "configuration"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "shouldSkipStep:withConfiguration:", v11, v12));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100059034;
  v16[3] = &unk_1000A27D0;
  v17 = v7;
  v18 = self;
  v14 = v7;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "flatMap:", v16));

  return v15;
}

- (BOOL)isSetupComplete
{
  return (id)-[HSAccessoryTuple currentStep](self, "currentStep") == (id)52;
}

- (void)setTitleForAccessory:(id)a3
{
  objc_storeStrong((id *)&self->_titleForAccessory, a3);
}

- (HSSetupStateMachine)stateMachine
{
  return (HSSetupStateMachine *)objc_getProperty(self, a2, 16, 1);
}

- (void)setStateMachine:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (HSSetupStateMachineConfiguration)configuration
{
  return (HSSetupStateMachineConfiguration *)objc_getProperty(self, a2, 24, 1);
}

- (void)setConfiguration:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (int64_t)currentStep
{
  return self->_currentStep;
}

- (void)setCurrentStep:(int64_t)a3
{
  self->_currentStep = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_titleForAccessory, 0);
}

@end
