@implementation SFUnifiedTabBarItem

- (void)setUUID:(id)a3
{
  objc_storeStrong((id *)&self->_UUID, a3);
}

- (SFUnifiedTabBarItem)init
{
  SFUnifiedTabBarItem *v2;
  SFUnifiedTabBarItem *v3;
  NSArray *shareParticipants;
  SFUnifiedTabBarItem *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFUnifiedTabBarItem;
  v2 = -[SFUnifiedTabBarItem init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_downloadProgress = -2.0;
    shareParticipants = v2->_shareParticipants;
    v2->_shareParticipants = (NSArray *)MEMORY[0x1E0C9AA60];

    -[SFUnifiedBarItem setViewReuseIdentifier:](v3, "setViewReuseIdentifier:", CFSTR("SFUnifiedTabBarItem"));
    v5 = v3;
  }

  return v3;
}

- (void)setDownloadProgress:(double)a3
{
  -[SFUnifiedTabBarItem setDownloadProgress:animated:](self, "setDownloadProgress:animated:", 0, a3);
}

- (void)setShowsBadgeOnExtensionsButton:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_showsBadgeOnExtensionsButton = a3;
  -[SFUnifiedTabBarItem itemView](self, "itemView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowsBadgeOnExtensionsButton:", v3);

}

- (void)setMenuButtonBadges:(unint64_t)a3
{
  id v4;

  self->_menuButtonBadges = a3;
  -[SFUnifiedTabBarItem itemView](self, "itemView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMenuButtonBadges:", a3);

}

- (void)setIcon:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_icon, a3);
  v5 = a3;
  -[SFUnifiedTabBarItem itemView](self, "itemView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIcon:", v5);

}

- (void)setDownloadProgress:(double)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  self->_downloadProgress = a3;
  -[SFUnifiedTabBarItem itemView](self, "itemView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDownloadProgress:animated:", v4, a3);

}

- (void)navigationBarItemDidUpdateShowsSearchIndicator:(id)a3
{
  uint64_t v4;
  id v5;

  v4 = objc_msgSend(a3, "showsSearchIndicator");
  -[SFUnifiedTabBarItem itemView](self, "itemView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShowsSearchIcon:", v4);

}

- (void)navigationBarItemDidUpdateExtensionButtonConfiguration:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "extensionButtonConfiguration");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SFUnifiedTabBarItem itemView](self, "itemView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setExtensionButtonConfiguration:", v5);

}

- (void)navigationBarItemDidUpdateText:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v4 = a3;
  -[SFUnifiedTabBarItem itemView](self, "itemView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitleWhenActive:", v5);

  objc_msgSend(v4, "textWhenExpanded");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTextWhenExpanded:", v6);

  v7 = objc_msgSend(v4, "startIndexOfTextInExpandedText");
  objc_msgSend(v8, "setStartIndexOfTitleInTextWhenExpanded:", v7);

}

- (void)navigationBarItemDidUpdateShowsVoiceSearchButton:(id)a3
{
  uint64_t v4;
  id v5;

  v4 = objc_msgSend(a3, "showsVoiceSearchButton");
  -[SFUnifiedTabBarItem itemView](self, "itemView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShowsVoiceSearchButton:", v4);

}

- (void)setNavigationBarItem:(id)a3
{
  SFNavigationBarItem *v5;
  SFNavigationBarItem *navigationBarItem;
  void *v7;
  SFNavigationBarItem *v8;

  v5 = (SFNavigationBarItem *)a3;
  navigationBarItem = self->_navigationBarItem;
  if (navigationBarItem != v5)
  {
    v8 = v5;
    -[SFNavigationBarItem removeObserver:](navigationBarItem, "removeObserver:", self);
    objc_storeStrong((id *)&self->_navigationBarItem, a3);
    -[SFNavigationBarItem addObserver:](v8, "addObserver:", self);
    -[SFUnifiedTabBarItem itemView](self, "itemView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[SFUnifiedTabBarItem _configureItemView:isPreview:](self, "_configureItemView:isPreview:", v7, 0);
      objc_msgSend(v7, "setContentOptions:resetDisplay:", -[SFNavigationBarItem contentOptions](v8, "contentOptions"), 1);
    }

    v5 = v8;
  }

}

- (void)setMenuButtonConfigurator:(id)a3
{
  SFMenuConfiguring **p_menuButtonConfigurator;
  id v5;
  id v6;

  p_menuButtonConfigurator = &self->_menuButtonConfigurator;
  v5 = a3;
  objc_storeWeak((id *)p_menuButtonConfigurator, v5);
  -[SFUnifiedTabBarItem itemView](self, "itemView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFormatMenuButtonConfigurator:", v5);

}

- (void)setTitle:(id)a3
{
  id v4;
  NSString *v5;
  NSString *title;
  id v7;

  v4 = a3;
  v5 = (NSString *)objc_msgSend(v4, "copy");
  title = self->_title;
  self->_title = v5;

  -[SFUnifiedTabBarItem itemView](self, "itemView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:", v4);

}

- (SFUnifiedTabBarItemView)itemView
{
  void *v2;
  id v3;

  -[SFUnifiedBarItem reusableView](self, "reusableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v3 = v2;
  else
    v3 = 0;

  return (SFUnifiedTabBarItemView *)v3;
}

- (void)setLastReloadDate:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_lastReloadDate, a3);
  v5 = a3;
  -[SFUnifiedTabBarItem itemView](self, "itemView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLastReloadDate:", v5);

}

- (void)setMediaStateIcon:(unint64_t)a3
{
  id v4;

  self->_mediaStateIcon = a3;
  -[SFUnifiedTabBarItem itemView](self, "itemView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMediaStateIcon:", a3);

}

- (void)toggleExtensionBadge
{
  -[SFUnifiedTabBarItem setMenuButtonBadges:](self, "setMenuButtonBadges:", 2 * (self->_menuButtonBadges == 0));
}

- (id)bestButtonForExtensionPopoverSource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;

  v4 = a3;
  -[SFUnifiedTabBarItem itemView](self, "itemView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extensionButtonConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "buttons");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "extension");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v4)
  {
    -[SFUnifiedTabBarItem itemView](self, "itemView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstExtensionButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((unint64_t)objc_msgSend(v7, "count") < 2)
    {
      v10 = 0;
    }
    else
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v10, "extension");
    v12 = (id)objc_claimAutoreleasedReturnValue();

    -[SFUnifiedTabBarItem itemView](self, "itemView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v12 == v4)
      objc_msgSend(v13, "secondExtensionButton");
    else
      objc_msgSend(v13, "multipleExtensionsButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (void)setUnread:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_unread != a3)
  {
    v3 = a3;
    self->_unread = a3;
    -[SFUnifiedTabBarItem itemView](self, "itemView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setUnread:", v3);

  }
}

- (void)setShareParticipants:(id)a3
{
  NSArray *v4;
  NSArray *shareParticipants;
  void *v6;
  id v7;

  v7 = a3;
  if (!-[NSArray isEqualToArray:](self->_shareParticipants, "isEqualToArray:"))
  {
    v4 = (NSArray *)objc_msgSend(v7, "copy");
    shareParticipants = self->_shareParticipants;
    self->_shareParticipants = v4;

    -[SFUnifiedTabBarItem itemView](self, "itemView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setShareParticipants:", v7);

  }
}

- (void)setReusableView:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v4 = a3;
  -[SFUnifiedBarItem reusableView](self, "reusableView");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)SFUnifiedTabBarItem;
    -[SFUnifiedBarItem setReusableView:](&v6, sel_setReusableView_, v4);
  }

}

- (void)configureItemView:(id)a3 isPreview:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[SFUnifiedTabBarItem _configureItemView:isPreview:](self, "_configureItemView:isPreview:", v6, v4);

}

- (void)_configureItemView:(id)a3 isPreview:(BOOL)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double downloadProgress;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  if (self->_icon)
  {
    objc_msgSend(v15, "setIcon:");
  }
  else
  {
    +[_SFFaviconProvider fallbackFavicon](_SFFaviconProvider, "fallbackFavicon");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setIcon:", v6);

  }
  objc_msgSend(v15, "setTitle:", self->_title);
  -[SFNavigationBarItem text](self->_navigationBarItem, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTitleWhenActive:", v7);

  -[SFNavigationBarItem textWhenExpanded](self->_navigationBarItem, "textWhenExpanded");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTextWhenExpanded:", v8);

  objc_msgSend(v15, "setStartIndexOfTitleInTextWhenExpanded:", -[SFNavigationBarItem startIndexOfTextInExpandedText](self->_navigationBarItem, "startIndexOfTextInExpandedText"));
  objc_msgSend(v15, "setShowsSearchIcon:", -[SFNavigationBarItem showsSearchIndicator](self->_navigationBarItem, "showsSearchIndicator"));
  objc_msgSend(v15, "setShowsLockIcon:", -[SFNavigationBarItem showsLockIcon](self->_navigationBarItem, "showsLockIcon"));
  objc_msgSend(v15, "setShowsVoiceSearchButton:", -[SFNavigationBarItem showsVoiceSearchButton](self->_navigationBarItem, "showsVoiceSearchButton"));
  objc_msgSend(v15, "setSecurityAnnotation:", -[SFNavigationBarItem securityAnnotation](self->_navigationBarItem, "securityAnnotation"));
  objc_msgSend(v15, "setMenuButtonSelected:", -[SFNavigationBarItem menuButtonSelected](self->_navigationBarItem, "menuButtonSelected"));
  objc_msgSend(v15, "setShowsTranslationIcon:", -[SFNavigationBarItem showsTranslationIcon](self->_navigationBarItem, "showsTranslationIcon"));
  objc_msgSend(v15, "setShowsStopReloadButton:", -[SFNavigationBarItem showsStopReloadButtons](self->_navigationBarItem, "showsStopReloadButtons"));
  objc_msgSend(v15, "setStopReloadButtonShowsStop:", -[SFNavigationBarItem stopReloadButtonShowsStop](self->_navigationBarItem, "stopReloadButtonShowsStop"));
  objc_msgSend(v15, "setLastReloadDate:", self->_lastReloadDate);
  objc_msgSend(v15, "setMediaStateIcon:", self->_mediaStateIcon);
  -[SFNavigationBarItem extensionButtonConfiguration](self->_navigationBarItem, "extensionButtonConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setExtensionButtonConfiguration:", v9);

  objc_msgSend(v15, "setMenuButtonBadges:", self->_menuButtonBadges);
  objc_msgSend(v15, "setShowsBadgeOnExtensionsButton:", self->_showsBadgeOnExtensionsButton);
  objc_msgSend(v15, "setUnread:", self->_unread);
  objc_msgSend(v15, "setShareParticipants:", self->_shareParticipants);
  objc_msgSend(v15, "setShowsSiriReaderPlayingIcon:", -[SFNavigationBarItem showsSiriReaderPlayingIcon](self->_navigationBarItem, "showsSiriReaderPlayingIcon"));
  objc_msgSend(v15, "setHasHiddenElements:", -[SFNavigationBarItem hasHiddenElements](self->_navigationBarItem, "hasHiddenElements"));
  -[SFNavigationBarItem overlayConfiguration](self->_navigationBarItem, "overlayConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setOverlayConfiguration:", v10);

  objc_msgSend(v15, "updateEntityAnnotationWithUUID:", self->_UUID);
  downloadProgress = -2.0;
  if (!a4)
  {
    -[SFNavigationBarItem fluidProgressController](self->_navigationBarItem, "fluidProgressController", -2.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFNavigationBarItem fluidProgressStateSource](self->_navigationBarItem, "fluidProgressStateSource");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "progressState");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setFluidProgressController:withCurrentState:", v12, v14);

    downloadProgress = self->_downloadProgress;
  }
  objc_msgSend(v15, "setDownloadProgress:animated:", 0, downloadProgress);

}

- (id)menuElementRepresentationWithSelectionHandler:(id)a3
{
  id v4;
  NSString *title;
  void *v6;
  UIImage *icon;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  title = self->_title;
  v6 = (void *)MEMORY[0x1E0DC3428];
  icon = self->_icon;
  v8 = icon;
  if (!icon)
  {
    +[_SFFaviconProvider fallbackFavicon](_SFFaviconProvider, "fallbackFavicon");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __69__SFUnifiedTabBarItem_menuElementRepresentationWithSelectionHandler___block_invoke;
  v12[3] = &unk_1E21E1C90;
  v12[4] = self;
  v13 = v4;
  v9 = v4;
  objc_msgSend(v6, "actionWithTitle:image:identifier:handler:", title, v8, 0, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!icon)
  return v10;
}

uint64_t __69__SFUnifiedTabBarItem_menuElementRepresentationWithSelectionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)updateEntityAnnotation
{
  id v3;

  -[SFUnifiedTabBarItem itemView](self, "itemView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateEntityAnnotationWithUUID:", self->_UUID);

}

- (BOOL)hasOverlayConfiguration
{
  void *v3;
  BOOL v4;
  void *v5;

  -[SFNavigationBarItem overlayConfiguration](self->_navigationBarItem, "overlayConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    -[SFNavigationBarItem overlayNarrowConfiguration](self->_navigationBarItem, "overlayNarrowConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 != 0;

  }
  return v4;
}

- (void)navigationBarItemDidUpdateShowsLockIcon:(id)a3
{
  uint64_t v4;
  id v5;

  v4 = objc_msgSend(a3, "showsLockIcon");
  -[SFUnifiedTabBarItem itemView](self, "itemView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShowsLockIcon:", v4);

}

- (void)navigationBarItemDidUpdateShowsStopReloadButtons:(id)a3
{
  uint64_t v4;
  id v5;

  v4 = objc_msgSend(a3, "showsStopReloadButtons");
  -[SFUnifiedTabBarItem itemView](self, "itemView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShowsStopReloadButton:", v4);

}

- (void)navigationBarItemDidUpdateStopReloadButtonShowsStop:(id)a3
{
  uint64_t v4;
  id v5;

  v4 = objc_msgSend(a3, "stopReloadButtonShowsStop");
  -[SFUnifiedTabBarItem itemView](self, "itemView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setStopReloadButtonShowsStop:", v4);

}

- (void)navigationBarItemDidUpdateFormatButtonSelected:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = a3;
  -[SFUnifiedTabBarItem itemView](self, "itemView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMenuButtonSelected:", objc_msgSend(v4, "menuButtonSelected"));
  v5 = objc_msgSend(v4, "readerButtonSelected");

  objc_msgSend(v6, "setShowsReaderIcon:", v5);
}

- (void)navigationBarItemDidUpdateSecurityAnnotation:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "securityAnnotation");
  -[SFUnifiedTabBarItem itemView](self, "itemView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSecurityAnnotation:", v5);

  v7 = objc_msgSend(v4, "hasFocusedSensitiveFieldOnCurrentPage");
  -[SFUnifiedTabBarItem itemView](self, "itemView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHasFocusedSensitiveInputField:", v7);

}

- (void)navigationBarItemDidUpdateShowsTranslationIcon:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v4 = a3;
  -[SFUnifiedTabBarItem itemView](self, "itemView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "showsTranslationIcon");
  v6 = objc_msgSend(v4, "menuButtonSelected");

  objc_msgSend(v7, "setMenuButtonSelected:", v6);
  objc_msgSend(v7, "setShowsTranslationIcon:", v5);

}

- (void)navigationBarItemDidUpdateShowsSiriReaderPlayingIcon:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = a3;
  -[SFUnifiedTabBarItem itemView](self, "itemView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMenuButtonSelected:", objc_msgSend(v4, "menuButtonSelected"));
  v5 = objc_msgSend(v4, "showsSiriReaderPlayingIcon");

  objc_msgSend(v6, "setShowsSiriReaderPlayingIcon:", v5);
}

- (void)navigationBarItemDidUpdateContentOptions:(id)a3 resetDisplay:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  id v8;

  v4 = a4;
  v6 = a3;
  -[SFUnifiedTabBarItem itemView](self, "itemView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMenuButtonSelected:", objc_msgSend(v6, "menuButtonSelected"));
  v7 = objc_msgSend(v6, "contentOptions");

  objc_msgSend(v8, "setContentOptions:resetDisplay:", v7, v4);
}

- (void)navigationBarItemDidUpdateHasHiddenElements:(id)a3
{
  uint64_t v4;
  id v5;

  v4 = objc_msgSend(a3, "hasHiddenElements");
  -[SFUnifiedTabBarItem itemView](self, "itemView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHasHiddenElements:", v4);

}

- (void)navigationBarItemDidUpdateOverlayConfiguration:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "overlayConfiguration");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SFUnifiedTabBarItem itemView](self, "itemView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOverlayConfiguration:", v5);

}

- (SFNavigationBarItem)navigationBarItem
{
  return self->_navigationBarItem;
}

- (UIImage)icon
{
  return self->_icon;
}

- (NSString)title
{
  return self->_title;
}

- (NSDate)lastReloadDate
{
  return self->_lastReloadDate;
}

- (unint64_t)mediaStateIcon
{
  return self->_mediaStateIcon;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (double)downloadProgress
{
  return self->_downloadProgress;
}

- (SFMenuConfiguring)menuButtonConfigurator
{
  return (SFMenuConfiguring *)objc_loadWeakRetained((id *)&self->_menuButtonConfigurator);
}

- (unint64_t)menuButtonBadges
{
  return self->_menuButtonBadges;
}

- (BOOL)showsBadgeOnExtensionsButton
{
  return self->_showsBadgeOnExtensionsButton;
}

- (BOOL)isUnread
{
  return self->_unread;
}

- (NSArray)shareParticipants
{
  return self->_shareParticipants;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareParticipants, 0);
  objc_destroyWeak((id *)&self->_menuButtonConfigurator);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_lastReloadDate, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_navigationBarItem, 0);
}

@end
