@implementation ASTNetworkReachability

+ (BOOL)hasNetworkConnection
{
  NSObject *v2;
  BOOL v3;

  objc_msgSend(a1, "defaultPath");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = nw_path_get_status(v2) == nw_path_status_satisfied;

  return v3;
}

+ (BOOL)hasExpensiveCellOnlyNetworkConnection
{
  NSObject *v2;
  BOOL v3;

  objc_msgSend(a1, "defaultPath");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = nw_path_get_status(v2) == nw_path_status_satisfied
    && nw_path_is_expensive(v2)
    && nw_path_uses_interface_type(v2, nw_interface_type_cellular);

  return v3;
}

+ (id)defaultPath
{
  void *default_evaluator;
  void *v3;

  default_evaluator = (void *)nw_path_create_default_evaluator();
  v3 = (void *)nw_path_evaluator_copy_path();

  return v3;
}

@end
