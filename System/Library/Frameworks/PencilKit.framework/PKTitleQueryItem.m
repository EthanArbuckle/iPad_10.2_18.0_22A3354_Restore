@implementation PKTitleQueryItem

- (PKTitleQueryItem)initWithTranscribedTitle:(id)a3 bounds:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  NSString *v9;
  PKTitleQueryItem *v10;
  NSString *transcribedTitle;
  objc_super v13;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = (NSString *)a3;
  v13.receiver = self;
  v13.super_class = (Class)PKTitleQueryItem;
  v10 = -[PKTitleQueryItem init](&v13, sel_init);
  transcribedTitle = v10->_transcribedTitle;
  v10->_transcribedTitle = v9;

  v10->_bounds.origin.x = x;
  v10->_bounds.origin.y = y;
  v10->_bounds.size.width = width;
  v10->_bounds.size.height = height;
  return v10;
}

- (NSString)transcribedTitle
{
  return self->_transcribedTitle;
}

- (CGRect)bounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_bounds.origin.x;
  y = self->_bounds.origin.y;
  width = self->_bounds.size.width;
  height = self->_bounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transcribedTitle, 0);
}

@end
