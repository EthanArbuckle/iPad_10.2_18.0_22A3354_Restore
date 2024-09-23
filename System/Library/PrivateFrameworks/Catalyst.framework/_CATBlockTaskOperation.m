@implementation _CATBlockTaskOperation

- (_CATBlockTaskOperation)initWithBlock:(id)a3 request:(id)a4
{
  id v6;
  _CATBlockTaskOperation *v7;
  uint64_t v8;
  id mBlock;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_CATBlockTaskOperation;
  v7 = -[CATTaskOperation initWithRequest:](&v11, sel_initWithRequest_, a4);
  if (v7)
  {
    v8 = MEMORY[0x20BD10A78](v6);
    mBlock = v7->mBlock;
    v7->mBlock = (id)v8;

  }
  return v7;
}

- (void)main
{
  void (**mBlock)(id, void *, id *);
  void *v4;
  void *v5;
  id v6;
  id v7;

  mBlock = (void (**)(id, void *, id *))self->mBlock;
  -[CATTaskOperation request](self, "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  mBlock[2](mBlock, v4, &v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v7;

  if (v6)
    -[CATOperation endOperationWithError:](self, "endOperationWithError:", v6);
  else
    -[CATOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", v5);

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->mBlock, 0);
}

@end
