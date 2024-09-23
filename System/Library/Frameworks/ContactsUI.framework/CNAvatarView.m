@implementation CNAvatarView

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 488);
}

+ (unint64_t)maxContactAvatars
{
  return objc_msgSend(MEMORY[0x1E0D13D50], "maxContacts");
}

- (void)_renderContactsImage
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  BOOL v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(uint64_t, void *);
  void *v36;
  id v37;
  id v38;
  _BYTE *v39;
  id v40;
  BOOL v41;
  id location;
  _BYTE buf[24];
  void (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46[3];

  v46[2] = *(id *)MEMORY[0x1E0C80C00];
  kdebug_trace();
  -[CNAvatarView _updateRegistration](self, "_updateRegistration");
  -[CNAvatarView rendererToken](self, "rendererToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  -[CNAvatarView setRendererToken:](self, "setRendererToken:", 0);
  -[CNAvatarView currentLikenessScope](self, "currentLikenessScope");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if (-[CNAvatarView displayedImageState](self, "displayedImageState"))
    {
      v5 = 0;
      v6 = 0;
    }
    else
    {
      -[CNAvatarView imageRenderer](self, "imageRenderer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNAvatarView contacts](self, "contacts");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "loadingPlaceholderForContactCount:scope:", objc_msgSend(v8, "count"), v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      -[CNAvatarView setImage:state:](self, "setImage:state:", v9, 1);
      -[CNAvatarView imageView](self, "imageView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "image");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v9, "isEqual:", v11);

      if (v12)
      {
        v13 = (void *)MEMORY[0x1E0D13D18];
        -[CNAvatarView contacts](self, "contacts");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "publicFingerprintForContacts:scope:", v14, v4);
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        -[CNAvatarView contacts](self, "contacts");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "count");
        v6 = v16 > 1;

        CNUILogAvatarView();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (v16 < 2)
        {
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134218242;
            *(_QWORD *)&buf[4] = self;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v5;
            _os_log_impl(&dword_18AC56000, v18, OS_LOG_TYPE_INFO, "[CNAvatarView][LikenessRenderer] (%p) showing placeholder, requesting image for contact %{public}@", buf, 0x16u);
          }
        }
        else if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)&buf[4] = self;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v5;
          _os_log_debug_impl(&dword_18AC56000, v18, OS_LOG_TYPE_DEBUG, "[CNAvatarView][LikenessRenderer] (%p) showing placeholder, requesting image for group %{public}@", buf, 0x16u);
        }

      }
      else
      {
        v5 = 0;
        v6 = 0;
      }

    }
    -[CNAvatarView contacts](self, "contacts");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "count") == 0;

    if (!v20)
    {
      -[CNAvatarView imageRenderer](self, "imageRenderer");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNAvatarView contacts](self, "contacts");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNAvatarView schedulerProvider](self, "schedulerProvider");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "backgroundScheduler");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "renderedLikenessesForContacts:scope:workScheduler:", v22, v4, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3042000000;
      v44 = __Block_byref_object_copy__2695;
      v45 = __Block_byref_object_dispose__2696;
      v46[0] = 0;
      objc_initWeak(&location, self);
      -[CNAvatarView schedulerProvider](self, "schedulerProvider");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "mainThreadScheduler");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v28 = (void *)MEMORY[0x1E0D13AF0];
      v33 = MEMORY[0x1E0C809B0];
      v34 = 3221225472;
      v35 = __36__CNAvatarView__renderContactsImage__block_invoke;
      v36 = &unk_1E2048260;
      objc_copyWeak(&v40, &location);
      v41 = v6;
      v37 = v5;
      v29 = v27;
      v38 = v29;
      v39 = buf;
      objc_msgSend(v28, "observerWithResultBlock:", &v33);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "subscribe:", v30, v33, v34, v35, v36);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNAvatarView setRendererToken:](self, "setRendererToken:", v31);

      -[CNAvatarView rendererToken](self, "rendererToken");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeWeak((id *)(*(_QWORD *)&buf[8] + 40), v32);

      objc_destroyWeak(&v40);
      objc_destroyWeak(&location);
      _Block_object_dispose(buf, 8);
      objc_destroyWeak(v46);

    }
  }

}

- (NSArray)contacts
{
  return self->_contacts;
}

- (CNCancelable)rendererToken
{
  return self->_rendererToken;
}

- (void)_updateRegistration
{
  _BOOL4 v3;
  BOOL v4;
  void *v5;
  NSArray *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  uint64_t v19;
  void *v20;
  void *v21;
  BOOL v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  _QWORD v33[3];

  v33[1] = *MEMORY[0x1E0C80C00];
  v3 = -[CNAvatarView autoUpdateContact](self, "autoUpdateContact");
  if (self->_registeredInNotifier != v3)
  {
    v4 = v3;
    if (v3)
    {
      v22 = v3;
      -[CNAvatarView descriptorForRequiredKeys](self, "descriptorForRequiredKeys");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
      v6 = (NSArray *)objc_claimAutoreleasedReturnValue();

      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v7 = self->_contacts;
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v28;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v28 != v10)
              objc_enumerationMutation(v7);
            v12 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
            +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "contactChangesNotifier");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "registerObserver:forContact:keysToFetch:", self, v12, v6);

          }
          v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
        }
        while (v9);
      }

      v4 = v22;
    }
    else
    {
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v6 = self->_contacts;
      v15 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v24;
        do
        {
          for (j = 0; j != v16; ++j)
          {
            if (*(_QWORD *)v24 != v17)
              objc_enumerationMutation(v6);
            v19 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * j);
            +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "contactChangesNotifier");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "unregisterObserver:forContact:", self, v19);

          }
          v16 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        }
        while (v16);
      }
    }

    self->_registeredInNotifier = v4;
  }
}

- (BOOL)autoUpdateContact
{
  return self->_autoUpdateContact;
}

- (void)setRendererToken:(id)a3
{
  objc_storeStrong((id *)&self->_rendererToken, a3);
}

+ (id)descriptorForRequiredKeysWithThreeDTouchEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[CNAvatarView descriptorForRequiredKeysWithThreeDTouchEnabled:]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "descriptorForRequiredKeysWithThreeDTouchEnabled:shouldUseCachingRenderer:description:", v3, 1, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)descriptorForRequiredKeysWithThreeDTouchEnabled:(BOOL)a3 shouldUseCachingRenderer:(BOOL)a4 description:(id)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  _BOOL4 v10;
  int v11;
  BOOL v12;
  id *v13;
  uint64_t *v14;
  id v15;
  id v17;
  _QWORD v18[4];
  _QWORD v19[2];
  BOOL v20;
  BOOL v21;
  _QWORD v22[4];
  _QWORD v23[2];
  BOOL v24;
  BOOL v25;
  _QWORD block[4];
  _QWORD v27[2];
  BOOL v28;
  BOOL v29;
  _QWORD v30[4];
  _QWORD v31[2];
  BOOL v32;
  BOOL v33;

  v5 = a4;
  v8 = a5;
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0DC3E88], "_currentTraitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = +[CNAvatarCardController avatarCardEnabledForTraitCollection:](CNAvatarCardController, "avatarCardEnabledForTraitCollection:", v9);

    v11 = !v10;
    v12 = !v5;
    if (v5 && (v11 & 1) == 0)
    {
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __101__CNAvatarView_descriptorForRequiredKeysWithThreeDTouchEnabled_shouldUseCachingRenderer_description___block_invoke;
      v30[3] = &unk_1E20481E8;
      v31[1] = a1;
      v32 = v10;
      v33 = v5;
      v13 = (id *)v31;
      v31[0] = v8;
      if (descriptorForRequiredKeysWithThreeDTouchEnabled_shouldUseCachingRenderer_description__cn_once_token_1 != -1)
        dispatch_once(&descriptorForRequiredKeysWithThreeDTouchEnabled_shouldUseCachingRenderer_description__cn_once_token_1, v30);
      v14 = &descriptorForRequiredKeysWithThreeDTouchEnabled_shouldUseCachingRenderer_description__cn_once_object_1;
      goto LABEL_21;
    }
  }
  else
  {
    v10 = 0;
    v12 = !v5;
    v11 = 1;
  }
  if (v12 || v10)
  {
    if (((v11 | v5) & 1) != 0)
    {
      if (v10 || v5)
      {
        objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Can't be reached"), 0);
        v17 = (id)objc_claimAutoreleasedReturnValue();
        objc_exception_throw(v17);
      }
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __101__CNAvatarView_descriptorForRequiredKeysWithThreeDTouchEnabled_shouldUseCachingRenderer_description___block_invoke_4;
      v18[3] = &unk_1E20481E8;
      v19[1] = a1;
      v20 = v10;
      v21 = v5;
      v13 = (id *)v19;
      v19[0] = v8;
      if (descriptorForRequiredKeysWithThreeDTouchEnabled_shouldUseCachingRenderer_description__cn_once_token_4 != -1)
        dispatch_once(&descriptorForRequiredKeysWithThreeDTouchEnabled_shouldUseCachingRenderer_description__cn_once_token_4, v18);
      v14 = &descriptorForRequiredKeysWithThreeDTouchEnabled_shouldUseCachingRenderer_description__cn_once_object_4;
    }
    else
    {
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __101__CNAvatarView_descriptorForRequiredKeysWithThreeDTouchEnabled_shouldUseCachingRenderer_description___block_invoke_3;
      v22[3] = &unk_1E20481E8;
      v23[1] = a1;
      v24 = v10;
      v25 = v5;
      v13 = (id *)v23;
      v23[0] = v8;
      if (descriptorForRequiredKeysWithThreeDTouchEnabled_shouldUseCachingRenderer_description__cn_once_token_3 != -1)
        dispatch_once(&descriptorForRequiredKeysWithThreeDTouchEnabled_shouldUseCachingRenderer_description__cn_once_token_3, v22);
      v14 = &descriptorForRequiredKeysWithThreeDTouchEnabled_shouldUseCachingRenderer_description__cn_once_object_3;
    }
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __101__CNAvatarView_descriptorForRequiredKeysWithThreeDTouchEnabled_shouldUseCachingRenderer_description___block_invoke_2;
    block[3] = &unk_1E20481E8;
    v27[1] = a1;
    v28 = v10;
    v29 = v5;
    v13 = (id *)v27;
    v27[0] = v8;
    if (descriptorForRequiredKeysWithThreeDTouchEnabled_shouldUseCachingRenderer_description__cn_once_token_2 != -1)
      dispatch_once(&descriptorForRequiredKeysWithThreeDTouchEnabled_shouldUseCachingRenderer_description__cn_once_token_2, block);
    v14 = &descriptorForRequiredKeysWithThreeDTouchEnabled_shouldUseCachingRenderer_description__cn_once_object_2;
  }
LABEL_21:
  v15 = (id)*v14;

  return v15;
}

- (CNSchedulerProvider)schedulerProvider
{
  return self->_schedulerProvider;
}

- (CNUILikenessRendering)imageRenderer
{
  return self->_imageRenderer;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)CNAvatarView;
  -[CNAvatarView layoutSubviews](&v25, sel_layoutSubviews);
  -[CNAvatarView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CNAvatarView bounds](self, "bounds");
    -[CNAvatarView sizeThatFits:](self, "sizeThatFits:", v4, v5);
    v7 = v6;
    v9 = v8;
    -[CNAvatarView imageView](self, "imageView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "frame");
    v12 = v11;
    v14 = v13;

    if (v7 == v12 && v9 == v14)
    {
      if (-[CNAvatarView displayedImageState](self, "displayedImageState"))
        return;
    }
    else
    {
      v15 = *MEMORY[0x1E0C9D648];
      v16 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      -[CNAvatarView imageView](self, "imageView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setFrame:", v15, v16, v7, v9);

      -[CNAvatarView alternativeImageView](self, "alternativeImageView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setFrame:", v15, v16, v7, v9);

      -[CNAvatarView alternativeImageView](self, "alternativeImageView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "layer");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "frame");
      v22 = v21 * 0.5;
      -[CNAvatarView alternativeImageView](self, "alternativeImageView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "layer");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setCornerRadius:", v22);

      if (-[CNAvatarView displayedImageState](self, "displayedImageState") == 1)
        -[CNAvatarView setImage:state:](self, "setImage:state:", 0, 0);
    }
    -[CNAvatarView _renderContactsImage](self, "_renderContactsImage");
  }
}

- (UIImageView)alternativeImageView
{
  return self->_alternativeImageView;
}

- (void)setImage:(id)a3 state:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  BOOL v10;
  char v11;
  NSObject *v12;
  CNAvatarView *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  int v18;
  CNAvatarView *v19;
  __int16 v20;
  CNAvatarView *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[CNAvatarView imageView](self, "imageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "image");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "isEqual:", v8);

  if ((v9 & 1) != 0)
  {
    -[CNAvatarView setDisplayedImageState:](self, "setDisplayedImageState:", a4);
    if (a4 != 2)
      goto LABEL_19;
    goto LABEL_17;
  }
  if (-[CNAvatarView allowStaleRendering](self, "allowStaleRendering"))
  {
    v10 = -[CNAvatarView allowStaleRenderingWithMatchingContextToken](self, "allowStaleRenderingWithMatchingContextToken");
    if (a4 == 1)
      -[CNAvatarView setAllowStaleRenderingWithMatchingContextToken:](self, "setAllowStaleRenderingWithMatchingContextToken:", 1);
    v11 = !v10;
    if (a4 == 2)
      v11 = 1;
    if ((v11 & 1) == 0)
    {
      CNUILogAvatarView();
      v12 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
LABEL_15:

        -[CNAvatarView setDisplayedImageState:](self, "setDisplayedImageState:", a4);
        goto LABEL_19;
      }
      objc_msgSend((id)objc_opt_class(), "descriptionForDisplayedImageState:", a4);
      v13 = (CNAvatarView *)objc_claimAutoreleasedReturnValue();
      v18 = 134218242;
      v19 = self;
      v20 = 2114;
      v21 = v13;
      _os_log_impl(&dword_18AC56000, v12, OS_LOG_TYPE_INFO, "[CNAvatarView] %p ignoring setting image for state (%{public}@), showing stale image instead", (uint8_t *)&v18, 0x16u);
LABEL_12:

      goto LABEL_15;
    }
  }
  -[CNAvatarView imageView](self, "imageView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setImage:", v6);

  if (a4 != 2)
  {
    CNUILogAvatarView();
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      goto LABEL_15;
    -[CNAvatarView contacts](self, "contacts");
    v13 = (CNAvatarView *)objc_claimAutoreleasedReturnValue();
    v18 = 138412290;
    v19 = v13;
    _os_log_debug_impl(&dword_18AC56000, v12, OS_LOG_TYPE_DEBUG, "[CNAvatarView] Setting placeholder image for %@", (uint8_t *)&v18, 0xCu);
    goto LABEL_12;
  }
  -[CNAvatarView setDisplayedImageState:](self, "setDisplayedImageState:", 2);
LABEL_17:
  -[CNAvatarView delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_opt_respondsToSelector();

  if ((v16 & 1) != 0)
  {
    -[CNAvatarView delegate](self, "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "didUpdateContentForAvatarView:", self);

  }
LABEL_19:

}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (BOOL)allowStaleRendering
{
  return self->_allowStaleRendering;
}

- (void)setDisplayedImageState:(int64_t)a3
{
  self->_displayedImageState = a3;
}

- (CNAvatarViewDelegate)delegate
{
  return (CNAvatarViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (id)currentLikenessScope
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  uint64_t v22;
  unint64_t v23;
  void *v24;
  void *v25;
  unint64_t v26;
  void *v27;
  void *v28;

  -[CNAvatarView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    goto LABEL_9;
  -[CNAvatarView imageView](self, "imageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v9 = *MEMORY[0x1E0C9D820];
  v10 = *(double *)(MEMORY[0x1E0C9D820] + 8);

  if (v6 == v9 && v8 == v10)
  {
LABEL_9:
    v24 = 0;
  }
  else
  {
    -[CNAvatarView imageView](self, "imageView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bounds");
    v14 = v13;
    v16 = v15;

    -[CNAvatarView window](self, "window");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "screen");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "scale");
    v20 = v19;

    -[CNAvatarView window](self, "window");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "effectiveUserInterfaceLayoutDirection");

    v23 = -[CNAvatarView backgroundStyle](self, "backgroundStyle");
    if (!v23)
    {
      if (-[CNAvatarView style](self, "style"))
      {
        v23 = 0;
      }
      else
      {
        -[CNAvatarView traitCollection](self, "traitCollection");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v25, "userInterfaceStyle") == 2;

      }
    }
    v26 = -[CNAvatarView style](self, "style");
    -[CNAvatarView maskedAvatarIndices](self, "maskedAvatarIndices");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNAvatarImageRenderingScope scopeWithPointSize:scale:strokeWidth:strokeColor:rightToLeft:style:backgroundStyle:color:maskedAvatarIndices:](CNAvatarImageRenderingScope, "scopeWithPointSize:scale:strokeWidth:strokeColor:rightToLeft:style:backgroundStyle:color:maskedAvatarIndices:", 0, v22 == 1, v26, v23, 0, v27, v14, v16, v20, 0.0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v28, "likenessRenderingScope");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v24;
}

- (unint64_t)style
{
  return self->_style;
}

- (BOOL)isDisplayingContent
{
  return -[CNAvatarView displayedImageState](self, "displayedImageState") == 2;
}

- (int64_t)displayedImageState
{
  return self->_displayedImageState;
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double width;

  if (result.width >= result.height)
    result.width = result.height;
  width = result.width;
  result.height = width;
  return result;
}

- (void)_setContacts:(id)a3
{
  id v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSArray **p_contacts;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (-[CNAvatarView shouldUpdateWithContacts:](self, "shouldUpdateWithContacts:", v5))
  {
    self->_registeredInNotifier = 0;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    p_contacts = &self->_contacts;
    v15 = a3;
    v6 = self->_contacts;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v17;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v10);
          +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment", p_contacts, v15, (_QWORD)v16);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "contactChangesNotifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "unregisterObserver:forContact:", self, v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v8);
    }

    objc_storeStrong((id *)p_contacts, v15);
    -[CNAvatarView setShouldUpdateMaskedAvatars:](self, "setShouldUpdateMaskedAvatars:", 0);
    -[CNAvatarView clearImage](self, "clearImage");
    -[CNAvatarView _renderContactsImage](self, "_renderContactsImage");
  }

}

- (id)updateViewWithGroupIdentity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  id v16;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "groupPhoto");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[CNAvatarView contact](self, "contact");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isKeyAvailable:", *MEMORY[0x1E0C96890]);

    if (v8)
    {
      -[CNAvatarView contact](self, "contact");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "thumbnailImageData");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v6, "isEqualToData:", v10);

      if ((v11 & 1) != 0)
        goto LABEL_8;
    }
    objc_msgSend(MEMORY[0x1E0C97360], "contactWithDisplayName:emailOrPhoneNumber:", 0, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setImageData:", v6);
    objc_msgSend(v12, "setThumbnailImageData:", v6);
    v18[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAvatarView setContacts:forToken:](self, "setContacts:forToken:", v13, v5);

  }
  else
  {
    objc_msgSend(v4, "contacts");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[CNAvatarView shouldUpdateWithContacts:](self, "shouldUpdateWithContacts:", v14);

    if (!v15)
    {
      v16 = 0;
      goto LABEL_9;
    }
    objc_msgSend(v4, "contacts");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAvatarView setContacts:forToken:](self, "setContacts:forToken:", v12, v5);
  }

LABEL_8:
  v16 = v5;
LABEL_9:

  return v16;
}

- (BOOL)shouldUpdateWithContacts:(id)a3
{
  unint64_t v4;
  int v5;
  NSArray *contacts;

  v4 = (unint64_t)a3;
  if (-[CNAvatarView shouldUpdateMaskedAvatars](self, "shouldUpdateMaskedAvatars"))
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    contacts = self->_contacts;
    if (v4 | (unint64_t)contacts)
      v5 = -[NSArray _cn_isIdenticalToArray:](contacts, "_cn_isIdenticalToArray:", v4) ^ 1;
    else
      LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)shouldUpdateMaskedAvatars
{
  return self->_shouldUpdateMaskedAvatars;
}

- (void)clearImage
{
  -[CNAvatarView setImage:state:](self, "setImage:state:", 0, 0);
}

- (void)setShouldUpdateMaskedAvatars:(BOOL)a3
{
  self->_shouldUpdateMaskedAvatars = a3;
}

- (void)setupAvatarCardControllerIfNeeded
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  CNAvatarCardController *v6;

  -[CNAvatarView cardController](self, "cardController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    goto LABEL_6;
  if (!-[CNAvatarView isThreeDTouchEnabled](self, "isThreeDTouchEnabled"))
  {
    v3 = 0;
LABEL_6:

    return;
  }
  -[CNAvatarView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[CNAvatarCardController avatarCardEnabledForTraitCollection:](CNAvatarCardController, "avatarCardEnabledForTraitCollection:", v4);

  if (v5)
  {
    v6 = objc_alloc_init(CNAvatarCardController);
    -[CNAvatarCardController setAvatarView:](v6, "setAvatarView:", self);
    -[CNAvatarCardController setDelegate:](v6, "setDelegate:", self);
    -[CNAvatarView setCardController:](self, "setCardController:", v6);

  }
}

- (void)_updateCardActions
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (!-[CNAvatarView isThreeDTouchEnabled](self, "isThreeDTouchEnabled"))
    goto LABEL_7;
  -[CNAvatarView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!+[CNAvatarCardController avatarCardEnabledForTraitCollection:](CNAvatarCardController, "avatarCardEnabledForTraitCollection:", v3)|| (-[CNAvatarView window](self, "window"), (v4 = objc_claimAutoreleasedReturnValue()) == 0))
  {

    goto LABEL_7;
  }
  v5 = (void *)v4;
  -[CNAvatarView delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
LABEL_7:
    -[CNAvatarView cardController](self, "cardController");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSourceView:", 0);
    goto LABEL_8;
  }
  -[CNAvatarView forcePressView](self, "forcePressView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[CNAvatarView cardController](self, "cardController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSourceView:", v8);

LABEL_8:
}

- (void)setActionCategories:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CNAvatarView cardController](self, "cardController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActionCategories:", v4);

}

- (CNAvatarCardController)cardController
{
  return self->_cardController;
}

- (id)descriptorForRequiredKeys
{
  return (id)objc_msgSend((id)objc_opt_class(), "descriptorForRequiredKeysWithThreeDTouchEnabled:", -[CNAvatarView isThreeDTouchEnabled](self, "isThreeDTouchEnabled"));
}

- (BOOL)isThreeDTouchEnabled
{
  return self->_threeDTouchEnabled;
}

- (NSIndexSet)maskedAvatarIndices
{
  return self->_maskedAvatarIndices;
}

- (void)setCardController:(id)a3
{
  objc_storeStrong((id *)&self->_cardController, a3);
}

- (BOOL)allowStaleRenderingWithMatchingContextToken
{
  return self->_allowStaleRenderingWithMatchingContextToken;
}

- (void)setContacts:(id)a3 forToken:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  -[CNAvatarView resetGroupUpdateTokenIfNeeded](self, "resetGroupUpdateTokenIfNeeded");
  -[CNAvatarView setGroupViewConfigurationUpdateToken:](self, "setGroupViewConfigurationUpdateToken:", v6);

  -[CNAvatarView _setContacts:](self, "_setContacts:", v7);
}

- (void)setGroupViewConfigurationUpdateToken:(id)a3
{
  objc_storeStrong((id *)&self->_groupViewConfigurationUpdateToken, a3);
}

+ (id)makeDescriptorForRequiredKeysWithThreeDTouchEnabled:(BOOL)a3 shouldUseCachingRenderer:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v13[2];

  v4 = a4;
  v5 = a3;
  v13[1] = *MEMORY[0x1E0C80C00];
  +[CNMonogrammer descriptorForRequiredKeysIncludingImage:](CNMonogrammer, "descriptorForRequiredKeysIncludingImage:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    objc_msgSend(MEMORY[0x1E0D13D28], "descriptorForRequiredKeysForCaching");
  else
    objc_msgSend(MEMORY[0x1E0D13D28], "descriptorForRequiredKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "arrayByAddingObject:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    +[CNAvatarCardController descriptorForRequiredKeysIncludingAvatarViewDescriptors:](CNAvatarCardController, "descriptorForRequiredKeysIncludingAvatarViewDescriptors:", 0);
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "arrayByAddingObject:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)v10;
  }
  else
  {
    objc_msgSend(v9, "arrayByAddingObject:", *MEMORY[0x1E0C96708]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (void)setStyle:(unint64_t)a3
{
  void *v4;

  if (self->_style != a3)
  {
    self->_style = a3;
    -[CNAvatarView contacts](self, "contacts");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      -[CNAvatarView _renderContactsImage](self, "_renderContactsImage");
  }
}

- (void)setContextToken:(id)a3
{
  NSString *v5;
  _BOOL4 v6;
  NSString *v7;

  v5 = (NSString *)a3;
  if (self->_contextToken != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_contextToken, a3);
    v6 = -[CNAvatarView allowStaleRendering](self, "allowStaleRendering");
    v5 = v7;
    if (v6)
    {
      -[CNAvatarView setAllowStaleRenderingWithMatchingContextToken:](self, "setAllowStaleRenderingWithMatchingContextToken:", 0);
      v5 = v7;
    }
  }

}

- (void)setShowsContactOnTap:(BOOL)a3
{
  if (self->_showsContactOnTap != a3)
    self->_showsContactOnTap = a3;
}

- (void)setAutoUpdateContact:(BOOL)a3
{
  if (self->_autoUpdateContact != a3)
  {
    self->_autoUpdateContact = a3;
    -[CNAvatarView _updateRegistration](self, "_updateRegistration");
  }
}

- (void)setStateCaptureHandle:(unint64_t)a3
{
  self->_stateCaptureHandle = a3;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setContacts:(id)a3
{
  id v4;
  NSArray *contacts;
  id v6;

  v4 = a3;
  contacts = self->_contacts;
  v6 = v4;
  if (v4)
  {
LABEL_2:
    if (-[NSArray isEqualToArray:](contacts, "isEqualToArray:", v4))
      goto LABEL_6;
    goto LABEL_5;
  }
  if (!contacts)
  {
    v4 = 0;
    goto LABEL_2;
  }
LABEL_5:
  -[CNAvatarView resetGroupUpdateTokenIfNeeded](self, "resetGroupUpdateTokenIfNeeded");
  -[CNAvatarView _setContacts:](self, "_setContacts:", v6);
LABEL_6:

}

- (void)resetGroupUpdateTokenIfNeeded
{
  void *v3;

  if (-[CNAvatarView isUpdatingGroupViewConfiguration](self, "isUpdatingGroupViewConfiguration"))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CNUIAvatarViewErrorDomain"), 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAvatarView notifyDelegateOfGroupConfigurationUpdateWithError:](self, "notifyDelegateOfGroupConfigurationUpdateWithError:", v3);

    -[CNAvatarView setGroupViewConfigurationUpdateToken:](self, "setGroupViewConfigurationUpdateToken:", 0);
  }
}

- (BOOL)isUpdatingGroupViewConfiguration
{
  void *v2;
  BOOL v3;

  -[CNAvatarView groupViewConfigurationUpdateToken](self, "groupViewConfigurationUpdateToken");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (CNAvatarViewUpdateToken)groupViewConfigurationUpdateToken
{
  return self->_groupViewConfigurationUpdateToken;
}

- (void)notifyDelegateOfGroupConfigurationUpdateWithError:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  char v8;
  id v9;

  v9 = a3;
  -[CNAvatarView delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      -[CNAvatarView delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNAvatarView groupViewConfigurationUpdateToken](self, "groupViewConfigurationUpdateToken");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "avatarView:didFailToUpdateViewForGroupConfiguration:withError:", self, v7, v9);
LABEL_6:

    }
  }
  else
  {
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      -[CNAvatarView delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNAvatarView groupViewConfigurationUpdateToken](self, "groupViewConfigurationUpdateToken");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "avatarView:didUpdateViewForGroupConfiguration:", self, v7);
      goto LABEL_6;
    }
  }

}

- (CNAvatarView)initWithSettings:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  CNAvatarView *v14;

  v4 = a3;
  objc_msgSend(v4, "likenessRenderer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "conformsToProtocol:", &unk_1EE082E38))
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;
  v8 = v7;
  if (v7)
    objc_msgSend(v7, "addDelegate:", self);
  v9 = objc_msgSend(v4, "threeDTouchEnabled");
  objc_msgSend(v4, "contactStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v4, "style");
  objc_msgSend(v4, "schedulerProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v4, "backgroundStyle");

  v14 = -[CNAvatarView initWithImageRenderer:threeDTouchEnabled:contactStore:style:schedulerProvider:backgroundStyle:](self, "initWithImageRenderer:threeDTouchEnabled:contactStore:style:schedulerProvider:backgroundStyle:", v5, v9, v10, v11, v12, v13);
  return v14;
}

- (void)setShouldFetchSharedMeContactPhoto:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  uint64_t v5;
  id v6;

  if (self->_shouldFetchSharedMeContactPhoto != a3)
  {
    v3 = a3;
    self->_shouldFetchSharedMeContactPhoto = a3;
    -[CNAvatarView imageRenderer](self, "imageRenderer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v4;
    if (v3)
      v5 = 2;
    else
      v5 = 0;
    objc_msgSend(v4, "setLookupOptions:", v5);

  }
}

- (void)contactDidChange
{
  -[CNAvatarView clearImage](self, "clearImage");
  -[CNAvatarView _renderContactsImage](self, "_renderContactsImage");
}

- (UIView)forcePressView
{
  UIView **p_forcePressView;
  id WeakRetained;
  CNAvatarView *v5;
  CNAvatarView *v6;
  CNAvatarView *v7;
  void *v8;
  uint64_t v9;

  p_forcePressView = &self->_forcePressView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_forcePressView);

  if (WeakRetained)
  {
    v5 = (CNAvatarView *)objc_loadWeakRetained((id *)p_forcePressView);
LABEL_8:
    v8 = v5;
    return (UIView *)v8;
  }
  v6 = self;
  v7 = v6;
  if (!v6)
  {
LABEL_7:
    v5 = v7;
    goto LABEL_8;
  }
  v8 = v6;
  while (1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      return (UIView *)v8;
    objc_msgSend(v8, "superview");
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v9;
    if (!v9)
      goto LABEL_7;
  }
}

- (void)setForcePressView:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_forcePressView);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_forcePressView, obj);
    -[CNAvatarView window](self, "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = obj;
    if (v6)
    {
      -[CNAvatarView _updateCardActions](self, "_updateCardActions");
      v5 = obj;
    }
  }

}

- (void)setAsynchronousRendering:(BOOL)a3
{
  self->_asynchronousRendering = a3;
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNAvatarView;
  -[CNAvatarView didMoveToWindow](&v3, sel_didMoveToWindow);
  -[CNAvatarView _updateCardActions](self, "_updateCardActions");
  -[CNAvatarView _updateRegistration](self, "_updateRegistration");
  -[CNAvatarView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setBypassActionValidation:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[CNAvatarView cardController](self, "cardController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBypassActionValidation:", v3);

}

- (void)setContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v7[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAvatarView setContacts:](self, "setContacts:", v6);

  }
  else
  {
    -[CNAvatarView setContacts:](self, "setContacts:", MEMORY[0x1E0C9AA60]);
  }

}

- (CNAvatarView)init
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  CNAvatarView *v7;

  +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cachingLikenessRenderer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend((id)objc_opt_class(), "defaultThreeDTouchSupport");
  objc_msgSend(v3, "contactStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CNAvatarView initWithImageRenderer:threeDTouchEnabled:contactStore:](self, "initWithImageRenderer:threeDTouchEnabled:contactStore:", v4, v5, v6);

  return v7;
}

+ (BOOL)defaultThreeDTouchSupport
{
  return 1;
}

void __36__CNAvatarView__renderContactsImage__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  uint64_t v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v5 = WeakRetained;
  if (*(_BYTE *)(a1 + 64))
  {
    CNUILogAvatarView();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v7 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 134218242;
      v17 = v5;
      v18 = 2114;
      v19 = v7;
      _os_log_debug_impl(&dword_18AC56000, v6, OS_LOG_TYPE_DEBUG, "[CNAvatarView][LikenessRenderer] (%p) received image for group %{public}@, replacing placeholder", buf, 0x16u);
    }
    goto LABEL_8;
  }
  objc_msgSend(WeakRetained, "contacts");
  v6 = objc_claimAutoreleasedReturnValue();
  if (-[NSObject count](v6, "count") != 1)
  {
LABEL_8:

    goto LABEL_9;
  }
  v8 = *(_QWORD *)(a1 + 32);

  if (v8)
  {
    CNUILogAvatarView();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v9 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134218498;
      v17 = v5;
      v18 = 2112;
      v19 = v3;
      v20 = 2114;
      v21 = v9;
      _os_log_impl(&dword_18AC56000, v6, OS_LOG_TYPE_INFO, "[CNAvatarView][LikenessRenderer] (%p) received image (%@) for contact %{public}@, replacing placeholder", buf, 0x20u);
    }
    goto LABEL_8;
  }
LABEL_9:
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __36__CNAvatarView__renderContactsImage__block_invoke_56;
  v13[3] = &unk_1E2048238;
  v11 = *(void **)(a1 + 40);
  v10 = *(_QWORD *)(a1 + 48);
  v14 = v3;
  v15 = v10;
  v13[4] = v5;
  v12 = v3;
  objc_msgSend(v11, "performBlock:", v13);

}

void __101__CNAvatarView_descriptorForRequiredKeysWithThreeDTouchEnabled_shouldUseCachingRenderer_description___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0C97200];
  objc_msgSend(*(id *)(a1 + 40), "makeDescriptorForRequiredKeysWithThreeDTouchEnabled:shouldUseCachingRenderer:", *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "descriptorWithKeyDescriptors:description:", v5, *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)descriptorForRequiredKeysWithThreeDTouchEnabled_shouldUseCachingRenderer_description__cn_once_object_2;
  descriptorForRequiredKeysWithThreeDTouchEnabled_shouldUseCachingRenderer_description__cn_once_object_2 = v3;

}

void __101__CNAvatarView_descriptorForRequiredKeysWithThreeDTouchEnabled_shouldUseCachingRenderer_description___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0C97200];
  objc_msgSend(*(id *)(a1 + 40), "makeDescriptorForRequiredKeysWithThreeDTouchEnabled:shouldUseCachingRenderer:", *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "descriptorWithKeyDescriptors:description:", v5, *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)descriptorForRequiredKeysWithThreeDTouchEnabled_shouldUseCachingRenderer_description__cn_once_object_1;
  descriptorForRequiredKeysWithThreeDTouchEnabled_shouldUseCachingRenderer_description__cn_once_object_1 = v3;

}

- (CNAvatarView)initWithImageRenderer:(id)a3 threeDTouchEnabled:(BOOL)a4 contactStore:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  CNAvatarView *v12;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "defaultSchedulerProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[CNAvatarView initWithImageRenderer:threeDTouchEnabled:contactStore:style:schedulerProvider:backgroundStyle:](self, "initWithImageRenderer:threeDTouchEnabled:contactStore:style:schedulerProvider:backgroundStyle:", v9, v5, v8, 0, v11, 0);
  return v12;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[CNAvatarView rendererToken](self, "rendererToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contactChangesNotifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeEntriesWithoutObservers");

  if (-[CNAvatarView stateCaptureHandle](self, "stateCaptureHandle"))
  {
    -[CNAvatarView stateCaptureHandle](self, "stateCaptureHandle");
    os_state_remove_handler();
  }
  v6.receiver = self;
  v6.super_class = (Class)CNAvatarView;
  -[CNAvatarView dealloc](&v6, sel_dealloc);
}

- (unint64_t)stateCaptureHandle
{
  return self->_stateCaptureHandle;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CNAvatarView;
  v4 = a3;
  -[CNAvatarView traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  v5 = objc_msgSend(v4, "userInterfaceStyle", v9.receiver, v9.super_class);

  -[CNAvatarView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceStyle");

  v8 = -[CNAvatarView style](self, "style");
  if (v5 != v7 && !v8)
    -[CNAvatarView _renderContactsImage](self, "_renderContactsImage");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextToken, 0);
  objc_storeStrong((id *)&self->_schedulerProvider, 0);
  objc_storeStrong((id *)&self->_imageRenderer, 0);
  objc_storeStrong((id *)&self->_overrideImage, 0);
  objc_storeStrong((id *)&self->_groupViewConfigurationUpdateToken, 0);
  objc_storeStrong((id *)&self->_cardController, 0);
  objc_storeStrong((id *)&self->_contactViewNavigationController, 0);
  objc_storeStrong((id *)&self->_alternativeImageView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_rendererToken, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_maskedAvatarIndices, 0);
  objc_storeStrong((id *)&self->_contacts, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_sharedProfileStateOracle, 0);
  objc_destroyWeak((id *)&self->_forcePressView);
}

- (void)setAllowStaleRenderingWithMatchingContextToken:(BOOL)a3
{
  self->_allowStaleRenderingWithMatchingContextToken = a3;
}

- (void)setAllowStaleRendering:(BOOL)a3
{
  self->_allowStaleRendering = a3;
}

- (CNAvatarView)initWithImageRenderer:(id)a3 threeDTouchEnabled:(BOOL)a4 contactStore:(id)a5 style:(unint64_t)a6 schedulerProvider:(id)a7 backgroundStyle:(unint64_t)a8
{
  id v15;
  id v16;
  id v17;
  double v18;
  double v19;
  CNAvatarView *v20;
  CNAvatarView *v21;
  UIImageView *v22;
  UIImageView *imageView;
  UIImageView *v24;
  UIImageView *alternativeImageView;
  void *v26;
  int v27;
  id v28;
  uint64_t v30;
  id v31;
  id location;
  objc_super v33;

  v15 = a3;
  v16 = a5;
  v17 = a7;
  v18 = *MEMORY[0x1E0C9D648];
  v19 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v33.receiver = self;
  v33.super_class = (Class)CNAvatarView;
  v20 = -[CNAvatarView initWithFrame:](&v33, sel_initWithFrame_, v18, v19, *(double *)&CNAvatarViewDefaultSize, unk_1EDF9B228);
  v21 = v20;
  if (v20)
  {
    v20->_threeDTouchEnabled = a4;
    objc_storeStrong((id *)&v20->_contactStore, a5);
    objc_storeStrong((id *)&v21->_imageRenderer, a3);
    v21->_style = a6;
    v22 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    imageView = v21->_imageView;
    v21->_imageView = v22;

    v24 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    alternativeImageView = v21->_alternativeImageView;
    v21->_alternativeImageView = v24;

    -[UIImageView setContentMode:](v21->_alternativeImageView, "setContentMode:", 2);
    -[UIImageView setClipsToBounds:](v21->_alternativeImageView, "setClipsToBounds:", 1);
    objc_storeStrong((id *)&v21->_schedulerProvider, a7);
    v21->_backgroundStyle = a8;
    objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "isInternalBuild");

    if (v27)
    {
      objc_initWeak(&location, v21);
      v28 = MEMORY[0x1E0C80D38];
      v30 = MEMORY[0x1E0C809B0];
      objc_copyWeak(&v31, &location);
      -[CNAvatarView setStateCaptureHandle:](v21, "setStateCaptureHandle:", os_state_add_handler(), v30, 3221225472, __110__CNAvatarView_initWithImageRenderer_threeDTouchEnabled_contactStore_style_schedulerProvider_backgroundStyle___block_invoke, &unk_1E2048210);

      objc_destroyWeak(&v31);
      objc_destroyWeak(&location);
    }
    -[CNAvatarView addSubview:](v21, "addSubview:", v21->_imageView);
    -[CNAvatarView addSubview:](v21, "addSubview:", v21->_alternativeImageView);
    -[CNAvatarView setupAvatarCardControllerIfNeeded](v21, "setupAvatarCardControllerIfNeeded");
    -[CNAvatarView setShowsContactOnTap:](v21, "setShowsContactOnTap:", 0);
    -[CNAvatarView setAutoUpdateContact:](v21, "setAutoUpdateContact:", 1);
  }

  return v21;
}

- (CNAvatarView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CNAvatarView *v7;
  CNAvatarView *v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = -[CNAvatarView init](self, "init");
  v8 = v7;
  if (v7)
    -[CNAvatarView setFrame:](v7, "setFrame:", x, y, width, height);
  return v8;
}

- (id)updateViewWithGroupIdentity:(id)a3 maskingContacts:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "groupPhoto");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CNAvatarView setShouldUpdateMaskedAvatars:](self, "setShouldUpdateMaskedAvatars:", 0);
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAvatarView setMaskedAvatarIndices:](self, "setMaskedAvatarIndices:", v9);
  }
  else
  {
    objc_msgSend(v7, "contacts");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __60__CNAvatarView_updateViewWithGroupIdentity_maskingContacts___block_invoke;
    v15[3] = &unk_1E204AD08;
    v16 = v6;
    objc_msgSend(v10, "indexesOfObjectsPassingTest:", v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNAvatarView maskedAvatarIndices](self, "maskedAvatarIndices");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAvatarView setShouldUpdateMaskedAvatars:](self, "setShouldUpdateMaskedAvatars:", objc_msgSend(v12, "isEqualToIndexSet:", v11) ^ 1);

    -[CNAvatarView setMaskedAvatarIndices:](self, "setMaskedAvatarIndices:", v11);
    v9 = v16;
  }

  -[CNAvatarView updateViewWithGroupIdentity:](self, "updateViewWithGroupIdentity:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (CGRect)frameForAvatarAtIndex:(unint64_t)a3 inView:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL8 v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGRect result;

  v6 = a4;
  v7 = (void *)MEMORY[0x1E0D13C80];
  -[CNAvatarView contacts](self, "contacts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layoutConfigurationsForType:withItemCount:", 2, objc_msgSend(v8, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "count") <= a3)
  {
    v22 = *MEMORY[0x1E0C9D648];
    v24 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v26 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v28 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  else
  {
    objc_msgSend(v9, "objectAtIndex:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[CNAvatarView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == 1;
    -[CNAvatarView imageView](self, "imageView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bounds");
    objc_msgSend(v10, "itemFrameInContainingBounds:isRTL:", v11);
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;

    -[CNAvatarView convertRect:toView:](self, "convertRect:toView:", v6, v14, v16, v18, v20);
    v22 = v21;
    v24 = v23;
    v26 = v25;
    v28 = v27;

  }
  v29 = v22;
  v30 = v24;
  v31 = v26;
  v32 = v28;
  result.size.height = v32;
  result.size.width = v31;
  result.origin.y = v30;
  result.origin.x = v29;
  return result;
}

- (void)setThreeDTouchEnabled:(BOOL)a3
{
  if (self->_threeDTouchEnabled != a3)
  {
    self->_threeDTouchEnabled = a3;
    if (a3)
      -[CNAvatarView setupAvatarCardControllerIfNeeded](self, "setupAvatarCardControllerIfNeeded");
    -[CNAvatarView _updateCardActions](self, "_updateCardActions");
  }
}

- (void)setDisableCornerRadiusForAvatar:(BOOL)a3
{
  if (self->_disableCornerRadiusForAvatar != a3)
  {
    self->_disableCornerRadiusForAvatar = a3;
    -[CNAvatarView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (UIImage)contentImage
{
  void *v2;
  void *v3;

  -[CNAvatarView imageView](self, "imageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

- (double)_diameter
{
  double Width;
  double result;
  CGRect v5;
  CGRect v6;

  -[CNAvatarView bounds](self, "bounds");
  Width = CGRectGetWidth(v5);
  -[CNAvatarView bounds](self, "bounds");
  result = CGRectGetHeight(v6);
  if (Width < result)
    return Width;
  return result;
}

- (void)showContact:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[CNAvatarView contact](self, "contact", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "hasBeenPersisted"))
  {
    v4 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("contact://show?id=%@"), v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLWithString:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "applicationWorkspace");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "openSensitiveURLInBackground:withOptions:", v6, 0);

  }
}

- (void)dismissContactViewController:(id)a3
{
  void *v4;
  _QWORD v5[5];

  -[CNAvatarView contactViewNavigationController](self, "contactViewNavigationController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__CNAvatarView_dismissContactViewController___block_invoke;
  v5[3] = &unk_1E204F648;
  v5[4] = self;
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, v5);

}

- (NSArray)actionCategories
{
  void *v2;
  void *v3;

  -[CNAvatarView cardController](self, "cardController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actionCategories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (BOOL)bypassActionValidation
{
  void *v2;
  char v3;

  -[CNAvatarView cardController](self, "cardController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "bypassActionValidation");

  return v3;
}

- (id)presentingViewControllerForAvatarCardController:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;

  -[CNAvatarView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CNAvatarView delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "presentingViewControllerForAvatarView:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "set_cardViewControllerTransitioning:", self);
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (int64_t)avatarCardController:(id)a3 presentationResultForLocation:(CGPoint)a4
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  int64_t v24;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[CNAvatarView delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[CNAvatarView delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNAvatarCardController descriptorForRequiredKeys](CNAvatarCardController, "descriptorForRequiredKeys");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contactsForPreviewInteractionForAvatarView:suggestedKeysToFetch:", self, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[CNAvatarView contacts](self, "contacts");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (!objc_msgSend(v11, "count"))
    goto LABEL_12;
  -[CNAvatarView contactStore](self, "contactStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "prepareWithContacts:store:", v11, v12);

  v13 = objc_msgSend(v5, "hasActions");
  -[CNAvatarView delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_opt_respondsToSelector();

  if ((v15 & 1) != 0)
  {
    -[CNAvatarView delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "overrideImageDataForPreviewInteractionForAvatarView:", self);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "prepareWithOverrideImageData:", v17);
    if ((v13 & 1) == 0)
      goto LABEL_12;
  }
  else if (!v13)
  {
LABEL_12:
    v24 = 2;
    goto LABEL_13;
  }
  -[CNAvatarView delegate](self, "delegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_opt_respondsToSelector();

  if ((v19 & 1) != 0)
  {
    -[CNAvatarView delegate](self, "delegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "shouldShowActionsForAvatarView:", self);

    if (!v21)
      goto LABEL_12;
  }
  objc_msgSend(v5, "prepareForDisplay");
  -[CNAvatarView name](self, "name");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setName:", v22);

  -[CNAvatarView message](self, "message");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMessage:", v23);

  v24 = 0;
LABEL_13:

  return v24;
}

- (void)avatarCardControllerWillBeginPreviewInteraction:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[CNAvatarView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CNAvatarView delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "willBeginPreviewInteractionForAvatarView:", self);

  }
}

- (id)avatarCardController:(id)a3 orderedPropertiesForProperties:(id)a4 category:(id)a5
{
  id v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;

  v7 = a4;
  v8 = a5;
  -[CNAvatarView delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[CNAvatarView delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "avatarView:orderedPropertiesForProperties:category:", self, v7, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)avatarCardController:(id)a3 shouldShowContact:(id)a4
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  char v9;

  v5 = a4;
  -[CNAvatarView delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[CNAvatarView delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "avatarView:shouldShowContact:", self, v5);

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (void)avatarCardControllerWillDismiss:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[CNAvatarView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CNAvatarView delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "willDismissActionsForAvatarView:", self);

  }
}

- (void)avatarCardControllerDidDismiss:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[CNAvatarView delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CNAvatarView delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "didDismissActionsForAvatarView:", self);

  }
  -[CNAvatarView contacts](self, "contacts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contacts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 != v8)
    objc_msgSend(v9, "cleanupAfterDisplay");

}

- (void)contactDidChange:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *contacts;
  NSArray *v7;
  void *v8;
  NSArray *v9;
  id v10;
  uint64_t v11;
  NSArray *v12;
  NSArray *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[NSArray count](self->_contacts, "count") == 1)
  {
    v18[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    contacts = self->_contacts;
    self->_contacts = v5;

  }
  else
  {
    v7 = (NSArray *)-[NSArray mutableCopy](self->_contacts, "mutableCopy");
    objc_msgSend(v4, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = self->_contacts;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __33__CNAvatarView_contactDidChange___block_invoke;
    v16[3] = &unk_1E204AD08;
    v17 = v8;
    v10 = v8;
    v11 = -[NSArray indexOfObjectPassingTest:](v9, "indexOfObjectPassingTest:", v16);
    if (v11 != 0x7FFFFFFFFFFFFFFFLL)
      -[NSArray replaceObjectAtIndex:withObject:](v7, "replaceObjectAtIndex:withObject:", v11, v4);
    v12 = self->_contacts;
    self->_contacts = v7;
    v13 = v7;

  }
  -[CNAvatarView cardController](self, "cardController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[CNAvatarView cardController](self, "cardController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "prepareWithContacts:store:", 0, 0);

  }
  -[CNAvatarView contactDidChange](self, "contactDidChange");

}

- (CGRect)transitioningFrame
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[CNAvatarView forcePressView](self, "forcePressView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGRect)transitioningImageFrame
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  -[CNAvatarView forcePressView](self, "forcePressView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAvatarView contentImageFrame](self, "contentImageFrame");
  objc_msgSend(v3, "convertRect:fromView:", self);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (BOOL)transitioningImageVisible
{
  return 0;
}

- (void)avatarCacheDidUpdateForIdentifiers:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  _QWORD v13[4];
  id v14;

  v4 = a3;
  -[CNAvatarView contacts](self, "contacts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __51__CNAvatarView_avatarCacheDidUpdateForIdentifiers___block_invoke;
  v13[3] = &unk_1E2050520;
  v7 = v4;
  v14 = v7;
  v8 = objc_msgSend(v5, "_cn_any:", v13);

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "schedulerProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "mainThreadScheduler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v6;
    v12[1] = 3221225472;
    v12[2] = __51__CNAvatarView_avatarCacheDidUpdateForIdentifiers___block_invoke_2;
    v12[3] = &unk_1E204F648;
    v12[4] = self;
    objc_msgSend(v11, "performBlock:", v12);

  }
}

- (CALayer)sourceAvatarLayer
{
  void *v2;
  void *v3;

  -[CNAvatarView imageView](self, "imageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CALayer *)v3;
}

- (void)performTransitionAnimationWithCompletion:(id)a3
{
  -[CNAvatarView performTransitionAnimationWithStartHandler:completion:](self, "performTransitionAnimationWithStartHandler:completion:", 0, a3);
}

- (void)performTransitionAnimationWithStartHandler:(id)a3 completion:(id)a4
{
  void (**v6)(id, uint64_t);
  void (**v7)(id, uint64_t);
  void *v8;
  NSObject *v9;
  CNSharedProfileAnimationGenerator *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void (**v18)(id, uint64_t);
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[5];
  void (**v26)(id, uint64_t);
  _QWORD v27[5];
  void (**v28)(id, uint64_t);
  uint8_t buf[16];

  v6 = (void (**)(id, uint64_t))a3;
  v7 = (void (**)(id, uint64_t))a4;
  -[CNAvatarView sharedProfileStateOracle](self, "sharedProfileStateOracle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    CNUILogAvatarView();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_18AC56000, v9, OS_LOG_TYPE_DEBUG, "Skipping transition animation, no state oracle", buf, 2u);
    }
    goto LABEL_7;
  }
  if (!-[CNAvatarView isPerformingTransition](self, "isPerformingTransition"))
  {
    v10 = objc_alloc_init(CNSharedProfileAnimationGenerator);
    -[CNAvatarView sharedProfileStateOracle](self, "sharedProfileStateOracle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "avatarViewAnimationTypeForEffectiveState");

    if (v6)
      v6[2](v6, v12);
    if (v12 == 2)
    {
      CNUILogAvatarView();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18AC56000, v19, OS_LOG_TYPE_DEFAULT, "No transition animation to perform", buf, 2u);
      }

      if (v7)
        v7[2](v7, 2);
      goto LABEL_25;
    }
    if (v12 == 1)
    {
      -[CNAvatarView setIsPerformingTransition:](self, "setIsPerformingTransition:", 1);
      CNUILogAvatarView();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18AC56000, v20, OS_LOG_TYPE_DEFAULT, "Performing transition animation (peek-a-boo)", buf, 2u);
      }

      -[CNAvatarView sharedProfileStateOracle](self, "sharedProfileStateOracle");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "pendingNickname");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNAvatarView sharedProfileStateOracle](self, "sharedProfileStateOracle");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "contact");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __70__CNAvatarView_performTransitionAnimationWithStartHandler_completion___block_invoke_86;
      v25[3] = &unk_1E204F9B0;
      v25[4] = self;
      v26 = v7;
      -[CNSharedProfileAnimationGenerator performPeekABooAnimationForAnimatingAvatarView:pendingNickname:contact:completionHandler:](v10, "performPeekABooAnimationForAnimatingAvatarView:pendingNickname:contact:completionHandler:", self, v22, v24, v25);

      v18 = v26;
    }
    else
    {
      if (v12)
      {
LABEL_25:

        goto LABEL_26;
      }
      -[CNAvatarView setIsPerformingTransition:](self, "setIsPerformingTransition:", 1);
      CNUILogAvatarView();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18AC56000, v13, OS_LOG_TYPE_DEFAULT, "Performing transition animation (coin flip)", buf, 2u);
      }

      -[CNAvatarView sharedProfileStateOracle](self, "sharedProfileStateOracle");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "pendingNickname");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNAvatarView sharedProfileStateOracle](self, "sharedProfileStateOracle");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "contact");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __70__CNAvatarView_performTransitionAnimationWithStartHandler_completion___block_invoke;
      v27[3] = &unk_1E204F9B0;
      v27[4] = self;
      v28 = v7;
      -[CNSharedProfileAnimationGenerator performCoinFlipAnimationForAnimatingAvatarView:pendingNickname:contact:completionHandler:](v10, "performCoinFlipAnimationForAnimatingAvatarView:pendingNickname:contact:completionHandler:", self, v15, v17, v27);

      v18 = v28;
    }

    goto LABEL_25;
  }
  CNUILogAvatarView();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18AC56000, v9, OS_LOG_TYPE_DEFAULT, "Skipping transition animation, animation already in progress", buf, 2u);
  }
LABEL_7:

  if (v7)
    v7[2](v7, 2);
LABEL_26:

}

- (CNSharedProfileStateOracle)sharedProfileStateOracle
{
  return self->_sharedProfileStateOracle;
}

- (void)setSharedProfileStateOracle:(id)a3
{
  objc_storeStrong((id *)&self->_sharedProfileStateOracle, a3);
}

- (unint64_t)backgroundStyle
{
  return self->_backgroundStyle;
}

- (void)setBackgroundStyle:(unint64_t)a3
{
  self->_backgroundStyle = a3;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setMaskedAvatarIndices:(id)a3
{
  objc_storeStrong((id *)&self->_maskedAvatarIndices, a3);
}

- (NSString)name
{
  return self->_name;
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 496);
}

- (BOOL)showsContactOnTap
{
  return self->_showsContactOnTap;
}

- (void)setImageView:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 520);
}

- (void)setAlternativeImageView:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 528);
}

- (UINavigationController)contactViewNavigationController
{
  return self->_contactViewNavigationController;
}

- (void)setContactViewNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_contactViewNavigationController, a3);
}

- (BOOL)isPerformingTransition
{
  return self->_isPerformingTransition;
}

- (void)setIsPerformingTransition:(BOOL)a3
{
  self->_isPerformingTransition = a3;
}

- (BOOL)registeredInNotifier
{
  return self->_registeredInNotifier;
}

- (void)setRegisteredInNotifier:(BOOL)a3
{
  self->_registeredInNotifier = a3;
}

- (BOOL)registeredContactAction
{
  return self->_registeredContactAction;
}

- (void)setRegisteredContactAction:(BOOL)a3
{
  self->_registeredContactAction = a3;
}

- (UIImage)overrideImage
{
  return self->_overrideImage;
}

- (void)setOverrideImage:(id)a3
{
  objc_storeStrong((id *)&self->_overrideImage, a3);
}

- (BOOL)disableCornerRadiusForAvatar
{
  return self->_disableCornerRadiusForAvatar;
}

- (void)setImageRenderer:(id)a3
{
  objc_storeStrong((id *)&self->_imageRenderer, a3);
}

- (BOOL)shouldFetchSharedMeContactPhoto
{
  return self->_shouldFetchSharedMeContactPhoto;
}

- (void)setSchedulerProvider:(id)a3
{
  objc_storeStrong((id *)&self->_schedulerProvider, a3);
}

- (int64_t)monogrammerStyle
{
  return self->_monogrammerStyle;
}

- (void)setMonogrammerStyle:(int64_t)a3
{
  self->_monogrammerStyle = a3;
}

- (BOOL)asynchronousRendering
{
  return self->_asynchronousRendering;
}

- (NSString)contextToken
{
  return self->_contextToken;
}

- (BOOL)allowsAnimation
{
  return self->_allowsAnimation;
}

- (void)setAllowsAnimation:(BOOL)a3
{
  self->_allowsAnimation = a3;
}

- (BOOL)prohibitsPersonaFetch
{
  return self->_prohibitsPersonaFetch;
}

- (void)setProhibitsPersonaFetch:(BOOL)a3
{
  self->_prohibitsPersonaFetch = a3;
}

uint64_t __70__CNAvatarView_performTransitionAnimationWithStartHandler_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setIsPerformingTransition:", 0);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __70__CNAvatarView_performTransitionAnimationWithStartHandler_completion___block_invoke_86(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setIsPerformingTransition:", 0);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

uint64_t __51__CNAvatarView_avatarCacheDidUpdateForIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "_cn_containsObject:", v3);

  return v4;
}

uint64_t __51__CNAvatarView_avatarCacheDidUpdateForIdentifiers___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "contactDidChange");
}

uint64_t __33__CNAvatarView_contactDidChange___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  return v4;
}

uint64_t __45__CNAvatarView_dismissContactViewController___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setContactViewNavigationController:", 0);
}

void __36__CNAvatarView__renderContactsImage__block_invoke_56(uint64_t a1)
{
  void *v2;
  id v3;
  id WeakRetained;
  BOOL v5;
  char v6;
  uint64_t v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "rendererToken");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "rendererToken");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

  if (v2)
    v5 = v3 == WeakRetained;
  else
    v5 = 1;
  v6 = v5;
  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "setImage:state:", *(_QWORD *)(a1 + 40), 2);
  kdebug_trace();
  if (objc_msgSend(*(id *)(a1 + 32), "isUpdatingGroupViewConfiguration"))
  {
    if ((v6 & 1) != 0)
    {
      v7 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CNUIAvatarViewErrorDomain"), 1, 0);
      v7 = objc_claimAutoreleasedReturnValue();
    }
    v8 = (id)v7;
    objc_msgSend(*(id *)(a1 + 32), "notifyDelegateOfGroupConfigurationUpdateWithError:", v7);

  }
}

uint64_t __60__CNAvatarView_updateViewWithGroupIdentity_maskingContacts___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cn_containsObject:", a2);
}

_DWORD *__110__CNAvatarView_initWithImageRenderer_threeDTouchEnabled_contactStore_style_schedulerProvider_backgroundStyle___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  size_t v24;
  _DWORD *v25;
  id v26;
  CGPoint v28;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (*(_DWORD *)(a2 + 16) == 3)
  {
    v5 = WeakRetained;
    v6 = v5;
    if (v5 && (objc_msgSend(v5, "window"), v7 = (void *)objc_claimAutoreleasedReturnValue(), v7, v7))
    {
      objc_msgSend(v6, "contacts");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "description");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "window");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "center");
      v12 = v11;
      v14 = v13;
      objc_msgSend(v6, "superview");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "convertPoint:fromView:", v15, v12, v14);
      v17 = v16;
      v19 = v18;

      v20 = (void *)MEMORY[0x1E0CB3940];
      v28.x = v17;
      v28.y = v19;
      NSStringFromCGPoint(v28);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringWithFormat:", CFSTR("CNAvatarViewDebug, view at %@ shows %@"), v21, v9);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v22, 200, 0, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "length");
      v25 = malloc_type_calloc(1uLL, v24 + 200, 0x9A04E9B0uLL);
      *v25 = 1;
      v25[1] = v24;
      v26 = objc_retainAutorelease(v23);
      memcpy(v25 + 50, (const void *)objc_msgSend(v26, "bytes"), v24);

    }
    else
    {
      v25 = 0;
    }

  }
  else
  {
    v25 = 0;
  }

  return v25;
}

+ (id)descriptionForDisplayedImageState:(int64_t)a3
{
  if ((unint64_t)a3 > 2)
    return CFSTR("Unexpected Image State");
  else
    return off_1E2048280[a3];
}

void __101__CNAvatarView_descriptorForRequiredKeysWithThreeDTouchEnabled_shouldUseCachingRenderer_description___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0C97200];
  objc_msgSend(*(id *)(a1 + 40), "makeDescriptorForRequiredKeysWithThreeDTouchEnabled:shouldUseCachingRenderer:", *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "descriptorWithKeyDescriptors:description:", v5, *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)descriptorForRequiredKeysWithThreeDTouchEnabled_shouldUseCachingRenderer_description__cn_once_object_3;
  descriptorForRequiredKeysWithThreeDTouchEnabled_shouldUseCachingRenderer_description__cn_once_object_3 = v3;

}

void __101__CNAvatarView_descriptorForRequiredKeysWithThreeDTouchEnabled_shouldUseCachingRenderer_description___block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0C97200];
  objc_msgSend(*(id *)(a1 + 40), "makeDescriptorForRequiredKeysWithThreeDTouchEnabled:shouldUseCachingRenderer:", *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "descriptorWithKeyDescriptors:description:", v5, *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)descriptorForRequiredKeysWithThreeDTouchEnabled_shouldUseCachingRenderer_description__cn_once_object_4;
  descriptorForRequiredKeysWithThreeDTouchEnabled_shouldUseCachingRenderer_description__cn_once_object_4 = v3;

}

- (CNAvatarView)initWithContact:(id)a3
{
  id v4;
  CNAvatarView *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[CNAvatarView init](self, "init");
  if (v5)
  {
    if (v4)
    {
      v8[0] = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = (void *)MEMORY[0x1E0C9AA60];
    }
    -[CNAvatarView setContacts:](v5, "setContacts:", v6);

  }
  return v5;
}

- (CNContact)contact
{
  void *v2;
  void *v3;

  -[CNAvatarView contacts](self, "contacts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CNContact *)v3;
}

- (void)setShowsActionsOnTap:(BOOL)a3
{
  if (self->_showsActionsOnTap != a3)
  {
    self->_showsActionsOnTap = a3;
    -[CNAvatarView _updateCardActions](self, "_updateCardActions");
  }
}

- (BOOL)showsActionsOnTap
{
  return self->_showsActionsOnTap;
}

- (void)setShowsActionsOnForcePress:(BOOL)a3
{
  if (self->_showsActionsOnForcePress != a3)
  {
    self->_showsActionsOnForcePress = a3;
    -[CNAvatarView _updateCardActions](self, "_updateCardActions");
  }
}

- (BOOL)showsActionsOnForcePress
{
  return self->_showsActionsOnForcePress;
}

- (BOOL)enabled
{
  return 1;
}

+ (id)descriptorForRequiredKeys
{
  return (id)objc_msgSend(a1, "descriptorForRequiredKeysWithThreeDTouchEnabled:", 1);
}

void __30___CNAvatarView_setupSubviews__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "bounds");
    v8 = v7;
    v10 = v9;
    objc_msgSend(*(id *)(a1 + 32), "window");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "screen");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "scale");
    objc_msgSend(v16, "_cnui_likenessForSize:scale:", v8, v10, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v16, "_cnui_likeness");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70A70]), "initWithLikeness:", v14);
  objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v15);
  objc_msgSend(*(id *)(a1 + 32), "addSubview:", v15);
  if (a3 == 1)
    *a4 = 1;

}

@end
