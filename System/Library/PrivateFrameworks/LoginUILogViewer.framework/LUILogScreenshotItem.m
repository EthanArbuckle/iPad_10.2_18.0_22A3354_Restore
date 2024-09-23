@implementation LUILogScreenshotItem

- (UIImage)screenshotImage
{
  return self->_screenshotImage;
}

- (void)setScreenshotImage:(id)a3
{
  objc_storeStrong((id *)&self->_screenshotImage, a3);
}

- (_NSRange)visibleRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_visibleRange.length;
  location = self->_visibleRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setVisibleRange:(_NSRange)a3
{
  self->_visibleRange = a3;
}

- (NSDate)screenshotDate
{
  return self->_screenshotDate;
}

- (void)setScreenshotDate:(id)a3
{
  objc_storeStrong((id *)&self->_screenshotDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_screenshotDate, 0);
  objc_storeStrong((id *)&self->_screenshotImage, 0);
}

@end
