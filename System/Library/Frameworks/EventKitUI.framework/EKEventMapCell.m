@implementation EKEventMapCell

- (EKEventMapCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  id v6;
  EKEventMapCell *v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id location;
  objc_super v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)EKEventMapCell;
  v7 = -[EKEventMapCell initWithStyle:reuseIdentifier:](&v14, sel_initWithStyle_reuseIdentifier_, a3, v6);
  if (v7)
  {
    objc_initWeak(&location, v7);
    v15[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __48__EKEventMapCell_initWithStyle_reuseIdentifier___block_invoke;
    v11[3] = &unk_1E6018610;
    objc_copyWeak(&v12, &location);
    v9 = (id)-[EKEventMapCell registerForTraitChanges:withHandler:](v7, "registerForTraitChanges:withHandler:", v8, v11);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __48__EKEventMapCell_initWithStyle_reuseIdentifier___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    v2 = objc_loadWeakRetained(WeakRetained + 129);
    objc_msgSend(v2, "updateViewColors");

    WeakRetained = v3;
  }

}

- (void)layoutSubviews
{
  id WeakRetained;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)EKEventMapCell;
  -[EKEventMapCell layoutSubviews](&v4, sel_layoutSubviews);
  if (!*(_WORD *)&self->_mapViewSetup)
  {
    self->_mapViewSetup = 1;
    self->_currentlyLoading = 1;
    WeakRetained = objc_loadWeakRetained((id *)&self->_detailItem);
    objc_msgSend(WeakRetained, "setupMapView");

  }
}

- (EKEventMapDetailItem)detailItem
{
  return (EKEventMapDetailItem *)objc_loadWeakRetained((id *)&self->_detailItem);
}

- (void)setDetailItem:(id)a3
{
  objc_storeWeak((id *)&self->_detailItem, a3);
}

- (BOOL)currentlyLoading
{
  return self->_currentlyLoading;
}

- (void)setCurrentlyLoading:(BOOL)a3
{
  self->_currentlyLoading = a3;
}

- (BOOL)mapViewSetup
{
  return self->_mapViewSetup;
}

- (void)setMapViewSetup:(BOOL)a3
{
  self->_mapViewSetup = a3;
}

- (BOOL)setupAsEmptyView
{
  return self->_setupAsEmptyView;
}

- (void)setSetupAsEmptyView:(BOOL)a3
{
  self->_setupAsEmptyView = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_detailItem);
}

@end
