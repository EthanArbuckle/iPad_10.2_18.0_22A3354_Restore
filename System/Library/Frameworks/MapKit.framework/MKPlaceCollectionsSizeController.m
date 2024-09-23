@implementation MKPlaceCollectionsSizeController

- (MKPlaceCollectionsSizeController)initWithDefaultCollectionsConfigurationUsingTraitCollections:(id)a3 inContext:(int64_t)a4
{
  return -[MKPlaceCollectionsSizeController initWithCollectionsConfiguration:isSingleCollection:usingTraitCollections:inContext:](self, "initWithCollectionsConfiguration:isSingleCollection:usingTraitCollections:inContext:", 1, 1, 0, a3, a4);
}

- (MKPlaceCollectionsSizeController)initWithCollectionsConfiguration:(id)a3 isSingleCollection:(BOOL)a4 usingTraitCollections:(id)a5 inContext:(int64_t)a6
{
  _BOOL4 v7;
  int64_t var1;
  int64_t var0;
  id v11;
  MKPlaceCollectionsSizeController *v12;
  MKPlaceCollectionsSizeController *v13;
  void *v14;
  double v15;
  int IsEnabled_Maps269;
  double v17;
  double v18;
  objc_super v20;

  v7 = a4;
  var1 = a3.var1;
  var0 = a3.var0;
  v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)MKPlaceCollectionsSizeController;
  v12 = -[MKPlaceCollectionsSizeController init](&v20, sel_init);
  v13 = v12;
  if (!v12)
    goto LABEL_13;
  v12->_collectionsConfiguration.displayStyle = var0;
  v12->_collectionsConfiguration.collectionsPerRow = var1;
  v12->_isSingleCollection = v7;
  objc_msgSend(v11, "traitCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v13->_isMarzipan = objc_msgSend(v14, "userInterfaceIdiom") == 5;

  if ((unint64_t)(var0 - 1) >= 2)
  {
    if (var0)
      goto LABEL_9;
    v15 = 12.0;
    switch(a6)
    {
      case 1:
        v15 = 0.0;
        break;
      case 3:
        if ((MapsFeature_IsEnabled_Maps269() & 1) == 0)
          goto LABEL_16;
        goto LABEL_15;
      case 4:
        break;
      case 6:
        v15 = *MEMORY[0x1E0CEB4B0];
        break;
      case 7:
LABEL_15:
        v15 = 0.0;
        break;
      case 8:
        v15 = 6.0;
        break;
      default:
LABEL_16:
        v15 = 10.0;
        break;
    }
  }
  else
  {
    v15 = 8.0;
    if (!v13->_isMarzipan)
      v15 = 16.0;
  }
  -[MKPlaceCollectionsSizeController setSectionInset:](v13, "setSectionInset:", v15);
LABEL_9:
  IsEnabled_Maps269 = MapsFeature_IsEnabled_Maps269();
  v17 = 244.0;
  if (IsEnabled_Maps269 ^ 1 | v7)
  {
    v17 = 180.0;
    v18 = 280.0;
  }
  else
  {
    v18 = 192.0;
  }
  -[MKPlaceCollectionsSizeController setDefaultCollectionHeight:](v13, "setDefaultCollectionHeight:", v17);
  -[MKPlaceCollectionsSizeController setDefaultCollectionWidth:](v13, "setDefaultCollectionWidth:", v18);
LABEL_13:

  return v13;
}

- (CGSize)sizeForCollectionWithMaxCollectionsWidth:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  _BOOL4 isSingleCollection;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  double v25;
  double v26;
  uint64_t v27;
  double v28;
  CGSize result;

  -[MKPlaceCollectionsSizeController sectionInset](self, "sectionInset");
  v6 = v5;
  -[MKPlaceCollectionsSizeController sectionInset](self, "sectionInset");
  v8 = v7;
  -[MKPlaceCollectionsSizeController collectionsConfiguration](self, "collectionsConfiguration");
  v10 = v9;
  v11 = -[MKPlaceCollectionsSizeController collectionsConfiguration](self, "collectionsConfiguration");
  if (v11 == 2)
  {
    isSingleCollection = self->_isSingleCollection;
    -[MKPlaceCollectionsSizeController sectionInset](self, "sectionInset");
    v16 = v15;
    -[MKPlaceCollectionsSizeController sectionInset](self, "sectionInset");
    v18 = v16 + v17;
    if (isSingleCollection)
    {
      v6 = a3 - v18;
LABEL_10:
      -[MKPlaceCollectionsSizeController defaultCollectionHeight](self, "defaultCollectionHeight");
      v12 = v23;
      goto LABEL_13;
    }
    -[MKPlaceCollectionsSizeController collectionsConfiguration](self, "collectionsConfiguration");
    v25 = (double)(v24 - 1);
    -[MKPlaceCollectionsSizeController minimumInterItemSpacing](self, "minimumInterItemSpacing");
    v19 = a3 - (v18 + v25 * v26);
    -[MKPlaceCollectionsSizeController collectionsConfiguration](self, "collectionsConfiguration");
    v6 = v19 / (double)v27;
    v21 = 0.65;
LABEL_12:
    v12 = ceil(v19 * v21) + 10.0;
    goto LABEL_13;
  }
  v12 = (double)v10;
  v13 = (v6 + v8) * (double)v10;
  if (v11 == 1)
  {
    v19 = a3 - v13;
    -[MKPlaceCollectionsSizeController collectionsConfiguration](self, "collectionsConfiguration");
    v6 = v19 / (double)v20;
    v21 = 0.524781341;
    goto LABEL_12;
  }
  if (!v11)
  {
    if (self->_isSingleCollection)
    {
      v6 = a3 - v13;
    }
    else
    {
      -[MKPlaceCollectionsSizeController defaultCollectionWidth](self, "defaultCollectionWidth", v13);
      v6 = v22;
    }
    goto LABEL_10;
  }
LABEL_13:
  v28 = v6;
  result.height = v12;
  result.width = v28;
  return result;
}

- (double)minimumInterItemSpacing
{
  _BOOL4 v2;
  double result;

  v2 = -[MKPlaceCollectionsSizeController isMarzipan](self, "isMarzipan");
  result = 10.0;
  if (v2)
    return 8.0;
  return result;
}

- (UIEdgeInsets)sectionInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_sectionInset.top;
  left = self->_sectionInset.left;
  bottom = self->_sectionInset.bottom;
  right = self->_sectionInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setSectionInset:(UIEdgeInsets)a3
{
  self->_sectionInset = a3;
}

- (double)defaultCollectionHeight
{
  return self->_defaultCollectionHeight;
}

- (void)setDefaultCollectionHeight:(double)a3
{
  self->_defaultCollectionHeight = a3;
}

- (double)defaultCollectionWidth
{
  return self->_defaultCollectionWidth;
}

- (void)setDefaultCollectionWidth:(double)a3
{
  self->_defaultCollectionWidth = a3;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)collectionsConfiguration
{
  int64_t collectionsPerRow;
  int64_t displayStyle;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  collectionsPerRow = self->_collectionsConfiguration.collectionsPerRow;
  displayStyle = self->_collectionsConfiguration.displayStyle;
  result.var1 = collectionsPerRow;
  result.var0 = displayStyle;
  return result;
}

- (void)setCollectionsConfiguration:(id)a3
{
  self->_collectionsConfiguration = ($6D52D4259129B2917F58F12EE7EDADA3)a3;
}

- (BOOL)isSingleCollection
{
  return self->_isSingleCollection;
}

- (void)setIsSingleCollection:(BOOL)a3
{
  self->_isSingleCollection = a3;
}

- (BOOL)isMarzipan
{
  return self->_isMarzipan;
}

- (void)setIsMarzipan:(BOOL)a3
{
  self->_isMarzipan = a3;
}

@end
