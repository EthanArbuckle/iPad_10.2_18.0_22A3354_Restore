@implementation MUPlaceTilesViewConfiguration

- (MUPlaceTilesViewConfiguration)init
{
  MUPlaceTilesViewConfiguration *v2;
  MUPlaceTileCellConfiguration *v3;
  MUPlaceTileCellConfiguration *cellConfiguration;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MUPlaceTilesViewConfiguration;
  v2 = -[MUPlaceTilesViewConfiguration init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MUPlaceTileCellConfiguration);
    cellConfiguration = v2->_cellConfiguration;
    v2->_cellConfiguration = v3;

    -[MUPlaceTileCellConfiguration setShowIcon:](v2->_cellConfiguration, "setShowIcon:", 1);
    -[MUPlaceTileCellConfiguration setShowCuratedPhoto:](v2->_cellConfiguration, "setShowCuratedPhoto:", 1);
    v2->_numberOfRows = 1;
  }
  return v2;
}

+ (id)annotatedListConfiguration
{
  MUPlaceTilesViewConfiguration *v2;
  void *v3;

  v2 = objc_alloc_init(MUPlaceTilesViewConfiguration);
  -[MUPlaceTilesViewConfiguration setVertical:](v2, "setVertical:", 0);
  -[MUPlaceTilesViewConfiguration cellConfiguration](v2, "cellConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setShowIcon:", 0);
  objc_msgSend(v3, "setShowCuratedPhoto:", 1);
  objc_msgSend(v3, "setVariant:", 0);

  return v2;
}

+ (id)hikingTrailsConfiguration
{
  MUPlaceTilesViewConfiguration *v2;
  void *v3;

  v2 = objc_alloc_init(MUPlaceTilesViewConfiguration);
  -[MUPlaceTilesViewConfiguration setVertical:](v2, "setVertical:", 0);
  -[MUPlaceTilesViewConfiguration cellConfiguration](v2, "cellConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setShowIcon:", 0);
  objc_msgSend(v3, "setShowCuratedPhoto:", 1);
  objc_msgSend(v3, "setVariant:", 0);

  return v2;
}

+ (id)configurationFromModuleConfiguration:(id)a3
{
  id v3;
  MUPlaceTilesViewConfiguration *v4;
  MUPlaceTilesViewConfiguration *v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a3;
  v4 = objc_alloc_init(MUPlaceTilesViewConfiguration);
  v5 = v4;
  if (v3)
  {
    -[MUPlaceTilesViewConfiguration cellConfiguration](v4, "cellConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v3, "layoutVariant");
    v8 = 0;
    v9 = 1;
    v10 = 1;
    switch(v7)
    {
      case 0:
      case 2:
        goto LABEL_8;
      case 1:
        v9 = 0;
        v8 = 0;
        goto LABEL_8;
      case 3:
        v10 = 0;
        v9 = 1;
        goto LABEL_7;
      case 4:
        v9 = 0;
        v10 = 0;
LABEL_7:
        v8 = 1;
LABEL_8:
        objc_msgSend(v6, "setShowIcon:", v9);
        objc_msgSend(v6, "setShowCuratedPhoto:", v10);
        objc_msgSend(v6, "setVariant:", v8);
        break;
      default:
        break;
    }
    if (objc_msgSend(v3, "isVertical", v9))
      objc_msgSend(v6, "setVariant:", 2);
    -[MUPlaceTilesViewConfiguration setVertical:](v5, "setVertical:", objc_msgSend(v3, "isVertical"));
    -[MUPlaceTilesViewConfiguration setNumberOfRows:](v5, "setNumberOfRows:", objc_msgSend(v3, "numberOfRows"));
  }
  else
  {
    -[MUPlaceTilesViewConfiguration setVertical:](v4, "setVertical:", 0);
    -[MUPlaceTilesViewConfiguration cellConfiguration](v5, "cellConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setShowIcon:", 1);
    objc_msgSend(v6, "setShowCuratedPhoto:", 1);
    objc_msgSend(v6, "setVariant:", 0);
  }

  return v5;
}

- (MUPlaceTileCellConfiguration)cellConfiguration
{
  return self->_cellConfiguration;
}

- (BOOL)isVertical
{
  return self->_vertical;
}

- (void)setVertical:(BOOL)a3
{
  self->_vertical = a3;
}

- (unint64_t)numberOfRows
{
  return self->_numberOfRows;
}

- (void)setNumberOfRows:(unint64_t)a3
{
  self->_numberOfRows = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellConfiguration, 0);
}

@end
