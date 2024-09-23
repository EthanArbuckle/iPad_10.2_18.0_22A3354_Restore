@implementation UICGPDFListContainerAccessibilityElement

- (int64_t)accessibilityContainerType
{
  return 2;
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (CGRect)accessibilityFrame
{
  CGFloat v2;
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  uint64_t i;
  void *v15;
  BOOL v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;
  CGRect v35;
  CGRect v36;
  CGRect result;
  CGRect v38;

  v34 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BDBF070];
  v3 = *(double *)(MEMORY[0x24BDBF070] + 8);
  v4 = *(double *)(MEMORY[0x24BDBF070] + 16);
  v5 = *(double *)(MEMORY[0x24BDBF070] + 24);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[UICGPDFListContainerAccessibilityElement accessibilityElements](self, "accessibilityElements", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v30;
    v10 = v5;
    v11 = v4;
    v12 = v3;
    v13 = v2;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v30 != v9)
          objc_enumerationMutation(v6);
        v15 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        v35.origin.x = v13;
        v35.origin.y = v12;
        v35.size.width = v11;
        v35.size.height = v10;
        v38.origin.x = v2;
        v38.origin.y = v3;
        v38.size.width = v4;
        v38.size.height = v5;
        v16 = CGRectEqualToRect(v35, v38);
        objc_msgSend(v15, "accessibilityFrame");
        v21 = v17;
        v22 = v18;
        v23 = v19;
        v24 = v20;
        if (!v16)
        {
          v36.origin.x = v13;
          v36.origin.y = v12;
          v36.size.width = v11;
          v36.size.height = v10;
          *(CGRect *)&v17 = CGRectUnion(v36, *(CGRect *)&v21);
        }
        v13 = v17;
        v12 = v18;
        v11 = v19;
        v10 = v20;
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v8);
  }
  else
  {
    v10 = v5;
    v11 = v4;
    v12 = v3;
    v13 = v2;
  }

  v25 = v13;
  v26 = v12;
  v27 = v11;
  v28 = v10;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

@end
