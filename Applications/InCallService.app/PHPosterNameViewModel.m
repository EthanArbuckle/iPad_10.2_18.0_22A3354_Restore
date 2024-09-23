@implementation PHPosterNameViewModel

- (PHPosterNameViewModel)initWithCall:(id)a3 posterNameTextView:(id)a4 priorityPosterNameTextView:(id)a5
{
  id v9;
  id v10;
  id v11;
  PHPosterNameViewModel *v12;
  PHPosterNameViewModel *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PHPosterNameViewModel;
  v12 = -[PHPosterNameViewModel init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_call, a3);
    objc_storeStrong((id *)&v13->_posterNameTextView, a4);
    objc_storeStrong((id *)&v13->_priorityPosterNameTextView, a5);
  }

  return v13;
}

- (PHPosterNameViewModel)initWithCall:(id)a3 posterNameTextView:(id)a4
{
  return -[PHPosterNameViewModel initWithCall:posterNameTextView:priorityPosterNameTextView:](self, "initWithCall:posterNameTextView:priorityPosterNameTextView:", a3, a4, 0);
}

- (BOOL)isVisible
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  BOOL v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHPosterNameViewModel priorityPosterNameTextView](self, "priorityPosterNameTextView"));
  v4 = v3;
  if (v3)
    v5 = v3;
  else
    v5 = (id)objc_claimAutoreleasedReturnValue(-[PHPosterNameViewModel posterNameTextView](self, "posterNameTextView"));
  v6 = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "viewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "view"));
  objc_msgSend(v8, "alpha");
  v10 = v9 > 0.0;

  return v10;
}

- (void)removeFromSuperview
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHPosterNameViewModel posterNameTextView](self, "posterNameTextView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "viewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  objc_msgSend(v5, "removeFromSuperview");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHPosterNameViewModel posterNameTextView](self, "posterNameTextView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "emojiViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "view"));
  objc_msgSend(v8, "removeFromSuperview");

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHPosterNameViewModel priorityPosterNameTextView](self, "priorityPosterNameTextView"));
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHPosterNameViewModel priorityPosterNameTextView](self, "priorityPosterNameTextView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "viewController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "view"));
    objc_msgSend(v12, "removeFromSuperview");

    v15 = (id)objc_claimAutoreleasedReturnValue(-[PHPosterNameViewModel priorityPosterNameTextView](self, "priorityPosterNameTextView"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "emojiViewController"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "view"));
    objc_msgSend(v14, "removeFromSuperview");

  }
}

- (void)transitionCallToActiveStateAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHPosterNameViewModel posterNameTextView](self, "posterNameTextView"));
  objc_msgSend(v5, "transitionCallToActiveStateAnimated:", v3);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHPosterNameViewModel priorityPosterNameTextView](self, "priorityPosterNameTextView"));
  if (v6)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[PHPosterNameViewModel priorityPosterNameTextView](self, "priorityPosterNameTextView"));
    objc_msgSend(v7, "transitionCallToActiveStateAnimated:", v3);

  }
}

- (void)updateStatus:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHPosterNameViewModel posterNameTextView](self, "posterNameTextView"));
  objc_msgSend(v4, "setStatusText:", v7);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHPosterNameViewModel priorityPosterNameTextView](self, "priorityPosterNameTextView"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHPosterNameViewModel priorityPosterNameTextView](self, "priorityPosterNameTextView"));
    objc_msgSend(v6, "setStatusText:", v7);

  }
}

- (void)updateViewModelForParticipantsView:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  PHPosterNameViewModel *v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentCall"));
  v6 = -[PHPosterNameViewModel shouldUpdateForCall:](self, "shouldUpdateForCall:", v5);

  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "singleCallLabelView"));
  if (v6)
    v7 = self;
  else
    v7 = 0;
  objc_msgSend(v8, "setPosterNameViewModel:", v7);

}

- (void)updatePosterNameAlpha:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHPosterNameViewModel posterNameTextView](self, "posterNameTextView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "viewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
  objc_msgSend(v7, "setAlpha:", a3);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHPosterNameViewModel posterNameTextView](self, "posterNameTextView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "emojiViewController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "view"));
  objc_msgSend(v10, "setAlpha:", a3);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHPosterNameViewModel priorityPosterNameTextView](self, "priorityPosterNameTextView"));
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHPosterNameViewModel priorityPosterNameTextView](self, "priorityPosterNameTextView"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "viewController"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "view"));
    objc_msgSend(v14, "setAlpha:", a3);

    v17 = (id)objc_claimAutoreleasedReturnValue(-[PHPosterNameViewModel priorityPosterNameTextView](self, "priorityPosterNameTextView"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "emojiViewController"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "view"));
    objc_msgSend(v16, "setAlpha:", a3);

  }
}

- (void)updateStatusFromParticipantsView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "singleCallLabelView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "statusLabel"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "text"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentCall"));
  LOBYTE(v4) = -[PHPosterNameViewModel shouldUpdateForCall:](self, "shouldUpdateForCall:", v7);

  if ((v4 & 1) != 0)
  {
    v8 = v9;
  }
  else
  {

    v8 = 0;
  }
  v10 = v8;
  -[PHPosterNameViewModel updateStatus:](self, "updateStatus:", v8);

}

- (BOOL)shouldUpdateForCall:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHPosterNameViewModel call](self, "call"));

  v6 = 1;
  if (v4 && v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHPosterNameViewModel call](self, "call"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "uniqueProxyIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uniqueProxyIdentifier"));
    v6 = objc_msgSend(v8, "isEqualToString:", v9);

  }
  return v6;
}

- (TUCall)call
{
  return self->_call;
}

- (PRIncomingCallTextViewAdapterWrapper)posterNameTextView
{
  return self->_posterNameTextView;
}

- (PRIncomingCallTextViewAdapterWrapper)priorityPosterNameTextView
{
  return self->_priorityPosterNameTextView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_priorityPosterNameTextView, 0);
  objc_storeStrong((id *)&self->_posterNameTextView, 0);
  objc_storeStrong((id *)&self->_call, 0);
}

@end
