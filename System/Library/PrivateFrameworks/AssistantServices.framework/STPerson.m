@implementation STPerson

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[STPerson fullName](self, "fullName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STPerson contactHandles](self, "contactHandles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; fullName=%@ contactHandles=%@>"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STPerson;
  v4 = a3;
  -[STSiriModelObject encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_contactHandles, CFSTR("_contactHandles"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_fullName, CFSTR("_fullName"));

}

- (STPerson)initWithCoder:(id)a3
{
  id v4;
  STPerson *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSSet *contactHandles;
  uint64_t v11;
  NSString *fullName;
  objc_super v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)STPerson;
  v5 = -[STSiriModelObject initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("_contactHandles"));
    v9 = objc_claimAutoreleasedReturnValue();
    contactHandles = v5->_contactHandles;
    v5->_contactHandles = (NSSet *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_fullName"));
    v11 = objc_claimAutoreleasedReturnValue();
    fullName = v5->_fullName;
    v5->_fullName = (NSString *)v11;

  }
  return v5;
}

- (NSSet)contactHandles
{
  return self->_contactHandles;
}

- (void)setContactHandles:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)fullName
{
  return self->_fullName;
}

- (void)setFullName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fullName, 0);
  objc_storeStrong((id *)&self->_contactHandles, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
