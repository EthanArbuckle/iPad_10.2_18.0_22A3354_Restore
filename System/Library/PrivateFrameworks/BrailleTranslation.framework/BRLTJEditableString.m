@implementation BRLTJEditableString

- (BRLTJEditableString)init
{
  return -[BRLTJEditableString initWithString:selection:focus:token:suggestion:](self, "initWithString:selection:focus:token:suggestion:", &stru_24CBF1330, 0x7FFFFFFFFFFFFFFFLL, 0, 0x7FFFFFFFFFFFFFFFLL, 0, 0, 0x7FFFFFFFFFFFFFFFLL, 0);
}

- (BRLTJEditableString)initWithString:(id)a3 selection:(_NSRange)a4 focus:(_NSRange)a5 token:(int64_t)a6
{
  return -[BRLTJEditableString initWithString:selection:focus:token:suggestion:](self, "initWithString:selection:focus:token:suggestion:", a3, a4.location, a4.length, a5.location, a5.length, a6, 0x7FFFFFFFFFFFFFFFLL, 0);
}

- (BRLTJEditableString)initWithString:(id)a3 selection:(_NSRange)a4 focus:(_NSRange)a5 token:(int64_t)a6 suggestion:(_NSRange)a7
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v10;
  NSUInteger v11;
  id v13;
  BRLTJEditableString *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  BRLTJEditableStringInternal *v23;
  BRLTJEditableStringInternal *underlyingObject;
  objc_super v26;

  length = a5.length;
  location = a5.location;
  v10 = a4.length;
  v11 = a4.location;
  v13 = a3;
  v26.receiver = self;
  v26.super_class = (Class)BRLTJEditableString;
  v14 = -[BRLTJEditableString init](&v26, sel_init);
  if (v14)
  {
    v15 = BRLTJRangeForUnicharRange(v13, v11, v10);
    v17 = v16;
    v18 = BRLTJRangeForUnicharRange(v13, location, length);
    v20 = v19;
    v21 = BRLTJRangeForUnicharRange(v13, a7.location, a7.length);
    v23 = -[BRLTJEditableStringInternal initWithString:selection:focus:token:suggestion:]([BRLTJEditableStringInternal alloc], "initWithString:selection:focus:token:suggestion:", v13, v15, v17, v18, v20, a6, v21, v22);
    underlyingObject = v14->_underlyingObject;
    v14->_underlyingObject = v23;

  }
  return v14;
}

- (BRLTJEditableString)initWithUnderlyingObject:(id)a3
{
  id v4;
  BRLTJEditableString *v5;
  uint64_t v6;
  BRLTJEditableStringInternal *underlyingObject;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BRLTJEditableString;
  v5 = -[BRLTJEditableString init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    underlyingObject = v5->_underlyingObject;
    v5->_underlyingObject = (BRLTJEditableStringInternal *)v6;

  }
  return v5;
}

- (NSString)string
{
  return -[BRLTJEditableStringInternal string](self->_underlyingObject, "string");
}

- (_NSRange)NSSelection
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

  -[BRLTJEditableStringInternal string](self->_underlyingObject, "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[BRLTJEditableStringInternal NSSelection](self->_underlyingObject, "NSSelection");
  v6 = BRLTJUnicharRangeForRange(v3, v4, v5);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.length = v10;
  result.location = v9;
  return result;
}

- (_NSRange)NSFocus
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

  -[BRLTJEditableStringInternal string](self->_underlyingObject, "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[BRLTJEditableStringInternal NSFocus](self->_underlyingObject, "NSFocus");
  v6 = BRLTJUnicharRangeForRange(v3, v4, v5);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.length = v10;
  result.location = v9;
  return result;
}

- (_NSRange)NSSuggestion
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

  -[BRLTJEditableStringInternal string](self->_underlyingObject, "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[BRLTJEditableStringInternal NSSuggestion](self->_underlyingObject, "NSSuggestion");
  v6 = BRLTJUnicharRangeForRange(v3, v4, v5);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.length = v10;
  result.location = v9;
  return result;
}

- (void)append:(id)a3
{
  BRLTJEditableStringInternal *underlyingObject;
  id v4;

  underlyingObject = self->_underlyingObject;
  objc_msgSend(a3, "underlyingObject");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[BRLTJEditableStringInternal append:](underlyingObject, "append:", v4);

}

- (int64_t)tokenForLocation:(int64_t)a3
{
  return -[BRLTJEditableStringInternal tokenForLocation:](self->_underlyingObject, "tokenForLocation:", a3);
}

- (BRLTJEditableStringInternal)underlyingObject
{
  return (BRLTJEditableStringInternal *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingObject, 0);
}

@end
