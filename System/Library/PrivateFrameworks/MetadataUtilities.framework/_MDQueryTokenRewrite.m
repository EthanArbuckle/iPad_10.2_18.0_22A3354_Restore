@implementation _MDQueryTokenRewrite

- (_MDQueryTokenRewrite)initWithOriginalToken:(id)a3 variations:(id)a4
{
  _MDQueryTokenRewrite *v6;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)_MDQueryTokenRewrite;
  v6 = -[_MDQueryTokenRewrite init](&v8, sel_init);
  if (v6)
  {
    v6->_originalToken = (NSString *)objc_msgSend(a3, "copy");
    v6->_variations = (NSArray *)objc_msgSend(a4, "copy");
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)_MDQueryTokenRewrite;
  -[_MDQueryTokenRewrite dealloc](&v3, sel_dealloc);
}

- (NSString)originalToken
{
  return self->_originalToken;
}

- (void)setOriginalToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)variations
{
  return self->_variations;
}

@end
