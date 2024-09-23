@implementation AVTCenteringCollectionViewHelper

+ (UIEdgeInsets)insetsForBounds:(CGRect)a3 withFirstCellSize:(CGSize)a4 lastCellSize:(CGSize)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  UIEdgeInsets result;

  v5 = (a3.size.width - a4.width) * 0.5;
  v6 = (a3.size.width - a5.width) * 0.5;
  v7 = 0.0;
  v8 = 0.0;
  result.right = v6;
  result.bottom = v8;
  result.left = v5;
  result.top = v7;
  return result;
}

+ (id)indexPathForNearestItemToCenterWithOffset:(CGPoint)a3 collectionView:(id)a4
{
  double y;
  double x;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  uint64_t v29;
  void *v30;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t, uint64_t);
  void *v35;
  id v36;
  id v37;
  _QWORD *v38;
  uint64_t *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD v48[4];
  _QWORD v49[6];
  CGRect v50;
  CGRect v51;
  CGRect v52;

  y = a3.y;
  x = a3.x;
  v6 = a4;
  objc_msgSend(v6, "contentSize");
  v8 = v7;
  objc_msgSend(v6, "contentInset");
  v10 = v8 + v9;
  objc_msgSend(v6, "bounds");
  v11 = v10 - CGRectGetWidth(v50);
  if (x >= v11)
    x = v11;
  objc_msgSend(v6, "contentInset");
  if (x <= -v12)
    x = -v12;
  objc_msgSend(v6, "bounds");
  v13 = CGRectGetWidth(v51) * 0.5 + x;
  objc_msgSend(v6, "bounds");
  v14 = y + CGRectGetHeight(v52) * 0.5;
  objc_msgSend(v6, "bounds");
  UIRectCenteredAboutPoint();
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v23 = MEMORY[0x1E0C809B0];
  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v49[2] = __93__AVTCenteringCollectionViewHelper_indexPathForNearestItemToCenterWithOffset_collectionView___block_invoke;
  v49[3] = &__block_descriptor_48_e39_d40__0_CGRect__CGPoint_dd__CGSize_dd__8l;
  *(CGFloat *)&v49[4] = v13;
  *(double *)&v49[5] = v14;
  v24 = (void *)MEMORY[0x1DF0D0754](v49);
  v48[0] = 0;
  v48[1] = v48;
  v48[2] = 0x2020000000;
  v48[3] = 0x7FEFFFFFFFFFFFFFLL;
  v44 = 0;
  v45 = &v44;
  v46 = 0x2020000000;
  v47 = 0x7FFFFFFFFFFFFFFFLL;
  objc_msgSend(v6, "collectionViewLayout");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "indexesForElementsInRect:visibleBounds:numberOfItems:", objc_msgSend(v6, "numberOfItemsInSection:", 0), v16, v18, v20, v22, v16, v18, v20, v22);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = v23;
  v33 = 3221225472;
  v34 = __93__AVTCenteringCollectionViewHelper_indexPathForNearestItemToCenterWithOffset_collectionView___block_invoke_2;
  v35 = &unk_1EA51DA20;
  v27 = v6;
  v36 = v27;
  v40 = v16;
  v41 = v18;
  v42 = v20;
  v43 = v22;
  v28 = v24;
  v37 = v28;
  v38 = v48;
  v39 = &v44;
  objc_msgSend(v26, "enumerateIndexesUsingBlock:", &v32);
  v29 = v45[3];
  if (v29 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v30 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v29, 0, v32, v33, v34, v35, v36);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
  }

  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(v48, 8);

  return v30;
}

double __93__AVTCenteringCollectionViewHelper_indexPathForNearestItemToCenterWithOffset_collectionView___block_invoke(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  double MidX;
  CGRect v12;

  MidX = CGRectGetMidX(*(CGRect *)&a2);
  v12.origin.x = a2;
  v12.origin.y = a3;
  v12.size.width = a4;
  v12.size.height = a5;
  CGRectGetMidY(v12);
  return vabdd_f64(MidX, *(double *)(a1 + 32));
}

void __93__AVTCenteringCollectionViewHelper_indexPathForNearestItemToCenterWithOffset_collectionView___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;

  objc_msgSend(*(id *)(a1 + 32), "collectionViewLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frameForElementAtIndex:visibleBounds:", a2, *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = (*(double (**)(double, double, double, double))(*(_QWORD *)(a1 + 40) + 16))(v6, v8, v10, v12);
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (v13 < *(double *)(v14 + 24))
  {
    *(double *)(v14 + 24) = v13;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = a2;
  }
}

+ (CGPoint)contentOffsetForCenteringPoint:(CGPoint)a3 collectionView:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGPoint result;
  CGRect v14;
  CGRect v15;

  v4 = a4;
  objc_msgSend(v4, "bounds");
  CGRectGetWidth(v14);
  objc_msgSend(v4, "bounds");
  CGRectGetHeight(v15);
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "screen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scale");
  UIPointRoundToScale();
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.y = v12;
  result.x = v11;
  return result;
}

+ (id)indexPathForItemBeingScrolledTowardFromOffset:(CGPoint)a3 currentOffset:(CGPoint)a4 nearestItemToCenter:(id)a5 itemCount:(unint64_t)a6 itemOffsetProvider:(id)a7 ratio:(double *)a8
{
  double x;
  double v12;
  id v13;
  double (**v14)(id, id);
  double v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  double v24;
  double v25;
  double v26;

  x = a4.x;
  v12 = a3.x;
  v13 = a5;
  v14 = (double (**)(id, id))a7;
  v15 = v14[2](v14, v13);
  v16 = v13;
  v17 = v16;
  if (x - v12 > 0.0)
  {
    if (x > v15 && objc_msgSend(v16, "item") + 1 < a6)
    {
      v18 = (void *)MEMORY[0x1E0CB36B0];
      v19 = objc_msgSend(v17, "item") + 1;
      goto LABEL_8;
    }
    if (x < v15 && objc_msgSend(v17, "item") >= 1)
    {
      v22 = (void *)MEMORY[0x1E0CB36B0];
      v23 = objc_msgSend(v17, "item") - 1;
LABEL_16:
      objc_msgSend(v22, "indexPathForItem:inSection:", v23, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  if (x >= v15 || objc_msgSend(v16, "item") < 1)
  {
    if (x > v15 && objc_msgSend(v17, "item") + 1 < a6)
    {
      v22 = (void *)MEMORY[0x1E0CB36B0];
      v23 = objc_msgSend(v17, "item") + 1;
      goto LABEL_16;
    }
LABEL_17:
    v21 = 0;
LABEL_18:
    v20 = v17;
    if (!a8)
      goto LABEL_23;
    goto LABEL_19;
  }
  v18 = (void *)MEMORY[0x1E0CB36B0];
  v19 = objc_msgSend(v17, "item") - 1;
LABEL_8:
  objc_msgSend(v18, "indexPathForItem:inSection:", v19, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v17;
  if (!a8)
    goto LABEL_23;
LABEL_19:
  if (v21)
  {
    v24 = v14[2](v14, v21);
    v25 = v14[2](v14, v20);
    v26 = 1.0 - fabs((x - v25) / (v25 - v24));
  }
  else
  {
    v26 = 1.0;
  }
  *a8 = v26;
LABEL_23:

  return v20;
}

@end
