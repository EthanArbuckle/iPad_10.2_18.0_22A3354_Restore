@implementation NAFuture

- (id)hs_commitConfigurationFutureWithContextMessage:(id)a3
{
  return -[NAFuture _commitConfigurationReturningDirective:withContextMessage:](self, "_commitConfigurationReturningDirective:withContextMessage:", 0, a3);
}

- (id)hs_commitConfigurationAndDismissFutureWithContextMessage:(id)a3
{
  return -[NAFuture _commitConfigurationReturningDirective:withContextMessage:](self, "_commitConfigurationReturningDirective:withContextMessage:", 1, a3);
}

- (id)_commitConfigurationReturningDirective:(unint64_t)a3 withContextMessage:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void **v13;
  uint64_t v14;
  id (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  _QWORD v18[5];

  v6 = a4;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100046544;
  v18[3] = &unk_1000A2F28;
  v18[4] = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NAFuture flatMap:](self, "flatMap:", v18));
  v13 = _NSConcreteStackBlock;
  v14 = 3221225472;
  v15 = sub_10004659C;
  v16 = &unk_1000A10D0;
  v17 = v6;
  v8 = v6;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "recover:", &v13));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NAScheduler mainThreadScheduler](NAScheduler, "mainThreadScheduler", v13, v14, v15, v16));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "reschedule:", v10));

  return v11;
}

@end
