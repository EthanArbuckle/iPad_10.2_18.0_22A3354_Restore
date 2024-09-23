@implementation TabCollectionViewBlockObserver

+ (id)observerMap
{
  if (observerMap_onceToken != -1)
    dispatch_once(&observerMap_onceToken, &__block_literal_global_46);
  return (id)observerMap_map;
}

void __45__TabCollectionViewBlockObserver_observerMap__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)observerMap_map;
  observerMap_map = v0;

}

+ (void)beginObservingTabView:(id)a3 steadyStateBlock:(id)a4
{
  id v5;
  void *v6;
  TabCollectionViewBlockObserver *v7;
  void *v8;
  id v9;

  v9 = a3;
  v5 = a4;
  +[TabCollectionViewBlockObserver observerMap](TabCollectionViewBlockObserver, "observerMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v9);
  v7 = (TabCollectionViewBlockObserver *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v7 = objc_alloc_init(TabCollectionViewBlockObserver);
    objc_msgSend(v9, "addPresentationObserver:", v7);
    +[TabCollectionViewBlockObserver observerMap](TabCollectionViewBlockObserver, "observerMap");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v7, v9);

  }
  -[TabCollectionViewBlockObserver setSteadyStateBlock:](v7, "setSteadyStateBlock:", v5);

}

+ (void)endObservingTabView:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  +[TabCollectionViewBlockObserver observerMap](TabCollectionViewBlockObserver, "observerMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v6, "removePresentationObserver:", v4);
    +[TabCollectionViewBlockObserver observerMap](TabCollectionViewBlockObserver, "observerMap");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObjectForKey:", v6);

  }
}

+ (void)performIgnoringObservationForTabView:(id)a3 block:(id)a4
{
  void (**v5)(_QWORD);
  id v6;
  void *v7;
  char v8;
  void *v9;
  _BYTE *v10;

  v5 = (void (**)(_QWORD))a4;
  v6 = a3;
  +[TabCollectionViewBlockObserver observerMap](TabCollectionViewBlockObserver, "observerMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v10 = (_BYTE *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v8 = v10[8];
    v10[8] = 1;
    v5[2](v5);

    v9 = v10;
    v10[8] = v8;
  }
  else
  {
    v5[2](v5);

    v9 = 0;
  }

}

- (void)tabCollectionView:(id)a3 didChangeSteadyState:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void (**steadyStateBlock)(id, _BOOL8);
  id v8;

  v4 = a4;
  v6 = a3;
  if (!self->_ignoreUpdates)
  {
    steadyStateBlock = (void (**)(id, _BOOL8))self->_steadyStateBlock;
    if (steadyStateBlock)
    {
      v8 = v6;
      steadyStateBlock[2](steadyStateBlock, v4);
      v6 = v8;
    }
  }

}

- (id)steadyStateBlock
{
  return self->_steadyStateBlock;
}

- (void)setSteadyStateBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_steadyStateBlock, 0);
}

@end
