@implementation IDSAutoCleanup

- (IDSAutoCleanup)initWithBlock:(id)a3
{
  id v4;
  IDSAutoCleanup *v5;
  uint64_t v6;
  id cleanupBlock;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IDSAutoCleanup;
  v5 = -[IDSAutoCleanup init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    cleanupBlock = v5->_cleanupBlock;
    v5->_cleanupBlock = (id)v6;

  }
  return v5;
}

- (void)incrementAccessCount
{
  int *p_accessCount;
  unsigned int v3;

  p_accessCount = &self->_accessCount;
  do
    v3 = __ldxr((unsigned int *)p_accessCount);
  while (__stxr(v3 + 1, (unsigned int *)p_accessCount));
}

- (void)dealloc
{
  objc_super v3;

  (*((void (**)(void))self->_cleanupBlock + 2))();
  v3.receiver = self;
  v3.super_class = (Class)IDSAutoCleanup;
  -[IDSAutoCleanup dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cleanupBlock, 0);
}

@end
