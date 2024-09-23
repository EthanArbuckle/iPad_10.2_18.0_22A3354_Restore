@implementation CNDispatchSource

- (CNDispatchSource)initWithSource:(id)a3
{
  id v5;
  CNDispatchSource *v6;
  CNDispatchSource *v7;
  CNDispatchSource *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNDispatchSource;
  v6 = -[CNDispatchSource init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_source, a3);
    v8 = v7;
  }

  return v7;
}

- (void)cancel
{
  dispatch_source_cancel((dispatch_source_t)self->_source);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
}

- (id)source
{
  return self->_source;
}

@end
