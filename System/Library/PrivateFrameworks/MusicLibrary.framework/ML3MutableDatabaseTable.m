@implementation ML3MutableDatabaseTable

- (void)setName:(id)a3
{
  NSString *v4;
  NSString *name;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  name = self->super._name;
  self->super._name = v4;

}

- (void)setColumns:(id)a3
{
  NSArray *v4;
  NSArray *columns;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  columns = self->super._columns;
  self->super._columns = v4;

}

- (void)setForeignKeyConstraints:(id)a3
{
  NSArray *v4;
  NSArray *foreignKeyConstraints;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  foreignKeyConstraints = self->super._foreignKeyConstraints;
  self->super._foreignKeyConstraints = v4;

}

@end
