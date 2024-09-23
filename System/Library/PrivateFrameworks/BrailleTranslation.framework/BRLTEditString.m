@implementation BRLTEditString

- (BRLTEditString)init
{
  return -[BRLTEditString initWithString:selection:focus:token:suggestion:textFormattingRanges:](self, "initWithString:selection:focus:token:suggestion:textFormattingRanges:", &stru_24CBF1330, 0x7FFFFFFFFFFFFFFFLL, 0, 0x7FFFFFFFFFFFFFFFLL, 0, 0, 0x7FFFFFFFFFFFFFFFLL, 0, 0);
}

- (BRLTEditString)initWithString:(id)a3 selection:(_NSRange)a4 focus:(_NSRange)a5 token:(int64_t)a6 suggestion:(_NSRange)a7 textFormattingRanges:(id)a8
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v11;
  NSUInteger v12;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BRLTEditStringInternal *v22;
  BRLTEditString *v23;

  length = a5.length;
  location = a5.location;
  v11 = a4.length;
  v12 = a4.location;
  v15 = a8;
  v16 = a3;
  v17 = BRLTJRangeForUnicharRange(v16, v12, v11);
  v19 = v18;
  v20 = BRLTJRangeForUnicharRange(v16, location, length);
  v22 = -[BRLTEditStringInternal initWithString:NSSelection:NSFocus:token:NSSuggestion:textFormattingRanges:]([BRLTEditStringInternal alloc], "initWithString:NSSelection:NSFocus:token:NSSuggestion:textFormattingRanges:", v16, v17, v19, v20, v21, a6, a7.location, a7.length, v15);

  v23 = -[BRLTEditString initWithUnderlyingObject:](self, "initWithUnderlyingObject:", v22);
  return v23;
}

- (BRLTEditString)initWithUnderlyingObject:(id)a3
{
  id v5;
  BRLTEditString *v6;
  BRLTEditString *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BRLTEditString;
  v6 = -[BRLTEditString init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_underlyingObject, a3);

  return v7;
}

- (NSString)string
{
  return -[BRLTEditStringInternal string](self->_underlyingObject, "string");
}

- (_NSRange)selection
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  _NSRange result;

  -[BRLTEditStringInternal string](self->_underlyingObject, "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[BRLTEditStringInternal NSSelection](self->_underlyingObject, "NSSelection");
  v6 = BRLTJUnicharRangeForRange(v3, v4, v5);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.length = v10;
  result.location = v9;
  return result;
}

- (_NSRange)focus
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  _NSRange result;

  -[BRLTEditStringInternal string](self->_underlyingObject, "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[BRLTEditStringInternal NSFocus](self->_underlyingObject, "NSFocus");
  v6 = BRLTJUnicharRangeForRange(v3, v4, v5);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.length = v10;
  result.location = v9;
  return result;
}

- (_NSRange)suggestion
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  _NSRange result;

  -[BRLTEditStringInternal string](self->_underlyingObject, "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[BRLTEditStringInternal NSSuggestion](self->_underlyingObject, "NSSuggestion");
  v6 = BRLTJUnicharRangeForRange(v3, v4, v5);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.length = v10;
  result.location = v9;
  return result;
}

- (id)appending:(id)a3
{
  id v4;
  BRLTEditString *v5;
  BRLTEditStringInternal *underlyingObject;
  void *v7;
  void *v8;
  BRLTEditString *v9;

  v4 = a3;
  v5 = [BRLTEditString alloc];
  underlyingObject = self->_underlyingObject;
  objc_msgSend(v4, "underlyingObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[BRLTEditStringInternal appending:](underlyingObject, "appending:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[BRLTEditString initWithUnderlyingObject:](v5, "initWithUnderlyingObject:", v8);

  return v9;
}

- (int64_t)tokenForLocation:(int64_t)a3
{
  BRLTEditStringInternal *underlyingObject;
  void *v5;
  int64_t v6;

  underlyingObject = self->_underlyingObject;
  -[BRLTEditStringInternal string](underlyingObject, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[BRLTEditStringInternal tokenForLocation:](underlyingObject, "tokenForLocation:", BRLTJIndexForUnicharIndex(v5, a3));

  return v6;
}

- (BRLTEditStringInternal)underlyingObject
{
  return (BRLTEditStringInternal *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingObject, 0);
}

@end
