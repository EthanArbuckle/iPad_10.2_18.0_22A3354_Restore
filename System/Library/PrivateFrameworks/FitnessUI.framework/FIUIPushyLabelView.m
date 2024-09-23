@implementation FIUIPushyLabelView

- (FIUIPushyLabelView)initWithFrame:(CGRect)a3
{
  FIUIPushyLabelView *v3;
  FIUIPushyLabelView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FIUIPushyLabelView;
  v3 = -[FIUIPushyLabelView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[FIUIPushyLabelView setClipsToBounds:](v3, "setClipsToBounds:", 1);
    -[FIUIPushyLabelView setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", 0);
  }
  return v4;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  NSArray **p_incomingSnapshotCharacters;
  double *v5;
  NSArray *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;
  CGSize result;

  v26 = *MEMORY[0x24BDAC8D0];
  p_incomingSnapshotCharacters = &self->_incomingSnapshotCharacters;
  if (!-[NSArray count](self->_incomingSnapshotCharacters, "count", a3.width, a3.height))
    p_incomingSnapshotCharacters = &self->_currentSnapshotCharacters;
  v5 = (double *)MEMORY[0x24BDBF148];
  v6 = *p_incomingSnapshotCharacters;
  if (-[NSArray count](v6, "count"))
  {
    -[NSArray firstObject](v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "renderedView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "frame");
    v10 = v9;

  }
  else
  {
    v10 = v5[1];
  }
  v11 = *v5;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v12 = v6;
  v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v22;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v16), "renderedView", (_QWORD)v21);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "frame");
        v11 = v11 + v18;

        ++v16;
      }
      while (v14 != v16);
      v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v14);
  }

  v19 = v11;
  v20 = v10;
  result.height = v20;
  result.width = v19;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  double v12;
  double v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  uint64_t i;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];
  uint64_t v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v27 = *MEMORY[0x24BDAC8D0];
  -[FIUIPushyLabelView frame](self, "frame");
  v31.origin.x = v8;
  v31.origin.y = v9;
  v31.size.width = v10;
  v31.size.height = v11;
  v28.origin.x = x;
  v28.origin.y = y;
  v28.size.width = width;
  v28.size.height = height;
  if (!CGRectEqualToRect(v28, v31))
  {
    -[FIUIPushyLabelView frame](self, "frame");
    v13 = v12;
    v25.receiver = self;
    v25.super_class = (Class)FIUIPushyLabelView;
    -[FIUIPushyLabelView setFrame:](&v25, sel_setFrame_, x, y, width, height);
    if (width != v13)
    {
      if (-[FIUIPushyLabelView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
      {
        v23 = 0u;
        v24 = 0u;
        v21 = 0u;
        v22 = 0u;
        -[FIUIPushyLabelView subviews](self, "subviews", 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v22;
          v18 = width - v13;
          do
          {
            for (i = 0; i != v16; ++i)
            {
              if (*(_QWORD *)v22 != v17)
                objc_enumerationMutation(v14);
              v20 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
              objc_msgSend(v20, "frame");
              v30 = CGRectOffset(v29, v18, 0.0);
              objc_msgSend(v20, "setFrame:", v30.origin.x, v30.origin.y, v30.size.width, v30.size.height);
            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
          }
          while (v16);
        }

      }
    }
  }
}

- (void)sizeToFitAttributedText:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  v4 = a3;
  -[FIUIPushyLabelView frame](self, "frame");
  v6 = v5;
  v8 = v7;
  objc_msgSend(v4, "size");
  v10 = v9;
  v12 = v11;

  -[FIUIPushyLabelView setFrame:](self, "setFrame:", v6, v8, v10, v12);
}

- (void)setAttributedTextUnanimated:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "isEqualToAttributedString:", self->_currentAttributedText) & 1) == 0)
  {
    -[FIUIPushyLabelView _snapshotCharactersFromAttributedText:perCharacter:](self, "_snapshotCharactersFromAttributedText:perCharacter:", v6, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[FIUIPushyLabelView _setIncomingSnapshotCharacters:](self, "_setIncomingSnapshotCharacters:", v5);
    -[FIUIPushyLabelView _layoutViewsAtIndex:forPushEndWithDirection:](self, "_layoutViewsAtIndex:forPushEndWithDirection:", 0, 0);
    -[FIUIPushyLabelView _swapCurrentSnapshotCharacters:forIncomingCharacters:](self, "_swapCurrentSnapshotCharacters:forIncomingCharacters:", self->_currentSnapshotCharacters, v5);
    objc_storeStrong((id *)&self->_currentAttributedText, a3);

  }
}

- (void)pushToAttributedText:(id)a3 direction:(unint64_t)a4 perCharacter:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  _BOOL8 v10;
  double Current;
  double v12;
  void *v13;
  NSArray *v14;
  void *v15;
  double currentAnimationFinishTime;
  double v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  double v25;
  FIUIPushyLabelView *v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  void *v35;
  uint64_t v36;
  NSAttributedString **p_currentAttributedText;
  id obj;
  id v39;
  NSArray *v40;
  _QWORD v41[4];
  NSArray *v42;
  id v43;
  FIUIPushyLabelView *v44;
  unint64_t v45;
  double v46;
  _QWORD v47[8];

  v5 = a5;
  v9 = a3;
  if ((objc_msgSend(v9, "isEqualToAttributedString:", self->_currentAttributedText) & 1) == 0)
  {
    v10 = v5 & ~-[FIUIPushyLabelView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
    Current = CFAbsoluteTimeGetCurrent();
    if (self->_currentAnimationFinishTime - Current >= 0.0)
      v12 = self->_currentAnimationFinishTime - Current;
    else
      v12 = 0.0;
    if (v12 <= 0.0)
    {
      p_currentAttributedText = &self->_currentAttributedText;
      obj = a3;
      v14 = self->_currentSnapshotCharacters;
      v39 = v9;
      -[FIUIPushyLabelView _snapshotCharactersFromAttributedText:perCharacter:](self, "_snapshotCharactersFromAttributedText:perCharacter:", v9, v10);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[FIUIPushyLabelView _setIncomingSnapshotCharacters:](self, "_setIncomingSnapshotCharacters:", v15);
      -[FIUIPushyLabelView _layoutForPushStartWithDirection:](self, "_layoutForPushStartWithDirection:", a4);
      currentAnimationFinishTime = self->_currentAnimationFinishTime;
      if (v10)
        v17 = 0.06;
      else
        v17 = 0.0;
      v18 = -[NSArray count](v14, "count", 464);
      v19 = objc_msgSend(v15, "count");
      if (v18 <= v19)
        v20 = v19;
      else
        v20 = v18;
      if (v20)
      {
        v21 = 0;
        v22 = 0;
        v23 = 0x24BEBD000uLL;
        v24 = MEMORY[0x24BDAC760];
        v40 = v14;
        do
        {
          v25 = 0.75;
          if (v21 < -[NSArray count](v14, "count") && v21 < objc_msgSend(v15, "count"))
          {
            -[NSArray objectAtIndexedSubscript:](v14, "objectAtIndexedSubscript:", v21);
            v26 = self;
            v27 = v20;
            v28 = v23;
            v29 = a4;
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "sourceText");
            v31 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v15, "objectAtIndexedSubscript:", v21);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "sourceText");
            v33 = (void *)objc_claimAutoreleasedReturnValue();

            a4 = v29;
            v23 = v28;
            v20 = v27;
            self = v26;
            v14 = v40;
            if (objc_msgSend(v31, "isEqualToAttributedString:", v33))
              v25 = 0.0;
            else
              v25 = 0.75;

            v24 = MEMORY[0x24BDAC760];
          }
          v34 = v12 + v17 * (double)v22;
          v35 = *(void **)(v23 + 2816);
          v47[0] = v24;
          if (currentAnimationFinishTime < v34 + Current + v25)
            currentAnimationFinishTime = v34 + Current + v25;
          v47[1] = 3221225472;
          v47[2] = __66__FIUIPushyLabelView_pushToAttributedText_direction_perCharacter___block_invoke;
          v47[3] = &unk_24CF30CD8;
          v47[4] = self;
          v47[5] = v21;
          v47[6] = a4;
          v41[0] = v24;
          v41[1] = 3221225472;
          v41[2] = __66__FIUIPushyLabelView_pushToAttributedText_direction_perCharacter___block_invoke_2;
          v41[3] = &unk_24CF30D00;
          v42 = v14;
          v45 = v21;
          v43 = v15;
          v44 = self;
          v46 = v17;
          objc_msgSend(v35, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0x10000, v47, v41, v25, v12 + v17 * (double)v22, 0.6, -5.0);
          if (v25 > 2.22044605e-16)
            ++v22;

          ++v21;
        }
        while (v20 != v21);
      }
      *(double *)((char *)&self->super.super.super.isa + v36) = v17 + currentAnimationFinishTime;
      objc_storeStrong((id *)p_currentAttributedText, obj);

      v9 = v39;
    }
    else
    {
      v13 = v9;
      if (!v9)
      {
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_storeStrong(&self->_pendingAttributedString, v13);
      if (!v9)

      self->_pendingDirection = a4;
      self->_pendingPushPerCharacter = v10;
    }
  }

}

uint64_t __66__FIUIPushyLabelView_pushToAttributedText_direction_perCharacter___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_layoutViewsAtIndex:forPushEndWithDirection:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __66__FIUIPushyLabelView_pushToAttributedText_direction_perCharacter___block_invoke_2(uint64_t a1, char a2)
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if ((a2 & 1) != 0)
  {
    v3 = *(_QWORD *)(a1 + 56);
    if (v3 == objc_msgSend(*(id *)(a1 + 40), "count") - 1 || !objc_msgSend(*(id *)(a1 + 40), "count"))
    {
      objc_msgSend(*(id *)(a1 + 48), "_swapCurrentSnapshotCharacters:forIncomingCharacters:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
      objc_msgSend(*(id *)(a1 + 48), "performSelector:withObject:afterDelay:", sel__processPendingStringIfNeeded, 0, *(double *)(a1 + 64));
    }
  }
  else
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v4 = *(id *)(a1 + 32);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8), "renderedView", (_QWORD)v10);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "removeFromSuperview");

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }

  }
}

- (void)_processPendingStringIfNeeded
{
  id pendingAttributedString;
  void *v4;
  char v5;
  unint64_t pendingDirection;
  _BOOL8 pendingPushPerCharacter;
  id v8;
  id v9;

  pendingAttributedString = self->_pendingAttributedString;
  if (pendingAttributedString)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(pendingAttributedString, "isEqual:", v4);

    if ((v5 & 1) != 0)
      v9 = 0;
    else
      v9 = self->_pendingAttributedString;
    pendingDirection = self->_pendingDirection;
    pendingPushPerCharacter = self->_pendingPushPerCharacter;
    v8 = self->_pendingAttributedString;
    self->_pendingAttributedString = 0;

    -[FIUIPushyLabelView pushToAttributedText:direction:perCharacter:](self, "pushToAttributedText:direction:perCharacter:", v9, pendingDirection, pendingPushPerCharacter);
  }
}

- (id)currentAttributedText
{
  return self->_currentAttributedText;
}

- (void)_setCurrentSnapshotCharacters:(id)a3
{
  id v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v6 = self->_currentSnapshotCharacters;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v23;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v10), "renderedView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "removeFromSuperview");

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v8);
  }

  objc_storeStrong((id *)&self->_currentSnapshotCharacters, a3);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v12 = v5;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v19;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v19 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v16), "renderedView", (_QWORD)v18);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[FIUIPushyLabelView addSubview:](self, "addSubview:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v14);
  }

}

- (void)_setIncomingSnapshotCharacters:(id)a3
{
  id v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v6 = self->_incomingSnapshotCharacters;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v23;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v10), "renderedView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "removeFromSuperview");

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v8);
  }

  objc_storeStrong((id *)&self->_incomingSnapshotCharacters, a3);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v12 = v5;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v19;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v19 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v16), "renderedView", (_QWORD)v18);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[FIUIPushyLabelView addSubview:](self, "addSubview:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v14);
  }

}

- (void)_swapCurrentSnapshotCharacters:(id)a3 forIncomingCharacters:(id)a4
{
  NSArray *v5;
  NSArray *currentSnapshotCharacters;
  NSArray *incomingSnapshotCharacters;
  NSArray *v8;

  v5 = (NSArray *)a4;
  -[FIUIPushyLabelView _setCurrentSnapshotCharacters:](self, "_setCurrentSnapshotCharacters:", 0);
  currentSnapshotCharacters = self->_currentSnapshotCharacters;
  self->_currentSnapshotCharacters = v5;
  v8 = v5;

  incomingSnapshotCharacters = self->_incomingSnapshotCharacters;
  self->_incomingSnapshotCharacters = 0;

}

- (void)_layoutForPushStartWithDirection:(unint64_t)a3
{
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double Height;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;
  CGRect v35;

  v34 = *MEMORY[0x24BDAC8D0];
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v5 = self->_currentSnapshotCharacters;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v29;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v9), "renderedView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "frame");
        objc_msgSend(v10, "setFrame:");

        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v7);
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v11 = self->_incomingSnapshotCharacters;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v25;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v25 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v15), "renderedView", (_QWORD)v24);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "frame");
        v19 = v18;
        v21 = v20;
        v22 = v17;
        if (a3)
        {
          Height = -v17;
        }
        else
        {
          -[FIUIPushyLabelView bounds](self, "bounds");
          Height = CGRectGetHeight(v35);
        }
        objc_msgSend(v16, "setFrame:", v19, Height, v21, v22);

        ++v15;
      }
      while (v13 != v15);
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v13);
  }

}

- (void)_layoutViewsAtIndex:(unint64_t)a3 forPushEndWithDirection:(unint64_t)a4
{
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double Height;
  void *v16;
  id v17;
  CGRect v18;

  if (-[NSArray count](self->_currentSnapshotCharacters, "count") > a3)
  {
    -[NSArray objectAtIndexedSubscript:](self->_currentSnapshotCharacters, "objectAtIndexedSubscript:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "renderedView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "frame");
    v11 = v10;
    v13 = v12;
    v14 = v9;
    if (a4)
    {
      -[FIUIPushyLabelView bounds](self, "bounds");
      Height = CGRectGetHeight(v18);
    }
    else
    {
      Height = -v9;
    }
    objc_msgSend(v8, "setFrame:", v11, Height, v13, v14);

  }
  if (-[NSArray count](self->_incomingSnapshotCharacters, "count") > a3)
  {
    -[NSArray objectAtIndexedSubscript:](self->_incomingSnapshotCharacters, "objectAtIndexedSubscript:", a3);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "renderedView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "frame");
    objc_msgSend(v16, "setFrame:");

  }
}

- (id)_snapshotCharactersFromAttributedText:(id)a3 perCharacter:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  double v13;
  double v14;
  double v15;
  void *v16;
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
  CGContext *CurrentContext;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  FIUIPushyLabelCharacter *v33;
  void *v35;
  CGFloat v36;
  CGFloat v37;
  double scale;
  void *v39;
  id v40;
  double v41;
  double v42;
  uint64_t v43;
  uint64_t v44;
  CGSize v45;
  CGRect v46;

  v4 = a4;
  v6 = a3;
  v40 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v6, "length"));
  if (objc_msgSend(v6, "length"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBB508]), "initWithAttributedString:", v6);
    v8 = objc_alloc_init(MEMORY[0x24BEBB488]);
    v35 = v7;
    objc_msgSend(v7, "addLayoutManager:", v8);
    v9 = objc_alloc(MEMORY[0x24BEBB4C0]);
    objc_msgSend(v6, "size");
    v10 = (void *)objc_msgSend(v9, "initWithSize:");
    objc_msgSend(v10, "setLineFragmentPadding:", 0.0);
    v39 = v10;
    objc_msgSend(v8, "addTextContainer:", v10);
    v43 = 0;
    v44 = 0;
    scale = FIUIDeviceScale();
    if (v4)
      v11 = 1;
    else
      v11 = objc_msgSend(v6, "length");
    if (objc_msgSend(v6, "length"))
    {
      v12 = 0;
      v14 = *MEMORY[0x24BDBEFB0];
      v13 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
      v41 = scale + scale;
      v15 = 0.0;
      v36 = v13;
      v37 = *MEMORY[0x24BDBEFB0];
      do
      {
        objc_msgSend(v6, "attributedSubstringFromRange:", v12, v11);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "characterRangeForGlyphRange:actualGlyphRange:", v12, v11, &v43);
        objc_msgSend(v8, "boundingRectForGlyphRange:inTextContainer:", v43, v44, v39);
        v18 = v17;
        v20 = v19;
        objc_msgSend(v16, "size");
        v23 = v21;
        v24 = v22;
        if (!v4)
        {
          v14 = -v18 / v41;
          v13 = -v20 / v41;
        }
        if (v18 < 0.0)
        {
          v23 = v21 - v18 / v41;
          v18 = 0.0;
        }
        v42 = v13;
        v25 = v14;
        if (v20 < 0.0)
        {
          v24 = v22 - v20 / v41;
          v20 = 0.0;
        }
        if (-[FIUIPushyLabelView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection")
          && !v4)
        {
          -[FIUIPushyLabelView frame](self, "frame");
          v18 = v26 - v23;
        }
        v45.width = v23;
        v45.height = v24;
        UIGraphicsBeginImageContextWithOptions(v45, 0, scale);
        CurrentContext = UIGraphicsGetCurrentContext();
        v13 = v36;
        v14 = v37;
        v46.origin.x = v37;
        v46.origin.y = v36;
        v46.size.width = v23;
        v46.size.height = v24;
        CGContextClearRect(CurrentContext, v46);
        objc_msgSend(v16, "drawAtPoint:", v25, v42);
        UIGraphicsGetImageFromCurrentImageContext();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        UIGraphicsEndImageContext();
        v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", v28);
        v30 = v29;
        if (v4)
          v31 = v15;
        else
          v31 = v18;
        v32 = -0.0;
        if (v4)
          v32 = v23;
        v15 = v15 + v32;
        objc_msgSend(v29, "setFrame:", v31, v20, v23, v24);
        v33 = objc_alloc_init(FIUIPushyLabelCharacter);
        -[FIUIPushyLabelCharacter setSourceText:](v33, "setSourceText:", v16);
        -[FIUIPushyLabelCharacter setRenderedView:](v33, "setRenderedView:", v30);
        objc_msgSend(v40, "addObject:", v33);

        v12 += v11;
      }
      while (v12 < objc_msgSend(v6, "length"));
    }

  }
  return v40;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pendingAttributedString, 0);
  objc_storeStrong((id *)&self->_currentAttributedText, 0);
  objc_storeStrong((id *)&self->_incomingSnapshotCharacters, 0);
  objc_storeStrong((id *)&self->_currentSnapshotCharacters, 0);
}

@end
