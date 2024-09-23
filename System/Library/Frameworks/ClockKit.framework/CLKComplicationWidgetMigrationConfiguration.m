@implementation CLKComplicationWidgetMigrationConfiguration

- (id)initPrivate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLKComplicationWidgetMigrationConfiguration;
  return -[CLKComplicationWidgetMigrationConfiguration init](&v3, sel_init);
}

- (BOOL)isEqual:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a3;
  v4 = (void *)objc_opt_class();
  v5 = objc_opt_class();

  return objc_msgSend(v4, "isEqual:", v5);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLKComplicationWidgetMigrationConfiguration)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CLKComplicationWidgetMigrationConfiguration;
  return -[CLKComplicationWidgetMigrationConfiguration init](&v4, sel_init, a3);
}

@end
