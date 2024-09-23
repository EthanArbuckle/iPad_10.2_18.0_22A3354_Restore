@implementation UIViewController

- (void)safari_saveTableViewScrollPosition
{
  void *v2;
  void *v3;
  uint64_t v4;
  double MaxY;
  double Height;
  double v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat v20;
  uint64_t v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double MinY;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[4];
  _QWORD v42[5];
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;

  v42[4] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(a1, "safari_tableViewForScrollPositionSaving");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    if (v2)
    {
      v4 = objc_msgSend(v2, "numberOfSections");
      if (v4)
      {
        objc_msgSend(v3, "rectForSection:", v4 - 1);
        MaxY = CGRectGetMaxY(v43);
        objc_msgSend(v3, "frame");
        Height = CGRectGetHeight(v44);
        objc_msgSend(v3, "adjustedContentInset");
        v8 = Height - v7;
        objc_msgSend(v3, "tableHeaderView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "frame");
        v10 = v8 + CGRectGetHeight(v45);

        if (MaxY >= v10)
        {
          objc_msgSend(v3, "indexPathsForVisibleRows");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "firstObject");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
          {
            objc_msgSend(v3, "contentOffset");
            v14 = v13;
            v16 = v15;
            objc_msgSend(v3, "rectForRowAtIndexPath:", v12);
            v47 = CGRectOffset(v46, -v14, -v16);
            x = v47.origin.x;
            y = v47.origin.y;
            width = v47.size.width;
            v20 = v47.size.height;
            v21 = objc_msgSend(v12, "section");
            objc_msgSend(v3, "rectForHeaderInSection:", v21);
            v23 = v22;
            v25 = v24;
            v27 = v26;
            v29 = v28;
            v48.origin.x = x;
            v48.origin.y = y;
            v48.size.width = width;
            v48.size.height = v20;
            MinY = CGRectGetMinY(v48);
            v49.origin.x = v23;
            v49.origin.y = v25;
            v49.size.width = v27;
            v49.size.height = v29;
            v31 = MinY - CGRectGetHeight(v49);
            objc_msgSend(v3, "adjustedContentInset");
            v33 = v31 - v32;
            v41[0] = CFSTR("VisibleIndexSection");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v21);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v42[0] = v34;
            v41[1] = CFSTR("VisibleIndexRow");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v12, "row"));
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v42[1] = v35;
            v41[2] = CFSTR("VisibleIndexOffset");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v33);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v42[2] = v36;
            v41[3] = CFSTR("Timestamp");
            objc_msgSend(MEMORY[0x1E0C99D68], "date");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v42[3] = v37;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 4);
            v38 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1, "_safari_tableViewScrollPositionKey");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "setObject:forKey:", v38, v40);

          }
        }
      }
    }

  }
}

- (BOOL)safari_restoreTableViewScrollPosition
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  _BOOL8 v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  float v23;

  if (!a1)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_safari_tableViewScrollPositionKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "valueForKey:", CFSTR("Timestamp"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSinceDate:", v6);
    v9 = v8;

    v10 = v9 <= 480.0;
    if (v9 <= 480.0)
    {
      objc_msgSend(a1, "safari_tableViewForScrollPositionSaving");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        objc_msgSend(v5, "safari_numberForKey:", CFSTR("VisibleIndexSection"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "safari_numberForKey:", CFSTR("VisibleIndexRow"));
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = (void *)v13;
        if (v12
          && v13
          && (v15 = objc_msgSend(v12, "integerValue"), v15 < objc_msgSend(v11, "numberOfSections"))
          && (v16 = objc_msgSend(v14, "integerValue"),
              v16 < objc_msgSend(v11, "numberOfRowsInSection:", objc_msgSend(v12, "integerValue"))))
        {
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", objc_msgSend(v14, "integerValue"), objc_msgSend(v12, "integerValue"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "scrollToRowAtIndexPath:atScrollPosition:animated:", v17, 1, 0);
          objc_msgSend(v5, "safari_numberForKey:", CFSTR("VisibleIndexOffset"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            objc_msgSend(v11, "contentOffset");
            v20 = v19;
            v22 = v21;
            objc_msgSend(v18, "floatValue");
            objc_msgSend(v11, "setContentOffset:", v20, v22 - v23);
          }

        }
        else
        {
          -[UITableView safari_adjustContentOffsetToTopHidingTableHeaderView](v11);
        }

      }
      objc_msgSend(v2, "removeObjectForKey:", v3);

    }
    else
    {
      objc_msgSend(v2, "removeObjectForKey:", v3);
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)safari_hasSavedTableViewScrollPosition
{
  _BOOL8 v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = a1;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v1, "_safari_tableViewScrollPositionKey");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKey:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v1 = v4 != 0;

  }
  return v1;
}

@end
