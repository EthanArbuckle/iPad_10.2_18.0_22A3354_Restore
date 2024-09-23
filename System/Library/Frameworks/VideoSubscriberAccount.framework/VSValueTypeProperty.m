@implementation VSValueTypeProperty

- (NSString)name
{
  return self->_name;
}

- (unint64_t)kind
{
  return self->_kind;
}

- (id)initialValue
{
  return self->_initialValue;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_initialValue, 0);
  objc_storeStrong((id *)&self->_allowedClasses, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (id)valueTypePropertyWithName:(id)a3 kind:(unint64_t)a4 allowedClasses:(id)a5 initialValue:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;

  v10 = a6;
  v11 = a5;
  v12 = a3;
  v13 = objc_alloc_init((Class)a1);
  objc_msgSend(v13, "setName:", v12);

  objc_msgSend(v13, "setKind:", a4);
  objc_msgSend(v13, "setAllowedClasses:", v11);

  objc_msgSend(v13, "setInitialValue:", v10);
  return v13;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setKind:(unint64_t)a3
{
  self->_kind = a3;
}

- (void)setInitialValue:(id)a3
{
  objc_storeStrong(&self->_initialValue, a3);
}

- (void)setAllowedClasses:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSSet)allowedClasses
{
  return self->_allowedClasses;
}

@end
