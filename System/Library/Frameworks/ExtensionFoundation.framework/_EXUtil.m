@implementation _EXUtil

+ (const)auditTokenForCurrentProcess
{
  if (auditTokenForCurrentProcess_onceToken != -1)
    dispatch_once(&auditTokenForCurrentProcess_onceToken, &__block_literal_global_10);
  return (const $115C4C562B26FF47E01F9F4EA65B5887 *)&auditTokenForCurrentProcess_currentAuditToken;
}

+ (void)queryControllerDelegate:(id)a3 didUpdateController:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a3;
  v6 = a4;
  v9 = v5;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v7 = (void *)objc_opt_new();
    objc_msgSend(v9, "queryControllerDidUpdate:resultDifference:", v6, v7);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v8 = (void *)objc_opt_new();
    objc_msgSend(v9, "queryControllerDidUpdate:difference:", v6, v8);

  }
}

@end
