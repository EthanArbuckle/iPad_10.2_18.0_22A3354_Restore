@implementation FBAExpandingTextView

- (FBAExpandingTextView)initWithFrame:(CGRect)a3
{
  FBAExpandingTextView *v3;
  FBAExpandingTextView *v4;
  void *v5;
  id v6;
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
  void *v17;
  objc_super v19;
  _QWORD v20[2];
  _QWORD v21[2];

  v19.receiver = self;
  v19.super_class = (Class)FBAExpandingTextView;
  v3 = -[FBAExpandingTextView initWithFrame:](&v19, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[FBAExpandingTextView setScrollEnabled:](v3, "setScrollEnabled:", 0);
    -[FBAExpandingTextView setShowsVerticalScrollIndicator:](v4, "setShowsVerticalScrollIndicator:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "addObserver:selector:name:object:", v4, "didChange:", UITextViewTextDidChangeNotification, 0);

    v6 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    -[FBAExpandingTextView setPlaceholderLabel:](v4, "setPlaceholderLabel:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FBAExpandingTextView placeholderLabel](v4, "placeholderLabel"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    objc_msgSend(v7, "setTextColor:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection traitCollectionWithUserInterfaceStyle:](UITraitCollection, "traitCollectionWithUserInterfaceStyle:", 0));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection traitCollectionWithUserInterfaceStyle:](UITraitCollection, "traitCollectionWithUserInterfaceStyle:", 2));
    v20[0] = v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
    v20[1] = v10;
    v21[0] = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondarySystemBackgroundColor](UIColor, "secondarySystemBackgroundColor"));
    v21[1] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v21, v20, 2));

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _dynamicColorWithColorsByTraitCollection:](UIColor, "_dynamicColorWithColorsByTraitCollection:", v13));
    -[FBAExpandingTextView setBackgroundColor:](v4, "setBackgroundColor:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[FBAExpandingTextView placeholderLabel](v4, "placeholderLabel"));
    objc_msgSend(v15, "setLineBreakMode:", 0);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[FBAExpandingTextView placeholderLabel](v4, "placeholderLabel"));
    objc_msgSend(v16, "setNumberOfLines:", 0);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[FBAExpandingTextView placeholderLabel](v4, "placeholderLabel"));
    -[FBAExpandingTextView addSubview:](v4, "addSubview:", v17);

  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  _TtC18Feedback_Assistant20FBAExpandingTextView *v4;
  id v5;
  objc_super v6;

  v3 = (void *)objc_opt_self(NSNotificationCenter);
  v4 = self;
  v5 = objc_msgSend(v3, "defaultCenter");
  objc_msgSend(v5, "removeObserver:", v4);

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for FBAExpandingTextView();
  -[FBAExpandingTextView dealloc](&v6, "dealloc");
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  void *v7;
  unsigned __int8 v8;
  objc_super v10;

  v6 = a4;
  if ("paste:" != a3)
    goto LABEL_5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FBAExpandingTextView delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v7, "canPerformPaste") & 1) == 0)
  {

LABEL_5:
    v10.receiver = self;
    v10.super_class = (Class)FBAExpandingTextView;
    v8 = -[FBAExpandingTextView canPerformAction:withSender:](&v10, "canPerformAction:withSender:", a3, v6);
    goto LABEL_6;
  }
  v8 = objc_msgSend(v7, "canPerformPaste");

LABEL_6:
  return v8;
}

- (void)didChange:(id)a3
{
  double v4;
  double v5;
  double v6;
  void *v7;
  id v8;

  -[FBAExpandingTextView frame](self, "frame", a3);
  v5 = v4;
  -[FBAExpandingTextView heightNeededForContentWidth:](self, "heightNeededForContentWidth:", v4);
  -[FBAExpandingTextView setContentSize:](self, "setContentSize:", v5, v6);
  v8 = (id)objc_claimAutoreleasedReturnValue(-[FBAExpandingTextView placeholderLabel](self, "placeholderLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FBAExpandingTextView textStorage](self, "textStorage"));
  objc_msgSend(v8, "setHidden:", objc_msgSend(v7, "length") != 0);

}

- (double)heightNeededForContentWidth:(double)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;

  if (!qword_100118138)
  {
    v5 = objc_alloc((Class)UITextView);
    -[FBAExpandingTextView frame](self, "frame");
    v6 = objc_msgSend(v5, "initWithFrame:");
    v7 = (void *)qword_100118138;
    qword_100118138 = (uint64_t)v6;

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FBAExpandingTextView text](self, "text"));
  objc_msgSend((id)qword_100118138, "setText:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FBAExpandingTextView font](self, "font"));
  objc_msgSend((id)qword_100118138, "setFont:", v9);

  -[FBAExpandingTextView textContainerInset](self, "textContainerInset");
  objc_msgSend((id)qword_100118138, "setTextContainerInset:");
  objc_msgSend((id)qword_100118138, "sizeThatFits:", a3, 1.79769313e308);
  return v10 + 8.0;
}

- (void)setContentSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  void *v8;
  objc_super v9;

  height = a3.height;
  width = a3.width;
  -[FBAExpandingTextView contentSize](self, "contentSize");
  v7 = v6;
  v9.receiver = self;
  v9.super_class = (Class)FBAExpandingTextView;
  -[FBAExpandingTextView setContentSize:](&v9, "setContentSize:", width, height);
  if (v7 != height)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FBAExpandingTextView delegate](self, "delegate"));
    if ((objc_opt_respondsToSelector(v8, "textViewDidChangeContentHeight:") & 1) != 0)
      objc_msgSend(v8, "textViewDidChangeContentHeight:", self);

  }
}

- (void)setPlaceholderText:(id)a3
{
  void *v4;
  void *v5;
  unsigned __int8 v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FBAExpandingTextView placeholderLabel](self, "placeholderLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "text"));
  v6 = objc_msgSend(v5, "isEqualToString:", v7);

  if ((v6 & 1) == 0)
  {
    objc_msgSend(v4, "setText:", v7);
    objc_msgSend(v4, "sizeToFit");
    -[FBAExpandingTextView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setPlaceholderAttributedText:(id)a3
{
  void *v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FBAExpandingTextView placeholderLabel](self, "placeholderLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "attributedText"));
  v6 = objc_msgSend(v5, "isEqualToAttributedString:", v9);

  if ((v6 & 1) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FBAExpandingTextView placeholderLabel](self, "placeholderLabel"));
    objc_msgSend(v7, "setAttributedText:", v9);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FBAExpandingTextView placeholderLabel](self, "placeholderLabel"));
    objc_msgSend(v8, "sizeToFit");

    -[FBAExpandingTextView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (NSString)placeholderText
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FBAExpandingTextView placeholderLabel](self, "placeholderLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "text"));

  return (NSString *)v3;
}

- (void)layoutSubviews
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
  void *v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)FBAExpandingTextView;
  -[FBAExpandingTextView layoutSubviews](&v15, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FBAExpandingTextView placeholderLabel](self, "placeholderLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FBAExpandingTextView textStorage](self, "textStorage"));
  objc_msgSend(v3, "setHidden:", objc_msgSend(v4, "length") != 0);

  -[FBAExpandingTextView bounds](self, "bounds");
  v6 = v5 + 10.0;
  v8 = v7 + 5.0;
  v10 = v9 + -20.0;
  v12 = v11 + -10.0;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FBAExpandingTextView placeholderLabel](self, "placeholderLabel"));
  objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[FBAExpandingTextView placeholderLabel](self, "placeholderLabel"));
  objc_msgSend(v14, "sizeToFit");

}

- (NSAttributedString)placeholderAttributedText
{
  return self->_placeholderAttributedText;
}

- (UILabel)placeholderLabel
{
  return self->_placeholderLabel;
}

- (void)setPlaceholderLabel:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderLabel, a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18Feedback_Assistant20FBAExpandingTextView_log));
  swift_bridgeObjectRelease(*(_QWORD *)&self->log[OBJC_IVAR____TtC18Feedback_Assistant20FBAExpandingTextView_committedText]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->log[OBJC_IVAR____TtC18Feedback_Assistant20FBAExpandingTextView_placeholderText]);
}

- (BOOL)resignFirstResponder
{
  _TtC18Feedback_Assistant20FBAExpandingTextView *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_100050774();

  return v3 & 1;
}

- (_TtC18Feedback_Assistant20FBAExpandingTextView)initWithCoder:(id)a3
{
  return (_TtC18Feedback_Assistant20FBAExpandingTextView *)sub_100050F7C(a3);
}

- (_TtC18Feedback_Assistant20FBAExpandingTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  id v4;
  _TtC18Feedback_Assistant20FBAExpandingTextView *result;

  v4 = a4;
  result = (_TtC18Feedback_Assistant20FBAExpandingTextView *)_swift_stdlib_reportUnimplementedInitializer("Feedback_Assistant.FBAExpandingTextView", 39, "init(frame:textContainer:)", 26, 0);
  __break(1u);
  return result;
}

@end
