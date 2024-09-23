@implementation HKObjectPickerDetailItem

- (HKObjectPickerDetailItem)initWithPrimaryText:(id)a3 secondaryText:(id)a4
{
  id v6;
  id v7;
  HKObjectPickerDetailItem *v8;
  uint64_t v9;
  NSString *primaryText;
  uint64_t v11;
  NSString *secondaryText;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKObjectPickerDetailItem;
  v8 = -[HKObjectPickerDetailItem init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    primaryText = v8->_primaryText;
    v8->_primaryText = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    secondaryText = v8->_secondaryText;
    v8->_secondaryText = (NSString *)v11;

  }
  return v8;
}

- (NSString)primaryText
{
  return self->_primaryText;
}

- (void)setPrimaryText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)secondaryText
{
  return self->_secondaryText;
}

- (void)setSecondaryText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryText, 0);
  objc_storeStrong((id *)&self->_primaryText, 0);
}

@end
