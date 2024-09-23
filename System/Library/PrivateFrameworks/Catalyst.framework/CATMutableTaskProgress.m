@implementation CATMutableTaskProgress

- (CATMutableTaskProgress)initWithOperationUUID:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CATMutableTaskProgress;
  return -[CATTaskProgress initWithOperationUUID:](&v4, sel_initWithOperationUUID_, a3);
}

- (CATMutableTaskProgress)initWithOperationUUID:(id)a3 requestClass:(Class)a4
{
  id v7;
  CATMutableTaskProgress *v8;
  void *v9;
  void *v11;

  v7 = a3;
  if (!a4)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATTaskProgress.m"), 306, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("requestClass"));

  }
  v8 = -[CATMutableTaskProgress initWithOperationUUID:](self, "initWithOperationUUID:", v7);
  if (v8)
  {
    NSStringFromClass(a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CATTaskProgress setRequestClassName:](v8, "setRequestClassName:", v9);

  }
  return v8;
}

- (CATMutableTaskProgress)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CATMutableTaskProgress;
  return -[CATTaskProgress initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (void)setResultObject:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CATMutableTaskProgress;
  -[CATTaskProgress setResultObject:](&v7, sel_setResultObject_, a3);
  v4 = (void *)objc_opt_class();
  -[CATTaskProgress resultObject](self, "resultObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CATTaskProgress requestClassName](self, "requestClassName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assertResultObject:isValidForRequestClassName:", v5, v6);

}

- (void)setProgress:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CATMutableTaskProgress;
  -[CATTaskProgress setProgress:](&v3, sel_setProgress_, a3);
}

@end
