@implementation _UNMutableNotificationCommunicationContext

+ (id)mutableContextFromINIntent:(id)a3
{
  id v3;
  _UNMutableNotificationCommunicationContext *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  int v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  _BOOL4 v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  BOOL v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  NSObject *v46;
  const __CFString *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  const char *v53;
  NSObject *v54;
  uint32_t v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  char v61;
  NSObject *v62;
  char v63;
  NSObject *v64;
  _BOOL4 v65;
  void *v66;
  id v67;
  void *v68;
  uint64_t (*v69)(uint64_t, uint64_t);
  NSObject *v70;
  dispatch_semaphore_t v71;
  NSObject *v72;
  dispatch_time_t v73;
  void *v74;
  id v75;
  void *v76;
  void *v77;
  uint64_t (*v78)(uint64_t, uint64_t);
  uint64_t (*v79)(uint64_t, uint64_t);
  NSObject *v80;
  NSObject *log;
  os_log_t loga;
  os_log_t logb;
  _QWORD v85[4];
  NSObject *v86;
  _BYTE *v87;
  id v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  uint64_t v93;
  uint64_t *v94;
  uint64_t v95;
  uint64_t v96;
  _BYTE buf[24];
  uint64_t (*v98)(uint64_t, uint64_t);
  __int128 v99;
  _BYTE v100[128];
  uint64_t v101;

  v101 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(_UNMutableNotificationCommunicationContext);
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UNMutableNotificationCommunicationContext setBundleIdentifier:](v4, "setBundleIdentifier:", v6);

  objc_msgSend(v3, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UNMutableNotificationCommunicationContext setAssociatedObjectUri:](v4, "setAssociatedObjectUri:", v7);

  v8 = (void *)MEMORY[0x1E0CB3940];
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("Persisting INImage for Intent Type '%@':"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v93 = 0;
  v94 = &v93;
  v95 = 0x2050000000;
  v12 = (void *)getINSendMessageIntentClass_softClass;
  v96 = getINSendMessageIntentClass_softClass;
  if (!getINSendMessageIntentClass_softClass)
  {
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getINSendMessageIntentClass_block_invoke;
    v98 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E57EFC28;
    *(_QWORD *)&v99 = &v93;
    __getINSendMessageIntentClass_block_invoke((uint64_t)buf);
    v12 = (void *)v94[3];
  }
  v13 = objc_retainAutorelease(v12);
  _Block_object_dispose(&v93, 8);
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v91 = 0u;
    v92 = 0u;
    v89 = 0u;
    v90 = 0u;
    objc_msgSend(v3, "recipients");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    v16 = 0;
    v17 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v89, v100, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v90;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v90 != v18)
            objc_enumerationMutation(v14);
          v20 = objc_msgSend(*(id *)(*((_QWORD *)&v89 + 1) + 8 * i), "isMe");
          v15 |= v20;
          v16 += 8 * (v20 ^ 1u);
        }
        v17 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v89, v100, 16);
      }
      while (v17);
    }

    objc_msgSend(v3, "donationMetadata");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v21)
    {
      v23 = objc_msgSend(v21, "recipientCount");
      v24 = v23 - 1;
      if ((v15 & 1) == 0)
        v24 = 1;
      if (!v23)
        v24 = 0;
    }
    else
    {
      v24 = 0;
    }
    if (v16)
      v33 = 0;
    else
      v33 = v24 == 0;
    if (v33)
    {
      objc_msgSend(v3, "sender");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "image");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      v38 = (void *)UNLogCommunicationNotifications;
      if (os_log_type_enabled((os_log_t)UNLogCommunicationNotifications, OS_LOG_TYPE_DEFAULT))
      {
        v39 = v38;
        objc_msgSend(v29, "_uri");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v11;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v40;
        _os_log_impl(&dword_1AA8E4000, v39, OS_LOG_TYPE_DEFAULT, "%{public}@ sender image _uri: %@", buf, 0x16u);

      }
    }
    else
    {
      objc_msgSend(v3, "imageForParameterNamed:", CFSTR("speakableGroupName"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (void *)UNLogCommunicationNotifications;
      if (os_log_type_enabled((os_log_t)UNLogCommunicationNotifications, OS_LOG_TYPE_DEFAULT))
      {
        v35 = v34;
        objc_msgSend(v29, "_uri");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v11;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v36;
        _os_log_impl(&dword_1AA8E4000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@ speakableGroupName image _uri: %@", buf, 0x16u);

      }
    }

  }
  else
  {
    v93 = 0;
    v94 = &v93;
    v95 = 0x2050000000;
    v25 = (void *)getINStartCallIntentClass_softClass;
    v96 = getINStartCallIntentClass_softClass;
    if (!getINStartCallIntentClass_softClass)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getINStartCallIntentClass_block_invoke;
      v98 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E57EFC28;
      *(_QWORD *)&v99 = &v93;
      __getINStartCallIntentClass_block_invoke((uint64_t)buf);
      v25 = (void *)v94[3];
    }
    v26 = objc_retainAutorelease(v25);
    _Block_object_dispose(&v93, 8);
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "contacts");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (unint64_t)objc_msgSend(v27, "count") > 1;

      if (v28)
      {
        objc_msgSend(v3, "imageForParameterNamed:", CFSTR("callRecordToCallBack"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v3, "contacts");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "firstObject");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "image");
        v29 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      objc_msgSend(v3, "keyImage");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (void *)UNLogCommunicationNotifications;
      if (os_log_type_enabled((os_log_t)UNLogCommunicationNotifications, OS_LOG_TYPE_DEFAULT))
      {
        v31 = v30;
        objc_msgSend(v29, "_uri");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v11;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v32;
        _os_log_impl(&dword_1AA8E4000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@ key image _uri: %@", buf, 0x16u);

      }
    }
  }
  if (v29)
  {
    objc_msgSend(v29, "_name");
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    if (v43)
    {
      objc_msgSend(v29, "_name");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v29, "_isSystem");
      -[_UNMutableNotificationCommunicationContext setImageName:](v4, "setImageName:", v44);
      -[_UNMutableNotificationCommunicationContext setSystemImage:](v4, "setSystemImage:", v45);
      v46 = UNLogCommunicationNotifications;
      if (os_log_type_enabled((os_log_t)UNLogCommunicationNotifications, OS_LOG_TYPE_DEFAULT))
      {
        v47 = CFSTR("NO");
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v11;
        *(_WORD *)&buf[12] = 2114;
        if ((_DWORD)v45)
          v47 = CFSTR("YES");
        *(_QWORD *)&buf[14] = v44;
        *(_WORD *)&buf[22] = 2114;
        v98 = (uint64_t (*)(uint64_t, uint64_t))v47;
        _os_log_impl(&dword_1AA8E4000, v46, OS_LOG_TYPE_DEFAULT, "%{public}@ Found image of '%{public}@' name. System image:%{public}@", buf, 0x20u);
      }

      goto LABEL_80;
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "_uri");
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    if (v50)
    {
      objc_msgSend(v29, "_uri");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = UNLogCommunicationNotifications;
      if (os_log_type_enabled((os_log_t)UNLogCommunicationNotifications, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v11;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v51;
        v53 = "%{public}@ url found at image's _uri: %{public}@";
        v54 = v52;
        v55 = 22;
LABEL_50:
        _os_log_impl(&dword_1AA8E4000, v54, OS_LOG_TYPE_DEFAULT, v53, buf, v55);
      }
    }
    else
    {
      objc_msgSend(v29, "_identifier");
      v56 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v56)
      {
        v70 = UNLogCommunicationNotifications;
        if (os_log_type_enabled((os_log_t)UNLogCommunicationNotifications, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v11;
          _os_log_impl(&dword_1AA8E4000, v70, OS_LOG_TYPE_DEFAULT, "%{public}@ url cannot be found", buf, 0xCu);
        }
        v51 = 0;
        goto LABEL_77;
      }
      v57 = (void *)MEMORY[0x1E0C99E98];
      objc_msgSend(v29, "_identifier");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "URLWithString:", v58);
      v51 = (void *)objc_claimAutoreleasedReturnValue();

      v59 = UNLogCommunicationNotifications;
      if (os_log_type_enabled((os_log_t)UNLogCommunicationNotifications, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v11;
        v53 = "%{public}@ url created from image's _identifier";
        v54 = v59;
        v55 = 12;
        goto LABEL_50;
      }
    }
    if (v51)
    {
      objc_msgSend(v51, "scheme");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = objc_msgSend(v60, "isEqualToString:", CFSTR("intents-remote-image-proxy"));

      if ((v61 & 1) == 0)
      {
        v62 = UNLogCommunicationNotifications;
        if (os_log_type_enabled((os_log_t)UNLogCommunicationNotifications, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138544130;
          *(_QWORD *)&buf[4] = v11;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = CFSTR("intents-remote-image-proxy");
          *(_WORD *)&buf[22] = 2114;
          v98 = (uint64_t (*)(uint64_t, uint64_t))CFSTR("intents-remote-image-proxy");
          LOWORD(v99) = 2114;
          *(_QWORD *)((char *)&v99 + 2) = v51;
          _os_log_impl(&dword_1AA8E4000, v62, OS_LOG_TYPE_DEFAULT, "%{public}@ contentURL scheme does not match scheme '%{public}@'. Attempting to get a corresponding url with '%{public}@' scheme. contentURL: '%{public}@'", buf, 0x2Au);
        }
        v63 = objc_opt_respondsToSelector();
        v64 = UNLogCommunicationNotifications;
        v65 = os_log_type_enabled((os_log_t)UNLogCommunicationNotifications, OS_LOG_TYPE_DEFAULT);
        if ((v63 & 1) != 0)
        {
          if (v65)
          {
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v11;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v51;
            _os_log_impl(&dword_1AA8E4000, v64, OS_LOG_TYPE_DEFAULT, "%{public}@ Getting proxied image synchronously for content url '%{public}@'.", buf, 0x16u);
          }
          v88 = 0;
          objc_msgSend(v29, "_proxiedImageWithError:", &v88);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          v67 = v88;
          if (v67)
          {
            v68 = (void *)UNLogCommunicationNotifications;
            if (os_log_type_enabled((os_log_t)UNLogCommunicationNotifications, OS_LOG_TYPE_ERROR))
            {
              log = v68;
              objc_msgSend(v67, "localizedDescription");
              v69 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              *(_QWORD *)&buf[4] = v11;
              *(_WORD *)&buf[12] = 2114;
              *(_QWORD *)&buf[14] = v51;
              *(_WORD *)&buf[22] = 2114;
              v98 = v69;
              _os_log_error_impl(&dword_1AA8E4000, log, OS_LOG_TYPE_ERROR, "%{public}@ Error getting proxied image synchronously for content url '%{public}@' error: %{public}@", buf, 0x20u);

            }
          }
          else if (v66)
          {
            loga = (os_log_t)MEMORY[0x1E0C99E98];
            objc_msgSend(v66, "_identifier");
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject URLWithString:](loga, "URLWithString:", v76);
            logb = (os_log_t)objc_claimAutoreleasedReturnValue();

            v51 = logb;
          }
          else if (os_log_type_enabled((os_log_t)UNLogCommunicationNotifications, OS_LOG_TYPE_ERROR))
          {
            +[_UNMutableNotificationCommunicationContext(UserNotifications_INIntent) mutableContextFromINIntent:].cold.1();
          }

        }
        else
        {
          if (v65)
          {
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v11;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v51;
            _os_log_impl(&dword_1AA8E4000, v64, OS_LOG_TYPE_DEFAULT, "%{public}@ Getting proxied image asynchronously for content url '%{public}@'.", buf, 0x16u);
          }
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x3032000000;
          v98 = __Block_byref_object_copy_;
          *(_QWORD *)&v99 = __Block_byref_object_dispose_;
          *((_QWORD *)&v99 + 1) = 0;
          v71 = dispatch_semaphore_create(0);
          v85[0] = MEMORY[0x1E0C809B0];
          v85[1] = 3221225472;
          v85[2] = __101___UNMutableNotificationCommunicationContext_UserNotifications_INIntent__mutableContextFromINIntent___block_invoke;
          v85[3] = &unk_1E57EFC00;
          v87 = buf;
          v72 = v71;
          v86 = v72;
          objc_msgSend(v29, "_requestProxy:", v85);
          v73 = dispatch_time(0, 1000000000);
          if (dispatch_semaphore_wait(v72, v73)
            && os_log_type_enabled((os_log_t)UNLogCommunicationNotifications, OS_LOG_TYPE_ERROR))
          {
            +[_UNMutableNotificationCommunicationContext(UserNotifications_INIntent) mutableContextFromINIntent:].cold.2();
          }
          v74 = *(void **)(*(_QWORD *)&buf[8] + 40);
          if (v74)
          {
            v75 = v74;

            v51 = v75;
          }

          _Block_object_dispose(buf, 8);
        }
      }
    }
LABEL_77:
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "timeIntervalSinceDate:", v49);
    v79 = v78;
    v80 = UNLogCommunicationNotifications;
    if (os_log_type_enabled((os_log_t)UNLogCommunicationNotifications, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v11;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v51;
      *(_WORD *)&buf[22] = 2050;
      v98 = v79;
      _os_log_impl(&dword_1AA8E4000, v80, OS_LOG_TYPE_DEFAULT, "%{public}@ Final contentURL '%{public}@' to persist. Finished in: %{public}f seconds", buf, 0x20u);
    }
    -[_UNMutableNotificationCommunicationContext setContentURL:](v4, "setContentURL:", v51);

    goto LABEL_80;
  }
  v48 = UNLogCommunicationNotifications;
  if (os_log_type_enabled((os_log_t)UNLogCommunicationNotifications, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v11;
    _os_log_impl(&dword_1AA8E4000, v48, OS_LOG_TYPE_DEFAULT, "%{public}@ INImage is nil.", buf, 0xCu);
  }
LABEL_80:

  return v4;
}

- (void)setIdentifier:(id)a3
{
  NSString *v4;
  NSString *identifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  identifier = self->super._identifier;
  self->super._identifier = v4;

}

- (void)setAssociatedObjectUri:(id)a3
{
  NSString *v4;
  NSString *associatedObjectUri;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  associatedObjectUri = self->super._associatedObjectUri;
  self->super._associatedObjectUri = v4;

}

- (void)setBundleIdentifier:(id)a3
{
  NSString *v4;
  NSString *bundleIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  bundleIdentifier = self->super._bundleIdentifier;
  self->super._bundleIdentifier = v4;

}

- (void)setDisplayName:(id)a3
{
  NSString *v4;
  NSString *displayName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  displayName = self->super._displayName;
  self->super._displayName = v4;

}

- (void)setSender:(id)a3
{
  _UNNotificationContact *v4;
  _UNNotificationContact *sender;

  v4 = (_UNNotificationContact *)objc_msgSend(a3, "copy");
  sender = self->super._sender;
  self->super._sender = v4;

}

- (void)setRecipients:(id)a3
{
  NSArray *v4;
  NSArray *recipients;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  recipients = self->super._recipients;
  self->super._recipients = v4;

}

- (void)setContentURL:(id)a3
{
  NSURL *v4;
  NSURL *contentURL;

  v4 = (NSURL *)objc_msgSend(a3, "copy");
  contentURL = self->super._contentURL;
  self->super._contentURL = v4;

}

- (void)setImageName:(id)a3
{
  NSString *v4;
  NSString *imageName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  imageName = self->super._imageName;
  self->super._imageName = v4;

}

- (void)setSystemImage:(BOOL)a3
{
  self->super._systemImage = a3;
}

- (void)setMentionsCurrentUser:(BOOL)a3
{
  self->super._mentionsCurrentUser = a3;
}

- (void)setNotifyRecipientAnyway:(BOOL)a3
{
  self->super._notifyRecipientAnyway = a3;
}

- (void)setReplyToCurrentUser:(BOOL)a3
{
  self->super._replyToCurrentUser = a3;
}

- (void)setRecipientCount:(unint64_t)a3
{
  self->super._recipientCount = a3;
}

- (void)setCapabilities:(int64_t)a3
{
  self->super._capabilities = a3;
}

- (void)setBusinessCorrespondence:(BOOL)a3
{
  self->super._businessCorrespondence = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  BOOL v8;
  BOOL v9;
  BOOL v10;
  unint64_t v11;
  int64_t v12;
  id v13;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _UNNotificationCommunicationContext *v22;

  v22 = +[_UNNotificationCommunicationContext allocWithZone:](_UNNotificationCommunicationContext, "allocWithZone:", a3);
  -[_UNNotificationCommunicationContext identifier](self, "identifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UNNotificationCommunicationContext associatedObjectUri](self, "associatedObjectUri");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UNNotificationCommunicationContext bundleIdentifier](self, "bundleIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UNNotificationCommunicationContext displayName](self, "displayName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UNNotificationCommunicationContext sender](self, "sender");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UNNotificationCommunicationContext recipients](self, "recipients");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UNNotificationCommunicationContext contentURL](self, "contentURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UNNotificationCommunicationContext imageName](self, "imageName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[_UNNotificationCommunicationContext isSystemImage](self, "isSystemImage");
  v8 = -[_UNNotificationCommunicationContext mentionsCurrentUser](self, "mentionsCurrentUser");
  v9 = -[_UNNotificationCommunicationContext notifyRecipientAnyway](self, "notifyRecipientAnyway");
  v10 = -[_UNNotificationCommunicationContext isReplyToCurrentUser](self, "isReplyToCurrentUser");
  v11 = -[_UNNotificationCommunicationContext recipientCount](self, "recipientCount");
  v12 = -[_UNNotificationCommunicationContext capabilities](self, "capabilities");
  LOBYTE(v16) = -[_UNNotificationCommunicationContext isBusinessCorrespondence](self, "isBusinessCorrespondence");
  BYTE3(v15) = v10;
  BYTE2(v15) = v9;
  BYTE1(v15) = v8;
  LOBYTE(v15) = v7;
  v13 = -[_UNNotificationCommunicationContext _initWithIdentifier:associatedObjectUri:bundleIdentifier:displayName:sender:recipients:contentURL:imageName:systemImage:mentionsCurrentUser:notifyRecipientAnyway:replyToCurrentUser:recipientCount:capabilities:businessCorrespondence:](v22, "_initWithIdentifier:associatedObjectUri:bundleIdentifier:displayName:sender:recipients:contentURL:imageName:systemImage:mentionsCurrentUser:notifyRecipientAnyway:replyToCurrentUser:recipientCount:capabilities:businessCorrespondence:", v21, v20, v19, v18, v17, v4, v5, v6, v15, v11, v12, v16);

  return v13;
}

@end
