@implementation PHCarPlayInCallButton

- (id)initForButtonType:(int)a3 callState:(int64_t)a4
{
  PHCarPlayInCallButton *v6;
  PHCarPlayInCallButton *v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  uint64_t v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  __CFString *v32;
  __CFString *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  __CFString *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  const __CFString *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  objc_super v98;
  void *v99;

  v98.receiver = self;
  v98.super_class = (Class)PHCarPlayInCallButton;
  v6 = -[PHCarPlayInCallButton initWithFrame:](&v98, "initWithFrame:", 0.0, 0.0, 115.0, 130.0);
  v7 = v6;
  if (!v6)
    return v7;
  v6->_callState = a4;
  v6->_inCallButtonType = a3;
  -[PHCarPlayInCallButton intrinsicContentSize](v6, "intrinsicContentSize");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v7, 7, 0, 0, 0, 1.0, v8));
  -[PHCarPlayInCallButton addConstraint:](v7, "addConstraint:", v9);

  LODWORD(v10) = 1148846080;
  -[PHCarPlayInCallButton setContentCompressionResistancePriority:forAxis:](v7, "setContentCompressionResistancePriority:forAxis:", 0, v10);
  LODWORD(v11) = 1132068864;
  -[PHCarPlayInCallButton setContentHuggingPriority:forAxis:](v7, "setContentHuggingPriority:forAxis:", 0, v11);
  -[PHCarPlayInCallButton setClipsToBounds:](v7, "setClipsToBounds:", 0);
  -[PHCarPlayInCallButton setSpecialLayoutType:](v7, "setSpecialLayoutType:", 0);
  -[PHCarPlayInCallButton setAdjustsImageWhenDisabled:](v7, "setAdjustsImageWhenDisabled:", 1);
  -[PHCarPlayInCallButton setAdjustsImageWhenHighlighted:](v7, "setAdjustsImageWhenHighlighted:", 0);
  v12 = objc_alloc_init((Class)UILabel);
  objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v12, "setTextAlignment:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor dynamicCarPrimaryColor](UIColor, "dynamicCarPrimaryColor"));
  objc_msgSend(v12, "setTextColor:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v12, "setBackgroundColor:", v14);

  objc_msgSend(v12, "setOpaque:", 0);
  objc_msgSend(v12, "setText:", &stru_10028DC20);
  objc_msgSend(v12, "setLineBreakMode:", 0);
  objc_msgSend(v12, "setNumberOfLines:", 0);
  objc_msgSend(v12, "setUserInteractionEnabled:", 0);
  objc_msgSend(v12, "setAdjustsFontSizeToFitWidth:", 1);
  -[PHCarPlayInCallButton addSubview:](v7, "addSubview:", v12);
  -[PHCarPlayInCallButton setButtonLabel:](v7, "setButtonLabel:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  -[PHCarPlayInCallButton setTintColor:](v7, "setTintColor:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallButton buttonLabel](v7, "buttonLabel"));
  LODWORD(v17) = 1132068864;
  objc_msgSend(v16, "setContentCompressionResistancePriority:forAxis:", 0, v17);

  if (a3 > 0x12)
    goto LABEL_7;
  v18 = 10.0;
  if (((1 << a3) & 0x1E000) != 0)
  {
    v20 = 0.0;
    v21 = 20.0;
    v19 = 1;
    goto LABEL_8;
  }
  if (((1 << a3) & 0x41C00) == 0)
  {
LABEL_7:
    v20 = 0.0;
    v21 = 20.0;
    v19 = 1;
    v18 = 12.0;
    goto LABEL_8;
  }
  v19 = 0;
  v20 = -20.0;
  v21 = 0.0;
LABEL_8:
  -[PHCarPlayInCallButton setImageEdgeInsets:](v7, "setImageEdgeInsets:", v20, 0.0, v21, 0.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", v18));
  objc_msgSend(v12, "setFont:", v22);

  -[PHCarPlayInCallButton setHasRingView:](v7, "setHasRingView:", v19);
  switch(a3)
  {
    case 0:
      if (a4 == 1)
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage phCarPlayImageNamed:inBundle:](UIImage, "phCarPlayImageNamed:inBundle:", CFSTR("carplay_incall_button_end_voip"), v23));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "imageWithRenderingMode:", 2));

      }
      else
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallButton carPlayInCallImageForSymbolType:](v7, "carPlayInCallImageForSymbolType:", 2));
      }
      -[PHCarPlayInCallButton setImage:forState:](v7, "setImage:forState:", v25, 0);
      v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v55 = v69;
      v70 = CFSTR("CARPLAY_END_BUTTON");
      goto LABEL_51;
    case 1:
      v43 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallButton carPlayInCallImageForSymbolType:](v7, "carPlayInCallImageForSymbolType:", 21));
      -[PHCarPlayInCallButton setImage:forState:](v7, "setImage:forState:", v43, 0);

      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v25 = v27;
      v28 = CFSTR("CARPLAY_MUTE_BUTTON");
      goto LABEL_34;
    case 2:
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallButton carPlayInCallImageForSymbolType:](v7, "carPlayInCallImageForSymbolType:", 18));
      -[PHCarPlayInCallButton setImage:forState:](v7, "setImage:forState:", v26, 0);

      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v25 = v27;
      v28 = CFSTR("CARPLAY_KEYPAD_BUTTON");
      goto LABEL_34;
    case 3:
      v44 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallButton carPlayInCallImageForSymbolType:](v7, "carPlayInCallImageForSymbolType:", 16));
      -[PHCarPlayInCallButton setImage:forState:](v7, "setImage:forState:", v44, 0);

      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v25 = v27;
      v28 = CFSTR("CARPLAY_ADD_CALL_BUTTON");
      goto LABEL_34;
    case 4:
      if (a4 == 1)
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage phCarPlayImageNamed:inBundle:](UIImage, "phCarPlayImageNamed:inBundle:", CFSTR("carplay_incall_button_decline_glyph_voip"), v29));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "imageWithRenderingMode:", 2));

      }
      else
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallButton carPlayInCallImageForSymbolType:](v7, "carPlayInCallImageForSymbolType:", 2));
      }
      -[PHCarPlayInCallButton setImage:forState:](v7, "setImage:forState:", v25, 0);
      v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v55 = v69;
      v70 = CFSTR("CARPLAY_DECLINE_BUTTON");
      goto LABEL_51;
    case 5:
      v45 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallButton carPlayInCallImageForSymbolType:](v7, "carPlayInCallImageForSymbolType:", 19));
      -[PHCarPlayInCallButton setImage:forState:](v7, "setImage:forState:", v45, 0);

      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v25 = v27;
      v28 = CFSTR("CARPLAY_MERGE_CALLS_BUTTON");
      goto LABEL_34;
    case 6:
      v46 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallButton carPlayInCallImageForSymbolType:](v7, "carPlayInCallImageForSymbolType:", 20));
      -[PHCarPlayInCallButton setImage:forState:](v7, "setImage:forState:", v46, 0);

      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v25 = v27;
      v28 = CFSTR("CARPLAY_SWAP_BUTTON");
      goto LABEL_34;
    case 7:
      v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v48 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage phCarPlayImageNamed:inBundle:](UIImage, "phCarPlayImageNamed:inBundle:", CFSTR("carplay_incall_button_split"), v47));
      -[PHCarPlayInCallButton setImage:forState:](v7, "setImage:forState:", v48, 0);

      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v25 = v27;
      v28 = CFSTR("CARPLAY_SPLIT_BUTTON");
      goto LABEL_34;
    case 8:
      if (a4 == 1)
      {
        v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v50 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage phCarPlayImageNamed:inBundle:](UIImage, "phCarPlayImageNamed:inBundle:", CFSTR("carplay_incall_button_answer_glyph_voip"), v49));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "imageWithRenderingMode:", 2));

      }
      else
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallButton carPlayInCallImageForSymbolType:](v7, "carPlayInCallImageForSymbolType:", 1));
      }
      -[PHCarPlayInCallButton setImage:forState:](v7, "setImage:forState:", v25, 0);
      v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v55 = v69;
      v70 = CFSTR("CARPLAY_ANSWER_BUTTON");
      goto LABEL_51;
    case 9:
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallButton carPlayInCallImageForSymbolType:](v7, "carPlayInCallImageForSymbolType:", 13));
      -[PHCarPlayInCallButton setImage:forState:](v7, "setImage:forState:", v31, 0);

      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v25 = v27;
      v28 = CFSTR("CARPLAY_DECLINE_WITH_MESSAGE");
      goto LABEL_34;
    case 10:
      if ((unint64_t)(a4 - 1) > 3)
        v51 = 0;
      else
        v51 = off_1002853E8[a4 - 1];
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_selected"), v51));
      v83 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v84 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage phCarPlayImageNamed:inBundle:](UIImage, "phCarPlayImageNamed:inBundle:", v51, v83));
      -[PHCarPlayInCallButton setImage:forState:](v7, "setImage:forState:", v84, 0);

      v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v86 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage phCarPlayImageNamed:inBundle:](UIImage, "phCarPlayImageNamed:inBundle:", v25, v85));
      -[PHCarPlayInCallButton setImage:forState:](v7, "setImage:forState:", v86, 8);

      v87 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v88 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage phCarPlayImageNamed:inBundle:](UIImage, "phCarPlayImageNamed:inBundle:", v25, v87));
      -[PHCarPlayInCallButton setImage:forState:](v7, "setImage:forState:", v88, 4);

      v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v55 = v69;
      v70 = CFSTR("CARPLAY_END_CALL_AND_ANSWER_BUTTON");
      goto LABEL_51;
    case 11:
      if ((unint64_t)(a4 - 1) > 3)
        v32 = 0;
      else
        v32 = off_100285408[a4 - 1];
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_selected"), v32));
      v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v72 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage phCarPlayImageNamed:inBundle:](UIImage, "phCarPlayImageNamed:inBundle:", v32, v71));
      -[PHCarPlayInCallButton setImage:forState:](v7, "setImage:forState:", v72, 0);

      v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v74 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage phCarPlayImageNamed:inBundle:](UIImage, "phCarPlayImageNamed:inBundle:", v25, v73));
      -[PHCarPlayInCallButton setImage:forState:](v7, "setImage:forState:", v74, 8);

      v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v76 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage phCarPlayImageNamed:inBundle:](UIImage, "phCarPlayImageNamed:inBundle:", v25, v75));
      -[PHCarPlayInCallButton setImage:forState:](v7, "setImage:forState:", v76, 4);

      v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v55 = v69;
      v70 = CFSTR("CARPLAY_HOLD_CALL_AND_ANSWER_BUTTON");
      goto LABEL_51;
    case 12:
      if ((unint64_t)(a4 - 1) > 3)
        v33 = 0;
      else
        v33 = off_100285428[a4 - 1];
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_selected"), v33));
      v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v78 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage phCarPlayImageNamed:inBundle:](UIImage, "phCarPlayImageNamed:inBundle:", v33, v77));
      -[PHCarPlayInCallButton setImage:forState:](v7, "setImage:forState:", v78, 0);

      v79 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v80 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage phCarPlayImageNamed:inBundle:](UIImage, "phCarPlayImageNamed:inBundle:", v25, v79));
      -[PHCarPlayInCallButton setImage:forState:](v7, "setImage:forState:", v80, 8);

      v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v82 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage phCarPlayImageNamed:inBundle:](UIImage, "phCarPlayImageNamed:inBundle:", v25, v81));
      -[PHCarPlayInCallButton setImage:forState:](v7, "setImage:forState:", v82, 4);

      v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v55 = v69;
      v70 = CFSTR("CARPLAY_END_HOLD_CALL_AND_ANSWER_BUTTON");
      goto LABEL_51;
    case 13:
      switch(a4)
      {
        case 1:
        case 3:
          v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v53 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage phCarPlayImageNamed:inBundle:](UIImage, "phCarPlayImageNamed:inBundle:", CFSTR("carplay_incall_button_decline_glyph_voip"), v52));
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "imageWithRenderingMode:", 2));

          break;
        case 2:
        case 4:
          v25 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallButton carPlayInCallImageForSymbolType:](v7, "carPlayInCallImageForSymbolType:", 2));
          break;
        default:
          v25 = 0;
          break;
      }
      v89 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
      v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "_flatImageWithColor:", v89));
      -[PHCarPlayInCallButton setImage:forState:](v7, "setImage:forState:", v90, 0);

      v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v55 = v69;
      v70 = CFSTR("CARPLAY_IGNORE_BUTTON");
LABEL_51:
      v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "localizedStringForKey:value:table:", v70, &stru_10028DC20, CFSTR("PHCarPlay")));
      v91 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallButton buttonLabel](v7, "buttonLabel"));
      objc_msgSend(v91, "setText:", v56);

      goto LABEL_52;
    case 14:
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallButton carPlayInCallImageForSymbolType:](v7, "carPlayInCallImageForSymbolType:", 1));
      -[PHCarPlayInCallButton setImage:forState:](v7, "setImage:forState:", v34, 0);

      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v25 = v27;
      v28 = CFSTR("CARPLAY_CALL_BACK_BUTTON");
      goto LABEL_34;
    case 15:
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage phCarPlayImageNamed:inBundle:](UIImage, "phCarPlayImageNamed:inBundle:", CFSTR("carplay_incall_button_decline"), v35));
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "_flatImageWithColor:", v37));
      -[PHCarPlayInCallButton setImage:forState:](v7, "setImage:forState:", v38, 0);

      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v25 = v27;
      v28 = CFSTR("CARPLAY_CANCEL_BUTTON");
      goto LABEL_34;
    case 16:
      v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage phCarPlayImageNamed:inBundle:](UIImage, "phCarPlayImageNamed:inBundle:", CFSTR("carplay_incall_button_decline_to_voicemail"), v39));
      v41 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor externalSystemRedColor](UIColor, "externalSystemRedColor"));
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "_flatImageWithColor:", v41));
      -[PHCarPlayInCallButton setImage:forState:](v7, "setImage:forState:", v42, 0);

      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v25 = v27;
      v28 = CFSTR("CARPLAY_SEND_TO_VOICEMAIL");
      goto LABEL_34;
    case 17:
      v54 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallButton carPlayInCallImageForSymbolType:](v7, "carPlayInCallImageForSymbolType:", 25));
      -[PHCarPlayInCallButton setImage:forState:](v7, "setImage:forState:", v54, 0);

      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v25 = v27;
      v28 = CFSTR("CARPLAY_HOLD_BUTTON");
LABEL_34:
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "localizedStringForKey:value:table:", v28, &stru_10028DC20, CFSTR("PHCarPlay")));
      v56 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallButton buttonLabel](v7, "buttonLabel"));
      objc_msgSend(v56, "setText:", v55);
LABEL_52:

      goto LABEL_53;
    case 18:
      v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v58 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage phCarPlayImageNamed:inBundle:](UIImage, "phCarPlayImageNamed:inBundle:", CFSTR("text_sos_icon_CarPlay"), v57));
      -[PHCarPlayInCallButton setImage:forState:](v7, "setImage:forState:", v58, 0);

      v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "localizedStringForKey:value:table:", CFSTR("ALERT_ACTION_TEXT_BUTTON_LABEL"), &stru_10028DC20, CFSTR("Localizable-Stewie")));
      v61 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallButton buttonLabel](v7, "buttonLabel"));
      objc_msgSend(v61, "setText:", v60);

      v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v63 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage phCarPlayImageNamed:inBundle:](UIImage, "phCarPlayImageNamed:inBundle:", CFSTR("text_sos_icon_CarPlay_Focus_Ring"), v62));

      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "imageWithRenderingMode:", 2));
      v64 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v25);
      -[PHCarPlayInCallButton setSpecialRingView:](v7, "setSpecialRingView:", v64);

      v65 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor dynamicCarFocusedColor](UIColor, "dynamicCarFocusedColor"));
      v66 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallButton specialRingView](v7, "specialRingView"));
      objc_msgSend(v66, "setTintColor:", v65);

      v67 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallButton specialRingView](v7, "specialRingView"));
      objc_msgSend(v67, "setUserInteractionEnabled:", 0);

      v68 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallButton specialRingView](v7, "specialRingView"));
      objc_msgSend(v68, "setHidden:", 1);

      v55 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallButton specialRingView](v7, "specialRingView"));
      -[PHCarPlayInCallButton addSubview:](v7, "addSubview:", v55);
LABEL_53:

      break;
    default:
      break;
  }
  v92 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallButton buttonLabel](v7, "buttonLabel"));
  v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "text"));

  if (v93)
  {
    v94 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallButton buttonLabel](v7, "buttonLabel"));
    v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "text"));
    v99 = v95;
    v96 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v99, 1));
    -[PHCarPlayInCallButton setAccessibilityUserInputLabels:](v7, "setAccessibilityUserInputLabels:", v96);

  }
  return v7;
}

- (id)carPlayInCallImageForSymbolType:(int64_t)a3
{
  return +[UIImage tpImageForSymbolType:textStyle:scale:isStaticSize:](UIImage, "tpImageForSymbolType:textStyle:scale:isStaticSize:", a3, UIFontTextStyleCallout, 3, 1);
}

- (CGSize)intrinsicContentSize
{
  unsigned int v2;
  double v3;
  double v5;
  CGSize result;

  v2 = -[PHCarPlayInCallButton inCallButtonType](self, "inCallButtonType");
  v3 = 75.0;
  if (v2 - 8 < 6 || v2 == 4)
  {
    v5 = 104.0;
  }
  else if (v2 == 18)
  {
    v5 = 92.5;
  }
  else
  {
    v5 = 75.0;
    v3 = 75.0;
  }
  result.height = v3;
  result.width = v5;
  return result;
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  objc_super v15;

  v3 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PHCarPlayInCallButton;
  -[PHCarPlayInCallButton setHighlighted:](&v15, "setHighlighted:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallButton ringView](self, "ringView"));
  objc_msgSend(v5, "setHighlighted:", v3);

  -[PHCarPlayInCallButton updateToProperIconColor](self, "updateToProperIconColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallButton unhighlightedBackgroundColor](self, "unhighlightedBackgroundColor"));

  if (v6)
  {
    if (-[PHCarPlayInCallButton isHighlighted](self, "isHighlighted"))
    {
      v13 = 0.0;
      v14 = 0.0;
      v11 = 0.0;
      v12 = 0.0;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallButton unhighlightedBackgroundColor](self, "unhighlightedBackgroundColor"));
      v8 = objc_msgSend(v7, "getHue:saturation:brightness:alpha:", &v14, &v13, &v12, &v11);

      v9 = 0;
      if (!v8)
      {
LABEL_7:
        -[PHCarPlayInCallButton setBackgroundColor:](self, "setBackgroundColor:", v9);

        return;
      }
      v10 = objc_claimAutoreleasedReturnValue(+[UIColor colorWithHue:saturation:brightness:alpha:](UIColor, "colorWithHue:saturation:brightness:alpha:", v14, v13, v12 * 0.7, v11));
    }
    else
    {
      v10 = objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallButton unhighlightedBackgroundColor](self, "unhighlightedBackgroundColor"));
    }
    v9 = (void *)v10;
    goto LABEL_7;
  }
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  objc_super v9;

  v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PHCarPlayInCallButton;
  -[PHCarPlayInCallButton setEnabled:](&v9, "setEnabled:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallButton ringView](self, "ringView"));
  objc_msgSend(v5, "setDimmed:", !v3);

  if (-[PHCarPlayInCallButton isEnabled](self, "isEnabled"))
    v6 = objc_claimAutoreleasedReturnValue(+[UIColor dynamicCarPrimaryColor](UIColor, "dynamicCarPrimaryColor"));
  else
    v6 = objc_claimAutoreleasedReturnValue(+[UIColor lightGrayColor](UIColor, "lightGrayColor"));
  v7 = (void *)v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallButton buttonLabel](self, "buttonLabel"));
  objc_msgSend(v8, "setTextColor:", v7);

}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PHCarPlayInCallButton;
  -[PHCarPlayInCallButton setSelected:](&v7, "setSelected:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallButton ringView](self, "ringView"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallButton ringView](self, "ringView"));
    objc_msgSend(v6, "setSelected:", v3);

    -[PHCarPlayInCallButton updateToProperIconColor](self, "updateToProperIconColor");
  }
}

- (void)setHasRingView:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  PHCarPlayInCallButtonRing *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallButton ringView](self, "ringView"));

  if (v3)
  {
    if (!v5)
    {
      v6 = -[PHCarPlayInCallButtonRing initWithFrame:]([PHCarPlayInCallButtonRing alloc], "initWithFrame:", 0.0, 0.0, 54.0, 54.0);
      -[PHCarPlayInCallButton setRingView:](self, "setRingView:", v6);

      v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallButton ringView](self, "ringView"));
      objc_msgSend(v7, "setUserInteractionEnabled:", 0);

      v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallButton ringView](self, "ringView"));
      objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallButton ringView](self, "ringView"));
      objc_msgSend(v10, "setBackgroundColor:", v9);

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallButton ringView](self, "ringView"));
      objc_msgSend(v11, "setOpaque:", 0);

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallButton ringView](self, "ringView"));
      -[PHCarPlayInCallButton addSubview:](self, "addSubview:", v12);

      switch(-[PHCarPlayInCallButton inCallButtonType](self, "inCallButtonType"))
      {
        case 0:
        case 4:
        case 0xD:
        case 0xF:
          v13 = objc_claimAutoreleasedReturnValue(+[UIColor externalSystemRedColor](UIColor, "externalSystemRedColor"));
          break;
        case 8:
          if ((id)-[PHCarPlayInCallButton callState](self, "callState") != (id)1)
            goto LABEL_10;
          v13 = objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.203921569, 0.470588235, 0.964705882, 1.0));
          break;
        case 0xE:
LABEL_10:
          v13 = objc_claimAutoreleasedReturnValue(+[UIColor externalSystemGreenColor](UIColor, "externalSystemGreenColor"));
          break;
        case 0x10:
          v13 = objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
          break;
        case 0x12:
          v13 = objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
          break;
        default:
          v13 = objc_claimAutoreleasedReturnValue(+[UIColor dynamicCarTertiaryColor](UIColor, "dynamicCarTertiaryColor"));
          break;
      }
      v16 = (id)v13;
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallButton ringView](self, "ringView"));
      objc_msgSend(v15, "setFillColor:", v16);

    }
  }
  else if (v5)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallButton ringView](self, "ringView"));
    objc_msgSend(v14, "removeFromSuperview");

    -[PHCarPlayInCallButton setRingView:](self, "setRingView:", 0);
  }
}

- (void)layoutSubviews
{
  double Width;
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
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  CGFloat v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  objc_super v52;
  CGRect v53;
  CGRect v54;

  v52.receiver = self;
  v52.super_class = (Class)PHCarPlayInCallButton;
  -[PHCarPlayInCallButton layoutSubviews](&v52, "layoutSubviews");
  -[PHCarPlayInCallButton bounds](self, "bounds");
  Width = CGRectGetWidth(v53);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallButton imageView](self, "imageView"));
  objc_msgSend(v4, "sizeThatFits:", Width, 58.0);
  v6 = v5;
  v8 = v7;

  if (-[PHCarPlayInCallButton inCallButtonType](self, "inCallButtonType") == 18)
  {
    v9 = v6 / v8;
    v8 = 54.0;
    v6 = v9 * 54.0;
  }
  v10 = UIRectCenteredIntegralRect(0.0, 0.0, v6, v8, 0.0, 0.0, Width, 58.0);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallButton imageView](self, "imageView"));
  objc_msgSend(v17, "setFrame:", v10, v12, v14, v16);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallButton specialRingView](self, "specialRingView"));
  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallButton specialRingView](self, "specialRingView"));
    objc_msgSend(v19, "sizeThatFits:", Width, 58.0);
    v21 = v20;
    v23 = v22;

    v24 = UIRectCenteredIntegralRect(0.0, 0.0, v21 / v23 * 54.0, 54.0, 0.0, 0.0, Width, 58.0);
    v26 = v25;
    v28 = v27;
    v30 = v29;
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallButton specialRingView](self, "specialRingView"));
    objc_msgSend(v31, "setFrame:", v24, v26, v28, v30);

  }
  -[PHCarPlayInCallButton bounds](self, "bounds");
  v32 = CGRectGetHeight(v54) + -58.0;
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallButton buttonLabel](self, "buttonLabel"));
  objc_msgSend(v33, "sizeThatFits:", Width, v32);
  v35 = v34;

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallButton buttonLabel](self, "buttonLabel"));
  objc_msgSend(v36, "setFrame:", 0.0, 58.0, Width, v35);

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallButton ringView](self, "ringView"));
  if (v37)
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallButton ringView](self, "ringView"));
    -[PHCarPlayInCallButton sendSubviewToBack:](self, "sendSubviewToBack:", v38);

    v39 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallButton ringView](self, "ringView"));
    objc_msgSend(v39, "sizeThatFits:", Width, 58.0);
    v41 = v40;
    v43 = v42;

    v44 = UIRectCenteredIntegralRect(0.0, 0.0, v41, v43, 0.0, 0.0, Width, 58.0);
    v46 = v45;
    v48 = v47;
    v50 = v49;
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallButton ringView](self, "ringView"));
    objc_msgSend(v51, "setFrame:", v44, v46, v48, v50);

  }
}

- (void)updateToProperIconColor
{
  void *v3;
  uint64_t v4;
  id v5;

  if (-[PHCarPlayInCallButton inCallButtonType](self, "inCallButtonType") != 16)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallButton ringView](self, "ringView"));

    if (v3)
    {
      if (-[PHCarPlayInCallButton toggledOn](self, "toggledOn")
        || (-[PHCarPlayInCallButton isHighlighted](self, "isHighlighted") & 1) != 0)
      {
        v4 = objc_claimAutoreleasedReturnValue(+[UIColor tableBackgroundColor](UIColor, "tableBackgroundColor"));
      }
      else
      {
        v4 = objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
      }
      v5 = (id)v4;
      -[PHCarPlayInCallButton setTintColor:](self, "setTintColor:", v4);

    }
  }
}

- (void)setToggledOn:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  if (self->_toggledOn != a3)
  {
    v3 = a3;
    self->_toggledOn = a3;
    if (-[PHCarPlayInCallButton inCallButtonType](self, "inCallButtonType") == 1
      || -[PHCarPlayInCallButton inCallButtonType](self, "inCallButtonType") == 17)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallButton ringView](self, "ringView"));
      objc_msgSend(v5, "setToggledOn:", v3);

      -[PHCarPlayInCallButton updateToProperIconColor](self, "updateToProperIconColor");
    }
  }
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a3;
  v7 = a4;
  if (sub_100037D34(v6))
    -[PHCarPlayInCallButton setHighlighted:](self, "setHighlighted:", 1);
  v8.receiver = self;
  v8.super_class = (Class)PHCarPlayInCallButton;
  -[PHCarPlayInCallButton pressesBegan:withEvent:](&v8, "pressesBegan:withEvent:", v6, v7);

}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a3;
  v7 = a4;
  if (sub_100037D34(v6))
    -[PHCarPlayInCallButton setHighlighted:](self, "setHighlighted:", 0);
  v8.receiver = self;
  v8.super_class = (Class)PHCarPlayInCallButton;
  -[PHCarPlayInCallButton pressesEnded:withEvent:](&v8, "pressesEnded:withEvent:", v6, v7);

}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a3;
  v7 = a4;
  if (sub_100037D34(v6))
    -[PHCarPlayInCallButton setHighlighted:](self, "setHighlighted:", 0);
  v8.receiver = self;
  v8.super_class = (Class)PHCarPlayInCallButton;
  -[PHCarPlayInCallButton pressesCancelled:withEvent:](&v8, "pressesCancelled:withEvent:", v6, v7);

}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  void *v5;
  PHCarPlayInCallButton *v6;
  uint64_t v7;
  void *v8;
  unsigned int v9;
  PHCarPlayInCallButton *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  id v16;

  v16 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallButton ringView](self, "ringView"));

  if (v5)
  {
    v6 = (PHCarPlayInCallButton *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "nextFocusedItem"));
    -[PHCarPlayInCallButton setSelected:](self, "setSelected:", v6 == self);

  }
  v7 = objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallButton specialRingView](self, "specialRingView"));
  if (v7)
  {
    v8 = (void *)v7;
    v9 = -[PHCarPlayInCallButton inCallButtonType](self, "inCallButtonType");

    if (v9 == 18)
    {
      v10 = (PHCarPlayInCallButton *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "nextFocusedItem"));

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallButton specialRingView](self, "specialRingView"));
      v12 = v11;
      if (v10 == self)
      {
        objc_msgSend(v11, "setHidden:", 0);

        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v14 = CFSTR("text_sos_icon_CarPlay_Focused");
      }
      else
      {
        objc_msgSend(v11, "setHidden:", 1);

        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v14 = CFSTR("text_sos_icon_CarPlay");
      }
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage phCarPlayImageNamed:inBundle:](UIImage, "phCarPlayImageNamed:inBundle:", v14, v13));
      -[PHCarPlayInCallButton setImage:forState:](self, "setImage:forState:", v15, 0);

    }
  }

}

- (UILabel)buttonLabel
{
  return (UILabel *)objc_getProperty(self, a2, 24, 1);
}

- (void)setButtonLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSLayoutConstraint)horizontalPositioningConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 32, 1);
}

- (void)setHorizontalPositioningConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (int)inCallButtonType
{
  return self->_inCallButtonType;
}

- (BOOL)toggledOn
{
  return self->_toggledOn;
}

- (int)specialLayoutType
{
  return self->_specialLayoutType;
}

- (void)setSpecialLayoutType:(int)a3
{
  self->_specialLayoutType = a3;
}

- (UIColor)unhighlightedBackgroundColor
{
  return (UIColor *)objc_getProperty(self, a2, 40, 1);
}

- (void)setUnhighlightedBackgroundColor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (PHCarPlayInCallButtonRing)ringView
{
  return (PHCarPlayInCallButtonRing *)objc_getProperty(self, a2, 48, 1);
}

- (void)setRingView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (UIImageView)specialRingView
{
  return (UIImageView *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSpecialRingView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (int64_t)callState
{
  return self->_callState;
}

- (void)setCallState:(int64_t)a3
{
  self->_callState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specialRingView, 0);
  objc_storeStrong((id *)&self->_ringView, 0);
  objc_storeStrong((id *)&self->_unhighlightedBackgroundColor, 0);
  objc_storeStrong((id *)&self->_horizontalPositioningConstraint, 0);
  objc_storeStrong((id *)&self->_buttonLabel, 0);
}

@end
