@implementation NPKTileActionItem

- (NPKTileActionItem)initWithTile:(id)a3 action:(id)a4
{
  id v7;
  id v8;
  NPKTileActionItem *v9;
  NPKTileActionItem *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NPKTileActionItem;
  v9 = -[NPKTileActionItem init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_tile, a3);
    objc_storeStrong((id *)&v10->_action, a4);
  }

  return v10;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[NPKTileActionItem tile](self, "tile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKTileActionItem action](self, "action");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p\n\tTile: %@\n\tAction: %@\n>"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (PKPassTile)tile
{
  return self->_tile;
}

- (PKPaymentPassAction)action
{
  return self->_action;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_tile, 0);
}

@end
