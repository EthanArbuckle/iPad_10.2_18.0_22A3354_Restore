@implementation HKNotificationInstruction

- (HKNotificationInstruction)initWithAction:(int64_t)a3 categoryIdentifier:(id)a4 expirationDate:(id)a5
{
  id v8;
  id v9;
  HKNotificationInstruction *v10;
  HKNotificationInstruction *v11;
  uint64_t v12;
  NSString *categoryIdentifier;
  uint64_t v14;
  NSDate *expirationDate;
  objc_super v17;

  v8 = a4;
  v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HKNotificationInstruction;
  v10 = -[HKNotificationInstruction init](&v17, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_action = a3;
    v12 = objc_msgSend(v8, "copy");
    categoryIdentifier = v11->_categoryIdentifier;
    v11->_categoryIdentifier = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    expirationDate = v11->_expirationDate;
    v11->_expirationDate = (NSDate *)v14;

  }
  return v11;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  NSStringFromHKNotificationInstructionAction(self->_action);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%@ cat:%@ expires:%@"), v4, v5, self->_categoryIdentifier, self->_expirationDate);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  HKNotificationInstruction *v4;
  HKNotificationInstruction *v5;
  NSString *categoryIdentifier;
  NSString *v7;
  NSDate *expirationDate;
  NSDate *v9;
  char v10;

  v4 = (HKNotificationInstruction *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (self->_action != v5->_action)
        goto LABEL_12;
      categoryIdentifier = self->_categoryIdentifier;
      v7 = v5->_categoryIdentifier;
      if (categoryIdentifier != v7 && (!v7 || !-[NSString isEqualToString:](categoryIdentifier, "isEqualToString:")))
        goto LABEL_12;
      expirationDate = self->_expirationDate;
      v9 = v5->_expirationDate;
      if (expirationDate == v9)
      {
        v10 = 1;
        goto LABEL_13;
      }
      if (v9)
        v10 = -[NSDate isEqual:](expirationDate, "isEqual:");
      else
LABEL_12:
        v10 = 0;
LABEL_13:

      goto LABEL_14;
    }
    v10 = 0;
  }
LABEL_14:

  return v10;
}

- (unint64_t)hash
{
  int64_t action;
  NSUInteger v4;

  action = self->_action;
  v4 = -[NSString hash](self->_categoryIdentifier, "hash") ^ action;
  return v4 ^ -[NSDate hash](self->_expirationDate, "hash");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKNotificationInstruction)initWithCoder:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  HKNotificationInstruction *v9;
  void *v11;
  void *v12;

  v5 = a3;
  v6 = objc_msgSend(v5, "decodeIntegerForKey:", CFSTR("action"));
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("categoryIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("expirationDate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKNotificationInstruction.m"), 78, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("categoryIdentifier"));

    if (v8)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKNotificationInstruction.m"), 79, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("expirationDate"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  v9 = -[HKNotificationInstruction initWithAction:categoryIdentifier:expirationDate:](self, "initWithAction:categoryIdentifier:expirationDate:", v6, v7, v8);

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t action;
  id v5;

  action = self->_action;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", action, CFSTR("action"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_categoryIdentifier, CFSTR("categoryIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_expirationDate, CFSTR("expirationDate"));

}

- (int64_t)action
{
  return self->_action;
}

- (NSString)categoryIdentifier
{
  return self->_categoryIdentifier;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_categoryIdentifier, 0);
}

@end
