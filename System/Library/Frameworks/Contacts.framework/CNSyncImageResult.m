@implementation CNSyncImageResult

- (CNSyncImageResult)initWithType:(unint64_t)a3 imageData:(id)a4 cropRect:(CGRect)a5 imageHash:(id)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v14;
  id v15;
  CNSyncImageResult *v16;
  CNSyncImageResult *v17;
  CNSyncImageResult *v18;
  objc_super v20;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v14 = a4;
  v15 = a6;
  v20.receiver = self;
  v20.super_class = (Class)CNSyncImageResult;
  v16 = -[CNSyncImageResult init](&v20, sel_init);
  v17 = v16;
  if (v16)
  {
    v16->_type = a3;
    objc_storeStrong((id *)&v16->_imageData, a4);
    v17->_cropRect.origin.x = x;
    v17->_cropRect.origin.y = y;
    v17->_cropRect.size.width = width;
    v17->_cropRect.size.height = height;
    objc_storeStrong((id *)&v17->_imageHash, a6);
    v18 = v17;
  }

  return v17;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSData)imageData
{
  return self->_imageData;
}

- (CGRect)cropRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_cropRect.origin.x;
  y = self->_cropRect.origin.y;
  width = self->_cropRect.size.width;
  height = self->_cropRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (NSData)imageHash
{
  return self->_imageHash;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageHash, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
}

@end
