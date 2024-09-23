@implementation UIAccessibilityElementKBEmojiCategory

- (CGRect)accessibilityFrame
{
  id v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  id v16;
  BOOL v17;
  id v18[2];
  _QWORD v19[2];
  int v20;
  int v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  SEL v25;
  UIAccessibilityElementKBEmojiCategory *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGRect result;

  v26 = self;
  v25 = a2;
  v2 = (id)-[UIAccessibilityElementKBEmojiCategory categoryView]((uint64_t)self);
  v17 = v2 != 0;

  if (v17)
  {
    v15 = (id)-[UIAccessibilityElementKBEmojiCategory categoryView]((uint64_t)v26);
    objc_msgSend(v15, "accessibilityFrame");
    v27 = v7;
    v28 = v8;
    v29 = v9;
    v30 = v10;

  }
  else
  {
    v19[0] = 0;
    v19[1] = v19;
    v20 = 0x10000000;
    v21 = 64;
    v22 = &unk_230DEFD8E;
    v23 = 0u;
    v24 = 0u;
    v23 = *MEMORY[0x24BDBF070];
    v24 = *(_OWORD *)(MEMORY[0x24BDBF070] + 16);
    v18[0] = v26;
    v18[1] = v19;
    AXPerformSafeBlock();
    v16 = (id)-[UIAccessibilityElementKBEmojiCategory accessibilityContainer](v26, "accessibilityContainer");
    UIAccessibilityFrameForBounds();
    v27 = v3;
    v28 = v4;
    v29 = v5;
    v30 = v6;

    objc_storeStrong(v18, 0);
    _Block_object_dispose(v19, 8);
  }
  v11 = v27;
  v12 = v28;
  v13 = v29;
  v14 = v30;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (uint64_t)categoryView
{
  if (a1)
    return *(_QWORD *)(a1 + 64);
  else
    return 0;
}

__n128 __59__UIAccessibilityElementKBEmojiCategory_accessibilityFrame__block_invoke(uint64_t a1)
{
  CGFloat v1;
  CGFloat v2;
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  uint64_t v9;
  __n128 result;
  id v11;
  id v12;
  __int128 v14;
  __n128 v15;
  CGRect r2;
  CGRect v17;
  CGRect v18;

  v11 = (id)objc_msgSend(*(id *)(a1 + 32), "accessibilityContainer");
  objc_msgSend(v11, "frameForDivider:", -[UIAccessibilityElementKBEmojiCategory categoryIndex](*(_QWORD *)(a1 + 32)));
  v17.origin.x = v1;
  v17.origin.y = v2;
  v17.size.width = v3;
  v17.size.height = v4;

  v12 = (id)objc_msgSend(*(id *)(a1 + 32), "accessibilityContainer");
  objc_msgSend(v12, "frameForDivider:", -[UIAccessibilityElementKBEmojiCategory categoryIndex](*(_QWORD *)(a1 + 32)) + 1);
  r2.origin.x = v5;
  r2.origin.y = v6;
  r2.size.width = v7;
  r2.size.height = v8;

  v18 = CGRectUnion(v17, r2);
  *(CGFloat *)&v14 = v18.origin.x;
  *((_QWORD *)&v14 + 1) = *(_QWORD *)&v18.origin.y;
  v15.n128_u64[0] = *(_QWORD *)&v18.size.width;
  v15.n128_u64[1] = *(_QWORD *)&v18.size.height;
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  *(_OWORD *)(v9 + 32) = v14;
  result = v15;
  *(__n128 *)(v9 + 48) = v15;
  return result;
}

- (uint64_t)categoryIndex
{
  if (a1)
    return *(_QWORD *)(a1 + 72);
  else
    return 0;
}

- (id)accessibilityLabel
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t *v11;
  int v12;
  int v13;
  void (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16[4];

  v16[3] = self;
  v16[2] = (id)a2;
  v5 = (id)-[UIAccessibilityElementKBEmojiCategory category]((uint64_t)self);
  v4 = (id)objc_msgSend(v5, "safeValueForKey:", CFSTR("_categoryType"));
  v6 = (void *)(int)objc_msgSend(v4, "intValue");

  v16[1] = v6;
  v7 = (void *)MEMORY[0x24BDD17C8];
  v8 = accessibilityLocalizedString(CFSTR("emoji.category"));
  v10 = 0;
  v11 = &v10;
  v12 = 838860800;
  v13 = 48;
  v14 = __Block_byref_object_copy__13;
  v15 = __Block_byref_object_dispose__13;
  v16[0] = 0;
  AXPerformSafeBlock();
  v9 = (id)v11[5];
  _Block_object_dispose(&v10, 8);
  objc_storeStrong(v16, 0);
  v3 = (id)objc_msgSend(v7, "stringWithFormat:", v8, v9);

  return v3;
}

- (uint64_t)category
{
  if (a1)
    return *(_QWORD *)(a1 + 56);
  else
    return 0;
}

void __59__UIAccessibilityElementKBEmojiCategory_accessibilityLabel__block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  void *v3;

  v1 = (id)-[objc_class displayName:](NSClassFromString(CFSTR("UIKeyboardEmojiCategory")), "displayName:", *(_QWORD *)(a1 + 40));
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = v1;

}

- (void)setCategory:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 56), a2);
}

- (uint64_t)setCategoryIndex:(uint64_t)result
{
  if (result)
    *(_QWORD *)(result + 72) = a2;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_categoryView, 0);
  objc_storeStrong(&self->_category, 0);
}

@end
