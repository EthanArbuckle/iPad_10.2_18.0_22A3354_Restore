@implementation BNBannerSourceLayoutDescription

+ (id)bannerSourceLayoutDescriptionWithPresentationSize:(CGSize)a3 containerSize:(CGSize)a4
{
  return (id)objc_msgSend(a1, "bannerSourceLayoutDescriptionWithPresentationSize:containerSize:offsetFromPresentationEdge:", a3.width, a3.height, a4.width, a4.height, 8.0);
}

+ (id)bannerSourceLayoutDescriptionWithPresentationSize:(CGSize)a3 containerSize:(CGSize)a4 offsetFromPresentationEdge:(double)a5
{
  return -[BNBannerSourceLayoutDescription _initWithPresentationSize:containerSize:offsetFromPresentationEdge:]([BNBannerSourceLayoutDescription alloc], "_initWithPresentationSize:containerSize:offsetFromPresentationEdge:", a3.width, a3.height, a4.width, a4.height, a5);
}

- (id)_initWithPresentationSize:(CGSize)a3 containerSize:(CGSize)a4 offsetFromPresentationEdge:(double)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat v8;
  CGFloat v9;
  id result;
  objc_super v11;

  height = a4.height;
  width = a4.width;
  v8 = a3.height;
  v9 = a3.width;
  v11.receiver = self;
  v11.super_class = (Class)BNBannerSourceLayoutDescription;
  result = -[BNBannerSourceLayoutDescription init](&v11, sel_init);
  if (result)
  {
    *((CGFloat *)result + 4) = v9;
    *((CGFloat *)result + 5) = v8;
    *((CGFloat *)result + 2) = width;
    *((CGFloat *)result + 3) = height;
    *((double *)result + 1) = a5;
  }
  return result;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  NSStringFromCGSize(self->_presentationSize);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromCGSize(self->_containerSize);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; presentationSize: %@; containerSize: %@; offsetFromPresentationEdge: %f>"),
    v4,
    self,
    v5,
    v6,
    *(_QWORD *)&self->_offsetFromPresentationEdge);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  double width;
  double height;
  id v6;

  width = self->_presentationSize.width;
  height = self->_presentationSize.height;
  v6 = a3;
  objc_msgSend(v6, "encodeCGSize:forKey:", CFSTR("presentationSize"), width, height);
  objc_msgSend(v6, "encodeCGSize:forKey:", CFSTR("containerSize"), self->_containerSize.width, self->_containerSize.height);
  objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("offsetFromPresentationEdge"), self->_offsetFromPresentationEdge);

}

- (BNBannerSourceLayoutDescription)initWithBSXPCCoder:(id)a3
{
  id v4;
  BNBannerSourceLayoutDescription *v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  double v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BNBannerSourceLayoutDescription;
  v5 = -[BNBannerSourceLayoutDescription init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeCGSizeForKey:", CFSTR("presentationSize"));
    v5->_presentationSize.width = v6;
    v5->_presentationSize.height = v7;
    objc_msgSend(v4, "decodeCGSizeForKey:", CFSTR("containerSize"));
    v5->_containerSize.width = v8;
    v5->_containerSize.height = v9;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("offsetFromPresentationEdge"));
    v5->_offsetFromPresentationEdge = v10;
  }

  return v5;
}

- (CGSize)containerSize
{
  double width;
  double height;
  CGSize result;

  width = self->_containerSize.width;
  height = self->_containerSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)presentationSize
{
  double width;
  double height;
  CGSize result;

  width = self->_presentationSize.width;
  height = self->_presentationSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)offsetFromPresentationEdge
{
  return self->_offsetFromPresentationEdge;
}

@end
