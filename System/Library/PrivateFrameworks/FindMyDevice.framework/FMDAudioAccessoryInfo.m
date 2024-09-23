@implementation FMDAudioAccessoryInfo

- (FMDAudioAccessoryInfo)initWithSystemSerialNumber:(id)a3 leftSerialNumber:(id)a4 rightSerialNumber:(id)a5
{
  id v8;
  id v9;
  id v10;
  FMDAudioAccessoryInfo *v11;
  FMDAudioAccessoryInfo *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)FMDAudioAccessoryInfo;
  v11 = -[FMDAudioAccessoryInfo init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    -[FMDAudioAccessoryInfo setSystemSerialNumber:](v11, "setSystemSerialNumber:", v8);
    -[FMDAudioAccessoryInfo setLeftSerialNumber:](v12, "setLeftSerialNumber:", v9);
    -[FMDAudioAccessoryInfo setRightSerialNumber:](v12, "setRightSerialNumber:", v10);
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[FMDAudioAccessoryInfo systemSerialNumber](self, "systemSerialNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("systemSerialNumber"));

  -[FMDAudioAccessoryInfo leftSerialNumber](self, "leftSerialNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("leftSerialNumber"));

  -[FMDAudioAccessoryInfo rightSerialNumber](self, "rightSerialNumber");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("rightSerialNumber"));

}

- (FMDAudioAccessoryInfo)initWithCoder:(id)a3
{
  id v4;
  FMDAudioAccessoryInfo *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FMDAudioAccessoryInfo;
  v5 = -[FMDAudioAccessoryInfo init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("systemSerialNumber"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMDAudioAccessoryInfo setSystemSerialNumber:](v5, "setSystemSerialNumber:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("leftSerialNumber"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMDAudioAccessoryInfo setLeftSerialNumber:](v5, "setLeftSerialNumber:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rightSerialNumber"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMDAudioAccessoryInfo setRightSerialNumber:](v5, "setRightSerialNumber:", v8);

  }
  return v5;
}

- (NSString)systemSerialNumber
{
  return self->_systemSerialNumber;
}

- (void)setSystemSerialNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)leftSerialNumber
{
  return self->_leftSerialNumber;
}

- (void)setLeftSerialNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)rightSerialNumber
{
  return self->_rightSerialNumber;
}

- (void)setRightSerialNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightSerialNumber, 0);
  objc_storeStrong((id *)&self->_leftSerialNumber, 0);
  objc_storeStrong((id *)&self->_systemSerialNumber, 0);
}

@end
