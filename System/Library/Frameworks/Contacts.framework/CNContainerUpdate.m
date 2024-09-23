@implementation CNContainerUpdate

+ (id)updateWithValue:(id)a3 property:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithProperty:value:", v6, v7);

  return v8;
}

- (CNContainerUpdate)initWithProperty:(id)a3 value:(id)a4
{
  id v7;
  id v8;
  CNContainerUpdate *v9;
  CNContainerUpdate *v10;
  CNContainerUpdate *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNContainerUpdate;
  v9 = -[CNContainerUpdate init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_property, a3);
    objc_storeStrong(&v10->_value, a4);
    v11 = v10;
  }

  return v10;
}

- (NSString)description
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContainerPropertyDescription key](self->_property, "key");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("property"), v4);

  v6 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("value"), self->_value);
  objc_msgSend(v3, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (id)property
{
  return self->_property;
}

- (void)applyToMutableContainer:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CNContainerUpdate property](self, "property");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCNValue:onContainer:", self->_value, v4);

}

- (id)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_property, 0);
}

@end
