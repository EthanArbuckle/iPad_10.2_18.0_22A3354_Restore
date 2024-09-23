@implementation SRCompactKeyboardAnimation

- (SRCompactKeyboardAnimation)initWithDuration:(double)a3 curve:(int64_t)a4 beginningFrame:(CGRect)a5 endingFrame:(CGRect)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  SRCompactKeyboardAnimation *result;
  unint64_t v13;
  objc_super v14;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v14.receiver = self;
  v14.super_class = (Class)SRCompactKeyboardAnimation;
  result = -[SRCompactKeyboardAnimation init](&v14, "init");
  if (result)
  {
    result->_duration = a3;
    if ((unint64_t)(a4 - 1) >= 3)
      v13 = 0;
    else
      v13 = ((a4 - 1) << 16) + 0x10000;
    result->_options = v13;
    result->_beginningFrame.origin.x = x;
    result->_beginningFrame.origin.y = y;
    result->_beginningFrame.size.width = width;
    result->_beginningFrame.size.height = height;
    result->_endingFrame = a6;
  }
  return result;
}

- (SRCompactKeyboardAnimation)initWithKeyboardNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  NSObject *v9;
  SRCompactKeyboardAnimation *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double v32;

  v4 = a3;
  if ((sub_100038A5C(v4) & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", UIKeyboardAnimationDurationUserInfoKey));
    objc_msgSend(v6, "doubleValue");
    v8 = v7;

    if (v8 == 0.0)
    {
      v9 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
        sub_10009E468(v9);
      v10 = 0;
    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", UIKeyboardAnimationCurveUserInfoKey));
      v13 = objc_msgSend(v12, "unsignedIntegerValue");

      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", UIKeyboardFrameBeginUserInfoKey));
      objc_msgSend(v14, "CGRectValue");
      v32 = v15;
      v17 = v16;
      v19 = v18;
      v21 = v20;

      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", UIKeyboardFrameEndUserInfoKey));
      objc_msgSend(v22, "CGRectValue");
      v24 = v23;
      v26 = v25;
      v28 = v27;
      v30 = v29;

      self = -[SRCompactKeyboardAnimation initWithDuration:curve:beginningFrame:endingFrame:](self, "initWithDuration:curve:beginningFrame:endingFrame:", v13, v8, v32, v17, v19, v21, v24, v26, v28, v30);
      v10 = self;
    }

  }
  else
  {
    v11 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_FAULT))
      sub_10009E4E8(v11, v4);
    v10 = 0;
  }

  return v10;
}

- (double)duration
{
  return self->_duration;
}

- (unint64_t)options
{
  return self->_options;
}

- (CGRect)beginningFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_beginningFrame.origin.x;
  y = self->_beginningFrame.origin.y;
  width = self->_beginningFrame.size.width;
  height = self->_beginningFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)endingFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_endingFrame.origin.x;
  y = self->_endingFrame.origin.y;
  width = self->_endingFrame.size.width;
  height = self->_endingFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

@end
