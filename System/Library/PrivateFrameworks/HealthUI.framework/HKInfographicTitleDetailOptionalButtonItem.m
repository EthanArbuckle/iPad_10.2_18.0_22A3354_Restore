@implementation HKInfographicTitleDetailOptionalButtonItem

- (HKInfographicTitleDetailOptionalButtonItem)initWithTitle:(id)a3 detail:(id)a4 buttonTextString:(id)a5 buttonAction:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  HKInfographicTitleDetailOptionalButtonItem *v15;
  HKInfographicTitleDetailOptionalButtonItem *v16;
  void *v17;
  id buttonAction;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)HKInfographicTitleDetailOptionalButtonItem;
  v15 = -[HKInfographicTitleDetailOptionalButtonItem init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_titleString, a3);
    objc_storeStrong((id *)&v16->_detailString, a4);
    objc_storeStrong((id *)&v16->_buttonTextString, a5);
    v17 = _Block_copy(v14);
    buttonAction = v16->_buttonAction;
    v16->_buttonAction = v17;

  }
  return v16;
}

- (NSString)titleString
{
  return self->_titleString;
}

- (NSString)detailString
{
  return self->_detailString;
}

- (NSString)buttonTextString
{
  return self->_buttonTextString;
}

- (id)buttonAction
{
  return self->_buttonAction;
}

- (NSString)baseIdentifier
{
  return self->_baseIdentifier;
}

- (void)setBaseIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseIdentifier, 0);
  objc_storeStrong(&self->_buttonAction, 0);
  objc_storeStrong((id *)&self->_buttonTextString, 0);
  objc_storeStrong((id *)&self->_detailString, 0);
  objc_storeStrong((id *)&self->_titleString, 0);
}

@end
