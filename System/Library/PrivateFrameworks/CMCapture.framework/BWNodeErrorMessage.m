@implementation BWNodeErrorMessage

- (_QWORD)_initWithNodeError:(void *)a1
{
  _QWORD *v3;
  _QWORD *v4;
  objc_super v6;

  if (!a1)
    return 0;
  v6.receiver = a1;
  v6.super_class = (Class)BWNodeErrorMessage;
  v3 = objc_msgSendSuper2(&v6, sel_init);
  v4 = v3;
  if (v3)
  {
    v3[1] = 0x500000001;
    v3[2] = a2;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWNodeErrorMessage;
  -[BWNodeErrorMessage dealloc](&v3, sel_dealloc);
}

+ (id)newMessageWithNodeError:(id)a3
{
  return -[BWNodeErrorMessage _initWithNodeError:]([BWNodeErrorMessage alloc], a3);
}

- (BWNodeError)nodeError
{
  return self->_nodeError;
}

@end
