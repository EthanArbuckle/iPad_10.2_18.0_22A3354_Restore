@implementation MPAVRoutingControllerSelection

- (MPAVRoutingControllerSelection)initWithRoutes:(id)a3 selectionOperation:(int64_t)a4
{
  id v7;
  MPAVRoutingControllerSelection *v8;
  MPAVRoutingControllerSelection *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MPAVRoutingControllerSelection;
  v8 = -[MPAVRoutingControllerSelection init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_routes, a3);
    v9->_selectionOperation = a4;
  }

  return v9;
}

- (id)description
{
  unint64_t selectionOperation;
  __CFString *v3;

  selectionOperation = self->_selectionOperation;
  if (selectionOperation > 2)
    v3 = 0;
  else
    v3 = off_1E31547C0[selectionOperation];
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p operationName=%@ routes=%@>"), objc_opt_class(), self, v3, self->_routes);
}

- (NSArray)routes
{
  return self->_routes;
}

- (void)setRoutes:(id)a3
{
  objc_storeStrong((id *)&self->_routes, a3);
}

- (int64_t)selectionOperation
{
  return self->_selectionOperation;
}

- (void)setSelectionOperation:(int64_t)a3
{
  self->_selectionOperation = a3;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_routes, 0);
}

@end
