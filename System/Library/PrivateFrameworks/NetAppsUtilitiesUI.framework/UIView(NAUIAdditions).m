@implementation UIView(NAUIAdditions)

- (void)naui_showAllViewBoundsRecursively:()NAUIAdditions
{
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x24BDF6950];
  v6 = (double)arc4random_uniform(0xFFu) / 255.0;
  v7 = (double)arc4random_uniform(0xFFu) / 255.0;
  objc_msgSend(v5, "colorWithRed:green:blue:alpha:", v6, v7, (double)arc4random_uniform(0xFFu) / 255.0, 0.400000006);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setBackgroundColor:", v8);

  if (a3)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    objc_msgSend(a1, "subviews", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v15;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v15 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v13++), "naui_showAllViewBoundsRecursively:", 1);
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v11);
    }

  }
}

- (void)naui_setDynamicFontTextStyleDescriptor:()NAUIAdditions
{
  void *v4;
  _NAUIAutoUpdatingFontObserver *v5;
  id value;

  value = a3;
  objc_getAssociatedObject(a1, "naui_dynamicFontTextStyleDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqual:", value) & 1) == 0)
  {
    objc_setAssociatedObject(a1, "naui_dynamicFontTextStyleDescriptor", value, (void *)0x303);
    if (value)
    {
      objc_getAssociatedObject(a1, "naui_dynamicFontObserverKey");
      v5 = (_NAUIAutoUpdatingFontObserver *)objc_claimAutoreleasedReturnValue();
      if (!v5)
      {
        v5 = -[_NAUIAutoUpdatingFontObserver initWithTarget:]([_NAUIAutoUpdatingFontObserver alloc], "initWithTarget:", a1);
        objc_setAssociatedObject(a1, "naui_dynamicFontObserverKey", v5, (void *)0x301);
      }
      -[_NAUIAutoUpdatingFontObserver updateDyamicFontForCurrentContentSize](v5, "updateDyamicFontForCurrentContentSize");

    }
    else
    {
      objc_setAssociatedObject(a1, "naui_dynamicFontObserverKey", 0, (void *)0x301);
    }
  }

}

- (id)naui_dynamicFontTextStyleDescriptor
{
  void *v2;

  objc_getAssociatedObject(a1, "naui_dynamicFontTextStyleDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend((id)objc_msgSend(a1, "font"), "naui_dynamicFontTextStyleDescriptor");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v2 = 0;
    }
  }
  return v2;
}

- (BOOL)naui_canAnimate
{
  void *v2;
  _BOOL8 v3;

  if (!objc_msgSend(MEMORY[0x24BDF6F90], "areAnimationsEnabled"))
    return 0;
  objc_msgSend(a1, "window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

+ (uint64_t)naui_beginDisablingAnimations
{
  uint64_t result;

  if (!_animationsDisabledCount++)
    return objc_msgSend(MEMORY[0x24BDF6F90], "setAnimationsEnabled:", 0);
  return result;
}

+ (uint64_t)naui_endDisablingAnimations
{
  uint64_t result;

  if (!--_animationsDisabledCount)
    return objc_msgSend(MEMORY[0x24BDF6F90], "setAnimationsEnabled:", 1);
  return result;
}

+ (void)naui_performAnimateableChangesWithAnimationDuration:()NAUIAdditions setupBlock:animatablesBlock:completion:
{
  void (**v9)(_QWORD);
  void (**v10)(id, uint64_t);
  id v11;

  v11 = a4;
  v9 = a5;
  v10 = a6;
  if (v11)
    objc_msgSend(MEMORY[0x24BDF6F90], "performWithoutAnimation:", v11);
  if (objc_msgSend(MEMORY[0x24BDF6F90], "areAnimationsEnabled"))
  {
    objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:completion:", v9, v10, a1);
  }
  else
  {
    if (v9)
      v9[2](v9);
    if (v10)
      v10[2](v10, 1);
  }

}

- (void)naui_performAnimateableConstraintChanges:()NAUIAdditions
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void (**v13)(void);
  _QWORD v14[5];

  v12 = a3;
  objc_getAssociatedObject(a1, a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  if (!v6)
  {
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __66__UIView_NAUIAdditions__naui_performAnimateableConstraintChanges___block_invoke;
    v14[3] = &unk_24D6128A8;
    v14[4] = a1;
    objc_msgSend(MEMORY[0x24BDF6F90], "performWithoutAnimation:", v14);
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v6 + 1, v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, a2, v7, (void *)1);

  v13[2]();
  objc_getAssociatedObject(a1, a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");

  v10 = v9 - 1;
  if (v9 == 1)
  {
    objc_msgSend(a1, "layoutIfNeeded", v10);
    objc_setAssociatedObject(a1, a2, 0, (void *)1);
  }
  else
  {
    if (v9 <= 0)
      -[UIView(NAUIAdditions) naui_performAnimateableConstraintChanges:].cold.1();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(a1, a2, v11, (void *)1);

  }
}

- (void)naui_addAutoLayoutSubview:()NAUIAdditions
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(a1, "addSubview:", v4);

}

- (void)naui_addAutoLayoutSubviews:()NAUIAdditions
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(a1, "naui_addAutoLayoutSubview:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (uint64_t)naui_isProperDescendantOfView:()NAUIAdditions
{
  if (a3 == a1)
    return 0;
  else
    return objc_msgSend(a1, "isDescendantOfView:");
}

+ (void)naui_prepareToAutolayoutProperDescendantsOfView:()NAUIAdditions inConstraints:
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(MEMORY[0x24BE1A2C8], "naui_viewsInConstraints:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v11, "naui_isProperDescendantOfView:", v5))
          objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (void)naui_reloadDynamicFontWithTextStyleDescriptor:()NAUIAdditions
{
  void *v4;
  id v5;

  v5 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    +[NAUITextStyleDescriptor fontWithTextStyleDescriptor:](NAUITextStyleDescriptor, "fontWithTextStyleDescriptor:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setFont:", v4);

  }
}

- (void)naui_removeConstraint:()NAUIAdditions
{
  if (a3)
    return (void *)objc_msgSend(a1, "removeConstraint:");
  return a1;
}

- (void)naui_removeConstraints:()NAUIAdditions
{
  if (a3)
    return (void *)objc_msgSend(a1, "removeConstraints:");
  return a1;
}

- (void)naui_addConstraint:()NAUIAdditions
{
  if (a3)
    return (void *)objc_msgSend(a1, "addConstraint:");
  return a1;
}

- (void)naui_addConstraints:()NAUIAdditions
{
  if (a3)
    return (void *)objc_msgSend(a1, "addConstraints:");
  return a1;
}

- (uint64_t)naui_replaceConstraint:()NAUIAdditions withConstraints:
{
  id v6;
  id v7;
  int v8;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "naui_isEqualToConstraint:", v7);
  if ((v8 & 1) == 0)
  {
    objc_msgSend(a1, "naui_removeConstraint:", v6);
    objc_msgSend(a1, "naui_addConstraint:", v7);
  }

  return v8 ^ 1u;
}

- (uint64_t)naui_replaceConstraints:()NAUIAdditions withConstraints:
{
  id v6;
  id v7;
  int v8;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(MEMORY[0x24BE1A2C8], "naui_areConstraints:equalToConstraints:", v6, v7);
  if ((v8 & 1) == 0)
  {
    objc_msgSend(a1, "naui_removeConstraints:", v6);
    objc_msgSend(a1, "naui_addConstraints:", v7);
  }

  return v8 ^ 1u;
}

- (id)_naui_constraintsByNameDictionary:()NAUIAdditions
{
  void *v5;
  BOOL v6;

  objc_getAssociatedObject(a1, "_naui_constraintsByNameStorageKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = 1;
  else
    v6 = a3 == 0;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(a1, "_naui_constraintsByNameStorageKey", v5, (void *)0x301);
  }
  return v5;
}

- (id)_naui_constraintsNamed:()NAUIAdditions
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "_naui_constraintsByNameDictionary:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)naui_setNamedConstraints:()NAUIAdditions forName:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if (v11)
  {
    objc_msgSend(a1, "_naui_constraintsNamed:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      objc_msgSend(a1, "naui_removeConstraintsNamed:", v6);
    objc_msgSend(a1, "_naui_constraintsByNameDictionary:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraints");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v11, "constraints");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "addConstraints:", v10);

    }
    objc_msgSend(v8, "setObject:forKey:", v11, v6);

  }
  else
  {
    objc_msgSend(a1, "naui_removeConstraintsNamed:", v6);
  }

}

- (void)naui_removeConstraintsNamed:()NAUIAdditions
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(a1, "_naui_constraintsNamed:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "constraints");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v5, "constraints");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "removeConstraints:", v7);

    }
    objc_msgSend(a1, "_naui_constraintsByNameDictionary:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObjectForKey:", v9);

  }
}

- (void)naui_removeNamedConstraints
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "_naui_constraintsByNameDictionary:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(a1, "naui_removeConstraintsNamed:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)naui_performAnimateableConstraintChanges:()NAUIAdditions .cold.1()
{
  __assert_rtn("-[UIView(NAUIAdditions) naui_performAnimateableConstraintChanges:]", "UIView+NAUIAdditions.m", 138, "nestedCount >= 0");
}

@end
