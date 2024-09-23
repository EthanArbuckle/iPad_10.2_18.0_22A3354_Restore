@implementation MURouteActivityProvider

- (MURouteActivityProvider)initWithSource:(id)a3 destination:(id)a4
{
  id v7;
  MURouteActivityProvider *v8;
  MURouteActivityProvider *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MURouteActivityProvider;
  v8 = -[MUPlaceActivityProvider initWithMapItem:](&v11, sel_initWithMapItem_, a4);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_sourceMapItem, a3);
    v9->_transportType = 1;
  }

  return v9;
}

- (id)activityURL
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  -[MUPlaceActivityProvider delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0
    || (-[MUPlaceActivityProvider delegate](self, "delegate"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "urlForMapActivity:", self),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        !v6))
  {
    objc_msgSend(MEMORY[0x1E0CC1970], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "userInterfaceIdiom");

    if (v8 == 2)
    {
      -[MURouteActivityProvider sourceMapItem](self, "sourceMapItem");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "place");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[MURouteActivityProvider sourceMapItem](self, "sourceMapItem");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_addressFormattedAsSinglelineAddress");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      __38__MURouteActivityProvider_activityURL__block_invoke(v11, v13);
      v14 = (id)objc_claimAutoreleasedReturnValue();

      -[MUPlaceActivityProvider mapItem](self, "mapItem");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "place");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "name");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUPlaceActivityProvider mapItem](self, "mapItem");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "_addressFormattedAsSinglelineAddress");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      __38__MURouteActivityProvider_activityURL__block_invoke(v17, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CC1A50], "URLForDirectionsFrom:to:transport:", v14, v20, -[MURouteActivityProvider transportType](self, "transportType"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = objc_alloc_init(MEMORY[0x1E0CC19D0]);
      -[MURouteActivityProvider sourceMapItem](self, "sourceMapItem");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUPlaceActivityProvider mapItem](self, "mapItem");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "urlForDirectionsFromMapItem:toMapItem:transportType:options:", v20, v21, -[MURouteActivityProvider transportType](self, "transportType"), 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  return v6;
}

id __38__MURouteActivityProvider_activityURL__block_invoke(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;

  v3 = a1;
  v4 = a2;
  if (objc_msgSend(v3, "length") && objc_msgSend(v4, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@, %@"), v3, v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v4)
      v6 = v4;
    else
      v6 = v3;
    v5 = v6;
  }
  v7 = v5;

  return v7;
}

- (id)activitySourceTitle
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[MUPlaceActivityProvider delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[MUPlaceActivityProvider delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sourceTitleForMapActivity:", self);
  }
  else
  {
    -[MURouteActivityProvider sourceMapItem](self, "sourceMapItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (MKMapItem)sourceMapItem
{
  return self->_sourceMapItem;
}

- (void)setSourceMapItem:(id)a3
{
  objc_storeStrong((id *)&self->_sourceMapItem, a3);
}

- (unint64_t)transportType
{
  return self->_transportType;
}

- (void)setTransportType:(unint64_t)a3
{
  self->_transportType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceMapItem, 0);
}

@end
