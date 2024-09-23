@implementation AAUIHandleWithKind

- (AAUIHandleWithKind)initWithHandle:(id)a3 kind:(unint64_t)a4
{
  id v7;
  AAUIHandleWithKind *v8;
  AAUIHandleWithKind *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AAUIHandleWithKind;
  v8 = -[AAUIHandleWithKind init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_handle, a3);
    v9->_kind = a4;
  }

  return v9;
}

- (NSString)handle
{
  return self->_handle;
}

- (unint64_t)kind
{
  return self->_kind;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handle, 0);
}

@end
