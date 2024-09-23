@implementation HKElectrocardiogramMoreHealthItem

- (HKElectrocardiogramMoreHealthItem)initWithView:(id)a3 identifier:(id)a4
{
  id v7;
  id v8;
  HKElectrocardiogramMoreHealthItem *v9;
  HKElectrocardiogramMoreHealthItem *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HKElectrocardiogramMoreHealthItem;
  v9 = -[HKElectrocardiogramMoreHealthItem init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_view, a3);
    objc_storeStrong((id *)&v10->_identifier, a4);
  }

  return v10;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (UIView)view
{
  return self->_view;
}

- (void)setView:(id)a3
{
  objc_storeStrong((id *)&self->_view, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_view, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
