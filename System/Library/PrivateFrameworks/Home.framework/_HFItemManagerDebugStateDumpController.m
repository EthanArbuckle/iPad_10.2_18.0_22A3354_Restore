@implementation _HFItemManagerDebugStateDumpController

- (void)registerItemManager:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_HFItemManagerDebugStateDumpController itemManagers](self, "itemManagers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (NSHashTable)itemManagers
{
  return self->_itemManagers;
}

+ (id)sharedInstance
{
  if (_MergedGlobals_212 != -1)
    dispatch_once(&_MergedGlobals_212, &__block_literal_global_65);
  return (id)qword_1ED378C30;
}

- (_HFItemManagerDebugStateDumpController)init
{
  _HFItemManagerDebugStateDumpController *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  _HFItemManagerDebugStateDumpController *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_HFItemManagerDebugStateDumpController;
  v2 = -[_HFItemManagerDebugStateDumpController init](&v9, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HFItemManagerDebugStateDumpController setItemManagers:](v2, "setItemManagers:", v3);

    +[HFDebugStateDumpManager sharedInstance](HFDebugStateDumpManager, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __46___HFItemManagerDebugStateDumpController_init__block_invoke;
    v7[3] = &unk_1EA7275C0;
    v8 = v2;
    v5 = (id)objc_msgSend(v4, "registerStateDumpHandler:withName:", v7, CFSTR("HFItemManager"));

  }
  return v2;
}

- (void)setItemManagers:(id)a3
{
  objc_storeStrong((id *)&self->_itemManagers, a3);
}

- (id)_performStateDump
{
  void *v2;
  void *v3;
  void *v4;

  -[_HFItemManagerDebugStateDumpController itemManagers](self, "itemManagers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_map:", &__block_literal_global_73);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemManagers, 0);
}

@end
