@implementation AKFormFeature

+ (id)featureWithRect:(CGRect)a3 onPage:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  void *v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithRect:onPage:", v9, x, y, width, height);

  return v10;
}

- (AKFormFeature)initWithRect:(CGRect)a3 onPage:(id)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v9;
  AKFormFeature *v10;
  AKFormFeature *v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)AKFormFeature;
  v10 = -[AKFormFeature init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_rect.origin.x = x;
    v10->_rect.origin.y = y;
    v10->_rect.size.width = width;
    v10->_rect.size.height = height;
    objc_storeWeak((id *)&v10->_page, v9);
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  CGSize size;
  id WeakRetained;

  v4 = objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  size = self->_rect.size;
  *(CGPoint *)(v4 + 16) = self->_rect.origin;
  *(CGSize *)(v4 + 32) = size;
  WeakRetained = objc_loadWeakRetained((id *)&self->_page);
  objc_storeWeak((id *)(v4 + 8), WeakRetained);

  return (id)v4;
}

- (id)description
{
  void *v3;
  id WeakRetained;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_page);
  objc_msgSend(v3, "appendFormat:", CFSTR("frame = (%g %g; %g %g); "),
    *(_QWORD *)&self->_rect.origin.x,
    *(_QWORD *)&self->_rect.origin.y,
    *(_QWORD *)&self->_rect.size.width,
    *(_QWORD *)&self->_rect.size.height);
  objc_msgSend(v3, "appendFormat:", CFSTR("page = %@>"), WeakRetained);

  return v3;
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

- (AKPageController)page
{
  return (AKPageController *)objc_loadWeakRetained((id *)&self->_page);
}

- (void)setPage:(id)a3
{
  objc_storeWeak((id *)&self->_page, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_page);
}

@end
