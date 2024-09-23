@implementation MRUVisualStylingProvider

- (void)applyStyle:(int64_t)a3 toView:(id)a4
{
  MTVisualStylingProvider *visualStylingProvider;
  id v7;
  double v8;
  id v9;

  visualStylingProvider = self->_visualStylingProvider;
  v7 = a4;
  if (visualStylingProvider)
  {
    -[MTVisualStylingProvider _visualStylingForStyle:](self->_visualStylingProvider, "_visualStylingForStyle:", -[MRUVisualStylingProvider visualStyleForNowPlayingStyle:](self, "visualStyleForNowPlayingStyle:", a3));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "mt_replaceVisualStyling:");
  }
  else
  {
    -[MRUVisualStylingProvider colorForNowPlayingStyle:](self, "colorForNowPlayingStyle:", a3);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[MRUVisualStylingProvider alphaForNowPlayingStyle:](self, "alphaForNowPlayingStyle:", a3);
    objc_msgSend(v7, "mru_applyVisualStylingWithColor:alpha:blendMode:", v9, -[MRUVisualStylingProvider blendModeForNowPlayingStyle:](self, "blendModeForNowPlayingStyle:", a3), v8);
  }

}

- (int64_t)visualStyleForNowPlayingStyle:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3)
    return 0;
  else
    return qword_1AAAD5FA8[a3 - 1];
}

- (MRUVisualStylingProvider)init
{
  MRUVisualStylingProvider *v2;
  uint64_t v3;
  NSHashTable *observers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MRUVisualStylingProvider;
  v2 = -[MRUVisualStylingProvider init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v3 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

  }
  return v2;
}

- (MRUVisualStylingProvider)initWithVisualStylingProvider:(id)a3
{
  id v4;
  MRUVisualStylingProvider *v5;
  MRUVisualStylingProvider *v6;

  v4 = a3;
  v5 = -[MRUVisualStylingProvider init](self, "init");
  v6 = v5;
  if (v5)
    -[MRUVisualStylingProvider setVisualStylingProvider:](v5, "setVisualStylingProvider:", v4);

  return v6;
}

- (void)dealloc
{
  id WeakRetained;
  objc_super v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_traitChangeObservable);
  objc_msgSend(WeakRetained, "unregisterForTraitChanges:", self->_traitChangeRegistration);

  v4.receiver = self;
  v4.super_class = (Class)MRUVisualStylingProvider;
  -[MRUVisualStylingProvider dealloc](&v4, sel_dealloc);
}

- (UIColor)primaryColor
{
  MTVisualStylingProvider *visualStylingProvider;
  void *v4;
  void *v5;

  visualStylingProvider = self->_visualStylingProvider;
  if (visualStylingProvider)
  {
    -[MTVisualStylingProvider _visualStylingForStyle:](visualStylingProvider, "_visualStylingForStyle:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "color");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[MRUVisualStylingProvider colorForNowPlayingStyle:](self, "colorForNowPlayingStyle:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (UIColor *)v5;
}

- (void)setPrimaryColor:(id)a3
{
  objc_storeStrong((id *)&self->_primaryColor, a3);
  if (!self->_visualStylingProvider)
    -[MRUVisualStylingProvider notifyObservers](self, "notifyObservers");
}

- (UIColor)secondaryColor
{
  MTVisualStylingProvider *visualStylingProvider;
  void *v4;
  void *v5;

  visualStylingProvider = self->_visualStylingProvider;
  if (visualStylingProvider)
  {
    -[MTVisualStylingProvider _visualStylingForStyle:](visualStylingProvider, "_visualStylingForStyle:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "color");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[MRUVisualStylingProvider colorForNowPlayingStyle:](self, "colorForNowPlayingStyle:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (UIColor *)v5;
}

- (void)setSecondaryColor:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryColor, a3);
  if (!self->_visualStylingProvider)
    -[MRUVisualStylingProvider notifyObservers](self, "notifyObservers");
}

- (UIColor)tertiaryColor
{
  MTVisualStylingProvider *visualStylingProvider;
  void *v4;
  void *v5;

  visualStylingProvider = self->_visualStylingProvider;
  if (visualStylingProvider)
  {
    -[MTVisualStylingProvider _visualStylingForStyle:](visualStylingProvider, "_visualStylingForStyle:", 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "color");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[MRUVisualStylingProvider colorForNowPlayingStyle:](self, "colorForNowPlayingStyle:", 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (UIColor *)v5;
}

- (void)setTertiaryColor:(id)a3
{
  objc_storeStrong((id *)&self->_tertiaryColor, a3);
  if (!self->_visualStylingProvider)
    -[MRUVisualStylingProvider notifyObservers](self, "notifyObservers");
}

- (UIColor)quaternaryColor
{
  MTVisualStylingProvider *visualStylingProvider;
  void *v4;
  void *v5;

  visualStylingProvider = self->_visualStylingProvider;
  if (visualStylingProvider)
  {
    -[MTVisualStylingProvider _visualStylingForStyle:](visualStylingProvider, "_visualStylingForStyle:", 3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "color");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[MRUVisualStylingProvider colorForNowPlayingStyle:](self, "colorForNowPlayingStyle:", 3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (UIColor *)v5;
}

- (void)setQuaternaryColor:(id)a3
{
  objc_storeStrong((id *)&self->_quaternaryColor, a3);
  if (!self->_visualStylingProvider)
    -[MRUVisualStylingProvider notifyObservers](self, "notifyObservers");
}

- (UIColor)separatorColor
{
  MTVisualStylingProvider *visualStylingProvider;
  void *v4;
  void *v5;

  visualStylingProvider = self->_visualStylingProvider;
  if (visualStylingProvider)
  {
    -[MTVisualStylingProvider _visualStylingForStyle:](visualStylingProvider, "_visualStylingForStyle:", 5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "color");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[MRUVisualStylingProvider colorForNowPlayingStyle:](self, "colorForNowPlayingStyle:", 4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (UIColor *)v5;
}

- (void)setSeparatorColor:(id)a3
{
  objc_storeStrong((id *)&self->_separatorColor, a3);
  if (!self->_visualStylingProvider)
    -[MRUVisualStylingProvider notifyObservers](self, "notifyObservers");
}

- (BOOL)supportsVibrancy
{
  return self->_supportsVibrancy || self->_visualStylingProvider != 0;
}

- (void)setSupportsVibrancy:(BOOL)a3
{
  if (self->_supportsVibrancy != a3)
  {
    self->_supportsVibrancy = a3;
    -[MRUVisualStylingProvider notifyObservers](self, "notifyObservers");
  }
}

- (void)setVisualStylingProvider:(id)a3
{
  MTVisualStylingProvider *v5;
  MTVisualStylingProvider *visualStylingProvider;
  MTVisualStylingProvider *v7;

  v5 = (MTVisualStylingProvider *)a3;
  visualStylingProvider = self->_visualStylingProvider;
  if (visualStylingProvider != v5)
  {
    v7 = v5;
    -[MTVisualStylingProvider _removeObserver:](visualStylingProvider, "_removeObserver:", self);
    objc_storeStrong((id *)&self->_visualStylingProvider, a3);
    -[MTVisualStylingProvider _addObserver:](self->_visualStylingProvider, "_addObserver:", self);
    -[MRUVisualStylingProvider notifyObservers](self, "notifyObservers");
    v5 = v7;
  }

}

- (void)setTraitChangeObservable:(id)a3
{
  id WeakRetained;
  void *v5;
  UITraitChangeRegistration *v6;
  UITraitChangeRegistration *traitChangeRegistration;
  id obj;

  obj = a3;
  if (self->_traitChangeRegistration)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_traitChangeObservable);
    objc_msgSend(WeakRetained, "unregisterForTraitChanges:", self->_traitChangeRegistration);

  }
  objc_storeWeak((id *)&self->_traitChangeObservable, obj);
  objc_msgSend(MEMORY[0x1E0DC3E88], "systemTraitsAffectingColorAppearance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "registerForTraitChanges:withTarget:action:", v5, self, sel_notifyObservers);
  v6 = (UITraitChangeRegistration *)objc_claimAutoreleasedReturnValue();
  traitChangeRegistration = self->_traitChangeRegistration;
  self->_traitChangeRegistration = v6;

}

- (id)colorForStyle:(int64_t)a3
{
  void *v3;
  void *v4;

  if (self->_visualStylingProvider)
  {
    -[MTVisualStylingProvider _visualStylingForStyle:](self->_visualStylingProvider, "_visualStylingForStyle:", -[MRUVisualStylingProvider visualStyleForNowPlayingStyle:](self, "visualStyleForNowPlayingStyle:", a3));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "color");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[MRUVisualStylingProvider colorForNowPlayingStyle:](self, "colorForNowPlayingStyle:", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)applyBlendModeToView:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  if (-[MRUVisualStylingProvider supportsVibrancy](self, "supportsVibrancy"))
  {
    objc_msgSend(v7, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "userInterfaceStyle");

    if (v5 == 2)
      v6 = 2;
    else
      v6 = 1;
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(v7, "_setDrawsAsBackdropOverlayWithBlendMode:", v6);

}

- (void)addObserver:(id)a3
{
  -[NSHashTable addObject:](self->_observers, "addObject:", a3);
}

- (void)removeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (void)notifyObservers
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "visualStylingProviderDidChange:", self);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (id)colorForNowPlayingStyle:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
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
      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor", v3, v4);
      self = (MRUVisualStylingProvider *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      primaryColor = self->_tertiaryColor;
      if (primaryColor)
        goto LABEL_12;
      objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor", v3, v4);
      self = (MRUVisualStylingProvider *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      primaryColor = self->_quaternaryColor;
      if (primaryColor)
        goto LABEL_12;
      objc_msgSend(MEMORY[0x1E0DC3658], "quaternaryLabelColor", v3, v4);
      self = (MRUVisualStylingProvider *)objc_claimAutoreleasedReturnValue();
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
        objc_msgSend(MEMORY[0x1E0DC3658], "labelColor", v3, v4);
        self = (MRUVisualStylingProvider *)objc_claimAutoreleasedReturnValue();
      }
      break;
    default:
      return self;
  }
  return self;
}

- (int64_t)blendModeForNowPlayingStyle:(int64_t)a3
{
  if (-[MRUVisualStylingProvider supportsVibrancy](self, "supportsVibrancy") && (unint64_t)(a3 - 1) <= 3)
    return qword_1AAAD5FC8[a3 - 1];
  else
    return 0;
}

- (double)alphaForNowPlayingStyle:(int64_t)a3
{
  _BOOL4 v4;
  double result;

  v4 = -[MRUVisualStylingProvider supportsVibrancy](self, "supportsVibrancy");
  result = 1.0;
  if (v4 && (unint64_t)(a3 - 1) <= 3)
    return dbl_1AAAD5FE8[a3 - 1];
  return result;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (UITraitChangeRegistration)traitChangeRegistration
{
  return self->_traitChangeRegistration;
}

- (void)setTraitChangeRegistration:(id)a3
{
  objc_storeStrong((id *)&self->_traitChangeRegistration, a3);
}

- (UITraitChangeObservable)traitChangeObservable
{
  return (UITraitChangeObservable *)objc_loadWeakRetained((id *)&self->_traitChangeObservable);
}

- (MTVisualStylingProvider)visualStylingProvider
{
  return self->_visualStylingProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualStylingProvider, 0);
  objc_destroyWeak((id *)&self->_traitChangeObservable);
  objc_storeStrong((id *)&self->_traitChangeRegistration, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_separatorColor, 0);
  objc_storeStrong((id *)&self->_quaternaryColor, 0);
  objc_storeStrong((id *)&self->_tertiaryColor, 0);
  objc_storeStrong((id *)&self->_secondaryColor, 0);
  objc_storeStrong((id *)&self->_primaryColor, 0);
}

@end
