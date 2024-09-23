@implementation _NSPersistenceUtilities

+ (void)initialize
{
  objc_opt_self();
}

+ (BOOL)_setURL:(id)a3 forPersistentStore:(id)a4 withCoordinator:(id)a5
{
  return objc_msgSend(a5, "setURL:forPersistentStore:", a3, a4);
}

@end
