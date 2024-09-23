@implementation CUIRenditionSliceInformation

- (CUIRenditionSliceInformation)initWithRenditionType:(int64_t)a3 destinationRect:(CGRect)a4 topLeftInset:(CGSize)a5 bottomRightInset:(CGSize)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat v8;
  CGFloat v9;
  double v10;
  double v11;
  double y;
  double x;
  CUIRenditionSliceInformation *result;
  objc_super v16;

  height = a6.height;
  width = a6.width;
  v8 = a5.height;
  v9 = a5.width;
  v10 = a4.size.height;
  v11 = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v16.receiver = self;
  v16.super_class = (Class)CUIRenditionSliceInformation;
  result = -[CUIRenditionSliceInformation init](&v16, sel_init);
  if (result)
  {
    result->_destinationRect.origin.x = x;
    result->_destinationRect.origin.y = y;
    result->_destinationRect.size.width = v11;
    result->_destinationRect.size.height = v10;
    result->_renditionType = a3;
    if ((unint64_t)(a3 - 1000) > 0x12 || a3 == 1003)
    {
      switch(a3)
      {
        case -1:
        case 0:
        case 4:
        case 5:
        case 6:
        case 7:
        case 8:
        case 9:
          goto LABEL_5;
        case 1:
          height = 0.0;
          v8 = 0.0;
          break;
        case 2:
          width = 0.0;
          v9 = 0.0;
          break;
        default:
          break;
      }
    }
    else
    {
LABEL_5:
      width = NSZeroSize.width;
      height = NSZeroSize.height;
      v9 = NSZeroSize.width;
      v8 = height;
    }
    result->_boundaries[0] = x + v9;
    result->_boundaries[1] = y + height;
    result->_boundaries[2] = x + v11 - width;
    result->_boundaries[3] = y + v10 - v8;
    result->_edgeInsets.top = v8;
    result->_edgeInsets.left = v9;
    result->_edgeInsets.bottom = height;
    result->_edgeInsets.right = width;
  }
  return result;
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)edgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  $01BB1521EC52D44A8E7628F5261DCEC8 result;

  top = self->_edgeInsets.top;
  left = self->_edgeInsets.left;
  bottom = self->_edgeInsets.bottom;
  right = self->_edgeInsets.right;
  result.var3 = right;
  result.var2 = bottom;
  result.var1 = left;
  result.var0 = top;
  return result;
}

- (CUIRenditionSliceInformation)initWithSliceInformation:(id)a3 destinationRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  objc_msgSend(a3, "destinationRect");
  v11 = v10;
  v13 = v12;
  objc_msgSend(a3, "_topLeftCapSize");
  v15 = v14;
  v17 = v16;
  objc_msgSend(a3, "_bottomRightCapSize");
  v20 = v18;
  v21 = v19;
  if (v15 + v18 > width)
  {
    v15 = width * v15 / v11;
    v20 = width * v18 / v11;
  }
  if (v17 + v19 > height)
  {
    v17 = height * v17 / v13;
    v21 = height * v19 / v13;
  }
  return -[CUIRenditionSliceInformation initWithRenditionType:destinationRect:topLeftInset:bottomRightInset:](self, "initWithRenditionType:destinationRect:topLeftInset:bottomRightInset:", *((_QWORD *)a3 + 1), x, y, width, height, v15, v17, v20, v21);
}

- (CGSize)_topLeftCapSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = self->_boundaries[0] - self->_destinationRect.origin.x;
  v3 = self->_destinationRect.origin.y + self->_destinationRect.size.height - self->_boundaries[3];
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)_bottomRightCapSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = self->_destinationRect.origin.x + self->_destinationRect.size.width - self->_boundaries[2];
  v3 = self->_boundaries[1] - self->_destinationRect.origin.y;
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)positionOfSliceBoundary:(unint64_t)a3
{
  double result;

  result = 0.0;
  if (a3 <= 3)
    return self->_boundaries[a3];
  return result;
}

- (id)description
{
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CUIRenditionSliceInformation;
  v3 = -[CUIRenditionSliceInformation description](&v5, sel_description);
  return objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" %@, destination: %@, min x: %f, min y: %f, max x: %f, max y: %f"), +[CUIThemeRendition displayNameForRenditionType:](CUIThemeRendition, "displayNameForRenditionType:", self->_renditionType), NSStringFromRect(self->_destinationRect), *(_QWORD *)&self->_boundaries[0], *(_QWORD *)&self->_boundaries[1], *(_QWORD *)&self->_boundaries[2], *(_QWORD *)&self->_boundaries[3]);
}

- (int64_t)renditionType
{
  return self->_renditionType;
}

- (CGRect)destinationRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_destinationRect.origin.x;
  y = self->_destinationRect.origin.y;
  width = self->_destinationRect.size.width;
  height = self->_destinationRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

@end
