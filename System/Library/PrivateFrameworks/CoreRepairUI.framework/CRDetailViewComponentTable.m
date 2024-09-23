@implementation CRDetailViewComponentTable

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    -[CRDetailViewComponentTable setTitle:](self, "setTitle:", 0);
    v5 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", &stru_24F4D7158, self, 0, 0, 0, 4, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setIdentifier:", CFSTR("ABOUT_PARTS_AND_SERVICE_HISTORY"));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", NSClassFromString(CFSTR("CoreRepairUI.PartsAndServicePlacardCell")), *MEMORY[0x24BE75948]);
    v7 = (void *)objc_opt_new();
    objc_msgSend(v7, "getCurrentDetailsWithPrivacySpecifier:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "count"))
    {
      objc_msgSend(v5, "addObject:", v6);
      objc_msgSend(v5, "addObjectsFromArray:", v8);
    }
    v9 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3) = (Class)v5;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  }
  return v4;
}

@end
