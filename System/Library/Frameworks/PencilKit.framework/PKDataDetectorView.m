@implementation PKDataDetectorView

- (PKDataDetectorView)initWithDataDetectorItem:(id)a3 allItems:(id)a4
{
  PKDataDetectorItem *v6;
  id v7;
  PKDataDetectorView *v8;
  PKDataDetectorItem *dataDetectorItem;
  PKDataDetectorItem *v10;
  uint64_t v11;
  NSArray *allItems;
  objc_super v14;

  v6 = (PKDataDetectorItem *)a3;
  v14.receiver = self;
  v14.super_class = (Class)PKDataDetectorView;
  v7 = a4;
  v8 = -[PKDetectionView init](&v14, sel_init);
  dataDetectorItem = v8->_dataDetectorItem;
  v8->_dataDetectorItem = v6;
  v10 = v6;

  -[PKDataDetectorItem setDelegate:](v8->_dataDetectorItem, "setDelegate:", v8, v14.receiver, v14.super_class);
  v11 = objc_msgSend(v7, "copy");

  allItems = v8->_allItems;
  v8->_allItems = (NSArray *)v11;

  return v8;
}

- (id)item
{
  return self->_dataDetectorItem;
}

- (id)dataDetectorItemAllItems:(id)a3
{
  return self->_allItems;
}

- (double)_underlineThickness
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  objc_super v8;

  -[PKDataDetectorView item](self, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "strokeColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v8.receiver = self;
    v8.super_class = (Class)PKDataDetectorView;
    -[PKDetectionView _underlineThickness](&v8, sel__underlineThickness);
    v6 = v5;
  }
  else
  {
    v6 = 1.0;
  }

  return v6;
}

- (id)accessibilityIdentifier
{
  return CFSTR("com.apple.pencilkit.dataDetectorView");
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  -[PKDataDetectorItem scannerResult](self->_dataDetectorItem, "scannerResult");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)tapHandler:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  _OWORD v13[3];
  _BYTE v14[48];

  objc_msgSend(a3, "locationInView:", self);
  v5 = v4;
  v7 = v6;
  if (-[PKDetectionView hitTest:](self, "hitTest:"))
  {
    +[PKStatisticsManager sharedStatisticsManager]();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDataDetectorView dataDetectorItem](self, "dataDetectorItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKStatisticsManager recordDataDetectorItemDefaultAction:]((uint64_t)v8, v9);

    -[PKDataDetectorView item](self, "item");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDetectionView menuInteraction](self, "menuInteraction");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDetectionView drawingTransform](self, "drawingTransform");
    v12 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v13[0] = *MEMORY[0x1E0C9BAA8];
    v13[1] = v12;
    v13[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    objc_msgSend(v10, "handleTapForMenuForInteraction:location:view:viewTransform:drawingTransform:", v11, self, v13, v14, v5, v7);

  }
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  if (-[PKDetectionView hitTest:](self, "hitTest:", x, y))
  {
    +[PKStatisticsManager sharedStatisticsManager]();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKStatisticsManager recordDataDetectorItemMenuAction:]((uint64_t)v8, self->_dataDetectorItem);

    -[PKDataDetectorView dataDetectorItem](self, "dataDetectorItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDetectionItem identifier](self->_dataDetectorItem, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "contextMenuInteraction:configurationForMenuAtLocation:view:identifier:", v7, self, v10, x, y);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v7 = a4;
  v8 = a3;
  -[PKDataDetectorView dataDetectorItem](self, "dataDetectorItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDataDetectorView superview](self, "superview");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDataDetectorView frame](self, "frame");
  objc_msgSend(v9, "contextMenuInteraction:configuration:highlightPreviewInContainerView:frame:", v8, v7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[PKDataDetectorView dataDetectorItem](self, "dataDetectorItem");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contextMenuInteraction:willPerformPreviewActionForMenuWithConfiguration:animator:", v10, v9, v8);

}

- (PKDataDetectorItem)dataDetectorItem
{
  return self->_dataDetectorItem;
}

- (void)setDataDetectorItem:(id)a3
{
  objc_storeStrong((id *)&self->_dataDetectorItem, a3);
}

- (NSArray)allItems
{
  return self->_allItems;
}

- (void)setAllItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 480);
}

- (NSDictionary)dataDetectorContext
{
  return self->_dataDetectorContext;
}

- (void)setDataDetectorContext:(id)a3
{
  objc_storeStrong((id *)&self->_dataDetectorContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataDetectorContext, 0);
  objc_storeStrong((id *)&self->_allItems, 0);
  objc_storeStrong((id *)&self->_dataDetectorItem, 0);
}

@end
