@implementation CPContactMessageButton

- (CPContactMessageButton)initWithPhoneOrEmail:(NSString *)phoneOrEmail
{
  NSString *v5;
  CPContactMessageButton *v6;
  CPContactMessageButton *v7;
  objc_super v9;

  v5 = phoneOrEmail;
  v9.receiver = self;
  v9.super_class = (Class)CPContactMessageButton;
  v6 = -[CPButton initWithImage:handler:](&v9, sel_initWithImage_handler_, 0, 0);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_phoneOrEmail, phoneOrEmail);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPContactMessageButton)initWithCoder:(id)a3
{
  id v4;
  CPContactMessageButton *v5;
  uint64_t v6;
  NSString *phoneOrEmail;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CPContactMessageButton;
  v5 = -[CPButton initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CPContactPhoneOrEmailKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    phoneOrEmail = v5->_phoneOrEmail;
    v5->_phoneOrEmail = (NSString *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CPContactMessageButton;
  v4 = a3;
  -[CPButton encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[CPContactMessageButton phoneOrEmail](self, "phoneOrEmail", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("CPContactPhoneOrEmailKey"));

}

- (NSString)phoneOrEmail
{
  return self->_phoneOrEmail;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phoneOrEmail, 0);
}

@end
