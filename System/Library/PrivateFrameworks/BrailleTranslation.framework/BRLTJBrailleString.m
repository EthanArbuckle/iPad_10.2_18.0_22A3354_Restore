@implementation BRLTJBrailleString

- (BRLTJBrailleString)initWithUnderlyingObject:(id)a3
{
  id v4;
  BRLTJBrailleString *v5;
  uint64_t v6;
  BRLTJBrailleStringInternal *underlyingObject;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BRLTJBrailleString;
  v5 = -[BRLTJBrailleString init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    underlyingObject = v5->_underlyingObject;
    v5->_underlyingObject = (BRLTJBrailleStringInternal *)v6;

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

- (_NSRange)NSStage
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
  v4 = -[BRLTJBrailleStringInternal NSStage](self->_underlyingObject, "NSStage");
  v6 = BRLTJUnicharRangeForRange(v3, v4, v5);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.length = v10;
  result.location = v9;
  return result;
}

- (NSString)stageSignalledString
{
  return -[BRLTJBrailleStringInternal stageSignalledString](self->_underlyingObject, "stageSignalledString");
}

- (BOOL)isStageEmpty
{
  return -[BRLTJBrailleStringInternal isStageEmpty](self->_underlyingObject, "isStageEmpty");
}

- (id)stageString
{
  return -[BRLTJBrailleStringInternal stageString](self->_underlyingObject, "stageString");
}

- (BRLTJBrailleStringInternal)underlyingObject
{
  return (BRLTJBrailleStringInternal *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingObject, 0);
}

@end
