@implementation HKEmergencyCardEmergencyAccessTableItem

- (id)initInEditMode:(BOOL)a3 shouldShowLocked:(BOOL)a4 shouldShareInfo:(BOOL)a5
{
  int v5;
  _BOOL8 v7;
  _BYTE *v8;
  id *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  objc_super v25;
  _QWORD v26[2];
  _QWORD v27[3];

  v5 = a5;
  v7 = a3;
  v27[2] = *MEMORY[0x1E0C80C00];
  v25.receiver = self;
  v25.super_class = (Class)HKEmergencyCardEmergencyAccessTableItem;
  v8 = -[HKEmergencyCardTableItem initInEditMode:](&v25, sel_initInEditMode_);
  v9 = (id *)v8;
  if (!v8)
    return v9;
  v8[112] = a4;
  v8[113] = v5;
  if (v8[112])
  {
    v10 = -[HKEmergencyCardEnabledTableItem initInEditMode:]([HKEmergencyCardEnabledTableItem alloc], "initInEditMode:", v7);
    v11 = v9[11];
    v9[11] = v10;

    objc_msgSend(v9[11], "setIsSecondaryProfile:", objc_msgSend(v9, "isSecondaryProfile"));
    v12 = -[HKEmergencyCardFooterTableItem initInEditMode:]([HKEmergencyCardFooterTableItem alloc], "initInEditMode:", v7);
    v13 = v9[12];
    v9[12] = v12;

    v5 = *((unsigned __int8 *)v9 + 113);
  }
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "supportsEED"))
    {

LABEL_8:
      v17 = -[HKEmergencyCardShareInfoTableItem initInEditMode:]([HKEmergencyCardShareInfoTableItem alloc], "initInEditMode:", v7);
      v18 = v9[10];
      v9[10] = v17;

      v19 = -[HKEmergencyCardFooterTableItem initInEditMode:]([HKEmergencyCardFooterTableItem alloc], "initInEditMode:", v7);
      v20 = v9[13];
      v9[13] = v19;

      objc_msgSend(v9[10], "setIsSecondaryProfile:", objc_msgSend(v9, "isSecondaryProfile"));
      goto LABEL_9;
    }
    objc_msgSend(v9, "data");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "shareDuringEmergency");

    if (v16)
      goto LABEL_8;
  }
LABEL_9:
  v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v9[11])
  {
    v27[0] = v9[11];
    v27[1] = v9[12];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObjectsFromArray:", v22);

  }
  if (v9[10])
  {
    v26[0] = v9[10];
    v26[1] = v9[13];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObjectsFromArray:", v23);

  }
  objc_msgSend(v9, "setSubitems:", v21);

  return v9;
}

- (void)setIsSecondaryProfile:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HKEmergencyCardEmergencyAccessTableItem;
  -[HKEmergencyCardTableItem setIsSecondaryProfile:](&v4, sel_setIsSecondaryProfile_, a3);
  -[HKEmergencyCardTableItem setIsSecondaryProfile:](self->_enabledTableItem, "setIsSecondaryProfile:", -[HKEmergencyCardTableItem isSecondaryProfile](self, "isSecondaryProfile"));
  -[HKEmergencyCardTableItem setIsSecondaryProfile:](self->_shareInfoTableItem, "setIsSecondaryProfile:", -[HKEmergencyCardTableItem isSecondaryProfile](self, "isSecondaryProfile"));
}

- (BOOL)hasPresentableData
{
  return 1;
}

- (UIEdgeInsets)separatorInset
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 0.0;
  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (id)tableView:(id)a3 cellForRowAtIndex:(int64_t)a4
{
  id v6;
  void *enabledTableItem;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  switch(a4)
  {
    case 0:
      enabledTableItem = self->_enabledTableItem;
      v8 = v6;
      v9 = 0;
      goto LABEL_6;
    case 1:
      -[HKEmergencyCardFooterTableItem tableView:cellForRowAtIndex:](self->_enabledFooterItem, "tableView:cellForRowAtIndex:", v6, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKEmergencyCardEnabledTableItem footerTextViewString](self->_enabledTableItem, "footerTextViewString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setFooterText:", v11);

      break;
    case 2:
      enabledTableItem = self->_shareInfoTableItem;
      v8 = v6;
      v9 = 2;
LABEL_6:
      objc_msgSend(enabledTableItem, "tableView:cellForRowAtIndex:", v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      -[HKEmergencyCardFooterTableItem tableView:cellForRowAtIndex:](self->_shareInfoFooterItem, "tableView:cellForRowAtIndex:", v6, 3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKEmergencyCardShareInfoTableItem footerTextViewString](self->_shareInfoTableItem, "footerTextViewString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setFooterText:", v12);

      objc_msgSend(v10, "setTextViewDelegate:", self->_shareInfoTableItem);
      break;
    default:
      v10 = 0;
      break;
  }

  return v10;
}

- (double)tableView:(id)a3 heightForRowAtIndex:(int64_t)a4
{
  return *MEMORY[0x1E0DC53D8];
}

- (id)titleForHeader
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("emergency_access"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)showsShowWhenLockedState
{
  return self->_showsShowWhenLockedState;
}

- (void)setShowsShowWhenLockedState:(BOOL)a3
{
  self->_showsShowWhenLockedState = a3;
}

- (BOOL)showsEmergencyAccessState
{
  return self->_showsEmergencyAccessState;
}

- (void)setShowsEmergencyAccessState:(BOOL)a3
{
  self->_showsEmergencyAccessState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareInfoFooterItem, 0);
  objc_storeStrong((id *)&self->_enabledFooterItem, 0);
  objc_storeStrong((id *)&self->_enabledTableItem, 0);
  objc_storeStrong((id *)&self->_shareInfoTableItem, 0);
  objc_storeStrong((id *)&self->_lastDequeuedAddContactCell, 0);
}

@end
