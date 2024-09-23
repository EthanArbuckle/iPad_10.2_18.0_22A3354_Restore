@implementation UNNotificationContent

- (id)contentByUpdatingWithSendMessageIntent:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  const __CFString *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  _BOOL4 v23;
  uint64_t v24;
  unint64_t v25;
  void *v26;
  unint64_t v27;
  unint64_t v28;
  void *v29;
  int v30;
  __CFString **v31;
  NSObject *v32;
  void *v33;
  _QWORD v35[4];
  id v36;
  id v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  char v42;
  uint8_t buf[4];
  const char *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  +[_UNMutableNotificationCommunicationContext mutableContextFromINIntent:](_UNMutableNotificationCommunicationContext, "mutableContextFromINIntent:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sender");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v5, "serviceName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UNNotificationContact contactFromINPerson:serviceName:](_UNNotificationContact, "contactFromINPerson:serviceName:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v6, "setSender:", v9);
    }
    else
    {
      objc_msgSend(v5, "sender");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isMe");

      if (v11)
        v12 = CFSTR("Warning: -[INSendMessageIntent sender] isMe is YES. isMe should be NO for incoming notifications. Some notification features associated with INSendMessageIntent will not work.");
      else
        v12 = CFSTR("Warning: -[INSendMessageIntent sender] is invalid. Some notification features associated with INSendMessageIntent will not work.");
      UNLogToDeveloper((uint64_t)CFSTR("-[UNNotificationContent contentByUpdatingWithProvider:(id<UNNotificationContentProviding>) error:(NSError *)]"), (uint64_t)v12);
    }

  }
  else
  {
    UNLogToDeveloper((uint64_t)CFSTR("-[UNNotificationContent contentByUpdatingWithProvider:(id<UNNotificationContentProviding>) error:(NSError *)]"), (uint64_t)CFSTR("Warning: -[INSendMessageIntent sender] is nil. Some notification features associated with INSendMessageIntent will not work."));
  }
  v39 = 0;
  v40 = &v39;
  v41 = 0x2020000000;
  v42 = 0;
  objc_msgSend(v5, "recipients");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v14)
  {
    v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v5, "recipients");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __109__UNNotificationContent_UserNotifications_INSendMessageIntent__contentByUpdatingWithSendMessageIntent_error___block_invoke;
    v35[3] = &unk_1E57EF9C8;
    v36 = v5;
    v17 = v15;
    v37 = v17;
    v38 = &v39;
    objc_msgSend(v16, "enumerateObjectsUsingBlock:", v35);

    objc_msgSend(v6, "setRecipients:", v17);
  }
  objc_msgSend(v5, "speakableGroupName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "spokenPhrase");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDisplayName:", v19);

  objc_msgSend(v5, "conversationIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIdentifier:", v20);

  objc_msgSend(v5, "donationMetadata");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = UNLogCommunicationNotifications;
  v23 = os_log_type_enabled((os_log_t)UNLogCommunicationNotifications, OS_LOG_TYPE_DEFAULT);
  if (v21)
  {
    if (v23)
    {
      *(_DWORD *)buf = 136446210;
      v44 = "-[UNNotificationContent(UserNotifications_INSendMessageIntent) contentByUpdatingWithSendMessageIntent:error:]";
      _os_log_impl(&dword_1AA8E4000, v22, OS_LOG_TYPE_DEFAULT, "%{public}s: Intent has INSendMessageIntentDonationMetadata", buf, 0xCu);
    }
    objc_msgSend(v6, "setMentionsCurrentUser:", objc_msgSend(v21, "mentionsCurrentUser"));
    objc_msgSend(v6, "setNotifyRecipientAnyway:", objc_msgSend(v21, "notifyRecipientAnyway"));
    objc_msgSend(v6, "setReplyToCurrentUser:", objc_msgSend(v21, "isReplyToCurrentUser"));
    objc_msgSend(v6, "setBusinessCorrespondence:", objc_msgSend(v21, "isBusinessChat"));
    v24 = objc_msgSend(v21, "recipientCount");
    if (v24)
    {
      v25 = v24 - *((char *)v40 + 24);
      goto LABEL_20;
    }
  }
  else if (v23)
  {
    *(_DWORD *)buf = 136446210;
    v44 = "-[UNNotificationContent(UserNotifications_INSendMessageIntent) contentByUpdatingWithSendMessageIntent:error:]";
    _os_log_impl(&dword_1AA8E4000, v22, OS_LOG_TYPE_DEFAULT, "%{public}s: Intent does not have INSendMessageIntentDonationMetadata", buf, 0xCu);
  }
  v25 = 0;
LABEL_20:
  objc_msgSend(v6, "recipients");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "count");

  if (v27 <= v25)
    v28 = v25;
  else
    v28 = v27;
  objc_msgSend(v6, "setRecipientCount:", v28);
  v29 = (void *)-[UNNotificationContent mutableCopy](self, "mutableCopy");
  objc_msgSend(v29, "setCommunicationContext:", v6);
  v30 = objc_msgSend(v6, "isGroup");
  v31 = _UNNotificationContentTypeMessagingGroup;
  if (!v30)
    v31 = _UNNotificationContentTypeMessagingDirect;
  objc_msgSend(v29, "setContentType:", *v31);
  v32 = (id)UNLogCommunicationNotifications;
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v29, "contentType");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446466;
    v44 = "-[UNNotificationContent(UserNotifications_INSendMessageIntent) contentByUpdatingWithSendMessageIntent:error:]";
    v45 = 2114;
    v46 = v33;
    _os_log_impl(&dword_1AA8E4000, v32, OS_LOG_TYPE_DEFAULT, "%{public}s: Created communication context for INSendMessageIntent. Set -[UNNotificationContent contentType] to '%{public}@'", buf, 0x16u);

  }
  _Block_object_dispose(&v39, 8);

  return v29;
}

void __109__UNNotificationContent_UserNotifications_INSendMessageIntent__contentByUpdatingWithSendMessageIntent_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "serviceName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UNNotificationContact contactFromINPerson:serviceName:](_UNNotificationContact, "contactFromINPerson:serviceName:", v5, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);
  }
  else if (objc_msgSend(v5, "isMe"))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }

}

- (id)contentByUpdatingWithAttributedMessageContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "sendMessageIntent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[UNNotificationContent contentByUpdatingWithSendMessageIntent:error:](self, "contentByUpdatingWithSendMessageIntent:error:", v8, a4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v9, "mutableCopy");

      objc_msgSend(v7, "attributedContent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setAttributedBody:", v11);

      v12 = (void *)objc_msgSend(v10, "copy");
    }
    else
    {
      UNLogToDeveloper((uint64_t)CFSTR("-[UNNotificationContent contentByUpdatingWithProvider:(id<UNNotificationContentProviding>) error:(NSError *)]"), (uint64_t)CFSTR("Warning: [UNNotificationAttributedMessageContext sendMessageIntent] is nil. Some notification features associated with INSendMessageIntent will not work."));
      v12 = (void *)-[UNNotificationContent copy](self, "copy");
    }

  }
  else
  {
    UNLogToDeveloper((uint64_t)CFSTR("-[UNNotificationContent contentByUpdatingWithProvider:(id<UNNotificationContentProviding>) error:(NSError *)]"), (uint64_t)CFSTR("Warning: attributedMessageContext is nil. Some notification features associated with UNNotificationAttributedMessageContext will not work."));
    v12 = (void *)-[UNNotificationContent copy](self, "copy");
  }

  return v12;
}

- (id)contentByUpdatingWithStartCallIntent:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  __CFString **v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  __CFString *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  +[_UNMutableNotificationCommunicationContext mutableContextFromINIntent:](_UNMutableNotificationCommunicationContext, "mutableContextFromINIntent:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contacts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v5, "contacts");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __111__UNNotificationContent_UserNotifications_INStartCallIntentIntent__contentByUpdatingWithStartCallIntent_error___block_invoke;
    v23[3] = &unk_1E57EFA78;
    v24 = v5;
    v11 = v6;
    v25 = v11;
    v26 = v9;
    v12 = v9;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v23);

    objc_msgSend(v11, "setRecipients:", v12);
    objc_msgSend(v11, "setRecipientCount:", objc_msgSend(v12, "count"));

  }
  else
  {
    UNLogToDeveloper((uint64_t)CFSTR("-[UNNotificationContent contentByUpdatingWithProvider:(id<UNNotificationContentProviding>) error:(NSError *)]"), (uint64_t)CFSTR("Warning: -[INStartCallIntent contacts] is empty. Some notification features associated with INStartCallIntent will not work."));
  }
  if (objc_msgSend(v5, "callCapability") == 2)
    objc_msgSend(v6, "setCapabilities:", 1);
  v13 = (void *)-[UNNotificationContent mutableCopy](self, "mutableCopy");
  objc_msgSend(v13, "setCommunicationContext:", v6);
  if (objc_msgSend(v5, "destinationType") == 3)
  {
    v14 = _UNNotificationContentTypeVoicemail;
  }
  else if (objc_msgSend(v5, "destinationType") == 5
         && (objc_msgSend(v5, "callRecordToCallBack"),
             v15 = (void *)objc_claimAutoreleasedReturnValue(),
             v16 = objc_msgSend(v15, "callRecordType"),
             v15,
             v16 == 2))
  {
    v14 = _UNNotificationContentTypeMissedCall;
  }
  else
  {
    v17 = objc_msgSend(v5, "destinationType");
    v14 = _UNNotificationContentTypeCallOther;
    if (v17 == 1)
      v14 = _UNNotificationContentTypeIncomingCall;
  }
  v18 = *v14;
  objc_msgSend(v13, "setContentType:", v18);
  v19 = (void *)UNLogCommunicationNotifications;
  if (os_log_type_enabled((os_log_t)UNLogCommunicationNotifications, OS_LOG_TYPE_DEFAULT))
  {
    v20 = v19;
    objc_msgSend(v13, "contentType");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446466;
    v28 = "-[UNNotificationContent(UserNotifications_INStartCallIntentIntent) contentByUpdatingWithStartCallIntent:error:]";
    v29 = 2114;
    v30 = v21;
    _os_log_impl(&dword_1AA8E4000, v20, OS_LOG_TYPE_DEFAULT, "%{public}s: Created communication context for INStartCallIntent. Set -[UNNotificationContent contentType] to '%{public}@'", buf, 0x16u);

  }
  return v13;
}

void __111__UNNotificationContent_UserNotifications_INStartCallIntentIntent__contentByUpdatingWithStartCallIntent_error___block_invoke(id *a1, uint64_t a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  +[_UNNotificationContact contactFromINPerson:serviceName:](_UNNotificationContact, "contactFromINPerson:serviceName:", a2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v6 = v3;
    objc_msgSend(a1[4], "contacts");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (v5 == 1)
      objc_msgSend(a1[5], "setSender:", v6);
    else
      objc_msgSend(a1[6], "addObject:", v6);
    v3 = v6;
  }

}

- (id)contentByUpdatingWithReadAnnouncementIntent:(id)a3 error:(id *)a4
{
  void *v4;
  NSObject *v5;
  int v7;
  const char *v8;
  __int16 v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = (void *)-[UNNotificationContent mutableCopy](self, "mutableCopy", a3, a4);
  v5 = UNLogCommunicationNotifications;
  if (os_log_type_enabled((os_log_t)UNLogCommunicationNotifications, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136446466;
    v8 = "-[UNNotificationContent(UserNotifications_INStartCallIntentIntent) contentByUpdatingWithReadAnnouncementIntent:error:]";
    v9 = 2114;
    v10 = CFSTR("UNNotificationContentTypeIntercom");
    _os_log_impl(&dword_1AA8E4000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s: Setting content type to '%{public}@'", (uint8_t *)&v7, 0x16u);
  }
  objc_msgSend(v4, "setContentType:", CFSTR("UNNotificationContentTypeIntercom"));
  return v4;
}

- (UNNotificationContent)contentByUpdatingWithProvider:(id)provider error:(NSError *)outError
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  _BYTE buf[24];
  void *v27;
  _QWORD v28[4];

  v28[3] = *MEMORY[0x1E0C80C00];
  v6 = provider;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2050000000;
  v7 = (void *)getINSendMessageIntentClass_softClass_0;
  v25 = getINSendMessageIntentClass_softClass_0;
  if (!getINSendMessageIntentClass_softClass_0)
  {
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getINSendMessageIntentClass_block_invoke_0;
    v27 = &unk_1E57EFC28;
    v28[0] = &v22;
    __getINSendMessageIntentClass_block_invoke_0((uint64_t)buf);
    v7 = (void *)v23[3];
  }
  v8 = objc_retainAutorelease(v7);
  _Block_object_dispose(&v22, 8);
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[UNNotificationContent contentByUpdatingWithSendMessageIntent:error:](self, "contentByUpdatingWithSendMessageIntent:error:", v6, outError);
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_15:
    v14 = (void *)v9;
    goto LABEL_16;
  }
  v22 = 0;
  v23 = &v22;
  v24 = 0x2050000000;
  v10 = (void *)getINStartCallIntentClass_softClass_0;
  v25 = getINStartCallIntentClass_softClass_0;
  if (!getINStartCallIntentClass_softClass_0)
  {
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getINStartCallIntentClass_block_invoke_0;
    v27 = &unk_1E57EFC28;
    v28[0] = &v22;
    __getINStartCallIntentClass_block_invoke_0((uint64_t)buf);
    v10 = (void *)v23[3];
  }
  v11 = objc_retainAutorelease(v10);
  _Block_object_dispose(&v22, 8);
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[UNNotificationContent contentByUpdatingWithStartCallIntent:error:](self, "contentByUpdatingWithStartCallIntent:error:", v6, outError);
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  v22 = 0;
  v23 = &v22;
  v24 = 0x2050000000;
  v12 = (void *)getINReadAnnouncementIntentClass_softClass;
  v25 = getINReadAnnouncementIntentClass_softClass;
  if (!getINReadAnnouncementIntentClass_softClass)
  {
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getINReadAnnouncementIntentClass_block_invoke;
    v27 = &unk_1E57EFC28;
    v28[0] = &v22;
    __getINReadAnnouncementIntentClass_block_invoke((uint64_t)buf);
    v12 = (void *)v23[3];
  }
  v13 = objc_retainAutorelease(v12);
  _Block_object_dispose(&v22, 8);
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[UNNotificationContent contentByUpdatingWithReadAnnouncementIntent:error:](self, "contentByUpdatingWithReadAnnouncementIntent:error:", v6, outError);
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[UNNotificationContent contentByUpdatingWithAttributedMessageContext:error:](self, "contentByUpdatingWithAttributedMessageContext:error:", v6, outError);
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  if (outError)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "un_errorWithUNErrorCode:userInfo:", 1500, 0);
    *outError = (NSError *)(id)objc_claimAutoreleasedReturnValue();
  }
  objc_opt_class();
  UNLogToDeveloper((uint64_t)CFSTR("-[UNNotificationContent contentByUpdatingWithProvider:(id<UNNotificationContentProviding>) error:(NSError *)]"), (uint64_t)CFSTR("%{public}s: Error: You provided an invalid object of type %{public}@. Only system framework objects conforming to UNNotificationContentProviding are allowed."));
  v14 = 0;
LABEL_16:
  v15 = (void *)UNLogCommunicationNotifications;
  if (os_log_type_enabled((os_log_t)UNLogCommunicationNotifications, OS_LOG_TYPE_DEFAULT))
  {
    v16 = v15;
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "contentType");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "communicationContext");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446978;
    *(_QWORD *)&buf[4] = "-[UNNotificationContent contentByUpdatingWithProvider:error:]";
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v18;
    *(_WORD *)&buf[22] = 2114;
    v27 = v19;
    LOWORD(v28[0]) = 2114;
    *(_QWORD *)((char *)v28 + 2) = v20;
    _os_log_impl(&dword_1AA8E4000, v16, OS_LOG_TYPE_DEFAULT, "%{public}s: Provided object of type '%{public}@'. Assigned content type: '%{public}@' Created communication context: '%{public}@'", buf, 0x2Au);

  }
  return (UNNotificationContent *)v14;
}

- (id)_initWithContentType:(id)a3 communicationContext:(id)a4 accessoryImageName:(id)a5 attachments:(id)a6 badge:(id)a7 body:(id)a8 attributedBody:(id)a9 categoryIdentifier:(id)a10 date:(id)a11 icon:(id)a12 defaultActionTitle:(id)a13 defaultActionURL:(id)a14 defaultActionBundleIdentifier:(id)a15 expirationDate:(id)a16 header:(id)a17 footer:(id)a18 launchImageName:(id)a19 peopleIdentifiers:(id)a20 shouldHideDate:(BOOL)a21 shouldHideTime:(BOOL)a22 shouldIgnoreDoNotDisturb:(BOOL)a23 shouldIgnoreDowntime:(BOOL)a24 shouldSuppressScreenLightUp:(BOOL)a25 shouldAuthenticateDefaultAction:(BOOL)a26 shouldBackgroundDefaultAction:(BOOL)a27 shouldPreventNotificationDismissalAfterDefaultAction:(BOOL)a28 shouldShowSubordinateIcon:(BOOL)a29 shouldSuppressDefaultAction:(BOOL)a30 shouldSuppressSyncDismissalWhenRemoved:(BOOL)a31 shouldUseRequestIdentifierForDismissalSync:(BOOL)a32 shouldPreemptPresentedNotification:(BOOL)a33 shouldDisplayActionsInline:(BOOL)a34 sound:(id)a35 subtitle:(id)a36 threadIdentifier:(id)a37 title:(id)a38 topicIdentifiers:(id)a39 realertCount:(unint64_t)a40 summaryArgument:(id)a41 summaryArgumentCount:(unint64_t)a42 targetContentIdentifier:(id)a43 interruptionLevel:(unint64_t)a44 relevanceScore:(double)a45 filterCriteria:(id)a46 screenCaptureProhibited:(BOOL)a47 speechLanguage:(id)a48 userInfo:(id)a49
{
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  UNNotificationContent *v63;
  uint64_t v64;
  NSString *contentType;
  uint64_t v66;
  _UNNotificationCommunicationContext *communicationContext;
  uint64_t v68;
  NSArray *attachments;
  uint64_t v70;
  NSNumber *badge;
  uint64_t v72;
  NSString *body;
  uint64_t v74;
  NSAttributedString *attributedBody;
  uint64_t v76;
  NSString *categoryIdentifier;
  uint64_t v78;
  NSDate *date;
  uint64_t v80;
  NSDate *expirationDate;
  uint64_t v82;
  NSString *launchImageName;
  uint64_t v84;
  NSArray *peopleIdentifiers;
  uint64_t v86;
  UNNotificationSound *sound;
  uint64_t v88;
  NSString *subtitle;
  uint64_t v90;
  NSString *threadIdentifier;
  uint64_t v92;
  NSString *title;
  uint64_t v94;
  NSSet *topicIdentifiers;
  uint64_t v96;
  NSString *summaryArgument;
  uint64_t v98;
  NSString *targetContentIdentifier;
  uint64_t v100;
  NSString *filterCriteria;
  uint64_t v102;
  NSString *speechLanguage;
  uint64_t v104;
  NSDictionary *userInfo;
  id obj;
  id v109;
  id v110;
  id v111;
  id v112;
  id v113;
  id v114;
  id v115;
  void *v116;
  id v117;
  id v118;
  id v119;
  id v120;
  id v121;
  id v122;
  id v124;
  id v126;
  id v127;
  id v128;
  id v129;
  objc_super v130;

  v129 = a3;
  v128 = a4;
  obj = a5;
  v115 = a5;
  v127 = a6;
  v126 = a7;
  v124 = a8;
  v122 = a9;
  v121 = a10;
  v120 = a11;
  v114 = a12;
  v113 = a13;
  v112 = a14;
  v111 = a15;
  v119 = a16;
  v110 = a17;
  v109 = a18;
  v118 = a19;
  v117 = a20;
  v53 = a35;
  v54 = a36;
  v55 = a37;
  v56 = a38;
  v57 = a39;
  v58 = a41;
  v59 = a43;
  v60 = a46;
  v61 = a48;
  v62 = a49;
  if (!v62)
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    v62 = (id)objc_claimAutoreleasedReturnValue();
  }
  v116 = v62;
  v130.receiver = self;
  v130.super_class = (Class)UNNotificationContent;
  v63 = -[UNNotificationContent init](&v130, sel_init);
  if (v63)
  {
    v64 = objc_msgSend(v129, "copy");
    contentType = v63->_contentType;
    v63->_contentType = (NSString *)v64;

    v66 = objc_msgSend(v128, "copy");
    communicationContext = v63->_communicationContext;
    v63->_communicationContext = (_UNNotificationCommunicationContext *)v66;

    objc_storeStrong((id *)&v63->_accessoryImageName, obj);
    v68 = objc_msgSend(v127, "copy");
    attachments = v63->_attachments;
    v63->_attachments = (NSArray *)v68;

    v70 = objc_msgSend(v126, "copy");
    badge = v63->_badge;
    v63->_badge = (NSNumber *)v70;

    v72 = objc_msgSend(v124, "copy");
    body = v63->_body;
    v63->_body = (NSString *)v72;

    v74 = objc_msgSend(v122, "copy");
    attributedBody = v63->_attributedBody;
    v63->_attributedBody = (NSAttributedString *)v74;

    v76 = objc_msgSend(v121, "copy");
    categoryIdentifier = v63->_categoryIdentifier;
    v63->_categoryIdentifier = (NSString *)v76;

    v78 = objc_msgSend(v120, "copy");
    date = v63->_date;
    v63->_date = (NSDate *)v78;

    v80 = objc_msgSend(v119, "copy");
    expirationDate = v63->_expirationDate;
    v63->_expirationDate = (NSDate *)v80;

    objc_storeStrong((id *)&v63->_icon, a12);
    objc_storeStrong((id *)&v63->_defaultActionTitle, a13);
    objc_storeStrong((id *)&v63->_defaultActionURL, a14);
    objc_storeStrong((id *)&v63->_defaultActionBundleIdentifier, a15);
    objc_storeStrong((id *)&v63->_header, a17);
    objc_storeStrong((id *)&v63->_footer, a18);
    v82 = objc_msgSend(v118, "copy");
    launchImageName = v63->_launchImageName;
    v63->_launchImageName = (NSString *)v82;

    v84 = objc_msgSend(v117, "copy");
    peopleIdentifiers = v63->_peopleIdentifiers;
    v63->_peopleIdentifiers = (NSArray *)v84;

    v63->_shouldHideDate = a21;
    v63->_shouldHideTime = a22;
    v63->_shouldIgnoreDoNotDisturb = a23;
    v63->_shouldIgnoreDowntime = a24;
    v63->_shouldAuthenticateDefaultAction = a26;
    v63->_shouldBackgroundDefaultAction = a27;
    v63->_shouldPreventNotificationDismissalAfterDefaultAction = a28;
    v63->_shouldShowSubordinateIcon = a29;
    v63->_shouldSuppressDefaultAction = a30;
    v63->_shouldSuppressScreenLightUp = a25;
    v63->_shouldSuppressSyncDismissalWhenRemoved = a31;
    v63->_shouldUseRequestIdentifierForDismissalSync = a32;
    v63->_shouldPreemptPresentedNotification = a33;
    v63->_shouldDisplayActionsInline = a34;
    v86 = objc_msgSend(v53, "copy");
    sound = v63->_sound;
    v63->_sound = (UNNotificationSound *)v86;

    v88 = objc_msgSend(v54, "copy");
    subtitle = v63->_subtitle;
    v63->_subtitle = (NSString *)v88;

    v90 = objc_msgSend(v55, "copy");
    threadIdentifier = v63->_threadIdentifier;
    v63->_threadIdentifier = (NSString *)v90;

    v92 = objc_msgSend(v56, "copy");
    title = v63->_title;
    v63->_title = (NSString *)v92;

    v94 = objc_msgSend(v57, "copy");
    topicIdentifiers = v63->_topicIdentifiers;
    v63->_topicIdentifiers = (NSSet *)v94;

    v63->_realertCount = a40;
    v96 = objc_msgSend(v58, "copy");
    summaryArgument = v63->_summaryArgument;
    v63->_summaryArgument = (NSString *)v96;

    v63->_summaryArgumentCount = a42;
    v98 = objc_msgSend(v59, "copy");
    targetContentIdentifier = v63->_targetContentIdentifier;
    v63->_targetContentIdentifier = (NSString *)v98;

    v63->_interruptionLevel = a44;
    v63->_relevanceScore = a45;
    v100 = objc_msgSend(v60, "copy");
    filterCriteria = v63->_filterCriteria;
    v63->_filterCriteria = (NSString *)v100;

    v63->_screenCaptureProhibited = a47;
    v102 = objc_msgSend(v61, "copy");
    speechLanguage = v63->_speechLanguage;
    v63->_speechLanguage = (NSString *)v102;

    v104 = objc_msgSend(v116, "copy");
    userInfo = v63->_userInfo;
    v63->_userInfo = (NSDictionary *)v104;

  }
  return v63;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  unint64_t v43;
  void *v44;
  uint64_t v45;
  NSUInteger v46;
  void *v47;
  uint64_t v48;
  unint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  unint64_t v58;
  uint64_t v60;
  void *v61;
  void *v62;
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
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;

  -[UNNotificationContent contentType](self, "contentType");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v80, "hash");
  -[UNNotificationContent communicationContext](self, "communicationContext");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v79, "hash") ^ v3;
  -[UNNotificationContent accessoryImageName](self, "accessoryImageName");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v78, "hash");
  -[UNNotificationContent attachments](self, "attachments");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 ^ v5 ^ objc_msgSend(v77, "hash");
  -[UNNotificationContent badge](self, "badge");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v76, "hash");
  -[UNNotificationContent body](self, "body");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 ^ objc_msgSend(v75, "hash");
  -[UNNotificationContent attributedBody](self, "attributedBody");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v6 ^ v8 ^ objc_msgSend(v74, "hash");
  -[UNNotificationContent categoryIdentifier](self, "categoryIdentifier");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v73, "hash");
  -[UNNotificationContent date](self, "date");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10 ^ objc_msgSend(v72, "hash");
  -[UNNotificationContent expirationDate](self, "expirationDate");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11 ^ objc_msgSend(v71, "hash");
  -[UNNotificationContent defaultActionTitle](self, "defaultActionTitle");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v9 ^ v12 ^ objc_msgSend(v70, "hash");
  -[UNNotificationContent defaultActionURL](self, "defaultActionURL");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v69, "hash");
  -[UNNotificationContent defaultActionBundleIdentifier](self, "defaultActionBundleIdentifier");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14 ^ objc_msgSend(v68, "hash");
  -[UNNotificationContent icon](self, "icon");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15 ^ objc_msgSend(v67, "hash");
  -[UNNotificationContent header](self, "header");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16 ^ objc_msgSend(v66, "hash");
  -[UNNotificationContent footer](self, "footer");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v13 ^ v17 ^ objc_msgSend(v65, "hash");
  -[UNNotificationContent launchImageName](self, "launchImageName");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v64, "hash");
  -[UNNotificationContent peopleIdentifiers](self, "peopleIdentifiers");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19 ^ objc_msgSend(v63, "hash");
  v21 = v20 ^ -[UNNotificationContent shouldHideDate](self, "shouldHideDate");
  v22 = v21 ^ -[UNNotificationContent shouldHideTime](self, "shouldHideTime");
  v23 = v22 ^ -[UNNotificationContent shouldIgnoreDoNotDisturb](self, "shouldIgnoreDoNotDisturb");
  v24 = v18 ^ v23 ^ -[UNNotificationContent shouldIgnoreDowntime](self, "shouldIgnoreDowntime");
  v25 = -[UNNotificationContent shouldSuppressScreenLightUp](self, "shouldSuppressScreenLightUp");
  v26 = v25 ^ -[UNNotificationContent shouldAuthenticateDefaultAction](self, "shouldAuthenticateDefaultAction");
  v27 = v26 ^ -[UNNotificationContent shouldBackgroundDefaultAction](self, "shouldBackgroundDefaultAction");
  v28 = v27 ^ -[UNNotificationContent shouldShowSubordinateIcon](self, "shouldShowSubordinateIcon");
  v29 = v28 ^ -[UNNotificationContent shouldPreventNotificationDismissalAfterDefaultAction](self, "shouldPreventNotificationDismissalAfterDefaultAction");
  v30 = v24 ^ v29 ^ -[UNNotificationContent shouldSuppressDefaultAction](self, "shouldSuppressDefaultAction");
  v31 = -[UNNotificationContent shouldSuppressSyncDismissalWhenRemoved](self, "shouldSuppressSyncDismissalWhenRemoved");
  v32 = v31 ^ -[UNNotificationContent shouldUseRequestIdentifierForDismissalSync](self, "shouldUseRequestIdentifierForDismissalSync");
  v33 = v32 ^ -[UNNotificationContent shouldPreemptPresentedNotification](self, "shouldPreemptPresentedNotification");
  v34 = v33 ^ -[UNNotificationContent shouldDisplayActionsInline](self, "shouldDisplayActionsInline");
  -[UNNotificationContent sound](self, "sound");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v34 ^ objc_msgSend(v62, "hash");
  -[UNNotificationContent subtitle](self, "subtitle");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v35 ^ objc_msgSend(v61, "hash");
  -[UNNotificationContent threadIdentifier](self, "threadIdentifier");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v30 ^ v36 ^ objc_msgSend(v37, "hash");
  -[UNNotificationContent title](self, "title");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "hash");
  -[UNNotificationContent topicIdentifiers](self, "topicIdentifiers");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v40 ^ objc_msgSend(v41, "hash");
  v43 = v42 ^ -[UNNotificationContent realertCount](self, "realertCount");
  -[UNNotificationContent summaryArgument](self, "summaryArgument");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v43 ^ objc_msgSend(v44, "hash");
  v46 = v45 ^ -[UNNotificationContent summaryArgumentCount](self, "summaryArgumentCount");
  -[UNNotificationContent targetContentIdentifier](self, "targetContentIdentifier");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v46 ^ objc_msgSend(v47, "hash");
  v49 = v48 ^ -[UNNotificationContent interruptionLevel](self, "interruptionLevel");
  v50 = (void *)MEMORY[0x1E0CB37E8];
  -[UNNotificationContent relevanceScore](self, "relevanceScore");
  objc_msgSend(v50, "numberWithDouble:");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v49 ^ objc_msgSend(v51, "hash");
  -[UNNotificationContent filterCriteria](self, "filterCriteria");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = v38 ^ v52 ^ objc_msgSend(v53, "hash");
  v54 = -[UNNotificationContent screenCaptureProhibited](self, "screenCaptureProhibited");
  -[UNNotificationContent userInfo](self, "userInfo");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v54 ^ objc_msgSend(v55, "hash");

  -[UNNotificationContent speechLanguage](self, "speechLanguage");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = v60 ^ v56 ^ objc_msgSend(v57, "hash");

  return v58;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  void *v48;
  int v49;
  void *v50;
  void *v51;
  int v52;
  void *v53;
  void *v54;
  int v55;
  void *v56;
  void *v57;
  int v58;
  int v59;
  int v60;
  int v61;
  int v62;
  int v63;
  int v64;
  int v65;
  int v66;
  int v67;
  int v68;
  int v69;
  int v70;
  int v71;
  int v72;
  void *v73;
  void *v74;
  int v75;
  void *v76;
  void *v77;
  int v78;
  void *v79;
  void *v80;
  int v81;
  void *v82;
  void *v83;
  int v84;
  void *v85;
  void *v86;
  int v87;
  unint64_t v88;
  void *v89;
  void *v90;
  int v91;
  NSUInteger v92;
  void *v93;
  void *v94;
  int v95;
  UNNotificationInterruptionLevel v96;
  double v97;
  double v98;
  double v99;
  void *v100;
  void *v101;
  int v102;
  int v103;
  void *v104;
  void *v105;
  int v106;
  void *v107;
  void *v108;
  char v109;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_49;
  -[UNNotificationContent contentType](self, "contentType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = UNEqualStrings(v5, v6);

  if (!v7)
    goto LABEL_49;
  -[UNNotificationContent communicationContext](self, "communicationContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "communicationContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = UNEqualObjects(v8, v9);

  if (!v10)
    goto LABEL_49;
  -[UNNotificationContent accessoryImageName](self, "accessoryImageName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessoryImageName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = UNEqualObjects(v11, v12);

  if (!v13)
    goto LABEL_49;
  -[UNNotificationContent attachments](self, "attachments");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attachments");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = UNEqualObjects(v14, v15);

  if (!v16)
    goto LABEL_49;
  -[UNNotificationContent badge](self, "badge");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "badge");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = UNEqualObjects(v17, v18);

  if (!v19)
    goto LABEL_49;
  -[UNNotificationContent body](self, "body");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "body");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = UNEqualObjects(v20, v21);

  if (!v22)
    goto LABEL_49;
  -[UNNotificationContent attributedBody](self, "attributedBody");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributedBody");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = UNEqualObjects(v23, v24);

  if (!v25)
    goto LABEL_49;
  -[UNNotificationContent categoryIdentifier](self, "categoryIdentifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "categoryIdentifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = UNEqualStrings(v26, v27);

  if (!v28)
    goto LABEL_49;
  -[UNNotificationContent date](self, "date");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "date");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = UNEqualObjects(v29, v30);

  if (!v31)
    goto LABEL_49;
  -[UNNotificationContent expirationDate](self, "expirationDate");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "expirationDate");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = UNEqualObjects(v32, v33);

  if (!v34)
    goto LABEL_49;
  -[UNNotificationContent defaultActionTitle](self, "defaultActionTitle");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "defaultActionTitle");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = UNEqualStrings(v35, v36);

  if (!v37)
    goto LABEL_49;
  -[UNNotificationContent defaultActionURL](self, "defaultActionURL");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "defaultActionURL");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = UNEqualObjects(v38, v39);

  if (!v40)
    goto LABEL_49;
  -[UNNotificationContent defaultActionBundleIdentifier](self, "defaultActionBundleIdentifier");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "defaultActionBundleIdentifier");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = UNEqualStrings(v41, v42);

  if (!v43)
    goto LABEL_49;
  -[UNNotificationContent icon](self, "icon");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "icon");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = UNEqualObjects(v44, v45);

  if (!v46)
    goto LABEL_49;
  -[UNNotificationContent header](self, "header");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "header");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = UNEqualStrings(v47, v48);

  if (!v49)
    goto LABEL_49;
  -[UNNotificationContent footer](self, "footer");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "footer");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = UNEqualStrings(v50, v51);

  if (!v52)
    goto LABEL_49;
  -[UNNotificationContent launchImageName](self, "launchImageName");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "launchImageName");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = UNEqualObjects(v53, v54);

  if (!v55)
    goto LABEL_49;
  -[UNNotificationContent peopleIdentifiers](self, "peopleIdentifiers");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "peopleIdentifiers");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = UNEqualObjects(v56, v57);

  if (!v58)
    goto LABEL_49;
  v59 = -[UNNotificationContent shouldHideDate](self, "shouldHideDate");
  if (v59 != objc_msgSend(v4, "shouldHideDate"))
    goto LABEL_49;
  v60 = -[UNNotificationContent shouldHideTime](self, "shouldHideTime");
  if (v60 != objc_msgSend(v4, "shouldHideTime"))
    goto LABEL_49;
  v61 = -[UNNotificationContent shouldIgnoreDoNotDisturb](self, "shouldIgnoreDoNotDisturb");
  if (v61 != objc_msgSend(v4, "shouldIgnoreDoNotDisturb"))
    goto LABEL_49;
  v62 = -[UNNotificationContent shouldIgnoreDowntime](self, "shouldIgnoreDowntime");
  if (v62 != objc_msgSend(v4, "shouldIgnoreDowntime"))
    goto LABEL_49;
  v63 = -[UNNotificationContent shouldAuthenticateDefaultAction](self, "shouldAuthenticateDefaultAction");
  if (v63 != objc_msgSend(v4, "shouldAuthenticateDefaultAction"))
    goto LABEL_49;
  v64 = -[UNNotificationContent shouldBackgroundDefaultAction](self, "shouldBackgroundDefaultAction");
  if (v64 != objc_msgSend(v4, "shouldBackgroundDefaultAction"))
    goto LABEL_49;
  v65 = -[UNNotificationContent shouldShowSubordinateIcon](self, "shouldShowSubordinateIcon");
  if (v65 != objc_msgSend(v4, "shouldShowSubordinateIcon"))
    goto LABEL_49;
  v66 = -[UNNotificationContent shouldPreventNotificationDismissalAfterDefaultAction](self, "shouldPreventNotificationDismissalAfterDefaultAction");
  if (v66 != objc_msgSend(v4, "shouldPreventNotificationDismissalAfterDefaultAction"))
    goto LABEL_49;
  v67 = -[UNNotificationContent shouldSuppressDefaultAction](self, "shouldSuppressDefaultAction");
  if (v67 != objc_msgSend(v4, "shouldSuppressDefaultAction"))
    goto LABEL_49;
  v68 = -[UNNotificationContent shouldSuppressScreenLightUp](self, "shouldSuppressScreenLightUp");
  if (v68 != objc_msgSend(v4, "shouldSuppressScreenLightUp"))
    goto LABEL_49;
  v69 = -[UNNotificationContent shouldSuppressSyncDismissalWhenRemoved](self, "shouldSuppressSyncDismissalWhenRemoved");
  if (v69 != objc_msgSend(v4, "shouldSuppressSyncDismissalWhenRemoved"))
    goto LABEL_49;
  v70 = -[UNNotificationContent shouldUseRequestIdentifierForDismissalSync](self, "shouldUseRequestIdentifierForDismissalSync");
  if (v70 != objc_msgSend(v4, "shouldUseRequestIdentifierForDismissalSync"))
    goto LABEL_49;
  v71 = -[UNNotificationContent shouldPreemptPresentedNotification](self, "shouldPreemptPresentedNotification");
  if (v71 != objc_msgSend(v4, "shouldPreemptPresentedNotification"))
    goto LABEL_49;
  v72 = -[UNNotificationContent shouldDisplayActionsInline](self, "shouldDisplayActionsInline");
  if (v72 != objc_msgSend(v4, "shouldDisplayActionsInline"))
    goto LABEL_49;
  -[UNNotificationContent sound](self, "sound");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sound");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = UNEqualObjects(v73, v74);

  if (!v75)
    goto LABEL_49;
  -[UNNotificationContent subtitle](self, "subtitle");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subtitle");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = UNEqualObjects(v76, v77);

  if (!v78)
    goto LABEL_49;
  -[UNNotificationContent threadIdentifier](self, "threadIdentifier");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "threadIdentifier");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = UNEqualStrings(v79, v80);

  if (!v81)
    goto LABEL_49;
  -[UNNotificationContent title](self, "title");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = UNEqualObjects(v82, v83);

  if (!v84)
    goto LABEL_49;
  -[UNNotificationContent topicIdentifiers](self, "topicIdentifiers");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topicIdentifiers");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = UNEqualObjects(v85, v86);

  if (!v87)
    goto LABEL_49;
  v88 = -[UNNotificationContent realertCount](self, "realertCount");
  if (v88 != objc_msgSend(v4, "realertCount"))
    goto LABEL_49;
  -[UNNotificationContent summaryArgument](self, "summaryArgument");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "summaryArgument");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = UNEqualStrings(v89, v90);

  if (!v91)
    goto LABEL_49;
  v92 = -[UNNotificationContent summaryArgumentCount](self, "summaryArgumentCount");
  if (v92 != objc_msgSend(v4, "summaryArgumentCount"))
    goto LABEL_49;
  -[UNNotificationContent targetContentIdentifier](self, "targetContentIdentifier");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "targetContentIdentifier");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = UNEqualStrings(v93, v94);

  if (!v95)
    goto LABEL_49;
  v96 = -[UNNotificationContent interruptionLevel](self, "interruptionLevel");
  if (v96 != objc_msgSend(v4, "interruptionLevel"))
    goto LABEL_49;
  -[UNNotificationContent relevanceScore](self, "relevanceScore");
  v98 = v97;
  objc_msgSend(v4, "relevanceScore");
  if (v98 != v99)
    goto LABEL_49;
  -[UNNotificationContent filterCriteria](self, "filterCriteria");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filterCriteria");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v102 = UNEqualStrings(v100, v101);

  if (!v102)
    goto LABEL_49;
  v103 = -[UNNotificationContent screenCaptureProhibited](self, "screenCaptureProhibited");
  if (v103 != objc_msgSend(v4, "screenCaptureProhibited"))
    goto LABEL_49;
  -[UNNotificationContent userInfo](self, "userInfo");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v106 = UNEqualObjects(v104, v105);

  if (v106)
  {
    -[UNNotificationContent speechLanguage](self, "speechLanguage");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "speechLanguage");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    v109 = UNEqualStrings(v107, v108);

  }
  else
  {
LABEL_49:
    v109 = 0;
  }

  return v109;
}

- (NSString)contentType
{
  return (NSString *)(id)-[NSString copy](self->_contentType, "copy");
}

- (_UNNotificationCommunicationContext)communicationContext
{
  return (_UNNotificationCommunicationContext *)(id)-[_UNNotificationCommunicationContext copy](self->_communicationContext, "copy");
}

- (NSDate)date
{
  return (NSDate *)(id)-[NSDate copy](self->_date, "copy");
}

- (NSString)defaultActionTitle
{
  return (NSString *)(id)-[NSString copy](self->_defaultActionTitle, "copy");
}

- (NSURL)defaultActionURL
{
  return (NSURL *)(id)-[NSURL copy](self->_defaultActionURL, "copy");
}

- (NSString)defaultActionBundleIdentifier
{
  return (NSString *)(id)-[NSString copy](self->_defaultActionBundleIdentifier, "copy");
}

- (BOOL)hasDefaultAction
{
  return !-[UNNotificationContent shouldSuppressDefaultAction](self, "shouldSuppressDefaultAction");
}

- (NSString)header
{
  return (NSString *)(id)-[NSString copy](self->_header, "copy");
}

- (NSString)footer
{
  return (NSString *)(id)-[NSString copy](self->_footer, "copy");
}

- (NSString)accessoryImageName
{
  return (NSString *)(id)-[NSString copy](self->_accessoryImageName, "copy");
}

- (UNNotificationIcon)icon
{
  return (UNNotificationIcon *)(id)-[UNNotificationIcon copy](self->_icon, "copy");
}

- (NSString)launchImageName
{
  return (NSString *)(id)-[NSString copy](self->_launchImageName, "copy");
}

- (NSArray)peopleIdentifiers
{
  return (NSArray *)(id)-[NSArray copy](self->_peopleIdentifiers, "copy");
}

- (BOOL)shouldHideDate
{
  return self->_shouldHideDate;
}

- (BOOL)shouldHideTime
{
  return self->_shouldHideTime;
}

- (BOOL)shouldIgnoreDoNotDisturb
{
  return self->_shouldIgnoreDoNotDisturb;
}

- (BOOL)shouldIgnoreDowntime
{
  return self->_shouldIgnoreDowntime;
}

- (BOOL)shouldAuthenticateDefaultAction
{
  return self->_shouldAuthenticateDefaultAction;
}

- (BOOL)shouldBackgroundDefaultAction
{
  return self->_shouldBackgroundDefaultAction;
}

- (BOOL)shouldPreventNotificationDismissalAfterDefaultAction
{
  return self->_shouldPreventNotificationDismissalAfterDefaultAction;
}

- (BOOL)shouldShowSubordinateIcon
{
  return self->_shouldShowSubordinateIcon;
}

- (BOOL)shouldSuppressDefaultAction
{
  return self->_shouldSuppressDefaultAction;
}

- (BOOL)shouldSuppressScreenLightUp
{
  return self->_shouldSuppressScreenLightUp;
}

- (BOOL)shouldSuppressSyncDismissalWhenRemoved
{
  return self->_shouldSuppressSyncDismissalWhenRemoved;
}

- (BOOL)shouldUseRequestIdentifierForDismissalSync
{
  return self->_shouldUseRequestIdentifierForDismissalSync;
}

- (BOOL)shouldPreemptPresentedNotification
{
  return self->_shouldPreemptPresentedNotification;
}

- (BOOL)shouldDisplayActionsInline
{
  return self->_shouldDisplayActionsInline;
}

- (NSString)subtitle
{
  return (NSString *)(id)-[NSString copy](self->_subtitle, "copy");
}

- (NSSet)topicIdentifiers
{
  return (NSSet *)(id)-[NSSet copy](self->_topicIdentifiers, "copy");
}

- (unint64_t)realertCount
{
  return self->_realertCount;
}

- (BOOL)screenCaptureProhibited
{
  return self->_screenCaptureProhibited;
}

- (NSString)speechLanguage
{
  return self->_speechLanguage;
}

- (UNNotificationInterruptionLevel)interruptionLevel
{
  return self->_interruptionLevel;
}

- (double)relevanceScore
{
  return self->_relevanceScore;
}

- (NSString)description
{
  return (NSString *)-[UNNotificationContent _descriptionForDebug:](self, "_descriptionForDebug:", 0);
}

- (NSString)debugDescription
{
  return (NSString *)-[UNNotificationContent _descriptionForDebug:](self, "_descriptionForDebug:", 1);
}

- (id)_descriptionForDebug:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  UNNotificationInterruptionLevel v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  void *v18;
  NSUInteger v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  v3 = a3;
  -[UNNotificationContent speechLanguage](self, "speechLanguage");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)MEMORY[0x1E0CB3940];
  v24 = objc_opt_class();
  -[UNNotificationContent title](self, "title");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationContent _safeStringForString:debug:](self, "_safeStringForString:debug:", v29, v3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationContent subtitle](self, "subtitle");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationContent _safeStringForString:debug:](self, "_safeStringForString:debug:", v28, v3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationContent body](self, "body");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationContent _safeStringForString:debug:](self, "_safeStringForString:debug:", v27, v3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationContent attributedBody](self, "attributedBody");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationContent _safeAttributedStringForAttributedString:debug:](self, "_safeAttributedStringForAttributedString:debug:", v25, v3);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationContent summaryArgument](self, "summaryArgument");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationContent _safeStringForString:debug:](self, "_safeStringForString:debug:", v22, v3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[UNNotificationContent summaryArgumentCount](self, "summaryArgumentCount");
  -[UNNotificationContent categoryIdentifier](self, "categoryIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationContent launchImageName](self, "launchImageName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationContent threadIdentifier](self, "threadIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationContent attachments](self, "attachments");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationContent badge](self, "badge");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationContent sound](self, "sound");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[UNNotificationContent realertCount](self, "realertCount");
  v10 = -[UNNotificationContent interruptionLevel](self, "interruptionLevel");
  -[UNNotificationContent relevanceScore](self, "relevanceScore");
  v12 = v11;
  -[UNNotificationContent filterCriteria](self, "filterCriteria");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "stringWithFormat:", CFSTR("<%@: %p; title: %@, subtitle: %@, body: %@, attributedBody: %@, summaryArgument: %@, summaryArgumentCount: %u, categoryIdentifier: %@, launchImageName: %@, threadIdentifier: %@, attachments: %@, badge: %@, sound: %@, realert: %u, interruptionLevel: %lu, relevanceScore: %.2f, filterCriteria: %@, screenCaptureProhibited: %d, speechLanguage: %@"),
    v24,
    self,
    v23,
    v21,
    v20,
    v30,
    v17,
    v19,
    v16,
    v18,
    v5,
    v6,
    v7,
    v8,
    v9,
    v10,
    v12,
    v13,
    -[UNNotificationContent screenCaptureProhibited](self, "screenCaptureProhibited"),
    v31);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)_safeStringForString:(id)a3 debug:(BOOL)a4
{
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;

  v5 = (__CFString *)a3;
  v6 = v5;
  if (a4 || !-[__CFString length](v5, "length"))
    v7 = v6;
  else
    v7 = CFSTR("<redacted>");
  v8 = v7;

  return v8;
}

- (id)_safeAttributedStringForAttributedString:(id)a3 debug:(BOOL)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;

  v5 = a3;
  v6 = v5;
  if (a4 || !objc_msgSend(v5, "length"))
    v7 = v6;
  else
    v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR("<redacted>"));
  v8 = v7;

  return v8;
}

- (id)markedMutableCopyWithMessage:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)-[UNNotificationContent mutableCopy](self, "mutableCopy");
  objc_msgSend(v5, "setMarkedMutableCopyMessage:", v4);

  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  BOOL v5;
  unint64_t v6;
  void *v7;
  NSUInteger v8;
  void *v9;
  UNNotificationInterruptionLevel v10;
  double v11;
  double v12;
  void *v13;
  BOOL v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  BOOL v23;
  BOOL v24;
  BOOL v25;
  BOOL v26;
  BOOL v27;
  BOOL v28;
  BOOL v29;
  BOOL v30;
  BOOL v31;
  BOOL v32;
  BOOL v33;
  BOOL v34;
  BOOL v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  UNMutableNotificationContent *v40;
  id v41;
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

  -[UNNotificationContent speechLanguage](self, "speechLanguage");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = +[UNMutableNotificationContent allocWithZone:](UNMutableNotificationContent, "allocWithZone:", a3);
  -[UNNotificationContent contentType](self, "contentType");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationContent communicationContext](self, "communicationContext");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationContent accessoryImageName](self, "accessoryImageName");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationContent attachments](self, "attachments");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationContent badge](self, "badge");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationContent body](self, "body");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationContent attributedBody](self, "attributedBody");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationContent categoryIdentifier](self, "categoryIdentifier");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationContent date](self, "date");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationContent icon](self, "icon");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationContent defaultActionTitle](self, "defaultActionTitle");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationContent defaultActionURL](self, "defaultActionURL");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationContent defaultActionBundleIdentifier](self, "defaultActionBundleIdentifier");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationContent expirationDate](self, "expirationDate");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationContent header](self, "header");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationContent footer](self, "footer");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationContent launchImageName](self, "launchImageName");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationContent peopleIdentifiers](self, "peopleIdentifiers");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = -[UNNotificationContent shouldHideDate](self, "shouldHideDate");
  v34 = -[UNNotificationContent shouldHideTime](self, "shouldHideTime");
  v33 = -[UNNotificationContent shouldIgnoreDoNotDisturb](self, "shouldIgnoreDoNotDisturb");
  v32 = -[UNNotificationContent shouldIgnoreDowntime](self, "shouldIgnoreDowntime");
  v31 = -[UNNotificationContent shouldSuppressScreenLightUp](self, "shouldSuppressScreenLightUp");
  v30 = -[UNNotificationContent shouldAuthenticateDefaultAction](self, "shouldAuthenticateDefaultAction");
  v29 = -[UNNotificationContent shouldBackgroundDefaultAction](self, "shouldBackgroundDefaultAction");
  v28 = -[UNNotificationContent shouldPreventNotificationDismissalAfterDefaultAction](self, "shouldPreventNotificationDismissalAfterDefaultAction");
  v25 = -[UNNotificationContent shouldShowSubordinateIcon](self, "shouldShowSubordinateIcon");
  v27 = -[UNNotificationContent shouldSuppressDefaultAction](self, "shouldSuppressDefaultAction");
  v26 = -[UNNotificationContent shouldSuppressSyncDismissalWhenRemoved](self, "shouldSuppressSyncDismissalWhenRemoved");
  v24 = -[UNNotificationContent shouldUseRequestIdentifierForDismissalSync](self, "shouldUseRequestIdentifierForDismissalSync");
  v23 = -[UNNotificationContent shouldPreemptPresentedNotification](self, "shouldPreemptPresentedNotification");
  v5 = -[UNNotificationContent shouldDisplayActionsInline](self, "shouldDisplayActionsInline");
  -[UNNotificationContent sound](self, "sound");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationContent subtitle](self, "subtitle");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationContent threadIdentifier](self, "threadIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationContent title](self, "title");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationContent topicIdentifiers](self, "topicIdentifiers");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[UNNotificationContent realertCount](self, "realertCount");
  -[UNNotificationContent summaryArgument](self, "summaryArgument");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[UNNotificationContent summaryArgumentCount](self, "summaryArgumentCount");
  -[UNNotificationContent targetContentIdentifier](self, "targetContentIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[UNNotificationContent interruptionLevel](self, "interruptionLevel");
  -[UNNotificationContent relevanceScore](self, "relevanceScore");
  v12 = v11;
  -[UNNotificationContent filterCriteria](self, "filterCriteria");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[UNNotificationContent screenCaptureProhibited](self, "screenCaptureProhibited");
  -[UNNotificationContent userInfo](self, "userInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v19) = v14;
  BYTE5(v18) = v5;
  BYTE4(v18) = v23;
  BYTE3(v18) = v24;
  BYTE2(v18) = v26;
  BYTE1(v18) = v27;
  LOBYTE(v18) = v25;
  HIBYTE(v17) = v28;
  BYTE6(v17) = v29;
  BYTE5(v17) = v30;
  BYTE4(v17) = v31;
  BYTE3(v17) = v32;
  BYTE2(v17) = v33;
  BYTE1(v17) = v34;
  LOBYTE(v17) = v35;
  v41 = -[UNNotificationContent _initWithContentType:communicationContext:accessoryImageName:attachments:badge:body:attributedBody:categoryIdentifier:date:icon:defaultActionTitle:defaultActionURL:defaultActionBundleIdentifier:expirationDate:header:footer:launchImageName:peopleIdentifiers:shouldHideDate:shouldHideTime:shouldIgnoreDoNotDisturb:shouldIgnoreDowntime:shouldSuppressScreenLightUp:shouldAuthenticateDefaultAction:shouldBackgroundDefaultAction:shouldPreventNotificationDismissalAfterDefaultAction:shouldShowSubordinateIcon:shouldSuppressDefaultAction:shouldSuppressSyncDismissalWhenRemoved:shouldUseRequestIdentifierForDismissalSync:shouldPreemptPresentedNotification:shouldDisplayActionsInline:sound:subtitle:threadIdentifier:title:topicIdentifiers:realertCount:summaryArgument:summaryArgumentCount:targetContentIdentifier:interruptionLevel:relevanceScore:filterCriteria:screenCaptureProhibited:speechLanguage:userInfo:](v40, "_initWithContentType:communicationContext:accessoryImageName:attachments:badge:body:attributedBody:categoryIdentifier:date:icon:defaultActionTitle:defaultActionURL:defaultActionBundleIdentifier:expirationDate:header:footer:launchImageName:peopleIdentifiers:shouldHideDate:shouldHideTime:shouldIgnoreDoNotDisturb:shouldIgnoreDowntime:shouldSuppressScreenLightUp:shouldAuthenticateDefaultAction:shouldBackgroundDefaultAction:shouldPreventNotificationDismissalAfterDefaultAction:shouldShowSubordinateIcon:shouldSuppressDefaultAction:shouldSuppressSyncDismissalWhenRemoved:shouldUseRequestIdentifierForDismissalSync:shouldPreemptPresentedNotification:shouldDisplayActionsInline:sound:subtitle:threadIdentifier:title:topicIdentifiers:realertCount:summaryArgument:summaryArgumentCount:targetContentIdentifier:interruptionLevel:relevanceScore:filterCriteria:screenCaptureProhibited:speechLanguage:userInfo:", v57, v56, v55, v54, v52, v51, v12, v53, v47,
          v50,
          v49,
          v48,
          v46,
          v39,
          v38,
          v37,
          v45,
          v36,
          v44,
          v17,
          v18,
          v43,
          v42,
          v20,
          v22,
          v21,
          v6,
          v7,
          v8,
          v9,
          v10,
          v13,
          v19,
          v58,
          v15);

  return v41;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
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
  double v41;
  void *v42;
  void *v43;
  id v44;

  v4 = a3;
  -[UNNotificationContent contentType](self, "contentType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("contentType"));

  -[UNNotificationContent communicationContext](self, "communicationContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("communicationContext"));

  -[UNNotificationContent accessoryImageName](self, "accessoryImageName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("accessoryImageName"));

  -[UNNotificationContent attachments](self, "attachments");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("attachments"));

  -[UNNotificationContent badge](self, "badge");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("badge"));

  -[UNNotificationContent body](self, "body");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "un_stringWithMaxLength:", 2000);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("body"));

  -[UNNotificationContent attributedBody](self, "attributedBody");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_un_RTFDData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("attributedBody"));

  -[UNNotificationContent categoryIdentifier](self, "categoryIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "un_stringWithMaxLength:", 1000);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("categoryIdentifier"));

  -[UNNotificationContent date](self, "date");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("date"));

  -[UNNotificationContent defaultActionTitle](self, "defaultActionTitle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "un_stringWithMaxLength:", 1000);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v18, CFSTR("defaultActionTitle"));

  -[UNNotificationContent defaultActionURL](self, "defaultActionURL");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v19, CFSTR("defaultActionURL"));

  -[UNNotificationContent defaultActionBundleIdentifier](self, "defaultActionBundleIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "un_stringWithMaxLength:", 1000);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v21, CFSTR("defaultActionBundleIdentifier"));

  -[UNNotificationContent expirationDate](self, "expirationDate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v22, CFSTR("expirationDate"));

  -[UNNotificationContent header](self, "header");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "un_stringWithMaxLength:", 1000);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v24, CFSTR("header"));

  -[UNNotificationContent footer](self, "footer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "un_stringWithMaxLength:", 1000);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v26, CFSTR("footer"));

  -[UNNotificationContent icon](self, "icon");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v27, CFSTR("icon"));

  -[UNNotificationContent launchImageName](self, "launchImageName");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "un_stringWithMaxLength:", 1000);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v29, CFSTR("launchImageName"));

  -[UNNotificationContent peopleIdentifiers](self, "peopleIdentifiers");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v30, CFSTR("peopleIdentifiers"));

  objc_msgSend(v4, "encodeBool:forKey:", -[UNNotificationContent shouldHideDate](self, "shouldHideDate"), CFSTR("shouldHideDate"));
  objc_msgSend(v4, "encodeBool:forKey:", -[UNNotificationContent shouldHideTime](self, "shouldHideTime"), CFSTR("shouldHideTime"));
  objc_msgSend(v4, "encodeBool:forKey:", -[UNNotificationContent shouldIgnoreDoNotDisturb](self, "shouldIgnoreDoNotDisturb"), CFSTR("shouldIgnoreDoNotDisturb"));
  objc_msgSend(v4, "encodeBool:forKey:", -[UNNotificationContent shouldIgnoreDowntime](self, "shouldIgnoreDowntime"), CFSTR("shouldIgnoreDowntime"));
  objc_msgSend(v4, "encodeBool:forKey:", -[UNNotificationContent shouldAuthenticateDefaultAction](self, "shouldAuthenticateDefaultAction"), CFSTR("shouldAuthenticateDefaultAction"));
  objc_msgSend(v4, "encodeBool:forKey:", -[UNNotificationContent shouldBackgroundDefaultAction](self, "shouldBackgroundDefaultAction"), CFSTR("shouldBackgroundDefaultAction"));
  objc_msgSend(v4, "encodeBool:forKey:", -[UNNotificationContent shouldPreventNotificationDismissalAfterDefaultAction](self, "shouldPreventNotificationDismissalAfterDefaultAction"), CFSTR("shouldPreventNotificationDismissalAfterDefaultAction"));
  objc_msgSend(v4, "encodeBool:forKey:", -[UNNotificationContent shouldShowSubordinateIcon](self, "shouldShowSubordinateIcon"), CFSTR("shouldShowSubordinateIcon"));
  objc_msgSend(v4, "encodeBool:forKey:", -[UNNotificationContent shouldSuppressDefaultAction](self, "shouldSuppressDefaultAction"), CFSTR("shouldSuppressDefaultAction"));
  objc_msgSend(v4, "encodeBool:forKey:", -[UNNotificationContent shouldSuppressScreenLightUp](self, "shouldSuppressScreenLightUp"), CFSTR("shouldSuppressScreenLightUp"));
  objc_msgSend(v4, "encodeBool:forKey:", -[UNNotificationContent shouldSuppressSyncDismissalWhenRemoved](self, "shouldSuppressSyncDismissalWhenRemoved"), CFSTR("shouldSuppressSyncDismissalWhenRemoved"));
  objc_msgSend(v4, "encodeBool:forKey:", -[UNNotificationContent shouldUseRequestIdentifierForDismissalSync](self, "shouldUseRequestIdentifierForDismissalSync"), CFSTR("shouldUseRequestIdentifierForDismissalSync"));
  objc_msgSend(v4, "encodeBool:forKey:", -[UNNotificationContent shouldPreemptPresentedNotification](self, "shouldPreemptPresentedNotification"), CFSTR("shouldPreemptPresentedNotification"));
  objc_msgSend(v4, "encodeBool:forKey:", -[UNNotificationContent shouldDisplayActionsInline](self, "shouldDisplayActionsInline"), CFSTR("shouldDisplayActionsInline"));
  -[UNNotificationContent sound](self, "sound");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v31, CFSTR("sound"));

  -[UNNotificationContent subtitle](self, "subtitle");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "un_stringWithMaxLength:", 1000);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v33, CFSTR("subtitle"));

  -[UNNotificationContent threadIdentifier](self, "threadIdentifier");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "un_stringWithMaxLength:", 1000);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v35, CFSTR("threadIdentifier"));

  -[UNNotificationContent title](self, "title");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "un_stringWithMaxLength:", 1000);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v37, CFSTR("title"));

  -[UNNotificationContent topicIdentifiers](self, "topicIdentifiers");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v38, CFSTR("topicIdentifiers"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[UNNotificationContent realertCount](self, "realertCount"), CFSTR("realertCount"));
  -[UNNotificationContent summaryArgument](self, "summaryArgument");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v39, CFSTR("summaryArgument"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[UNNotificationContent summaryArgumentCount](self, "summaryArgumentCount"), CFSTR("summaryArgumentCount"));
  -[UNNotificationContent targetContentIdentifier](self, "targetContentIdentifier");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v40, CFSTR("targetContentIdentifier"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[UNNotificationContent interruptionLevel](self, "interruptionLevel"), CFSTR("interruptionLevel"));
  -[UNNotificationContent relevanceScore](self, "relevanceScore");
  *(float *)&v41 = v41;
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("relevanceScore"), v41);
  -[UNNotificationContent filterCriteria](self, "filterCriteria");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v42, CFSTR("filterCriteria"));

  objc_msgSend(v4, "encodeBool:forKey:", -[UNNotificationContent screenCaptureProhibited](self, "screenCaptureProhibited"), CFSTR("screenCaptureProhibited"));
  -[UNNotificationContent userInfo](self, "userInfo");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v43, CFSTR("userInfo"));

  -[UNNotificationContent speechLanguage](self, "speechLanguage");
  v44 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v44, CFSTR("speechLanguage"));

}

- (UNNotificationContent)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  float v47;
  float v48;
  char v49;
  uint64_t v50;
  void *v51;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  char v63;
  void *v64;
  char v65;
  char v66;
  void *v67;
  char v68;
  char v69;
  char v70;
  char v71;
  void *v72;
  char v73;
  char v74;
  char v75;
  char v76;
  char v77;
  char v78;
  char v79;
  void *v80;
  void *v81;
  UNNotificationContent *v83;
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
  void *v97;
  void *v98;
  void *v99;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contentType"));
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("communicationContext"));
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accessoryImageName"));
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v6, CFSTR("attachments"));
  v96 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("badge"));
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v9, CFSTR("body"));
  v94 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CB3498];
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("attributedBody"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_un_attributedStringWithRTFDData:", v11);
  v93 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0C99E60];
  v13 = objc_opt_class();
  objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v14, CFSTR("peopleIdentifiers"));
  v92 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("categoryIdentifier"));
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("date"));
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("icon"));
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0C99E60];
  v16 = objc_opt_class();
  objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v17, CFSTR("defaultActionTitle"));
  v88 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("defaultActionURL"));
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)MEMORY[0x1E0C99E60];
  v19 = objc_opt_class();
  objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v20, CFSTR("defaultActionBundleIdentifier"));
  v86 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("expirationDate"));
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)MEMORY[0x1E0C99E60];
  v22 = objc_opt_class();
  objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v23, CFSTR("header"));
  v84 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = (void *)MEMORY[0x1E0C99E60];
  v25 = objc_opt_class();
  objc_msgSend(v24, "setWithObjects:", v25, objc_opt_class(), 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v26, CFSTR("footer"));
  v81 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("launchImageName"));
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("shouldHideDate"));
  v78 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("shouldHideTime"));
  v77 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("shouldIgnoreDoNotDisturb"));
  v76 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("shouldIgnoreDowntime"));
  v75 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("shouldAuthenticateDefaultAction"));
  v74 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("shouldBackgroundDefaultAction"));
  v73 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("shouldPreventNotificationDismissalAfterDefaultAction"));
  v71 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("shouldShowSubordinateIcon"));
  v69 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("shouldSuppressDefaultAction"));
  v70 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("shouldSuppressScreenLightUp"));
  v68 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("shouldSuppressSyncDismissalWhenRemoved"));
  v66 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("shouldUseRequestIdentifierForDismissalSync"));
  v65 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("shouldPreemptPresentedNotification"));
  v63 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("shouldDisplayActionsInline"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sound"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)MEMORY[0x1E0C99E60];
  v28 = objc_opt_class();
  objc_msgSend(v27, "setWithObjects:", v28, objc_opt_class(), 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v29, CFSTR("subtitle"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("threadIdentifier"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)MEMORY[0x1E0C99E60];
  v31 = objc_opt_class();
  objc_msgSend(v30, "setWithObjects:", v31, objc_opt_class(), 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v32, CFSTR("title"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = (void *)MEMORY[0x1E0C99E60];
  v35 = objc_opt_class();
  objc_msgSend(v34, "setWithObjects:", v35, objc_opt_class(), 0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v36, CFSTR("topicIdentifiers"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  v59 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("realertCount"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("summaryArgument"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("summaryArgumentCount"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("targetContentIdentifier"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)MEMORY[0x1E0C99E60];
  v38 = objc_opt_class();
  v39 = objc_opt_class();
  v40 = objc_opt_class();
  v41 = objc_opt_class();
  v42 = objc_opt_class();
  v43 = objc_opt_class();
  objc_msgSend(v37, "setWithObjects:", v38, v39, v40, v41, v42, v43, objc_opt_class(), 0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v44, CFSTR("userInfo"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "containsValueForKey:", CFSTR("interruptionLevel")))
    v46 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("interruptionLevel"));
  else
    v46 = 1;
  objc_msgSend(v3, "decodeFloatForKey:", CFSTR("relevanceScore"));
  v48 = v47;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("filterCriteria"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("screenCaptureProhibited"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("speechLanguage"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_opt_class();
  UNSafeCast(v50, v45);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v55) = v49;
  BYTE5(v54) = v63;
  BYTE4(v54) = v65;
  BYTE3(v54) = v66;
  BYTE2(v54) = v68;
  BYTE1(v54) = v69;
  LOBYTE(v54) = v71;
  HIBYTE(v53) = v73;
  BYTE6(v53) = v74;
  BYTE5(v53) = v75;
  BYTE4(v53) = v70;
  BYTE3(v53) = v76;
  BYTE2(v53) = v77;
  BYTE1(v53) = v78;
  LOBYTE(v53) = v79;
  v83 = -[UNNotificationContent _initWithContentType:communicationContext:accessoryImageName:attachments:badge:body:attributedBody:categoryIdentifier:date:icon:defaultActionTitle:defaultActionURL:defaultActionBundleIdentifier:expirationDate:header:footer:launchImageName:peopleIdentifiers:shouldHideDate:shouldHideTime:shouldIgnoreDoNotDisturb:shouldIgnoreDowntime:shouldSuppressScreenLightUp:shouldAuthenticateDefaultAction:shouldBackgroundDefaultAction:shouldPreventNotificationDismissalAfterDefaultAction:shouldShowSubordinateIcon:shouldSuppressDefaultAction:shouldSuppressSyncDismissalWhenRemoved:shouldUseRequestIdentifierForDismissalSync:shouldPreemptPresentedNotification:shouldDisplayActionsInline:sound:subtitle:threadIdentifier:title:topicIdentifiers:realertCount:summaryArgument:summaryArgumentCount:targetContentIdentifier:interruptionLevel:relevanceScore:filterCriteria:screenCaptureProhibited:speechLanguage:userInfo:](self, "_initWithContentType:communicationContext:accessoryImageName:attachments:badge:body:attributedBody:categoryIdentifier:date:icon:defaultActionTitle:defaultActionURL:defaultActionBundleIdentifier:expirationDate:header:footer:launchImageName:peopleIdentifiers:shouldHideDate:shouldHideTime:shouldIgnoreDoNotDisturb:shouldIgnoreDowntime:shouldSuppressScreenLightUp:shouldAuthenticateDefaultAction:shouldBackgroundDefaultAction:shouldPreventNotificationDismissalAfterDefaultAction:shouldShowSubordinateIcon:shouldSuppressDefaultAction:shouldSuppressSyncDismissalWhenRemoved:shouldUseRequestIdentifierForDismissalSync:shouldPreemptPresentedNotification:shouldDisplayActionsInline:sound:subtitle:threadIdentifier:title:topicIdentifiers:realertCount:summaryArgument:summaryArgumentCount:targetContentIdentifier:interruptionLevel:relevanceScore:filterCriteria:screenCaptureProhibited:speechLanguage:userInfo:", v99, v98, v97, v96, v95, v94, v48, v93, v91,
          v90,
          v89,
          v88,
          v87,
          v86,
          v85,
          v84,
          v81,
          v80,
          v92,
          v53,
          v54,
          v72,
          v67,
          v64,
          v33,
          v62,
          v59,
          v61,
          v58,
          v60,
          v46,
          v56,
          v55,
          v57,
          v51);

  return v83;
}

- (UNNotificationContent)init
{
  void *v3;
  UNNotificationContent *v4;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = 0;
  WORD2(v6) = 0;
  LODWORD(v6) = 0;
  v4 = -[UNNotificationContent _initWithContentType:communicationContext:accessoryImageName:attachments:badge:body:attributedBody:categoryIdentifier:date:icon:defaultActionTitle:defaultActionURL:defaultActionBundleIdentifier:expirationDate:header:footer:launchImageName:peopleIdentifiers:shouldHideDate:shouldHideTime:shouldIgnoreDoNotDisturb:shouldIgnoreDowntime:shouldSuppressScreenLightUp:shouldAuthenticateDefaultAction:shouldBackgroundDefaultAction:shouldPreventNotificationDismissalAfterDefaultAction:shouldShowSubordinateIcon:shouldSuppressDefaultAction:shouldSuppressSyncDismissalWhenRemoved:shouldUseRequestIdentifierForDismissalSync:shouldPreemptPresentedNotification:shouldDisplayActionsInline:sound:subtitle:threadIdentifier:title:topicIdentifiers:realertCount:summaryArgument:summaryArgumentCount:targetContentIdentifier:interruptionLevel:relevanceScore:filterCriteria:screenCaptureProhibited:speechLanguage:userInfo:](self, "_initWithContentType:communicationContext:accessoryImageName:attachments:badge:body:attributedBody:categoryIdentifier:date:icon:defaultActionTitle:defaultActionURL:defaultActionBundleIdentifier:expirationDate:header:footer:launchImageName:peopleIdentifiers:shouldHideDate:shouldHideTime:shouldIgnoreDoNotDisturb:shouldIgnoreDowntime:shouldSuppressScreenLightUp:shouldAuthenticateDefaultAction:shouldBackgroundDefaultAction:shouldPreventNotificationDismissalAfterDefaultAction:shouldShowSubordinateIcon:shouldSuppressDefaultAction:shouldSuppressSyncDismissalWhenRemoved:shouldUseRequestIdentifierForDismissalSync:shouldPreemptPresentedNotification:shouldDisplayActionsInline:sound:subtitle:threadIdentifier:title:topicIdentifiers:realertCount:summaryArgument:summaryArgumentCount:targetContentIdentifier:interruptionLevel:relevanceScore:filterCriteria:screenCaptureProhibited:speechLanguage:userInfo:", CFSTR("UNNotificationContentTypeDefault"), 0, 0, 0.0, 0, &stru_1E57F06A0, 0, 0, 0, 0,
         0,
         0,
         &stru_1E57F06A0,
         &stru_1E57F06A0,
         &stru_1E57F06A0,
         MEMORY[0x1E0C9AA60],
         0,
         v6,
         0,
         0,
         &stru_1E57F06A0,
         0,
         v3,
         0,
         &stru_1E57F06A0,
         0,
         0,
         1,
         0,
         v7,
         0,
         0);

  return v4;
}

- (void)addSecurityScope:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[UNNotificationContent attachments](self, "attachments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__UNNotificationContent_addSecurityScope___block_invoke;
  v7[3] = &unk_1E57EFE98;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);

}

uint64_t __42__UNNotificationContent_addSecurityScope___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addSecurityScope:", *(_QWORD *)(a1 + 32));
}

- (void)removeSecurityScope
{
  id v2;

  -[UNNotificationContent attachments](self, "attachments");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", &__block_literal_global_6);

}

uint64_t __44__UNNotificationContent_removeSecurityScope__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeSecurityScope");
}

- (void)enterSecurityScope
{
  id v2;

  -[UNNotificationContent attachments](self, "attachments");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", &__block_literal_global_138);

}

uint64_t __43__UNNotificationContent_enterSecurityScope__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "enterSecurityScope");
}

- (void)leaveSecurityScope
{
  id v2;

  -[UNNotificationContent attachments](self, "attachments");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", &__block_literal_global_139);

}

uint64_t __43__UNNotificationContent_leaveSecurityScope__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "leaveSecurityScope");
}

- (NSArray)attachments
{
  return self->_attachments;
}

- (NSNumber)badge
{
  return self->_badge;
}

- (NSString)body
{
  return self->_body;
}

- (NSAttributedString)attributedBody
{
  return self->_attributedBody;
}

- (NSString)categoryIdentifier
{
  return self->_categoryIdentifier;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (UNNotificationSound)sound
{
  return self->_sound;
}

- (NSString)threadIdentifier
{
  return self->_threadIdentifier;
}

- (NSString)title
{
  return self->_title;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (NSString)summaryArgument
{
  return self->_summaryArgument;
}

- (NSUInteger)summaryArgumentCount
{
  return self->_summaryArgumentCount;
}

- (NSString)targetContentIdentifier
{
  return self->_targetContentIdentifier;
}

- (NSString)filterCriteria
{
  return self->_filterCriteria;
}

- (NSString)markedMutableCopyMessage
{
  return self->_markedMutableCopyMessage;
}

- (void)setMarkedMutableCopyMessage:(id)a3
{
  objc_storeStrong((id *)&self->_markedMutableCopyMessage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_markedMutableCopyMessage, 0);
  objc_storeStrong((id *)&self->_speechLanguage, 0);
  objc_storeStrong((id *)&self->_filterCriteria, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_targetContentIdentifier, 0);
  objc_storeStrong((id *)&self->_summaryArgument, 0);
  objc_storeStrong((id *)&self->_topicIdentifiers, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_threadIdentifier, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_accessoryImageName, 0);
  objc_storeStrong((id *)&self->_sound, 0);
  objc_storeStrong((id *)&self->_peopleIdentifiers, 0);
  objc_storeStrong((id *)&self->_launchImageName, 0);
  objc_storeStrong((id *)&self->_footer, 0);
  objc_storeStrong((id *)&self->_header, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_defaultActionBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_defaultActionURL, 0);
  objc_storeStrong((id *)&self->_defaultActionTitle, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_categoryIdentifier, 0);
  objc_storeStrong((id *)&self->_attributedBody, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_badge, 0);
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_communicationContext, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
}

@end
