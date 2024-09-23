@implementation DOCKeyboardFocusManager

- (BOOL)requestCurrentFocus:(id)a3
{
  id v4;
  void *v5;
  char v6;
  BOOL v7;

  v4 = a3;
  +[DOCKeyboardFocusManager sharedManager](DOCKeyboardFocusManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "externalFirstResponderInFlight");

  if ((v6 & 1) == 0
    && (-[DOCKeyboardFocusManager registerKeyboardFocusable:](self, "registerKeyboardFocusable:", v4),
        objc_msgSend(v4, "acceptsKeyboardFocus"))
    && objc_msgSend(v4, "becomeKeyboardFocused"))
  {
    objc_storeWeak((id *)&self->_currentlyFocused, v4);
    v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (DOCKeyboardFocusManager)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__DOCKeyboardFocusManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, block);
  return (DOCKeyboardFocusManager *)(id)sharedManager__sharedInstance;
}

- (void)registerKeyboardFocusable:(id)a3
{
  id v4;

  v4 = a3;
  if (!-[NSPointerArray doc_containsPointer:](self->_allKeyboardFocusable, "doc_containsPointer:"))
    -[NSPointerArray addPointer:](self->_allKeyboardFocusable, "addPointer:", v4);

}

- (BOOL)externalFirstResponderInFlight
{
  return self->_externalFirstResponderInFlight;
}

void __40__DOCKeyboardFocusManager_sharedManager__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedManager__sharedInstance;
  sharedManager__sharedInstance = v0;

}

- (DOCKeyboardFocusManager)init
{
  DOCKeyboardFocusManager *v2;
  uint64_t v3;
  NSPointerArray *allKeyboardFocusable;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DOCKeyboardFocusManager;
  v2 = -[DOCKeyboardFocusManager init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1748], "weakObjectsPointerArray");
    v3 = objc_claimAutoreleasedReturnValue();
    allKeyboardFocusable = v2->_allKeyboardFocusable;
    v2->_allKeyboardFocusable = (NSPointerArray *)v3;

  }
  return v2;
}

+ (id)allDirectionalKeyCommandsWithAction:(SEL)a3 prioritize:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "directionalKeyCommandsWithAction:prioritize:", a3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v7);

  objc_msgSend((id)objc_opt_class(), "selectionKeyCommandsWithAction:prioritize:", a3, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v8);

  objc_msgSend((id)objc_opt_class(), "systemProvidedSelectionKeyCommandsWithAction:prioritize:", a3, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v9);

  objc_msgSend((id)objc_opt_class(), "systemProvidedDirectionalKeyCommandsWithAction:prioritize:", a3, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v10);

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)directionalKeyCommandsWithAction:(SEL)a3 prioritize:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v4 = a4;
  v10[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEBD6B8], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x24BEBE3F8], 0x80000, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  objc_msgSend(MEMORY[0x24BEBD6B8], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x24BEBE3D8], 0x80000, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    objc_msgSend((id)objc_opt_class(), "_applySystemOverridePriority:", v8);
  return v8;
}

+ (id)systemProvidedDirectionalKeyCommandsWithAction:(SEL)a3 prioritize:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];

  v4 = a4;
  v12[4] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEBD6B8], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x24BEBE3F8], 0, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  objc_msgSend(MEMORY[0x24BEBD6B8], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x24BEBE3D8], 0, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  objc_msgSend(MEMORY[0x24BEBD6B8], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x24BEBE3E8], 0, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v8;
  objc_msgSend(MEMORY[0x24BEBD6B8], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x24BEBE3F0], 0, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    objc_msgSend((id)objc_opt_class(), "_applySystemOverridePriority:", v10);
  return v10;
}

+ (id)selectionKeyCommandsWithAction:(SEL)a3 prioritize:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];

  v4 = a4;
  v12[4] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEBD6B8], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x24BEBE3F8], 655360, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  objc_msgSend(MEMORY[0x24BEBD6B8], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x24BEBE3D8], 655360, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  objc_msgSend(MEMORY[0x24BEBD6B8], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x24BEBE3E8], 655360, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v8;
  objc_msgSend(MEMORY[0x24BEBD6B8], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x24BEBE3F0], 655360, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    objc_msgSend((id)objc_opt_class(), "_applySystemOverridePriority:", v10);
  return v10;
}

+ (id)systemProvidedSelectionKeyCommandsWithAction:(SEL)a3 prioritize:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];

  v4 = a4;
  v12[4] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEBD6B8], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x24BEBE3F8], 0x20000, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  objc_msgSend(MEMORY[0x24BEBD6B8], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x24BEBE3D8], 0x20000, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  objc_msgSend(MEMORY[0x24BEBD6B8], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x24BEBE3E8], 0x20000, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v8;
  objc_msgSend(MEMORY[0x24BEBD6B8], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x24BEBE3F0], 0x20000, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    objc_msgSend((id)objc_opt_class(), "_applySystemOverridePriority:", v10);
  return v10;
}

+ (void)_applySystemOverridePriority:(id)a3
{
  id v3;
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

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
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
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "setWantsPriorityOverSystemBehavior:", 1);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)unregisterKeyboardFocusable:(id)a3
{
  NSPointerArray *allKeyboardFocusable;
  id v5;
  uint64_t v6;
  DOCKeyboardFocusable **p_currentlyFocused;
  id WeakRetained;

  allKeyboardFocusable = self->_allKeyboardFocusable;
  v5 = a3;
  v6 = -[NSPointerArray doc_indexOfPointer:](allKeyboardFocusable, "doc_indexOfPointer:", v5);
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[NSPointerArray removePointerAtIndex:](self->_allKeyboardFocusable, "removePointerAtIndex:", v6);
    -[NSPointerArray compact](self->_allKeyboardFocusable, "compact");
  }
  p_currentlyFocused = &self->_currentlyFocused;
  WeakRetained = objc_loadWeakRetained((id *)p_currentlyFocused);

  if (WeakRetained == v5)
    objc_storeWeak((id *)p_currentlyFocused, 0);
}

- (id)currentlyFocused
{
  return objc_loadWeakRetained((id *)&self->_currentlyFocused);
}

- (BOOL)restoreCurrentlyFocused
{
  DOCKeyboardFocusable **p_currentlyFocused;
  id WeakRetained;
  id v5;
  BOOL v6;

  p_currentlyFocused = &self->_currentlyFocused;
  WeakRetained = objc_loadWeakRetained((id *)&self->_currentlyFocused);

  if (!WeakRetained)
    return 0;
  v5 = objc_loadWeakRetained((id *)p_currentlyFocused);
  v6 = -[DOCKeyboardFocusManager requestCurrentFocus:](self, "requestCurrentFocus:", v5);

  return v6;
}

- (id)adjacentFocusableToFocusable:(id)a3 direction:(int64_t)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  unint64_t v12;
  double v13;
  double v14;
  double v15;
  id v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
  double v30;
  double *v31;
  double v32;
  id v34;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  double MidY;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  double MidX;
  _OWORD v45[4];
  uint64_t v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;

  v46 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(v6, "absoluteFrame");
  v38 = v8;
  v39 = v7;
  v36 = v10;
  v37 = v9;
  v45[0] = xmmword_209085380;
  v45[1] = xmmword_209085390;
  v45[2] = xmmword_2090853A0;
  v45[3] = xmmword_2090853B0;
  v11 = 0;
  if (-[NSPointerArray count](self->_allKeyboardFocusable, "count"))
  {
    v12 = 0;
    v14 = *MEMORY[0x24BDBEFB0];
    v13 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
    v15 = 1.79769313e308;
    do
    {
      -[NSPointerArray pointerAtIndex:](self->_allKeyboardFocusable, "pointerAtIndex:", v12);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v16 == v6
        || !objc_msgSend(v16, "acceptsKeyboardFocus")
        || !objc_msgSend(v17, "isInKeyWindow"))
      {
        goto LABEL_14;
      }
      objc_msgSend(v17, "absoluteFrame");
      v42 = v19;
      v43 = v18;
      v41 = v20;
      v22 = v21;
      v47.origin.x = v39;
      v47.origin.y = v38;
      v47.size.width = v37;
      v47.size.height = v36;
      MidX = CGRectGetMidX(v47);
      v48.origin.x = v39;
      v48.origin.y = v38;
      v48.size.width = v37;
      v48.size.height = v36;
      MidY = CGRectGetMidY(v48);
      v49.origin.x = v43;
      v49.origin.y = v42;
      v49.size.width = v41;
      v49.size.height = v22;
      v23 = CGRectGetMidX(v49);
      v50.origin.x = v43;
      v50.origin.y = v42;
      v50.size.width = v41;
      v50.size.height = v22;
      v24 = CGRectGetMidY(v50);
      v25 = 0;
      v26 = v23 - MidX;
      v27 = v24 - MidY;
      v28 = sqrt((v13 - v27) * (v13 - v27) + (v14 - (v23 - MidX)) * (v14 - (v23 - MidX)));
      v29 = 0x7FFFFFFFFFFFFFFFLL;
      v30 = 2.22507386e-308;
      v31 = (double *)v45 + 1;
      do
      {
        v32 = (v27 * *v31 + v26 * *(v31 - 1))
            / v28
            / sqrt((v13 - *v31) * (v13 - *v31) + (v14 - *(v31 - 1)) * (v14 - *(v31 - 1)));
        if (v32 > v30)
        {
          v30 = v32;
          v29 = v25;
        }
        ++v25;
        v31 += 2;
      }
      while (v25 != 4);
      if (v29 == a4 && v28 < v15)
      {
        v34 = v17;

        v11 = v34;
      }
      else
      {
LABEL_14:
        v28 = v15;
      }

      ++v12;
      v15 = v28;
    }
    while (v12 < -[NSPointerArray count](self->_allKeyboardFocusable, "count"));
  }

  return v11;
}

- (void)_printAllRegisteredFocusable
{
  unint64_t v3;
  void *v4;
  void *v5;
  CGRect v6;

  if (-[NSPointerArray count](self->_allKeyboardFocusable, "count"))
  {
    v3 = 0;
    do
    {
      -[NSPointerArray pointerAtIndex:](self->_allKeyboardFocusable, "pointerAtIndex:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "absoluteFrame");
      NSStringFromCGRect(v6);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR(" *** focusable entity: %@ at: %@"), v4, v5);

      ++v3;
    }
    while (v3 < -[NSPointerArray count](self->_allKeyboardFocusable, "count"));
  }
}

- (BOOL)_isRegistered:(id)a3
{
  return -[NSPointerArray doc_indexOfPointer:](self->_allKeyboardFocusable, "doc_indexOfPointer:", a3) != 0x7FFFFFFFFFFFFFFFLL;
}

- (void)setExternalFirstResponderInFlight:(BOOL)a3
{
  self->_externalFirstResponderInFlight = a3;
}

- (NSPointerArray)allKeyboardFocusable
{
  return (NSPointerArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAllKeyboardFocusable:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allKeyboardFocusable, 0);
  objc_destroyWeak((id *)&self->_currentlyFocused);
}

@end
