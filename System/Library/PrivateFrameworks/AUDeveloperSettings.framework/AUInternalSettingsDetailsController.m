@implementation AUInternalSettingsDetailsController

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AUInternalSettingsDetailsController;
  -[AUInternalSettingsDetailsController viewDidLoad](&v3, sel_viewDidLoad);
  -[AUInternalSettingsDetailsController setTitle:](self, "setTitle:", CFSTR("Details"));
}

- (id)specifiers
{
  AUInternalSettingsDetailsController *v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&v2->super.super.super.super.super.isa + v3);
  if (v4)
  {
    v5 = v4;
  }
  else
  {
    v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCellType:", 4);
    objc_msgSend(v7, "setName:", v2->description);
    objc_msgSend(v6, "addObject:", v7);
    v8 = *(Class *)((char *)&v2->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&v2->super.super.super.super.super.isa + v3) = (Class)v6;
    v9 = v6;

    v5 = *(id *)((char *)&v2->super.super.super.super.super.isa + v3);
  }
  objc_sync_exit(v2);

  return v5;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a4;
  objc_msgSend(v5, "textLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNumberOfLines:", 0);

  objc_msgSend(v5, "textLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLineBreakMode:", 0);

  objc_msgSend(v5, "textLabel");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setContentMode:", 0);
}

- (NSString)description
{
  return (NSString *)objc_getProperty(self, a2, 1376, 1);
}

- (void)setDescription:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 1376);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->description, 0);
}

@end
