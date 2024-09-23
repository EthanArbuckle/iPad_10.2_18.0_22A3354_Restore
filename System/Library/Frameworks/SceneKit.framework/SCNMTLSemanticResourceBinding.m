@implementation SCNMTLSemanticResourceBinding

- (int64_t)semanticsCount
{
  return self->semanticsCount;
}

- (void)setSemanticsCount:(int64_t)a3
{
  self->semanticsCount = a3;
}

- (void)setBufferSize:(int64_t)a3
{
  self->bufferSize = a3;
}

- (int64_t)bufferSize
{
  return self->bufferSize;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_semantics);
  v3.receiver = self;
  v3.super_class = (Class)SCNMTLSemanticResourceBinding;
  -[SCNMTLResourceBinding dealloc](&v3, sel_dealloc);
}

@end
