@implementation _NSMarkdownStringAttributeDescriptor

- (unint64_t)retainCount
{
  return -1;
}

- (id)attributeValueFromValue:(id)a3
{
  NSAttributedStringMarkdownParsingOptions *v4;
  NSAttributedString *v5;

  if (!_NSIsNSString())
    return 0;
  v4 = objc_alloc_init(NSAttributedStringMarkdownParsingOptions);
  -[NSAttributedStringMarkdownParsingOptions setInterpretedSyntax:](v4, "setInterpretedSyntax:", 2);
  v5 = -[NSAttributedString initWithMarkdownString:options:baseURL:error:]([NSAttributedString alloc], "initWithMarkdownString:options:baseURL:error:", a3, v4, 0, 0);

  return v5;
}

@end
