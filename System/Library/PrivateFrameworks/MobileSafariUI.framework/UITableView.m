@implementation UITableView

- (void)safari_moveSelectionByRowOffset:(void *)a1
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;

  if (a1)
  {
    v2 = a2;
    if (a2)
    {
      if (objc_msgSend(a1, "numberOfSections"))
      {
        objc_msgSend(a1, "indexPathForSelectedRow");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = objc_msgSend(v11, "section");
        if (v11)
          v5 = objc_msgSend(v11, "row");
        else
          v5 = -1;
        v6 = objc_msgSend(a1, "numberOfRowsInSection:", v4);
        while (2)
        {
          v7 = v11;
          while (1)
          {
            v8 = v2 + v5;
            if (v2 + v5 >= 0)
              break;
            if (v4 <= 0)
            {
              objc_msgSend(a1, "deselectRowAtIndexPath:animated:", v11, 0);
              goto LABEL_20;
            }
            v9 = objc_msgSend(a1, "numberOfRowsInSection:", --v4);
            v7 = v11;
            v5 = v9;
            v6 = v9;
            v2 = v8;
          }
          if (v8 >= v6)
          {
            if (v4 + 1 != objc_msgSend(a1, "numberOfSections"))
            {
              v2 += v5 - v6;
              v6 = objc_msgSend(a1, "numberOfRowsInSection:", v4 + 1);
              v5 = 0;
              ++v4;
              continue;
            }
            v8 = v6 - 1;
            v7 = v11;
          }
          break;
        }
        if ((v4 & 0x8000000000000000) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v8, v4);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "selectRowAtIndexPath:animated:scrollPosition:", v10, 0, 0);
          objc_msgSend(a1, "scrollToRowAtIndexPath:atScrollPosition:animated:", v10, 0, 0);

LABEL_20:
          v7 = v11;
        }

      }
    }
  }
}

- (void)safari_moveSelectionBySectionOffset:(void *)a1
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  if (a1 && a2)
  {
    objc_msgSend(a1, "indexPathForSelectedRow");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v4;
    if (v4)
    {
      v5 = objc_msgSend(v4, "section");
      v4 = v8;
    }
    else
    {
      v5 = -1;
    }
    v6 = objc_msgSend(v4, "row");
    if (a2 <= 0 && v6)
      goto LABEL_12;
    v5 += a2;
    if (v5 >= objc_msgSend(a1, "numberOfSections") - 1)
      v5 = objc_msgSend(a1, "numberOfSections") - 1;
    if (v5 < 0)
    {
      objc_msgSend(a1, "deselectRowAtIndexPath:animated:", v8, 0);
    }
    else
    {
LABEL_12:
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "selectRowAtIndexPath:animated:scrollPosition:", v7, 0, 0);
      objc_msgSend(a1, "scrollToRowAtIndexPath:atScrollPosition:animated:", v7, 0, 0);

    }
  }
}

- (void)safari_adjustContentOffsetToTopHidingTableHeaderView
{
  double v2;
  double v3;
  CGFloat v4;
  double v5;
  id v6;
  CGRect v7;

  if (a1)
  {
    objc_msgSend(a1, "adjustedContentInset");
    v3 = v2;
    objc_msgSend(a1, "tableHeaderView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    v4 = CGRectGetHeight(v7) - v3;
    objc_msgSend(a1, "contentInset");
    objc_msgSend(a1, "setContentOffset:", 0.0, v4 + v5);

  }
}

- (void)safari_dismissContextMenu
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v9 = 0u;
    v10 = 0u;
    v7 = 0u;
    v8 = 0u;
    objc_msgSend(a1, "interactions", 0);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    if (v2)
    {
      v3 = v2;
      v4 = *(_QWORD *)v8;
      do
      {
        v5 = 0;
        do
        {
          if (*(_QWORD *)v8 != v4)
            objc_enumerationMutation(v1);
          v6 = *(void **)(*((_QWORD *)&v7 + 1) + 8 * v5);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v6, "dismissMenu");
          ++v5;
        }
        while (v3 != v5);
        v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      }
      while (v3);
    }

  }
}

@end
