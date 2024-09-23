@implementation SCNMaterialAttachment

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SCNMaterialAttachment;
  -[SCNMaterialAttachment dealloc](&v3, sel_dealloc);
}

+ (id)materialAttachmentWithGLKTextureInfo:(id)a3
{
  return SCNTextureContentWithGLInfo(0, objc_msgSend(a3, "name"), objc_msgSend(a3, "target"), 0, (double)objc_msgSend(a3, "width"), (double)objc_msgSend(a3, "height"));
}

- (unsigned)glID
{
  return self->glID;
}

- (void)setGlID:(unsigned int)a3
{
  self->glID = a3;
}

- (unsigned)target
{
  return self->target;
}

- (void)setTarget:(unsigned int)a3
{
  self->target = a3;
}

- (void)context
{
  return self->context;
}

- (void)setContext:(void *)a3
{
  self->context = a3;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->size.width;
  height = self->size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->size = a3;
}

- (NSDictionary)options
{
  return self->options;
}

- (void)setOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

@end
