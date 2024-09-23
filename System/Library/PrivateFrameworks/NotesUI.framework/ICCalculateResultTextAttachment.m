@implementation ICCalculateResultTextAttachment

- (NSString)expression
{
  void *v3;
  void *v4;
  void *v5;

  -[ICCalculateResultTextAttachment calculateDocumentController](self, "calculateDocumentController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAbstractTextAttachment attachment](self, "attachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "expressionStringForResultAttachment:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (_NSRange)expressionRangeInTextStorage
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  _NSRange result;

  -[ICCalculateResultTextAttachment calculateDocumentController](self, "calculateDocumentController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAbstractTextAttachment attachment](self, "attachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "expressionRangeForResultAttachment:", v4);
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.length = v9;
  result.location = v8;
  return result;
}

- (NSString)localizedError
{
  void *v3;
  void *v4;
  void *v5;

  -[ICCalculateResultTextAttachment calculateDocumentController](self, "calculateDocumentController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAbstractTextAttachment attachment](self, "attachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorStringForResultAttachment:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (id)calculateDocumentController
{
  void *v2;
  void *v3;
  void *v4;

  -[ICAbstractTextAttachment attachment](self, "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "note");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "calculateDocumentController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
