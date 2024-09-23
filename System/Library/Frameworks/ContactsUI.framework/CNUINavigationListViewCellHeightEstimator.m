@implementation CNUINavigationListViewCellHeightEstimator

- (CNUINavigationListViewCellHeightEstimator)initWithNavigationListStyle:(id)a3
{
  id v5;
  CNUINavigationListViewCellHeightEstimator *v6;
  CNUINavigationListViewCellHeightEstimator *v7;
  CNUINavigationListViewCellHeightEstimator *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNUINavigationListViewCellHeightEstimator;
  v6 = -[CNUINavigationListViewCellHeightEstimator init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_navigationListStyle, a3);
    v8 = v7;
  }

  return v7;
}

- (double)estimatedCellHeight
{
  NSNumber *estimatedCellHeightNumber;
  CNUINavigationListViewCell *v4;
  void *v5;
  void *v6;
  NSNumber *v7;
  NSNumber *v8;
  float v9;

  estimatedCellHeightNumber = self->_estimatedCellHeightNumber;
  if (!estimatedCellHeightNumber)
  {
    v4 = objc_alloc_init(CNUINavigationListViewCell);
    -[CNUINavigationListViewCellHeightEstimator navigationListStyle](self, "navigationListStyle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNUINavigationListViewCell setNavigationListStyle:](v4, "setNavigationListStyle:", v5);

    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[CNUINavigationListViewCell minimumContentHeight](v4, "minimumContentHeight");
    objc_msgSend(v6, "numberWithDouble:");
    v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v8 = self->_estimatedCellHeightNumber;
    self->_estimatedCellHeightNumber = v7;

    estimatedCellHeightNumber = self->_estimatedCellHeightNumber;
  }
  -[NSNumber floatValue](estimatedCellHeightNumber, "floatValue");
  return v9;
}

- (double)estimatedDetailCellHeight
{
  NSNumber *estimatedDetailCellHeightNumber;
  CNUINavigationListViewDetailCell *v4;
  void *v5;
  void *v6;
  NSNumber *v7;
  NSNumber *v8;
  float v9;

  estimatedDetailCellHeightNumber = self->_estimatedDetailCellHeightNumber;
  if (!estimatedDetailCellHeightNumber)
  {
    v4 = objc_alloc_init(CNUINavigationListViewDetailCell);
    -[CNUINavigationListViewCellHeightEstimator navigationListStyle](self, "navigationListStyle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNUINavigationListViewCell setNavigationListStyle:](v4, "setNavigationListStyle:", v5);

    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[CNUINavigationListViewDetailCell minimumContentHeight](v4, "minimumContentHeight");
    objc_msgSend(v6, "numberWithDouble:");
    v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v8 = self->_estimatedDetailCellHeightNumber;
    self->_estimatedDetailCellHeightNumber = v7;

    estimatedDetailCellHeightNumber = self->_estimatedDetailCellHeightNumber;
  }
  -[NSNumber floatValue](estimatedDetailCellHeightNumber, "floatValue");
  return v9;
}

- (CNUINavigationListStyle)navigationListStyle
{
  return self->_navigationListStyle;
}

- (void)setNavigationListStyle:(id)a3
{
  objc_storeStrong((id *)&self->_navigationListStyle, a3);
}

- (NSNumber)estimatedCellHeightNumber
{
  return self->_estimatedCellHeightNumber;
}

- (void)setEstimatedCellHeightNumber:(id)a3
{
  objc_storeStrong((id *)&self->_estimatedCellHeightNumber, a3);
}

- (NSNumber)estimatedDetailCellHeightNumber
{
  return self->_estimatedDetailCellHeightNumber;
}

- (void)setEstimatedDetailCellHeightNumber:(id)a3
{
  objc_storeStrong((id *)&self->_estimatedDetailCellHeightNumber, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_estimatedDetailCellHeightNumber, 0);
  objc_storeStrong((id *)&self->_estimatedCellHeightNumber, 0);
  objc_storeStrong((id *)&self->_navigationListStyle, 0);
}

@end
