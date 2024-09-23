@implementation SAPhoneVoiceMailSnippet

- (id)sr_sirilandShim
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  double v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  uint64_t v35;
  double v36;
  id v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  void *v43;
  id v44;
  SAPhoneVoiceMailSnippet *v45;
  id v46;
  void *v47;
  id v48;
  id v49;
  id v50;
  uint64_t v51;
  void *v52;
  unsigned int v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  _QWORD v68[4];
  id v69;
  id v70;
  id v71;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SAPhoneVoiceMailSnippet calls](self, "calls"));
  v4 = v3;
  if (v3 && objc_msgSend(v3, "count"))
  {
    v66 = v4;
    v5 = objc_alloc_init((Class)SFCard);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SAPhoneVoiceMailSnippet title](self, "title"));
    objc_msgSend(v5, "setTitle:", v6);

    objc_msgSend(v5, "setType:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SAPhoneVoiceMailSnippet aceId](self, "aceId"));
    objc_msgSend(v5, "setCardId:", v7);

    objc_msgSend(v5, "setSource:", 2);
    v8 = objc_alloc_init((Class)NSMutableArray);
    v9 = objc_alloc_init((Class)NSMutableArray);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SAPhoneVoiceMailSnippet calls](self, "calls"));
    v68[0] = _NSConcreteStackBlock;
    v68[1] = 3221225472;
    v68[2] = sub_10005DB68;
    v68[3] = &unk_100123D10;
    v11 = v8;
    v69 = v11;
    v67 = v9;
    v70 = v67;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SAPhoneVoiceMailSnippet _callHistoryRowsForCalls:callOperation:](self, "_callHistoryRowsForCalls:callOperation:", v10, v68));

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SAPhoneVoiceMailSnippet _searchCallHistoryIntentForVoicemail:](self, "_searchCallHistoryIntentForVoicemail:", 1));
    v65 = v11;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SAPhoneVoiceMailSnippet _searchCallHistoryIntentResponseForCallRecords:](self, "_searchCallHistoryIntentResponseForCallRecords:", v11));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "backingStore"));
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "data"));

    *(_QWORD *)&v18 = objc_opt_class(v13, v17).n128_u64[0];
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "intentDescription", v18));
    v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "name"));

    objc_msgSend(v5, "setIntentMessageData:", v16);
    v60 = (void *)v21;
    objc_msgSend(v5, "setIntentMessageName:", v21);
    v62 = v14;
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "backingStore"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "data"));
    objc_msgSend(v5, "setIntentResponseMessageData:", v23);

    *(_QWORD *)&v25 = objc_opt_class(v13, v24).n128_u64[0];
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "intentDescription", v25));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "responseName"));
    objc_msgSend(v5, "setIntentResponseMessageName:", v28);

    v29 = objc_alloc_init((Class)SAIntentGroupLaunchAppWithIntent);
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "UUIDString"));
    objc_msgSend(v29, "setAceId:", v31);

    v32 = objc_alloc_init((Class)SAIntentGroupProtobufMessage);
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "UUIDString"));
    objc_msgSend(v32, "setAceId:", v34);

    v61 = (void *)v16;
    objc_msgSend(v32, "setData:", v16);
    v63 = v13;
    *(_QWORD *)&v36 = objc_opt_class(v13, v35).n128_u64[0];
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "intentDescription", v36));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "type"));
    objc_msgSend(v32, "setTypeName:", v39);

    objc_msgSend(v29, "setHandledIntent:", v32);
    v40 = objc_alloc_init((Class)SFAbstractCommand);
    objc_msgSend(v40, "setType:", 1);
    v41 = objc_alloc_init((Class)SFCommandValue);
    v42 = objc_alloc_init((Class)SFReferentialCommand);
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "aceId"));
    objc_msgSend(v42, "setReferenceIdentifier:", v43);

    objc_msgSend(v41, "setReferentialCommand:", v42);
    v59 = v40;
    objc_msgSend(v40, "setValue:", v41);
    v64 = v12;
    v44 = objc_msgSend(v12, "copy");
    objc_msgSend(v5, "setCardSections:", v44);

    v45 = (SAPhoneVoiceMailSnippet *)objc_alloc_init((Class)SACardSnippet);
    v46 = objc_msgSend(objc_alloc((Class)_SFPBCard), "initWithFacade:", v5);
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "data"));
    -[SAPhoneVoiceMailSnippet setCardData:](v45, "setCardData:", v47);

    v48 = objc_msgSend(v67, "copy");
    -[SAPhoneVoiceMailSnippet setReferencedCommands:](v45, "setReferencedCommands:", v48);

    v49 = objc_alloc_init((Class)SAUISash);
    v50 = objc_msgSend(v49, "setApplicationBundleIdentifier:", CFSTR("com.apple.mobilephone"));
    if (AFIsInternalInstall(v50, v51))
    {
      v52 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](AFPreferences, "sharedPreferences"));
      v53 = objc_msgSend(v52, "debugButtonIsEnabled");

      if (v53)
      {
        v54 = sub_10005B08C(CFSTR("VOICEMAIL_SASH_TITLE"));
        v55 = (void *)objc_claimAutoreleasedReturnValue(v54);
        v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (INTERNAL ONLY: LEGACY FLOW)"), v55));
        objc_msgSend(v49, "setTitle:", v56);

      }
    }
    v71 = v29;
    v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v71, 1));
    objc_msgSend(v49, "setCommands:", v57);

    -[SAPhoneVoiceMailSnippet setSash:](v45, "setSash:", v49);
    -[SAPhoneVoiceMailSnippet sr_applySnippetProperties:](v45, "sr_applySnippetProperties:", self);

    v4 = v66;
  }
  else
  {
    v45 = self;
  }

  return v45;
}

@end
