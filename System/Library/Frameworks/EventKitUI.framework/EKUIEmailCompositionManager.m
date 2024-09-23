@implementation EKUIEmailCompositionManager

- (EKUIEmailCompositionManager)initWithEvent:(id)a3 participantRecipients:(id)a4 subjectPrefix:(id)a5 bodyPrefix:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  EKUIEmailCompositionManager *v15;
  EKUIEmailCompositionManager *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)EKUIEmailCompositionManager;
  v15 = -[EKUIEmailCompositionManager init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_event, a3);
    objc_storeStrong((id *)&v16->_participantRecipients, a4);
    objc_storeStrong((id *)&v16->_subjectPrefix, a5);
    objc_storeStrong((id *)&v16->_bodyPrefix, a6);
    -[EKUIEmailCompositionManager initViewController](v16, "initViewController");
  }

  return v16;
}

- (EKUIEmailCompositionManager)initWithEvent:(id)a3
{
  return -[EKUIEmailCompositionManager initWithEvent:participantRecipients:subjectPrefix:bodyPrefix:](self, "initWithEvent:participantRecipients:subjectPrefix:bodyPrefix:", a3, 0, 0, 0);
}

+ (BOOL)canShowViewControllerForEvent:(id)a3 withParticipantRecipients:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  NSObject *v14;
  const char *v15;
  uint8_t *v16;
  __int16 v18;
  __int16 v19;

  v5 = a3;
  v6 = a4;
  if (!v5)
  {
    v14 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
    {
      v19 = 0;
      v15 = "No event given.  Will not determine whether this view controller should be shown.";
      v16 = (uint8_t *)&v19;
LABEL_11:
      _os_log_impl(&dword_1AF84D000, v14, OS_LOG_TYPE_DEBUG, v15, v16, 2u);
    }
LABEL_12:
    v13 = 0;
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0D0CD00], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "calendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "source");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "sourceIsManaged:", v9);

  if (v10)
    v11 = 2;
  else
    v11 = 1;
  if ((-[objc_class canSendMailSourceAccountManagement:](+[CalendarMessageUIProxy MFMailComposeViewControllerClass](CalendarMessageUIProxy, "MFMailComposeViewControllerClass"), "canSendMailSourceAccountManagement:", v11) & 1) == 0)
  {
    v14 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
    {
      v18 = 0;
      v15 = "Cannot send mail, so this view shouldn't be shown.";
      v16 = (uint8_t *)&v18;
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  objc_msgSend((id)objc_opt_class(), "_recipientEmailAddressesToDisplayNames:withParticipantRecipients:", v5, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count") != 0;

LABEL_13:
  return v13;
}

- (void)initViewController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  MFMailComposeViewController *v15;
  MFMailComposeViewController *composeViewController;
  void *v17;
  void *v18;
  MFMailComposeViewController *v19;
  void *v20;
  void *v21;
  void *v22;
  MFMailComposeViewController *v23;
  void *v24;
  void *v25;
  NSString *subjectPrefix;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t);
  void *v35;
  id v36;
  _QWORD v37[4];
  id v38;
  uint8_t buf[4];
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "_recipientEmailAddressesToDisplayNames:withParticipantRecipients:", self->_event, self->_participantRecipients);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_recipientEmailAddressesToDisplayNames:withParticipantRecipients:", self->_event, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v7 = MEMORY[0x1E0C809B0];
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __49__EKUIEmailCompositionManager_initViewController__block_invoke;
  v37[3] = &unk_1E6019078;
  v8 = v5;
  v38 = v8;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v37);
  v32 = v7;
  v33 = 3221225472;
  v34 = __49__EKUIEmailCompositionManager_initViewController__block_invoke_2;
  v35 = &unk_1E6019078;
  v9 = v6;
  v36 = v9;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", &v32);
  objc_msgSend(MEMORY[0x1E0D0CD00], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEvent calendar](self->_event, "calendar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "source");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v10, "sourceIsManaged:", v12);

  if (v13)
    v14 = 2;
  else
    v14 = 1;
  v15 = (MFMailComposeViewController *)objc_msgSend(objc_alloc(+[CalendarMessageUIProxy MFMailComposeViewControllerClass](CalendarMessageUIProxy, "MFMailComposeViewControllerClass")), "initWithURL:sourceAccountManagement:", 0, v14);
  composeViewController = self->_composeViewController;
  self->_composeViewController = v15;

  -[MFMailComposeViewController setMailComposeDelegate:](self->_composeViewController, "setMailComposeDelegate:", self);
  -[MFMailComposeViewController setToRecipients:](self->_composeViewController, "setToRecipients:", v8);
  -[EKEvent selfAttendee](self->_event, "selfAttendee");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "emailAddress");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v19 = self->_composeViewController;
    -[EKEvent selfAttendee](self->_event, "selfAttendee");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "emailAddress");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMailComposeViewController setPreferredSendingEmailAddress:](v19, "setPreferredSendingEmailAddress:", v21);

  }
  if (-[EKEvent isSelfOrganized](self->_event, "isSelfOrganized"))
  {
    -[EKEvent organizer](self->_event, "organizer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      v23 = self->_composeViewController;
      -[EKEvent organizer](self->_event, "organizer");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "emailAddress");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFMailComposeViewController setPreferredSendingEmailAddress:](v23, "setPreferredSendingEmailAddress:", v25);

    }
  }
  subjectPrefix = self->_subjectPrefix;
  if (subjectPrefix)
  {
    v27 = (void *)MEMORY[0x1E0CB3940];
    -[EKEvent title](self->_event, "title");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "stringWithFormat:", CFSTR("%@ %@"), subjectPrefix, v28, v32, v33, v34, v35);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMailComposeViewController setSubject:](self->_composeViewController, "setSubject:", v29);

  }
  else
  {
    -[EKEvent title](self->_event, "title");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMailComposeViewController setSubject:](self->_composeViewController, "setSubject:", v28);
  }

  -[EKUIEmailCompositionManager _htmlBodyForMailMessageWithNames:](self, "_htmlBodyForMailMessageWithNames:", v9);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailComposeViewController setMessageBody:isHTML:](self->_composeViewController, "setMessageBody:isHTML:", v30, 1);
  v31 = kEKUILogHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v40 = v30;
    _os_log_impl(&dword_1AF84D000, v31, OS_LOG_TYPE_DEBUG, "Applied HTML message body: [%@]", buf, 0xCu);
  }

}

uint64_t __49__EKUIEmailCompositionManager_initViewController__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

uint64_t __49__EKUIEmailCompositionManager_initViewController__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

- (void)mailComposeController:(id)a3 didFinishWithResult:(int64_t)a4 error:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void (**v13)(_QWORD, _QWORD);
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (a4 == 3)
  {
    v10 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      v14 = 138412290;
      v15 = v9;
      _os_log_impl(&dword_1AF84D000, v10, OS_LOG_TYPE_ERROR, "Mail compose controller failed to send result: %@", (uint8_t *)&v14, 0xCu);
    }
  }
  -[EKUIEmailCompositionManager messageSendingComplete](self, "messageSendingComplete");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = kEKUILogHandle;
  if (v11)
  {
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_1AF84D000, v12, OS_LOG_TYPE_DEFAULT, "Notify of composition completion.", (uint8_t *)&v14, 2u);
    }
    -[EKUIEmailCompositionManager messageSendingComplete](self, "messageSendingComplete");
    v13 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, BOOL))v13)[2](v13, a4 == 2);

  }
  else if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v14) = 0;
    _os_log_impl(&dword_1AF84D000, v12, OS_LOG_TYPE_ERROR, "No 'messageSendingComplete' block provided.  Will not notify of completion.", (uint8_t *)&v14, 2u);
  }

}

+ (id)_recipientEmailAddressesToDisplayNames:(id)a3 withParticipantRecipients:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  void *v14;
  id v15;
  uint8_t buf[16];

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!objc_msgSend(v6, "count"))
  {
    +[EKUICommunicationUtilities attendeesIgnoringMe:](EKUICommunicationUtilities, "attendeesIgnoringMe:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v8 = objc_msgSend(v7, "count");
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v8);
  v10 = kEKUILogHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF84D000, v10, OS_LOG_TYPE_DEBUG, "Generating a mapping between recipient email addresses and display names.", buf, 2u);
  }
  v14 = v7;
  v15 = v9;
  v11 = v7;
  CalendarFoundationPerformBlockOnSharedContactStore();
  v12 = v15;

  return v12;
}

void __96__EKUIEmailCompositionManager__recipientEmailAddressesToDisplayNames_withParticipantRecipients___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
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
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id obj;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  void *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v28 = a2;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = *(id *)(a1 + 32);
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v30;
    v26 = *MEMORY[0x1E0C966A8];
    v6 = 0x1E0C97000uLL;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v30 != v5)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v8, "emailAddress");
        v9 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "name");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          if (v9)
            goto LABEL_19;
        }
        else
        {
          objc_msgSend(*(id *)(v6 + 536), "descriptorForRequiredKeysForStyle:", 0);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = v11;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v8, "contactPredicate");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "unifiedContactsMatchingPredicate:keysToFetch:error:", v13, v12, 0);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v14, "count"))
          {
            v15 = *(void **)(v6 + 536);
            objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "stringFromContact:style:", v16, 0);
            v10 = (void *)objc_claimAutoreleasedReturnValue();

            v6 = 0x1E0C97000;
          }
          else
          {
            v10 = 0;
          }

          if (v9)
          {
LABEL_19:
            if (v10)
              v25 = v10;
            else
              v25 = (void *)v9;
            objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v25, v9);
            v17 = (void *)v9;
            goto LABEL_23;
          }
        }
        v33 = v26;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "contactPredicate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "unifiedContactsMatchingPredicate:keysToFetch:error:", v18, v17, 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (!objc_msgSend(v19, "count"))
        {

LABEL_23:
          goto LABEL_24;
        }
        objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "emailAddresses");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "count");

        if (v22)
        {
          objc_msgSend(v20, "emailAddresses");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "objectAtIndexedSubscript:", 0);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v24, "value");
          v9 = objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v9 = 0;
        }
        v6 = 0x1E0C97000;

        if (v9)
          goto LABEL_19;
LABEL_24:

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v4);
  }

}

- (id)_htmlBodyForMailMessageWithNames:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
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

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v5, "appendString:", CFSTR("<br><br>"));
  if (self->_bodyPrefix)
    objc_msgSend(v5, "appendString:");
  objc_msgSend(v5, "appendString:", CFSTR("<br><br>"));
  -[EKEvent title](self->_event, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("<b>%@</b><br>"), v6);

  objc_msgSend(MEMORY[0x1E0D0CD58], "sharedGenerator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateStringRepresentationForEvent:", self->_event);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v5, "appendFormat:", CFSTR("%@<br>"), v8);
  -[EKEvent locationWithoutPrediction](self->_event, "locationWithoutPrediction");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");

  if (v10)
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    EventKitUIBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Location: %@"), &stru_1E601DFA8, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEvent locationWithoutPrediction](self->_event, "locationWithoutPrediction");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringWithFormat:", v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("%@<br>"), v15);

  }
  -[EKEvent virtualConference](self->_event, "virtualConference");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0D0CD58], "sharedGenerator");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "virtualConferenceEmailHTMLRepresentation:", self->_event);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendString:", v18);

  }
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 12.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mf_commaSeparatedRecipientListWithWidth:forFont:", v19, 1.79769313e308);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = (void *)MEMORY[0x1E0CB3940];
    EventKitUIBundle();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("Invitees: %@"), &stru_1E601DFA8, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "localizedStringWithFormat:", v23, v20);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("%@"), v24);

  }
  return v5;
}

- (id)messageSendingComplete
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setMessageSendingComplete:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (EKEvent)event
{
  return self->_event;
}

- (void)setEvent:(id)a3
{
  objc_storeStrong((id *)&self->_event, a3);
}

- (MFMailComposeViewController)composeViewController
{
  return self->_composeViewController;
}

- (void)setComposeViewController:(id)a3
{
  objc_storeStrong((id *)&self->_composeViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_composeViewController, 0);
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong(&self->_messageSendingComplete, 0);
  objc_storeStrong((id *)&self->_bodyPrefix, 0);
  objc_storeStrong((id *)&self->_subjectPrefix, 0);
  objc_storeStrong((id *)&self->_participantRecipients, 0);
}

@end
