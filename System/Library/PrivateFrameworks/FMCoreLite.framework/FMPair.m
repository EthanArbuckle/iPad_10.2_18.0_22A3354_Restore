@implementation FMPair

+ (id)pairWithFirst:(id)a3 second:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithFirst:second:", v7, v6);

  return v8;
}

- (FMPair)initWithFirst:(id)a3 second:(id)a4
{
  id v7;
  id v8;
  FMPair *v9;
  FMPair *v10;
  FMPair *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)FMPair;
  v9 = -[FMPair init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->_first, a3);
    objc_storeStrong(&v10->_second, a4);
    v11 = v10;
  }

  return v10;
}

- (id)first
{
  return objc_getProperty(self, a2, 8, 1);
}

- (id)second
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_second, 0);
  objc_storeStrong(&self->_first, 0);
}

@end
