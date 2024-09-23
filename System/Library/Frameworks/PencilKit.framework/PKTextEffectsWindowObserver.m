@implementation PKTextEffectsWindowObserver

- (_QWORD)initWithTextEffectsWindow:(_QWORD *)a1
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  objc_super v15;

  v3 = a2;
  if (a1)
  {
    v15.receiver = a1;
    v15.super_class = (Class)PKTextEffectsWindowObserver;
    v4 = objc_msgSendSuper2(&v15, sel_init);
    a1 = v4;
    if (v4)
    {
      objc_storeWeak((id *)v4 + 7, v3);
      -[PKTextEffectsWindowObserver keyWindow]((uint64_t)a1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bounds");
      a1[1] = v6;
      a1[2] = v7;
      a1[3] = v8;
      a1[4] = v9;
      objc_msgSend(v5, "traitCollection");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      a1[5] = objc_msgSend(v10, "userInterfaceStyle");

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObserver:selector:name:object:", a1, sel__handleTextEffectsWindowDidRotateNotification_, *MEMORY[0x1E0DC54B8], v3);
      objc_msgSend(v11, "addObserver:selector:name:object:", a1, sel__handleKeyWindowDidChangeNotification_, *MEMORY[0x1E0DC5608], 0);
      v12 = *MEMORY[0x1E0DC5308];
      objc_msgSend(v5, "windowScene");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObserver:selector:name:object:", a1, sel__handleSceneDidActivateNotification_, v12, v13);

      -[PKTextEffectsWindowObserver _installColorAppearanceTraitObserver:](a1, v3);
      -[PKTextEffectsWindowObserver _installColorAppearanceTraitObserver:](a1, v5);

    }
  }

  return a1;
}

- (id)keyWindow
{
  id WeakRetained;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "windowScene", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_visibleWindows");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v7, "isKeyWindow") & 1) != 0)
        {
          v4 = v7;
          goto LABEL_12;
        }
      }
      v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_12:

  return v4;
}

- (void)_installColorAppearanceTraitObserver:(void *)a1
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id location;

  v3 = a2;
  if (a1)
  {
    objc_initWeak(&location, a1);
    objc_msgSend(MEMORY[0x1E0DC3E88], "systemTraitsAffectingColorAppearance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __68__PKTextEffectsWindowObserver__installColorAppearanceTraitObserver___block_invoke;
    v6[3] = &unk_1E7778F68;
    objc_copyWeak(&v7, &location);
    v5 = (id)objc_msgSend(v3, "registerForTraitChanges:withHandler:", v4, v6);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }

}

- (void)_updateCachedKeyWindowBounds
{
  CGFloat v2;
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  id WeakRetained;
  id v11;
  CGRect v12;

  if (a1)
  {
    -[PKTextEffectsWindowObserver keyWindow](a1);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bounds");
    v3 = v2;
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v12.origin.x = v2;
    v12.origin.y = v4;
    v12.size.width = v6;
    v12.size.height = v8;
    if (!CGRectEqualToRect(*(CGRect *)(a1 + 8), v12))
    {
      *(CGFloat *)(a1 + 8) = v3;
      *(CGFloat *)(a1 + 16) = v5;
      *(CGFloat *)(a1 + 24) = v7;
      *(CGFloat *)(a1 + 32) = v9;
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
      objc_msgSend(WeakRetained, "textEffectsWindowDidChangeKeyWindowBounds:", a1);

    }
  }
}

- (void)_handleKeyWindowDidChangeNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138477827;
    v8 = v4;
    _os_log_impl(&dword_1BE213000, v5, OS_LOG_TYPE_DEFAULT, "key window did change: %{private}@", (uint8_t *)&v7, 0xCu);
  }

  -[PKTextEffectsWindowObserver keyWindow]((uint64_t)self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTextEffectsWindowObserver _installColorAppearanceTraitObserver:](self, v6);

}

- (void)_handleSceneDidActivateNotification:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138477827;
    v7 = v4;
    _os_log_impl(&dword_1BE213000, v5, OS_LOG_TYPE_DEFAULT, "scene did activate: %{private}@", (uint8_t *)&v6, 0xCu);
  }

  -[PKTextEffectsWindowObserver _updateCachedKeyWindowBounds]((uint64_t)self);
}

void __68__PKTextEffectsWindowObserver__installColorAppearanceTraitObserver___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    -[PKTextEffectsWindowObserver keyWindow]((uint64_t)WeakRetained);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "traitCollection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "userInterfaceStyle");

    if (*((_QWORD *)v6 + 5) != v4)
    {
      *((_QWORD *)v6 + 5) = v4;
      v5 = objc_loadWeakRetained((id *)v6 + 6);
      objc_msgSend(v5, "textEffectsWindowDidChangeKeyWindowUserInterfaceStyle:", v6);

    }
    WeakRetained = v6;
  }

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_textEffectsWindow);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
