@implementation DYCaptureVisitor

- (DYCaptureVisitor)init
{
  DYCaptureVisitor *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DYCaptureVisitor;
  result = -[DYCaptureVisitor init](&v3, sel_init);
  if (result)
    result->_visitUnusedResoures = 0;
  return result;
}

- (void)abort
{
  self->_abort = 1;
}

- (NSError)visitCaptureArchiveError
{
  return self->_visitCaptureArchiveError;
}

- (void)setVisitCaptureArchiveError:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (BOOL)visitUnusedResoures
{
  return self->_visitUnusedResoures;
}

- (void)setVisitUnusedResoures:(BOOL)a3
{
  self->_visitUnusedResoures = a3;
}

@end
