@implementation CRKClassKitClassPropertyApplicatorResult

- (CRKClassKitClassPropertyApplicatorResult)init
{
  return -[CRKClassKitClassPropertyApplicatorResult initWithClassWasModified:](self, "initWithClassWasModified:", 0);
}

- (CRKClassKitClassPropertyApplicatorResult)initWithClassWasModified:(BOOL)a3
{
  CRKClassKitClassPropertyApplicatorResult *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRKClassKitClassPropertyApplicatorResult;
  result = -[CRKClassKitClassPropertyApplicatorResult init](&v5, sel_init);
  if (result)
    result->_classWasModified = a3;
  return result;
}

- (BOOL)classWasModified
{
  return self->_classWasModified;
}

@end
