@implementation FIReduction

- (FIReduction)initWithObject:(id)a3
{
  id v5;
  FIReduction *v6;
  FIReduction *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FIReduction;
  v6 = -[FIReduction init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong(&v6->_object, a3);

  return v7;
}

+ (id)reductionWithObject:(id)a3
{
  id v3;
  FIReduction *v4;
  id object;

  v3 = a3;
  v4 = objc_alloc_init(FIReduction);
  object = v4->_object;
  v4->_object = v3;

  return v4;
}

- (id)object
{
  return self->_object;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_object, 0);
}

@end
