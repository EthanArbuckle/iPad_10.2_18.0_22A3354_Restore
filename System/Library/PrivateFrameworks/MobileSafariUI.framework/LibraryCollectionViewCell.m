@implementation LibraryCollectionViewCell

- (void)setAccessories:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[LibraryCollectionViewCell _updateAccessories:](self, "_updateAccessories:", v4);
  v5.receiver = self;
  v5.super_class = (Class)LibraryCollectionViewCell;
  -[LibraryCollectionViewCell setAccessories:](&v5, sel_setAccessories_, v4);

}

- (void)updateConfigurationUsingState:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)LibraryCollectionViewCell;
  -[LibraryCollectionViewCell updateConfigurationUsingState:](&v5, sel_updateConfigurationUsingState_, a3);
  -[LibraryCollectionViewCell accessories](self, "accessories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LibraryCollectionViewCell _updateAccessories:](self, "_updateAccessories:", v4);

}

- (void)_updateAccessories:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v10 = v9;
          -[LibraryCollectionViewCell contentConfiguration](self, "contentConfiguration");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[LibraryCollectionViewCell configurationState](self, "configurationState");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "applyContentConfiguration:forState:", v11, v12);

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

}

- (void)_applyTabIcon:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[LibraryCollectionViewCell contentConfiguration](self, "contentConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[LibraryCollectionViewCell _applyTabIcon:toConfiguration:](self, "_applyTabIcon:toConfiguration:", v5, v4);
    -[LibraryCollectionViewCell setContentConfiguration:](self, "setContentConfiguration:", v4);
  }

}

- (void)_applyTabIcon:(id)a3 toConfiguration:(id)a4
{
  void *v5;
  id v6;
  id v7;

  if (a3)
  {
    v7 = a4;
    objc_msgSend(v7, "setImage:", a3);
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0DC3870];
    v6 = a4;
    objc_msgSend(v5, "systemImageNamed:", CFSTR("globe"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setImage:");

  }
}

- (void)prepareForReuse
{
  SFTabIconRegistration *tabIconRegistration;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)LibraryCollectionViewCell;
  -[LibraryCollectionViewCell prepareForReuse](&v4, sel_prepareForReuse);
  tabIconRegistration = self->_tabIconRegistration;
  self->_tabIconRegistration = 0;

}

- (void)setTabIconRegistration:(id)a3
{
  SFTabIconRegistration *v5;
  SFTabIconRegistration *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  id v12;
  id location;

  v5 = (SFTabIconRegistration *)a3;
  v6 = self->_tabIconRegistration;
  if (v6 != v5)
  {
    objc_storeStrong((id *)&self->_tabIconRegistration, a3);
    -[SFTabIconRegistration setContentObserver:](v6, "setContentObserver:", &__block_literal_global_22);
    objc_initWeak(&location, self);
    v8 = MEMORY[0x1E0C809B0];
    v9 = 3221225472;
    v10 = __52__LibraryCollectionViewCell_setTabIconRegistration___block_invoke_2;
    v11 = &unk_1E9CF5620;
    objc_copyWeak(&v12, &location);
    -[SFTabIconRegistration setContentObserver:](v5, "setContentObserver:", &v8);
    if (v5)
    {
      -[SFTabIconRegistration content](v5, "content", v8, v9, v10, v11);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[LibraryCollectionViewCell _applyTabIcon:](self, "_applyTabIcon:", v7);

    }
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

}

void __52__LibraryCollectionViewCell_setTabIconRegistration___block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_applyTabIcon:", v3);

}

- (void)updateConfigurationForTabIconRegistration:(id)a3
{
  SFTabIconRegistration *tabIconRegistration;
  id v5;
  id v6;

  tabIconRegistration = self->_tabIconRegistration;
  if (tabIconRegistration)
  {
    v5 = a3;
    -[SFTabIconRegistration content](tabIconRegistration, "content");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[LibraryCollectionViewCell _applyTabIcon:toConfiguration:](self, "_applyTabIcon:toConfiguration:", v6, v5);

  }
}

- (SFTabIconRegistration)tabIconRegistration
{
  return self->_tabIconRegistration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabIconRegistration, 0);
}

@end
