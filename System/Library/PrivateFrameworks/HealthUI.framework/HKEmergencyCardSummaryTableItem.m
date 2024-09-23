@implementation HKEmergencyCardSummaryTableItem

- (id)initInEditMode:(BOOL)a3
{
  _BOOL8 v3;
  void *v7;
  objc_super v8;

  v3 = a3;
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKEmergencyCardSummaryTableItem.m"), 18, CFSTR("HKEmergencyCardSummaryTableItem does not support edit mode"));

  }
  v8.receiver = self;
  v8.super_class = (Class)HKEmergencyCardSummaryTableItem;
  return -[HKEmergencyCardTableItem initInEditMode:](&v8, sel_initInEditMode_, v3);
}

- (void)localeDidChange:(id)a3
{
  -[HKMedicalIDPersonSummaryCell localeDidChange:](self->_cell, "localeDidChange:", a3);
}

- (void)timeZoneDidChange:(id)a3
{
  -[HKMedicalIDPersonSummaryCell timeZoneDidChange:](self->_cell, "timeZoneDidChange:", a3);
}

- (BOOL)hasPresentableData
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;

  -[HKEmergencyCardTableItem data](self, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pictureData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = 1;
  }
  else
  {
    -[HKEmergencyCardTableItem data](self, "data");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v5 = 1;
    }
    else
    {
      -[HKEmergencyCardTableItem data](self, "data");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "gregorianBirthday");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v5 = 1;
      }
      else
      {
        -[HKEmergencyCardTableItem data](self, "data");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "height");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          v5 = 1;
        }
        else
        {
          -[HKEmergencyCardTableItem data](self, "data");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "weight");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            v5 = 1;
          }
          else
          {
            -[HKEmergencyCardTableItem data](self, "data");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v16, "bloodType"))
            {
              v5 = 1;
            }
            else
            {
              -[HKEmergencyCardTableItem data](self, "data");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "isOrganDonor");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v5 = v13 != 0;

            }
          }

        }
      }

    }
  }

  return v5;
}

- (id)_cell
{
  HKMedicalIDPersonSummaryCell *cell;
  HKMedicalIDPersonSummaryCell *v4;
  HKMedicalIDPersonSummaryCell *v5;

  cell = self->_cell;
  if (!cell)
  {
    v4 = objc_alloc_init(HKMedicalIDPersonSummaryCell);
    v5 = self->_cell;
    self->_cell = v4;

    -[HKMedicalIDPersonSummaryCell setAccessoryType:](self->_cell, "setAccessoryType:", -[HKEmergencyCardTableItem isInEditMode](self, "isInEditMode"));
    cell = self->_cell;
  }
  return cell;
}

- (void)setData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)HKEmergencyCardSummaryTableItem;
  v4 = a3;
  -[HKEmergencyCardTableItem setData:](&v13, sel_setData_, v4);
  -[HKEmergencyCardSummaryTableItem _cell](self, "_cell", v13.receiver, v13.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(v4, "pictureData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageWithData:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPicture:", v8);

  objc_msgSend(v4, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setName:", v9);

  objc_msgSend(v4, "gregorianBirthday");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setGregorianBirthday:", v10);

  objc_msgSend(v4, "isOrganDonor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setOrganDonationStatus:", v11);

  objc_msgSend(v5, "setShareOnLockScreen:", objc_msgSend(v4, "isDisabled") ^ 1);
  v12 = objc_msgSend(v4, "shareDuringEmergency");

  objc_msgSend(v5, "setShareDuringEmergencyCalls:", v12);
  objc_msgSend(v5, "updateSubviewsFromData");

}

- (UIEdgeInsets)separatorInset
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 999.0;
  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v2;
  result.top = v3;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cell, 0);
}

@end
