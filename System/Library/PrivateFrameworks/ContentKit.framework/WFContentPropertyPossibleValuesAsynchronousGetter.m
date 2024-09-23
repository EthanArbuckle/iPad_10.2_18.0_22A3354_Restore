@implementation WFContentPropertyPossibleValuesAsynchronousGetter

- (WFContentPropertyPossibleValuesAsynchronousGetter)initWithAsynchronousGetter:(id)a3
{
  id v4;
  WFContentPropertyPossibleValuesAsynchronousGetter *v5;
  void *v6;
  id getter;
  WFContentPropertyPossibleValuesAsynchronousGetter *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFContentPropertyPossibleValuesAsynchronousGetter;
  v5 = -[WFContentPropertyPossibleValuesAsynchronousGetter init](&v10, sel_init);
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
  return 1;
}

- (void)getValuesWithCompletionBlock:(id)a3
{
  id v4;
  _QWORD *getter;
  void (*v6)(_QWORD *, _QWORD *);
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  getter = self->_getter;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __82__WFContentPropertyPossibleValuesAsynchronousGetter_getValuesWithCompletionBlock___block_invoke;
  v8[3] = &unk_24C4E04F8;
  v9 = v4;
  v6 = (void (*)(_QWORD *, _QWORD *))getter[2];
  v7 = v4;
  v6(getter, v8);

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
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> asynchronous getter with block %@"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_getter, 0);
}

uint64_t __82__WFContentPropertyPossibleValuesAsynchronousGetter_getValuesWithCompletionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
