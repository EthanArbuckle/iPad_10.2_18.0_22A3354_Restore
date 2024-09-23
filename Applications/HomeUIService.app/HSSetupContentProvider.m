@implementation HSSetupContentProvider

+ (NSDictionary)stringToStepMap
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004CED0;
  block[3] = &unk_1000A3178;
  block[4] = a1;
  if (qword_1000C3598 != -1)
    dispatch_once(&qword_1000C3598, block);
  return (NSDictionary *)(id)qword_1000C3590;
}

+ (id)stringForHSProxCardSetupUIStep:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "stepToStringMap"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v5));

  return v6;
}

+ (int64_t)hsProxCardSetupUIStepForString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "stringToStepMap"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  if (v6)
    v7 = (int64_t)objc_msgSend(v6, "integerValue");
  else
    v7 = -1;

  return v7;
}

+ (id)contentForStep:(int64_t)a3 coordinator:(id)a4 config:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;

  v7 = a4;
  v8 = a5;
  v9 = sub_10004D17C();
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  v13 = objc_msgSend(v10, "objectForKeyedSubscript:", v11);
  if (!v13)
    v13 = (id)objc_opt_class(HSPCErrorViewController, v12);

  if ((objc_opt_respondsToSelector(v13, "viewControllerForCoordinator:config:") & 1) != 0)
    v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "viewControllerForCoordinator:config:", v7, v8));
  else
    v14 = objc_msgSend(objc_alloc((Class)v13), "initWithCoordinator:config:", v7, v8);
  v15 = v14;

  return v15;
}

@end
