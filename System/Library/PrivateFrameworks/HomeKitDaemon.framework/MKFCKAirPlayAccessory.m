@implementation MKFCKAirPlayAccessory

+ (id)fetchWithLocalModel:(id)a3 context:(id)a4
{
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___MKFCKAirPlayAccessory;
  objc_msgSendSuper2(&v5, sel_fetchWithLocalModel_context_, a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)fetchLocalModelWithContext:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MKFCKAirPlayAccessory;
  -[MKFCKModel fetchLocalModelWithContext:](&v4, sel_fetchLocalModelWithContext_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)importIntoLocalModel:(id)a3 updatedProperties:(id)a4 context:(id)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MKFCKAirPlayAccessory;
  return -[MKFCKAccessory importIntoLocalModel:updatedProperties:context:](&v6, sel_importIntoLocalModel_updatedProperties_context_, a3, a4, a5);
}

- (BOOL)exportFromLocalModel:(id)a3 updatedProperties:(id)a4 context:(id)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MKFCKAirPlayAccessory;
  return -[MKFCKAccessory exportFromLocalModel:updatedProperties:context:](&v6, sel_exportFromLocalModel_updatedProperties_context_, a3, a4, a5);
}

- (BOOL)validateMinimumUserPrivilege:(id *)a3 error:(id *)a4
{
  void *v7;
  MKFCKAirPlayAccessory *v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  BOOL result;
  int v14;
  void *v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (-[MKFCKModel shouldSkipValidationDuringImport](self, "shouldSkipValidationDuringImport")
    || -[NSManagedObject hmd_validateNumber:key:error:](self, "hmd_validateNumber:key:error:", *a3, CFSTR("minimumUserPrivilege"), a4)&& (unint64_t)objc_msgSend(*a3, "integerValue") < 4)
  {
    return 1;
  }
  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *a3;
    v14 = 138543874;
    v15 = v10;
    v16 = 2114;
    v17 = CFSTR("minimumUserPrivilege");
    v18 = 2112;
    v19 = v11;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Invalid value for %{public}@: %@", (uint8_t *)&v14, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  if (!a4)
    return 0;
  objc_msgSend((id)objc_opt_class(), "hmd_errorForInvalidValue:key:", *a3, CFSTR("minimumUserPrivilege"));
  v12 = (id)objc_claimAutoreleasedReturnValue();
  result = 0;
  *a4 = v12;
  return result;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("MKFCKAirPlayAccessory"));
}

@end
