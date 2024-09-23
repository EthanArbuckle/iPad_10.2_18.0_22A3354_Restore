@implementation WFApertureIconAccessoryView

- (WFApertureIconAccessoryView)initWithIcon:(id)a3 runningContext:(id)a4
{
  id v7;
  WFApertureIconAccessoryView *v8;
  WFApertureIconAccessoryView *v9;
  id v10;
  WFApertureIconAccessoryView *v11;
  objc_super v13;

  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WFApertureIconAccessoryView;
  v8 = -[WFApertureIconAccessoryView initWithIcon:](&v13, "initWithIcon:", a3);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_runningContext, a4);
    v9->_awaitingIconOwnershipSwap = -[WFApertureIconAccessoryView isRunningFromActionButton](v9, "isRunningFromActionButton");
    v10 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", v9, "openShortcutInEditor");
    -[WFApertureIconAccessoryView addGestureRecognizer:](v9, "addGestureRecognizer:", v10);

    v11 = v9;
  }

  return v9;
}

- (void)setIcon:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  unsigned __int8 v8;
  dispatch_time_t v9;
  _QWORD block[5];
  objc_super v11;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[WFApertureIconAccessoryView icon](self, "icon"));
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if ((v8 & 1) == 0)
  {
    v11.receiver = self;
    v11.super_class = (Class)WFApertureIconAccessoryView;
    -[WFApertureIconAccessoryView setIcon:animated:](&v11, "setIcon:animated:", v6, v4);
    v9 = dispatch_time(0, 150000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100005C60;
    block[3] = &unk_100034BE8;
    block[4] = self;
    dispatch_after(v9, (dispatch_queue_t)&_dispatch_main_q, block);
  }

}

- (void)layoutSubviews
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  dispatch_time_t v6;
  void *v7;
  _QWORD block[5];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WFApertureIconAccessoryView;
  -[WFApertureIconAccessoryView layoutSubviews](&v9, "layoutSubviews");
  -[WFApertureIconAccessoryView bounds](self, "bounds");
  if (v3 <= 24.0)
  {
    v4 = 0;
    v5 = 0;
  }
  else
  {
    v4 = 1;
    v5 = 1;
  }
  -[WFApertureIconAccessoryView setMode:animated:](self, "setMode:animated:", v4, v5);
  if (-[WFApertureIconAccessoryView awaitingIconOwnershipSwap](self, "awaitingIconOwnershipSwap"))
  {
    v6 = dispatch_time(0, 100000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100005C18;
    block[3] = &unk_100034BE8;
    block[4] = self;
    dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[WFApertureIconAccessoryView systemApertureElementContext](self, "systemApertureElementContext"));
    objc_msgSend(v7, "setElementNeedsUpdate");

  }
}

- (void)openShortcutInEditor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WFApertureIconAccessoryView runningContext](self, "runningContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "workflowIdentifier"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[WFApertureIconAccessoryView runningContext](self, "runningContext"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "workflowIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("shortcuts://open-shortcut?id=%@"), v6));
    v9 = (id)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v7));

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[WFApplicationContext sharedContext](WFApplicationContext, "sharedContext"));
    objc_msgSend(v8, "openURL:", v9);

  }
}

- (CGSize)sizeThatFits:(CGSize)a3 forLayoutMode:(int64_t)a4
{
  double height;
  double width;
  unsigned int v8;
  double v9;
  double v10;
  objc_super v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v8 = -[WFApertureIconAccessoryView awaitingIconOwnershipSwap](self, "awaitingIconOwnershipSwap");
  if (a4 == 4 || !v8)
  {
    v11.receiver = self;
    v11.super_class = (Class)WFApertureIconAccessoryView;
    -[WFApertureIconAccessoryView sizeThatFits:](&v11, "sizeThatFits:", width, height);
  }
  else
  {
    v9 = CGSizeZero.width;
    v10 = CGSizeZero.height;
  }
  result.height = v10;
  result.width = v9;
  return result;
}

- (BOOL)isRunningFromActionButton
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[WFApertureIconAccessoryView runningContext](self, "runningContext"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "runSource"));
  v4 = objc_msgSend(v3, "isEqualToString:", WFWorkflowRunSourceActionButton);

  return v4;
}

- (WFWorkflowRunningContext)runningContext
{
  return self->_runningContext;
}

- (void)setRunningContext:(id)a3
{
  objc_storeStrong((id *)&self->_runningContext, a3);
}

- (BOOL)awaitingIconOwnershipSwap
{
  return self->_awaitingIconOwnershipSwap;
}

- (void)setAwaitingIconOwnershipSwap:(BOOL)a3
{
  self->_awaitingIconOwnershipSwap = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runningContext, 0);
}

@end
