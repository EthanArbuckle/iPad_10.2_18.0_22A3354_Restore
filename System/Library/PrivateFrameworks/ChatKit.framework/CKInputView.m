@implementation CKInputView

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  BOOL v5;
  uint64_t (*v6)(void);
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  -[CKInputView lastContentSize](self, "lastContentSize");
  v5 = v4 == *MEMORY[0x1E0C9D820] && v3 == *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (v5
    || (v6 = -[CKInputView lastContentSizeInterfaceOrientation](self, "lastContentSizeInterfaceOrientation"),
        v6 != CKNonFlatDeviceOrientation()))
  {
    -[CKInputView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    objc_msgSend((id)objc_opt_class(), "defaultContentSize");
    v10 = v9;
    v12 = v11;
    -[CKInputView setLastContentSize:](self, "setLastContentSize:");
    -[CKInputView setLastContentSizeInterfaceOrientation:](self, "setLastContentSizeInterfaceOrientation:", CKNonFlatDeviceOrientation());
    v7 = v10;
    v8 = v12;
  }
  else
  {
    -[CKInputView lastContentSize](self, "lastContentSize");
  }
  result.height = v8;
  result.width = v7;
  return result;
}

+ (CGSize)defaultContentSize
{
  double v2;
  double v3;
  CGSize result;

  objc_msgSend(a1, "defaultContentSizeLargerThanKeyboard:", 0);
  result.height = v3;
  result.width = v2;
  return result;
}

+ (CGSize)defaultContentSizeLargerThanKeyboard:(BOOL *)a3
{
  uint64_t (*v4)(void);
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  void *v10;
  double v11;
  double v12;
  BOOL v13;
  double v14;
  double v15;
  CGSize result;

  v4 = CKNonFlatDeviceOrientation();
  objc_msgSend(MEMORY[0x1E0CEA6C8], "sizeForInterfaceOrientation:ignoreInputView:", v4, 1);
  v6 = v5;
  if ((unint64_t)v4 - 1 > 1
    || (objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "userInterfaceIdiom"),
        v7,
        (v8 & 0xFFFFFFFFFFFFFFFBLL) == 1))
  {
    if (a3)
    {
      v9 = 0;
LABEL_11:
      *a3 = v9;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEAC18], "keyWindow");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "safeAreaInsets");
    v12 = v11 + 247.0;

    v13 = v12 <= v6;
    if (v12 >= v6)
      v6 = v12;
    if (a3)
    {
      v9 = !v13;
      goto LABEL_11;
    }
  }
  v14 = *MEMORY[0x1E0CEBDE0];
  v15 = v6;
  result.height = v15;
  result.width = v14;
  return result;
}

- (CGSize)lastContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_lastContentSize.width;
  height = self->_lastContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setLastContentSize:(CGSize)a3
{
  self->_lastContentSize = a3;
}

- (int64_t)lastContentSizeInterfaceOrientation
{
  return self->_lastContentSizeInterfaceOrientation;
}

- (void)setLastContentSizeInterfaceOrientation:(int64_t)a3
{
  self->_lastContentSizeInterfaceOrientation = a3;
}

@end
