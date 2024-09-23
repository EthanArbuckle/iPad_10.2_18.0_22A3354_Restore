@implementation PHVoicemailMessageTableViewCellScrollView

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_super v9;

  v6 = a3;
  v7 = a4;
  if ((-[PHVoicemailMessageTableViewCellScrollView isDragging](self, "isDragging") & 1) != 0)
  {
    v9.receiver = self;
    v9.super_class = (Class)PHVoicemailMessageTableViewCellScrollView;
    -[PHVoicemailMessageTableViewCellScrollView touchesCancelled:withEvent:](&v9, "touchesCancelled:withEvent:", v6, v7);
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCellScrollView superview](self, "superview"));
    objc_msgSend(v8, "touchesCancelled:withEvent:", v6, v7);

  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_super v9;

  v6 = a3;
  v7 = a4;
  if ((-[PHVoicemailMessageTableViewCellScrollView isDragging](self, "isDragging") & 1) != 0)
  {
    v9.receiver = self;
    v9.super_class = (Class)PHVoicemailMessageTableViewCellScrollView;
    -[PHVoicemailMessageTableViewCellScrollView touchesMoved:withEvent:](&v9, "touchesMoved:withEvent:", v6, v7);
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCellScrollView superview](self, "superview"));
    objc_msgSend(v8, "touchesMoved:withEvent:", v6, v7);

  }
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_super v9;

  v6 = a3;
  v7 = a4;
  if ((-[PHVoicemailMessageTableViewCellScrollView isDragging](self, "isDragging") & 1) != 0)
  {
    v9.receiver = self;
    v9.super_class = (Class)PHVoicemailMessageTableViewCellScrollView;
    -[PHVoicemailMessageTableViewCellScrollView touchesBegan:withEvent:](&v9, "touchesBegan:withEvent:", v6, v7);
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCellScrollView superview](self, "superview"));
    objc_msgSend(v8, "touchesBegan:withEvent:", v6, v7);

  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_super v9;

  v6 = a3;
  v7 = a4;
  if ((-[PHVoicemailMessageTableViewCellScrollView isDragging](self, "isDragging") & 1) != 0)
  {
    v9.receiver = self;
    v9.super_class = (Class)PHVoicemailMessageTableViewCellScrollView;
    -[PHVoicemailMessageTableViewCellScrollView touchesEnded:withEvent:](&v9, "touchesEnded:withEvent:", v6, v7);
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHVoicemailMessageTableViewCellScrollView superview](self, "superview"));
    objc_msgSend(v8, "touchesEnded:withEvent:", v6, v7);

  }
}

@end
