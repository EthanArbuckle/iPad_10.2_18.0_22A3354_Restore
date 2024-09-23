@implementation GEOMapItemChildItem

- (GEOMapItemChildItem)initWithChildItem:(id)a3
{
  id *v4;
  GEOMapItemChildItem *v5;
  int v6;
  uint64_t v7;
  void *v8;
  GEOMapItemChildPlace *v9;
  void *v10;
  uint64_t v11;
  GEOMapItemChildPlace *childItemPlace;
  void *v13;
  GEOMapItemChildAction *v14;
  void *v15;
  uint64_t v16;
  GEOMapItemChildAction *childItemAction;
  GEOMapItemChildItem *v18;
  objc_super v20;

  v4 = (id *)a3;
  v20.receiver = self;
  v20.super_class = (Class)GEOMapItemChildItem;
  v5 = -[GEOMapItemChildItem init](&v20, sel_init);
  if (!v5)
    goto LABEL_10;
  v6 = -[GEOPDChildItem childItemType]((uint64_t)v4);
  v7 = 2 * (v6 == 2);
  if (v6 == 1)
    v7 = 1;
  v5->_childItemType = v7;
  -[GEOPDChildItem childPlace](v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = [GEOMapItemChildPlace alloc];
    -[GEOPDChildItem childPlace](v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[GEOMapItemChildPlace initWithChildPlace:](v9, "initWithChildPlace:", v10);
    childItemPlace = v5->_childItemPlace;
    v5->_childItemPlace = (GEOMapItemChildPlace *)v11;

  }
  -[GEOPDChildItem childAction](v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = [GEOMapItemChildAction alloc];
    -[GEOPDChildItem childAction](v4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[GEOMapItemChildAction initWithChildAction:](v14, "initWithChildAction:", v15);
    childItemAction = v5->_childItemAction;
    v5->_childItemAction = (GEOMapItemChildAction *)v16;

  }
  if (v5->_childItemPlace || v5->_childItemAction)
LABEL_10:
    v18 = v5;
  else
    v18 = 0;

  return v18;
}

- (GEOMapItemChildItem)initWithChildPlace:(id)a3
{
  id v4;
  GEOMapItemChildItem *v5;
  GEOMapItemChildItem *v6;
  GEOMapItemChildPlace *v7;
  GEOMapItemChildPlace *childItemPlace;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOMapItemChildItem;
  v5 = -[GEOMapItemChildItem init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_childItemType = 1;
    v7 = -[GEOMapItemChildPlace initWithChildPlace:]([GEOMapItemChildPlace alloc], "initWithChildPlace:", v4);
    childItemPlace = v6->_childItemPlace;
    v6->_childItemPlace = v7;

  }
  return v6;
}

- (GEOMapItemChildItem)initWithPublisherResult:(id)a3
{
  id v5;
  GEOMapItemChildItem *v6;
  GEOMapItemChildItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOMapItemChildItem;
  v6 = -[GEOMapItemChildItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_childItemType = 3;
    objc_storeStrong((id *)&v6->_publisherResult, a3);
  }

  return v7;
}

- (int64_t)childItemType
{
  return self->_childItemType;
}

- (void)setChildItemType:(int64_t)a3
{
  self->_childItemType = a3;
}

- (GEOMapItemChildPlace)childItemPlace
{
  return self->_childItemPlace;
}

- (void)setChildItemPlace:(id)a3
{
  objc_storeStrong((id *)&self->_childItemPlace, a3);
}

- (GEOMapItemChildAction)childItemAction
{
  return self->_childItemAction;
}

- (void)setChildItemAction:(id)a3
{
  objc_storeStrong((id *)&self->_childItemAction, a3);
}

- (GEOPublisherResult)publisherResult
{
  return self->_publisherResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publisherResult, 0);
  objc_storeStrong((id *)&self->_childItemAction, 0);
  objc_storeStrong((id *)&self->_childItemPlace, 0);
}

@end
