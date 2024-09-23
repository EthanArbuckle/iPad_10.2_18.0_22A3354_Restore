@implementation EKWeakReference

- (id)value
{
  return objc_loadWeakRetained(&self->_value);
}

- (EKWeakReference)initWithValue:(id)a3
{
  id v4;
  EKWeakReference *v5;
  EKWeakReference *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)EKWeakReference;
  v5 = -[EKWeakReference init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak(&v5->_value, v4);

  return v6;
}

- (void)setValue:(id)a3
{
  objc_storeWeak(&self->_value, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_value);
}

@end
