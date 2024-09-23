@implementation INFSentenceTokenWithContext

- (INFSentenceTokenWithContext)initWithToken:(id)a3 variableName:(id)a4
{
  id v7;
  id v8;
  INFSentenceTokenWithContext *v9;
  INFSentenceTokenWithContext *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)INFSentenceTokenWithContext;
  v9 = -[INFSentenceTokenWithContext init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_originalToken, a3);
    objc_storeStrong((id *)&v10->_placeholderName, a4);
  }

  return v10;
}

- (BOOL)isResolved
{
  return self->_resolved;
}

- (void)setResolved:(BOOL)a3
{
  self->_resolved = a3;
}

- (NSString)placeholderName
{
  return self->_placeholderName;
}

- (void)setPlaceholderName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (INFSentenceContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (INFSentenceToken)originalToken
{
  return self->_originalToken;
}

- (void)setOriginalToken:(id)a3
{
  objc_storeStrong((id *)&self->_originalToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalToken, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_placeholderName, 0);
}

+ (id)sentenceResolvedTokenWithOriginalToken:(id)a3 placeholderName:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithToken:variableName:", v7, v6);

  return v8;
}

@end
