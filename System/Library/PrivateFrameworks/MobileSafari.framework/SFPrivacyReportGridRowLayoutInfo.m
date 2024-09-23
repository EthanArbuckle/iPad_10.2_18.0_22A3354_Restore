@implementation SFPrivacyReportGridRowLayoutInfo

- (SFPrivacyReportGridRowLayoutInfo)initWithRow:(int64_t)a3 itemRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  SFPrivacyReportGridRowLayoutInfo *v7;
  SFPrivacyReportGridRowLayoutInfo *v8;
  SFPrivacyReportGridRowLayoutInfo *v9;
  objc_super v11;

  length = a4.length;
  location = a4.location;
  v11.receiver = self;
  v11.super_class = (Class)SFPrivacyReportGridRowLayoutInfo;
  v7 = -[SFPrivacyReportGridRowLayoutInfo init](&v11, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_row = a3;
    v7->_itemRange.location = location;
    v7->_itemRange.length = length;
    v9 = v7;
  }

  return v8;
}

- (int64_t)row
{
  return self->_row;
}

- (_NSRange)itemRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_itemRange.length;
  location = self->_itemRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (double)height
{
  return self->_height;
}

- (void)setHeight:(double)a3
{
  self->_height = a3;
}

@end
