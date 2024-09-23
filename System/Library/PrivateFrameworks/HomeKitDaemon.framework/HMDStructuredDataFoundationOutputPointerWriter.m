@implementation HMDStructuredDataFoundationOutputPointerWriter

- (void)emitRootValue:(id)a3
{
  objc_storeStrong(self->_output, a3);
}

- (_QWORD)initWithOutput:(void *)a1
{
  _QWORD *v3;
  _QWORD *v4;
  void *v5;
  objc_super v7;

  if (!a1)
    return 0;
  if (!a2)
  {
    _HMFPreconditionFailure();
    return 0;
  }
  v7.receiver = a1;
  v7.super_class = (Class)HMDStructuredDataFoundationOutputPointerWriter;
  v3 = objc_msgSendSuper2(&v7, sel_init);
  v4 = v3;
  if (v3)
  {
    v3[6] = a2;
    v5 = *a2;
    *a2 = 0;

  }
  return v4;
}

@end
