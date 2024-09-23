@implementation SRUserUtteranceContainerView

- (BOOL)isFirstResponder
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  BOOL v10;
  char v11;
  _QWORD v13[5];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  _BYTE v22[128];

  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SRUserUtteranceContainerView subviews](self, "subviews"));
  v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v15;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v5)
        objc_enumerationMutation(v2);
      v7 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v6);
      objc_opt_class(UICollectionView, v3);
      if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
      {
        v9 = v7;
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472;
        v13[2] = sub_100031ADC;
        v13[3] = &unk_100122F08;
        v13[4] = &v18;
        objc_msgSend(v9, "_enumerateDescendentViews:", v13);
        v10 = *((_BYTE *)v19 + 24) == 0;

        if (!v10)
          break;
      }
      if (v4 == (id)++v6)
      {
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
        if (v4)
          goto LABEL_3;
        break;
      }
    }
  }

  v11 = *((_BYTE *)v19 + 24);
  _Block_object_dispose(&v18, 8);
  return v11;
}

- (void)animateToEditWithDuration:(double)a3 completion:(id)a4
{
  id v6;
  id WeakRetained;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[5];

  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_tableView);
  objc_msgSend(WeakRetained, "setAlpha:", 0.0);

  v8 = objc_loadWeakRetained((id *)&self->_tableView);
  -[SRUserUtteranceContainerView addSubview:](self, "addSubview:", v8);

  self->_showEditingView = 1;
  v11 = v6;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100031C5C;
  v12[3] = &unk_1001225C0;
  v12[4] = self;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100031CC8;
  v10[3] = &unk_100122F30;
  v10[4] = self;
  v9 = v6;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v12, v10, a3);

}

- (void)animateToDisplayWithDuration:(double)a3 completion:(id)a4
{
  id v6;
  id WeakRetained;
  id v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[5];

  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_displayView);
  objc_msgSend(WeakRetained, "setChevronHidden:", 0);

  v8 = objc_loadWeakRetained((id *)&self->_displayView);
  objc_msgSend(v8, "setAlpha:", 0.0);

  v9 = objc_loadWeakRetained((id *)&self->_displayView);
  -[SRUserUtteranceContainerView addSubview:](self, "addSubview:", v9);

  self->_showEditingView = 0;
  v12 = v6;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100031E30;
  v13[3] = &unk_1001225C0;
  v13[4] = self;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100031E9C;
  v11[3] = &unk_100122F30;
  v11[4] = self;
  v10 = v6;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v13, v11, a3);

}

- (double)firstLineBaselineOffsetFromTop
{
  id WeakRetained;
  double v3;
  double v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_displayView);
  objc_msgSend(WeakRetained, "firstLineBaselineOffsetFromTop");
  v4 = v3;

  return v4;
}

- (double)baselineOffsetFromBottom
{
  id WeakRetained;
  double v3;
  double v4;
  double v5;

  if (self->_showEditingView)
  {
    WeakRetained = (id)objc_claimAutoreleasedReturnValue(+[UIFont siriui_userUtteranceFont](UIFont, "siriui_userUtteranceFont"));
    objc_msgSend(WeakRetained, "descender");
    v4 = -v3;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_displayView);
    objc_msgSend(WeakRetained, "baselineOffsetFromBottom");
    v4 = v5;
  }

  return v4;
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  int *v11;
  double v12;
  id WeakRetained;
  double Width;
  objc_super v15;
  CGRect v16;
  CGRect v17;

  v15.receiver = self;
  v15.super_class = (Class)SRUserUtteranceContainerView;
  -[SRUserUtteranceContainerView layoutSubviews](&v15, "layoutSubviews");
  -[SRUserUtteranceContainerView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (self->_showEditingView)
    v11 = &OBJC_IVAR___SRUserUtteranceContainerView__tableView;
  else
    v11 = &OBJC_IVAR___SRUserUtteranceContainerView__displayView;
  if (self->_showEditingView)
    v12 = -8.0;
  else
    v12 = 0.0;
  WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa + *v11));
  v16.origin.x = v4;
  v16.origin.y = v6;
  v16.size.width = v8;
  v16.size.height = v10;
  Width = CGRectGetWidth(v16);
  v17.origin.x = v4;
  v17.origin.y = v6;
  v17.size.width = v8;
  v17.size.height = v10;
  objc_msgSend(WeakRetained, "setFrame:", 0.0, v12, Width, CGRectGetHeight(v17));

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  id WeakRetained;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  height = a3.height;
  width = a3.width;
  if (self->_showEditingView)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_tableView);
    objc_msgSend(WeakRetained, "sizeThatFits:", width, height);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_displayView);
    objc_msgSend(WeakRetained, "sizeThatFits:", width, height);
    width = v7;
  }
  v8 = v6;

  v9 = width;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (SRUserUtteranceView)displayView
{
  return (SRUserUtteranceView *)objc_loadWeakRetained((id *)&self->_displayView);
}

- (void)setDisplayView:(id)a3
{
  objc_storeWeak((id *)&self->_displayView, a3);
}

- (UIView)tableView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_tableView);
}

- (void)setTableView:(id)a3
{
  objc_storeWeak((id *)&self->_tableView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tableView);
  objc_destroyWeak((id *)&self->_displayView);
}

@end
