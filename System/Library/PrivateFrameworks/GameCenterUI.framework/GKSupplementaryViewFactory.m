@implementation GKSupplementaryViewFactory

+ (id)factoryForClass:(Class)a3 target:(id)a4 configurator:(SEL)a5
{
  id v7;
  GKSupplementaryViewFactory *v8;

  v7 = a4;
  v8 = -[GKSupplementaryViewFactory initWithClass:target:configurator:userData:]([GKSupplementaryViewFactory alloc], "initWithClass:target:configurator:userData:", a3, v7, a5, 0);

  return v8;
}

+ (id)factoryForClass:(Class)a3 target:(id)a4 configurator:(SEL)a5 userData:(id)a6
{
  id v9;
  id v10;
  GKSupplementaryViewFactory *v11;

  v9 = a6;
  v10 = a4;
  v11 = -[GKSupplementaryViewFactory initWithClass:target:configurator:userData:]([GKSupplementaryViewFactory alloc], "initWithClass:target:configurator:userData:", a3, v10, a5, v9);

  return v11;
}

- (GKSupplementaryViewFactory)initWithClass:(Class)a3 target:(id)a4 configurator:(SEL)a5 userData:(id)a6
{
  id v9;
  GKSupplementaryViewFactory *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  objc_super v17;

  v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)GKSupplementaryViewFactory;
  v10 = -[GKSupplementaryViewFactory init](&v17, sel_init);
  if (v10)
  {
    if (v9 && a5 && (objc_opt_respondsToSelector() & 1) == 0)
    {
      v11 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Assertion failed"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKCollectionViewDataSource.m");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "lastPathComponent");
      v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v11, "stringWithFormat:", CFSTR("%@ ([target respondsToSelector:selector])\n[%s (%s:%d)]"), v12, "-[GKSupplementaryViewFactory initWithClass:target:configurator:userData:]", objc_msgSend(v14, "UTF8String"), 169);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v15);
    }
    objc_storeStrong((id *)&v10->_reusableViewClass, a3);
    objc_storeWeak(&v10->_target, v9);
    v10->_configurator = a5;
  }

  return v10;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  SEL configurator;
  void *v12;

  v8 = a5;
  objc_msgSend(a3, "_gkDequeueSupplementaryViewForClass:ofKind:forIndexPath:", self->_reusableViewClass, a4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKSupplementaryViewFactory target](self, "target");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    configurator = self->_configurator;

    if (configurator)
    {
      -[GKSupplementaryViewFactory target](self, "target");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, self->_configurator, v9, v8);

    }
  }

  return v9;
}

- (id)target
{
  return objc_loadWeakRetained(&self->_target);
}

- (void)setTarget:(id)a3
{
  objc_storeWeak(&self->_target, a3);
}

- (Class)reusableViewClass
{
  return self->_reusableViewClass;
}

- (void)setReusableViewClass:(Class)a3
{
  objc_storeStrong((id *)&self->_reusableViewClass, a3);
}

- (SEL)configurator
{
  return self->_configurator;
}

- (SEL)selector
{
  return self->_selector;
}

- (void)setSelector:(SEL)a3
{
  self->_selector = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reusableViewClass, 0);
  objc_destroyWeak(&self->_target);
}

@end
