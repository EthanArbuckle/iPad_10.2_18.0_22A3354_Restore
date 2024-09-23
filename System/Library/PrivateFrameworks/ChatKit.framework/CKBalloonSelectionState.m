@implementation CKBalloonSelectionState

- (CKBalloonSelectionState)initWithStyle:(int64_t)a3 textSelectionRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  CKBalloonSelectionState *result;
  objc_super v8;

  length = a4.length;
  location = a4.location;
  v8.receiver = self;
  v8.super_class = (Class)CKBalloonSelectionState;
  result = -[CKBalloonSelectionState init](&v8, sel_init);
  if (result)
  {
    result->_style = a3;
    result->_textSelectionRange.location = location;
    result->_textSelectionRange.length = length;
  }
  return result;
}

+ (id)balloonSelectionState:(int64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithStyle:textSelectionRange:", a3, 0, 0);
}

+ (id)balloonSelectionState:(int64_t)a3 textSelectionRange:(_NSRange)a4
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithStyle:textSelectionRange:", a3, a4.location, a4.length);
}

- (id)description
{
  void *v3;
  void *v4;
  int64_t style;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)CKBalloonSelectionState;
  -[CKBalloonSelectionState description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  style = self->_style;
  NSStringFromRange(self->_textSelectionRange);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: style: %ld, selection range: %@"), v4, style, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int64_t)style
{
  return self->_style;
}

- (_NSRange)textSelectionRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_textSelectionRange.length;
  location = self->_textSelectionRange.location;
  result.length = length;
  result.location = location;
  return result;
}

@end
