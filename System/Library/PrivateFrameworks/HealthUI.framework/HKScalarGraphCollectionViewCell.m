@implementation HKScalarGraphCollectionViewCell

- (HKScalarGraphCollectionViewCell)initWithFrame:(CGRect)a3
{
  HKScalarGraphCollectionViewCell *v3;
  HKScalarGraphCollectionViewCell *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HKScalarGraphCollectionViewCell;
  v3 = -[HKScalarGraphCollectionViewCell initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[HKScalarGraphCollectionViewCell contentView](v3, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  }
  return v4;
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKScalarGraphCollectionViewCell;
  -[HKScalarGraphCollectionViewCell prepareForReuse](&v3, sel_prepareForReuse);
  -[HKScalarGraphCollectionViewCell setGraphSeries:](self, "setGraphSeries:", MEMORY[0x1E0C9AA60]);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)HKScalarGraphCollectionViewCell;
  -[HKScalarGraphCollectionViewCell layoutSubviews](&v13, sel_layoutSubviews);
  -[HKScalarGraphCollectionViewCell bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[HKScalarGraphCollectionViewCell graphViewController](self, "graphViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v4, v6, v8, v10);

}

+ (id)reuseIdentifier
{
  return CFSTR("HKScalarGraphCollectionViewCell");
}

- (int64_t)stackCountForGraphView:(id)a3
{
  return 1;
}

- (id)seriesSelectionLineColorForGraphView:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartLollipopStickColor", a3);
}

- (BOOL)graphViewPointSelectionDifferentiatesSeriesGroups:(id)a3
{
  return 1;
}

- (void)graphView:(id)a3 didUpdateSelectedPoint:(id)a4
{
  void *v5;
  int v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;

  v17 = a4;
  if (+[HKLollipopController pointSelectionContextsHaveUserInfo:](HKLollipopController, "pointSelectionContextsHaveUserInfo:"))
  {
    -[HKScalarGraphCollectionViewCell lollipopController](self, "lollipopController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isVisible");

    if (v6)
    {
      -[HKScalarGraphCollectionViewCell lollipopController](self, "lollipopController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "updateWithPointContexts:", v17);
    }
    else
    {
      -[HKScalarGraphCollectionViewCell header](self, "header");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "frame");
      v10 = v9;
      v12 = v11;
      v14 = v13;
      v16 = v15;

      -[HKScalarGraphCollectionViewCell lollipopController](self, "lollipopController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setVisibleWithRect:pointContexts:animated:", v17, 1, v10, v12, v14, v16);
    }

  }
}

- (void)graphViewDidEndSelection:(id)a3
{
  id v3;

  -[HKScalarGraphCollectionViewCell lollipopController](self, "lollipopController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInvisibleAnimated:", 1);

}

- (NSArray)graphSeries
{
  return self->_graphSeries;
}

- (void)setGraphSeries:(id)a3
{
  objc_storeStrong((id *)&self->_graphSeries, a3);
}

- (HKScalarGraphViewController)graphViewController
{
  return (HKScalarGraphViewController *)objc_loadWeakRetained((id *)&self->_graphViewController);
}

- (void)setGraphViewController:(id)a3
{
  objc_storeWeak((id *)&self->_graphViewController, a3);
}

- (HKLollipopController)lollipopController
{
  return (HKLollipopController *)objc_loadWeakRetained((id *)&self->_lollipopController);
}

- (void)setLollipopController:(id)a3
{
  objc_storeWeak((id *)&self->_lollipopController, a3);
}

- (UIView)header
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_header);
}

- (void)setHeader:(id)a3
{
  objc_storeWeak((id *)&self->_header, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_header);
  objc_destroyWeak((id *)&self->_lollipopController);
  objc_destroyWeak((id *)&self->_graphViewController);
  objc_storeStrong((id *)&self->_graphSeries, 0);
}

@end
