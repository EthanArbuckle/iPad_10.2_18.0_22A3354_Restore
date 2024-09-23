@implementation ATXIntentComparator

+ (BOOL)intent:(id)a3 isEqualToIntent:(id)a4
{
  id v5;
  id v6;
  char v7;

  v5 = a3;
  v6 = a4;
  v7 = sub_2384C95DC(v5, v6);

  return v7 & 1;
}

- (ATXIntentComparator)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ATXIntentComparator;
  return -[ATXIntentComparator init](&v3, sel_init);
}

@end
