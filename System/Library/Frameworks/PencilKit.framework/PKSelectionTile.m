@implementation PKSelectionTile

- (PKSelectionTile)initWithProperties:(id)a3
{
  id v4;
  PKSelectionTile *v5;
  uint64_t v6;
  PKSelectionTileProperties *properties;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKSelectionTile;
  v5 = -[PKSelectionTile init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    properties = v5->_properties;
    v5->_properties = (PKSelectionTileProperties *)v6;

    -[PKSelectionTile setMasksToBounds:](v5, "setMasksToBounds:", 1);
    -[PKSelectionTile setShouldRasterize:](v5, "setShouldRasterize:", 1);
  }

  return v5;
}

- (PKSelectionTileProperties)properties
{
  return self->_properties;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
}

@end
