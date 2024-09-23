@implementation HFActionNaturalLanguageExecutionTuple

- (HFActionNaturalLanguageExecutionTuple)initWithFirst:(id)a3 second:(id)a4 third:(id)a5
{
  id v9;
  id v10;
  id v11;
  HFActionNaturalLanguageExecutionTuple *v12;
  HFActionNaturalLanguageExecutionTuple *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HFActionNaturalLanguageExecutionTuple;
  v12 = -[HFActionNaturalLanguageExecutionTuple init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong(&v12->_first, a3);
    objc_storeStrong(&v13->_second, a4);
    objc_storeStrong(&v13->_third, a5);
  }

  return v13;
}

+ (id)tuple:(id)a3 second:(id)a4 third:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFirst:second:third:", v9, v8, v7);

  return v10;
}

- (HFActionNaturalLanguageExecutionTuple)initWithFirst:(id)a3 second:(id)a4
{
  return -[HFActionNaturalLanguageExecutionTuple initWithFirst:second:third:](self, "initWithFirst:second:third:", a3, a4, 0);
}

+ (id)tuple:(id)a3 second:(id)a4
{
  return (id)objc_msgSend(a1, "tuple:second:third:", a3, a4, 0);
}

- (id)first
{
  return self->_first;
}

- (void)setFirst:(id)a3
{
  objc_storeStrong(&self->_first, a3);
}

- (id)second
{
  return self->_second;
}

- (void)setSecond:(id)a3
{
  objc_storeStrong(&self->_second, a3);
}

- (id)third
{
  return self->_third;
}

- (void)setThird:(id)a3
{
  objc_storeStrong(&self->_third, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_third, 0);
  objc_storeStrong(&self->_second, 0);
  objc_storeStrong(&self->_first, 0);
}

@end
