@implementation HMHomeAccessCode

- (HMHomeAccessCode)initWithAccessCodeValue:(id)a3 userInformation:(id)a4
{
  id v6;
  id v7;
  HMHomeAccessCode *v8;
  uint64_t v9;
  HMAccessCodeValue *accessCodeValue;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMHomeAccessCode;
  v8 = -[HMHomeAccessCode init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    accessCodeValue = v8->_accessCodeValue;
    v8->_accessCodeValue = (HMAccessCodeValue *)v9;

    objc_storeStrong((id *)&v8->_userInformation, a4);
  }

  return v8;
}

- (id)createHomeAccessCodeValue
{
  HMHomeAccessCodeValue *v3;
  void *v4;
  void *v5;
  void *v6;
  HMHomeAccessCodeValue *v7;

  v3 = [HMHomeAccessCodeValue alloc];
  -[HMHomeAccessCode accessCodeValue](self, "accessCodeValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMHomeAccessCode userInformation](self, "userInformation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "createAccessCodeUserInformationValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMHomeAccessCodeValue initWithAccessCodeValue:userInformationValue:](v3, "initWithAccessCodeValue:userInformationValue:", v4, v6);

  return v7;
}

- (NSString)shortDescription
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "shortDescription");
}

- (NSArray)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMHomeAccessCode accessCodeValue](self, "accessCodeValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("accessCodeValue"), v4);
  v11[0] = v5;
  v6 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMHomeAccessCode userInformation](self, "userInformation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("userInformation"), v7);
  v11[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v9;
}

- (HMAccessCodeValue)accessCodeValue
{
  return (HMAccessCodeValue *)objc_getProperty(self, a2, 8, 1);
}

- (HMAccessCodeUserInformation)userInformation
{
  return (HMAccessCodeUserInformation *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInformation, 0);
  objc_storeStrong((id *)&self->_accessCodeValue, 0);
}

+ (id)homeAccessCodeWithValue:(id)a3 home:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  HMHomeAccessCode *v9;
  void *v10;
  HMHomeAccessCode *v11;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "userInformationValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMAccessCodeUserInformation userInformationWithValue:home:](HMAccessCodeUserInformation, "userInformationWithValue:home:", v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = [HMHomeAccessCode alloc];
  objc_msgSend(v6, "accessCodeValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[HMHomeAccessCode initWithAccessCodeValue:userInformation:](v9, "initWithAccessCodeValue:userInformation:", v10, v8);
  return v11;
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end
