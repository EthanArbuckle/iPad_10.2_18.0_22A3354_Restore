@implementation CNContactPosterNameComponents

- (CNContactPosterNameComponents)init
{
  CNContactPosterNameComponents *v2;
  CNContactPosterNameComponents *v3;
  NSString *firstNameComponent;
  NSString *secondNameComponent;
  CNContactPosterNameComponents *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CNContactPosterNameComponents;
  v2 = -[CNContactPosterNameComponents init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    firstNameComponent = v2->_firstNameComponent;
    v2->_firstNameComponent = (NSString *)&stru_1E29FF900;

    secondNameComponent = v3->_secondNameComponent;
    v3->_secondNameComponent = 0;

    *(_OWORD *)&v3->_emphasizedNameComponentIndex = xmmword_18FA40AB0;
    v6 = v3;
  }

  return v3;
}

- (id)debugDescription
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("first"), self->_firstNameComponent);
  v5 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("second"), self->_secondNameComponent);
  v6 = (id)objc_msgSend(v3, "appendName:integerValue:", CFSTR("emphasis"), self->_emphasizedNameComponentIndex);
  v7 = (id)objc_msgSend(v3, "appendName:integerValue:", CFSTR("singleNameComponentIndex"), self->_singleNameComponentIndex);
  objc_msgSend(v3, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)firstNameComponent
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setFirstNameComponent:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (NSString)secondNameComponent
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSecondNameComponent:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (int64_t)emphasizedNameComponentIndex
{
  return self->_emphasizedNameComponentIndex;
}

- (void)setEmphasizedNameComponentIndex:(int64_t)a3
{
  self->_emphasizedNameComponentIndex = a3;
}

- (int64_t)singleNameComponentIndex
{
  return self->_singleNameComponentIndex;
}

- (void)setSingleNameComponentIndex:(int64_t)a3
{
  self->_singleNameComponentIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondNameComponent, 0);
  objc_storeStrong((id *)&self->_firstNameComponent, 0);
}

@end
