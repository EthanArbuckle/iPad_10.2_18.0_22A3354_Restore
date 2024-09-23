@implementation CKBrowserDraggedSticker

- (CKBrowserDraggedSticker)initWithAnimatedImage:(id)a3 frame:(CGRect)a4 scale:(double)a5 rotationAngle:(double)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v14;
  CKBrowserDraggedSticker *v15;
  CKBrowserDraggedSticker *v16;
  objc_super v18;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v14 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CKBrowserDraggedSticker;
  v15 = -[CKBrowserDraggedSticker init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_animatedImage, a3);
    v16->_frame.origin.x = x;
    v16->_frame.origin.y = y;
    v16->_frame.size.width = width;
    v16->_frame.size.height = height;
    v16->_scale = a5;
    v16->_rotationAngle = a6;
  }

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;

  v4 = objc_alloc((Class)objc_opt_class());
  -[CKBrowserDraggedSticker animatedImage](self, "animatedImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKBrowserDraggedSticker frame](self, "frame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[CKBrowserDraggedSticker scale](self, "scale");
  v15 = v14;
  -[CKBrowserDraggedSticker rotationAngle](self, "rotationAngle");
  v17 = (void *)objc_msgSend(v4, "initWithAnimatedImage:frame:scale:rotationAngle:", v5, v7, v9, v11, v13, v15, v16);

  return v17;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  CGRect v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[CKBrowserDraggedSticker animatedImage](self, "animatedImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKBrowserDraggedSticker frame](self, "frame");
  NSStringFromCGRect(v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKBrowserDraggedSticker rotationAngle](self, "rotationAngle");
  v7 = v6;
  -[CKBrowserDraggedSticker scale](self, "scale");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<CKBrowserDraggedSticker animated image: %@, frame in window: %@, rotation: %f, scale: %f>"), v4, v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (CKAnimatedImage)animatedImage
{
  return self->_animatedImage;
}

- (CGRect)frame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_frame.origin.x;
  y = self->_frame.origin.y;
  width = self->_frame.size.width;
  height = self->_frame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (double)scale
{
  return self->_scale;
}

- (double)rotationAngle
{
  return self->_rotationAngle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animatedImage, 0);
}

@end
