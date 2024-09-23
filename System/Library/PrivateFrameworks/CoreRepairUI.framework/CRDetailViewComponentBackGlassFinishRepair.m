@implementation CRDetailViewComponentBackGlassFinishRepair

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = (void *)objc_opt_new();
    objc_msgSend(CFSTR("BackGlass"), "stringByAppendingString:", CFSTR("FinishRepair"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRUDetailViewComponent componentSpecifierForComponent:](self, "componentSpecifierForComponent:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v7);

    v8 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3) = (Class)v5;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (CRDetailViewComponentBackGlassFinishRepair)init
{
  CRDetailViewComponentBackGlassFinishRepair *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)CRDetailViewComponentBackGlassFinishRepair;
  v2 = -[CRUDetailViewComponent init](&v18, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    -[CRUDetailViewComponent locale](v2, "locale");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringWithKey:defaultString:", CFSTR("FINISH_REPAIR"), CFSTR("FINISH_REPAIR"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRUDetailViewComponent setTitleText:](v2, "setTitleText:", v5);

    v6 = (void *)MEMORY[0x24BDBCF48];
    -[CRUDetailViewComponent locale](v2, "locale");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithKey:defaultString:", CFSTR("FINISH_REPAIR_KB_URL"), CFSTR("FINISH_REPAIR_KB_URL"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLWithString:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRUDetailViewComponent setKbArticleURL:](v2, "setKbArticleURL:", v9);

    -[CRUDetailViewComponent locale](v2, "locale");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringWithKey:defaultString:", CFSTR("FINISH_BACKGLASS_DESC"), CFSTR("FINISH_BACKGLASS_DESC"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "mutableCopy");

    -[CRUDetailViewComponent locale](v2, "locale");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringWithKey:defaultString:", CFSTR("RESTART_FINISH_REPAIR"), CFSTR("RESTART_FINISH_REPAIR"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRUDetailViewComponent setButtonTitle:](v2, "setButtonTitle:", v14);

    -[CRUDetailViewComponent setInformativeText:](v2, "setInformativeText:", v12);
    -[CRUDetailViewComponent locale](v2, "locale");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringWithKey:defaultString:", CFSTR("BACK_GLASS"), CFSTR("BACK_GLASS"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRUDetailViewComponent setComponentName:](v2, "setComponentName:", v16);

  }
  return v2;
}

@end
