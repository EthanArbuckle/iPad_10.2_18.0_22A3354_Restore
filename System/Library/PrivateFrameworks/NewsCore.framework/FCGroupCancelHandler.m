@implementation FCGroupCancelHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelHandlers, 0);
}

+ (id)groupCancelHandlerWithCancelHandlers:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCancelHandlers:", v4);

  return v5;
}

- (FCGroupCancelHandler)initWithCancelHandlers:(id)a3
{
  id v4;
  FCGroupCancelHandler *v5;
  uint64_t v6;
  NSArray *cancelHandlers;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCGroupCancelHandler;
  v5 = -[FCGroupCancelHandler init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    cancelHandlers = v5->_cancelHandlers;
    v5->_cancelHandlers = (NSArray *)v6;

  }
  return v5;
}

- (void)cancel
{
  id v2;

  -[FCGroupCancelHandler cancelHandlers](self, "cancelHandlers");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "makeObjectsPerformSelector:", sel_cancel);

}

- (NSArray)cancelHandlers
{
  return self->_cancelHandlers;
}

- (void)setCancelHandlers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

@end
