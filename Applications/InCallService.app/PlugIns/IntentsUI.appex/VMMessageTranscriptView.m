@implementation VMMessageTranscriptView

- (void)commonInit
{
  TUFeatureFlags *v3;
  TUFeatureFlags *featureFlags;
  id v5;
  double y;
  double width;
  double height;
  UILabel *v9;
  UILabel *titleLabel;
  void *v11;
  void *v12;
  UITextView *v13;
  UITextView *textView;
  void *v15;
  double left;
  double bottom;
  double right;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  UITextView *v23;
  UITextView *feedbackTextView;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  uint64_t v34;
  void *i;
  void *v36;
  uint64_t v37;
  UIActivityIndicatorView *v38;
  UIActivityIndicatorView *indicatorView;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  objc_super v44;
  _BYTE v45[128];
  NSAttributedStringKey v46;
  void *v47;

  v44.receiver = self;
  v44.super_class = (Class)VMMessageTranscriptView;
  -[VMMessageTranscriptView commonInit](&v44, "commonInit");
  -[VMMessageTranscriptView setClipsToBounds:](self, "setClipsToBounds:", 1);
  v3 = (TUFeatureFlags *)objc_alloc_init((Class)TUFeatureFlags);
  featureFlags = self->_featureFlags;
  self->_featureFlags = v3;

  v5 = objc_alloc((Class)UILabel);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v9 = (UILabel *)objc_msgSend(v5, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v9;

  -[UILabel setAdjustsFontSizeToFitWidth:](self->_titleLabel, "setAdjustsFontSizeToFitWidth:", 0);
  -[UILabel setLineBreakMode:](self->_titleLabel, "setLineBreakMode:", 4);
  -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("VOICEMAILUI_MESSAGE_TRANSCRIPT_VIEW_TITLE"), &stru_10007F010, CFSTR("VoicemailUI")));
  -[UILabel setText:](self->_titleLabel, "setText:", v12);

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setUserInteractionEnabled:](self->_titleLabel, "setUserInteractionEnabled:", 0);
  -[VMMessageTranscriptView addSubview:](self, "addSubview:", self->_titleLabel);
  v13 = (UITextView *)objc_msgSend(objc_alloc((Class)UITextView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  textView = self->_textView;
  self->_textView = v13;

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[UITextView setBackgroundColor:](self->_textView, "setBackgroundColor:", v15);

  left = UIEdgeInsetsZero.left;
  bottom = UIEdgeInsetsZero.bottom;
  right = UIEdgeInsetsZero.right;
  -[UITextView setContentInset:](self->_textView, "setContentInset:", UIEdgeInsetsZero.top, left, bottom, right);
  -[UITextView setDataDetectorTypes:](self->_textView, "setDataDetectorTypes:", -1);
  -[UITextView setDelaysContentTouches:](self->_feedbackTextView, "setDelaysContentTouches:", 0);
  -[UITextView setEditable:](self->_textView, "setEditable:", 0);
  -[VMMessageTranscriptView textViewLineHeight](self, "textViewLineHeight");
  -[UITextView setLineHeight:](self->_textView, "setLineHeight:");
  -[UITextView setScrollEnabled:](self->_textView, "setScrollEnabled:", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[UITextView textContainer](self->_textView, "textContainer"));
  objc_msgSend(v19, "setLineBreakMode:", 4);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[UITextView textContainer](self->_textView, "textContainer"));
  objc_msgSend(v20, "setLineFragmentPadding:", 0.0);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[UITextView textContainer](self->_textView, "textContainer"));
  objc_msgSend(v21, "setMaximumNumberOfLines:", 0);

  -[UITextView setTextContainerInset:](self->_textView, "setTextContainerInset:", UIEdgeInsetsZero.top, left, bottom, right);
  -[UITextView setTranslatesAutoresizingMaskIntoConstraints:](self->_textView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UITextView setUserInteractionEnabled:](self->_textView, "setUserInteractionEnabled:", 1);
  -[UITextView setTextAlignment:](self->_textView, "setTextAlignment:", 4);
  if (CPIsInternalDevice(-[VMMessageTranscriptView addSubview:](self, "addSubview:", self->_textView)))
  {
    v22 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "handleTextViewTapGesture:");
    objc_msgSend(v22, "setNumberOfTouchesRequired:", 2);
    -[VMMessageTranscriptView addGestureRecognizer:](self, "addGestureRecognizer:", v22);

  }
  v23 = (UITextView *)objc_alloc_init((Class)UITextView);
  feedbackTextView = self->_feedbackTextView;
  self->_feedbackTextView = v23;

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[UITextView setBackgroundColor:](self->_feedbackTextView, "setBackgroundColor:", v25);

  -[UITextView setContentInset:](self->_feedbackTextView, "setContentInset:", UIEdgeInsetsZero.top, left, bottom, right);
  -[UITextView setDataDetectorTypes:](self->_feedbackTextView, "setDataDetectorTypes:", 2);
  -[UITextView setDelaysContentTouches:](self->_feedbackTextView, "setDelaysContentTouches:", 0);
  -[UITextView setEditable:](self->_feedbackTextView, "setEditable:", 0);
  v46 = NSForegroundColorAttributeName;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
  v47 = v26;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1));
  -[UITextView setLinkTextAttributes:](self->_feedbackTextView, "setLinkTextAttributes:", v27);

  -[UITextView setScrollEnabled:](self->_feedbackTextView, "setScrollEnabled:", 0);
  -[UITextView setSelectable:](self->_feedbackTextView, "setSelectable:", 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[UITextView textContainer](self->_feedbackTextView, "textContainer"));
  objc_msgSend(v28, "setLineFragmentPadding:", 0.0);

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[UITextView textContainer](self->_feedbackTextView, "textContainer"));
  objc_msgSend(v29, "setMaximumNumberOfLines:", 0);

  -[UITextView setTextContainerInset:](self->_feedbackTextView, "setTextContainerInset:", UIEdgeInsetsZero.top, left, bottom, right);
  -[UITextView setTranslatesAutoresizingMaskIntoConstraints:](self->_feedbackTextView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UITextView setTextAlignment:](self->_feedbackTextView, "setTextAlignment:", 4);
  -[VMMessageTranscriptView addSubview:](self, "addSubview:", self->_feedbackTextView);
  v30 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "handleFeedbackTextViewTapGesture:");
  -[UITextView addGestureRecognizer:](self->_feedbackTextView, "addGestureRecognizer:", v30);
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[UITextView gestureRecognizers](self->_feedbackTextView, "gestureRecognizers", 0));
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v33; i = (char *)i + 1)
      {
        if (*(_QWORD *)v41 != v34)
          objc_enumerationMutation(v31);
        v36 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)i);
        v37 = objc_opt_class(UILongPressGestureRecognizer);
        if ((objc_opt_isKindOfClass(v36, v37) & 1) != 0)
          objc_msgSend(v36, "setEnabled:", 0);
      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    }
    while (v33);
  }

  v38 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithActivityIndicatorStyle:", 100);
  indicatorView = self->_indicatorView;
  self->_indicatorView = v38;

  -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](self->_indicatorView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIActivityIndicatorView setUserInteractionEnabled:](self->_indicatorView, "setUserInteractionEnabled:", 0);
  -[VMMessageTranscriptView addSubview:](self, "addSubview:", self->_indicatorView);

}

- (void)loadConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSString *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSString *v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSString *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSString *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  NSString *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  NSString *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  double v59;
  NSString *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  NSString *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  double v73;
  NSString *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  double v80;
  NSString *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  NSString *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  NSString *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  NSString *v100;
  void *v101;
  objc_super v102;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageTranscriptView indicatorView](self, "indicatorView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageTranscriptView topAnchor](self, "topAnchor"));
  -[VMMessageTranscriptView indicatorViewTopLayoutConstraintConstant](self, "indicatorViewTopLayoutConstraintConstant");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:constant:", v5));

  v7 = NSStringFromSelector("indicatorViewTopLayoutConstraint");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  objc_msgSend(v6, "setIdentifier:", v8);

  objc_msgSend(v6, "setActive:", 1);
  -[VMMessageTranscriptView setIndicatorViewTopLayoutConstraint:](self, "setIndicatorViewTopLayoutConstraint:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageTranscriptView indicatorView](self, "indicatorView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "centerXAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageTranscriptView centerXAnchor](self, "centerXAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v11));

  v13 = NSStringFromSelector("indicatorViewCenterXLayoutConstraint");
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  objc_msgSend(v12, "setIdentifier:", v14);

  objc_msgSend(v12, "setActive:", 1);
  -[VMMessageTranscriptView setIndicatorViewCenterXLayoutConstraint:](self, "setIndicatorViewCenterXLayoutConstraint:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageTranscriptView titleLabel](self, "titleLabel"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "firstBaselineAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageTranscriptView indicatorView](self, "indicatorView"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "bottomAnchor"));
  -[VMMessageTranscriptView titleLabelFirstBaselineLayoutConstraintConstant](self, "titleLabelFirstBaselineLayoutConstraintConstant");
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:constant:", v18));

  v20 = NSStringFromSelector("titleLabelTopLayoutConstraint");
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  objc_msgSend(v19, "setIdentifier:", v21);

  LODWORD(v22) = 1.0;
  objc_msgSend(v19, "setPriority:", v22);
  objc_msgSend(v19, "setActive:", 1);
  -[VMMessageTranscriptView setTitleLabelTopLayoutConstraint:](self, "setTitleLabelTopLayoutConstraint:", v19);
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageTranscriptView titleLabel](self, "titleLabel"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "firstBaselineAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageTranscriptView topAnchor](self, "topAnchor"));
  -[VMMessageTranscriptView titleLabelFirstBaselineLayoutConstraintConstant](self, "titleLabelFirstBaselineLayoutConstraintConstant");
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:constant:", v25));

  v27 = NSStringFromSelector("titleLabelFirstBaselineLayoutConstraint");
  v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
  objc_msgSend(v26, "setIdentifier:", v28);

  LODWORD(v29) = 1148829696;
  objc_msgSend(v26, "setPriority:", v29);
  objc_msgSend(v26, "setActive:", 1);
  -[VMMessageTranscriptView setTitleLabelFirstBaselineLayoutConstraint:](self, "setTitleLabelFirstBaselineLayoutConstraint:", v26);
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageTranscriptView titleLabel](self, "titleLabel"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "leadingAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageTranscriptView leadingAnchor](self, "leadingAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:", v32));

  v34 = NSStringFromSelector("titleLabelLeadingLayoutConstraint");
  v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
  objc_msgSend(v33, "setIdentifier:", v35);

  objc_msgSend(v33, "setActive:", 1);
  -[VMMessageTranscriptView setTitleLabelLeadingLayoutConstraint:](self, "setTitleLabelLeadingLayoutConstraint:", v33);
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageTranscriptView trailingAnchor](self, "trailingAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageTranscriptView titleLabel](self, "titleLabel"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "trailingAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintGreaterThanOrEqualToAnchor:", v38));

  v40 = NSStringFromSelector("titleLabelTrailingLayoutConstraint");
  v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
  objc_msgSend(v39, "setIdentifier:", v41);

  objc_msgSend(v39, "setActive:", 1);
  -[VMMessageTranscriptView setTitleLabelTrailingLayoutConstraint:](self, "setTitleLabelTrailingLayoutConstraint:", v39);
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageTranscriptView textView](self, "textView"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "leadingAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageTranscriptView leadingAnchor](self, "leadingAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToAnchor:", v44));

  v46 = NSStringFromSelector("textViewLeadingLayoutConstraint");
  v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
  objc_msgSend(v45, "setIdentifier:", v47);

  objc_msgSend(v45, "setActive:", 1);
  -[VMMessageTranscriptView setTextViewLeadingLayoutConstraint:](self, "setTextViewLeadingLayoutConstraint:", v45);
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageTranscriptView trailingAnchor](self, "trailingAnchor"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageTranscriptView textView](self, "textView"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "trailingAnchor"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintEqualToAnchor:", v50));

  v52 = NSStringFromSelector("textViewTrailingLayoutConstraint");
  v53 = (void *)objc_claimAutoreleasedReturnValue(v52);
  objc_msgSend(v51, "setIdentifier:", v53);

  objc_msgSend(v51, "setActive:", 1);
  -[VMMessageTranscriptView setTextViewTrailingLayoutConstraint:](self, "setTextViewTrailingLayoutConstraint:", v51);
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageTranscriptView textView](self, "textView"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "firstBaselineAnchor"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageTranscriptView titleLabel](self, "titleLabel"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "lastBaselineAnchor"));
  -[VMMessageTranscriptView textViewFirstBaselineLayoutConstraintConstant](self, "textViewFirstBaselineLayoutConstraintConstant");
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "constraintEqualToAnchor:constant:", v57));

  LODWORD(v59) = 1148829696;
  objc_msgSend(v58, "setPriority:", v59);
  v60 = NSStringFromSelector("textViewFirstBaselineLayoutConstraint");
  v61 = (void *)objc_claimAutoreleasedReturnValue(v60);
  objc_msgSend(v58, "setIdentifier:", v61);

  objc_msgSend(v58, "setActive:", 1);
  -[VMMessageTranscriptView setTextViewFirstBaselineLayoutConstraint:](self, "setTextViewFirstBaselineLayoutConstraint:", v58);
  v62 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageTranscriptView feedbackTextView](self, "feedbackTextView"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "topAnchor"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageTranscriptView textView](self, "textView"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "lastBaselineAnchor"));
  -[VMMessageTranscriptView textViewLastBaselineLayoutConstraintConstant](self, "textViewLastBaselineLayoutConstraintConstant");
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "constraintGreaterThanOrEqualToAnchor:constant:", v65));

  v67 = NSStringFromSelector("textViewLastBaselineLayoutConstraint");
  v68 = (void *)objc_claimAutoreleasedReturnValue(v67);
  objc_msgSend(v66, "setIdentifier:", v68);

  objc_msgSend(v66, "setActive:", 1);
  -[VMMessageTranscriptView setTextViewLastBaselineLayoutConstraint:](self, "setTextViewLastBaselineLayoutConstraint:", v66);
  v69 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageTranscriptView textView](self, "textView"));
  v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "firstBaselineAnchor"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageTranscriptView topAnchor](self, "topAnchor"));
  -[VMMessageTranscriptView textViewFirstBaselineLayoutConstraintConstant](self, "textViewFirstBaselineLayoutConstraintConstant");
  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "constraintEqualToAnchor:constant:", v71));

  LODWORD(v73) = 1.0;
  objc_msgSend(v72, "setPriority:", v73);
  v74 = NSStringFromSelector("textViewFirstBaselineWithoutAccessoryViewsLayoutConstraint");
  v75 = (void *)objc_claimAutoreleasedReturnValue(v74);
  objc_msgSend(v72, "setIdentifier:", v75);

  objc_msgSend(v72, "setActive:", 1);
  -[VMMessageTranscriptView setTextViewFirstBaselineWithoutAccessoryViewsLayoutConstraint:](self, "setTextViewFirstBaselineWithoutAccessoryViewsLayoutConstraint:", v72);
  v76 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageTranscriptView bottomAnchor](self, "bottomAnchor"));
  v77 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageTranscriptView textView](self, "textView"));
  v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "lastBaselineAnchor"));
  -[VMMessageTranscriptView textViewFirstBaselineLayoutConstraintConstant](self, "textViewFirstBaselineLayoutConstraintConstant");
  v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "constraintEqualToAnchor:constant:", v78));

  LODWORD(v80) = 1.0;
  objc_msgSend(v79, "setPriority:", v80);
  v81 = NSStringFromSelector("textViewBottomLayoutConstraint");
  v82 = (void *)objc_claimAutoreleasedReturnValue(v81);
  objc_msgSend(v79, "setIdentifier:", v82);

  objc_msgSend(v79, "setActive:", 1);
  -[VMMessageTranscriptView setTextViewBottomLayoutConstraint:](self, "setTextViewBottomLayoutConstraint:", v79);
  v83 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageTranscriptView feedbackTextView](self, "feedbackTextView"));
  v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "leadingAnchor"));
  v85 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageTranscriptView leadingAnchor](self, "leadingAnchor"));
  v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "constraintGreaterThanOrEqualToAnchor:", v85));

  v87 = NSStringFromSelector("feedbackTextViewLeadingLayoutConstraint");
  v88 = (void *)objc_claimAutoreleasedReturnValue(v87);
  objc_msgSend(v86, "setIdentifier:", v88);

  objc_msgSend(v86, "setActive:", 1);
  -[VMMessageTranscriptView setFeedbackTextViewLeadingLayoutConstraint:](self, "setFeedbackTextViewLeadingLayoutConstraint:", v86);
  v89 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageTranscriptView trailingAnchor](self, "trailingAnchor"));
  v90 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageTranscriptView feedbackTextView](self, "feedbackTextView"));
  v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "trailingAnchor"));
  v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "constraintGreaterThanOrEqualToAnchor:", v91));

  v93 = NSStringFromSelector("feedbackTextViewTrailingLayoutConstraint");
  v94 = (void *)objc_claimAutoreleasedReturnValue(v93);
  objc_msgSend(v92, "setIdentifier:", v94);

  objc_msgSend(v92, "setActive:", 1);
  -[VMMessageTranscriptView setFeedbackTextViewTrailingLayoutConstraint:](self, "setFeedbackTextViewTrailingLayoutConstraint:", v92);
  v95 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageTranscriptView textViewLastBaselineLayoutConstraint](self, "textViewLastBaselineLayoutConstraint"));
  -[VMMessageTranscriptView setFeedbackTextViewTopLayoutConstraint:](self, "setFeedbackTextViewTopLayoutConstraint:", v95);

  v96 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageTranscriptView bottomAnchor](self, "bottomAnchor"));
  v97 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageTranscriptView feedbackTextView](self, "feedbackTextView"));
  v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "lastBaselineAnchor"));
  -[VMMessageTranscriptView textViewFirstBaselineLayoutConstraintConstant](self, "textViewFirstBaselineLayoutConstraintConstant");
  v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "constraintEqualToAnchor:constant:", v98));

  v100 = NSStringFromSelector("feedbackTextViewBottomLayoutConstraint");
  v101 = (void *)objc_claimAutoreleasedReturnValue(v100);
  objc_msgSend(v99, "setIdentifier:", v101);

  objc_msgSend(v99, "setActive:", 1);
  -[VMMessageTranscriptView setFeedbackTextViewBottomLayoutConstraint:](self, "setFeedbackTextViewBottomLayoutConstraint:", v99);
  v102.receiver = self;
  v102.super_class = (Class)VMMessageTranscriptView;
  -[VMMessageTranscriptView loadConstraints](&v102, "loadConstraints");

}

- (void)updateConstraintsConstants
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double Width;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  objc_super v33;
  CGRect v34;

  v33.receiver = self;
  v33.super_class = (Class)VMMessageTranscriptView;
  -[VMMessageTranscriptView updateConstraintsConstants](&v33, "updateConstraintsConstants");
  -[VMMessageTranscriptView _refreshAttributedText](self, "_refreshAttributedText");
  -[VMMessageTranscriptView titleLabelFirstBaselineLayoutConstraintConstant](self, "titleLabelFirstBaselineLayoutConstraintConstant");
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageTranscriptView titleLabelFirstBaselineLayoutConstraint](self, "titleLabelFirstBaselineLayoutConstraint"));
  objc_msgSend(v5, "setConstant:", v4);

  -[VMMessageTranscriptView indicatorViewTopLayoutConstraintConstant](self, "indicatorViewTopLayoutConstraintConstant");
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageTranscriptView indicatorViewTopLayoutConstraint](self, "indicatorViewTopLayoutConstraint"));
  objc_msgSend(v8, "setConstant:", v7);

  -[VMMessageTranscriptView textViewFirstBaselineLayoutConstraintConstant](self, "textViewFirstBaselineLayoutConstraintConstant");
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageTranscriptView textViewFirstBaselineLayoutConstraint](self, "textViewFirstBaselineLayoutConstraint"));
  objc_msgSend(v11, "setConstant:", v10);

  -[VMMessageTranscriptView textViewLastBaselineLayoutConstraintConstant](self, "textViewLastBaselineLayoutConstraintConstant");
  v13 = v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageTranscriptView textViewLastBaselineLayoutConstraint](self, "textViewLastBaselineLayoutConstraint"));
  objc_msgSend(v14, "setConstant:", v13);

  -[VMMessageTranscriptView textViewLineHeight](self, "textViewLineHeight");
  v16 = v15;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageTranscriptView textView](self, "textView"));
  objc_msgSend(v17, "setLineHeight:", v16);

  -[VMMessageTranscriptView bounds](self, "bounds");
  Width = CGRectGetWidth(v34);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageTranscriptView feedbackTextView](self, "feedbackTextView"));
  objc_msgSend(v19, "_setPreferredMaxLayoutWidth:", Width);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageTranscriptView feedbackTextView](self, "feedbackTextView"));
  objc_msgSend(v20, "_preferredMaxLayoutWidth");
  v22 = v21;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageTranscriptView textView](self, "textView"));
  objc_msgSend(v23, "_setPreferredMaxLayoutWidth:", v22);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageTranscriptView feedbackTextView](self, "feedbackTextView"));
  objc_msgSend(v24, "_preferredMaxLayoutWidth");
  v26 = v25;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageTranscriptView titleLabel](self, "titleLabel"));
  objc_msgSend(v27, "setPreferredMaxLayoutWidth:", v26);

  v28 = -[VMMessageTranscriptView isAccessiblityConstraintsEnabled](self, "isAccessiblityConstraintsEnabled") ^ 1;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageTranscriptView titleLabel](self, "titleLabel"));
  objc_msgSend(v29, "setNumberOfLines:", v28);

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageTranscriptView feedbackTextView](self, "feedbackTextView"));
  objc_msgSend(v30, "sizeToFit");

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageTranscriptView textView](self, "textView"));
  objc_msgSend(v31, "sizeToFit");

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageTranscriptView titleLabel](self, "titleLabel"));
  objc_msgSend(v32, "sizeToFit");

}

- (void)setViewModel:(id)a3
{
  VMMessageTranscriptViewModel *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unsigned int v9;
  _BOOL8 v10;
  _BOOL8 v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  double v22;
  VMMessageTranscriptViewModel *v23;

  v5 = (VMMessageTranscriptViewModel *)a3;
  if (self->_viewModel != v5)
  {
    v23 = v5;
    objc_storeStrong((id *)&self->_viewModel, a3);
    -[VMMessageTranscriptViewModel setTintColorDelegate:](self->_viewModel, "setTintColorDelegate:", self);
    -[VMMessageTranscriptView _refreshAttributedText](self, "_refreshAttributedText");
    v6 = -[VMMessageTranscriptViewModel isTranscribing](v23, "isTranscribing") ^ 1;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageTranscriptView indicatorView](self, "indicatorView"));
    objc_msgSend(v7, "setHidden:", v6);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageTranscriptView featureFlags](self, "featureFlags"));
    v9 = objc_msgSend(v8, "voicemailSearchEnabled");

    v10 = -[VMMessageTranscriptViewModel isTranscribing](v23, "isTranscribing");
    v11 = v10;
    if (v9)
      v11 = v10 || -[VMMessageTranscriptView hideAccessoryViews](self, "hideAccessoryViews");
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageTranscriptView feedbackTextView](self, "feedbackTextView"));
    objc_msgSend(v12, "setHidden:", v11);

    v13 = -[VMMessageTranscriptViewModel isTranscribing](v23, "isTranscribing");
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageTranscriptView indicatorView](self, "indicatorView"));
    v15 = v14;
    if (v13)
    {
      objc_msgSend(v14, "startAnimating");

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageTranscriptView titleLabelFirstBaselineLayoutConstraint](self, "titleLabelFirstBaselineLayoutConstraint"));
      LODWORD(v17) = 1.0;
      objc_msgSend(v16, "setPriority:", v17);

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageTranscriptView titleLabelTopLayoutConstraint](self, "titleLabelTopLayoutConstraint"));
      v19 = v18;
      LODWORD(v20) = 1148829696;
    }
    else
    {
      objc_msgSend(v14, "stopAnimating");

      v21 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageTranscriptView titleLabelFirstBaselineLayoutConstraint](self, "titleLabelFirstBaselineLayoutConstraint"));
      LODWORD(v22) = 1148829696;
      objc_msgSend(v21, "setPriority:", v22);

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageTranscriptView titleLabelTopLayoutConstraint](self, "titleLabelTopLayoutConstraint"));
      v19 = v18;
      LODWORD(v20) = 1.0;
    }
    objc_msgSend(v18, "setPriority:", v20);

    -[VMMessageTranscriptView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
    v5 = v23;
  }

}

- (void)setHideAccessoryViews:(BOOL)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  double v19;
  id v20;

  if (self->_hideAccessoryViews != a3)
  {
    self->_hideAccessoryViews = a3;
    if (a3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageTranscriptView featureFlags](self, "featureFlags"));
      v5 = objc_msgSend(v4, "voicemailSearchEnabled");

      if (v5)
        -[VMMessageTranscriptView loadConstraints](self, "loadConstraints");
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageTranscriptView titleLabel](self, "titleLabel"));
      objc_msgSend(v6, "setHidden:", 1);

      v7 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageTranscriptView feedbackTextView](self, "feedbackTextView"));
      objc_msgSend(v7, "setHidden:", 1);

      v8 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageTranscriptView textViewFirstBaselineWithoutAccessoryViewsLayoutConstraint](self, "textViewFirstBaselineWithoutAccessoryViewsLayoutConstraint"));
      LODWORD(v9) = 1148829696;
      objc_msgSend(v8, "setPriority:", v9);

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageTranscriptView textViewBottomLayoutConstraint](self, "textViewBottomLayoutConstraint"));
      LODWORD(v11) = 1148829696;
      objc_msgSend(v10, "setPriority:", v11);

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageTranscriptView textViewFirstBaselineLayoutConstraint](self, "textViewFirstBaselineLayoutConstraint"));
      v20 = v12;
      LODWORD(v13) = 1.0;
    }
    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageTranscriptView titleLabel](self, "titleLabel"));
      objc_msgSend(v14, "setHidden:", 0);

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageTranscriptView feedbackTextView](self, "feedbackTextView"));
      objc_msgSend(v15, "setHidden:", 0);

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageTranscriptView textViewFirstBaselineWithoutAccessoryViewsLayoutConstraint](self, "textViewFirstBaselineWithoutAccessoryViewsLayoutConstraint"));
      LODWORD(v17) = 1.0;
      objc_msgSend(v16, "setPriority:", v17);

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageTranscriptView textViewBottomLayoutConstraint](self, "textViewBottomLayoutConstraint"));
      LODWORD(v19) = 1.0;
      objc_msgSend(v18, "setPriority:", v19);

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageTranscriptView textViewFirstBaselineLayoutConstraint](self, "textViewFirstBaselineLayoutConstraint"));
      v20 = v12;
      LODWORD(v13) = 1148829696;
    }
    objc_msgSend(v12, "setPriority:", v13);

  }
}

- (BOOL)shouldShowFeedbackTextView
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;

  if (PHVoicemailFeedbackReportingAvailable())
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageTranscriptView feedbackTextView](self, "feedbackTextView"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "attributedText"));
    if (objc_msgSend(v4, "length"))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageTranscriptView viewModel](self, "viewModel"));
      v6 = objc_msgSend(v5, "donated") ^ 1;

    }
    else
    {
      LOBYTE(v6) = 0;
    }

  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (void)handleFeedbackTextViewTapGesture:(id)a3
{
  uint64_t v4;
  char isKindOfClass;
  void *v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  v4 = objc_opt_class(UITapGestureRecognizer);
  isKindOfClass = objc_opt_isKindOfClass(v18, v4);
  v6 = v18;
  if ((isKindOfClass & 1) != 0)
  {
    v7 = v18;
    if (objc_msgSend(v7, "state") == (id)3)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageTranscriptView feedbackTextView](self, "feedbackTextView"));
      objc_msgSend(v7, "locationInView:", v8);
      v10 = v9;
      v12 = v11;

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageTranscriptView feedbackTextView](self, "feedbackTextView"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "closestPositionToPoint:", v10, v12));

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageTranscriptView feedbackTextView](self, "feedbackTextView"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "textStylingAtPosition:inDirection:", v14, 0));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKey:", NSLinkAttributeName));

      if (v17)
        -[VMMessageTranscriptView openFeedbackURL:](self, "openFeedbackURL:", v17);

    }
    v6 = v18;
  }

}

- (void)handleTextViewTapGesture:(id)a3
{
  uint64_t v4;
  char isKindOfClass;
  void *v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  id v11;

  v11 = a3;
  v4 = objc_opt_class(UITapGestureRecognizer);
  isKindOfClass = objc_opt_isKindOfClass(v11, v4);
  v6 = v11;
  if ((isKindOfClass & 1) != 0)
  {
    v7 = v11;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageTranscriptView delegate](self, "delegate"));
    v9 = objc_opt_respondsToSelector(v8, "messageTranscriptView:didReceiveTapGesture:");

    if ((v9 & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageTranscriptView delegate](self, "delegate"));
      objc_msgSend(v10, "messageTranscriptView:didReceiveTapGesture:", self, v7);

    }
    v6 = v11;
  }

}

- (void)openFeedbackURL:(id)a3
{
  void *v4;
  void *v5;
  unsigned __int8 v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v25 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "absoluteString"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[VMMessageTranscriptViewModel neutralFeedbackURL](VMMessageTranscriptViewModel, "neutralFeedbackURL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "absoluteString"));
  v6 = objc_msgSend(v25, "isEqualToString:", v5);

  if ((v6 & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[VMMessageTranscriptViewModel negativeFeedbackURL](VMMessageTranscriptViewModel, "negativeFeedbackURL"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "absoluteString"));
    v10 = objc_msgSend(v25, "isEqualToString:", v9);

    if ((v10 & 1) != 0)
    {
      v7 = 1;
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[VMMessageTranscriptViewModel positiveFeedbackURL](VMMessageTranscriptViewModel, "positiveFeedbackURL"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "absoluteString"));
      v13 = objc_msgSend(v25, "isEqualToString:", v12);

      if (v13)
        v7 = 2;
      else
        v7 = 0;
    }
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageTranscriptView delegate](self, "delegate"));
  v15 = objc_opt_respondsToSelector(v14, "messageTranscriptView:didReportFeedback:");

  if ((v15 & 1) != 0)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageTranscriptView delegate](self, "delegate"));
    objc_msgSend(v16, "messageTranscriptView:didReportFeedback:", self, v7);

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageTranscriptView feedbackTextView](self, "feedbackTextView"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "attributedText"));
  v19 = objc_msgSend(v18, "mutableCopy");

  v20 = objc_msgSend(v19, "length");
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("VOICEMAILUI_MESSAGE_TRANSCRIPT_VIEW_FEEDBACK_REPORTED"), &stru_10007F010, CFSTR("VoicemailUI")));
  objc_msgSend(v19, "replaceCharactersInRange:withString:", 0, v20, v22);

  objc_msgSend(v19, "removeAttribute:range:", NSLinkAttributeName, 0, objc_msgSend(v19, "length"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageTranscriptView feedbackTextView](self, "feedbackTextView"));
  objc_msgSend(v23, "setAttributedText:", v19);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageTranscriptView feedbackTextView](self, "feedbackTextView"));
  objc_msgSend(v24, "sizeToFit");

}

- (double)indicatorViewTopLayoutConstraintConstant
{
  return 30.0;
}

- (double)textViewFirstBaselineLayoutConstraintConstant
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont voicemailHeadlineShortFont](UIFont, "voicemailHeadlineShortFont"));
  objc_msgSend(v2, "_scaledValueForValue:", 24.0);
  v4 = ceil(v3);

  return v4;
}

- (double)textViewLastBaselineLayoutConstraintConstant
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont telephonyUIBodyShortFont](UIFont, "telephonyUIBodyShortFont"));
  objc_msgSend(v2, "_scaledValueForValue:", 20.0);
  v4 = ceil(v3);

  return v4;
}

- (double)textViewLineHeight
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont telephonyUIBodyShortFont](UIFont, "telephonyUIBodyShortFont"));
  objc_msgSend(v2, "_scaledValueForValue:", 22.0);
  v4 = ceil(v3);

  return v4;
}

- (double)titleLabelFirstBaselineLayoutConstraintConstant
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont voicemailCaptionRegularFont](UIFont, "voicemailCaptionRegularFont"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "fontDescriptor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", UIFontDescriptorTextStyleAttribute));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontMetrics metricsForTextStyle:](UIFontMetrics, "metricsForTextStyle:", v4));
    objc_msgSend(v5, "scaledValueForValue:", 24.0);
    v7 = v6;

  }
  else
  {
    v7 = 24.0;
  }

  return v7;
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  -[VMMessageTranscriptView openFeedbackURL:](self, "openFeedbackURL:", a4);
  return 0;
}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VMMessageTranscriptView;
  -[VMMessageTranscriptView tintColorDidChange](&v3, "tintColorDidChange");
  -[VMMessageTranscriptView _refreshAttributedText](self, "_refreshAttributedText");
}

- (void)_refreshAttributedText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageTranscriptView viewModel](self, "viewModel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedAttributedFeedbackText"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageTranscriptView feedbackTextView](self, "feedbackTextView"));
  objc_msgSend(v5, "setAttributedText:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageTranscriptView viewModel](self, "viewModel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedAttributedText"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageTranscriptView textView](self, "textView"));
  objc_msgSend(v8, "setAttributedText:", v7);

  v11 = (id)objc_claimAutoreleasedReturnValue(-[VMMessageTranscriptView viewModel](self, "viewModel"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedAttributedTitle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageTranscriptView titleLabel](self, "titleLabel"));
  objc_msgSend(v10, "setAttributedText:", v9);

}

- (VMMessageTranscriptViewDelegate)delegate
{
  return (VMMessageTranscriptViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (VMMessageTranscriptViewModel)viewModel
{
  return self->_viewModel;
}

- (UITextView)feedbackTextView
{
  return self->_feedbackTextView;
}

- (void)setFeedbackTextView:(id)a3
{
  objc_storeStrong((id *)&self->_feedbackTextView, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UITextView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
  objc_storeStrong((id *)&self->_textView, a3);
}

- (BOOL)hideAccessoryViews
{
  return self->_hideAccessoryViews;
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (UIActivityIndicatorView)indicatorView
{
  return self->_indicatorView;
}

- (void)setIndicatorView:(id)a3
{
  objc_storeStrong((id *)&self->_indicatorView, a3);
}

- (NSLayoutConstraint)feedbackTextViewTopLayoutConstraint
{
  return self->_feedbackTextViewTopLayoutConstraint;
}

- (void)setFeedbackTextViewTopLayoutConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_feedbackTextViewTopLayoutConstraint, a3);
}

- (NSLayoutConstraint)feedbackTextViewBottomLayoutConstraint
{
  return self->_feedbackTextViewBottomLayoutConstraint;
}

- (void)setFeedbackTextViewBottomLayoutConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_feedbackTextViewBottomLayoutConstraint, a3);
}

- (NSLayoutConstraint)feedbackTextViewLeadingLayoutConstraint
{
  return self->_feedbackTextViewLeadingLayoutConstraint;
}

- (void)setFeedbackTextViewLeadingLayoutConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_feedbackTextViewLeadingLayoutConstraint, a3);
}

- (NSLayoutConstraint)feedbackTextViewTrailingLayoutConstraint
{
  return self->_feedbackTextViewTrailingLayoutConstraint;
}

- (void)setFeedbackTextViewTrailingLayoutConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_feedbackTextViewTrailingLayoutConstraint, a3);
}

- (NSLayoutConstraint)indicatorViewCenterXLayoutConstraint
{
  return self->_indicatorViewCenterXLayoutConstraint;
}

- (void)setIndicatorViewCenterXLayoutConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_indicatorViewCenterXLayoutConstraint, a3);
}

- (NSLayoutConstraint)indicatorViewTopLayoutConstraint
{
  return self->_indicatorViewTopLayoutConstraint;
}

- (void)setIndicatorViewTopLayoutConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_indicatorViewTopLayoutConstraint, a3);
}

- (NSLayoutConstraint)titleLabelTopLayoutConstraint
{
  return self->_titleLabelTopLayoutConstraint;
}

- (void)setTitleLabelTopLayoutConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabelTopLayoutConstraint, a3);
}

- (NSLayoutConstraint)titleLabelFirstBaselineLayoutConstraint
{
  return self->_titleLabelFirstBaselineLayoutConstraint;
}

- (void)setTitleLabelFirstBaselineLayoutConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabelFirstBaselineLayoutConstraint, a3);
}

- (NSLayoutConstraint)titleLabelLastBaselineLayoutConstraint
{
  return self->_titleLabelLastBaselineLayoutConstraint;
}

- (void)setTitleLabelLastBaselineLayoutConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabelLastBaselineLayoutConstraint, a3);
}

- (NSLayoutConstraint)titleLabelLeadingLayoutConstraint
{
  return self->_titleLabelLeadingLayoutConstraint;
}

- (void)setTitleLabelLeadingLayoutConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabelLeadingLayoutConstraint, a3);
}

- (NSLayoutConstraint)titleLabelTrailingLayoutConstraint
{
  return self->_titleLabelTrailingLayoutConstraint;
}

- (void)setTitleLabelTrailingLayoutConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabelTrailingLayoutConstraint, a3);
}

- (NSLayoutConstraint)textViewFirstBaselineLayoutConstraint
{
  return self->_textViewFirstBaselineLayoutConstraint;
}

- (void)setTextViewFirstBaselineLayoutConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_textViewFirstBaselineLayoutConstraint, a3);
}

- (NSLayoutConstraint)textViewLastBaselineLayoutConstraint
{
  return self->_textViewLastBaselineLayoutConstraint;
}

- (void)setTextViewLastBaselineLayoutConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_textViewLastBaselineLayoutConstraint, a3);
}

- (NSLayoutConstraint)textViewLeadingLayoutConstraint
{
  return self->_textViewLeadingLayoutConstraint;
}

- (void)setTextViewLeadingLayoutConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_textViewLeadingLayoutConstraint, a3);
}

- (NSLayoutConstraint)textViewTrailingLayoutConstraint
{
  return self->_textViewTrailingLayoutConstraint;
}

- (void)setTextViewTrailingLayoutConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_textViewTrailingLayoutConstraint, a3);
}

- (NSLayoutConstraint)textViewFirstBaselineWithoutAccessoryViewsLayoutConstraint
{
  return self->_textViewFirstBaselineWithoutAccessoryViewsLayoutConstraint;
}

- (void)setTextViewFirstBaselineWithoutAccessoryViewsLayoutConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_textViewFirstBaselineWithoutAccessoryViewsLayoutConstraint, a3);
}

- (NSLayoutConstraint)textViewBottomLayoutConstraint
{
  return self->_textViewBottomLayoutConstraint;
}

- (void)setTextViewBottomLayoutConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_textViewBottomLayoutConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textViewBottomLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_textViewFirstBaselineWithoutAccessoryViewsLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_textViewTrailingLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_textViewLeadingLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_textViewLastBaselineLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_textViewFirstBaselineLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_titleLabelTrailingLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_titleLabelLeadingLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_titleLabelLastBaselineLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_titleLabelFirstBaselineLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_titleLabelTopLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_indicatorViewTopLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_indicatorViewCenterXLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_feedbackTextViewTrailingLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_feedbackTextViewLeadingLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_feedbackTextViewBottomLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_feedbackTextViewTopLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_indicatorView, 0);
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_feedbackTextView, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
