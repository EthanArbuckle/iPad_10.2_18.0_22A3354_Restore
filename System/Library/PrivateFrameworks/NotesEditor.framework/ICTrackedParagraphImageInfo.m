@implementation ICTrackedParagraphImageInfo

- (ICTrackedParagraph)trackedParagraph
{
  return self->_trackedParagraph;
}

- (void)setTrackedParagraph:(id)a3
{
  objc_storeStrong((id *)&self->_trackedParagraph, a3);
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (CGRect)boundingRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_boundingRect.origin.x;
  y = self->_boundingRect.origin.y;
  width = self->_boundingRect.size.width;
  height = self->_boundingRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setBoundingRect:(CGRect)a3
{
  self->_boundingRect = a3;
}

- (CGRect)rect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_rect.origin.x;
  y = self->_rect.origin.y;
  width = self->_rect.size.width;
  height = self->_rect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setRect:(CGRect)a3
{
  self->_rect = a3;
}

- (UIImageView)imageViewIfExists
{
  return self->_imageViewIfExists;
}

- (void)setImageViewIfExists:(id)a3
{
  objc_storeStrong((id *)&self->_imageViewIfExists, a3);
}

- (BOOL)estimated
{
  return self->_estimated;
}

- (void)setEstimated:(BOOL)a3
{
  self->_estimated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageViewIfExists, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_trackedParagraph, 0);
}

@end
