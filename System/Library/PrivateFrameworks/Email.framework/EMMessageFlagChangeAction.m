@implementation EMMessageFlagChangeAction

- (EMMessageFlagChangeAction)initWithMessageListItems:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5 flagChange:(id)a6
{
  id v11;
  EMMessageFlagChangeAction *v12;
  EMMessageFlagChangeAction *v13;
  objc_super v15;

  v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)EMMessageFlagChangeAction;
  v12 = -[EMMessageChangeAction initWithMessageListItems:origin:actor:](&v15, sel_initWithMessageListItems_origin_actor_, a3, a4, a5);
  v13 = v12;
  if (v12)
    objc_storeStrong((id *)&v12->_flagChange, a6);

  return v13;
}

- (EMMessageFlagChangeAction)initWithQuery:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5 flagChange:(id)a6
{
  id v11;
  EMMessageFlagChangeAction *v12;
  EMMessageFlagChangeAction *v13;
  objc_super v15;

  v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)EMMessageFlagChangeAction;
  v12 = -[EMMessageChangeAction initWithQuery:origin:actor:](&v15, sel_initWithQuery_origin_actor_, a3, a4, a5);
  v13 = v12;
  if (v12)
    objc_storeStrong((id *)&v12->_flagChange, a6);

  return v13;
}

- (EMMessageFlagChangeAction)initWithObjectIDs:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5 flagChange:(id)a6
{
  id v11;
  EMMessageFlagChangeAction *v12;
  EMMessageFlagChangeAction *v13;
  objc_super v15;

  v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)EMMessageFlagChangeAction;
  v12 = -[EMMessageChangeAction initWithObjectIDs:origin:actor:](&v15, sel_initWithObjectIDs_origin_actor_, a3, a4, a5);
  v13 = v12;
  if (v12)
    objc_storeStrong((id *)&v12->_flagChange, a6);

  return v13;
}

- (int64_t)signpostType
{
  return 6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EMMessageFlagChangeAction)initWithCoder:(id)a3
{
  id v4;
  EMMessageFlagChangeAction *v5;
  uint64_t v6;
  ECMessageFlagChange *flagChange;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EMMessageFlagChangeAction;
  v5 = -[EMMessageChangeAction initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_flagChange"));
    v6 = objc_claimAutoreleasedReturnValue();
    flagChange = v5->_flagChange;
    v5->_flagChange = (ECMessageFlagChange *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)EMMessageFlagChangeAction;
  -[EMMessageChangeAction encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[EMMessageFlagChangeAction flagChange](self, "flagChange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("EFPropertyKey_flagChange"));

}

- (ECMessageFlagChange)flagChange
{
  return self->_flagChange;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flagChange, 0);
}

@end
