@implementation _HKGraphTileBackgroundRenderingContext

- (_HKGraphTileBackgroundRenderingContext)initWithGraphTile:(id)a3 graphViewRenderer:(id)a4 tileSize:(CGSize)a5 configurationChangedCounter:(int64_t)a6
{
  CGFloat height;
  CGFloat width;
  id v12;
  id v13;
  _HKGraphTileBackgroundRenderingContext *v14;
  _HKGraphTileBackgroundRenderingContext *v15;
  objc_super v17;

  height = a5.height;
  width = a5.width;
  v12 = a3;
  v13 = a4;
  v17.receiver = self;
  v17.super_class = (Class)_HKGraphTileBackgroundRenderingContext;
  v14 = -[_HKGraphTileBackgroundRenderingContext init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_graphTile, a3);
    objc_storeStrong((id *)&v15->_graphViewRenderer, a4);
    v15->_tileSize.width = width;
    v15->_tileSize.height = height;
    v15->_configurationChangedCounter = a6;
  }

  return v15;
}

- (id)debugDescription
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[_HKGraphTileBackgroundRenderingContext graphTile](self, "graphTile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("Tile %ld"), objc_msgSend(v3, "currentColumn"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)renderTileContent
{
  void *v3;
  double v4;
  double v5;
  id v6;

  -[_HKGraphTileBackgroundRenderingContext graphTile](self, "graphTile");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[_HKGraphTileBackgroundRenderingContext graphViewRenderer](self, "graphViewRenderer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HKGraphTileBackgroundRenderingContext tileSize](self, "tileSize");
  objc_msgSend(v6, "renderTileInBackgroundWithRenderer:tileSize:configurationChangedCounter:", v3, -[_HKGraphTileBackgroundRenderingContext configurationChangedCounter](self, "configurationChangedCounter"), v4, v5);

}

- (BOOL)sameForRendering:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  -[_HKGraphTileBackgroundRenderingContext graphTile](self, "graphTile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "currentColumn");
  objc_msgSend(v4, "graphTile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = v6 == objc_msgSend(v7, "currentColumn");
  return (char)v4;
}

- (HKGraphTile)graphTile
{
  return self->_graphTile;
}

- (HKGraphViewRenderer)graphViewRenderer
{
  return self->_graphViewRenderer;
}

- (CGSize)tileSize
{
  double width;
  double height;
  CGSize result;

  width = self->_tileSize.width;
  height = self->_tileSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (int64_t)configurationChangedCounter
{
  return self->_configurationChangedCounter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_graphViewRenderer, 0);
  objc_storeStrong((id *)&self->_graphTile, 0);
}

@end
