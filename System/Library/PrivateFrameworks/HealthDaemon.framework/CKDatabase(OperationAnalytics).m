@implementation CKDatabase(OperationAnalytics)

+ (void)hd_addOperationObserver:()OperationAnalytics queue:
{
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v5 = _MergedGlobals_206;
  v6 = a4;
  v7 = a3;
  v9 = v7;
  if (v5 == -1)
  {
    v8 = v7;
  }
  else
  {
    dispatch_once(&_MergedGlobals_206, &__block_literal_global_103);
    v8 = v9;
  }
  objc_msgSend((id)qword_1ED5522F8, "registerObserver:queue:", v8, v6);

}

+ (uint64_t)hd_removeOperationObserver:()OperationAnalytics
{
  return objc_msgSend((id)qword_1ED5522F8, "unregisterObserver:");
}

- (void)hd_addOperation:()OperationAnalytics
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  objc_msgSend(a1, "addOperation:", v4);
  v5 = (void *)qword_1ED5522F8;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__CKDatabase_OperationAnalytics__hd_addOperation___block_invoke;
  v7[3] = &unk_1E6CF9008;
  v7[4] = a1;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "notifyObservers:", v7);

}

@end
