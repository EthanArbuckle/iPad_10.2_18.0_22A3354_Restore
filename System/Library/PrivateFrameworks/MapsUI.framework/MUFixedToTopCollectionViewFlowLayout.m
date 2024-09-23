@implementation MUFixedToTopCollectionViewFlowLayout

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  void *v3;
  void *v4;
  double MidY;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  double v19;
  double v20;
  double Height;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  _QWORD v32[8];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  objc_super v37;
  _BYTE v38[128];
  uint64_t v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;

  v39 = *MEMORY[0x1E0C80C00];
  v37.receiver = self;
  v37.super_class = (Class)MUFixedToTopCollectionViewFlowLayout;
  -[UICollectionViewFlowLayout layoutAttributesForElementsInRect:](&v37, sel_layoutAttributesForElementsInRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  MidY = CGRectGetMidY(v40);

  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v7 = v3;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *MEMORY[0x1E0C9D628];
    v11 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v12 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v13 = *(double *)(MEMORY[0x1E0C9D628] + 24);
    v14 = *(_QWORD *)v34;
    v15 = 1.0;
    v16 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v34 != v14)
          objc_enumerationMutation(v7);
        v18 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        if (!objc_msgSend(v18, "representedElementCategory"))
        {
          objc_msgSend(v18, "frame");
          v19 = CGRectGetMidY(v41);
          v20 = v19 - MidY;
          if (v19 - MidY < 0.0)
            v20 = -v20;
          if (v20 >= v15)
            goto LABEL_13;
          objc_msgSend(v6, "addObject:", v18);
          objc_msgSend(v18, "frame");
          Height = CGRectGetHeight(v42);
          v43.origin.x = v10;
          v43.origin.y = v11;
          v43.size.width = v12;
          v43.size.height = v13;
          if (Height > CGRectGetHeight(v43))
          {
            objc_msgSend(v18, "frame");
            v10 = v22;
            v11 = v23;
            v12 = v24;
            v13 = v25;
          }
          objc_msgSend(v7, "lastObject");
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          v15 = 1.0;
          if (v18 == v26)
          {
LABEL_13:
            v32[0] = v16;
            v32[1] = 3221225472;
            v32[2] = __74__MUFixedToTopCollectionViewFlowLayout_layoutAttributesForElementsInRect___block_invoke;
            v32[3] = &__block_descriptor_64_e49_v32__0__UICollectionViewLayoutAttributes_8Q16_B24l;
            *(CGFloat *)&v32[4] = v10;
            *(CGFloat *)&v32[5] = v11;
            *(CGFloat *)&v32[6] = v12;
            *(CGFloat *)&v32[7] = v13;
            objc_msgSend(v6, "enumerateObjectsUsingBlock:", v32);
            objc_msgSend(v6, "removeAllObjects");
            objc_msgSend(v6, "addObject:", v18);
            objc_msgSend(v18, "frame");
            v10 = v27;
            v11 = v28;
            v12 = v29;
            v13 = v30;
            MidY = v19;
          }
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v9);
  }

  return v7;
}

void __74__MUFixedToTopCollectionViewFlowLayout_layoutAttributesForElementsInRect___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  CGFloat v13;
  id v14;
  CGRect v15;
  CGRect v16;

  v14 = a2;
  objc_msgSend(v14, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = *(double *)(a1 + 40);
  objc_msgSend(v14, "frame");
  v13 = v11 - v12;
  v15.origin.x = v4;
  v15.origin.y = v6;
  v15.size.width = v8;
  v15.size.height = v10;
  v16 = CGRectOffset(v15, 0.0, v13);
  objc_msgSend(v14, "setFrame:", v16.origin.x, v16.origin.y, v16.size.width, v16.size.height);

}

@end
