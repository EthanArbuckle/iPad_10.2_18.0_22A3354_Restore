@implementation CKDetailsExpanseActivityCell

- (CKDetailsExpanseActivityCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 conversation:(id)a5
{
  id v8;
  CKDetailsExpanseActivityCell *v9;
  CKDetailsExpanseActivityCell *v10;
  objc_super v12;

  v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)CKDetailsExpanseActivityCell;
  v9 = -[CKDetailsCell initWithStyle:reuseIdentifier:](&v12, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v10 = v9;
  if (v9)
  {
    -[CKDetailsExpanseActivityCell setConversation:](v9, "setConversation:", v8);
    -[CKDetailsExpanseActivityCell setupView](v10, "setupView");
  }

  return v10;
}

- (void)setupView
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
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
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
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
  _QWORD v70[4];
  id v71;
  _QWORD v72[2];

  v72[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CC11A8]);
  v4 = (void *)MEMORY[0x1E0D35818];
  -[CKDetailsExpanseActivityCell conversation](self, "conversation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activitySessionForTUConversation:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0D35818];
  -[CKDetailsExpanseActivityCell conversation](self, "conversation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsExpanseActivityCell setIsScreenShare:](self, "setIsScreenShare:", objc_msgSend(v7, "isScreenShareActivityForTUConversation:", v8));

  -[CKDetailsExpanseActivityCell conversation](self, "conversation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKTUConversationViewUtilities activityTitleForTUConversation:](CKTUConversationViewUtilities, "activityTitleForTUConversation:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v10);

  -[CKDetailsExpanseActivityCell conversation](self, "conversation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKTUConversationViewUtilities activityTextForTUConversation:](CKTUConversationViewUtilities, "activityTextForTUConversation:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSummary:", v12);

  v13 = objc_alloc(MEMORY[0x1E0CC1178]);
  -[CKDetailsExpanseActivityCell conversation](self, "conversation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKTUConversationViewUtilities activityImageForTUConversation:](CKTUConversationViewUtilities, "activityImageForTUConversation:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v13, "initWithPlatformImage:", v15);
  objc_msgSend(v3, "setImage:", v16);

  objc_msgSend(v3, "image");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    v18 = objc_alloc(MEMORY[0x1E0CC1178]);
    -[CKDetailsExpanseActivityCell conversation](self, "conversation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "detailsExpanseImageFallbackDimension");
    +[CKTUConversationViewUtilities activityIconForTUConversation:iconSize:](CKTUConversationViewUtilities, "activityIconForTUConversation:iconSize:", v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v18, "initWithPlatformImage:", v21);
    objc_msgSend(v3, "setImage:", v22);

  }
  if (!-[CKDetailsExpanseActivityCell isScreenShare](self, "isScreenShare"))
  {
    v38 = objc_alloc_init(MEMORY[0x1E0CC1218]);
    objc_msgSend(v3, "setSourceApplication:", v38);

    -[CKDetailsExpanseActivityCell conversation](self, "conversation");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKTUConversationViewUtilities activityAppNameForTUConversation:](CKTUConversationViewUtilities, "activityAppNameForTUConversation:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sourceApplication");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setName:", v40);

    objc_msgSend(v3, "title");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v42)
    {
      objc_msgSend(v3, "sourceApplication");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "name");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setTitle:", v44);

    }
    -[CKDetailsExpanseActivityCell conversation](self, "conversation");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKTUConversationViewUtilities activityBundleIdentifierForTUConversation:](CKTUConversationViewUtilities, "activityBundleIdentifierForTUConversation:", v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sourceApplication");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setBundleIdentifier:", v46);

    v48 = objc_alloc(MEMORY[0x1E0CC1178]);
    -[CKDetailsExpanseActivityCell conversation](self, "conversation");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "tuConversationBalloonIconDimensions");
    +[CKTUConversationViewUtilities activityIconForTUConversation:iconSize:](CKTUConversationViewUtilities, "activityIconForTUConversation:iconSize:", v25);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (void *)objc_msgSend(v48, "initWithPlatformImage:", v36);
    objc_msgSend(v3, "sourceApplication");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setIcon:", v37);

    goto LABEL_13;
  }
  v23 = (void *)MEMORY[0x1E0D35818];
  -[CKDetailsExpanseActivityCell conversation](self, "conversation");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "remoteParticipantHandleSharingScreenForTUConversation:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v25)
  {
    -[CKDetailsExpanseActivityCell conversation](self, "conversation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "localMember");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handle");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "value");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

  }
  +[CKEntity entityForAddress:](CKEntity, "entityForAddress:", v25);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "defaultIMHandle");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "cnContactWithKeys:", MEMORY[0x1E0C9AA60]);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsExpanseActivityCell setContactSharingScreen:](self, "setContactSharingScreen:", v31);

  objc_msgSend(v3, "title");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v32)
  {
    CKFrameworkBundle();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("EXPANSE_SCREENSHARE_DEFAULT"), &stru_1E276D870, CFSTR("ChatKit"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setTitle:", v34);

  }
  objc_msgSend(v3, "summary");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v35)
  {
    CKFrameworkBundle();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("EXPANSE_SCREENSHARE_SCREEN"), &stru_1E276D870, CFSTR("ChatKit"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setSummary:", v37);
LABEL_13:

  }
  v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC11C8]), "initWithMetadata:", v3);
  -[CKDetailsExpanseActivityCell setLpLinkView:](self, "setLpLinkView:", v50);

  -[CKDetailsExpanseActivityCell lpLinkView](self, "lpLinkView");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "_setApplyCornerRadius:", 0);

  -[CKDetailsExpanseActivityCell lpLinkView](self, "lpLinkView");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsExpanseActivityCell _cornerRadius](self, "_cornerRadius");
  objc_msgSend(v52, "_setCornerRadius:");

  -[CKDetailsExpanseActivityCell lpLinkView](self, "lpLinkView");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "_setOverrideBackgroundColor:", v54);

  -[CKDetailsExpanseActivityCell lpLinkView](self, "lpLinkView");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CKDetailsExpanseActivityCell isScreenShare](self, "isScreenShare"))
  {
    objc_msgSend(v55, "_setPreferredSizeClass:", 11);
  }
  else
  {
    objc_msgSend(v3, "image");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    if (v56)
      v57 = 10;
    else
      v57 = 11;
    objc_msgSend(v55, "_setPreferredSizeClass:", v57);

  }
  -[CKDetailsExpanseActivityCell lpLinkView](self, "lpLinkView");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[CKDetailsExpanseActivityCell contactSharingScreen](self, "contactSharingScreen");
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  if (v59)
  {
    -[CKDetailsExpanseActivityCell lpLinkView](self, "lpLinkView");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsExpanseActivityCell contactSharingScreen](self, "contactSharingScreen");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v72[0] = v61;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v72, 1);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "_setContactsForAttribution:", v62);

  }
  -[CKDetailsExpanseActivityCell lpLinkView](self, "lpLinkView");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v70[0] = MEMORY[0x1E0C809B0];
  v70[1] = 3221225472;
  v70[2] = __41__CKDetailsExpanseActivityCell_setupView__block_invoke;
  v70[3] = &unk_1E274A208;
  v71 = v6;
  v64 = v6;
  CKFrameworkBundle();
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "localizedStringForKey:value:table:", CFSTR("VIEW_BUTTON_TEXT"), &stru_1E276D870, CFSTR("ChatKit"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "_setAction:withText:buttonType:", v70, v66, 1);

  -[CKDetailsExpanseActivityCell contentView](self, "contentView");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsExpanseActivityCell lpLinkView](self, "lpLinkView");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "addSubview:", v68);

  -[CKDetailsExpanseActivityCell contentView](self, "contentView");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "setBackgroundColor:", 0);

  -[CKDetailsExpanseActivityCell addConstraints](self, "addConstraints");
}

void __41__CKDetailsExpanseActivityCell_setupView__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  id v6;

  if (_IMWillLog())
    _IMAlwaysLog();
  objc_msgSend(MEMORY[0x1E0DBD1C0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "conversationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DBD1C0], "sharedInstance");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "conversationManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "launchApplicationForActivitySession:completionHandler:", *(_QWORD *)(a1 + 32), &__block_literal_global_148);

  }
}

- (void)formatTitle
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
  id v12;

  -[CKDetailsExpanseActivityCell activityDescriptionLabel](self, "activityDescriptionLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "headerFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFont:", v5);

  -[CKDetailsExpanseActivityCell activityDescriptionLabel](self, "activityDescriptionLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "theme");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "secondaryLabelColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextColor:", v9);

  -[CKDetailsExpanseActivityCell activityDescriptionLabel](self, "activityDescriptionLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setNumberOfLines:", 1);

  -[CKDetailsExpanseActivityCell activityDescriptionLabel](self, "activityDescriptionLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setLineBreakMode:", 4);

  -[CKDetailsExpanseActivityCell activityDescriptionLabel](self, "activityDescriptionLabel");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

}

- (void)addConstraints
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
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
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  _QWORD v56[4];
  _QWORD v57[6];

  v57[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  if (CKIsRunningInMacCatalyst())
  {
    -[CKDetailsExpanseActivityCell contactSharingScreen](self, "contactSharingScreen");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v3)
      objc_msgSend(v4, "detailsExpanseScreenShareIconVerticalInsetPadding");
    else
      objc_msgSend(v4, "detailsExpanseActivityImageInsetPadding");
    v7 = v6;

    -[CKDetailsExpanseActivityCell activityDescriptionLabel](self, "activityDescriptionLabel");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "leadingAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsExpanseActivityCell contentView](self, "contentView");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "layoutMarginsGuide");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "leadingAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintEqualToAnchor:", v45);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v57[0] = v43;
    -[CKDetailsExpanseActivityCell activityDescriptionLabel](self, "activityDescriptionLabel");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "trailingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsExpanseActivityCell contentView](self, "contentView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "trailingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToAnchor:", v35);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v57[1] = v33;
    -[CKDetailsExpanseActivityCell activityDescriptionLabel](self, "activityDescriptionLabel");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "topAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsExpanseActivityCell contentView](self, "contentView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "topAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:constant:", v8, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v57[2] = v9;
    -[CKDetailsExpanseActivityCell activityDescriptionLabel](self, "activityDescriptionLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "heightAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsExpanseActivityCell activityDescriptionLabel](self, "activityDescriptionLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "font");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "pointSize");
    objc_msgSend(v11, "constraintEqualToConstant:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v57[3] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "addObjectsFromArray:", v15);

  }
  -[CKDetailsExpanseActivityCell lpLinkView](self, "lpLinkView");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "leadingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsExpanseActivityCell contentView](self, "contentView");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "leadingAnchor");
  v52 = v16;
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v56[0] = v46;
  -[CKDetailsExpanseActivityCell lpLinkView](self, "lpLinkView");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "trailingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsExpanseActivityCell contentView](self, "contentView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "trailingAnchor");
  v42 = v17;
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v56[1] = v36;
  -[CKDetailsExpanseActivityCell lpLinkView](self, "lpLinkView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "topAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsExpanseActivityCell activityDescriptionLabel](self, "activityDescriptionLabel");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    -[CKDetailsExpanseActivityCell activityDescriptionLabel](self, "activityDescriptionLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "bottomAnchor");
  }
  else
  {
    -[CKDetailsExpanseActivityCell contentView](self, "contentView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "topAnchor");
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v56[2] = v21;
  -[CKDetailsExpanseActivityCell lpLinkView](self, "lpLinkView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "bottomAnchor");
  v30 = v18;
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsExpanseActivityCell contentView](self, "contentView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "bottomAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v56[3] = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 4);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "addObjectsFromArray:", v27);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v55);
}

+ (id)reuseIdentifier
{
  return CFSTR("ExpanseActivityCell_reuseIdentifier");
}

+ (BOOL)shouldHighlight
{
  return 0;
}

- (double)insetPadding
{
  void *v2;
  double v3;
  double v4;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tuConversationInsetPadding");
  v4 = v3;

  return v4;
}

- (double)buttonInteritemSpacing
{
  void *v2;
  double v3;
  double v4;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tuConversationButtonInteritemSpacing");
  v4 = v3;

  return v4;
}

- (double)interitemSpacing
{
  void *v2;
  double v3;
  double v4;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tuConversationInteritemSpacing");
  v4 = v3;

  return v4;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKDetailsExpanseActivityCell;
  -[CKDetailsCell layoutSubviews](&v5, sel_layoutSubviews);
  -[CKDetailsCell topSeperator](self, "topSeperator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

  -[CKDetailsCell bottomSeperator](self, "bottomSeperator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 1);

}

- (TUConversation)conversation
{
  return self->_conversation;
}

- (void)setConversation:(id)a3
{
  objc_storeStrong((id *)&self->_conversation, a3);
}

- (LPLinkView)lpLinkView
{
  return self->_lpLinkView;
}

- (void)setLpLinkView:(id)a3
{
  objc_storeStrong((id *)&self->_lpLinkView, a3);
}

- (BOOL)isScreenShare
{
  return self->_isScreenShare;
}

- (void)setIsScreenShare:(BOOL)a3
{
  self->_isScreenShare = a3;
}

- (UILabel)activityDescriptionLabel
{
  return self->_activityDescriptionLabel;
}

- (void)setActivityDescriptionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_activityDescriptionLabel, a3);
}

- (CNContact)contactSharingScreen
{
  return self->_contactSharingScreen;
}

- (void)setContactSharingScreen:(id)a3
{
  objc_storeStrong((id *)&self->_contactSharingScreen, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactSharingScreen, 0);
  objc_storeStrong((id *)&self->_activityDescriptionLabel, 0);
  objc_storeStrong((id *)&self->_lpLinkView, 0);
  objc_storeStrong((id *)&self->_conversation, 0);
}

@end
