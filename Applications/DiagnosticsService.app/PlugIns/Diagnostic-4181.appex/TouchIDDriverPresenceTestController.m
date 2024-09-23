@implementation TouchIDDriverPresenceTestController

- (void)start
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if ((-[TouchIDDriverPresenceTestController isCancelled](self, "isCancelled") & 1) != 0
    || (v3 = objc_claimAutoreleasedReturnValue(+[TouchIDManager runTouchIDDiagnostic:options:](TouchIDManager, "runTouchIDDiagnostic:options:", 1, &__NSDictionary0__struct))) == 0)
  {
    v8 = 0;
  }
  else
  {
    v8 = (id)v3;
    if ((-[TouchIDDriverPresenceTestController isCancelled](self, "isCancelled") & 1) == 0)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("data")));
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[TouchIDDriverPresenceTestController result](self, "result"));
      objc_msgSend(v5, "setData:", v4);

      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("testStatus")));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[TouchIDDriverPresenceTestController result](self, "result"));
      objc_msgSend(v7, "setStatusCode:", v6);

    }
  }
  -[TouchIDDriverPresenceTestController setFinished:](self, "setFinished:", 1);

}

@end
