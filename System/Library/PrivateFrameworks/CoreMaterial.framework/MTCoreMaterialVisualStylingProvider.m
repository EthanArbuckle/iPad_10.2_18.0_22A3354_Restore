@implementation MTCoreMaterialVisualStylingProvider

- (id)visualStylingForStyle:(id)a3
{
  return (id)-[MTVisualStyleSetProviding visualStylingForStyle:](self->_visualStyleSet, "visualStylingForStyle:", a3);
}

- (NSString)visualStyleSetName
{
  return (NSString *)-[MTVisualStyleSetProviding visualStyleSetName](self->_visualStyleSet, "visualStyleSetName");
}

- (void)addObserver:(id)a3
{
  id v4;
  NSPointerArray *observers;
  NSPointerArray *v6;
  NSPointerArray *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    observers = self->_observers;
    v8 = v4;
    if (!observers)
    {
      v6 = (NSPointerArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3868]), "initWithOptions:", 5);
      v7 = self->_observers;
      self->_observers = v6;

      observers = self->_observers;
    }
    -[NSPointerArray addPointer:](observers, "addPointer:", v8);
    v4 = v8;
  }

}

+ (id)coreMaterialVisualStylingProviderForStyleSetNamed:(id)a3 inBundle:(id)a4
{
  void *v4;
  MTCoreMaterialVisualStylingProvider *v5;

  if (a3)
  {
    MTSharedVisualStyleSetForStyleNameFromBundle(a3, a4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = objc_alloc_init(MTCoreMaterialVisualStylingProvider);
      -[MTCoreMaterialVisualStylingProvider _setVisualStyleSet:](v5, "_setVisualStyleSet:", v4);
    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (id)coreMaterialVisualStylingProviderForRecipe:(id)a3 andCategory:(id)a4
{
  MTCoreMaterialVisualStylingProvider *v4;
  void *v5;

  v4 = 0;
  if (a3 && a4)
  {
    MTSharedVisualStyleSetForRecipeAndCategory(a3, a4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v4 = objc_alloc_init(MTCoreMaterialVisualStylingProvider);
      -[MTCoreMaterialVisualStylingProvider _setVisualStyleSet:](v4, "_setVisualStyleSet:", v5);
    }
    else
    {
      v4 = 0;
    }

  }
  return v4;
}

- (void)_setVisualStyleSet:(id)a3
{
  MTVisualStyleSetProviding *v5;
  MTVisualStyleSetProviding *visualStyleSet;
  MTVisualStyleSetProviding *v7;

  v5 = (MTVisualStyleSetProviding *)a3;
  visualStyleSet = self->_visualStyleSet;
  if (visualStyleSet != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_visualStyleSet, a3);
    v5 = v7;
    if (v7)
    {
      if (visualStyleSet)
      {
        -[MTCoreMaterialVisualStylingProvider _notifyObserversWithBlock:](self, "_notifyObserversWithBlock:", &__block_literal_global_8);
        v5 = v7;
      }
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_visualStyleSet, 0);
}

- (void)removeObserver:(id)a3
{
  NSPointerArray *observers;
  uint64_t v5;
  id v6;

  v6 = a3;
  if (v6)
  {
    observers = self->_observers;
    if (observers)
    {
      -[NSPointerArray compact](observers, "compact");
      if (-[NSPointerArray count](self->_observers, "count"))
      {
        v5 = 0;
        while (-[NSPointerArray pointerAtIndex:](self->_observers, "pointerAtIndex:", v5) != v6)
        {
          if (++v5 >= -[NSPointerArray count](self->_observers, "count"))
            goto LABEL_9;
        }
        -[NSPointerArray removePointerAtIndex:](self->_observers, "removePointerAtIndex:", v5);
      }
    }
  }
LABEL_9:

}

void __58__MTCoreMaterialVisualStylingProvider__setVisualStyleSet___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "providedStylesDidChangeForProvider:", v5);

}

- (void)_notifyObserversWithBlock:(id)a3
{
  void (**v4)(id, id, void *);
  NSPointerArray *observers;
  unint64_t v6;
  void *v7;
  id v8;
  id location;

  v4 = (void (**)(id, id, void *))a3;
  if (v4)
  {
    observers = self->_observers;
    if (observers)
    {
      -[NSPointerArray compact](observers, "compact");
      if (-[NSPointerArray count](self->_observers, "count"))
      {
        v6 = 0;
        do
        {
          objc_initWeak(&location, self);
          -[NSPointerArray pointerAtIndex:](self->_observers, "pointerAtIndex:", v6);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = objc_loadWeakRetained(&location);
          v4[2](v4, v8, v7);

          objc_destroyWeak(&location);
          ++v6;
        }
        while (v6 < -[NSPointerArray count](self->_observers, "count"));
      }
    }
  }

}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[MTCoreMaterialVisualStylingProvider visualStyleSetName](self, "visualStyleSetName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p: visualStyleSetName: %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (MTVisualStyleSetProviding)_visualStyleSet
{
  return self->_visualStyleSet;
}

- (NSPointerArray)_observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

+ (BOOL)canGenerateVisualStyleSetFromRecipe:(id)a3
{
  void *v3;
  BOOL VisualStylingDescriptionFromRecipeSettings;

  MTMaterialSettingsForRecipe(a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  VisualStylingDescriptionFromRecipeSettings = MTCanGenerateVisualStylingDescriptionFromRecipeSettings(v3);

  return VisualStylingDescriptionFromRecipeSettings;
}

- (BOOL)updateVisualStyleSetFromRecipe:(id)a3 andCategory:(id)a4
{
  BOOL v4;
  void *v6;

  v4 = 0;
  if (a3 && a4)
  {
    MTSharedVisualStyleSetForRecipeAndCategory(a3, a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v6 != 0;
    if (v6)
      -[MTCoreMaterialVisualStylingProvider _setVisualStyleSet:](self, "_setVisualStyleSet:", v6);

  }
  return v4;
}

- (BOOL)updateVisualStyleSetGeneratedFromRecipe:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  char v9;
  void *v10;

  v4 = a3;
  if (v4)
  {
    +[MTRecipeMaterialSettings styleSetNameForStyleSetFromRecipeWithName:](MTRecipeMaterialSettings, "styleSetNameForStyleSetFromRecipeWithName:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTCoreMaterialVisualStylingProvider _visualStyleSet](self, "_visualStyleSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "visualStyleSetName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", v5);
    v9 = v8 ^ 1;

    if ((v8 & 1) == 0)
    {
      MTSharedVisualStyleSetGeneratedFromRecipe(v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[MTCoreMaterialVisualStylingProvider _setVisualStyleSet:](self, "_setVisualStyleSet:", v10);

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end
