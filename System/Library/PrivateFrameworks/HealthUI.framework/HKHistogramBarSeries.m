@implementation HKHistogramBarSeries

- (HKHistogramBarSeries)initWithFillStyle:(id)a3 numberOfColumns:(unint64_t)a4 cornerRadii:(CGSize)a5
{
  double height;
  double width;
  id v9;
  HKHistogramBarSeries *v10;
  NSLock *v11;
  NSLock *seriesMutableStateLock;
  void *v13;
  void *v14;
  HKStrokeStyle *v15;
  void *v16;
  void *v17;
  objc_super v19;

  height = a5.height;
  width = a5.width;
  v9 = a3;
  v19.receiver = self;
  v19.super_class = (Class)HKHistogramBarSeries;
  v10 = -[HKBarSeries init](&v19, sel_init);
  if (v10)
  {
    v11 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    seriesMutableStateLock = v10->_seriesMutableStateLock;
    v10->_seriesMutableStateLock = v11;

    -[NSLock setName:](v10->_seriesMutableStateLock, "setName:", CFSTR("HKHistogramBarSeriesLock"));
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKStrokeStyle strokeStyleWithColor:lineWidth:](HKStrokeStyle, "strokeStyleWithColor:lineWidth:", v13, 3.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_alloc_init(HKStrokeStyle);
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "colorWithAlphaComponent:", 0.95);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKStrokeStyle setStrokeColor:](v15, "setStrokeColor:", v17);

    -[HKStrokeStyle setLineWidth:](v15, "setLineWidth:", 3.0);
    -[HKStrokeStyle setBlendMode:](v15, "setBlendMode:", 22);
    -[HKBarSeries setUnselectedStrokeStyle:](v10, "setUnselectedStrokeStyle:", v15);
    -[HKBarSeries setTiledStrokeStyle:](v10, "setTiledStrokeStyle:", v14);
    -[HKBarSeries setUnselectedFillStyle:](v10, "setUnselectedFillStyle:", v9);
    -[HKBarSeries setCornerRadii:](v10, "setCornerRadii:", width, height);
    v10->_numberOfColumnsStorage = a4;

  }
  return v10;
}

- (double)barWidthForVisibleBarCount:(int64_t)a3 axisRect:(CGRect)a4 minimumSpacing:(double)a5
{
  return a4.size.width
       / (double)(-[HKHistogramBarSeries numberOfColumns](self, "numberOfColumns", a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a5)+ 1)+ -1.5;
}

- (unint64_t)numberOfColumns
{
  void *v3;
  unint64_t numberOfColumnsStorage;
  void *v5;

  -[HKHistogramBarSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  numberOfColumnsStorage = self->_numberOfColumnsStorage;
  -[HKHistogramBarSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  return numberOfColumnsStorage;
}

- (void)setNumberOfColumns:(unint64_t)a3
{
  void *v5;
  id v6;

  -[HKHistogramBarSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  self->_numberOfColumnsStorage = a3;
  -[HKHistogramBarSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unlock");

}

- (NSLock)seriesMutableStateLock
{
  return self->_seriesMutableStateLock;
}

- (unint64_t)numberOfColumnsStorage
{
  return self->_numberOfColumnsStorage;
}

- (void)setNumberOfColumnsStorage:(unint64_t)a3
{
  self->_numberOfColumnsStorage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seriesMutableStateLock, 0);
}

@end
