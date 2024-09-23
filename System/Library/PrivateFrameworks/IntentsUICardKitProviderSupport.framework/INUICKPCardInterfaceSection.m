@implementation INUICKPCardInterfaceSection

- (INUICKPCardInterfaceSection)initWithInteractiveBehavior:(unint64_t)a3 parameters:(id)a4
{
  id v7;
  INUICKPCardInterfaceSection *v8;
  INUICKPCardInterfaceSection *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)INUICKPCardInterfaceSection;
  v8 = -[INUIInterfaceSection initWithInteractiveBehavior:parameters:](&v11, sel_initWithInteractiveBehavior_parameters_, a3, v7);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_cardSectionParameters, a4);

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  INUICKPCardInterfaceSection *v4;
  INUICKPCardInterfaceSection *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  objc_super v12;

  v4 = (INUICKPCardInterfaceSection *)a3;
  if (v4 == self)
  {
    v10 = 1;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)INUICKPCardInterfaceSection;
    if (-[INUIInterfaceSection isEqual:](&v12, sel_isEqual_, v4)
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v5 = v4;
      -[INUICKPCardInterfaceSection cardSection](self, "cardSection");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "cardSectionIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[INUICKPCardInterfaceSection cardSection](v5, "cardSection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "cardSectionIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v7, "isEqualToString:", v9);

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)INUICKPCardInterfaceSection;
  v3 = -[INUIInterfaceSection hash](&v5, sel_hash);
  return -[CRCardSection hash](self->_cardSection, "hash") ^ v3;
}

- (BOOL)isWildCardSection
{
  void *v3;
  void *v4;
  BOOL v5;

  -[INUICKPCardInterfaceSection parameters](self, "parameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[INUICKPCardInterfaceSection parameters](self, "parameters");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count") == 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSSet)parameters
{
  return self->_cardSectionParameters;
}

- (void)setParameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (CRCardSection)cardSection
{
  return self->_cardSection;
}

- (void)setCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_cardSection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardSection, 0);
  objc_storeStrong((id *)&self->_cardSectionParameters, 0);
}

@end
