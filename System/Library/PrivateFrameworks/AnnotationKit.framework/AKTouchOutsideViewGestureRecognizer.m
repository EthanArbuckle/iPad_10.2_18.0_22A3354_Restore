@implementation AKTouchOutsideViewGestureRecognizer

- (AKTouchOutsideViewGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4 watchView:(id)a5
{
  id v8;
  id v9;
  AKTouchOutsideViewGestureRecognizer *v10;
  AKTouchOutsideViewGestureRecognizer *v11;
  NSMutableSet *v12;
  NSMutableSet *mTargets;
  objc_super v15;

  v8 = a3;
  v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AKTouchOutsideViewGestureRecognizer;
  v10 = -[AKTouchOutsideViewGestureRecognizer initWithTarget:action:](&v15, sel_initWithTarget_action_, 0, 0);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->mWatchView, v9);
    v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    mTargets = v11->mTargets;
    v11->mTargets = v12;

    -[AKTouchOutsideViewGestureRecognizer setDelegate:](v11, "setDelegate:", v11);
    -[AKTouchOutsideViewGestureRecognizer addTarget:action:](v11, "addTarget:action:", v8, a4);
  }

  return v11;
}

- (void)dealloc
{
  NSMutableSet *mTargets;
  objc_super v4;

  mTargets = self->mTargets;
  self->mTargets = 0;

  objc_storeWeak((id *)&self->mWatchView, 0);
  v4.receiver = self;
  v4.super_class = (Class)AKTouchOutsideViewGestureRecognizer;
  -[AKTouchOutsideViewGestureRecognizer dealloc](&v4, sel_dealloc);
}

- (void)addTarget:(id)a3 action:(SEL)a4
{
  id v6;
  AKTouchOutsideViewGestureRecognizerTarget *v7;

  v6 = a3;
  v7 = objc_alloc_init(AKTouchOutsideViewGestureRecognizerTarget);
  -[AKTouchOutsideViewGestureRecognizerTarget setTarget:](v7, "setTarget:", v6);

  -[AKTouchOutsideViewGestureRecognizerTarget setAction:](v7, "setAction:", a4);
  -[NSMutableSet addObject:](self->mTargets, "addObject:", v7);

}

- (void)removeTarget:(id)a3 action:(SEL)a4
{
  id v6;
  NSMutableSet *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v7 = self->mTargets;
  v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v25;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v11);
        if (!v6
          || (objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v11), "target"),
              v13 = (id)objc_claimAutoreleasedReturnValue(),
              v13,
              v13 == v6))
        {
          if (!a4 || (SEL)objc_msgSend(v12, "action") == a4)
            objc_msgSend(v19, "addObject:", v12);
        }
        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v9);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v14 = v19;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v21;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v21 != v17)
          objc_enumerationMutation(v14);
        -[NSMutableSet removeObject:](self->mTargets, "removeObject:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v18++));
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v16);
  }

}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t i;
  CGFloat v24;
  CGFloat v25;
  int v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  uint64_t j;
  NSMutableSet *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t k;
  void *v38;
  void *v39;
  uint64_t v40;
  char v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;
  CGPoint v59;
  CGRect v60;

  v58 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[AKTouchOutsideViewGestureRecognizer watchView](self, "watchView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "bounds");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v18 = v6;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
    if (v19)
    {
      v20 = v19;
      v21 = 0;
      v22 = *(_QWORD *)v52;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v52 != v22)
            objc_enumerationMutation(v18);
          objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * i), "locationInView:", v9);
          v59.x = v24;
          v59.y = v25;
          v60.origin.x = v11;
          v60.origin.y = v13;
          v60.size.width = v15;
          v60.size.height = v17;
          if (CGRectContainsPoint(v60, v59))
            v21 = 1;
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
      }
      while (v20);
      v26 = v21 & 1;
    }
    else
    {
      v26 = 0;
    }

  }
  else
  {
    v26 = 0;
  }
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  objc_msgSend(v7, "allTouches");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
  if (v28)
  {
    v29 = v28;
    v30 = 0;
    v31 = *(_QWORD *)v48;
    do
    {
      for (j = 0; j != v29; ++j)
      {
        if (*(_QWORD *)v48 != v31)
          objc_enumerationMutation(v27);
        v30 |= objc_msgSend(v6, "containsObject:", *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * j)) ^ 1;
      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
    }
    while (v29);
  }
  else
  {
    v30 = 0;
  }

  if (((v26 | v30) & 1) == 0)
  {
    v41 = v26;
    v42 = v7;
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v33 = self->mTargets;
    v34 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v44;
      do
      {
        for (k = 0; k != v35; ++k)
        {
          if (*(_QWORD *)v44 != v36)
            objc_enumerationMutation(v33);
          v38 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * k);
          objc_msgSend(v38, "target");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "performSelector:withObject:", objc_msgSend(v38, "action"), self);

        }
        v35 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
      }
      while (v35);
    }

    v7 = v42;
    LOBYTE(v26) = v41;
  }
  if (v26 & 1 | ((v30 & 1) == 0))
    v40 = 5;
  else
    v40 = 1;
  -[AKTouchOutsideViewGestureRecognizer setState:](self, "setState:", v40);

}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 0;
}

- (UIView)watchView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->mWatchView);
}

- (void)setWatchView:(id)a3
{
  objc_storeWeak((id *)&self->mWatchView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->mWatchView);
  objc_storeStrong((id *)&self->mTargets, 0);
}

@end
