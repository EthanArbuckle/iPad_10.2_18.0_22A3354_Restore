@implementation IMDReplayStorageIterationContext

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IMDReplayStorageIterationContext;
  -[IMDReplayStorageIterationContext dealloc](&v3, sel_dealloc);
}

- (IDSKVDeleteContext)deleteContext
{
  return self->_deleteContext;
}

- (void)setDeleteContext:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

@end
