@implementation GEOResultRefinementView

- (GEOResultRefinementView)initWithSections:(id)a3
{
  id v4;
  GEOResultRefinementView *v5;
  uint64_t v6;
  NSArray *sections;
  GEOResultRefinementView *v8;
  objc_super v10;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v10.receiver = self;
    v10.super_class = (Class)GEOResultRefinementView;
    v5 = -[GEOResultRefinementView init](&v10, sel_init);
    if (v5)
    {
      v6 = objc_msgSend(v4, "copy");
      sections = v5->_sections;
      v5->_sections = (NSArray *)v6;

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

- (GEOResultRefinementView)initWithResultRefinementView:(id)a3
{
  void *v4;
  void *v5;
  GEOResultRefinementView *v6;

  -[GEOPDResultRefinementView sections]((id *)a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_geo_compactMap:", &__block_literal_global_208);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[GEOResultRefinementView initWithSections:](self, "initWithSections:", v5);
  return v6;
}

GEOResultRefinementSection *__56__GEOResultRefinementView_initWithResultRefinementView___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  GEOResultRefinementSection *v3;

  v2 = a2;
  v3 = -[GEOResultRefinementSection initWithResultRefinementSection:]([GEOResultRefinementSection alloc], "initWithResultRefinementSection:", v2);

  return v3;
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sections, 0);
}

@end
