@implementation CKNavBarCanvasSubviewLayout

+ (CKNavBarCanvasSubviewLayout)layoutWithTitleFrame:(double)a3 subtitleFrame:(double)a4 leftItemFrame:(double)a5 rightItemFrame:(double)a6 statusIndicatorFrame:(double)a7
{
  return objc_autoreleaseReturnValue(-[CKNavBarCanvasSubviewLayout initWithTitleFrame:subtitleFrame:leftItemFrame:rightItemFrame:statusIndicatorFrame:]([CKNavBarCanvasSubviewLayout alloc], "initWithTitleFrame:subtitleFrame:leftItemFrame:rightItemFrame:statusIndicatorFrame:", a1, a2, a3, a4, a5, a6, a7, a8, a17, a18, a19, a20, a21, a22, a23, a24,
             a25));
}

- (double)initWithTitleFrame:(double)a3 subtitleFrame:(double)a4 leftItemFrame:(double)a5 rightItemFrame:(double)a6 statusIndicatorFrame:(double)a7
{
  double *result;
  objc_super v37;

  v37.receiver = a1;
  v37.super_class = (Class)CKNavBarCanvasSubviewLayout;
  result = (double *)objc_msgSendSuper2(&v37, sel_init);
  if (result)
  {
    result[9] = a2;
    result[10] = a3;
    result[11] = a4;
    result[12] = a5;
    result[13] = a6;
    result[14] = a7;
    result[15] = a8;
    result[16] = a9;
    *((_QWORD *)result + 1) = a17;
    *((_QWORD *)result + 2) = a18;
    *((_QWORD *)result + 3) = a19;
    *((_QWORD *)result + 4) = a20;
    *((_QWORD *)result + 5) = a21;
    *((_QWORD *)result + 6) = a22;
    *((_QWORD *)result + 7) = a23;
    *((_QWORD *)result + 8) = a24;
    *((_QWORD *)result + 17) = a25;
    *((_QWORD *)result + 18) = a26;
    *((_QWORD *)result + 19) = a27;
    *((_QWORD *)result + 20) = a28;
  }
  return result;
}

- (CGRect)leftItemFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_leftItemFrame.origin.x;
  y = self->_leftItemFrame.origin.y;
  width = self->_leftItemFrame.size.width;
  height = self->_leftItemFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)rightItemFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_rightItemFrame.origin.x;
  y = self->_rightItemFrame.origin.y;
  width = self->_rightItemFrame.size.width;
  height = self->_rightItemFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)titleFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_titleFrame.origin.x;
  y = self->_titleFrame.origin.y;
  width = self->_titleFrame.size.width;
  height = self->_titleFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)subtitleFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_subtitleFrame.origin.x;
  y = self->_subtitleFrame.origin.y;
  width = self->_subtitleFrame.size.width;
  height = self->_subtitleFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)statusIndicatorFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_statusIndicatorFrame.origin.x;
  y = self->_statusIndicatorFrame.origin.y;
  width = self->_statusIndicatorFrame.size.width;
  height = self->_statusIndicatorFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

@end
