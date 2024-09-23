@implementation SUUIITunesPassConfiguration

- (SUUIITunesPassConfiguration)initWithITunesPassDictionary:(id)a3 clientContext:(id)a4
{
  id v6;
  id v7;
  SUUIITunesPassConfiguration *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSString *dialogNotNowButton;
  void *v13;
  uint64_t v14;
  NSString *dialogMessage;
  void *v16;
  uint64_t v17;
  NSString *dialogTitle;
  void *v19;
  uint64_t v20;
  NSString *dialogLearnMoreButton;
  void *v22;
  void *v23;
  uint64_t v24;
  NSString *learnMoreAddPassButtonTitle;
  void *v26;
  uint64_t v27;
  NSString *learnMoreDoneButtonTitle;
  void *v29;
  uint64_t v30;
  NSString *learnMoreExplanation;
  void *v32;
  uint64_t v33;
  NSString *learnMoreTitle;
  void *v35;
  uint64_t v36;
  NSString *learnMoreViewPassButtonTitle;
  void *v38;
  void *v39;
  uint64_t v40;
  NSString *lockupDescription;
  void *v42;
  uint64_t v43;
  NSString *lockupLearnMoreLinkTitle;
  void *v45;
  uint64_t v46;
  NSString *lockupTitle;
  uint64_t v48;
  NSString *v49;
  uint64_t v50;
  NSString *v51;
  uint64_t v52;
  NSString *v53;
  uint64_t v54;
  NSString *v55;
  uint64_t v56;
  NSString *v57;
  uint64_t v58;
  NSString *v59;
  uint64_t v60;
  NSString *v61;
  uint64_t v62;
  NSString *v63;
  uint64_t v64;
  NSString *v65;
  uint64_t v66;
  NSString *v67;
  uint64_t v68;
  NSString *v69;
  uint64_t v70;
  NSString *v71;
  objc_super v73;

  v6 = a3;
  v7 = a4;
  v73.receiver = self;
  v73.super_class = (Class)SUUIITunesPassConfiguration;
  v8 = -[SUUIITunesPassConfiguration init](&v73, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("learnMoreAlert"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "objectForKey:", CFSTR("cancelButton"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = objc_msgSend(v10, "copy");
        dialogNotNowButton = v8->_dialogNotNowButton;
        v8->_dialogNotNowButton = (NSString *)v11;

      }
      objc_msgSend(v9, "objectForKey:", CFSTR("explanation"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = objc_msgSend(v13, "copy");
        dialogMessage = v8->_dialogMessage;
        v8->_dialogMessage = (NSString *)v14;

      }
      objc_msgSend(v9, "objectForKey:", CFSTR("message"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v17 = objc_msgSend(v16, "copy");
        dialogTitle = v8->_dialogTitle;
        v8->_dialogTitle = (NSString *)v17;

      }
      objc_msgSend(v9, "objectForKey:", CFSTR("okButton"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v20 = objc_msgSend(v19, "copy");
        dialogLearnMoreButton = v8->_dialogLearnMoreButton;
        v8->_dialogLearnMoreButton = (NSString *)v20;

      }
    }
    objc_msgSend(v6, "objectForKey:", CFSTR("learnMore"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v22, "objectForKey:", CFSTR("addPassButton"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v24 = objc_msgSend(v23, "copy");
        learnMoreAddPassButtonTitle = v8->_learnMoreAddPassButtonTitle;
        v8->_learnMoreAddPassButtonTitle = (NSString *)v24;

      }
      objc_msgSend(v22, "objectForKey:", CFSTR("doneButton"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v27 = objc_msgSend(v26, "copy");
        learnMoreDoneButtonTitle = v8->_learnMoreDoneButtonTitle;
        v8->_learnMoreDoneButtonTitle = (NSString *)v27;

      }
      objc_msgSend(v22, "objectForKey:", CFSTR("explanation"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v30 = objc_msgSend(v29, "copy");
        learnMoreExplanation = v8->_learnMoreExplanation;
        v8->_learnMoreExplanation = (NSString *)v30;

      }
      objc_msgSend(v22, "objectForKey:", CFSTR("title"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v33 = objc_msgSend(v32, "copy");
        learnMoreTitle = v8->_learnMoreTitle;
        v8->_learnMoreTitle = (NSString *)v33;

      }
      objc_msgSend(v22, "objectForKey:", CFSTR("viewPassButton"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v36 = objc_msgSend(v35, "copy");
        learnMoreViewPassButtonTitle = v8->_learnMoreViewPassButtonTitle;
        v8->_learnMoreViewPassButtonTitle = (NSString *)v36;

      }
    }
    objc_msgSend(v6, "objectForKey:", CFSTR("lockup"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v38, "objectForKey:", CFSTR("description"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v40 = objc_msgSend(v39, "copy");
        lockupDescription = v8->_lockupDescription;
        v8->_lockupDescription = (NSString *)v40;

      }
      objc_msgSend(v38, "objectForKey:", CFSTR("learnMore"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v43 = objc_msgSend(v42, "copy");
        lockupLearnMoreLinkTitle = v8->_lockupLearnMoreLinkTitle;
        v8->_lockupLearnMoreLinkTitle = (NSString *)v43;

      }
      objc_msgSend(v38, "objectForKey:", CFSTR("title"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v46 = objc_msgSend(v45, "copy");
        lockupTitle = v8->_lockupTitle;
        v8->_lockupTitle = (NSString *)v46;

      }
    }
    if (!v8->_dialogLearnMoreButton)
    {
      if (v7)
        objc_msgSend(v7, "localizedStringForKey:inTable:", CFSTR("ITUNES_PASS_DIALOG_BUTTON_LEARN_MORE"), CFSTR("Redeem"));
      else
        +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("ITUNES_PASS_DIALOG_BUTTON_LEARN_MORE"), 0, CFSTR("Redeem"));
      v48 = objc_claimAutoreleasedReturnValue();
      v49 = v8->_dialogLearnMoreButton;
      v8->_dialogLearnMoreButton = (NSString *)v48;

    }
    if (!v8->_dialogMessage)
    {
      if (v7)
        objc_msgSend(v7, "localizedStringForKey:inTable:", CFSTR("ITUNES_PASS_DIALOG_MESSAGE"), CFSTR("Redeem"));
      else
        +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("ITUNES_PASS_DIALOG_MESSAGE"), 0, CFSTR("Redeem"));
      v50 = objc_claimAutoreleasedReturnValue();
      v51 = v8->_dialogMessage;
      v8->_dialogMessage = (NSString *)v50;

    }
    if (!v8->_dialogNotNowButton)
    {
      if (v7)
        objc_msgSend(v7, "localizedStringForKey:inTable:", CFSTR("ITUNES_PASS_DIALOG_BUTTON_NOT_NOW"), CFSTR("Redeem"));
      else
        +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("ITUNES_PASS_DIALOG_BUTTON_NOT_NOW"), 0, CFSTR("Redeem"));
      v52 = objc_claimAutoreleasedReturnValue();
      v53 = v8->_dialogNotNowButton;
      v8->_dialogNotNowButton = (NSString *)v52;

    }
    if (!v8->_dialogTitle)
    {
      if (v7)
        objc_msgSend(v7, "localizedStringForKey:inTable:", CFSTR("ITUNES_PASS_DIALOG_TITLE"), CFSTR("Redeem"));
      else
        +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("ITUNES_PASS_DIALOG_TITLE"), 0, CFSTR("Redeem"));
      v54 = objc_claimAutoreleasedReturnValue();
      v55 = v8->_dialogTitle;
      v8->_dialogTitle = (NSString *)v54;

    }
    if (!v8->_learnMoreAddPassButtonTitle)
    {
      if (v7)
        objc_msgSend(v7, "localizedStringForKey:inTable:", CFSTR("ITUNES_PASS_LEARN_MORE_PAGE_ADD_PASS_BUTTON"), CFSTR("Redeem"));
      else
        +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("ITUNES_PASS_LEARN_MORE_PAGE_ADD_PASS_BUTTON"), 0, CFSTR("Redeem"));
      v56 = objc_claimAutoreleasedReturnValue();
      v57 = v8->_learnMoreAddPassButtonTitle;
      v8->_learnMoreAddPassButtonTitle = (NSString *)v56;

    }
    if (!v8->_learnMoreDoneButtonTitle)
    {
      if (v7)
        objc_msgSend(v7, "localizedStringForKey:inTable:", CFSTR("ITUNES_PASS_LEARN_MORE_PAGE_DONE_BUTTON"), CFSTR("Redeem"));
      else
        +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("ITUNES_PASS_LEARN_MORE_PAGE_DONE_BUTTON"), 0, CFSTR("Redeem"));
      v58 = objc_claimAutoreleasedReturnValue();
      v59 = v8->_learnMoreDoneButtonTitle;
      v8->_learnMoreDoneButtonTitle = (NSString *)v58;

    }
    if (!v8->_learnMoreExplanation)
    {
      if (v7)
        objc_msgSend(v7, "localizedStringForKey:inTable:", CFSTR("ITUNES_PASS_LEARN_MORE_PAGE_EXPLANATION"), CFSTR("Redeem"));
      else
        +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("ITUNES_PASS_LEARN_MORE_PAGE_EXPLANATION"), 0, CFSTR("Redeem"));
      v60 = objc_claimAutoreleasedReturnValue();
      v61 = v8->_learnMoreExplanation;
      v8->_learnMoreExplanation = (NSString *)v60;

    }
    if (!v8->_learnMoreTitle)
    {
      if (v7)
        objc_msgSend(v7, "localizedStringForKey:inTable:", CFSTR("ITUNES_PASS_LEARN_MORE_PAGE_TITLE"), CFSTR("Redeem"));
      else
        +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("ITUNES_PASS_LEARN_MORE_PAGE_TITLE"), 0, CFSTR("Redeem"));
      v62 = objc_claimAutoreleasedReturnValue();
      v63 = v8->_learnMoreTitle;
      v8->_learnMoreTitle = (NSString *)v62;

    }
    if (!v8->_learnMoreViewPassButtonTitle)
    {
      if (v7)
        objc_msgSend(v7, "localizedStringForKey:inTable:", CFSTR("ITUNES_PASS_LEARN_MORE_PAGE_VIEW_PASS_BUTTON"), CFSTR("Redeem"));
      else
        +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("ITUNES_PASS_LEARN_MORE_PAGE_VIEW_PASS_BUTTON"), 0, CFSTR("Redeem"));
      v64 = objc_claimAutoreleasedReturnValue();
      v65 = v8->_learnMoreViewPassButtonTitle;
      v8->_learnMoreViewPassButtonTitle = (NSString *)v64;

    }
    if (!v8->_lockupDescription)
    {
      if (v7)
        objc_msgSend(v7, "localizedStringForKey:inTable:", CFSTR("ITUNES_PASS_EXPLANATION"), CFSTR("Redeem"));
      else
        +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("ITUNES_PASS_EXPLANATION"), 0, CFSTR("Redeem"));
      v66 = objc_claimAutoreleasedReturnValue();
      v67 = v8->_lockupDescription;
      v8->_lockupDescription = (NSString *)v66;

    }
    if (!v8->_lockupLearnMoreLinkTitle)
    {
      if (v7)
        objc_msgSend(v7, "localizedStringForKey:inTable:", CFSTR("ITUNES_PASS_LEARN_MORE_LINK"), CFSTR("Redeem"));
      else
        +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("ITUNES_PASS_LEARN_MORE_LINK"), 0, CFSTR("Redeem"));
      v68 = objc_claimAutoreleasedReturnValue();
      v69 = v8->_lockupLearnMoreLinkTitle;
      v8->_lockupLearnMoreLinkTitle = (NSString *)v68;

    }
    if (!v8->_lockupTitle)
    {
      if (v7)
        objc_msgSend(v7, "localizedStringForKey:inTable:", CFSTR("ITUNES_PASS_TITLE"), CFSTR("Redeem"));
      else
        +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("ITUNES_PASS_TITLE"), 0, CFSTR("Redeem"));
      v70 = objc_claimAutoreleasedReturnValue();
      v71 = v8->_lockupTitle;
      v8->_lockupTitle = (NSString *)v70;

    }
  }

  return v8;
}

- (id)learnMoreAlertView
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BEBD3B8]), "initWithTitle:message:delegate:cancelButtonTitle:otherButtonTitles:", self->_dialogTitle, self->_dialogMessage, 0, self->_dialogNotNowButton, self->_dialogLearnMoreButton, 0);
}

- (NSString)learnMoreAddPassButtonTitle
{
  return self->_learnMoreAddPassButtonTitle;
}

- (NSString)learnMoreDoneButtonTitle
{
  return self->_learnMoreDoneButtonTitle;
}

- (NSString)learnMoreExplanation
{
  return self->_learnMoreExplanation;
}

- (NSString)learnMoreTitle
{
  return self->_learnMoreTitle;
}

- (NSString)learnMoreViewPassButtonTitle
{
  return self->_learnMoreViewPassButtonTitle;
}

- (NSString)lockupDescription
{
  return self->_lockupDescription;
}

- (NSString)lockupLearnMoreLinkTitle
{
  return self->_lockupLearnMoreLinkTitle;
}

- (NSString)lockupTitle
{
  return self->_lockupTitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockupTitle, 0);
  objc_storeStrong((id *)&self->_lockupLearnMoreLinkTitle, 0);
  objc_storeStrong((id *)&self->_lockupDescription, 0);
  objc_storeStrong((id *)&self->_learnMoreViewPassButtonTitle, 0);
  objc_storeStrong((id *)&self->_learnMoreTitle, 0);
  objc_storeStrong((id *)&self->_learnMoreExplanation, 0);
  objc_storeStrong((id *)&self->_learnMoreDoneButtonTitle, 0);
  objc_storeStrong((id *)&self->_learnMoreAddPassButtonTitle, 0);
  objc_storeStrong((id *)&self->_dialogTitle, 0);
  objc_storeStrong((id *)&self->_dialogNotNowButton, 0);
  objc_storeStrong((id *)&self->_dialogMessage, 0);
  objc_storeStrong((id *)&self->_dialogLearnMoreButton, 0);
}

@end
