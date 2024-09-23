@implementation CKMomentCollectionViewCell

+ (id)reuseIdentifier
{
  return CFSTR("CKMomentCollectionViewCell");
}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKMomentCollectionViewCell;
  -[CKMomentCollectionViewCell prepareForReuse](&v6, sel_prepareForReuse);
  -[CKMomentCollectionViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "makeObjectsPerformSelector:", sel_removeFromSuperview);

  -[CKMomentCollectionViewCell effectViews](self, "effectViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

  -[CKMomentCollectionViewCell setEffect:](self, "setEffect:", 0);
}

- (void)addEffectView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[CKMomentCollectionViewCell effectViews](self, "effectViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMomentCollectionViewCell setEffectViews:](self, "setEffectViews:", v6);

  }
  -[CKMomentCollectionViewCell contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", v4);

  -[CKMomentCollectionViewCell effectViews](self, "effectViews");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v4);

}

- (void)setupEffectIfNeeded
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  int v6;
  id v7;
  void *v8;
  unint64_t v9;
  id v10;

  -[CKMomentCollectionViewCell effect](self, "effect");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[CKMomentCollectionViewCell effectViews](self, "effectViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
  {
    -[CKMomentCollectionViewCell setClipsToBounds:](self, "setClipsToBounds:", objc_msgSend(v10, "effectIsDark"));
    if (objc_msgSend(v10, "layerCount"))
    {
      v5 = 0;
      v6 = -2;
      do
      {
        v7 = objc_alloc((Class)objc_msgSend(v10, "effectViewClass"));
        -[CKMomentCollectionViewCell bounds](self, "bounds");
        v8 = (void *)objc_msgSend(v7, "initWithFrame:");
        objc_msgSend(v8, "setUserInteractionEnabled:", 0);
        -[CKMomentCollectionViewCell addEffectView:](self, "addEffectView:", v8);
        if (v5)
        {
          if (v5 == objc_msgSend(v10, "layerCount") - 1)
            v9 = 3;
          else
            v9 = v6 / (unint64_t)(objc_msgSend(v10, "layerCount") - 2) + 1;
        }
        else
        {
          v9 = 0;
        }
        objc_msgSend(v8, "setZIndex:", v9);

        ++v5;
        v6 += 2;
      }
      while (objc_msgSend(v10, "layerCount") > v5);
    }
  }

}

- (void)animate
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[CKMomentCollectionViewCell effectViews](self, "effectViews", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "startAnimation");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)stopAnimation
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[CKMomentCollectionViewCell effectViews](self, "effectViews", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "stopAnimation");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (CKFullScreenEffect)effect
{
  return self->_effect;
}

- (void)setEffect:(id)a3
{
  objc_storeStrong((id *)&self->_effect, a3);
}

- (NSMutableArray)effectViews
{
  return self->_effectViews;
}

- (void)setEffectViews:(id)a3
{
  objc_storeStrong((id *)&self->_effectViews, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectViews, 0);
  objc_storeStrong((id *)&self->_effect, 0);
}

@end
