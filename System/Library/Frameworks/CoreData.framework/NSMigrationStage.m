@implementation NSMigrationStage

- (NSMigrationStage)init
{
  NSMigrationStage *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NSMigrationStage;
  v2 = -[NSMigrationStage init](&v4, sel_init);
  if (v2)
    v2->_label = (NSString *)objc_alloc_init(MEMORY[0x1E0CB3940]);
  return v2;
}

- (void)setLabel:(NSString *)label
{
  NSString *v3;
  NSString *v6;

  v3 = self->_label;
  if (v3 != label)
  {

    if (label)
      v6 = (NSString *)-[NSString copy](label, "copy");
    else
      v6 = (NSString *)objc_alloc_init(MEMORY[0x1E0CB3940]);
    self->_label = v6;
  }
}

- (void)dealloc
{
  objc_super v3;

  self->_label = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSMigrationStage;
  -[NSMigrationStage dealloc](&v3, sel_dealloc);
}

- (NSString)label
{
  return self->_label;
}

@end
