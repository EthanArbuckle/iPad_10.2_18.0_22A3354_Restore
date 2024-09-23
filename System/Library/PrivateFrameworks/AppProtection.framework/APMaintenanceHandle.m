@implementation APMaintenanceHandle

- (BOOL)clearAccessTable:(id *)a3
{
  sub_2362BFFB4();
  return 1;
}

- (id)getStateDumpWithError:(id *)a3
{
  return (id)sub_2362C0138();
}

- (APMaintenanceHandle)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)APMaintenanceHandle;
  return -[APMaintenanceHandle init](&v3, sel_init);
}

@end
