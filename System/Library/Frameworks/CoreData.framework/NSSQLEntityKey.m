@implementation NSSQLEntityKey

- (id)name
{
  return CFSTR("_ent");
}

- (NSSQLEntityKey)initWithEntity:(id)a3 propertyDescription:(id)a4
{
  NSSQLEntityKey *v4;
  NSSQLEntityKey *v5;
  __CFString *columnName;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NSSQLEntityKey;
  v4 = -[NSSQLColumn initWithEntity:propertyDescription:](&v8, sel_initWithEntity_propertyDescription_, a3, 0);
  v5 = v4;
  if (v4)
  {
    v4->super.super._propertyType = 5;
    columnName = (__CFString *)v4->super._columnName;
    if (columnName != CFSTR("Z_ENT"))
    {

      v5->super._columnName = (NSString *)objc_msgSend(CFSTR("Z_ENT"), "copy");
    }
    v5->super.super._sqlType = 1;
  }
  return v5;
}

@end
