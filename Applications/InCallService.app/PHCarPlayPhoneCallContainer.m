@implementation PHCarPlayPhoneCallContainer

- (id)_reloadQueue
{
  if (qword_1002DCB10 != -1)
    dispatch_once(&qword_1002DCB10, &stru_100286DD0);
  return (id)qword_1002DCB18;
}

- (PHCarPlayPhoneCallContainer)initWithFrame:(CGRect)a3
{
  PHCarPlayPhoneCallContainer *v3;
  PHCarPlayPhoneCallContainer *v4;
  uint64_t v5;
  NSMutableArray *visibleCells;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PHCarPlayPhoneCallContainer;
  v3 = -[PHCarPlayPhoneCallContainer initWithFrame:](&v8, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PHCarPlayPhoneCallContainer setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v5 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    visibleCells = v4->_visibleCells;
    v4->_visibleCells = (NSMutableArray *)v5;

    v4->_shouldMerge = 0;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v2;

  self->_dataSource = 0;
  self->_delegate = 0;
  v2.receiver = self;
  v2.super_class = (Class)PHCarPlayPhoneCallContainer;
  -[PHCarPlayPhoneCallContainer dealloc](&v2, "dealloc");
}

- (void)setDataSource:(id)a3
{
  self->_dataSource = (MPCarPlayPhoneCallContainerDataSource *)a3;
  -[PHCarPlayPhoneCallContainer reloadData](self, "reloadData");
}

- (void)reloadData
{
  -[PHCarPlayPhoneCallContainer reloadDataAnimated:](self, "reloadDataAnimated:", 0);
}

- (BOOL)shouldReloadCellsWithNumberOfCells:(unint64_t)a3
{
  return a3 != 0;
}

- (void)reloadDataAnimated:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  v5 = objc_claimAutoreleasedReturnValue(-[PHCarPlayPhoneCallContainer _reloadQueue](self, "_reloadQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100098EB4;
  v6[3] = &unk_100284C98;
  v6[4] = self;
  v7 = a3;
  dispatch_sync(v5, v6);

}

- (void)updateCell:(id)a3 atIndex:(unint64_t)a4 animated:(BOOL)a5
{
  id v8;
  _QWORD v9[5];
  id v10;
  unint64_t v11;
  BOOL v12;

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000990BC;
  v9[3] = &unk_100286E20;
  v10 = a3;
  v11 = a4;
  v9[4] = self;
  v12 = a5;
  v8 = v10;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);

}

- (void)setNeedsMerge
{
  self->_shouldMerge = 1;
}

- (void)updateNumberOfCellsWithNewValue:(unint64_t)a3 animated:(BOOL)a4
{
  void *v6;
  id v7;
  void *v8;
  unint64_t v9;
  void *v10;
  char *v11;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayPhoneCallContainer visibleCells](self, "visibleCells"));
  v7 = objc_msgSend(v6, "count");

  if ((unint64_t)v7 >= a3)
  {
    if (self->_shouldMerge)
    {
      -[PHCarPlayPhoneCallContainer mergeVisibleCells](self, "mergeVisibleCells");
      return;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayPhoneCallContainer visibleCells](self, "visibleCells"));
    v11 = (char *)objc_msgSend(v10, "count") - a3;

    -[PHCarPlayPhoneCallContainer removeVisibleCells:](self, "removeVisibleCells:", v11);
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayPhoneCallContainer visibleCells](self, "visibleCells"));
    v9 = a3 - (_QWORD)objc_msgSend(v8, "count");

    -[PHCarPlayPhoneCallContainer createVisibleCells:](self, "createVisibleCells:", v9);
  }
  -[PHCarPlayPhoneCallContainer updateLayoutAnimated:](self, "updateLayoutAnimated:");
}

- (void)updateLayoutAnimated:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  -[PHCarPlayPhoneCallContainer layoutIfNeeded](self, "layoutIfNeeded");
  -[PHCarPlayPhoneCallContainer updateAllCellConstraints](self, "updateAllCellConstraints");
  -[PHCarPlayPhoneCallContainer setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  if (v3)
    -[PHCarPlayPhoneCallContainer animateLayoutOfViewWithCompletionBlock:](self, "animateLayoutOfViewWithCompletionBlock:", 0);
}

- (void)animateLayoutOfViewWithCompletionBlock:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000994F0;
  v3[3] = &unk_100284898;
  v3[4] = self;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 133, v3, a3, 0.550000012, 0.0);
}

- (void)phoneCallViewCellTapped:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = objc_claimAutoreleasedReturnValue(-[PHCarPlayPhoneCallContainer delegate](self, "delegate"));
  if (v4)
  {
    v5 = (void *)v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayPhoneCallContainer delegate](self, "delegate"));
    v7 = objc_opt_respondsToSelector(v6, "phoneCallContainer:phoneCallViewTappedAtIndex:");

    if ((v7 & 1) != 0)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayPhoneCallContainer delegate](self, "delegate"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayPhoneCallContainer visibleCells](self, "visibleCells"));
      objc_msgSend(v8, "phoneCallContainer:phoneCallViewTappedAtIndex:", self, objc_msgSend(v9, "indexOfObject:", v10));

    }
  }

}

- (void)mergeVisibleCells
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  _QWORD *v8;
  _QWORD v9[5];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  if (!-[PHCarPlayPhoneCallContainer isMerging](self, "isMerging"))
  {
    self->_merging = 1;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayPhoneCallContainer visibleCells](self, "visibleCells"));
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v11;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v11 != v6)
            objc_enumerationMutation(v3);
          -[PHCarPlayPhoneCallContainer updateCell:atIndex:animated:](self, "updateCell:atIndex:animated:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v7), 0, 1);
          v7 = (char *)v7 + 1;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v5);
    }

    -[PHCarPlayPhoneCallContainer layoutIfNeeded](self, "layoutIfNeeded");
    -[PHCarPlayPhoneCallContainer mergeAllCellConstraints](self, "mergeAllCellConstraints");
    -[PHCarPlayPhoneCallContainer setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100099748;
    v9[3] = &unk_1002848C0;
    v9[4] = self;
    v8 = objc_retainBlock(v9);
    -[PHCarPlayPhoneCallContainer animateLayoutOfViewWithCompletionBlock:](self, "animateLayoutOfViewWithCompletionBlock:", v8);

  }
}

- (void)createVisibleCells:(unint64_t)a3
{
  unint64_t v3;
  PHCarPlayPhoneCallViewCell *v5;
  PHCarPlayPhoneCallViewCell *v6;
  void *v7;

  if (a3)
  {
    v3 = a3;
    do
    {
      v5 = [PHCarPlayPhoneCallViewCell alloc];
      -[PHCarPlayPhoneCallContainer bounds](self, "bounds");
      v6 = -[PHCarPlayPhoneCallViewCell initWithFrame:](v5, "initWithFrame:");
      -[PHCarPlayPhoneCallViewCell addTarget:action:forControlEvents:](v6, "addTarget:action:forControlEvents:", self, "phoneCallViewCellTapped:", 64);
      -[PHCarPlayPhoneCallContainer addSubview:](self, "addSubview:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayPhoneCallContainer visibleCells](self, "visibleCells"));
      objc_msgSend(v7, "addObject:", v6);

      -[PHCarPlayPhoneCallContainer addConstraintsForNewCell:](self, "addConstraintsForNewCell:", v6);
      --v3;
    }
    while (v3);
  }
}

- (void)removeVisibleCells:(unint64_t)a3
{
  void *v5;
  char *v6;
  void *v7;
  id v8;
  _QWORD v9[5];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayPhoneCallContainer visibleCells](self, "visibleCells"));
  v6 = (char *)objc_msgSend(v5, "count") - a3;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayPhoneCallContainer visibleCells](self, "visibleCells"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "subarrayWithRange:", v6, a3));

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100099968;
  v9[3] = &unk_100286E48;
  v9[4] = self;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v9);

}

- (void)removeAllConstraintsForCell:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayPhoneCallContainer constraints](self, "constraints", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstItem"));
        if ((id)v12 == v4)
        {

        }
        else
        {
          v13 = (void *)v12;
          v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "secondItem"));

          if (v14 != v4)
            continue;
        }
        objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  -[PHCarPlayPhoneCallContainer removeConstraints:](self, "removeConstraints:", v5);
}

- (void)addConstraintsForNewCell:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "centerYAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayPhoneCallContainer centerYAnchor](self, "centerYAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:", v6));

  LODWORD(v8) = 1144750080;
  objc_msgSend(v7, "setPriority:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayPhoneCallContainer topAnchor](self, "topAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintGreaterThanOrEqualToAnchor:", v10));

  LODWORD(v12) = 1148846080;
  objc_msgSend(v11, "setPriority:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayPhoneCallContainer constraintToFillContainerWithLeftOfCell:](self, "constraintToFillContainerWithLeftOfCell:", v4));
  objc_msgSend(v4, "setContainerSpecificLeftConstraint:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayPhoneCallContainer constraintToFillContainerWithRightOfCell:](self, "constraintToFillContainerWithRightOfCell:", v4));
  objc_msgSend(v4, "setContainerSpecificRightConstraint:", v14);

  v18[0] = v7;
  v18[1] = v11;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "containerSpecificLeftConstraint"));
  v18[2] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "containerSpecificRightConstraint"));
  v18[3] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v18, 4));
  -[PHCarPlayPhoneCallContainer addConstraints:](self, "addConstraints:", v17);

  -[PHCarPlayPhoneCallContainer addRelationForWidthOfCell:](self, "addRelationForWidthOfCell:", v4);
}

- (void)mergeAllCellConstraints
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayPhoneCallContainer visibleCells](self, "visibleCells", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        -[PHCarPlayPhoneCallContainer removeAllConstraintsForCell:](self, "removeAllConstraintsForCell:", v8);
        -[PHCarPlayPhoneCallContainer addConstraintsForNewCell:](self, "addConstraintsForNewCell:", v8);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)updateAllCellConstraints
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayPhoneCallContainer visibleCells](self, "visibleCells", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "containerSpecificRightConstraint"));

        if (v9)
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "containerSpecificRightConstraint"));
          -[PHCarPlayPhoneCallContainer removeConstraint:](self, "removeConstraint:", v10);

        }
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "containerSpecificLeftConstraint"));

        if (v11)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "containerSpecificLeftConstraint"));
          -[PHCarPlayPhoneCallContainer removeConstraint:](self, "removeConstraint:", v12);

        }
        -[PHCarPlayPhoneCallContainer addRelationForLeftOfCell:](self, "addRelationForLeftOfCell:", v8);
        -[PHCarPlayPhoneCallContainer addRelationForRightOfCell:](self, "addRelationForRightOfCell:", v8);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

}

- (void)addRelationForWidthOfCell:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayPhoneCallContainer visibleCells](self, "visibleCells"));
  if ((unint64_t)objc_msgSend(v4, "count") < 2)
    goto LABEL_4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayPhoneCallContainer visibleCells](self, "visibleCells"));
  v6 = objc_msgSend(v5, "indexOfObject:", v9);

  if (v6)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayPhoneCallContainer visibleCells](self, "visibleCells"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v9, 7, 0, v7, 7, 1.0, 0.0));
    -[PHCarPlayPhoneCallContainer addConstraint:](self, "addConstraint:", v8);

LABEL_4:
  }

}

- (void)addRelationForRightOfCell:(id)a3
{
  void *v4;
  char *v5;
  void *v6;
  char *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayPhoneCallContainer visibleCells](self, "visibleCells"));
  v5 = (char *)objc_msgSend(v4, "count") - 1;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayPhoneCallContainer visibleCells](self, "visibleCells"));
  v7 = (char *)objc_msgSend(v6, "indexOfObject:", v11);

  if (v7 == v5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayPhoneCallContainer constraintToFillContainerWithRightOfCell:](self, "constraintToFillContainerWithRightOfCell:", v11));
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayPhoneCallContainer visibleCells](self, "visibleCells"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", v7 + 1));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v11, 2, 0, v10, 1, 1.0, -12.0));

  }
  objc_msgSend(v11, "setContainerSpecificRightConstraint:", v8);
  -[PHCarPlayPhoneCallContainer addConstraint:](self, "addConstraint:", v8);

}

- (id)constraintToFillContainerWithRightOfCell:(id)a3
{
  return +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", a3, 2, 0, self, 2, 1.0, 0.0);
}

- (void)addRelationForLeftOfCell:(id)a3
{
  void *v4;
  char *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayPhoneCallContainer visibleCells](self, "visibleCells"));
  v5 = (char *)objc_msgSend(v4, "indexOfObject:", v9);

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayPhoneCallContainer visibleCells](self, "visibleCells"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", v5 - 1));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v9, 1, 0, v7, 2, 1.0, 12.0));

  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayPhoneCallContainer constraintToFillContainerWithLeftOfCell:](self, "constraintToFillContainerWithLeftOfCell:", v9));
  }
  objc_msgSend(v9, "setContainerSpecificLeftConstraint:", v8);
  -[PHCarPlayPhoneCallContainer addConstraint:](self, "addConstraint:", v8);

}

- (id)constraintToFillContainerWithLeftOfCell:(id)a3
{
  return +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", a3, 1, 0, self, 1, 1.0, 0.0);
}

- (MPCarPlayPhoneCallContainerDataSource)dataSource
{
  return self->_dataSource;
}

- (MPCarPlayPhoneCallContainerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (MPCarPlayPhoneCallContainerDelegate *)a3;
}

- (NSMutableArray)visibleCells
{
  return (NSMutableArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setVisibleCells:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (BOOL)shouldMerge
{
  return self->_shouldMerge;
}

- (void)setShouldMerge:(BOOL)a3
{
  self->_shouldMerge = a3;
}

- (BOOL)isMerging
{
  return self->_merging;
}

- (void)setMerging:(BOOL)a3
{
  self->_merging = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visibleCells, 0);
}

@end
