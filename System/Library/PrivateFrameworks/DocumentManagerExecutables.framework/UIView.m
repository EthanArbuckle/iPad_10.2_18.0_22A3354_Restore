@implementation UIView

- (void)doc_didMoveToSuperview
{
  void *v3;
  void *v4;
  void *v5;

  -[UIView doc_didMoveToSuperview](self, "doc_didMoveToSuperview");
  -[UIView _appearance](self, "_appearance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[UIView effectiveAppearance](self, "effectiveAppearance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = v4;
      -[UIView _notifyAppearanceChange:](self, "_notifyAppearanceChange:", v4);
      v4 = v5;
    }

  }
}

void __60__UIView_DOCAppearanceInheritance___notifyAppearanceChange___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "subviews", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(v7, "_appearance");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v8)
          objc_msgSend(v7, "_notifyAppearanceChange:", *(_QWORD *)(a1 + 40));
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

  objc_msgSend(*(id *)(a1 + 32), "effectiveAppearanceDidChange:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_owningViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "effectiveAppearanceDidChange:", *(_QWORD *)(a1 + 40));

}

- (DOCAppearance)effectiveAppearance
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[UIView _appearance](self, "_appearance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[UIView _inheritedAppearance](self, "_inheritedAppearance");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (DOCAppearance *)v6;
}

- (id)_inheritedAppearance
{
  void *v2;
  void *v3;
  void *v4;

  -[UIView superview](self, "superview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    do
    {
      v3 = v2;
      objc_msgSend(v2, "_appearance");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "superview");
      v2 = (void *)objc_claimAutoreleasedReturnValue();

    }
    while (v2 && !v4);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_appearance
{
  void *v2;
  void *v3;

  -[UIView _owningViewController](self, "_owningViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_appearance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_owningViewController
{
  return (id)objc_msgSend(MEMORY[0x24BEBDB08], "viewControllerForView:", self);
}

- (void)_notifyAppearanceChange:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BEBDB00];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __60__UIView_DOCAppearanceInheritance___notifyAppearanceChange___block_invoke;
  v7[3] = &unk_24E327A10;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performWithoutAnimation:", v7);

}

- (int64_t)enclosingTabSwitcherStyle
{
  return (int64_t)sub_21EA8FC34(self, (uint64_t)a2, (SEL *)&selRef_enclosingTabSwitcherStyle);
}

- (int64_t)enclosingDocumentLandingMode
{
  return (int64_t)sub_21EA8FC34(self, (uint64_t)a2, (SEL *)&selRef_enclosingDocumentLandingMode);
}

- (BOOL)enclosedInUIPDocumentLanding
{
  UIView *v2;
  char v3;

  v2 = self;
  v3 = sub_21EA8FAFC(&qword_2540A6EF0);

  return v3 & 1;
}

- (double)enclosingUIPHorizontalInset
{
  id v1;
  id v2;
  double v3;
  double v4;

  v1 = a1;
  v2 = objc_msgSend(v1, sel_traitCollection);
  objc_msgSend(v2, sel_enclosingUIPHorizontalInset);
  v4 = v3;

  return v4;
}

- (void)doc_configureWithStandardPlatterWithCornerRadius:(double)a3
{
  void *v5;
  id v6;
  UIView *v7;

  v5 = (void *)objc_opt_self();
  v7 = self;
  v6 = objc_msgSend(v5, sel_secondarySystemBackgroundColor);
  -[UIView setBackgroundColor:](v7, sel_setBackgroundColor_, v6);

  if (a3 > 0.0)
    -[UIView _setCornerRadius:](v7, sel__setCornerRadius_, a3);

}

- (void)doc_configureWithNoPlatter
{
  void *v3;
  UIView *v4;
  id v5;

  v3 = (void *)objc_opt_self();
  v4 = self;
  v5 = objc_msgSend(v3, sel_clearColor);
  -[UIView setBackgroundColor:](v4, sel_setBackgroundColor_, v5);

}

- (void)registerForTabSwitcherTraitChangesWithHandler:(id)a3
{
  uint64_t ObjectType;
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  UIView *v9;

  ObjectType = swift_getObjectType();
  v6 = _Block_copy(a3);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = sub_21EAA9EFC;
  v8[3] = v7;
  v8[4] = ObjectType;
  v9 = self;
  sub_21EB01F10();
  UIView.registerForUIPTraitChanges<A>(tabStyle:documentLanding:options:_:)(1, 0, 0, 1, (uint64_t)sub_21EA5EA84, (uint64_t)v8, ObjectType);

  swift_release();
  swift_unknownObjectRelease();
  swift_release();
}

- (void)registerForUIPDocumentLandingTraitChangesWithHandler:(id)a3
{
  uint64_t ObjectType;
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  UIView *v9;

  ObjectType = swift_getObjectType();
  v6 = _Block_copy(a3);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = sub_21EAA9EF0;
  v8[3] = v7;
  v8[4] = ObjectType;
  v9 = self;
  sub_21EB01F10();
  UIView.registerForUIPTraitChanges<A>(tabStyle:documentLanding:options:_:)(0, 1, 0, 1, (uint64_t)sub_21EA5EA84, (uint64_t)v8, ObjectType);

  swift_release();
  swift_unknownObjectRelease();
  swift_release();
}

- (BOOL)doc_inWindowPerformingSnapshotting
{
  UIView *v2;
  UIWindow *v3;
  UIWindow *v4;
  UIView *v5;

  v2 = self;
  v3 = -[UIView window](v2, sel_window);
  v4 = v3;
  if (v3)
  {
    v5 = -[UIWindow windowScene](v3, sel_windowScene);

    if (v5)
    {
      LOBYTE(v4) = -[UIView _isPerformingSystemSnapshot](v5, sel__isPerformingSystemSnapshot);

      v2 = v5;
    }
    else
    {
      LOBYTE(v4) = 0;
    }
  }

  return (char)v4;
}

+ (void)doc_performAllowingAnimations:(BOOL)a3 block:(id)a4
{
  void *v5;

  v5 = _Block_copy(a4);
  sub_21EAAFF0C(a3, (uint64_t)v5);
  _Block_release(v5);
}

+ (BOOL)swift_docVibrancyFeatureEnabled
{
  return 0;
}

- (UIView)swift_asSecondaryStrokeViewDecoratorEmbeddable
{
  return (UIView *)0;
}

- (UIView)swift_asPrimaryStrokeViewDecoratorEmbeddable
{
  return (UIView *)0;
}

- (BOOL)isVibrantContainer
{
  return 0;
}

@end
