@implementation _SFSavedAccountTouchIconCache

- (id)_operationWithRequest:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  _SFTouchIconFetchOperation *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[WBSTouchIconFetchOperation initWithRequest:allowFetchingOverCellularNetwork:completionHandler:]([_SFTouchIconFetchOperation alloc], "initWithRequest:allowFetchingOverCellularNetwork:completionHandler:", v6, 0, v5);

  return v7;
}

- (BOOL)canHandleRequest:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end
