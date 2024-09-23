@implementation GEOResultRefinementBar

- (GEOResultRefinementBar)initWithResultRefinements:(id)a3
{
  id v4;
  GEOResultRefinementBar *v5;
  uint64_t v6;
  NSArray *resultRefinements;
  GEOResultRefinementBar *v8;
  objc_super v10;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v10.receiver = self;
    v10.super_class = (Class)GEOResultRefinementBar;
    v5 = -[GEOResultRefinementBar init](&v10, sel_init);
    if (v5)
    {
      v6 = objc_msgSend(v4, "copy");
      resultRefinements = v5->_resultRefinements;
      v5->_resultRefinements = (NSArray *)v6;

    }
    self = v5;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (GEOResultRefinementBar)initWithResultRefinementBar:(id)a3
{
  void *v4;
  void *v5;
  GEOResultRefinementBar *v6;

  -[GEOPDResultRefinementBar resultRefinements]((id *)a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_geo_compactMap:", &__block_literal_global_95);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[GEOResultRefinementBar initWithResultRefinements:](self, "initWithResultRefinements:", v5);
  return v6;
}

GEOResultRefinement *__54__GEOResultRefinementBar_initWithResultRefinementBar___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  GEOResultRefinement *v3;

  v2 = a2;
  v3 = -[GEOResultRefinement initWithResultRefinement:]([GEOResultRefinement alloc], "initWithResultRefinement:", v2);

  return v3;
}

- (NSArray)resultRefinements
{
  return self->_resultRefinements;
}

- (void)setResultRefinements:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultRefinements, 0);
}

@end
