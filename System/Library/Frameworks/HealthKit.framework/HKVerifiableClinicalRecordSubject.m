@implementation HKVerifiableClinicalRecordSubject

- (HKVerifiableClinicalRecordSubject)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HKVerifiableClinicalRecordSubject)initWithFullName:(id)a3 dateOfBirthComponents:(id)a4
{
  id v6;
  id v7;
  HKVerifiableClinicalRecordSubject *v8;
  uint64_t v9;
  NSString *fullName;
  uint64_t v11;
  NSDateComponents *dateOfBirthComponents;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKVerifiableClinicalRecordSubject;
  v8 = -[HKVerifiableClinicalRecordSubject init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    fullName = v8->_fullName;
    v8->_fullName = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    dateOfBirthComponents = v8->_dateOfBirthComponents;
    v8->_dateOfBirthComponents = (NSDateComponents *)v11;

  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  HKVerifiableClinicalRecordSubject *v6;
  HKVerifiableClinicalRecordSubject *v7;
  NSString *fullName;
  NSString *v9;
  uint64_t v10;
  NSString *v11;
  char v12;
  NSDateComponents *dateOfBirthComponents;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSDateComponents *v18;
  void *v19;

  v6 = (HKVerifiableClinicalRecordSubject *)a3;
  if (self == v6)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v6;
      fullName = self->_fullName;
      -[HKVerifiableClinicalRecordSubject fullName](v7, "fullName");
      v9 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (fullName == v9)
        goto LABEL_9;
      -[HKVerifiableClinicalRecordSubject fullName](v7, "fullName");
      v10 = objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
        v12 = 0;
LABEL_17:

        goto LABEL_18;
      }
      v3 = (void *)v10;
      v11 = self->_fullName;
      -[HKVerifiableClinicalRecordSubject fullName](v7, "fullName");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSString isEqualToString:](v11, "isEqualToString:", v4))
      {
LABEL_9:
        dateOfBirthComponents = self->_dateOfBirthComponents;
        -[HKVerifiableClinicalRecordSubject dateOfBirthComponents](v7, "dateOfBirthComponents");
        v14 = objc_claimAutoreleasedReturnValue();
        if (dateOfBirthComponents == (NSDateComponents *)v14)
        {

          v12 = 1;
        }
        else
        {
          v15 = (void *)v14;
          -[HKVerifiableClinicalRecordSubject dateOfBirthComponents](v7, "dateOfBirthComponents");
          v16 = objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            v17 = (void *)v16;
            v18 = self->_dateOfBirthComponents;
            -[HKVerifiableClinicalRecordSubject dateOfBirthComponents](v7, "dateOfBirthComponents");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = -[NSDateComponents isEqual:](v18, "isEqual:", v19);

          }
          else
          {

            v12 = 0;
          }
        }
        if (fullName == v9)
          goto LABEL_17;
      }
      else
      {
        v12 = 0;
      }

      goto LABEL_17;
    }
    v12 = 0;
  }
LABEL_18:

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_fullName, "hash");
  return -[NSDateComponents hash](self->_dateOfBirthComponents, "hash") ^ v3;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p fullName = %@, dateOfBirthComponents = %@>"), v5, self, self->_fullName, self->_dateOfBirthComponents);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKVerifiableClinicalRecordSubject)initWithCoder:(id)a3
{
  id v4;
  HKVerifiableClinicalRecordSubject *v5;
  uint64_t v6;
  NSString *fullName;
  uint64_t v8;
  NSDateComponents *dateOfBirthComponents;
  HKVerifiableClinicalRecordSubject *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKVerifiableClinicalRecordSubject;
  v5 = -[HKVerifiableClinicalRecordSubject init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FullName"));
    v6 = objc_claimAutoreleasedReturnValue();
    fullName = v5->_fullName;
    v5->_fullName = (NSString *)v6;

    if (!v5->_fullName)
    {
      v10 = 0;
      goto LABEL_6;
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DateOfBirthComponents"));
    v8 = objc_claimAutoreleasedReturnValue();
    dateOfBirthComponents = v5->_dateOfBirthComponents;
    v5->_dateOfBirthComponents = (NSDateComponents *)v8;

  }
  v10 = v5;
LABEL_6:

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *fullName;
  id v5;

  fullName = self->_fullName;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", fullName, CFSTR("FullName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dateOfBirthComponents, CFSTR("DateOfBirthComponents"));

}

- (NSString)fullName
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSDateComponents)dateOfBirthComponents
{
  return (NSDateComponents *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateOfBirthComponents, 0);
  objc_storeStrong((id *)&self->_fullName, 0);
}

@end
