@implementation ICSearchQuerySegment

- (ICSearchQuerySegment)initWithSegmentString:(id)a3 range:(_NSRange)a4 type:(unint64_t)a5 isExpandable:(BOOL)a6
{
  NSUInteger length;
  NSUInteger location;
  id v12;
  ICSearchQuerySegment *v13;
  ICSearchQuerySegment *v14;
  objc_super v16;

  length = a4.length;
  location = a4.location;
  v12 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ICSearchQuerySegment;
  v13 = -[ICSearchQuerySegment init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_segmentString, a3);
    v14->_segmentRange.location = location;
    v14->_segmentRange.length = length;
    v14->_type = a5;
    v14->_isExpandable = a6;
  }

  return v14;
}

- (id)description
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  const __CFString *v8;
  void *v9;
  NSRange v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[ICSearchQuerySegment type](self, "type");
  -[ICSearchQuerySegment segmentString](self, "segmentString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11.location = -[ICSearchQuerySegment segmentRange](self, "segmentRange");
  NSStringFromRange(v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ICSearchQuerySegment isExpandable](self, "isExpandable");
  v8 = &stru_1E76DB108;
  if (v7)
    v8 = CFSTR("expandable");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("type=%lu: %@ @ %@, %@"), v4, v5, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)segmentString
{
  return self->_segmentString;
}

- (void)setSegmentString:(id)a3
{
  objc_storeStrong((id *)&self->_segmentString, a3);
}

- (_NSRange)segmentRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_segmentRange.length;
  location = self->_segmentRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setSegmentRange:(_NSRange)a3
{
  self->_segmentRange = a3;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (BOOL)isExpandable
{
  return self->_isExpandable;
}

- (void)setIsExpandable:(BOOL)a3
{
  self->_isExpandable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segmentString, 0);
}

@end
