@implementation CNUIAAfamilyMember

- (CNUIAAfamilyMember)initWithCoder:(id)a3
{
  id v4;
  CNUIAAfamilyMember *v5;
  void *v6;
  void *v7;
  void *v8;
  CNUIAAfamilyMember *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNUIAAfamilyMember;
  v5 = -[CNUIAAfamilyMember init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("firstName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNUIAAfamilyMember setFirstName:](v5, "setFirstName:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastName"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNUIAAfamilyMember setLastName:](v5, "setLastName:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appleID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNUIAAfamilyMember setAppleID:](v5, "setAppleID:", v8);

    -[CNUIAAfamilyMember setIsMe:](v5, "setIsMe:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isMe")));
    v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if ((objc_msgSend(v9, "allowsKeyedCoding") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CNUIAAfamilyMember.m"), 56, CFSTR("Keyed coder expected"));

  }
  -[CNUIAAfamilyMember firstName](self, "firstName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v5, CFSTR("firstName"));

  -[CNUIAAfamilyMember lastName](self, "lastName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v6, CFSTR("lastName"));

  -[CNUIAAfamilyMember appleID](self, "appleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v7, CFSTR("appleID"));

  objc_msgSend(v9, "encodeBool:forKey:", -[CNUIAAfamilyMember isMe](self, "isMe"), CFSTR("isMe"));
}

- (NSString)appleID
{
  return self->_appleID;
}

- (void)setAppleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)firstName
{
  return self->_firstName;
}

- (void)setFirstName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)lastName
{
  return self->_lastName;
}

- (void)setLastName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)isMe
{
  return self->_isMe;
}

- (void)setIsMe:(BOOL)a3
{
  self->_isMe = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_appleID, 0);
}

+ (id)cnuiFamilyMemberWithAAFamilyMember:(id)a3
{
  id v3;
  CNUIAAfamilyMember *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = a3;
  v4 = objc_alloc_init(CNUIAAfamilyMember);
  objc_msgSend(v3, "firstName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIAAfamilyMember setFirstName:](v4, "setFirstName:", v5);

  objc_msgSend(v3, "lastName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIAAfamilyMember setLastName:](v4, "setLastName:", v6);

  objc_msgSend(v3, "appleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIAAfamilyMember setAppleID:](v4, "setAppleID:", v7);

  v8 = objc_msgSend(v3, "isMe");
  -[CNUIAAfamilyMember setIsMe:](v4, "setIsMe:", v8);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
