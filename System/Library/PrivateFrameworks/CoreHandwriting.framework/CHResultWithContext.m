@implementation CHResultWithContext

- (CHResultWithContext)initWithResult:(id)a3 leftContext:(id)a4 contentType:(int)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  CHResultWithContext *v15;
  uint64_t v16;
  CHMutableTokenizedTextResult *v17;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v19.receiver = self;
  v19.super_class = (Class)CHResultWithContext;
  v15 = -[CHResultWithContext init](&v19, sel_init);
  if (v15)
  {
    v16 = objc_msgSend_mutableCopy(v8, v10, v11, v12, v13, v14);
    v17 = v15->_result;
    v15->_result = (CHMutableTokenizedTextResult *)v16;

    objc_storeStrong((id *)&v15->_leftContext, a4);
    v15->_contentType = a5;
  }

  return v15;
}

- (NSString)leftContext
{
  return self->_leftContext;
}

- (int)contentType
{
  return self->_contentType;
}

- (CHMutableTokenizedTextResult)result
{
  return self->_result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_leftContext, 0);
}

@end
