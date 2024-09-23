@implementation SRCompactKeyboardState

- (SRCompactKeyboardState)initWithFrame:(CGRect)a3 animation:(id)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v10;
  SRCompactKeyboardState *v11;
  SRCompactKeyboardState *v12;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SRCompactKeyboardState;
  v11 = -[SRCompactKeyboardState init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    v11->_frame.origin.x = x;
    v11->_frame.origin.y = y;
    v11->_frame.size.width = width;
    v11->_frame.size.height = height;
    objc_storeStrong((id *)&v11->_animation, a4);
  }

  return v12;
}

- (SRCompactKeyboardState)initWithKeyboardNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  unsigned __int8 v28;
  id v29;
  void *v30;
  unsigned __int8 v31;
  void *v32;
  SRCompactKeyboardState *v33;
  SRCompactKeyboardAnimation *v34;

  v4 = a3;
  if ((sub_100038A5C(v4) & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", UIKeyboardFrameBeginUserInfoKey));
    objc_msgSend(v6, "CGRectValue");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", UIKeyboardFrameEndUserInfoKey));
    objc_msgSend(v15, "CGRectValue");
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;

    v24 = v4;
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "name"));
    v26 = sub_100038E28();
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    v28 = objc_msgSend(v27, "containsObject:", v25);

    if ((v28 & 1) == 0)
    {
      v29 = sub_100038EE0();
      v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
      v31 = objc_msgSend(v30, "containsObject:", v25);

      if ((v31 & 1) != 0)
      {

        v8 = v17;
        v10 = v19;
        v12 = v21;
        v14 = v23;
LABEL_11:
        v34 = -[SRCompactKeyboardAnimation initWithKeyboardNotification:]([SRCompactKeyboardAnimation alloc], "initWithKeyboardNotification:", v24);
        self = -[SRCompactKeyboardState initWithFrame:animation:](self, "initWithFrame:animation:", v34, v8, v10, v12, v14);

        v33 = self;
        goto LABEL_12;
      }
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_FAULT))
        sub_10009E358();
    }

    goto LABEL_11;
  }
  v32 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_FAULT))
    sub_10009E3CC(v32, v4);
  v33 = 0;
LABEL_12:

  return v33;
}

- (CGRect)frameForAnimation
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactKeyboardState animation](self, "animation"));
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "endingFrame");
  else
    -[SRCompactKeyboardState frame](self, "frame");
  v9 = v5;
  v10 = v6;
  v11 = v7;
  v12 = v8;

  v13 = v9;
  v14 = v10;
  v15 = v11;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGRect)frame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_frame.origin.x;
  y = self->_frame.origin.y;
  width = self->_frame.size.width;
  height = self->_frame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (SRCompactKeyboardAnimation)animation
{
  return self->_animation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animation, 0);
}

@end
