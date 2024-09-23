@implementation MFTimezoneCollectionViewCell

+ (NSString)reusableIdentifier
{
  return (NSString *)CFSTR("MFTimezoneCollectionViewCellIdentifier");
}

- (MFTimezoneCollectionViewCell)initWithFrame:(CGRect)a3
{
  MFTimezoneCollectionViewCell *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MFTimezoneCollectionViewCell;
  v3 = -[MFTimezoneCollectionViewCell initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFTimezoneCollectionViewCell contentView](v3, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundColor:", v4);

    -[MFTimezoneCollectionViewCell defaultContentConfiguration](v3, "defaultContentConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _EFLocalizedString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", v7);

    -[MFTimezoneCollectionViewCell setContentConfiguration:](v3, "setContentConfiguration:", v6);
    objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[MFTimezoneHelper cityForTimeZone:](MFTimezoneHelper, "cityForTimeZone:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "displayName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFTimezoneCollectionViewCell setCurrentCityName:](v3, "setCurrentCityName:", v10);

  }
  return v3;
}

- (void)setCurrentCityName:(id)a3
{
  NSString *v5;

  v5 = (NSString *)a3;
  if (self->_currentCityName != v5)
  {
    objc_storeStrong((id *)&self->_currentCityName, a3);
    -[MFTimezoneCollectionViewCell _configureWithCityName:](self, "_configureWithCityName:", v5);
  }

}

- (void)_configureWithCityName:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3578]), "initWithText:", v4);
  v6 = objc_alloc_init(MEMORY[0x1E0DC3568]);
  v8[0] = v6;
  v8[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFTimezoneCollectionViewCell setAccessories:](self, "setAccessories:", v7);

}

- (NSString)currentCityName
{
  return self->_currentCityName;
}

- (UICellAccessoryLabel)timeZoneLabel
{
  return self->_timeZoneLabel;
}

- (void)setTimeZoneLabel:(id)a3
{
  objc_storeStrong((id *)&self->_timeZoneLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeZoneLabel, 0);
  objc_storeStrong((id *)&self->_currentCityName, 0);
}

@end
