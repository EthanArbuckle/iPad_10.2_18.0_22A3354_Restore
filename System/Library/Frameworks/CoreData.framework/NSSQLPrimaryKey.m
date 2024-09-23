@implementation NSSQLPrimaryKey

- (id)name
{
  return self->_name;
}

- (NSSQLPrimaryKey)initWithEntity:(id)a3 propertyDescription:(id)a4
{
  NSSQLPrimaryKey *v4;
  NSSQLPrimaryKey *v5;
  __CFString *columnName;
  __CFString *name;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NSSQLPrimaryKey;
  v4 = -[NSSQLColumn initWithEntity:propertyDescription:](&v9, sel_initWithEntity_propertyDescription_, a3, 0);
  v5 = v4;
  if (v4)
  {
    v4->super.super._propertyType = 2;
    columnName = (__CFString *)v4->super._columnName;
    if (columnName != CFSTR("Z_PK"))
    {

      v5->super._columnName = (NSString *)objc_msgSend(CFSTR("Z_PK"), "copy");
    }
    name = (__CFString *)v5->_name;
    if (name != CFSTR("_pk"))
    {

      v5->_name = (NSString *)objc_msgSend(CFSTR("_pk"), "copy");
    }
    v5->super.super._sqlType = 2;
  }
  return v5;
}

- (void)copyValuesForReadOnlyFetch:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NSSQLPrimaryKey;
  -[NSSQLColumn copyValuesForReadOnlyFetch:](&v5, sel_copyValuesForReadOnlyFetch_);
  self->_name = (NSString *)objc_msgSend((id)objc_msgSend(a3, "name"), "copy");
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSSQLPrimaryKey;
  -[NSSQLColumn dealloc](&v3, sel_dealloc);
}

@end
