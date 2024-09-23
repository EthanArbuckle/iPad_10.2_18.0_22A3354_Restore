@implementation PhotosTCCNotificationExtensionViewController

- (void)viewDidLoad
{
  UIView *v3;
  UIView *photoContainer;
  UIView *v5;
  UIView *v6;
  UIView *labelContainer;
  UIView *v8;
  UILabel *v9;
  void *v10;
  UILabel *countsLabel;
  UILabel *v12;
  UILabel *v13;
  void *v14;
  UILabel *accessLabel;
  UILabel *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  UILabel *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  UIView *v39;
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
  void *v51;
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
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  objc_super v69;
  _QWORD v70[13];

  v69.receiver = self;
  v69.super_class = (Class)PhotosTCCNotificationExtensionViewController;
  -[PhotosTCCNotificationExtensionViewController viewDidLoad](&v69, "viewDidLoad");
  -[PhotosTCCNotificationExtensionViewController setPreferredContentSize:](self, "setPreferredContentSize:", 270.0, 400.0);
  v3 = (UIView *)objc_alloc_init((Class)UIView);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  photoContainer = self->_photoContainer;
  self->_photoContainer = v3;
  v5 = v3;

  v6 = (UIView *)objc_alloc_init((Class)UIView);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  labelContainer = self->_labelContainer;
  self->_labelContainer = v6;
  v8 = v6;

  v9 = (UILabel *)objc_alloc_init((Class)UILabel);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setNumberOfLines:](v9, "setNumberOfLines:", 0);
  v68 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", UIFontTextStyleFootnote, 32770, 0));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v68, 0.0));
  -[UILabel setFont:](v9, "setFont:", v10);

  -[UILabel setTextAlignment:](v9, "setTextAlignment:", 1);
  countsLabel = self->_countsLabel;
  self->_countsLabel = v9;
  v12 = v9;

  v13 = (UILabel *)objc_alloc_init((Class)UILabel);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setNumberOfLines:](v13, "setNumberOfLines:", 0);
  v67 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", UIFontTextStyleFootnote, 0x8000, 0));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v67, 0.0));
  -[UILabel setFont:](v13, "setFont:", v14);

  -[UILabel setTextAlignment:](v13, "setTextAlignment:", 1);
  accessLabel = self->_accessLabel;
  self->_accessLabel = v13;
  v16 = v13;

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosTCCNotificationExtensionViewController view](self, "view"));
  objc_msgSend(v17, "addSubview:", v5);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosTCCNotificationExtensionViewController view](self, "view"));
  objc_msgSend(v18, "addSubview:", v8);

  -[UIView addSubview:](v8, "addSubview:", v12);
  -[UIView addSubview:](v8, "addSubview:", v16);
  v65 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v5, "topAnchor"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosTCCNotificationExtensionViewController view](self, "view"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "topAnchor"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "constraintEqualToAnchor:", v64));
  v70[0] = v63;
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v5, "leadingAnchor"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosTCCNotificationExtensionViewController view](self, "view"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "leadingAnchor"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "constraintEqualToAnchor:", v60));
  v70[1] = v59;
  v39 = v5;
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](v5, "widthAnchor"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosTCCNotificationExtensionViewController view](self, "view"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "widthAnchor"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "constraintEqualToAnchor:", v56));
  v70[2] = v55;
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v8, "topAnchor"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v5, "bottomAnchor"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "constraintEqualToAnchor:", v53));
  v70[3] = v52;
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v8, "leadingAnchor"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosTCCNotificationExtensionViewController view](self, "view"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "leadingAnchor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "constraintEqualToAnchor:", v49));
  v70[4] = v48;
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v8, "trailingAnchor"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosTCCNotificationExtensionViewController view](self, "view"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "trailingAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "constraintEqualToAnchor:constant:", v45, -8.0));
  v70[5] = v44;
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v8, "bottomAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosTCCNotificationExtensionViewController view](self, "view"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "bottomAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:", v41));
  v70[6] = v40;
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v12, "leadingAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v8, "leadingAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:constant:", v37, 8.0));
  v70[7] = v36;
  v27 = v12;
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v12, "trailingAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v8, "trailingAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:", v34));
  v70[8] = v33;
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v16, "topAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v12, "bottomAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v31, 1.0));
  v70[9] = v30;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v16, "leadingAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v8, "leadingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:constant:", v28, 8.0));
  v70[10] = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v16, "trailingAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v8, "trailingAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:constant:", v21, -8.0));
  v70[11] = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v8, "bottomAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v16, "bottomAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v24, 2.5));
  v70[12] = v25;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v70, 13));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v26);

}

- (void)configureWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  os_signpost_id_t v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  NSObject *v40;
  NSObject *v41;
  os_signpost_id_t v42;
  NSObject *v43;
  NSObject *v44;
  void *v45;
  NSObject *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  double v59;
  double v60;
  void *v61;
  double v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void (**v76)(_QWORD);
  uint8_t buf[8];
  _QWORD v78[3];

  v76 = (void (**)(_QWORD))a3;
  v4 = objc_msgSend((id)objc_opt_class(self), "_log");
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosTCCNotificationExtensionViewController extensionContext](self, "extensionContext"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "inputItems"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));

  v9 = objc_opt_class(NSExtensionItem);
  if (v9 && (objc_opt_isKindOfClass(v8, v9) & 1) != 0)
    v10 = v8;
  else
    v10 = 0;

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "userInfo"));
  v12 = kTCCNotificationExtensionDaemonDataKey;
  v13 = kTCCNotificationExtensionDaemonDataInitialPromptKey;
  v14 = kTCCNotificationExtensionDaemonDataSetPromptKey;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v12));
  v71 = v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", v14));

  v73 = v12;
  v74 = v11;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v12));
  v72 = v13;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", v13));

  v70 = v16;
  if (v16)
    v19 = objc_msgSend(v16, "BOOLValue") ^ 1;
  else
    v19 = 1;
  v75 = v10;
  if (v18)
    v20 = objc_msgSend(v18, "BOOLValue") ^ 1;
  else
    v20 = 0;
  v69 = v18;
  if (v19)
    v21 = v20;
  else
    v21 = 2;
  v22 = os_signpost_id_generate(v5);
  v23 = v5;
  v24 = v23;
  if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v24, OS_SIGNPOST_INTERVAL_BEGIN, v22, "PhotosTCCNotificationExtensionCounts", (const char *)&unk_100003DE7, buf, 2u);
  }

  v25 = PXTCCPromptCountTitle(v21);
  v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosTCCNotificationExtensionViewController countsLabel](self, "countsLabel"));
  objc_msgSend(v27, "setText:", v26);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosTCCNotificationExtensionViewController countsLabel](self, "countsLabel"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "text"));
  v30 = objc_msgSend(v29, "length");

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosTCCNotificationExtensionViewController countsLabel](self, "countsLabel"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "topAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosTCCNotificationExtensionViewController labelContainer](self, "labelContainer"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "topAnchor"));
  if (v30)
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v34, 1.5));
  else
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:constant:", v34, 0.0));
  v36 = v35;
  objc_msgSend(v35, "setActive:", 1);

  v37 = PXTCCPromptCountSubtitle(v21);
  v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosTCCNotificationExtensionViewController accessLabel](self, "accessLabel"));
  objc_msgSend(v39, "setText:", v38);

  v40 = v24;
  v41 = v40;
  if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v41, OS_SIGNPOST_INTERVAL_END, v22, "PhotosTCCNotificationExtensionCounts", (const char *)&unk_100003DE7, buf, 2u);
  }

  v42 = os_signpost_id_generate(v41);
  v43 = v41;
  v44 = v43;
  if (v42 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v43))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v44, OS_SIGNPOST_INTERVAL_BEGIN, v42, "PhotosTCCNotificationExtensionPhotoGrid", (const char *)&unk_100003DE7, buf, 2u);
  }

  -[PhotosTCCNotificationExtensionViewController preferredContentSize](self, "preferredContentSize");
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[PXTCCPhotoGridView photoGridViewForAlertPromptWithWidth:](PXTCCPhotoGridView, "photoGridViewForAlertPromptWithWidth:"));
  v46 = v44;
  v47 = v46;
  if (v42 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v46))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v47, OS_SIGNPOST_INTERVAL_END, v42, "PhotosTCCNotificationExtensionPhotoGrid", (const char *)&unk_100003DE7, buf, 2u);
  }

  if (v45)
  {
    objc_msgSend(v45, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosTCCNotificationExtensionViewController photoContainer](self, "photoContainer"));
    objc_msgSend(v48, "addSubview:", v45);

    v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "topAnchor"));
    v68 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosTCCNotificationExtensionViewController photoContainer](self, "photoContainer"));
    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "topAnchor"));
    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "constraintEqualToAnchor:", v66));
    v78[0] = v65;
    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "leadingAnchor"));
    v64 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosTCCNotificationExtensionViewController photoContainer](self, "photoContainer"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "leadingAnchor"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "constraintEqualToAnchor:", v49));
    v78[1] = v50;
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "trailingAnchor"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosTCCNotificationExtensionViewController photoContainer](self, "photoContainer"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "trailingAnchor"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "constraintEqualToAnchor:", v53));
    v78[2] = v54;
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v78, 3));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v55);

  }
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosTCCNotificationExtensionViewController countsLabel](self, "countsLabel"));
  objc_msgSend(v56, "sizeToFit");

  v57 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosTCCNotificationExtensionViewController accessLabel](self, "accessLabel"));
  objc_msgSend(v57, "sizeToFit");

  v58 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosTCCNotificationExtensionViewController labelContainer](self, "labelContainer"));
  objc_msgSend(v58, "layoutIfNeeded");

  objc_msgSend(v45, "frame");
  v60 = v59;
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosTCCNotificationExtensionViewController labelContainer](self, "labelContainer"));
  objc_msgSend(v61, "frame");
  -[PhotosTCCNotificationExtensionViewController setPreferredContentSize:](self, "setPreferredContentSize:", 270.0, v60 + v62);

  v76[2](v76);
}

- (UIView)photoContainer
{
  return self->_photoContainer;
}

- (void)setPhotoContainer:(id)a3
{
  objc_storeStrong((id *)&self->_photoContainer, a3);
}

- (UIView)labelContainer
{
  return self->_labelContainer;
}

- (void)setLabelContainer:(id)a3
{
  objc_storeStrong((id *)&self->_labelContainer, a3);
}

- (UILabel)countsLabel
{
  return self->_countsLabel;
}

- (void)setCountsLabel:(id)a3
{
  objc_storeStrong((id *)&self->_countsLabel, a3);
}

- (UILabel)accessLabel
{
  return self->_accessLabel;
}

- (void)setAccessLabel:(id)a3
{
  objc_storeStrong((id *)&self->_accessLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessLabel, 0);
  objc_storeStrong((id *)&self->_countsLabel, 0);
  objc_storeStrong((id *)&self->_labelContainer, 0);
  objc_storeStrong((id *)&self->_photoContainer, 0);
}

+ (id)_log
{
  if (qword_100008788 != -1)
    dispatch_once(&qword_100008788, &stru_1000041A0);
  return (id)qword_100008780;
}

@end
