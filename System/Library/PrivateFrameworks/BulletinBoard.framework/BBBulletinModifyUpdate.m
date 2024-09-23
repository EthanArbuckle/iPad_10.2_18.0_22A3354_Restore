@implementation BBBulletinModifyUpdate

+ (id)updateWithBulletin:(id)a3 feeds:(unint64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithBulletin:feeds:", v6, a4);

  return v7;
}

- (id)typeDescription
{
  return CFSTR("update");
}

@end
