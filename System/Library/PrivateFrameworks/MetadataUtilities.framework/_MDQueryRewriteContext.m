@implementation _MDQueryRewriteContext

- (_MDQueryRewriteContext)initWithRewrittenTokens:(id)a3
{
  _MDQueryRewriteContext *v4;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)_MDQueryRewriteContext;
  v4 = -[_MDQueryRewriteContext init](&v6, sel_init);
  if (v4)
    v4->_tokenRewrites = (NSArray *)objc_msgSend(a3, "copy");
  return v4;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)_MDQueryRewriteContext;
  -[_MDQueryRewriteContext dealloc](&v3, sel_dealloc);
}

- (NSArray)tokenRewrites
{
  return self->_tokenRewrites;
}

- (void)setTokenRewrites:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

@end
