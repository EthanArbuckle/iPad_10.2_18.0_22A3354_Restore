@implementation NSSQLOptLockKey

- (id)name
{
  return CFSTR("_opt");
}

- (NSSQLOptLockKey)initWithEntity:(id)a3 propertyDescription:(id)a4
{
  NSSQLOptLockKey *v4;
  NSSQLOptLockKey *v5;
  __CFString *columnName;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NSSQLOptLockKey;
  v4 = -[NSSQLColumn initWithEntity:propertyDescription:](&v8, sel_initWithEntity_propertyDescription_, a3, 0);
  v5 = v4;
  if (v4)
  {
    v4->super.super._propertyType = 6;
    columnName = (__CFString *)v4->super._columnName;
    if (columnName != CFSTR("Z_OPT"))
    {

      v5->super._columnName = (NSString *)objc_msgSend(CFSTR("Z_OPT"), "copy");
    }
    v5->super.super._sqlType = 2;
  }
  return v5;
}

@end
