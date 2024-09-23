@implementation CCUICellularMenuModuleItemTrailingView

- (CGSize)sizeThatFits:(CGSize)a3
{
  uint64_t v3;
  double height;
  double width;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  uint64_t i;
  double v15;
  const char *v16;
  uint64_t v17;
  double v18;
  double v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v25 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_subviews(self, a2, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v20, v24, 16);
  if (v8)
  {
    v11 = v8;
    v12 = *(_QWORD *)v21;
    v13 = 0.0;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v6);
        objc_msgSend_sizeThatFits_(*(void **)(*((_QWORD *)&v20 + 1) + 8 * i), v9, v10, width, height);
        v13 = v13 + v15;
      }
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v20, v24, 16);
    }
    while (v11);
  }
  else
  {
    v13 = 0.0;
  }
  if ((unint64_t)objc_msgSend_count(v6, v9, v10) >= 2)
    v13 = v13 + (double)(unint64_t)(objc_msgSend_count(v6, v16, v17) - 1) * 7.0;

  v18 = v13;
  v19 = height;
  result.height = v19;
  result.width = v18;
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
  uint64_t v27;
  double v28;
  double v29;
  double v30;
  const char *v31;
  uint64_t v32;
  objc_super v33;

  v33.receiver = self;
  v33.super_class = (Class)CCUICellularMenuModuleItemTrailingView;
  -[CCUICellularMenuModuleItemTrailingView layoutSubviews](&v33, sel_layoutSubviews);
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
        objc_msgSend_sizeThatFits_(v25, v26, v27, v19, v20);
        v29 = v28;
        if (shouldReverseLayoutDirection)
          v28 = 0.0;
        v30 = MaxX - v28;
        if (shouldReverseLayoutDirection)
          MaxX = v29 + v30 + 7.0;
        else
          MaxX = v30 + -7.0;
        UIRectCenteredYInRectScale();
        objc_msgSend_setFrame_(v25, v31, v32, 0);

        --v24;
      }
      while (v24 != -1);
    }
  }

}

@end
