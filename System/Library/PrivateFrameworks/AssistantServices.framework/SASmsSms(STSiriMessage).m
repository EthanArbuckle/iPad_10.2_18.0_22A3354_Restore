@implementation SASmsSms(STSiriMessage)

- (STSiriMessage)af_messageValue
{
  STSiriMessage *v2;
  void *v3;
  void *v4;
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
  id v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  STSiriMessage *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  void *v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(STSiriMessage);
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_af_messageIdentifierValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[STSiriModelObject setIdentifier:](v2, "setIdentifier:", v4);

  objc_msgSend(a1, "attachments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[STSiriMessage setAttachmentURL:](v2, "setAttachmentURL:", v7);

  objc_msgSend(a1, "dateSent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[STSiriMessage setSendDate:](v2, "setSendDate:", v8);

  objc_msgSend(a1, "message");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[STSiriMessage setBodyText:](v2, "setBodyText:", v9);

  objc_msgSend(a1, "outgoing");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[STSiriMessage setOutbound:](v2, "setOutbound:", objc_msgSend(v10, "BOOLValue"));

  objc_msgSend(a1, "subject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[STSiriMessage setSubjectText:](v2, "setSubjectText:", v11);

  objc_msgSend(a1, "chatIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[STSiriMessage setChatIdentifier:](v2, "setChatIdentifier:", v12);

  objc_msgSend(a1, "groupName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[STSiriMessage setGroupName:](v2, "setGroupName:", v13);

  objc_msgSend(a1, "groupNameId");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[STSiriMessage setGroupNameId:](v2, "setGroupNameId:", v14);

  objc_msgSend(a1, "msgSender");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "st_contactAddressValue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[STSiriMessage setSenderAddress:](v2, "setSenderAddress:", v16);

  objc_msgSend(a1, "msgSender");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "object");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "internalGUID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v2;
  -[STSiriMessage _setSenderInternalGUID:](v2, "_setSenderInternalGUID:", v19);

  v20 = objc_alloc(MEMORY[0x1E0C99DE8]);
  objc_msgSend(a1, "msgRecipients");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v20, "initWithCapacity:", objc_msgSend(v21, "count"));

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  objc_msgSend(a1, "msgRecipients");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v37 != v26)
          objc_enumerationMutation(v23);
        v28 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        objc_msgSend(v28, "st_contactAddressValue");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (v29)
        {
          objc_msgSend(v22, "addObject:", v29);
        }
        else
        {
          v30 = (void *)AFSiriLogContextConnection;
          if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
          {
            v31 = v30;
            objc_msgSend(v28, "aceId");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315394;
            v41 = "-[SASmsSms(STSiriMessage) af_messageValue]";
            v42 = 2112;
            v43 = v32;
            _os_log_error_impl(&dword_19AF50000, v31, OS_LOG_TYPE_ERROR, "%s Invalid message recipient has no actionable contact values %@. Ignoring that recipient.", buf, 0x16u);

          }
        }

      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    }
    while (v25);
  }

  if (objc_msgSend(v22, "count"))
    -[STSiriMessage setRecipientAddresses:](v35, "setRecipientAddresses:", v22);
  objc_msgSend(a1, "effect");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[STSiriMessage setEffect:](v35, "setEffect:", v33);

  return v35;
}

@end
