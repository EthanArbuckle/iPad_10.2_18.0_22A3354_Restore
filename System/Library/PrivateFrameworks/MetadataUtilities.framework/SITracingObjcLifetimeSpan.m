@implementation SITracingObjcLifetimeSpan

- (id)init:(SITracingSpan *)a3 kind:(char)a4 what:(const char *)a5
{
  unint64_t v6;
  unint64_t v7;

  self->_mySpan.traceid = a3->traceid;
  do
  {
    v6 = __ldxr(&next_spanid);
    v7 = v6 + 1;
  }
  while (__stxr(v7, &next_spanid));
  self->_mySpan.spanid = v7;
  self->_mySpan.parentid = a3->spanid;
  self->_mySpan.queryid = a3->queryid;
  self->_mySpan.kind = a4;
  self->_mySpan.what = (char *)a5;
  if (init_once != -1)
    dispatch_once(&init_once, &__block_literal_global_1);
  return self;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  if (self->_mySpan.traceid && init_once != -1)
    dispatch_once(&init_once, &__block_literal_global_1);
  v3.receiver = self;
  v3.super_class = (Class)SITracingObjcLifetimeSpan;
  -[SITracingObjcLifetimeSpan dealloc](&v3, sel_dealloc);
}

@end
