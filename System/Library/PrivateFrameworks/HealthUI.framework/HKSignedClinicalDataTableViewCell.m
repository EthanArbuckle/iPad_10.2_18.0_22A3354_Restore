@implementation HKSignedClinicalDataTableViewCell

- (HKSignedClinicalDataTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HKSignedClinicalDataTableViewCell *v4;
  HKSignedClinicalDataTableViewCell *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HKSignedClinicalDataTableViewCell;
  v4 = -[HKObjectPickerTableViewCell initWithStyle:reuseIdentifier:presentationOptions:](&v10, sel_initWithStyle_reuseIdentifier_presentationOptions_, a3, a4, 3);
  v5 = v4;
  if (v4)
  {
    -[HKSignedClinicalDataTableViewCell traitCollection](v4, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "userInterfaceIdiom");

    if (v7 != 6)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKSignedClinicalDataTableViewCell setBackgroundColor:](v5, "setBackgroundColor:", v8);

    }
  }
  return v5;
}

@end
