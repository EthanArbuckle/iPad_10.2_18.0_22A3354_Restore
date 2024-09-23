@implementation SVSTextAnimator

- (void)setDisplayEndIndex:(unint64_t)a3
{
  NSMutableArray *changes;
  NSMutableArray *v6;
  NSMutableArray *v7;
  void *v8;

  self->_displayEndIndex = a3;
  changes = self->_changes;
  if (!changes)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_changes;
    self->_changes = v6;

    changes = self->_changes;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  -[NSMutableArray addObject:](changes, "addObject:", v8);

  -[SVSTextAnimator _update](self, "_update");
}

- (void)setText:(id)a3
{
  id v5;
  NSMutableAttributedString *v6;
  NSMutableAttributedString *attributedText;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSMutableAttributedString *v13;
  void *v14;
  id v15;

  v5 = a3;
  objc_storeStrong((id *)&self->_text, a3);
  v15 = v5;
  if (v15)
  {
    v6 = (NSMutableAttributedString *)objc_msgSend(objc_alloc((Class)NSMutableAttributedString), "initWithString:", v15);
    attributedText = self->_attributedText;
    self->_attributedText = v6;

    v8 = objc_msgSend(v15, "length");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_label1, "font"));
    v10 = v9;
    if (v9)
      v11 = v9;
    else
      v11 = (id)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 15.0));
    v12 = v11;

    -[NSMutableAttributedString addAttribute:value:range:](self->_attributedText, "addAttribute:value:range:", NSFontAttributeName, v12, 0, v8);
    v13 = self->_attributedText;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[NSMutableAttributedString addAttribute:value:range:](v13, "addAttribute:value:range:", NSForegroundColorAttributeName, v14, 0, v8);

    -[UILabel setAlpha:](self->_label1, "setAlpha:", 0.0);
    -[UILabel setAttributedText:](self->_label1, "setAttributedText:", self->_attributedText);
    -[UILabel setHidden:](self->_label1, "setHidden:", 0);
    -[UILabel setAlpha:](self->_label2, "setAlpha:", 0.0);
    -[UILabel setAttributedText:](self->_label2, "setAttributedText:", self->_attributedText);
    -[UILabel setHidden:](self->_label2, "setHidden:", 0);
    objc_storeStrong((id *)&self->_activeLabel, self->_label1);

  }
  else
  {
    -[UILabel setText:](self->_label1, "setText:", &stru_10017E3D8);
    -[UILabel setText:](self->_label2, "setText:", &stru_10017E3D8);
  }

}

- (void)_update
{
  void *v3;
  void *v4;
  _BYTE *v5;
  UILabel *v6;
  UILabel *label1;
  UILabel *v8;
  _BYTE *v9;
  NSMutableAttributedString *attributedText;
  void *v11;
  NSMutableAttributedString *v12;
  void *v13;
  UILabel *v14;
  UILabel *v15;
  UILabel *activeLabel;
  UILabel *v17;
  _QWORD v18[4];
  UILabel *v19;
  UILabel *v20;
  SVSTextAnimator *v21;
  _QWORD v22[4];
  UILabel *v23;

  if (!self->_busy)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_changes, "firstObject"));
    v4 = v3;
    if (v3)
    {
      v5 = objc_msgSend(v3, "unsignedIntegerValue");
      -[NSMutableArray removeObjectAtIndex:](self->_changes, "removeObjectAtIndex:", 0);
      v6 = self->_activeLabel;
      label1 = self->_label1;
      if (v6 == label1)
        label1 = self->_label2;
      v8 = label1;
      v9 = -[NSMutableAttributedString length](self->_attributedText, "length");
      -[NSMutableAttributedString removeAttribute:range:](self->_attributedText, "removeAttribute:range:", NSForegroundColorAttributeName, 0, v9);
      if (v9 < v5)
        v5 = v9;
      attributedText = self->_attributedText;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
      -[NSMutableAttributedString addAttribute:value:range:](attributedText, "addAttribute:value:range:", NSForegroundColorAttributeName, v11, 0, v5);

      v12 = self->_attributedText;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
      -[NSMutableAttributedString addAttribute:value:range:](v12, "addAttribute:value:range:", NSForegroundColorAttributeName, v13, v5, v9 - v5);

      -[UILabel setAttributedText:](v8, "setAttributedText:", self->_attributedText);
      self->_busy = 1;
      -[UILabel setAlpha:](v8, "setAlpha:", 0.0);
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_100115FC8;
      v22[3] = &unk_10017E1F0;
      v23 = v8;
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_100115FD4;
      v18[3] = &unk_10017DF00;
      v14 = v23;
      v19 = v14;
      v20 = v6;
      v21 = self;
      v15 = v6;
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 2, v22, v18, 0.08, 0.0);
      activeLabel = self->_activeLabel;
      self->_activeLabel = v14;
      v17 = v14;

    }
  }
}

- (unint64_t)displayEndIndex
{
  return self->_displayEndIndex;
}

- (UILabel)label1
{
  return self->_label1;
}

- (void)setLabel1:(id)a3
{
  objc_storeStrong((id *)&self->_label1, a3);
}

- (UILabel)label2
{
  return self->_label2;
}

- (void)setLabel2:(id)a3
{
  objc_storeStrong((id *)&self->_label2, a3);
}

- (NSString)text
{
  return self->_text;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_label2, 0);
  objc_storeStrong((id *)&self->_label1, 0);
  objc_storeStrong((id *)&self->_changes, 0);
  objc_storeStrong((id *)&self->_attributedText, 0);
  objc_storeStrong((id *)&self->_activeLabel, 0);
}

@end
