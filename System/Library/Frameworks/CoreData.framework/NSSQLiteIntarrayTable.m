@implementation NSSQLiteIntarrayTable

- (void)dealloc
{
  objc_super v3;

  self->_intarrayTable = 0;

  self->_intarrayTableName = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSSQLiteIntarrayTable;
  -[NSSQLiteIntarrayTable dealloc](&v3, sel_dealloc);
}

@end
