@implementation CSQuickActionSystemControl

- (CSQuickActionSystemControl)initWithControlIdentity:(id)a3 type:(int64_t)a4 position:(int64_t)a5
{
  id v9;
  CSQuickActionSystemControl *v10;
  CSQuickActionSystemControl *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CSQuickActionSystemControl;
  v10 = -[CSQuickActionControl initWithCategory:position:](&v13, sel_initWithCategory_position_, 3, a5);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_controlIdentity, a3);
    v11->_type = a4;
  }

  return v11;
}

- (int64_t)controlType
{
  if ((unint64_t)(self->_type - 1) >= 3)
    return 0;
  else
    return self->_type;
}

- (CHSControlIdentity)controlIdentity
{
  return self->_controlIdentity;
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controlIdentity, 0);
}

@end
