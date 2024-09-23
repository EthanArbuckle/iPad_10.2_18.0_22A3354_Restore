@implementation WFContactStore

+ (Class)preferredConcreteSubclass
{
  return (Class)objc_opt_class();
}

+ (id)new
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___WFContactStore;
  return objc_msgSendSuper2(&v3, "new");
}

- (WFContactStore)init
{
  uint64_t v3;
  WFContactStore *v4;
  WFContactStore *v5;
  objc_super v7;

  v3 = objc_opt_class();
  if (v3 == objc_opt_class())
  {
    v4 = (WFContactStore *)objc_alloc_init(+[WFContactStore preferredConcreteSubclass](WFContactStore, "preferredConcreteSubclass"));
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)WFContactStore;
    v4 = -[WFContactStore init](&v7, sel_init);
    self = v4;
  }
  v5 = v4;

  return v5;
}

- (id)allContactsWithSortOrder:(int64_t)a3 passingTest:(id)a4
{
  return 0;
}

- (id)allContactsWithSortOrder:(int64_t)a3
{
  return 0;
}

- (id)contactsWithName:(id)a3
{
  return 0;
}

- (id)contactWithIdentifier:(id)a3
{
  return 0;
}

- (id)firstContactWithEmailAddress:(id)a3
{
  return 0;
}

- (id)firstContactWithPhoneNumber:(id)a3
{
  return 0;
}

- (id)contactsMatchingPredicate:(id)a3 error:(id *)a4
{
  return 0;
}

- (BOOL)addContact:(id)a3 error:(id *)a4
{
  return 0;
}

@end
