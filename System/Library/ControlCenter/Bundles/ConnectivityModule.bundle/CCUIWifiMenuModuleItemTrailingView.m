@implementation CCUIWifiMenuModuleItemTrailingView

- (CGSize)_subview:(id)a3 sizeThatFits:(CGSize)a4
{
  double v4;
  double v5;
  CGAffineTransform v6;
  CGSize result;

  objc_msgSend_sizeThatFits_(a3, a2, (uint64_t)a3, a4.width, a4.height);
  CGAffineTransformMakeScale(&v6, 0.5, 0.5);
  UISizeRoundToScale();
  result.height = v5;
  result.width = v4;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  uint64_t v3;
  double height;
  double width;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  uint64_t i;
  double v16;
  const char *v17;
  uint64_t v18;
  double v19;
  double v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v26 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_subviews(self, a2, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v21, v25, 16);
  if (v9)
  {
    v12 = v9;
    v13 = *(_QWORD *)v22;
    v14 = 0.0;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v22 != v13)
          objc_enumerationMutation(v7);
        objc_msgSend__subview_sizeThatFits_(self, v10, *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i), width, height);
        v14 = v14 + v16;
      }
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v21, v25, 16);
    }
    while (v12);
  }
  else
  {
    v14 = 0.0;
  }
  if ((unint64_t)objc_msgSend_count(v7, v10, v11) >= 2)
    v14 = v14 + (double)(unint64_t)(objc_msgSend_count(v7, v17, v18) - 1) * 7.0;

  v19 = v14;
  v20 = height;
  result.height = v20;
  result.width = v19;
  return result;
}

- (void)layoutSubviews
{
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  int shouldReverseLayoutDirection;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  double v17;
  double v18;
  double v19;
  double v20;
  double MaxX;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  double v27;
  double v28;
  double v29;
  const char *v30;
  uint64_t v31;
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)CCUIWifiMenuModuleItemTrailingView;
  -[CCUIWifiMenuModuleItemTrailingView layoutSubviews](&v32, sel_layoutSubviews);
  objc_msgSend_subviews(self, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v5, v6, v7))
  {
    shouldReverseLayoutDirection = objc_msgSend__shouldReverseLayoutDirection(self, v8, v9);
    objc_msgSend_bounds(self, v11, v12);
    v19 = v17;
    v20 = v18;
    MaxX = 0.0;
    if ((shouldReverseLayoutDirection & 1) == 0)
      MaxX = CGRectGetMaxX(*(CGRect *)&v15);
    v22 = objc_msgSend_count(v5, v13, v14);
    if (v22)
    {
      v24 = v22 - 1;
      do
      {
        objc_msgSend_objectAtIndex_(v5, v23, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend__subview_sizeThatFits_(self, v26, (uint64_t)v25, v19, v20);
        v28 = v27;
        if (shouldReverseLayoutDirection)
          v27 = 0.0;
        v29 = MaxX - v27;
        if (shouldReverseLayoutDirection)
          MaxX = v28 + v29 + 7.0;
        else
          MaxX = v29 + -7.0;
        UIRectCenteredYInRectScale();
        objc_msgSend_setFrame_(v25, v30, v31, 0);

        --v24;
      }
      while (v24 != -1);
    }
  }

}

@end
