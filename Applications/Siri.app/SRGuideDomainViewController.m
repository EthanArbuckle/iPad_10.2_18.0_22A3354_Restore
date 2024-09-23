@implementation SRGuideDomainViewController

- (SRGuideDomainViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  SRGuideDomainViewController *v4;
  SRGuideDomainViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SRGuideDomainViewController;
  v4 = -[SRGuideDomainViewController initWithNibName:bundle:](&v7, "initWithNibName:bundle:", a3, a4);
  v5 = v4;
  if (v4)
    -[SRGuideDomainViewController setDefaultViewInsets:](v4, "setDefaultViewInsets:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
  return v5;
}

- (void)loadView
{
  void *v3;
  uint64_t v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)SRGuideDomainViewController;
  -[SRGuideDomainViewController loadView](&v24, "loadView");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideDomainViewController collectionView](self, "collectionView"));
  *(_QWORD *)&v5 = objc_opt_class(SRGuideDetailSectionHeaderCollectionViewCell, v4).n128_u64[0];
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[SRGuideDetailSectionHeaderCollectionViewCell reuseIdentifier](SRGuideDetailSectionHeaderCollectionViewCell, "reuseIdentifier", v5));
  objc_msgSend(v3, "registerClass:forCellWithReuseIdentifier:", v7, v8);

  *(_QWORD *)&v10 = objc_opt_class(SRGuideDetailPhraseViewCell, v9).n128_u64[0];
  v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[SRGuideDetailPhraseViewCell reuseIdentifier](SRGuideDetailPhraseViewCell, "reuseIdentifier", v10));
  objc_msgSend(v3, "registerClass:forCellWithReuseIdentifier:", v12, v13);

  *(_QWORD *)&v15 = objc_opt_class(SiriUIContentCollectionViewCell, v14).n128_u64[0];
  v17 = v16;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[SiriUIContentCollectionViewCell reuseIdentifier](SiriUIContentCollectionViewCell, "reuseIdentifier", v15));
  objc_msgSend(v3, "registerClass:forCellWithReuseIdentifier:", v17, v18);

  *(_QWORD *)&v20 = objc_opt_class(SRGuideViewHeader, v19).n128_u64[0];
  v22 = v21;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[SRGuideViewHeader reuseIdentifier](SRGuideViewHeader, "reuseIdentifier", v20));
  objc_msgSend(v3, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", v22, UICollectionElementKindSectionHeader, v23);

}

- (Class)headerViewClass
{
  return (Class)objc_opt_class(SRGuideViewHeader, a2);
}

- (void)configureReusableHeaderView:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideDomainViewController snippet](self, "snippet"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "domainDisplayName"));
  objc_msgSend(v6, "setTitle:", v5);

  -[SRGuideDomainViewController _headerViewEdgeInsets](self, "_headerViewEdgeInsets");
  objc_msgSend(v6, "setEdgeInsets:");

}

- (double)desiredHeightForHeaderView
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideDomainViewController delegate](self, "delegate"));
  objc_msgSend(v3, "siriViewControllerExpectedWidth:", self);
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideDomainViewController snippet](self, "snippet"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "domainDisplayName"));
  -[SRGuideDomainViewController _headerViewEdgeInsets](self, "_headerViewEdgeInsets");
  +[SRGuideViewHeader sizeThatFits:text:edgeInsets:](SRGuideViewHeader, "sizeThatFits:text:edgeInsets:", v7, v5, 1.79769313e308, v8, v9, v10, v11);
  v13 = v12;

  return v13;
}

- (int64_t)_cellTypeForIndexPath:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  if (objc_msgSend(v4, "item"))
    goto LABEL_2;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideDomainViewController snippet](self, "snippet"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "guideSections"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v4, "section")));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sectionName"));
  v10 = objc_msgSend(v9, "length");

  if (!v10)
LABEL_2:
    v5 = 1;
  else
    v5 = 0;

  return v5;
}

- (UIEdgeInsets)_headerViewEdgeInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = SiriUIPlatterStyle[32];
  v3 = SiriUIPlatterStyle[34];
  v4 = 3.5;
  v5 = 0.0;
  result.right = v3;
  result.bottom = v5;
  result.left = v2;
  result.top = v4;
  return result;
}

- (int64_t)_numberOfSections
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideDomainViewController snippet](self, "snippet"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "guideSections"));
  v4 = objc_msgSend(v3, "count");

  return (int64_t)v4;
}

- (id)_utterancesForSection:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideDomainViewController snippet](self, "snippet"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "guideSections"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", a3));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "guideUtterances"));
  return v7;
}

- (double)desiredHeightForWidth:(double)a3
{
  uint64_t v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  double v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  if (-[SRGuideDomainViewController _numberOfSections](self, "_numberOfSections") < 1)
    return 0.0;
  v5 = 0;
  v6 = 0.0;
  do
  {
    if (-[SRGuideDomainViewController _showsCategoriesForSection:](self, "_showsCategoriesForSection:", v5))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideDomainViewController snippet](self, "snippet"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "guideSections"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v5));

      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "sectionName"));
      +[SRGuideDetailSectionHeaderCollectionViewCell sizeThatFits:text:](SRGuideDetailSectionHeaderCollectionViewCell, "sizeThatFits:text:", v10, a3, 1.79769313e308);
      v6 = v6 + v11;

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideDomainViewController _utterancesForSection:](self, "_utterancesForSection:", v5));
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(_QWORD *)v20 != v15)
            objc_enumerationMutation(v12);
          +[SRGuideDetailPhraseViewCell sizeThatFits:text:](SRGuideDetailPhraseViewCell, "sizeThatFits:text:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i), a3, 1.79769313e308);
          v6 = v6 + v17;
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v14);
    }

    ++v5;
  }
  while (v5 < -[SRGuideDomainViewController _numberOfSections](self, "_numberOfSections"));
  return v6;
}

- (BOOL)wantsToManageBackgroundColor
{
  return 1;
}

- (BOOL)usePlatterStyle
{
  return 0;
}

- (id)_titleForSection:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideDomainViewController snippet](self, "snippet"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "guideSections"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", a3));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sectionName"));
  return v7;
}

- (BOOL)_showsCategoriesForSection:(unint64_t)a3
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideDomainViewController _titleForSection:](self, "_titleForSection:", a3));
  v4 = objc_msgSend(v3, "length") != 0;

  return v4;
}

- (id)_phraseForIndexPath:(id)a3
{
  id v4;
  char *v5;
  char *v6;
  id v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = (char *)objc_msgSend(v4, "item");
  v6 = &v5[--[SRGuideDomainViewController _showsCategoriesForSection:](self, "_showsCategoriesForSection:", objc_msgSend(v4, "section"))];
  v7 = objc_msgSend(v4, "section");

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideDomainViewController _utterancesForSection:](self, "_utterancesForSection:", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v6));

  return v9;
}

- (void)setSnippet:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SRGuideDomainViewController;
  -[SRGuideDomainViewController setSnippet:](&v5, "setSnippet:", a3);
  if (-[SRGuideDomainViewController isViewLoaded](self, "isViewLoaded"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideDomainViewController collectionView](self, "collectionView"));
    objc_msgSend(v4, "reloadData");

  }
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a5;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[SRGuideViewHeader reuseIdentifier](SRGuideViewHeader, "reuseIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", UICollectionElementKindSectionHeader, v8, v6));

  return v9;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v6;
  id v7;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideDomainViewController _utterancesForSection:](self, "_utterancesForSection:", a4));
  v7 = objc_msgSend(v6, "count");

  return (int64_t)v7
       + -[SRGuideDomainViewController _showsCategoriesForSection:](self, "_showsCategoriesForSection:", a4);
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  int64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a3;
  v7 = a4;
  v8 = -[SRGuideDomainViewController _cellTypeForIndexPath:](self, "_cellTypeForIndexPath:", v7);
  if (v8 == 1)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[SRGuideDetailPhraseViewCell reuseIdentifier](SRGuideDetailPhraseViewCell, "reuseIdentifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v15, v7));

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideDomainViewController _phraseForIndexPath:](self, "_phraseForIndexPath:", v7));
    objc_msgSend(v10, "setText:", v13);
  }
  else
  {
    if (v8)
    {
      v10 = 0;
      goto LABEL_7;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[SRGuideDetailSectionHeaderCollectionViewCell reuseIdentifier](SRGuideDetailSectionHeaderCollectionViewCell, "reuseIdentifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v9, v7));

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideDomainViewController snippet](self, "snippet"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "guideSections"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v7, "section")));

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "sectionName"));
    objc_msgSend(v10, "setText:", v14);

  }
LABEL_7:

  return v10;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  return 0;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  return 0;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v6;
  int64_t v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  CGFloat height;
  double v17;
  double v18;
  double v19;
  CGSize result;

  v6 = a5;
  v7 = -[SRGuideDomainViewController _cellTypeForIndexPath:](self, "_cellTypeForIndexPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideDomainViewController delegate](self, "delegate"));
  objc_msgSend(v8, "siriViewControllerExpectedWidth:", self);
  v10 = v9;

  if (v7 == 1)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideDomainViewController _phraseForIndexPath:](self, "_phraseForIndexPath:", v6));
    +[SRGuideDetailPhraseViewCell sizeThatFits:text:](SRGuideDetailPhraseViewCell, "sizeThatFits:text:", v13, v10, 1.79769313e308);
    height = v17;
  }
  else
  {
    if (v7)
    {
      height = CGSizeZero.height;
      goto LABEL_7;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideDomainViewController snippet](self, "snippet"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "guideSections"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v6, "section")));

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "sectionName"));
    +[SRGuideDetailSectionHeaderCollectionViewCell sizeThatFits:text:](SRGuideDetailSectionHeaderCollectionViewCell, "sizeThatFits:text:", v14, v10, 1.79769313e308);
    height = v15;

  }
LABEL_7:

  v18 = v10;
  v19 = height;
  result.height = v19;
  result.width = v18;
  return result;
}

@end
