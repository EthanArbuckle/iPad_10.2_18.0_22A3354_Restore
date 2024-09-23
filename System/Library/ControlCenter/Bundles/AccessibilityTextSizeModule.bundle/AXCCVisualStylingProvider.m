@implementation AXCCVisualStylingProvider

- (AXCCVisualStylingProvider)init
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  AXCCVisualStylingProvider *v5;
  uint64_t v6;
  NSHashTable *observers;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AXCCVisualStylingProvider;
  v5 = -[AXCCVisualStylingProvider init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend_weakObjectsHashTable(MEMORY[0x24BDD15C0], v2, v3, v4);
    v6 = objc_claimAutoreleasedReturnValue();
    observers = v5->_observers;
    v5->_observers = (NSHashTable *)v6;

  }
  return v5;
}

- (AXCCVisualStylingProvider)initWithVisualStylingProvider:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  AXCCVisualStylingProvider *v8;
  const char *v9;
  uint64_t v10;
  AXCCVisualStylingProvider *v11;

  v4 = a3;
  v8 = (AXCCVisualStylingProvider *)objc_msgSend_init(self, v5, v6, v7);
  v11 = v8;
  if (v8)
    objc_msgSend_setVisualStylingProvider_(v8, v9, (uint64_t)v4, v10);

  return v11;
}

- (UIColor)primaryColor
{
  uint64_t v2;
  MTVisualStylingProvider *visualStylingProvider;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  visualStylingProvider = self->_visualStylingProvider;
  if (visualStylingProvider)
  {
    objc_msgSend__visualStylingForStyle_(visualStylingProvider, a2, 0, v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_color(v5, v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend_colorForNowPlayingStyle_(self, a2, 0, v2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (UIColor *)v9;
}

- (void)setPrimaryColor:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;

  objc_storeStrong((id *)&self->_primaryColor, a3);
  if (!self->_visualStylingProvider)
    objc_msgSend_notifyObservers(self, v4, v5, v6);
}

- (UIColor)secondaryColor
{
  uint64_t v2;
  MTVisualStylingProvider *visualStylingProvider;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  visualStylingProvider = self->_visualStylingProvider;
  if (visualStylingProvider)
  {
    objc_msgSend__visualStylingForStyle_(visualStylingProvider, a2, 1, v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_color(v5, v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend_colorForNowPlayingStyle_(self, a2, 1, v2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (UIColor *)v9;
}

- (void)setSecondaryColor:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;

  objc_storeStrong((id *)&self->_secondaryColor, a3);
  if (!self->_visualStylingProvider)
    objc_msgSend_notifyObservers(self, v4, v5, v6);
}

- (UIColor)tertiaryColor
{
  uint64_t v2;
  MTVisualStylingProvider *visualStylingProvider;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  visualStylingProvider = self->_visualStylingProvider;
  if (visualStylingProvider)
  {
    objc_msgSend__visualStylingForStyle_(visualStylingProvider, a2, 2, v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_color(v5, v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend_colorForNowPlayingStyle_(self, a2, 2, v2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (UIColor *)v9;
}

- (void)setTertiaryColor:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;

  objc_storeStrong((id *)&self->_tertiaryColor, a3);
  if (!self->_visualStylingProvider)
    objc_msgSend_notifyObservers(self, v4, v5, v6);
}

- (UIColor)quaternaryColor
{
  uint64_t v2;
  MTVisualStylingProvider *visualStylingProvider;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  visualStylingProvider = self->_visualStylingProvider;
  if (visualStylingProvider)
  {
    objc_msgSend__visualStylingForStyle_(visualStylingProvider, a2, 3, v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_color(v5, v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend_colorForNowPlayingStyle_(self, a2, 3, v2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (UIColor *)v9;
}

- (void)setQuaternaryColor:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;

  objc_storeStrong((id *)&self->_quaternaryColor, a3);
  if (!self->_visualStylingProvider)
    objc_msgSend_notifyObservers(self, v4, v5, v6);
}

- (UIColor)separatorColor
{
  uint64_t v2;
  MTVisualStylingProvider *visualStylingProvider;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  visualStylingProvider = self->_visualStylingProvider;
  if (visualStylingProvider)
  {
    objc_msgSend__visualStylingForStyle_(visualStylingProvider, a2, 5, v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_color(v5, v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend_colorForNowPlayingStyle_(self, a2, 4, v2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (UIColor *)v9;
}

- (void)setSeparatorColor:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;

  objc_storeStrong((id *)&self->_separatorColor, a3);
  if (!self->_visualStylingProvider)
    objc_msgSend_notifyObservers(self, v4, v5, v6);
}

- (void)setSupportsVibrancy:(BOOL)a3
{
  uint64_t v3;

  if (self->_supportsVibrancy != a3)
  {
    self->_supportsVibrancy = a3;
    objc_msgSend_notifyObservers(self, a2, a3, v3);
  }
}

- (void)setVisualStylingProvider:(id)a3
{
  char *v5;
  uint64_t v6;
  MTVisualStylingProvider *visualStylingProvider;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;

  v5 = (char *)a3;
  visualStylingProvider = self->_visualStylingProvider;
  if (visualStylingProvider != (MTVisualStylingProvider *)v5)
  {
    v13 = v5;
    objc_msgSend__removeObserver_(visualStylingProvider, v5, (uint64_t)self, v6);
    objc_storeStrong((id *)&self->_visualStylingProvider, a3);
    objc_msgSend__addObserver_(self->_visualStylingProvider, v8, (uint64_t)self, v9);
    objc_msgSend_notifyObservers(self, v10, v11, v12);
    v5 = v13;
  }

}

- (void)applyStyle:(int64_t)a3 toView:(id)a4
{
  MTVisualStylingProvider *visualStylingProvider;
  const char *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  double v17;
  double v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  id v23;

  visualStylingProvider = self->_visualStylingProvider;
  v9 = a4;
  if (visualStylingProvider)
  {
    v10 = objc_msgSend_visualStyleForNowPlayingStyle_(self, v7, a3, v8);
    objc_msgSend__visualStylingForStyle_(self->_visualStylingProvider, v11, v10, v12);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_mt_replaceVisualStyling_(v9, v13, (uint64_t)v23, v14);
  }
  else
  {
    objc_msgSend_colorForNowPlayingStyle_(self, v7, a3, v8);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_alphaForNowPlayingStyle_(self, v15, a3, v16);
    v18 = v17;
    v21 = objc_msgSend_blendModeForNowPlayingStyle_(self, v19, a3, v20);
    objc_msgSend_axcc_applyVisualStylingWithColor_alpha_blendMode_(v9, v22, (uint64_t)v23, v21, v18);
  }

}

- (void)applyStyle:(int64_t)a3 withBlock:(id)a4
{
  MTVisualStylingProvider *visualStylingProvider;
  const char *v7;
  uint64_t v8;
  void (**v9)(id, id);
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;

  visualStylingProvider = self->_visualStylingProvider;
  v9 = (void (**)(id, id))a4;
  if (visualStylingProvider)
  {
    v10 = objc_msgSend_visualStyleForNowPlayingStyle_(self, v7, a3, v8);
    objc_msgSend__visualStylingForStyle_(self->_visualStylingProvider, v11, v10, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_color(v13, v14, v15, v16);
    v17 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend_colorForNowPlayingStyle_(self, v7, a3, v8);
    v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9[2](v9, v17);

}

- (void)addObserver:(id)a3
{
  uint64_t v3;

  objc_msgSend_addObject_(self->_observers, a2, (uint64_t)a3, v3);
}

- (void)removeObserver:(id)a3
{
  ((void (*)(NSHashTable *, char *, id))MEMORY[0x24BEDD108])(self->_observers, sel_removeObject_, a3);
}

- (void)notifyObservers
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (void *)objc_msgSend_copy(self->_observers, a2, v2, v3, 0);
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v13, (uint64_t)v17, 16);
  if (v7)
  {
    v10 = v7;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v5);
        objc_msgSend_visualStylingProviderDidChange_(*(void **)(*((_QWORD *)&v13 + 1) + 8 * v12++), v8, (uint64_t)self, v9);
      }
      while (v10 != v12);
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v13, (uint64_t)v17, 16);
    }
    while (v10);
  }

}

- (int64_t)visualStyleForNowPlayingStyle:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3)
    return 0;
  else
    return qword_230F8E390[a3 - 1];
}

- (id)colorForNowPlayingStyle:(int64_t)a3
{
  uint64_t v3;
  UIColor *primaryColor;

  switch(a3)
  {
    case 0:
      primaryColor = self->_primaryColor;
      if (primaryColor)
        goto LABEL_12;
      goto LABEL_13;
    case 1:
      primaryColor = self->_secondaryColor;
      if (primaryColor)
        goto LABEL_12;
      objc_msgSend_secondaryLabelColor(MEMORY[0x24BEBD4B8], a2, a3, v3);
      self = (AXCCVisualStylingProvider *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      primaryColor = self->_tertiaryColor;
      if (primaryColor)
        goto LABEL_12;
      objc_msgSend_tertiaryLabelColor(MEMORY[0x24BEBD4B8], a2, a3, v3);
      self = (AXCCVisualStylingProvider *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      primaryColor = self->_quaternaryColor;
      if (primaryColor)
        goto LABEL_12;
      objc_msgSend_quaternaryLabelColor(MEMORY[0x24BEBD4B8], a2, a3, v3);
      self = (AXCCVisualStylingProvider *)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      primaryColor = self->_separatorColor;
      if (primaryColor)
      {
LABEL_12:
        self = primaryColor;
      }
      else
      {
LABEL_13:
        objc_msgSend_labelColor(MEMORY[0x24BEBD4B8], a2, a3, v3);
        self = (AXCCVisualStylingProvider *)objc_claimAutoreleasedReturnValue();
      }
      break;
    default:
      return self;
  }
  return self;
}

- (int64_t)blendModeForNowPlayingStyle:(int64_t)a3
{
  if (self->_supportsVibrancy && (unint64_t)(a3 - 1) <= 3)
    return qword_230F8E3B0[a3 - 1];
  else
    return 0;
}

- (double)alphaForNowPlayingStyle:(int64_t)a3
{
  double result;

  result = 1.0;
  if (self->_supportsVibrancy && (unint64_t)(a3 - 1) <= 3)
    return dbl_230F8E3D0[a3 - 1];
  return result;
}

- (BOOL)supportsVibrancy
{
  return self->_supportsVibrancy;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (MTVisualStylingProvider)visualStylingProvider
{
  return self->_visualStylingProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualStylingProvider, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_separatorColor, 0);
  objc_storeStrong((id *)&self->_quaternaryColor, 0);
  objc_storeStrong((id *)&self->_tertiaryColor, 0);
  objc_storeStrong((id *)&self->_secondaryColor, 0);
  objc_storeStrong((id *)&self->_primaryColor, 0);
}

@end
