@implementation FAInviteContext

- (unint64_t)maxFamilySuggestions
{
  return 5;
}

- (FAInviteContext)initWithResults:(id)a3
{
  id v4;
  FAInviteContext *v5;
  FAInviteContext *v6;

  v4 = a3;
  v5 = -[FAInviteContext init](self, "init");
  v6 = v5;
  if (v5)
    -[FAInviteContext _parseResultsDictionary:](v5, "_parseResultsDictionary:", v4);

  return v6;
}

- (unint64_t)_validatonFromString:(id)a3 eventType:(id)a4
{
  id v5;
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5 || (objc_msgSend(v6, "isEqualToString:", CFSTR("familyInvite")) & 1) == 0)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(v5, "componentsSeparatedByString:", CFSTR(","), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v10)
    {
      v11 = v10;
      v8 = 0;
      v12 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v9);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "isEqualToString:", CFSTR("inviteesNotPartOfFamily")))v8 = 1;
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v11);
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (void)_parseResultsDictionary:(id)a3
{
  NSString *v4;
  NSString *eventType;
  NSString *v6;
  NSString *title;
  NSString *v8;
  NSString *secondaryTitle;
  NSString *v10;
  NSString *subtitle;
  void *v12;
  NSString *v13;
  NSString *action;
  void *v15;
  NSArray *v16;
  NSArray *invitees;
  NSString *v18;
  NSString *overlaidTextColorString;
  void *v20;
  void *v21;
  NSURL *v22;
  NSURL *inviteURL;
  void *v24;
  NSURL *v25;
  NSURL *imageURL;
  void *v27;
  NSURL *v28;
  NSURL *iconURL;
  void *v30;
  NSURL *v31;
  NSURL *reportInviteeDetailsUrl;
  void *v33;
  NSURL *v34;
  NSURL *messageBubbleAcceptInviteURL;
  void *v36;
  NSURL *v37;
  NSURL *messageBubbleDeclineInviteURL;
  void *v39;
  uint64_t v40;
  unint64_t v41;
  NSString *v42;
  NSString *mailLinkTitle;
  NSString *v44;
  NSString *mailLinkSubtitle;
  NSString *v46;
  NSString *mailMessageSubject;
  NSString *v48;
  NSString *mailMessageBodyHTML;
  NSString *v50;
  NSString *messageBubbleTitle;
  NSString *v52;
  NSString *messageBubbleSubTitle;
  NSString *v54;
  NSString *messageBubbleSubTitleTeen;
  NSString *v56;
  NSString *messageBubbleViewInvitationButtonLabel;
  NSString *v58;
  NSString *messageBubbleLearnMoreLinkLabel;
  NSString *v60;
  NSString *messageBubbleInviteAcceptButtonLabel;
  NSString *v62;
  NSString *messageBubbleInviteDeclineButtonLabel;
  NSString *v64;
  NSString *messageBubbleSubscriptionsList;
  NSString *v66;
  NSString *messageBubbleFamilySettingsLinkLabel;
  NSString *v68;
  NSString *messageBubbleAppleIDSettingsLinkLabel;
  NSString *v70;
  NSString *messageBubbleInviteLoadingLabel;
  void *v72;
  NSString *v73;
  NSString *v74;
  NSString *v75;
  NSString *messageBubbleInvitePendingTitle;
  NSString *v77;
  NSString *messageBubbleInvitePendingSubTitle;
  NSString *v79;
  NSString *messageBubbleInvitePendingIcon;
  NSString *v81;
  NSString *messageBubbleInviteAcceptedTitleSender;
  NSString *v83;
  NSString *messageBubbleInviteAcceptedTitleReceiver;
  NSString *v85;
  NSString *messageBubbleInviteAcceptedSubTitleSender;
  NSString *v87;
  NSString *messageBubbleInviteAcceptedSubTitleReceiver;
  NSString *v89;
  NSString *messageBubbleInviteAcceptedIcon;
  NSString *v91;
  NSString *messageBubbleInviteExpiredTitleSender;
  NSString *v93;
  NSString *messageBubbleInviteExpiredTitleReceiver;
  NSString *v95;
  NSString *messageBubbleInviteExpiredSubTitleSender;
  NSString *v97;
  NSString *messageBubbleInviteExpiredSubTitleReceiver;
  NSString *v99;
  NSString *messageBubbleInviteExpiredIcon;
  NSString *v101;
  NSString *messageBubbleInviteDeclinedTitleSender;
  NSString *v103;
  NSString *messageBubbleInviteDeclinedTitleReceiver;
  NSString *v105;
  NSString *messageBubbleInviteDeclinedSubTitleSender;
  NSString *v107;
  NSString *messageBubbleInviteDeclinedSubTitleReceiver;
  NSString *v109;
  NSString *messageBubbleInviteDeclinedIcon;
  void *v111;
  void *v112;
  NSString *v113;
  void *messageBubbleInviteDeclineAlertSheetTitle;
  NSString *v115;
  NSString *v116;
  void *v117;
  void *v118;
  NSString *v119;
  void *messageBubbleInviteDeclineAlertSheetMessage;
  NSString *v121;
  NSString *v122;
  id v123;

  v123 = a3;
  objc_msgSend(v123, "objectForKeyedSubscript:", CFSTR("eventType"));
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  eventType = self->_eventType;
  self->_eventType = v4;

  objc_msgSend(v123, "objectForKeyedSubscript:", CFSTR("title"));
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  title = self->_title;
  self->_title = v6;

  objc_msgSend(v123, "objectForKeyedSubscript:", CFSTR("secondaryTitle"));
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  secondaryTitle = self->_secondaryTitle;
  self->_secondaryTitle = v8;

  objc_msgSend(v123, "objectForKeyedSubscript:", CFSTR("description"));
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  subtitle = self->_subtitle;
  self->_subtitle = v10;

  objc_msgSend(v123, "objectForKeyedSubscript:", CFSTR("recipientsEditable"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  self->_canEditRecipients = objc_msgSend(v12, "BOOLValue");

  objc_msgSend(v123, "objectForKeyedSubscript:", CFSTR("actionLabel"));
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  action = self->_action;
  self->_action = v13;

  objc_msgSend(v123, "objectForKeyedSubscript:", CFSTR("invitees"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "componentsSeparatedByString:", CFSTR(","));
  v16 = (NSArray *)objc_claimAutoreleasedReturnValue();
  invitees = self->_invitees;
  self->_invitees = v16;

  objc_msgSend(v123, "objectForKeyedSubscript:", CFSTR("overlaidTextColor"));
  v18 = (NSString *)objc_claimAutoreleasedReturnValue();
  overlaidTextColorString = self->_overlaidTextColorString;
  self->_overlaidTextColorString = v18;

  objc_msgSend(v123, "objectForKeyedSubscript:", CFSTR("validate"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  self->_validation = -[FAInviteContext _validatonFromString:eventType:](self, "_validatonFromString:eventType:", v20, self->_eventType);

  objc_msgSend(v123, "objectForKeyedSubscript:", CFSTR("inviteUrl"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v21);
    v22 = (NSURL *)objc_claimAutoreleasedReturnValue();
    inviteURL = self->_inviteURL;
    self->_inviteURL = v22;

  }
  objc_msgSend(v123, "objectForKeyedSubscript:", CFSTR("backgroundImageUrl"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v24);
    v25 = (NSURL *)objc_claimAutoreleasedReturnValue();
    imageURL = self->_imageURL;
    self->_imageURL = v25;

  }
  objc_msgSend(v123, "objectForKeyedSubscript:", CFSTR("iconUrl"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v27);
    v28 = (NSURL *)objc_claimAutoreleasedReturnValue();
    iconURL = self->_iconURL;
    self->_iconURL = v28;

  }
  objc_msgSend(v123, "objectForKeyedSubscript:", CFSTR("reportInviteeDetailsUrl"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v30);
    v31 = (NSURL *)objc_claimAutoreleasedReturnValue();
    reportInviteeDetailsUrl = self->_reportInviteeDetailsUrl;
    self->_reportInviteeDetailsUrl = v31;

  }
  objc_msgSend(v123, "objectForKeyedSubscript:", CFSTR("messageBubbleInviteAcceptLink"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v33);
    v34 = (NSURL *)objc_claimAutoreleasedReturnValue();
    messageBubbleAcceptInviteURL = self->_messageBubbleAcceptInviteURL;
    self->_messageBubbleAcceptInviteURL = v34;

  }
  objc_msgSend(v123, "objectForKeyedSubscript:", CFSTR("messageBubbleInviteDeclineLink"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (v36)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v36);
    v37 = (NSURL *)objc_claimAutoreleasedReturnValue();
    messageBubbleDeclineInviteURL = self->_messageBubbleDeclineInviteURL;
    self->_messageBubbleDeclineInviteURL = v37;

  }
  objc_msgSend(v123, "objectForKeyedSubscript:", CFSTR("remainingFamilySpots"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "integerValue");

  v41 = 5;
  if (v40)
    v41 = v40;
  self->_remainingFamilySpots = v41;
  objc_msgSend(v123, "objectForKeyedSubscript:", CFSTR("mailLinkTitle"));
  v42 = (NSString *)objc_claimAutoreleasedReturnValue();
  mailLinkTitle = self->_mailLinkTitle;
  self->_mailLinkTitle = v42;

  objc_msgSend(v123, "objectForKeyedSubscript:", CFSTR("mailLinkSubtitle"));
  v44 = (NSString *)objc_claimAutoreleasedReturnValue();
  mailLinkSubtitle = self->_mailLinkSubtitle;
  self->_mailLinkSubtitle = v44;

  objc_msgSend(v123, "objectForKeyedSubscript:", CFSTR("mailMessageSubject"));
  v46 = (NSString *)objc_claimAutoreleasedReturnValue();
  mailMessageSubject = self->_mailMessageSubject;
  self->_mailMessageSubject = v46;

  objc_msgSend(v123, "objectForKeyedSubscript:", CFSTR("mailMessageBodyHTML"));
  v48 = (NSString *)objc_claimAutoreleasedReturnValue();
  mailMessageBodyHTML = self->_mailMessageBodyHTML;
  self->_mailMessageBodyHTML = v48;

  objc_msgSend(v123, "objectForKeyedSubscript:", CFSTR("messageBubbleTitle"));
  v50 = (NSString *)objc_claimAutoreleasedReturnValue();
  messageBubbleTitle = self->_messageBubbleTitle;
  self->_messageBubbleTitle = v50;

  objc_msgSend(v123, "objectForKeyedSubscript:", CFSTR("messageBubbleSubTitle"));
  v52 = (NSString *)objc_claimAutoreleasedReturnValue();
  messageBubbleSubTitle = self->_messageBubbleSubTitle;
  self->_messageBubbleSubTitle = v52;

  objc_msgSend(v123, "objectForKeyedSubscript:", CFSTR("messageBubbleSubTitleTeen"));
  v54 = (NSString *)objc_claimAutoreleasedReturnValue();
  messageBubbleSubTitleTeen = self->_messageBubbleSubTitleTeen;
  self->_messageBubbleSubTitleTeen = v54;

  objc_msgSend(v123, "objectForKeyedSubscript:", CFSTR("messageBubbleViewInvitationButtonLabel"));
  v56 = (NSString *)objc_claimAutoreleasedReturnValue();
  messageBubbleViewInvitationButtonLabel = self->_messageBubbleViewInvitationButtonLabel;
  self->_messageBubbleViewInvitationButtonLabel = v56;

  objc_msgSend(v123, "objectForKeyedSubscript:", CFSTR("messageBubbleLearnMoreLinkLabel"));
  v58 = (NSString *)objc_claimAutoreleasedReturnValue();
  messageBubbleLearnMoreLinkLabel = self->_messageBubbleLearnMoreLinkLabel;
  self->_messageBubbleLearnMoreLinkLabel = v58;

  objc_msgSend(v123, "objectForKeyedSubscript:", CFSTR("messageBubbleInviteAcceptButtonLabel"));
  v60 = (NSString *)objc_claimAutoreleasedReturnValue();
  messageBubbleInviteAcceptButtonLabel = self->_messageBubbleInviteAcceptButtonLabel;
  self->_messageBubbleInviteAcceptButtonLabel = v60;

  objc_msgSend(v123, "objectForKeyedSubscript:", CFSTR("messageBubbleInviteDeclineButtonLabel"));
  v62 = (NSString *)objc_claimAutoreleasedReturnValue();
  messageBubbleInviteDeclineButtonLabel = self->_messageBubbleInviteDeclineButtonLabel;
  self->_messageBubbleInviteDeclineButtonLabel = v62;

  objc_msgSend(v123, "objectForKeyedSubscript:", CFSTR("messageBubbleSubscriptionsList"));
  v64 = (NSString *)objc_claimAutoreleasedReturnValue();
  messageBubbleSubscriptionsList = self->_messageBubbleSubscriptionsList;
  self->_messageBubbleSubscriptionsList = v64;

  objc_msgSend(v123, "objectForKeyedSubscript:", CFSTR("messageBubbleFamilySettingsLinkLabel"));
  v66 = (NSString *)objc_claimAutoreleasedReturnValue();
  messageBubbleFamilySettingsLinkLabel = self->_messageBubbleFamilySettingsLinkLabel;
  self->_messageBubbleFamilySettingsLinkLabel = v66;

  objc_msgSend(v123, "objectForKeyedSubscript:", CFSTR("messageBubbleAppleIDSettingsLinkLabel"));
  v68 = (NSString *)objc_claimAutoreleasedReturnValue();
  messageBubbleAppleIDSettingsLinkLabel = self->_messageBubbleAppleIDSettingsLinkLabel;
  self->_messageBubbleAppleIDSettingsLinkLabel = v68;

  objc_msgSend(v123, "objectForKeyedSubscript:", CFSTR("messageBubbleLoadingLabel"));
  v70 = (NSString *)objc_claimAutoreleasedReturnValue();
  messageBubbleInviteLoadingLabel = self->_messageBubbleInviteLoadingLabel;
  self->_messageBubbleInviteLoadingLabel = v70;

  if (!-[NSString length](self->_messageBubbleInviteLoadingLabel, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "localizedStringForKey:value:table:", CFSTR("LOADING"), &stru_1E8565C18, CFSTR("Localizable"));
    v73 = (NSString *)objc_claimAutoreleasedReturnValue();
    v74 = self->_messageBubbleInviteLoadingLabel;
    self->_messageBubbleInviteLoadingLabel = v73;

  }
  objc_msgSend(v123, "objectForKeyedSubscript:", CFSTR("messageBubbleInvitePendingTitle"));
  v75 = (NSString *)objc_claimAutoreleasedReturnValue();
  messageBubbleInvitePendingTitle = self->_messageBubbleInvitePendingTitle;
  self->_messageBubbleInvitePendingTitle = v75;

  objc_msgSend(v123, "objectForKeyedSubscript:", CFSTR("messageBubbleInvitePendingSubTitle"));
  v77 = (NSString *)objc_claimAutoreleasedReturnValue();
  messageBubbleInvitePendingSubTitle = self->_messageBubbleInvitePendingSubTitle;
  self->_messageBubbleInvitePendingSubTitle = v77;

  objc_msgSend(v123, "objectForKeyedSubscript:", CFSTR("messageBubbleInvitePendingIcon"));
  v79 = (NSString *)objc_claimAutoreleasedReturnValue();
  messageBubbleInvitePendingIcon = self->_messageBubbleInvitePendingIcon;
  self->_messageBubbleInvitePendingIcon = v79;

  objc_msgSend(v123, "objectForKeyedSubscript:", CFSTR("messageBubbleInviteAcceptedTitleSender"));
  v81 = (NSString *)objc_claimAutoreleasedReturnValue();
  messageBubbleInviteAcceptedTitleSender = self->_messageBubbleInviteAcceptedTitleSender;
  self->_messageBubbleInviteAcceptedTitleSender = v81;

  objc_msgSend(v123, "objectForKeyedSubscript:", CFSTR("messageBubbleInviteAcceptedTitleReceiver"));
  v83 = (NSString *)objc_claimAutoreleasedReturnValue();
  messageBubbleInviteAcceptedTitleReceiver = self->_messageBubbleInviteAcceptedTitleReceiver;
  self->_messageBubbleInviteAcceptedTitleReceiver = v83;

  objc_msgSend(v123, "objectForKeyedSubscript:", CFSTR("messageBubbleInviteAcceptedSubTitleSender"));
  v85 = (NSString *)objc_claimAutoreleasedReturnValue();
  messageBubbleInviteAcceptedSubTitleSender = self->_messageBubbleInviteAcceptedSubTitleSender;
  self->_messageBubbleInviteAcceptedSubTitleSender = v85;

  objc_msgSend(v123, "objectForKeyedSubscript:", CFSTR("messageBubbleInviteAcceptedSubTitleReceiver"));
  v87 = (NSString *)objc_claimAutoreleasedReturnValue();
  messageBubbleInviteAcceptedSubTitleReceiver = self->_messageBubbleInviteAcceptedSubTitleReceiver;
  self->_messageBubbleInviteAcceptedSubTitleReceiver = v87;

  objc_msgSend(v123, "objectForKeyedSubscript:", CFSTR("messageBubbleInviteAcceptedIcon"));
  v89 = (NSString *)objc_claimAutoreleasedReturnValue();
  messageBubbleInviteAcceptedIcon = self->_messageBubbleInviteAcceptedIcon;
  self->_messageBubbleInviteAcceptedIcon = v89;

  objc_msgSend(v123, "objectForKeyedSubscript:", CFSTR("messageBubbleInviteExpiredTitleSender"));
  v91 = (NSString *)objc_claimAutoreleasedReturnValue();
  messageBubbleInviteExpiredTitleSender = self->_messageBubbleInviteExpiredTitleSender;
  self->_messageBubbleInviteExpiredTitleSender = v91;

  objc_msgSend(v123, "objectForKeyedSubscript:", CFSTR("messageBubbleInviteExpiredTitleReceiver"));
  v93 = (NSString *)objc_claimAutoreleasedReturnValue();
  messageBubbleInviteExpiredTitleReceiver = self->_messageBubbleInviteExpiredTitleReceiver;
  self->_messageBubbleInviteExpiredTitleReceiver = v93;

  objc_msgSend(v123, "objectForKeyedSubscript:", CFSTR("messageBubbleInviteExpiredSubTitleSender"));
  v95 = (NSString *)objc_claimAutoreleasedReturnValue();
  messageBubbleInviteExpiredSubTitleSender = self->_messageBubbleInviteExpiredSubTitleSender;
  self->_messageBubbleInviteExpiredSubTitleSender = v95;

  objc_msgSend(v123, "objectForKeyedSubscript:", CFSTR("messageBubbleInviteExpiredSubTitleReceiver"));
  v97 = (NSString *)objc_claimAutoreleasedReturnValue();
  messageBubbleInviteExpiredSubTitleReceiver = self->_messageBubbleInviteExpiredSubTitleReceiver;
  self->_messageBubbleInviteExpiredSubTitleReceiver = v97;

  objc_msgSend(v123, "objectForKeyedSubscript:", CFSTR("messageBubbleInviteExpiredIcon"));
  v99 = (NSString *)objc_claimAutoreleasedReturnValue();
  messageBubbleInviteExpiredIcon = self->_messageBubbleInviteExpiredIcon;
  self->_messageBubbleInviteExpiredIcon = v99;

  objc_msgSend(v123, "objectForKeyedSubscript:", CFSTR("messageBubbleInviteDeclinedTitleSender"));
  v101 = (NSString *)objc_claimAutoreleasedReturnValue();
  messageBubbleInviteDeclinedTitleSender = self->_messageBubbleInviteDeclinedTitleSender;
  self->_messageBubbleInviteDeclinedTitleSender = v101;

  objc_msgSend(v123, "objectForKeyedSubscript:", CFSTR("messageBubbleInviteDeclinedTitleReceiver"));
  v103 = (NSString *)objc_claimAutoreleasedReturnValue();
  messageBubbleInviteDeclinedTitleReceiver = self->_messageBubbleInviteDeclinedTitleReceiver;
  self->_messageBubbleInviteDeclinedTitleReceiver = v103;

  objc_msgSend(v123, "objectForKeyedSubscript:", CFSTR("messageBubbleInviteDeclinedSubTitleSender"));
  v105 = (NSString *)objc_claimAutoreleasedReturnValue();
  messageBubbleInviteDeclinedSubTitleSender = self->_messageBubbleInviteDeclinedSubTitleSender;
  self->_messageBubbleInviteDeclinedSubTitleSender = v105;

  objc_msgSend(v123, "objectForKeyedSubscript:", CFSTR("messageBubbleInviteDeclinedSubTitleReceiver"));
  v107 = (NSString *)objc_claimAutoreleasedReturnValue();
  messageBubbleInviteDeclinedSubTitleReceiver = self->_messageBubbleInviteDeclinedSubTitleReceiver;
  self->_messageBubbleInviteDeclinedSubTitleReceiver = v107;

  objc_msgSend(v123, "objectForKeyedSubscript:", CFSTR("messageBubbleInviteDeclinedIcon"));
  v109 = (NSString *)objc_claimAutoreleasedReturnValue();
  messageBubbleInviteDeclinedIcon = self->_messageBubbleInviteDeclinedIcon;
  self->_messageBubbleInviteDeclinedIcon = v109;

  objc_msgSend(v123, "objectForKeyedSubscript:", CFSTR("messageBubbleInviteDeclineAlertSheetTitle"));
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v112 = v111;
  if (v111)
  {
    v113 = v111;
    messageBubbleInviteDeclineAlertSheetTitle = self->_messageBubbleInviteDeclineAlertSheetTitle;
    self->_messageBubbleInviteDeclineAlertSheetTitle = v113;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    messageBubbleInviteDeclineAlertSheetTitle = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(messageBubbleInviteDeclineAlertSheetTitle, "localizedStringForKey:value:table:", CFSTR("InviteDeclineAlertSheetTitle"), &stru_1E8565C18, CFSTR("Localizable"));
    v115 = (NSString *)objc_claimAutoreleasedReturnValue();
    v116 = self->_messageBubbleInviteDeclineAlertSheetTitle;
    self->_messageBubbleInviteDeclineAlertSheetTitle = v115;

  }
  objc_msgSend(v123, "objectForKeyedSubscript:", CFSTR("messageBubbleInviteDeclineAlertSheetMessage"));
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v118 = v117;
  if (v117)
  {
    v119 = v117;
    messageBubbleInviteDeclineAlertSheetMessage = self->_messageBubbleInviteDeclineAlertSheetMessage;
    self->_messageBubbleInviteDeclineAlertSheetMessage = v119;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    messageBubbleInviteDeclineAlertSheetMessage = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(messageBubbleInviteDeclineAlertSheetMessage, "localizedStringForKey:value:table:", CFSTR("InviteDeclineAlertSheetMessage"), &stru_1E8565C18, CFSTR("Localizable"));
    v121 = (NSString *)objc_claimAutoreleasedReturnValue();
    v122 = self->_messageBubbleInviteDeclineAlertSheetMessage;
    self->_messageBubbleInviteDeclineAlertSheetMessage = v121;

  }
}

- (id)privacySafeInvitees
{
  void *v2;
  void *v3;

  -[FAInviteContext invitees](self, "invitees");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[FAHandlePrivacyResolver privacySafeInvitees:](FAHandlePrivacyResolver, "privacySafeInvitees:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[FAInviteContext title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FAInviteContext subtitle](self, "subtitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FAInviteContext action](self, "action");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FAInviteContext inviteURL](self, "inviteURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "absoluteString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FAInviteContext invitees](self, "invitees");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - title: %@ subtitle: %@ action: %@ inviteURL: %@ invitees: %@ canEditRecipients: %d"), v4, v5, v6, v7, v9, v10, -[FAInviteContext canEditRecipients](self, "canEditRecipients"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)buildInviteMessageBubbleURL:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
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
  id v34;
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
  id v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  NSObject *v66;
  void *v67;
  void *v68;
  id v70;
  uint8_t buf[4];
  void *v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0CB3998];
  v5 = a3;
  v70 = objc_alloc_init(v4);
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("messageTitle"), self->_messageBubbleTitle);
  objc_msgSend(v6, "addObject:", v7);

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("messageSubTitle"), self->_messageBubbleSubTitle);
  objc_msgSend(v6, "addObject:", v8);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("messageSubTitleTeen"), self->_messageBubbleSubTitleTeen);
  objc_msgSend(v6, "addObject:", v9);

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("inviteButtonLabel"), self->_messageBubbleViewInvitationButtonLabel);
  objc_msgSend(v6, "addObject:", v10);

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("acceptButtonLabel"), self->_messageBubbleInviteAcceptButtonLabel);
  objc_msgSend(v6, "addObject:", v11);

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("declineButtonLabel"), self->_messageBubbleInviteDeclineButtonLabel);
  objc_msgSend(v6, "addObject:", v12);

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("learnMoreLinkLabel"), self->_messageBubbleLearnMoreLinkLabel);
  objc_msgSend(v6, "addObject:", v13);

  v14 = objc_alloc(MEMORY[0x1E0CB39D8]);
  -[NSURL absoluteString](self->_inviteURL, "absoluteString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithName:value:", CFSTR("inviteUrl"), v15);
  objc_msgSend(v6, "addObject:", v16);

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("subscriptionList"), self->_messageBubbleSubscriptionsList);
  objc_msgSend(v6, "addObject:", v17);

  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("familySettingsLinkLabel"), self->_messageBubbleFamilySettingsLinkLabel);
  objc_msgSend(v6, "addObject:", v18);

  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("appleIDSettingsLinkLabel"), self->_messageBubbleAppleIDSettingsLinkLabel);
  objc_msgSend(v6, "addObject:", v19);

  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("inviteLoadingLabel"), self->_messageBubbleInviteLoadingLabel);
  objc_msgSend(v6, "addObject:", v20);

  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("receiverHandle"), v5);
  objc_msgSend(v6, "addObject:", v21);

  objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "aa_primaryAppleAccount");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "username");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("senderHandle"), v24);
  objc_msgSend(v6, "addObject:", v25);

  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("pendingTitle"), self->_messageBubbleInvitePendingTitle);
  objc_msgSend(v6, "addObject:", v26);

  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("pendingSubTitle"), self->_messageBubbleInvitePendingSubTitle);
  objc_msgSend(v6, "addObject:", v27);

  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("pendingIcon"), self->_messageBubbleInvitePendingIcon);
  objc_msgSend(v6, "addObject:", v28);

  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("acceptedTitleSender"), self->_messageBubbleInviteAcceptedTitleSender);
  objc_msgSend(v6, "addObject:", v29);

  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("acceptedTitleReceiver"), self->_messageBubbleInviteAcceptedTitleReceiver);
  objc_msgSend(v6, "addObject:", v30);

  v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("acceptedSubTitleReceiver"), self->_messageBubbleInviteAcceptedSubTitleReceiver);
  objc_msgSend(v6, "addObject:", v31);

  v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("acceptedSubTitleSender"), self->_messageBubbleInviteAcceptedSubTitleSender);
  objc_msgSend(v6, "addObject:", v32);

  v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("acceptedIcon"), self->_messageBubbleInviteAcceptedIcon);
  objc_msgSend(v6, "addObject:", v33);

  v34 = objc_alloc(MEMORY[0x1E0CB39D8]);
  -[NSURL absoluteString](self->_messageBubbleAcceptInviteURL, "absoluteString");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)objc_msgSend(v34, "initWithName:value:", CFSTR("acceptInviteUrl"), v35);
  objc_msgSend(v6, "addObject:", v36);

  v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("expiredTitleSender"), self->_messageBubbleInviteExpiredTitleSender);
  objc_msgSend(v6, "addObject:", v37);

  v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("expiredTitleReceiver"), self->_messageBubbleInviteExpiredTitleReceiver);
  objc_msgSend(v6, "addObject:", v38);

  v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("expiredSubTitleReceiver"), self->_messageBubbleInviteExpiredSubTitleReceiver);
  objc_msgSend(v6, "addObject:", v39);

  v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("expiredSubTitleSender"), self->_messageBubbleInviteExpiredSubTitleSender);
  objc_msgSend(v6, "addObject:", v40);

  v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("expiredIcon"), self->_messageBubbleInviteExpiredIcon);
  objc_msgSend(v6, "addObject:", v41);

  v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("declinedTitleSender"), self->_messageBubbleInviteDeclinedTitleSender);
  objc_msgSend(v6, "addObject:", v42);

  v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("declinedTitleReceiver"), self->_messageBubbleInviteDeclinedTitleReceiver);
  objc_msgSend(v6, "addObject:", v43);

  v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("declinedSubTitleReceiver"), self->_messageBubbleInviteDeclinedSubTitleReceiver);
  objc_msgSend(v6, "addObject:", v44);

  v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("declinedSubTitleSender"), self->_messageBubbleInviteDeclinedSubTitleSender);
  objc_msgSend(v6, "addObject:", v45);

  v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("declinedIcon"), self->_messageBubbleInviteDeclinedIcon);
  objc_msgSend(v6, "addObject:", v46);

  v47 = objc_alloc(MEMORY[0x1E0CB39D8]);
  -[NSURL absoluteString](self->_messageBubbleDeclineInviteURL, "absoluteString");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = (void *)objc_msgSend(v47, "initWithName:value:", CFSTR("declineInviteUrl"), v48);
  objc_msgSend(v6, "addObject:", v49);

  v50 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v50, "setDateFormat:", CFSTR("yyyy-MM-dd"));
  v51 = objc_alloc(MEMORY[0x1E0CB39D8]);
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "stringFromDate:", v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = (void *)objc_msgSend(v51, "initWithName:value:", CFSTR("senderMessageDate"), v53);
  objc_msgSend(v6, "addObject:", v54);

  v55 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("declineAlertTitle"), self->_messageBubbleInviteDeclineAlertSheetTitle);
  objc_msgSend(v6, "addObject:", v55);

  v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("declineAlertMessage"), self->_messageBubbleInviteDeclineAlertSheetMessage);
  objc_msgSend(v6, "addObject:", v56);

  v57 = objc_alloc(MEMORY[0x1E0CB39D8]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "localizedStringForKey:value:table:", CFSTR("DeclineAlertButtonTitle"), &stru_1E8565C18, CFSTR("Localizable"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = (void *)objc_msgSend(v57, "initWithName:value:", CFSTR("declineAlertButtonTitle"), v59);
  objc_msgSend(v6, "addObject:", v60);

  v61 = objc_alloc(MEMORY[0x1E0CB39D8]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E8565C18, CFSTR("Localizable"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = (void *)objc_msgSend(v61, "initWithName:value:", CFSTR("declineAlertCancelButtonTitle"), v63);
  objc_msgSend(v6, "addObject:", v64);

  v65 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(v70, "setQueryItems:", v65);

  _FALogSystem();
  v66 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v70, "URL");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v72 = v67;
    _os_log_impl(&dword_1CAEBA000, v66, OS_LOG_TYPE_DEFAULT, "message bubble url %@", buf, 0xCu);

  }
  objc_msgSend(v70, "URL");
  v68 = (void *)objc_claimAutoreleasedReturnValue();

  return v68;
}

- (NSString)eventType
{
  return self->_eventType;
}

- (void)setEventType:(id)a3
{
  objc_storeStrong((id *)&self->_eventType, a3);
}

- (unint64_t)validation
{
  return self->_validation;
}

- (void)setValidation:(unint64_t)a3
{
  self->_validation = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)secondaryTitle
{
  return self->_secondaryTitle;
}

- (void)setSecondaryTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSURL)imageURL
{
  return self->_imageURL;
}

- (void)setImageURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSURL)iconURL
{
  return self->_iconURL;
}

- (void)setIconURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSURL)inviteURL
{
  return self->_inviteURL;
}

- (void)setInviteURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSURL)reportInviteeDetailsUrl
{
  return self->_reportInviteeDetailsUrl;
}

- (void)setReportInviteeDetailsUrl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)overlaidTextColorString
{
  return self->_overlaidTextColorString;
}

- (void)setOverlaidTextColorString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSArray)invitees
{
  return self->_invitees;
}

- (void)setInvitees:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (BOOL)canEditRecipients
{
  return self->_canEditRecipients;
}

- (void)setCanEditRecipients:(BOOL)a3
{
  self->_canEditRecipients = a3;
}

- (unint64_t)remainingFamilySpots
{
  return self->_remainingFamilySpots;
}

- (NSString)mailLinkTitle
{
  return self->_mailLinkTitle;
}

- (void)setMailLinkTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)mailLinkSubtitle
{
  return self->_mailLinkSubtitle;
}

- (void)setMailLinkSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSString)mailMessageSubject
{
  return self->_mailMessageSubject;
}

- (void)setMailMessageSubject:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)mailMessageBodyHTML
{
  return self->_mailMessageBodyHTML;
}

- (void)setMailMessageBodyHTML:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSString)messageBubbleTitle
{
  return self->_messageBubbleTitle;
}

- (void)setMessageBubbleTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSString)messageBubbleSubTitle
{
  return self->_messageBubbleSubTitle;
}

- (void)setMessageBubbleSubTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSString)messageBubbleSubTitleTeen
{
  return self->_messageBubbleSubTitleTeen;
}

- (void)setMessageBubbleSubTitleTeen:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSString)messageBubbleViewInvitationButtonLabel
{
  return self->_messageBubbleViewInvitationButtonLabel;
}

- (void)setMessageBubbleViewInvitationButtonLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSString)messageBubbleInviteDeclineButtonLabel
{
  return self->_messageBubbleInviteDeclineButtonLabel;
}

- (void)setMessageBubbleInviteDeclineButtonLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSString)messageBubbleInviteAcceptButtonLabel
{
  return self->_messageBubbleInviteAcceptButtonLabel;
}

- (void)setMessageBubbleInviteAcceptButtonLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSString)messageBubbleSubscriptionsList
{
  return self->_messageBubbleSubscriptionsList;
}

- (void)setMessageBubbleSubscriptionsList:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSString)messageBubbleFamilySettingsLinkLabel
{
  return self->_messageBubbleFamilySettingsLinkLabel;
}

- (void)setMessageBubbleFamilySettingsLinkLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (NSString)messageBubbleAppleIDSettingsLinkLabel
{
  return self->_messageBubbleAppleIDSettingsLinkLabel;
}

- (void)setMessageBubbleAppleIDSettingsLinkLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (NSString)messageBubbleLearnMoreLinkLabel
{
  return self->_messageBubbleLearnMoreLinkLabel;
}

- (void)setMessageBubbleLearnMoreLinkLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (NSString)messageBubbleInviteLoadingLabel
{
  return self->_messageBubbleInviteLoadingLabel;
}

- (void)setMessageBubbleInviteLoadingLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (NSString)messageBubbleInviteAcceptedTitleSender
{
  return self->_messageBubbleInviteAcceptedTitleSender;
}

- (void)setMessageBubbleInviteAcceptedTitleSender:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (NSString)messageBubbleInviteAcceptedTitleReceiver
{
  return self->_messageBubbleInviteAcceptedTitleReceiver;
}

- (void)setMessageBubbleInviteAcceptedTitleReceiver:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (NSString)messageBubbleInviteAcceptedIcon
{
  return self->_messageBubbleInviteAcceptedIcon;
}

- (void)setMessageBubbleInviteAcceptedIcon:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (NSString)messageBubbleInviteAcceptedSubTitleSender
{
  return self->_messageBubbleInviteAcceptedSubTitleSender;
}

- (void)setMessageBubbleInviteAcceptedSubTitleSender:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (NSString)messageBubbleInviteAcceptedSubTitleReceiver
{
  return self->_messageBubbleInviteAcceptedSubTitleReceiver;
}

- (void)setMessageBubbleInviteAcceptedSubTitleReceiver:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (NSURL)messageBubbleAcceptInviteURL
{
  return self->_messageBubbleAcceptInviteURL;
}

- (void)setMessageBubbleAcceptInviteURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (NSString)messageBubbleInviteDeclinedTitleSender
{
  return self->_messageBubbleInviteDeclinedTitleSender;
}

- (void)setMessageBubbleInviteDeclinedTitleSender:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (NSString)messageBubbleInviteDeclinedTitleReceiver
{
  return self->_messageBubbleInviteDeclinedTitleReceiver;
}

- (void)setMessageBubbleInviteDeclinedTitleReceiver:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (NSString)messageBubbleInviteDeclinedIcon
{
  return self->_messageBubbleInviteDeclinedIcon;
}

- (void)setMessageBubbleInviteDeclinedIcon:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 304);
}

- (NSString)messageBubbleInviteDeclinedSubTitleSender
{
  return self->_messageBubbleInviteDeclinedSubTitleSender;
}

- (void)setMessageBubbleInviteDeclinedSubTitleSender:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 312);
}

- (NSString)messageBubbleInviteDeclinedSubTitleReceiver
{
  return self->_messageBubbleInviteDeclinedSubTitleReceiver;
}

- (void)setMessageBubbleInviteDeclinedSubTitleReceiver:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 320);
}

- (NSURL)messageBubbleDeclineInviteURL
{
  return self->_messageBubbleDeclineInviteURL;
}

- (void)setMessageBubbleDeclineInviteURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 328);
}

- (NSString)messageBubbleInviteExpiredTitleSender
{
  return self->_messageBubbleInviteExpiredTitleSender;
}

- (void)setMessageBubbleInviteExpiredTitleSender:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 336);
}

- (NSString)messageBubbleInviteExpiredTitleReceiver
{
  return self->_messageBubbleInviteExpiredTitleReceiver;
}

- (void)setMessageBubbleInviteExpiredTitleReceiver:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 344);
}

- (NSString)messageBubbleInviteExpiredIcon
{
  return self->_messageBubbleInviteExpiredIcon;
}

- (void)setMessageBubbleInviteExpiredIcon:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 352);
}

- (NSString)messageBubbleInviteExpiredSubTitleSender
{
  return self->_messageBubbleInviteExpiredSubTitleSender;
}

- (void)setMessageBubbleInviteExpiredSubTitleSender:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 360);
}

- (NSString)messageBubbleInviteExpiredSubTitleReceiver
{
  return self->_messageBubbleInviteExpiredSubTitleReceiver;
}

- (void)setMessageBubbleInviteExpiredSubTitleReceiver:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 368);
}

- (NSString)messageBubbleInvitePendingTitle
{
  return self->_messageBubbleInvitePendingTitle;
}

- (void)setMessageBubbleInvitePendingTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 376);
}

- (NSString)messageBubbleInvitePendingSubTitle
{
  return self->_messageBubbleInvitePendingSubTitle;
}

- (void)setMessageBubbleInvitePendingSubTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 384);
}

- (NSString)messageBubbleInvitePendingIcon
{
  return self->_messageBubbleInvitePendingIcon;
}

- (void)setMessageBubbleInvitePendingIcon:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 392);
}

- (NSString)messageBubbleInviteDeclineAlertSheetTitle
{
  return self->_messageBubbleInviteDeclineAlertSheetTitle;
}

- (void)setMessageBubbleInviteDeclineAlertSheetTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 400);
}

- (NSString)messageBubbleInviteDeclineAlertSheetMessage
{
  return self->_messageBubbleInviteDeclineAlertSheetMessage;
}

- (void)setMessageBubbleInviteDeclineAlertSheetMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 408);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageBubbleInviteDeclineAlertSheetMessage, 0);
  objc_storeStrong((id *)&self->_messageBubbleInviteDeclineAlertSheetTitle, 0);
  objc_storeStrong((id *)&self->_messageBubbleInvitePendingIcon, 0);
  objc_storeStrong((id *)&self->_messageBubbleInvitePendingSubTitle, 0);
  objc_storeStrong((id *)&self->_messageBubbleInvitePendingTitle, 0);
  objc_storeStrong((id *)&self->_messageBubbleInviteExpiredSubTitleReceiver, 0);
  objc_storeStrong((id *)&self->_messageBubbleInviteExpiredSubTitleSender, 0);
  objc_storeStrong((id *)&self->_messageBubbleInviteExpiredIcon, 0);
  objc_storeStrong((id *)&self->_messageBubbleInviteExpiredTitleReceiver, 0);
  objc_storeStrong((id *)&self->_messageBubbleInviteExpiredTitleSender, 0);
  objc_storeStrong((id *)&self->_messageBubbleDeclineInviteURL, 0);
  objc_storeStrong((id *)&self->_messageBubbleInviteDeclinedSubTitleReceiver, 0);
  objc_storeStrong((id *)&self->_messageBubbleInviteDeclinedSubTitleSender, 0);
  objc_storeStrong((id *)&self->_messageBubbleInviteDeclinedIcon, 0);
  objc_storeStrong((id *)&self->_messageBubbleInviteDeclinedTitleReceiver, 0);
  objc_storeStrong((id *)&self->_messageBubbleInviteDeclinedTitleSender, 0);
  objc_storeStrong((id *)&self->_messageBubbleAcceptInviteURL, 0);
  objc_storeStrong((id *)&self->_messageBubbleInviteAcceptedSubTitleReceiver, 0);
  objc_storeStrong((id *)&self->_messageBubbleInviteAcceptedSubTitleSender, 0);
  objc_storeStrong((id *)&self->_messageBubbleInviteAcceptedIcon, 0);
  objc_storeStrong((id *)&self->_messageBubbleInviteAcceptedTitleReceiver, 0);
  objc_storeStrong((id *)&self->_messageBubbleInviteAcceptedTitleSender, 0);
  objc_storeStrong((id *)&self->_messageBubbleInviteLoadingLabel, 0);
  objc_storeStrong((id *)&self->_messageBubbleLearnMoreLinkLabel, 0);
  objc_storeStrong((id *)&self->_messageBubbleAppleIDSettingsLinkLabel, 0);
  objc_storeStrong((id *)&self->_messageBubbleFamilySettingsLinkLabel, 0);
  objc_storeStrong((id *)&self->_messageBubbleSubscriptionsList, 0);
  objc_storeStrong((id *)&self->_messageBubbleInviteAcceptButtonLabel, 0);
  objc_storeStrong((id *)&self->_messageBubbleInviteDeclineButtonLabel, 0);
  objc_storeStrong((id *)&self->_messageBubbleViewInvitationButtonLabel, 0);
  objc_storeStrong((id *)&self->_messageBubbleSubTitleTeen, 0);
  objc_storeStrong((id *)&self->_messageBubbleSubTitle, 0);
  objc_storeStrong((id *)&self->_messageBubbleTitle, 0);
  objc_storeStrong((id *)&self->_mailMessageBodyHTML, 0);
  objc_storeStrong((id *)&self->_mailMessageSubject, 0);
  objc_storeStrong((id *)&self->_mailLinkSubtitle, 0);
  objc_storeStrong((id *)&self->_mailLinkTitle, 0);
  objc_storeStrong((id *)&self->_invitees, 0);
  objc_storeStrong((id *)&self->_overlaidTextColorString, 0);
  objc_storeStrong((id *)&self->_reportInviteeDetailsUrl, 0);
  objc_storeStrong((id *)&self->_inviteURL, 0);
  objc_storeStrong((id *)&self->_iconURL, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_secondaryTitle, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_eventType, 0);
}

@end
