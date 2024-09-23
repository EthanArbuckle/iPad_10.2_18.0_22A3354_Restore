@implementation UICollectionView(HKUIAdditions)

- (void)hk_scrollToItemRespectingFlowLayoutSectionInsetAtIndexPath:()HKUIAdditions animated:scrollPosition:
{
  double v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  id v23;

  v23 = a3;
  objc_msgSend(a1, "contentInset");
  if (a5 == 8 && v8 == 0.0)
  {
    objc_msgSend(a1, "collectionViewLayout");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(a1, "collectionViewLayout");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "layoutAttributesForItemAtIndexPath:", v23);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        if (objc_msgSend(v11, "scrollDirection") == 1)
        {
          objc_msgSend(v12, "frame");
          v14 = v13;
          objc_msgSend(v11, "sectionInset");
          v16 = v14 - v15;
          objc_msgSend(a1, "contentOffset");
          v18 = v17;
          objc_msgSend(a1, "contentSize");
          if (v19 == 0.0 || (objc_msgSend(a1, "contentSize"), v21 = v20, objc_msgSend(a1, "bounds"), v16 <= v21 - v22))
          {
            objc_msgSend(a1, "setContentOffset:animated:", a4, v16, v18);

            goto LABEL_10;
          }
        }
      }

    }
  }
  objc_msgSend(a1, "scrollToItemAtIndexPath:atScrollPosition:animated:", v23, a5, a4);
LABEL_10:

}

@end
