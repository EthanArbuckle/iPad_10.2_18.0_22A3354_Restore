@implementation EMUndoMessageAction

- (EMUndoMessageAction)initWithIndividualActions:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5
{
  id v9;
  EMUndoMessageAction *v10;
  EMUndoMessageAction *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)EMUndoMessageAction;
  v10 = -[EMMessageChangeAction initWithMessageListItems:origin:actor:](&v13, sel_initWithMessageListItems_origin_actor_, 0, a4, a5);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_individualActions, a3);

  return v11;
}

- (int64_t)signpostType
{
  return 14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EMUndoMessageAction)initWithCoder:(id)a3
{
  id v4;
  EMUndoMessageAction *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *individualActions;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)EMUndoMessageAction;
  v5 = -[EMMessageChangeAction initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("EFPropertyKey_individualActions"));
    v9 = objc_claimAutoreleasedReturnValue();
    individualActions = v5->_individualActions;
    v5->_individualActions = (NSArray *)v9;

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
  v6.super_class = (Class)EMUndoMessageAction;
  -[EMMessageChangeAction encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[EMUndoMessageAction individualActions](self, "individualActions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("EFPropertyKey_individualActions"));

}

- (NSArray)individualActions
{
  return self->_individualActions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_individualActions, 0);
}

@end
