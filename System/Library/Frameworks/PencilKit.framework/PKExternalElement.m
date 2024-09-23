@implementation PKExternalElement

- (PKExternalElement)initWithIdentifier:(id)a3 path:(CGPath *)a4
{
  id v7;
  PKExternalElement *v8;
  PKExternalElement *v9;

  v7 = a3;
  v8 = -[PKExternalElement init](self, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong(&v8->_identifier, a3);
    v9->_path = (CGPath *)MEMORY[0x1C3B7EE7C](a4);
    v9->_boundingBox = CGPathGetBoundingBox(a4);
  }

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  CGPathRelease(self->_path);
  v3.receiver = self;
  v3.super_class = (Class)PKExternalElement;
  -[PKExternalElement dealloc](&v3, sel_dealloc);
}

- (CGRect)boundingBox
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_boundingBox.origin.x;
  y = self->_boundingBox.origin.y;
  width = self->_boundingBox.size.width;
  height = self->_boundingBox.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[PKExternalElement identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  PKExternalElement *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (PKExternalElement *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[PKExternalElement identifier](self, "identifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKExternalElement identifier](v4, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqual:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (id)identifier
{
  return self->_identifier;
}

- (CGPath)path
{
  return self->_path;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_identifier, 0);
}

@end
