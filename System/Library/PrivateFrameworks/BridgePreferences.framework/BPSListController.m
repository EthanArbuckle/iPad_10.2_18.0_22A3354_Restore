@implementation BPSListController

- (void)prepareSpecifiersMetadata
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  objc_super v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v16.receiver = self;
  v16.super_class = (Class)BPSListController;
  -[BPSListController prepareSpecifiersMetadata](&v16, sel_prepareSpecifiersMetadata);
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]);
  if (v3)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v13;
      v8 = *MEMORY[0x24BE75868];
      v9 = MEMORY[0x24BDBD1C8];
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v4);
          v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          if (objc_msgSend(v11, "cellType", (_QWORD)v12) != 1)
            objc_msgSend(v11, "setProperty:forKey:", v9, v8);
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
      }
      while (v6);
    }

  }
}

- (int64_t)tableViewStyle
{
  void *v2;
  int v3;

  objc_msgSend(MEMORY[0x24BDF6FF8], "keyWindow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = PSShouldInsetListView();

  if (v3)
    return 2;
  else
    return 1;
}

uint64_t __36__BPSListController_viewWillAppear___block_invoke(uint64_t a1)
{
  uint64_t result;
  objc_super v3;

  result = objc_msgSend(*(id *)(a1 + 32), "deferringReloadSpecifiers");
  if ((_DWORD)result)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "_readyToReloadSpecifiers");
    if ((_DWORD)result)
    {
      NSLog(CFSTR("BPSListController: Deferred reloading specifiers, reloading now in %s"), "-[BPSListController viewWillAppear:]_block_invoke");
      v3.receiver = *(id *)(a1 + 32);
      v3.super_class = (Class)BPSListController;
      objc_msgSendSuper2(&v3, sel_reloadSpecifiers);
      return objc_msgSend(*(id *)(a1 + 32), "setDeferringReloadSpecifiers:", 0);
    }
  }
  return result;
}

- (void)viewWillAppear:(BOOL)a3
{
  dispatch_time_t v4;
  _QWORD block[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BPSListController;
  -[BPSListController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  if (-[BPSListController deferringReloadSpecifiers](self, "deferringReloadSpecifiers"))
  {
    v4 = dispatch_time(0, 20000000);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __36__BPSListController_viewWillAppear___block_invoke;
    block[3] = &unk_24CBE4838;
    block[4] = self;
    dispatch_after(v4, MEMORY[0x24BDAC9B8], block);
  }
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BPSListController;
  -[BPSListController viewDidLayoutSubviews](&v4, sel_viewDidLayoutSubviews);
  if (-[BPSListController deferringReloadSpecifiers](self, "deferringReloadSpecifiers"))
  {
    NSLog(CFSTR("BPSListController: Deferred reloading specifiers, reloading now in %s"), "-[BPSListController viewDidLayoutSubviews]");
    v3.receiver = self;
    v3.super_class = (Class)BPSListController;
    -[BPSListController reloadSpecifiers](&v3, sel_reloadSpecifiers);
    -[BPSListController setDeferringReloadSpecifiers:](self, "setDeferringReloadSpecifiers:", 0);
  }
}

- (BOOL)deferringReloadSpecifiers
{
  return self->_deferringReloadSpecifiers;
}

- (void)setDeferringReloadSpecifiers:(BOOL)a3
{
  self->_deferringReloadSpecifiers = a3;
}

- (void)reloadSpecifiers
{
  objc_class *v3;
  void *v4;
  objc_super v5;

  if (-[BPSListController _readyToReloadSpecifiers](self, "_readyToReloadSpecifiers"))
  {
    v5.receiver = self;
    v5.super_class = (Class)BPSListController;
    -[BPSListController reloadSpecifiers](&v5, sel_reloadSpecifiers);
  }
  else
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("BPSListController: Error: %@ called reload specifiers with the view offscreen, waiting until next layout pass to avoid UI problems."), v4);

    -[BPSListController setDeferringReloadSpecifiers:](self, "setDeferringReloadSpecifiers:", 1);
  }
}

- (BOOL)_readyToReloadSpecifiers
{
  void *v3;
  void *v4;
  BOOL v5;

  if (!-[BPSListController isViewLoaded](self, "isViewLoaded"))
    return 0;
  -[BPSListController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

@end
