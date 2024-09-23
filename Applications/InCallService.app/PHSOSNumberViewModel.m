@implementation PHSOSNumberViewModel

- (PHSOSNumberViewModel)initWithSOSHandle:(id)a3
{
  id v4;
  PHSOSNumberViewModel *v5;
  PHSOSNumberViewModel *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PHSOSNumberViewModel;
  v5 = -[PHSOSNumberViewModel init](&v8, "init");
  v6 = v5;
  if (v5)
    -[PHSOSNumberViewModel setSosHandle:](v5, "setSosHandle:", v4);

  return v6;
}

- (id)sosTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSNumberViewModel sosHandle](self, "sosHandle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "label"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_10028DC20, CFSTR("InCallService")));

  return v6;
}

- (id)sosSubtitle
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSNumberViewModel sosHandle](self, "sosHandle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "handle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "value"));

  return v4;
}

- (TULabeledHandle)sosHandle
{
  return self->_sosHandle;
}

- (void)setSosHandle:(id)a3
{
  objc_storeStrong((id *)&self->_sosHandle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sosHandle, 0);
}

@end
