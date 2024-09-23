@implementation ICTTMutableParagraphStyle

+ (id)paragraphStyleNamed:(unsigned int)a3
{
  uint64_t v3;
  ICTTMutableParagraphStyle *v4;

  v3 = *(_QWORD *)&a3;
  v4 = objc_alloc_init(ICTTMutableParagraphStyle);
  -[ICTTParagraphStyle setStyle:](v4, "setStyle:", v3);
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ICTTParagraphStyle *v4;
  void *v5;
  void *v6;

  v4 = objc_alloc_init(ICTTParagraphStyle);
  -[ICTTParagraphStyle todo](self, "todo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTTParagraphStyle setTodo:](v4, "setTodo:", v5);

  -[ICTTParagraphStyle setStyle:](v4, "setStyle:", -[ICTTParagraphStyle style](self, "style"));
  -[ICTTParagraphStyle setAlignment:](v4, "setAlignment:", -[ICTTParagraphStyle alignment](self, "alignment"));
  -[ICTTParagraphStyle setWritingDirection:](v4, "setWritingDirection:", -[ICTTParagraphStyle writingDirection](self, "writingDirection"));
  -[ICTTParagraphStyle setIndent:](v4, "setIndent:", -[ICTTParagraphStyle indent](self, "indent"));
  -[ICTTParagraphStyle setBlockQuoteLevel:](v4, "setBlockQuoteLevel:", -[ICTTParagraphStyle blockQuoteLevel](self, "blockQuoteLevel"));
  -[ICTTParagraphStyle setStartingItemNumber:](v4, "setStartingItemNumber:", -[ICTTParagraphStyle startingItemNumber](self, "startingItemNumber"));
  -[ICTTParagraphStyle setHints:](v4, "setHints:", -[ICTTParagraphStyle hints](self, "hints"));
  -[ICTTParagraphStyle setNeedsParagraphCleanup:](v4, "setNeedsParagraphCleanup:", -[ICTTParagraphStyle needsParagraphCleanup](self, "needsParagraphCleanup"));
  -[ICTTParagraphStyle setNeedsListCleanup:](v4, "setNeedsListCleanup:", -[ICTTParagraphStyle needsListCleanup](self, "needsListCleanup"));
  -[ICTTParagraphStyle uuid](self, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTTParagraphStyle setUuid:](v4, "setUuid:", v6);

  return v4;
}

@end
