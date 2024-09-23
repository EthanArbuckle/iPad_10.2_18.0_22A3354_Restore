@implementation HSSetupStaticConfigurator

- (HSSetupStaticConfigurator)initWithViewControllers:(id)a3
{
  id v5;
  HSSetupStaticConfigurator *v6;
  void *v7;
  HSSetupStaticConfigurator *v8;
  objc_super v10;
  _QWORD v11[4];
  HSSetupStaticConfigurator *v12;

  v5 = a3;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001031C;
  v11[3] = &unk_1000A1428;
  v6 = self;
  v12 = v6;
  objc_msgSend(v5, "na_each:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
  v10.receiver = v6;
  v10.super_class = (Class)HSSetupStaticConfigurator;
  v8 = -[HSSetupConfigurator initWithInitialViewController:](&v10, "initWithInitialViewController:", v7);

  if (v8)
    objc_storeStrong((id *)&v8->_staticViewControllers, a3);

  return v8;
}

- (HSSetupStaticConfigurator)initWithContentViewControllers:(id)a3
{
  HSSetupStaticConfigurator *v4;
  void *v5;
  HSSetupStaticConfigurator *v6;
  _QWORD v8[4];
  HSSetupStaticConfigurator *v9;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000103B8;
  v8[3] = &unk_1000A1450;
  v4 = self;
  v9 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "na_map:", v8));
  v6 = -[HSSetupStaticConfigurator initWithViewControllers:](v4, "initWithViewControllers:", v5);

  return v6;
}

- (id)_nextViewControllerForResults:(id)a3
{
  void *v4;
  void *v5;
  char *v6;
  void *v7;
  void *v8;
  char *v9;
  void *v10;
  char *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupStaticConfigurator staticViewControllers](self, "staticViewControllers", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupStaticConfigurator currentViewController](self, "currentViewController"));
  v6 = (char *)objc_msgSend(v4, "indexOfObject:", v5);

  if (v6 == (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupStaticConfigurator currentViewController](self, "currentViewController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupStaticConfigurator staticViewControllers](self, "staticViewControllers"));
    NSLog(CFSTR("currentViewController %@ not in staticViewControllers %@"), v7, v8);

  }
  v9 = v6 + 1;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupStaticConfigurator staticViewControllers](self, "staticViewControllers"));
  v11 = (char *)objc_msgSend(v10, "count");

  if (v9 < v11
    && (v12 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupStaticConfigurator staticViewControllers](self, "staticViewControllers")),
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", v9)),
        v12,
        v13))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", v13));

  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult"));
  }
  return v14;
}

- (NSArray)staticViewControllers
{
  return self->_staticViewControllers;
}

- (void)setStaticViewControllers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_staticViewControllers, 0);
}

@end
