@implementation MKPlaceBatchableCompactCollection

- (MKPlaceBatchableCompactCollection)initWithIdentifier:(id)a3
{
  id v5;
  MKPlaceBatchableCompactCollection *v6;
  MKPlaceBatchableCompactCollection *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MKPlaceBatchableCompactCollection;
  v6 = -[MKPlaceBatchableCompactCollection init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_guideLocationIdentifier, a3);

  return v7;
}

- (MKPlaceBatchableCompactCollection)initWithWorldwideViewModel:(id)a3
{
  id v5;
  MKPlaceBatchableCompactCollection *v6;
  MKPlaceBatchableCompactCollection *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MKPlaceBatchableCompactCollection;
  v6 = -[MKPlaceBatchableCompactCollection init](&v9, sel_init);
  v7 = v6;
  if (v5)
    objc_storeStrong((id *)&v6->_viewModel, a3);

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[MKPlaceBatchableCompactCollection guideLocationIdentifier](self, "guideLocationIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "muid");
  -[MKPlaceCompactCollectionViewModel title](self->_viewModel, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%llu - %@"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  MKPlaceBatchableCompactCollection *v4;
  MKPlaceBatchableCompactCollection *v5;
  MKPlaceBatchableCompactCollection *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (MKPlaceBatchableCompactCollection *)a3;
  v5 = v4;
  if (self == v4)
  {
    v10 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    -[MKPlaceBatchableCompactCollection guideLocationIdentifier](self, "guideLocationIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKPlaceBatchableCompactCollection guideLocationIdentifier](v6, "guideLocationIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", v8))
    {
      -[MKPlaceBatchableCompactCollection viewModel](self, "viewModel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqual:", v6);

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (MKMapItemIdentifier)guideLocationIdentifier
{
  return self->_guideLocationIdentifier;
}

- (MKPlaceCompactCollectionViewModel)viewModel
{
  return self->_viewModel;
}

- (void)setViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_viewModel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_guideLocationIdentifier, 0);
}

@end
