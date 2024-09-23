@implementation CKCustomAppMenuItem

- (CKCustomAppMenuItem)initWithIdentifier:(id)a3 displayName:(id)a4
{
  id v7;
  id v8;
  CKCustomAppMenuItem *v9;
  CKCustomAppMenuItem *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CKCustomAppMenuItem;
  v9 = -[CKCustomAppMenuItem init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->___ck_identifier, a3);
    objc_storeStrong((id *)&v10->___ck_displayName, a4);
  }

  return v10;
}

- (id)__ck_imageForTraitCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CKCustomAppMenuItem __ck_identifier](self, "__ck_identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKAppMenuDataSource imageForIdentifier:traitCollection:](CKAppMenuDataSource, "imageForIdentifier:traitCollection:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)__ck_displayName
{
  return self->___ck_displayName;
}

- (id)__ck_identifier
{
  return self->___ck_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->___ck_identifier, 0);
  objc_storeStrong((id *)&self->___ck_displayName, 0);
}

@end
