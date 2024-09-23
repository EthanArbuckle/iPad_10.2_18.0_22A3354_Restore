@implementation ICAttributionViewHighlightConfiguration

- (ICAttributionViewHighlightConfiguration)init
{
  ICAttributionViewHighlightConfiguration *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICAttributionViewHighlightConfiguration;
  result = -[ICAttributionViewHighlightConfiguration init](&v3, sel_init);
  if (result)
    result->_alpha = 1.0;
  return result;
}

- (BOOL)isEqualToICAttributionViewHighlightConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  void *v19;
  void *v20;
  char v21;
  CGRect v23;
  CGRect v24;

  v4 = a3;
  -[ICAttributionViewHighlightConfiguration identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "isEqualToString:", v6))
    goto LABEL_4;
  -[ICAttributionViewHighlightConfiguration frame](self, "frame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  objc_msgSend(v4, "frame");
  v24.origin.x = v15;
  v24.origin.y = v16;
  v24.size.width = v17;
  v24.size.height = v18;
  v23.origin.x = v8;
  v23.origin.y = v10;
  v23.size.width = v12;
  v23.size.height = v14;
  if (CGRectEqualToRect(v23, v24))
  {
    -[ICAttributionViewHighlightConfiguration color](self, "color");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "color");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

  }
  else
  {
LABEL_4:
    v21 = 0;
  }

  return v21;
}

- (BOOL)isEqual:(id)a3
{
  ICAttributionViewHighlightConfiguration *v4;
  ICAttributionViewHighlightConfiguration *v5;
  BOOL v6;

  v4 = (ICAttributionViewHighlightConfiguration *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ICAttributionViewHighlightConfiguration isEqualToICAttributionViewHighlightConfiguration:](self, "isEqualToICAttributionViewHighlightConfiguration:", v5);

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;

  -[ICAttributionViewHighlightConfiguration identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[ICAttributionViewHighlightConfiguration color](self, "color");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");
  v14 = ICHashWithHashKeys(v4, v7, v8, v9, v10, v11, v12, v13, v6);

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ICAttributionViewHighlightConfiguration *v4;
  void *v5;
  void *v6;

  v4 = -[ICAttributionViewHighlightConfiguration init](+[ICAttributionViewHighlightConfiguration allocWithZone:](ICAttributionViewHighlightConfiguration, "allocWithZone:", a3), "init");
  -[ICAttributionViewHighlightConfiguration identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttributionViewHighlightConfiguration setIdentifier:](v4, "setIdentifier:", v5);

  -[ICAttributionViewHighlightConfiguration frame](self, "frame");
  -[ICAttributionViewHighlightConfiguration setFrame:](v4, "setFrame:");
  -[ICAttributionViewHighlightConfiguration frame](self, "frame");
  -[ICAttributionViewHighlightConfiguration setAdjustedFrame:](v4, "setAdjustedFrame:");
  -[ICAttributionViewHighlightConfiguration alpha](self, "alpha");
  -[ICAttributionViewHighlightConfiguration setAlpha:](v4, "setAlpha:");
  -[ICAttributionViewHighlightConfiguration color](self, "color");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttributionViewHighlightConfiguration setColor:](v4, "setColor:", v6);

  return v4;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
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

- (void)setFrame:(CGRect)a3
{
  self->_frame = a3;
}

- (CGRect)adjustedFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_adjustedFrame.origin.x;
  y = self->_adjustedFrame.origin.y;
  width = self->_adjustedFrame.size.width;
  height = self->_adjustedFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setAdjustedFrame:(CGRect)a3
{
  self->_adjustedFrame = a3;
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (double)alpha
{
  return self->_alpha;
}

- (void)setAlpha:(double)a3
{
  self->_alpha = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
