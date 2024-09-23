@implementation LaunchStateController

uint64_t __53__LaunchStateController_applicationUIDidBecomeActive__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

- (void)doAfterUIBecomesActive:(id)a3
{
  NSMutableArray *actionBlocks;
  id v4;

  if (self->_hasCompletedLaunch)
  {
    (*((void (**)(id))a3 + 2))(a3);
  }
  else
  {
    actionBlocks = self->_actionBlocks;
    v4 = _Block_copy(a3);
    -[NSMutableArray addObject:](actionBlocks, "addObject:", v4);

  }
}

+ (id)sharedController
{
  if (sharedController_onceToken_0 != -1)
    dispatch_once(&sharedController_onceToken_0, &__block_literal_global_66);
  return (id)sharedController_sharedController_0;
}

- (BOOL)hasCompletedLaunch
{
  return self->_hasCompletedLaunch;
}

- (void)applicationUIDidBecomeActive
{
  uint64_t v2;
  _QWORD block[5];

  if (!self->_hasCompletedLaunch)
  {
    v2 = MEMORY[0x1E0C809B0];
    self->_hasCompletedLaunch = 1;
    block[0] = v2;
    block[1] = 3221225472;
    block[2] = __53__LaunchStateController_applicationUIDidBecomeActive__block_invoke;
    block[3] = &unk_1E9CF1900;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

uint64_t __53__LaunchStateController_applicationUIDidBecomeActive__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "enumerateObjectsUsingBlock:", &__block_literal_global_4);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeAllObjects");
}

void __41__LaunchStateController_sharedController__block_invoke()
{
  LaunchStateController *v0;
  void *v1;

  v0 = objc_alloc_init(LaunchStateController);
  v1 = (void *)sharedController_sharedController_0;
  sharedController_sharedController_0 = (uint64_t)v0;

}

- (LaunchStateController)init
{
  LaunchStateController *v2;
  uint64_t v3;
  NSMutableArray *actionBlocks;
  LaunchStateController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)LaunchStateController;
  v2 = -[LaunchStateController init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    actionBlocks = v2->_actionBlocks;
    v2->_actionBlocks = (NSMutableArray *)v3;

    v5 = v2;
  }

  return v2;
}

- (void)forceMarkUIBecomeActiveForTesting
{
  if (!self->_hasCompletedLaunch)
  {
    self->_hasCompletedLaunch = 1;
    -[NSMutableArray enumerateObjectsUsingBlock:](self->_actionBlocks, "enumerateObjectsUsingBlock:", &__block_literal_global_3_0);
    -[NSMutableArray removeAllObjects](self->_actionBlocks, "removeAllObjects");
  }
}

uint64_t __58__LaunchStateController_forceMarkUIBecomeActiveForTesting__block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionBlocks, 0);
}

@end
