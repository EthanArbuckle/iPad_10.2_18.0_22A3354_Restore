@implementation WFContentPropertyPossibleValuesSynchronousGetter

- (WFContentPropertyPossibleValuesSynchronousGetter)initWithSynchronousGetter:(id)a3
{
  id v4;
  WFContentPropertyPossibleValuesSynchronousGetter *v5;
  void *v6;
  id getter;
  WFContentPropertyPossibleValuesSynchronousGetter *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFContentPropertyPossibleValuesSynchronousGetter;
  v5 = -[WFContentPropertyPossibleValuesSynchronousGetter init](&v10, sel_init);
  if (v5)
  {
    v6 = _Block_copy(v4);
    getter = v5->_getter;
    v5->_getter = v6;

    v8 = v5;
  }

  return v5;
}

- (BOOL)isAsynchronous
{
  return 0;
}

- (void)getValuesWithCompletionBlock:(id)a3
{
  _QWORD *getter;
  void (*v5)(_QWORD *);
  id v6;
  id v7;

  getter = self->_getter;
  v5 = (void (*)(_QWORD *))getter[2];
  v6 = a3;
  v5(getter);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a3 + 2))(v6, v7);

}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = _Block_copy(self->_getter);
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> synchronous getter with block %@"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_getter, 0);
}

@end
