@implementation HFSimpleItemModule

- (HFSimpleItemModule)initWithItemUpdater:(id)a3 itemProviders:(id)a4 sectionBuilder:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  HFSimpleItemModule *v13;
  uint64_t v14;
  id sectionBuilder;
  uint64_t v16;
  NSSet *itemProviders;
  void *v19;
  void *v20;
  objc_super v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFSimpleItemModule.m"), 24, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("itemProviders"));

    if (v12)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFSimpleItemModule.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sectionBuilder"));

LABEL_3:
  v21.receiver = self;
  v21.super_class = (Class)HFSimpleItemModule;
  v13 = -[HFItemModule initWithItemUpdater:](&v21, sel_initWithItemUpdater_, v9);
  if (v13)
  {
    v14 = objc_msgSend(v12, "copy");
    sectionBuilder = v13->_sectionBuilder;
    v13->_sectionBuilder = (id)v14;

    v16 = objc_msgSend(v10, "copy");
    itemProviders = v13->_itemProviders;
    v13->_itemProviders = (NSSet *)v16;

  }
  return v13;
}

- (HFSimpleItemModule)initWithItemUpdater:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithItemUpdater_itemProviders_sectionBuilder_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFSimpleItemModule.m"), 37, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFSimpleItemModule initWithItemUpdater:]",
    v6);

  return 0;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD);
  void *v8;

  v4 = a3;
  -[HFItemModule allItems](self, "allItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_setByIntersectingWithSet:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFSimpleItemModule sectionBuilder](self, "sectionBuilder");
  v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v7)[2](v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSSet)itemProviders
{
  return self->_itemProviders;
}

- (void)setItemProviders:(id)a3
{
  objc_storeStrong((id *)&self->_itemProviders, a3);
}

- (id)sectionBuilder
{
  return self->_sectionBuilder;
}

- (void)setSectionBuilder:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_sectionBuilder, 0);
  objc_storeStrong((id *)&self->_itemProviders, 0);
}

@end
