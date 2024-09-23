@implementation NTKLayoutRule

- (id)initForDevice:(id)a3
{
  id v5;
  NTKLayoutRule *v6;
  NTKLayoutRule *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NTKLayoutRule;
  v6 = -[NTKLayoutRule init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_device, a3);

  return v7;
}

+ (id)layoutRuleForDevice:(id)a3 withReferenceFrame:(CGRect)a4 horizontalLayout:(int64_t)a5 verticalLayout:(int64_t)a6
{
  return (id)objc_msgSend(a1, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:clip:", a3, a5, a6, 0, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

+ (id)layoutRuleForDevice:(id)a3 withReferenceFrame:(CGRect)a4 horizontalLayout:(int64_t)a5 verticalLayout:(int64_t)a6 clip:(BOOL)a7
{
  _BOOL8 v7;
  double height;
  double width;
  double y;
  double x;
  id v15;
  void *v16;

  v7 = a7;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v15 = a3;
  v16 = (void *)objc_msgSend(objc_alloc((Class)a1), "initForDevice:", v15);

  objc_msgSend(v16, "setReferenceFrame:", x, y, width, height);
  objc_msgSend(v16, "setHorizontalLayout:", a5);
  objc_msgSend(v16, "setVerticalLayout:", a6);
  objc_msgSend(v16, "setClipsToReferenceFrame:", v7);
  objc_msgSend(v16, "validate");
  return v16;
}

- (id)layoutRuleByConvertingToCoordinateSpaceWithFrame:(CGRect)a3
{
  double y;
  double x;
  void *v5;
  CGRect v7;
  CGRect v8;

  y = a3.origin.y;
  x = a3.origin.x;
  v5 = (void *)-[NTKLayoutRule copy](self, "copy", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_msgSend(v5, "referenceFrame");
  v8 = CGRectOffset(v7, -x, -y);
  objc_msgSend(v5, "setReferenceFrame:", v8.origin.x, v8.origin.y, v8.size.width, v8.size.height);
  return v5;
}

- (double)calculateLayoutFrameXOriginForBoundsSize:(CGSize)a3
{
  double width;
  double result;
  CGRect v6;

  width = a3.width;
  switch(-[NTKLayoutRule horizontalLayout](self, "horizontalLayout"))
  {
    case 0:
    case 3:
    case 4:
      -[NTKLayoutRule referenceFrame](self, "referenceFrame");
      break;
    case 1:
      -[NTKLayoutRule referenceFrame](self, "referenceFrame");
      CLKRectCenteredXInRectForDevice();
      break;
    case 2:
      -[NTKLayoutRule referenceFrame](self, "referenceFrame");
      result = CGRectGetMaxX(v6) - width;
      break;
    default:
      result = 0.0;
      break;
  }
  return result;
}

- (double)calculateLayoutFrameYOriginForBoundsSize:(CGSize)a3
{
  double height;
  double v5;
  double result;
  CGRect v7;

  height = a3.height;
  switch(-[NTKLayoutRule verticalLayout](self, "verticalLayout"))
  {
    case 0:
    case 3:
    case 4:
      -[NTKLayoutRule referenceFrame](self, "referenceFrame");
      goto LABEL_5;
    case 1:
      -[NTKLayoutRule referenceFrame](self, "referenceFrame");
      CLKRectCenteredYInRectForDevice();
LABEL_5:
      result = v5;
      break;
    case 2:
      -[NTKLayoutRule referenceFrame](self, "referenceFrame");
      result = CGRectGetMaxY(v7) - height;
      break;
    default:
      result = 0.0;
      break;
  }
  return result;
}

- (double)calculateLayoutFrameWidthForBoundsSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  unint64_t v7;
  double v8;
  double v9;

  height = a3.height;
  width = a3.width;
  if (-[NTKLayoutRule verticalLayout](self, "verticalLayout") == 4)
  {
    if (height != 0.0)
    {
      -[NTKLayoutRule referenceFrame](self, "referenceFrame");
      return width * (v6 / height);
    }
  }
  else
  {
    v7 = -[NTKLayoutRule horizontalLayout](self, "horizontalLayout");
    if (v7 >= 3)
    {
      if (v7 - 3 < 2)
      {
        -[NTKLayoutRule referenceFrame](self, "referenceFrame");
        return v9;
      }
    }
    else if (-[NTKLayoutRule clipsToReferenceFrame](self, "clipsToReferenceFrame"))
    {
      -[NTKLayoutRule referenceFrame](self, "referenceFrame");
      if (width > v8)
        return v8;
    }
  }
  return width;
}

- (double)calculateLayoutFrameHeightForBoundsSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  unint64_t v7;
  double v8;
  double v9;

  height = a3.height;
  width = a3.width;
  if (-[NTKLayoutRule horizontalLayout](self, "horizontalLayout") == 4)
  {
    if (width != 0.0)
    {
      -[NTKLayoutRule referenceFrame](self, "referenceFrame");
      return height * (v6 / width);
    }
  }
  else
  {
    v7 = -[NTKLayoutRule verticalLayout](self, "verticalLayout");
    if (v7 >= 3)
    {
      if (v7 - 3 < 2)
      {
        -[NTKLayoutRule referenceFrame](self, "referenceFrame");
        return v9;
      }
    }
    else if (-[NTKLayoutRule clipsToReferenceFrame](self, "clipsToReferenceFrame"))
    {
      -[NTKLayoutRule referenceFrame](self, "referenceFrame");
      if (height > v8)
        return v8;
    }
  }
  return height;
}

- (CGRect)calculateLayoutFrameForBoundsSize:(CGSize)a3
{
  double height;
  double width;
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
  CGRect result;

  height = a3.height;
  width = a3.width;
  -[NTKLayoutRule validate](self, "validate");
  -[NTKLayoutRule calculateLayoutFrameWidthForBoundsSize:](self, "calculateLayoutFrameWidthForBoundsSize:", width, height);
  v7 = v6;
  -[NTKLayoutRule calculateLayoutFrameHeightForBoundsSize:](self, "calculateLayoutFrameHeightForBoundsSize:", width, height);
  v9 = v8;
  -[NTKLayoutRule calculateLayoutFrameXOriginForBoundsSize:](self, "calculateLayoutFrameXOriginForBoundsSize:", v7, v8);
  v11 = v10;
  -[NTKLayoutRule calculateLayoutFrameYOriginForBoundsSize:](self, "calculateLayoutFrameYOriginForBoundsSize:", v7, v9);
  v13 = v12;
  v14 = v11;
  v15 = v7;
  v16 = v9;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v13;
  result.origin.x = v14;
  return result;
}

- (CGSize)maximumSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  if (-[NTKLayoutRule clipsToReferenceFrame](self, "clipsToReferenceFrame"))
  {
    -[NTKLayoutRule referenceFrame](self, "referenceFrame");
    v4 = v3;
    v6 = v5;
  }
  else
  {
    v4 = 1.79769313e308;
    v6 = 1.79769313e308;
  }
  result.height = v6;
  result.width = v4;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  int64_t v17;
  int64_t v18;
  _BOOL4 v19;
  int v20;
  CGRect v22;
  CGRect v23;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_6;
  -[NTKLayoutRule referenceFrame](self, "referenceFrame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(v4, "referenceFrame");
  v23.origin.x = v13;
  v23.origin.y = v14;
  v23.size.width = v15;
  v23.size.height = v16;
  v22.origin.x = v6;
  v22.origin.y = v8;
  v22.size.width = v10;
  v22.size.height = v12;
  if (!CGRectEqualToRect(v22, v23))
    goto LABEL_6;
  v17 = -[NTKLayoutRule horizontalLayout](self, "horizontalLayout");
  if (v17 == objc_msgSend(v4, "horizontalLayout")
    && (v18 = -[NTKLayoutRule verticalLayout](self, "verticalLayout"), v18 == objc_msgSend(v4, "verticalLayout")))
  {
    v19 = -[NTKLayoutRule clipsToReferenceFrame](self, "clipsToReferenceFrame");
    v20 = v19 ^ objc_msgSend(v4, "clipsToReferenceFrame") ^ 1;
  }
  else
  {
LABEL_6:
    LOBYTE(v20) = 0;
  }

  return v20;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", self->_referenceFrame.origin.x, self->_referenceFrame.origin.y, self->_referenceFrame.size.width, self->_referenceFrame.size.height);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash")
     + 32 * self->_horizontalLayout
     + (self->_verticalLayout << 10)
     + ((unint64_t)self->_clipsToReferenceFrame << 15);

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[NTKLayoutRule referenceFrame](self, "referenceFrame");
  objc_msgSend(v4, "setReferenceFrame:");
  objc_msgSend(v4, "setHorizontalLayout:", -[NTKLayoutRule horizontalLayout](self, "horizontalLayout"));
  objc_msgSend(v4, "setVerticalLayout:", -[NTKLayoutRule verticalLayout](self, "verticalLayout"));
  objc_msgSend(v4, "setClipsToReferenceFrame:", -[NTKLayoutRule clipsToReferenceFrame](self, "clipsToReferenceFrame"));
  return v4;
}

- (void)validate
{
  int64_t v3;
  int64_t v4;
  int64_t v5;
  int64_t v6;
  const __CFString *v7;
  int64_t v8;
  int64_t v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;
  NSObject *v13;
  int64_t v14;
  const __CFString *v15;
  const __CFString *v16;
  void *v17;
  NSObject *v18;
  int64_t v19;
  const __CFString *v20;
  void *v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = -[NTKLayoutRule horizontalLayout](self, "horizontalLayout");
  v4 = -[NTKLayoutRule verticalLayout](self, "verticalLayout");
  if (v3 == 4)
  {
    if ((unint64_t)(v4 - 3) > 1)
      return;
    v5 = -[NTKLayoutRule verticalLayout](self, "verticalLayout");
    v6 = -[NTKLayoutRule horizontalLayout](self, "horizontalLayout");
    if ((unint64_t)(v5 - 1) > 3)
      v7 = CFSTR("NTKLayoutMin");
    else
      v7 = off_1E6BD0878[v5 - 1];
    if ((unint64_t)(v6 - 1) > 3)
      v11 = CFSTR("NTKLayoutMin");
    else
      v11 = off_1E6BD0878[v6 - 1];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("*** Error in <NTKLayoutRule %p>: %@ for verticalLayout does not make sense when horizontalLayout is %@."), self, v7, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    _NTKLoggingObjectForDomain(0, (uint64_t)"NTKLoggingDomainDefault");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = -[NTKLayoutRule verticalLayout](self, "verticalLayout");
      if ((unint64_t)(v14 - 1) > 3)
        v15 = CFSTR("NTKLayoutMin");
      else
        v15 = off_1E6BD0878[v14 - 1];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Breaking verticalLayout by resetting %@ to NTKLayoutMin"), v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v23 = v12;
      v24 = 2112;
      v25 = v17;
      _os_log_impl(&dword_1B72A3000, v13, OS_LOG_TYPE_DEFAULT, "%@ %@", buf, 0x16u);

    }
    -[NTKLayoutRule setVerticalLayout:](self, "setVerticalLayout:", 0);
    goto LABEL_29;
  }
  if (v4 == 4 && (unint64_t)(-[NTKLayoutRule horizontalLayout](self, "horizontalLayout") - 3) <= 1)
  {
    v8 = -[NTKLayoutRule horizontalLayout](self, "horizontalLayout");
    v9 = -[NTKLayoutRule verticalLayout](self, "verticalLayout");
    if ((unint64_t)(v8 - 1) > 3)
      v10 = CFSTR("NTKLayoutMin");
    else
      v10 = off_1E6BD0878[v8 - 1];
    if ((unint64_t)(v9 - 1) > 3)
      v16 = CFSTR("NTKLayoutMin");
    else
      v16 = off_1E6BD0878[v9 - 1];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("*** Error in <NTKLayoutRule %p>: %@ for horizontalLayout does not make sense when verticalLayout is %@."), self, v10, v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    _NTKLoggingObjectForDomain(0, (uint64_t)"NTKLoggingDomainDefault");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = -[NTKLayoutRule horizontalLayout](self, "horizontalLayout");
      if ((unint64_t)(v19 - 1) > 3)
        v20 = CFSTR("NTKLayoutMin");
      else
        v20 = off_1E6BD0878[v19 - 1];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Breaking horizontalLayout by resetting %@ to NTKLayoutMin"), v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v23 = v12;
      v24 = 2112;
      v25 = v21;
      _os_log_impl(&dword_1B72A3000, v18, OS_LOG_TYPE_DEFAULT, "%@ %@", buf, 0x16u);

    }
    -[NTKLayoutRule setHorizontalLayout:](self, "setHorizontalLayout:", 0);
LABEL_29:

  }
}

- (id)description
{
  void *v3;
  void *v4;
  unint64_t v5;
  const __CFString *v6;
  unint64_t v7;
  const __CFString *v8;
  _BOOL4 v9;
  const __CFString *v10;
  void *v11;
  CGRect v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[NTKLayoutRule referenceFrame](self, "referenceFrame");
  NSStringFromCGRect(v13);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[NTKLayoutRule horizontalLayout](self, "horizontalLayout") - 1;
  if (v5 > 3)
    v6 = CFSTR("NTKLayoutMin");
  else
    v6 = off_1E6BD0878[v5];
  v7 = -[NTKLayoutRule verticalLayout](self, "verticalLayout") - 1;
  if (v7 > 3)
    v8 = CFSTR("NTKLayoutMin");
  else
    v8 = off_1E6BD0878[v7];
  v9 = -[NTKLayoutRule clipsToReferenceFrame](self, "clipsToReferenceFrame");
  v10 = CFSTR("no");
  if (v9)
    v10 = CFSTR("yes");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@] h:%@ v:%@ clip:%@"), v4, v6, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (CLKDevice)device
{
  return self->_device;
}

- (CGRect)referenceFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_referenceFrame.origin.x;
  y = self->_referenceFrame.origin.y;
  width = self->_referenceFrame.size.width;
  height = self->_referenceFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setReferenceFrame:(CGRect)a3
{
  self->_referenceFrame = a3;
}

- (int64_t)horizontalLayout
{
  return self->_horizontalLayout;
}

- (void)setHorizontalLayout:(int64_t)a3
{
  self->_horizontalLayout = a3;
}

- (int64_t)verticalLayout
{
  return self->_verticalLayout;
}

- (void)setVerticalLayout:(int64_t)a3
{
  self->_verticalLayout = a3;
}

- (BOOL)clipsToReferenceFrame
{
  return self->_clipsToReferenceFrame;
}

- (void)setClipsToReferenceFrame:(BOOL)a3
{
  self->_clipsToReferenceFrame = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
}

@end
