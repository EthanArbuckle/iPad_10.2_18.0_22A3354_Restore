@implementation MUActionRowItemViewModel

- (MUActionRowItemViewModel)init
{
  MUActionRowItemViewModel *v2;
  id v3;
  uint64_t v4;
  GEOObserverHashTable *observers;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MUActionRowItemViewModel;
  v2 = -[MUActionRowItemViewModel init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0D272B8]);
    v4 = objc_msgSend(v3, "initWithProtocol:queue:", &unk_1EE2646A8, MEMORY[0x1E0C80D38]);
    observers = v2->_observers;
    v2->_observers = (GEOObserverHashTable *)v4;

  }
  return v2;
}

- (id)buildMenuWithPresentationOptions:(id)a3
{
  return 0;
}

- (void)addObserver:(id)a3
{
  -[GEOObserverHashTable registerObserver:](self->_observers, "registerObserver:", a3);
}

- (void)removeObserver:(id)a3
{
  -[GEOObserverHashTable unregisterObserver:](self->_observers, "unregisterObserver:", a3);
}

- (void)_notifyObservers
{
  -[GEOObserverHashTable actionRowItemViewModelDidUpdate:](self->_observers, "actionRowItemViewModelDidUpdate:", self);
}

- (void)setFeatureDiscoveryView:(id)a3
{
  MUFeatureDiscoveryAnnotationView *v5;
  MUFeatureDiscoveryAnnotationView *v6;

  v5 = (MUFeatureDiscoveryAnnotationView *)a3;
  if (self->_featureDiscoveryView != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_featureDiscoveryView, a3);
    -[GEOObserverHashTable didUpdateFeatureDiscoveryStatus:](self->_observers, "didUpdateFeatureDiscoveryStatus:", self);
    v5 = v6;
  }

}

- (id)analyticsButtonValue
{
  return 0;
}

- (id)analyticsButtonValues
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  -[MUActionRowItemViewModel analyticsButtonValue](self, "analyticsButtonValue");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    v6[0] = v2;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v4;
}

- (NSString)titleText
{
  return self->_titleText;
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (UIView)accessoryView
{
  return self->_accessoryView;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (NSString)accessibilityIdentifier
{
  return self->_accessibilityIdentifier;
}

- (UIColor)preferredTintColor
{
  return self->_preferredTintColor;
}

- (UIColor)preferredBackgroundColor
{
  return self->_preferredBackgroundColor;
}

- (MUFeatureDiscoveryAnnotationView)featureDiscoveryView
{
  return self->_featureDiscoveryView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureDiscoveryView, 0);
  objc_storeStrong((id *)&self->_preferredBackgroundColor, 0);
  objc_storeStrong((id *)&self->_preferredTintColor, 0);
  objc_storeStrong((id *)&self->_accessibilityIdentifier, 0);
  objc_storeStrong((id *)&self->_accessoryView, 0);
  objc_storeStrong((id *)&self->_symbolName, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
