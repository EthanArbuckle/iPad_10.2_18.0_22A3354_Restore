@implementation GEOResultRefinementGroup

- (GEOResultRefinementGroup)initWithResultRefinementBar:(id)a3 resultRefinementView:(id)a4 refinementSessionState:(id)a5
{
  id v9;
  id v10;
  id v11;
  GEOResultRefinementGroup *v12;
  id *p_isa;
  GEOResultRefinementGroup *v14;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)GEOResultRefinementGroup;
  v12 = -[GEOResultRefinementGroup init](&v16, sel_init);
  p_isa = (id *)&v12->super.isa;
  if (v12)
  {
    if (!v9)
    {
      v14 = 0;
      goto LABEL_6;
    }
    objc_storeStrong((id *)&v12->_resultRefinementBar, a3);
    objc_storeStrong(p_isa + 2, a4);
    objc_storeStrong(p_isa + 3, a5);
  }
  v14 = p_isa;
LABEL_6:

  return v14;
}

- (GEOResultRefinementGroup)initWithResultRefinementGroup:(id)a3
{
  id *v4;
  GEOResultRefinementBar *v5;
  void *v6;
  GEOResultRefinementBar *v7;
  GEOResultRefinementView *v8;
  void *v9;
  GEOResultRefinementView *v10;
  void *v11;
  GEOResultRefinementGroup *v12;

  v4 = (id *)a3;
  v5 = [GEOResultRefinementBar alloc];
  -[GEOPDResultRefinementGroup resultRefinementBar](v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[GEOResultRefinementBar initWithResultRefinementBar:](v5, "initWithResultRefinementBar:", v6);

  v8 = [GEOResultRefinementView alloc];
  -[GEOPDResultRefinementGroup resultRefinementView](v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[GEOResultRefinementView initWithResultRefinementView:](v8, "initWithResultRefinementView:", v9);

  -[GEOPDResultRefinementGroup refinementSessionState](v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[GEOResultRefinementGroup initWithResultRefinementBar:resultRefinementView:refinementSessionState:](self, "initWithResultRefinementBar:resultRefinementView:refinementSessionState:", v7, v10, v11);
  return v12;
}

- (GEOResultRefinementBar)resultRefinementBar
{
  return self->_resultRefinementBar;
}

- (void)setResultRefinementBar:(id)a3
{
  objc_storeStrong((id *)&self->_resultRefinementBar, a3);
}

- (GEOResultRefinementView)resultRefinementView
{
  return self->_resultRefinementView;
}

- (void)setResultRefinementView:(id)a3
{
  objc_storeStrong((id *)&self->_resultRefinementView, a3);
}

- (GEOPDRefinementSessionState)refinementSessionState
{
  return self->_refinementSessionState;
}

- (void)setRefinementSessionState:(id)a3
{
  objc_storeStrong((id *)&self->_refinementSessionState, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_refinementSessionState, 0);
  objc_storeStrong((id *)&self->_resultRefinementView, 0);
  objc_storeStrong((id *)&self->_resultRefinementBar, 0);
}

@end
