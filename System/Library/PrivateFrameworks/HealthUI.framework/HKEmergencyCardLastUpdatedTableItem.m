@implementation HKEmergencyCardLastUpdatedTableItem

- (id)initInEditMode:(BOOL)a3 editable:(BOOL)a4
{
  _BOOL8 v5;
  id result;
  void *v9;
  objc_super v10;

  v5 = a3;
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKEmergencyCardLastUpdatedTableItem.m"), 29, CFSTR("HKEmergencyCardLastUpdatedTableItem doesn't support edit mode"));

  }
  v10.receiver = self;
  v10.super_class = (Class)HKEmergencyCardLastUpdatedTableItem;
  result = -[HKEmergencyCardTableItem initInEditMode:](&v10, sel_initInEditMode_, v5);
  if (result)
    *((_BYTE *)result + 40) = a4;
  return result;
}

- (BOOL)hasPresentableData
{
  return +[HKOrganDonationConnectionManager hasStoredRegistrant](HKOrganDonationConnectionManager, "hasStoredRegistrant")|| +[HKOrganDonationConnectionManager shouldShowStoreDemoOrganDonation](HKOrganDonationConnectionManager, "shouldShowStoreDemoOrganDonation");
}

- (id)tableView:(id)a3 cellForRowAtIndex:(int64_t)a4
{
  __objc2_class **v4;
  __objc2_class *v5;
  id v6;
  void *v7;
  void *v8;

  v4 = off_1E9C3D128;
  if (a4)
    v4 = off_1E9C3D4F0;
  v5 = *v4;
  v6 = a3;
  -[__objc2_class defaultReuseIdentifier](v5, "defaultReuseIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
