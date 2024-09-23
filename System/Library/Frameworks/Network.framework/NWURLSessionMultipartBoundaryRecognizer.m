@implementation NWURLSessionMultipartBoundaryRecognizer

- (void)dealloc
{
  char *rollbackBuffer;
  objc_super v4;

  if (self)
  {
    rollbackBuffer = self->_rollbackBuffer;
    if (rollbackBuffer)
    {
      free(rollbackBuffer);
      self->_rollbackBuffer = 0;
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)NWURLSessionMultipartBoundaryRecognizer;
  -[NWURLSessionMultipartBoundaryRecognizer dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pattern, 0);
}

@end
