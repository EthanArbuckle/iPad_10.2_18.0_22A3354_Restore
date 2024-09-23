@implementation NUArticleKeyCommandManager

- (id)keyCommandsWithSelector:(SEL)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x24BDF79B0];
  objc_msgSend(MEMORY[0x24BDF6B10], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x24BDF79B0], 0, a3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setWantsPriorityOverSystemBehavior:", 1);
  objc_msgSend(v4, "addObject:", v17);
  objc_msgSend(MEMORY[0x24BDF6B10], "keyCommandWithInput:modifierFlags:action:", v5, 0x80000, a3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setWantsPriorityOverSystemBehavior:", 1);
  objc_msgSend(v4, "addObject:", v16);
  v6 = *MEMORY[0x24BDF7990];
  objc_msgSend(MEMORY[0x24BDF6B10], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x24BDF7990], 0, a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setWantsPriorityOverSystemBehavior:", 1);
  objc_msgSend(v4, "addObject:", v15);
  objc_msgSend(MEMORY[0x24BDF6B10], "keyCommandWithInput:modifierFlags:action:", v6, 0x80000, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWantsPriorityOverSystemBehavior:", 1);
  objc_msgSend(v4, "addObject:", v7);
  objc_msgSend(MEMORY[0x24BDF6B10], "keyCommandWithInput:modifierFlags:action:", CFSTR("UIKeyInputPageUp"), 0, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWantsPriorityOverSystemBehavior:", 1);
  objc_msgSend(v4, "addObject:", v8);
  objc_msgSend(MEMORY[0x24BDF6B10], "keyCommandWithInput:modifierFlags:action:", CFSTR("UIKeyInputPageDown"), 0, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWantsPriorityOverSystemBehavior:", 1);
  objc_msgSend(v4, "addObject:", v9);
  objc_msgSend(MEMORY[0x24BDF6B10], "keyCommandWithInput:modifierFlags:action:", CFSTR(" "), 0, a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWantsPriorityOverSystemBehavior:", 1);
  objc_msgSend(v4, "addObject:", v10);
  objc_msgSend(MEMORY[0x24BDF6B10], "keyCommandWithInput:modifierFlags:action:", CFSTR(" "), 0x20000, a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setWantsPriorityOverSystemBehavior:", 1);
  objc_msgSend(v4, "addObject:", v11);
  objc_msgSend(MEMORY[0x24BDF6B10], "keyCommandWithInput:modifierFlags:action:", v5, 0x100000, a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setWantsPriorityOverSystemBehavior:", 1);
  objc_msgSend(v4, "addObject:", v12);
  objc_msgSend(MEMORY[0x24BDF6B10], "keyCommandWithInput:modifierFlags:action:", v6, 0x100000, a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setWantsPriorityOverSystemBehavior:", 1);
  objc_msgSend(v4, "addObject:", v13);

  return v4;
}

- (void)handleKeyCommand:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "input");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "modifierFlags");

  -[NUArticleKeyCommandManager handleKey:flags:](self, "handleKey:flags:", v6, v5);
}

- (void)handleKey:(id)a3 flags:(int64_t)a4
{
  int v4;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  CGFloat v30;
  CGFloat v31;
  id v32;
  CGRect v33;
  CGRect v34;

  v4 = a4;
  v32 = a3;
  -[NUArticleKeyCommandManager setHasBeenTraversed:](self, "setHasBeenTraversed:", 1);
  -[NUArticleKeyCommandManager scrollView](self, "scrollView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "adjustedContentInset");
  v8 = v7;
  v10 = v9;

  -[NUArticleKeyCommandManager scrollView](self, "scrollView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contentOffset");
  v13 = v12;

  -[NUArticleKeyCommandManager scrollView](self, "scrollView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "contentSize");
  v16 = v15;

  -[NUArticleKeyCommandManager scrollView](self, "scrollView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bounds");
  v30 = v19;
  v31 = v18;
  v21 = v20;
  v23 = v22;

  v24 = (v23 - (v8 + v10)) * 0.8;
  if ((id)*MEMORY[0x24BDF79B0] == v32)
  {
    if ((v4 & 0x100000) != 0)
    {
      v13 = -v8;
      goto LABEL_19;
    }
    if ((v4 & 0x80000) != 0)
      goto LABEL_11;
    v25 = -100.0;
LABEL_15:
    v13 = v13 + v25;
    goto LABEL_19;
  }
  if ((id)*MEMORY[0x24BDF7990] != v32)
  {
    if (!objc_msgSend(v32, "isEqualToString:", CFSTR("UIKeyInputPageUp")))
    {
      if (objc_msgSend(v32, "isEqualToString:", CFSTR("UIKeyInputPageDown")))
        goto LABEL_17;
      if (!objc_msgSend(v32, "isEqualToString:", CFSTR(" ")))
        goto LABEL_19;
      if ((v4 & 0x20000) == 0)
        goto LABEL_17;
    }
LABEL_11:
    v13 = v13 - v24;
    goto LABEL_19;
  }
  if ((v4 & 0x100000) == 0)
  {
    if ((v4 & 0x80000) != 0)
    {
LABEL_17:
      v13 = v13 + v24;
      goto LABEL_19;
    }
    v25 = 100.0;
    goto LABEL_15;
  }
  v33.origin.y = v30;
  v33.origin.x = v31;
  v33.size.width = v21;
  v33.size.height = v23;
  v13 = v8 + v10 + v16 - CGRectGetHeight(v33);
LABEL_19:
  v34.origin.y = v30;
  v34.origin.x = v31;
  v34.size.width = v21;
  v34.size.height = v23;
  v26 = v8 + v10 + v16 - CGRectGetHeight(v34);
  if (v13 <= -v8)
    v27 = -v8;
  else
    v27 = v13;
  if (v27 >= v26)
    v28 = v26;
  else
    v28 = v27;
  -[NUArticleKeyCommandManager scrollView](self, "scrollView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setContentOffset:animated:", 1, 0.0, v28);

}

- (void)registerScrollView:(id)a3
{
  objc_storeWeak((id *)&self->_scrollView, a3);
}

- (UIScrollView)scrollView
{
  return (UIScrollView *)objc_loadWeakRetained((id *)&self->_scrollView);
}

- (BOOL)hasBeenTraversed
{
  return self->_hasBeenTraversed;
}

- (void)setHasBeenTraversed:(BOOL)a3
{
  self->_hasBeenTraversed = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_scrollView);
}

@end
