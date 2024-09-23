@implementation CCUIStatusUpdate

+ (id)statusUpdateWithMessage:(id)a3 type:(unint64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithMessage:type:", v6, a4);

  return v7;
}

- (id)_initWithMessage:(id)a3 type:(unint64_t)a4
{
  id v6;
  CCUIStatusUpdate *v7;
  uint64_t v8;
  NSString *message;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CCUIStatusUpdate;
  v7 = -[CCUIStatusUpdate init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    message = v7->_message;
    v7->_message = (NSString *)v8;

    v7->_type = a4;
  }

  return v7;
}

- (NSString)message
{
  return self->_message;
}

- (unint64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
}

@end
