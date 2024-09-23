@implementation EMMessageFollowUpAction

- (EMMessageFollowUpAction)initWithMessageListItems:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5 followUp:(id)a6
{
  id v11;
  EMMessageFollowUpAction *v12;
  EMMessageFollowUpAction *v13;
  objc_super v15;

  v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)EMMessageFollowUpAction;
  v12 = -[EMMessageChangeAction initWithMessageListItems:origin:actor:](&v15, sel_initWithMessageListItems_origin_actor_, a3, a4, a5);
  v13 = v12;
  if (v12)
    objc_storeStrong((id *)&v12->_followUp, a6);

  return v13;
}

- (int64_t)signpostType
{
  return 4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EMMessageFollowUpAction)initWithCoder:(id)a3
{
  id v4;
  EMMessageFollowUpAction *v5;
  uint64_t v6;
  EMFollowUp *followUp;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EMMessageFollowUpAction;
  v5 = -[EMMessageChangeAction initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_followUp"));
    v6 = objc_claimAutoreleasedReturnValue();
    followUp = v5->_followUp;
    v5->_followUp = (EMFollowUp *)v6;

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
  v6.super_class = (Class)EMMessageFollowUpAction;
  -[EMMessageChangeAction encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[EMMessageFollowUpAction followUp](self, "followUp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("EFPropertyKey_followUp"));

}

- (EMFollowUp)followUp
{
  return self->_followUp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_followUp, 0);
}

@end
