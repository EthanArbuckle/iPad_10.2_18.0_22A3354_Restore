@implementation MKPlaceCompactCollectionSizeController

- (MKPlaceCompactCollectionSizeController)initWithDefaultCollectionsConfigurationUsingTraitCollections:(id)a3 inContext:(int64_t)a4
{
  return -[MKPlaceCompactCollectionSizeController initWithCollectionsConfiguration:usingTraitCollections:inContext:](self, "initWithCollectionsConfiguration:usingTraitCollections:inContext:", 1, 1, a3, a4);
}

- (MKPlaceCompactCollectionSizeController)initWithCollectionsConfiguration:(id)a3 usingTraitCollections:(id)a4 inContext:(int64_t)a5
{
  int64_t var1;
  int64_t var0;
  MKPlaceCompactCollectionSizeController *v8;
  MKPlaceCompactCollectionSizeController *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  objc_super v16;

  var1 = a3.var1;
  var0 = a3.var0;
  v16.receiver = self;
  v16.super_class = (Class)MKPlaceCompactCollectionSizeController;
  v8 = -[MKPlaceCompactCollectionSizeController init](&v16, sel_init, a3.var0, a3.var1, a4);
  v9 = v8;
  if (v8)
  {
    v8->_configuration.displayStyle = var0;
    v8->_configuration.collectionsPerRow = var1;
    v10 = 6.0;
    v8->_context = a5;
    switch(a5)
    {
      case 0:
        v11 = 16.0;
        v14 = 10.0;
        v12 = 166.0;
        v13 = 114.0;
        goto LABEL_8;
      case 2:
        v11 = 16.0;
        v14 = 30.0;
        v12 = 150.0;
        v13 = 200.0;
        goto LABEL_8;
      case 1:
        v11 = 16.0;
        v10 = 0.0;
        v12 = 150.0;
        v13 = 200.0;
        v14 = 0.0;
LABEL_8:
        -[MKPlaceCompactCollectionSizeController setDefaultCompactCollectionHeight:](v8, "setDefaultCompactCollectionHeight:", v13);
        -[MKPlaceCompactCollectionSizeController setDefaultCompactCollectionWidth:](v9, "setDefaultCompactCollectionWidth:", v12);
        -[MKPlaceCompactCollectionSizeController setSectionInset:](v9, "setSectionInset:", v10, v11, v14, v11);
        break;
    }
  }
  return v9;
}

- (CGSize)sizeForCollectionWithMaxCollectionsWidth:(double)a3
{
  double v3;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  CGSize result;

  -[MKPlaceCompactCollectionSizeController sectionInset](self, "sectionInset");
  v7 = v6;
  -[MKPlaceCompactCollectionSizeController sectionInset](self, "sectionInset");
  v9 = v8;
  -[MKPlaceCompactCollectionSizeController configuration](self, "configuration");
  v11 = v10;
  v12 = -[MKPlaceCompactCollectionSizeController configuration](self, "configuration");
  if (v12 == 1)
  {
    -[MKPlaceCompactCollectionSizeController defaultCompactCollectionWidth](self, "defaultCompactCollectionWidth");
    v3 = v16;
    -[MKPlaceCompactCollectionSizeController defaultCompactCollectionHeight](self, "defaultCompactCollectionHeight");
    v13 = v17;
  }
  else if (!v12)
  {
    v14 = a3 - (v7 + v9) * (double)(v11 - 1);
    -[MKPlaceCompactCollectionSizeController configuration](self, "configuration");
    v3 = v14 / (double)v15;
    v13 = ceil(v14 * 0.3) + 10.0;
  }
  v18 = v3;
  result.height = v13;
  result.width = v18;
  return result;
}

- (double)minimumInterItemSpacing
{
  -[MKPlaceCompactCollectionSizeController configuration](self, "configuration");
  return 10.0;
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

- (int64_t)context
{
  return self->_context;
}

- (void)setContext:(int64_t)a3
{
  self->_context = a3;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)configuration
{
  int64_t collectionsPerRow;
  int64_t displayStyle;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  collectionsPerRow = self->_configuration.collectionsPerRow;
  displayStyle = self->_configuration.displayStyle;
  result.var1 = collectionsPerRow;
  result.var0 = displayStyle;
  return result;
}

- (void)setConfiguration:(id)a3
{
  self->_configuration = ($6D52D4259129B2917F58F12EE7EDADA3)a3;
}

- (double)defaultCompactCollectionHeight
{
  return self->_defaultCompactCollectionHeight;
}

- (void)setDefaultCompactCollectionHeight:(double)a3
{
  self->_defaultCompactCollectionHeight = a3;
}

- (double)defaultCompactCollectionWidth
{
  return self->_defaultCompactCollectionWidth;
}

- (void)setDefaultCompactCollectionWidth:(double)a3
{
  self->_defaultCompactCollectionWidth = a3;
}

@end
