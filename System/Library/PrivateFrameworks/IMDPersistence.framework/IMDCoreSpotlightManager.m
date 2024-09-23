@implementation IMDCoreSpotlightManager

- (id)backpressureController
{
  IMBackpressuredDonationController *backpressureController;
  IMBackpressuredDonationController *v4;
  IMBackpressuredDonationController *v5;

  backpressureController = self->_backpressureController;
  if (!backpressureController)
  {
    v4 = -[IMBackpressuredDonationController initWithDonationCount:maxBackpressureSize:donationBlock:]([IMBackpressuredDonationController alloc], "initWithDonationCount:maxBackpressureSize:donationBlock:", -[IMDCoreSpotlightManager _batchBackpressuredDonationCount](self, "_batchBackpressuredDonationCount"), -[IMDCoreSpotlightManager _maxBackpressureSize](self, "_maxBackpressureSize"), &unk_1E5AAF168);
    v5 = self->_backpressureController;
    self->_backpressureController = v4;

    backpressureController = self->_backpressureController;
  }
  return backpressureController;
}

- (int64_t)_batchBackpressuredDonationCount
{
  return IMGetCachedDomainIntForKeyWithDefaultValue();
}

- (int64_t)_maxBackpressureSize
{
  return IMGetCachedDomainIntForKeyWithDefaultValue();
}

- (void)_donateInteractions:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  sub_1ABBD6E7C();
  -[IMDCoreSpotlightManager backpressureController](self, "backpressureController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "donateItems:", v4);

}

- (void)donateChatDictionary:(id)a3 withMessageDictionary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint8_t v14[16];
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1AF435474]();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_1ABB60000, v9, OS_LOG_TYPE_INFO, "Donate a Chat with a Message to Interaction Store", v14, 2u);
    }

  }
  +[IMDCoreSpotlightManager sharedInstance](IMDCoreSpotlightManager, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "newCDInteractionForChatDictionary:messageDictionary:", v6, v7);

  if (v11)
  {
    v15[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDCoreSpotlightManager _donateInteractions:](self, "_donateInteractions:", v12);

  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_1ABB60000, v13, OS_LOG_TYPE_INFO, "Cannot create a CDInteraction with the chat and message record", v14, 2u);
    }

  }
  objc_autoreleasePoolPop(v8);

}

- (id)newCDInteractionForChatDictionary:(id)a3 messageDictionary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  NSObject *v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  id v28;
  uint64_t v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  objc_class *v34;
  id v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v40;
  void *v41;
  unint64_t v42;
  void *v43;
  id v44;
  void *v45;
  _QWORD v46[4];
  id v47;
  id v48;
  _QWORD *v49;
  __int128 *p_buf;
  _QWORD v51[5];
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t v60;
  __int128 buf;
  uint64_t v62;
  uint64_t (*v63)(uint64_t, uint64_t);
  void (*v64)(uint64_t);
  id v65;
  uint8_t v66[128];
  __int128 v67;
  Class (*v68)(uint64_t);
  void *v69;
  uint64_t *v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0D39B78], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isUnderFirstDataProtectionLock");

  if (!v9)
  {
    IMDPersistenceCheckNotDatabaseThread();
    objc_msgSend(v7, "objectForKey:", CFSTR("guid"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("guid"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v6, "BOOLValueForKey:withDefault:", CFSTR("isBlackholed"), 0);
    -[IMDCoreSpotlightManager blocklistMessageGUIDs](self, "blocklistMessageGUIDs");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "containsObject:", v12) | v13;

    if (v15 == 1)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = v12;
          _os_log_impl(&dword_1ABB60000, v16, OS_LOG_TYPE_INFO, "IMDCoreDuetDonation - Skipping donation %@, denylisted", (uint8_t *)&buf, 0xCu);
        }
LABEL_16:

      }
    }
    else
    {
      if (!+[IMDCoreSpotlightMessageMetadataIndexer cancelIndexingForItem:](IMDCoreSpotlightMessageMetadataIndexer, "cancelIndexingForItem:", v7))
      {
        objc_msgSend(v7, "objectForKey:", CFSTR("flags"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v17, "unsignedLongLongValue") & 4;

        objc_msgSend(v6, "objectForKey:", CFSTR("lalh"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "_stripFZIDPrefix");
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        if (v42)
        {
          v21 = v43;
        }
        else
        {
          objc_msgSend(v7, "objectForKey:", CFSTR("handle"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "_stripFZIDPrefix");
          v20 = objc_claimAutoreleasedReturnValue();

          v21 = (id)v20;
        }
        v41 = v21;
        v44 = -[IMDCoreSpotlightManager newCDContactForURI:](self, "newCDContactForURI:");
        objc_msgSend(v6, "objectForKey:", CFSTR("participants"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = 0u;
        v56 = 0u;
        v53 = 0u;
        v54 = 0u;
        v24 = v22;
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v53, v66, 16);
        if (v25)
        {
          v26 = *(_QWORD *)v54;
          do
          {
            for (i = 0; i != v25; ++i)
            {
              if (*(_QWORD *)v54 != v26)
                objc_enumerationMutation(v24);
              v28 = -[IMDCoreSpotlightManager newCDContactForURI:](self, "newCDContactForURI:", *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * i));
              if (v28)
                objc_msgSend(v23, "addObject:", v28);

            }
            v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v53, v66, 16);
          }
          while (v25);
        }

        objc_msgSend(v6, "objectForKey:", CFSTR("groupName"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)&buf = 0;
        *((_QWORD *)&buf + 1) = &buf;
        v62 = 0x3032000000;
        v63 = sub_1ABBBB178;
        v64 = sub_1ABBBB188;
        v65 = 0;
        v51[0] = 0;
        v51[1] = v51;
        v51[2] = 0x3032000000;
        v51[3] = sub_1ABBBB178;
        v51[4] = sub_1ABBBB188;
        v52 = 0;
        v29 = MEMORY[0x1E0C809B0];
        v46[0] = MEMORY[0x1E0C809B0];
        v46[1] = 3221225472;
        v46[2] = sub_1ABBBB190;
        v46[3] = &unk_1E5AB7828;
        v30 = v6;
        v47 = v30;
        v49 = v51;
        v31 = v45;
        v48 = v31;
        p_buf = &buf;
        v32 = v40;
        IMDPersistencePerformBlock(v46, 1);
        -[IMDCoreSpotlightManager _postProcessIndexingForItem:chatDictionary:isReindexing:](self, "_postProcessIndexingForItem:chatDictionary:isReindexing:", v7, v30, 0);
        v57 = 0;
        v58 = &v57;
        v59 = 0x2050000000;
        v33 = (void *)qword_1EEC40490;
        v60 = qword_1EEC40490;
        if (!qword_1EEC40490)
        {
          *(_QWORD *)&v67 = v29;
          *((_QWORD *)&v67 + 1) = 3221225472;
          v68 = sub_1ABBBC0F8;
          v69 = &unk_1E5AB0C88;
          v70 = &v57;
          sub_1ABBBC0F8((uint64_t)&v67);
          v33 = (void *)v58[3];
        }
        v34 = objc_retainAutorelease(v33);
        _Block_object_dispose(&v57, 8);
        v35 = objc_alloc_init(v34);
        objc_msgSend(v35, "setBundleId:", CFSTR("com.apple.MobileSMS"));
        objc_msgSend(v35, "setMechanism:", 4);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "setStartDate:", v36);

        objc_msgSend(v35, "startDate");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "setEndDate:", v37);

        objc_msgSend(v35, "setDirection:", v42 >> 2);
        objc_msgSend(v35, "setDomainIdentifier:", v31);
        objc_msgSend(v35, "setUuid:", v12);
        objc_msgSend(v35, "setSender:", v44);
        objc_msgSend(v35, "setRecipients:", v23);
        if (objc_msgSend(v40, "length"))
          objc_msgSend(v35, "setGroupName:", v40);
        objc_msgSend(v35, "setContentURL:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40), v40);
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
          {
            LODWORD(v67) = 138412290;
            *(_QWORD *)((char *)&v67 + 4) = v12;
            _os_log_impl(&dword_1ABB60000, v38, OS_LOG_TYPE_INFO, "Created interaction for message %@", (uint8_t *)&v67, 0xCu);
          }

        }
        v11 = v35;

        _Block_object_dispose(v51, 8);
        _Block_object_dispose(&buf, 8);

        goto LABEL_39;
      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = v12;
          _os_log_impl(&dword_1ABB60000, v16, OS_LOG_TYPE_INFO, "IMDCoreDuetDonation - Skipping donation %@, bailed out", (uint8_t *)&buf, 0xCu);
        }
        goto LABEL_16;
      }
    }
    v11 = 0;
LABEL_39:

    goto LABEL_40;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1ABB60000, v10, OS_LOG_TYPE_INFO, " => Before first unlock, skipping donation", (uint8_t *)&buf, 2u);
    }

  }
  v11 = 0;
LABEL_40:

  return v11;
}

- (id)newCDContactForURI:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  objc_class *v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    _IMDCoreSpotlightCNContactForAddress(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _IMDCoreSpotlightFullNameForContact(v5, 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (!v6)
      v6 = v4;
    v17 = 0;
    v18 = &v17;
    v19 = 0x2050000000;
    v7 = (void *)qword_1EEC40498;
    v20 = qword_1EEC40498;
    if (!qword_1EEC40498)
    {
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = sub_1ABBBC14C;
      v16[3] = &unk_1E5AB0C88;
      v16[4] = &v17;
      sub_1ABBBC14C((uint64_t)v16);
      v7 = (void *)v18[3];
    }
    v8 = objc_retainAutorelease(v7);
    _Block_object_dispose(&v17, 8);
    v9 = [v8 alloc];
    if (objc_msgSend(v4, "_appearsToBeEmail"))
      v10 = 2;
    else
      v10 = 1;
    objc_msgSend(v5, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      v12 = 3;
    else
      v12 = 0;
    v13 = (void *)objc_msgSend(v9, "initWithIdentifier:type:displayName:personId:personIdType:", v4, v10, v6, v11, v12);

  }
  else
  {
    v6 = 0;
    v5 = 0;
    v13 = 0;
  }
  v14 = v13;

  return v14;
}

- (void)donateNextMessageBatchIfNeeded:(unint64_t)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  NSObject *v7;
  unint64_t v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  int v13;
  int v14;
  const __CFString *v15;
  const __CFString *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  _QWORD v20[5];
  void (**v21)(_QWORD);
  _BYTE *v22;
  unint64_t v23;
  char v24;
  char v25;
  char v26;
  uint8_t v27[4];
  const char *v28;
  _BYTE buf[24];
  unint64_t v30;
  __int16 v31;
  const __CFString *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(_QWORD))a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = a3;
      _os_log_impl(&dword_1ABB60000, v7, OS_LOG_TYPE_INFO, "Donating next batch of messages. Batch size of %lu", buf, 0xCu);
    }

  }
  if (-[IMDCoreSpotlightManager _shouldDonateNextBatchForBatchSize:](self, "_shouldDonateNextBatchForBatchSize:", a3))
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v30 = 0;
    v30 = -[IMDCoreSpotlightManager _lastDonatedRowID](self, "_lastDonatedRowID");
    v26 = 0;
    v8 = -[IMDCoreSpotlightManager _batchSizeForTargetBatchSize:lastIndexedRowID:lastBatch:](self, "_batchSizeForTargetBatchSize:lastIndexedRowID:lastBatch:", a3, *(_QWORD *)(*(_QWORD *)&buf[8] + 24), &v26);
    v9 = objc_alloc_init(MEMORY[0x1E0D36AE8]);
    objc_msgSend(v9, "startTimingForKey:", CFSTR("totalTime"));
    v25 = 0;
    v10 = -[IMDCoreSpotlightManager _copyCDInteractionsForMessagesWithLastRowID:batchSize:timingCollection:hadResults:](self, "_copyCDInteractionsForMessagesWithLastRowID:batchSize:timingCollection:hadResults:", *(_QWORD *)&buf[8] + 24, v8, v9, &v25);
    if (objc_msgSend(v10, "count"))
    {
      objc_msgSend(v9, "startTimingForKey:", CFSTR("DonationRecording"));
      objc_msgSend(sub_1ABBBA5E0(), "interactionRecorder");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = sub_1ABBBB938;
      v20[3] = &unk_1E5AB7850;
      v22 = buf;
      v23 = v8;
      v24 = v26;
      v20[4] = self;
      v21 = v6;
      objc_msgSend(v11, "recordInteractions:completionHandler:", v10, v20);
      objc_msgSend(v9, "stopTimingForKey:", CFSTR("DonationRecording"));

    }
    else
    {
      if (v25)
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v27 = 136315138;
            v28 = "-[IMDCoreSpotlightManager(CoreDuetDonation) donateNextMessageBatchIfNeeded:completion:]";
            _os_log_impl(&dword_1ABB60000, v17, OS_LOG_TYPE_INFO, "IMDCoreDuetDonation: %s - Generated no interaction items :(", v27, 0xCu);
          }

        }
      }
      else
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v27 = 136315138;
            v28 = "-[IMDCoreSpotlightManager(CoreDuetDonation) donateNextMessageBatchIfNeeded:completion:]";
            _os_log_impl(&dword_1ABB60000, v18, OS_LOG_TYPE_INFO, "IMDCoreDuetDonation %s - Got no records from IMDMessageRecordCopyMessagesFromRowIDDescLimit. Stopping donation", v27, 0xCu);
          }

        }
        -[IMDCoreSpotlightManager _setNeedsDonation:](self, "_setNeedsDonation:", 0);
        -[IMDCoreSpotlightManager _setLastDonatedRowID:](self, "_setLastDonatedRowID:", 1);
      }
      if (v6)
        v6[2](v6);
    }
    objc_msgSend(v9, "stopTimingForKey:", CFSTR("totalTime"));
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v27 = 138412290;
        v28 = (const char *)v9;
        _os_log_impl(&dword_1ABB60000, v19, OS_LOG_TYPE_INFO, "Timing %@", v27, 0xCu);
      }

    }
    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = objc_msgSend(MEMORY[0x1E0D397C8], "needsDonation");
        v14 = IMDSystemMigrationOccurred();
        v15 = CFSTR("NO");
        *(_QWORD *)&buf[4] = "-[IMDCoreSpotlightManager(CoreDuetDonation) donateNextMessageBatchIfNeeded:completion:]";
        *(_WORD *)&buf[12] = 2048;
        if (v13)
          v16 = CFSTR("YES");
        else
          v16 = CFSTR("NO");
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[14] = a3;
        *(_WORD *)&buf[22] = 2112;
        if (v14)
          v15 = CFSTR("YES");
        v30 = (unint64_t)v16;
        v31 = 2112;
        v32 = v15;
        _os_log_impl(&dword_1ABB60000, v12, OS_LOG_TYPE_INFO, "IMDCoreDuetDonation %s - Not donate. Batch size %lu needsDonation %@ hasMigrated %@", buf, 0x2Au);
      }

    }
    if (v6)
      v6[2](v6);
  }

}

- (id)_copyCDInteractionsForMessagesWithLastRowID:(unint64_t *)a3 batchSize:(unint64_t)a4 timingCollection:(id)a5 hadResults:(BOOL *)a6
{
  id v10;
  void *v11;
  _QWORD v13[6];
  uint64_t v14;
  _QWORD v15[3];
  char v16;

  v10 = a5;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v16 = 0;
  v14 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_1ABBBBC4C;
  v13[3] = &unk_1E5AB7878;
  v13[4] = self;
  v13[5] = v15;
  IMDDeriveObjectsForMessagesWithLastRowIDAndBatchSizeUsingBlock(a3, &v14, a4, v10, v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (a6)
    *a6 = v14 != 0;
  _Block_object_dispose(v15, 8);

  return v11;
}

- (BOOL)_shouldDonateNextBatchForBatchSize:(unint64_t)a3
{
  if (a3 && objc_msgSend(MEMORY[0x1E0D397C8], "needsDonation"))
    return IMDSystemMigrationOccurred();
  else
    return 0;
}

- (unint64_t)_lastDonatedRowID
{
  return MEMORY[0x1E0DE7D20](MEMORY[0x1E0D397C8], sel_lastDonatedRowID);
}

- (void)_setNeedsDonation:(BOOL)a3
{
  IMSetDomainBoolForKey();
}

- (void)_setLastDonatedRowID:(unint64_t)a3
{
  IMSetDomainIntForKey();
}

- (void)setNeedsDonateAllMessagesWithReason:(int64_t)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD v11[5];
  void (**v12)(_QWORD);
  uint64_t v13;
  int64_t v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(_QWORD))a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "-[IMDCoreSpotlightManager(CoreDuetDonation) setNeedsDonateAllMessagesWithReason:completion:]";
      _os_log_impl(&dword_1ABB60000, v7, OS_LOG_TYPE_INFO, "%s starting batch donation", buf, 0xCu);
    }

  }
  v8 = -[IMDCoreSpotlightManager maxRowID](self, "maxRowID");
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "-[IMDCoreSpotlightManager(CoreDuetDonation) setNeedsDonateAllMessagesWithReason:completion:]";
      v17 = 2048;
      v18 = v8;
      _os_log_impl(&dword_1ABB60000, v9, OS_LOG_TYPE_INFO, "%s max cmj rowID %lld", buf, 0x16u);
    }

  }
  if (v8 <= 0)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1ABB60000, v10, OS_LOG_TYPE_INFO, "IMDCoreDuetDonation: Failed to get max cmj row ID for indexing!", buf, 2u);
      }

    }
    if (v6)
      v6[2](v6);
  }
  else
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_1ABBBBFAC;
    v11[3] = &unk_1E5AB78A0;
    v11[4] = self;
    v13 = v8;
    v14 = a3;
    v12 = v6;
    sub_1ABBD7050(v11);

  }
}

+ (id)sharedInstance
{
  if (qword_1ED0D39C8 != -1)
    dispatch_once(&qword_1ED0D39C8, &unk_1E5AB8910);
  return (id)qword_1ED0D3AB0;
}

- (IMDCoreSpotlightManager)init
{
  IMDCoreSpotlightManager *v2;
  void *v3;
  unint64_t v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  NSMutableOrderedSet *v8;
  NSMutableOrderedSet *blocklistMessageGUIDs;
  objc_super v11;
  uint8_t buf[4];
  unint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)IMDCoreSpotlightManager;
  v2 = -[IMDCoreSpotlightManager init](&v11, sel_init);
  if (v2)
  {
    IMGetCachedDomainValueForKey();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count");
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v13 = v4;
        _os_log_impl(&dword_1ABB60000, v5, OS_LOG_TYPE_INFO, "Current blocklist size is %lu", buf, 0xCu);
      }

    }
    if (v4 >= 0xC9)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v13) = 200;
          _os_log_impl(&dword_1ABB60000, v6, OS_LOG_TYPE_INFO, "Blocklist size > %d on load, truncating", buf, 8u);
        }

      }
      objc_msgSend(v3, "subarrayWithRange:", v4 - 200, 200);
      v7 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v7;
    }
    if (v3)
      v8 = (NSMutableOrderedSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithArray:", v3);
    else
      v8 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    blocklistMessageGUIDs = v2->_blocklistMessageGUIDs;
    v2->_blocklistMessageGUIDs = v8;

  }
  return v2;
}

- (int64_t)totalMessages
{
  void *v2;
  int64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  +[IMDDatabase synchronousDatabase](IMDDatabase, "synchronousDatabase");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1ABBDC03C;
  v5[3] = &unk_1E5AB8938;
  v5[4] = &v6;
  objc_msgSend(v2, "fetchCountOfRecordType:completionHandler:", 0, v5);

  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)searchableIndex
{
  if ((objc_msgSend(MEMORY[0x1E0D397F8], "deviceIsLockedDown") & 1) != 0)
    return 0;
  IMCoreSpotlightIndex();
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_personIdentityQueue
{
  if (qword_1EEC40508 != -1)
    dispatch_once(&qword_1EEC40508, &unk_1E5AAEA20);
  return (id)qword_1EEC40500;
}

- (id)_scrutinyMessagesQueue
{
  if (qword_1ED0D3808 != -1)
    dispatch_once(&qword_1ED0D3808, &unk_1E5AAE598);
  return (id)qword_1ED0D3810;
}

+ (Class)__SLCollaborationHandshakeController
{
  if (qword_1EEC40518 != -1)
    dispatch_once(&qword_1EEC40518, &unk_1E5AB8958);
  return (Class)(id)qword_1EEC40510;
}

- (NSMutableOrderedSet)blocklistMessageGUIDs
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_1ABBD784C;
  v11 = sub_1ABBD785C;
  v12 = 0;
  -[IMDCoreSpotlightManager _scrutinyMessagesQueue](self, "_scrutinyMessagesQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1ABBDC300;
  v6[3] = &unk_1E5AB8980;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSMutableOrderedSet *)v4;
}

- (void)setMessageGUIDUnderScrutiny:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[5];
  id v15;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    -[IMDCoreSpotlightManager _scrutinyMessagesQueue](self, "_scrutinyMessagesQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = sub_1ABBDC3E8;
    v14[3] = &unk_1E5AAF5B8;
    v14[4] = self;
    v15 = v4;
    dispatch_barrier_sync(v5, v14);

  }
  else
  {
    IMLogHandleForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1ABC5E310(v6, v7, v8, v9, v10, v11, v12, v13);

  }
}

- (void)clearMessageGUIDFromScrutiny:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[5];
  id v15;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    -[IMDCoreSpotlightManager _scrutinyMessagesQueue](self, "_scrutinyMessagesQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = sub_1ABBDC51C;
    v14[3] = &unk_1E5AAF5B8;
    v14[4] = self;
    v15 = v4;
    dispatch_barrier_sync(v5, v14);

  }
  else
  {
    IMLogHandleForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1ABC5E380(v6, v7, v8, v9, v10, v11, v12, v13);

  }
}

- (id)newSearchableItemsForMessageGUID:(id)a3 reindexing:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v4 = a4;
  v6 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_1ABBD784C;
  v21 = sub_1ABBD785C;
  v22 = 0;
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = sub_1ABBDC790;
  v14 = &unk_1E5AB8980;
  v16 = &v17;
  v7 = v6;
  v15 = v7;
  IMDPersistencePerformBlock(&v11, 1);
  v8 = v18[5];
  if (v8)
    v9 = -[IMDCoreSpotlightManager newSearchableItemsForMessage:reindexing:](self, "newSearchableItemsForMessage:reindexing:", v8, v4, v11, v12, v13, v14);
  else
    v9 = 0;

  _Block_object_dispose(&v17, 8);
  return v9;
}

- (id)newSearchableItemsForMessage:(id)a3 reindexing:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v4 = a4;
  v6 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_1ABBD784C;
  v24 = sub_1ABBD785C;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = sub_1ABBD784C;
  v18 = sub_1ABBD785C;
  v19 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1ABBDC900;
  v10[3] = &unk_1E5AB89A8;
  v12 = &v20;
  v7 = v6;
  v11 = v7;
  v13 = &v14;
  IMDPersistencePerformBlock(v10, 1);
  v8 = -[IMDCoreSpotlightManager newSearchableItemsForMessageItemDictionary:chatDictionary:reindexing:](self, "newSearchableItemsForMessageItemDictionary:chatDictionary:reindexing:", v21[5], v15[5], v4);

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v8;
}

- (id)newSearchableItemsForMessageItemDictionary:(id)a3 chatDictionary:(id)a4 reindexing:(BOOL)a5
{
  id v7;
  id v8;
  void *v9;
  int v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  const __CFString *v16;
  char v17;
  NSObject *v18;
  id v19;
  void *v20;
  id v21;
  IMDSpotlightIndexerTimingProfiler *v22;
  NSObject *v23;
  NSObject *v24;
  id v25;
  NSObject *v26;
  dispatch_time_t v27;
  unint64_t v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _BOOL4 v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
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
  id v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  NSObject *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  int v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  id v82;
  void *v83;
  void *v84;
  BOOL v85;
  id v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t j;
  void *v90;
  NSObject *v91;
  void *v92;
  void *v93;
  NSObject *v95;
  NSObject *v96;
  IMDSpotlightIndexerTimingProfiler *v97;
  id v98;
  void *v99;
  void *v100;
  void *v101;
  id v102;
  id v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  id v108;
  void *v109;
  id v110;
  void *v111;
  id v113;
  id v114;
  id v115;
  void *v116;
  uint64_t v117;
  id v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  id obj;
  id obja;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  id v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  _QWORD block[4];
  id v138;
  IMDSpotlightIndexerTimingProfiler *v139;
  id v140;
  id v141;
  id v142;
  id v143;
  IMDCoreSpotlightManager *v144;
  id v145;
  NSObject *v146;
  uint64_t *v147;
  _BYTE *v148;
  uint64_t *v149;
  BOOL v150;
  uint64_t v151;
  uint64_t *v152;
  uint64_t v153;
  char v154;
  uint64_t v155;
  uint64_t *v156;
  uint64_t v157;
  char v158;
  _BYTE v159[128];
  uint64_t v160;
  uint8_t v161[4];
  _BYTE v162[14];
  _BYTE v163[128];
  uint8_t v164[128];
  _BYTE buf[24];
  char v166;
  uint64_t v167;

  v167 = *MEMORY[0x1E0C80C00];
  v113 = a3;
  v7 = a4;
  if ((sub_1ABBD7240() & 1) == 0)
  {
    v111 = v7;
    IMDPersistenceCheckNotDatabaseThread();
    objc_msgSend(MEMORY[0x1E0D39B78], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isUnderFirstDataProtectionLock");

    if (v10)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1ABB60000, v11, OS_LOG_TYPE_INFO, " => Before first unlock, skipping indexing", buf, 2u);
        }

      }
      v8 = 0;
      goto LABEL_119;
    }
    v109 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
    v103 = 0;
    if (!v113)
    {
      v104 = 0;
      goto LABEL_116;
    }
    v104 = 0;
    if (!v111)
    {
LABEL_116:
      v8 = v109;
LABEL_118:

LABEL_119:
      v7 = v111;
      goto LABEL_120;
    }
    IMDSpotlightPriorityIndexerClasses();
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v113, "objectForKey:", CFSTR("guid"));
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "objectForKey:", CFSTR("guid"));
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "objectForKey:", CFSTR("groupName"));
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v111, "BOOLValueForKey:withDefault:", CFSTR("isBlackholed"), 0);
    v13 = objc_msgSend(v111, "integerValueForKey:withDefault:", CFSTR("isFiltered"), 0);
    -[IMDCoreSpotlightManager blocklistMessageGUIDs](self, "blocklistMessageGUIDs");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (((objc_msgSend(v14, "containsObject:", v100) | v12) & 1) != 0)
    {

LABEL_15:
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          v16 = CFSTR("NO");
          if (v12)
            v16 = CFSTR("YES");
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v100;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v16;
          _os_log_impl(&dword_1ABB60000, v15, OS_LOG_TYPE_INFO, "IMDCoreSpotlight - Skipping indexing %@, denylisted - isBlackholed: %@", buf, 0x16u);
        }

      }
      v103 = 0;
      v104 = 0;
      v17 = 0;
LABEL_115:

      if ((v17 & 1) == 0)
      {
        v8 = (id)MEMORY[0x1E0C9AA60];
        goto LABEL_118;
      }
      goto LABEL_116;
    }

    if (v13 == 2)
      goto LABEL_15;
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v100;
        _os_log_impl(&dword_1ABB60000, v18, OS_LOG_TYPE_INFO, "Indexing placing %@ under scrutiny", buf, 0xCu);
      }

    }
    -[IMDCoreSpotlightManager setMessageGUIDUnderScrutiny:](self, "setMessageGUIDUnderScrutiny:", v100);
    v19 = objc_alloc(MEMORY[0x1E0CA6B50]);
    v20 = (void *)objc_msgSend(v19, "initWithItemContentType:", *MEMORY[0x1E0CA5BF0]);
    v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v166 = 0;
    v155 = 0;
    v156 = &v155;
    v157 = 0x2020000000;
    v158 = 0;
    v22 = objc_alloc_init(IMDSpotlightIndexerTimingProfiler);
    -[IMDSpotlightIndexerTimingProfiler startMainTimerWithExpectedTimeoutInterval:](v22, "startMainTimerWithExpectedTimeoutInterval:", 30.0);
    if (qword_1ED0D3858 != -1)
      dispatch_once(&qword_1ED0D3858, &unk_1E5AB89C8);
    v151 = 0;
    v152 = &v151;
    v153 = 0x2020000000;
    v154 = 0;
    v23 = dispatch_group_create();
    dispatch_group_enter(v23);
    v24 = qword_1ED0D3860;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1ABBDDD50;
    block[3] = &unk_1E5AB89F0;
    v138 = v99;
    v97 = v22;
    v139 = v97;
    v147 = &v151;
    v25 = v113;
    v140 = v25;
    v102 = v20;
    v141 = v102;
    v114 = v111;
    v142 = v114;
    v150 = a5;
    v98 = v21;
    v143 = v98;
    v144 = self;
    v148 = buf;
    v149 = &v155;
    v118 = v100;
    v145 = v118;
    v26 = v23;
    v146 = v26;
    dispatch_async(v24, block);
    v27 = dispatch_time(0, 30000000000);
    v96 = v26;
    if (dispatch_group_wait(v26, v27))
    {
      -[IMDSpotlightIndexerTimingProfiler stopMainTimerAndLogAfterFailure](v97, "stopMainTimerAndLogAfterFailure");
      IMLogHandleForCategory();
      v95 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
        sub_1ABC5E3F0();

      exit(1);
    }
    v28 = 0x1E0C99000;
    if (!*((_BYTE *)v152 + 24))
      -[IMDSpotlightIndexerTimingProfiler stopMainTimerAndLogAfterSuccess](v97, "stopMainTimerAndLogAfterSuccess");
    if (*((_BYTE *)v156 + 24))
    {
      if (!IMOSLoggingEnabled())
        goto LABEL_40;
      OSLogHandleForIMFoundationCategory();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v161 = 138412290;
        *(_QWORD *)v162 = v118;
        _os_log_impl(&dword_1ABB60000, v29, OS_LOG_TYPE_INFO, "Indexing NOT removing %@ from scrutiny, exception was thrown", v161, 0xCu);
      }
    }
    else
    {
      -[IMDCoreSpotlightManager clearMessageGUIDFromScrutiny:](self, "clearMessageGUIDFromScrutiny:", v118);
      if (!IMOSLoggingEnabled())
        goto LABEL_40;
      OSLogHandleForIMFoundationCategory();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v161 = 138412290;
        *(_QWORD *)v162 = v118;
        _os_log_impl(&dword_1ABB60000, v29, OS_LOG_TYPE_INFO, "Indexing removing %@ from scrutiny", v161, 0xCu);
      }
    }

    v28 = 0x1E0C99000;
LABEL_40:
    objc_msgSend(v25, "objectForKey:", CFSTR("threadOriginatorFormattedGUID"));
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    if (!*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
    {
      objc_msgSend(v25, "objectForKey:", CFSTR("attributedBody"));
      v110 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectForKey:", CFSTR("time"));
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D398F8]), "initWithMessageBody:messageGUID:", v110, v118);
      if (-[IMDCoreSpotlightManager _shouldSkipMessagePartPrefixingForItemDictionary:](self, "_shouldSkipMessagePartPrefixingForItemDictionary:", v25)|| (objc_msgSend(v33, "messageParts"), v34 = (void *)objc_claimAutoreleasedReturnValue(), v107 = v33, v35 = (unint64_t)objc_msgSend(v34, "count") > 1, v34, !v35))
      {
        objc_msgSend(v33, "messageBody");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "string");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v102, "associateMessageEntityWithIdentifier:displayTitle:displaySubtitle:date:", v118, v53, v105, v116);

        v54 = v101;
        if (!v101)
          v54 = v118;
        v55 = v54;
        objc_msgSend((id)objc_opt_class(), "threadIdentifierCustomKey");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v102, "setValue:forCustomKey:", v55, v56);

        v104 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6B48]), "initWithUniqueIdentifier:domainIdentifier:attributeSet:", v118, v106, v102);
        objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v104, "setExpirationDate:", v57);

        if (v104
          && (-[IMDCoreSpotlightManager _updateFilteringForSearchableItem:chatDictionary:](self, "_updateFilteringForSearchableItem:chatDictionary:", v104, v114), objc_msgSend(v109, "addObject:", v104), !a5)&& (v103 = -[IMDCoreSpotlightManager newChatSearchableItemForChatDictionary:optionalLastMessageDate:](self, "newChatSearchableItemForChatDictionary:optionalLastMessageDate:", v114, v116)) != 0)
        {
          objc_msgSend(v109, "addObject:");
        }
        else
        {
          v103 = 0;
        }

        goto LABEL_71;
      }
      v135 = 0u;
      v136 = 0u;
      v133 = 0u;
      v134 = 0u;
      objc_msgSend(v33, "messageParts");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v133, v164, 16);
      if (v37)
      {
        v38 = *(_QWORD *)v134;
        v39 = *MEMORY[0x1E0D362F8];
        v120 = *MEMORY[0x1E0D36318];
        obj = v36;
        do
        {
          for (i = 0; i != v37; ++i)
          {
            if (*(_QWORD *)v134 != v38)
              objc_enumerationMutation(obj);
            v41 = *(void **)(*((_QWORD *)&v133 + 1) + 8 * i);
            objc_msgSend(v41, "messagePartBody");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "string");
            v43 = (void *)objc_claimAutoreleasedReturnValue();

            if ((objc_msgSend(v43, "isEqualToString:", v39) & 1) == 0
              && (objc_msgSend(v43, "isEqualToString:", v120) & 1) == 0)
            {
              v44 = (void *)objc_msgSend(v102, "copy");
              objc_msgSend(v41, "messagePartGUIDForMessageGUID:", v118);
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v45, "encodedMessagePartGUID");
              v46 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v44, "associateMessageEntityWithIdentifier:displayTitle:displaySubtitle:date:", v46, v43, v105, v116);
              objc_msgSend(v44, "setTextContent:", v43);
              v47 = v101;
              if (!v101)
                v47 = v46;
              v48 = v47;
              objc_msgSend((id)objc_opt_class(), "threadIdentifierCustomKey");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "setValue:forCustomKey:", v48, v49);

              v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6B48]), "initWithUniqueIdentifier:domainIdentifier:attributeSet:", v46, v106, v44);
              objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v50, "setExpirationDate:", v51);

              if (v50)
              {
                -[IMDCoreSpotlightManager _updateFilteringForSearchableItem:chatDictionary:](self, "_updateFilteringForSearchableItem:chatDictionary:", v50, v114);
                objc_msgSend(v109, "addObject:", v50);
              }

            }
          }
          v36 = obj;
          v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v133, v164, 16);
        }
        while (v37);
      }

      v28 = 0x1E0C99000;
    }
    if (!objc_msgSend(v98, "count"))
    {
      v103 = 0;
      v104 = 0;
      goto LABEL_72;
    }
    v30 = v101;
    if (!v101)
      v30 = v118;
    v110 = v30;
    objc_msgSend((id)objc_opt_class(), "threadIdentifierCustomKey");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "setValue:forCustomKey:", v110, v31);

    objc_msgSend(v102, "setDisableSearchInSpotlight:", MEMORY[0x1E0C9AAB0]);
    v104 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6B48]), "initWithUniqueIdentifier:domainIdentifier:attributeSet:", v118, v106, v102);
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "setExpirationDate:", v32);

    -[IMDCoreSpotlightManager _updateFilteringForSearchableItem:chatDictionary:](self, "_updateFilteringForSearchableItem:chatDictionary:", v104, v114);
    objc_msgSend(v109, "addObject:", v104);
    v103 = 0;
LABEL_71:

    v28 = 0x1E0C99000uLL;
LABEL_72:
    if (objc_msgSend(v98, "count"))
      objc_msgSend(v109, "addObjectsFromArray:", v98);
    v108 = objc_alloc_init(*(Class *)(v28 + 3560));
    if (!objc_msgSend(v109, "count"))
    {
LABEL_114:

      _Block_object_dispose(&v151, 8);
      _Block_object_dispose(&v155, 8);
      _Block_object_dispose(buf, 8);

      v17 = 1;
      goto LABEL_115;
    }
    v115 = objc_alloc_init(*(Class *)(v28 + 3560));
    v131 = 0u;
    v132 = 0u;
    v129 = 0u;
    v130 = 0u;
    obja = v109;
    v119 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v129, v163, 16);
    if (!v119)
      goto LABEL_98;
    v117 = *(_QWORD *)v130;
LABEL_77:
    v58 = 0;
    while (1)
    {
      if (*(_QWORD *)v130 != v117)
        objc_enumerationMutation(obja);
      v59 = *(void **)(*((_QWORD *)&v129 + 1) + 8 * v58);
      objc_msgSend(v59, "attributeSet");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "messageType");
      v61 = (void *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v61, "isEqualToString:", CFSTR("lnk")))
        goto LABEL_96;
      objc_msgSend(v59, "attributeSet");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "contentCreationDate");
      v121 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "dateByAddingUnit:value:toDate:options:", 16, -30, v64, 0);
      v65 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "startOfDayForDate:", v65);
      v67 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v121, "compare:", v67) == 1)
      {
        objc_msgSend(v115, "addObject:", v59);
      }
      else if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v68 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v59, "attributeSet");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "uniqueIdentifier");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v161 = 67109378;
          *(_DWORD *)v162 = 30;
          *(_WORD *)&v162[4] = 2112;
          *(_QWORD *)&v162[6] = v70;
          _os_log_impl(&dword_1ABB60000, v68, OS_LOG_TYPE_INFO, "Skipping adding resolvedURL since link is older than %d days: %@", v161, 0x12u);

        }
      }
      objc_msgSend(v59, "attributeSet");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "isShared");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = objc_msgSend(v72, "BOOLValue");

      if (v73)
        break;
LABEL_95:

LABEL_96:
      if (v119 == ++v58)
      {
        v119 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v129, v163, 16);
        if (!v119)
        {
LABEL_98:

          if (objc_msgSend(v108, "count"))
          {
            v126 = 0u;
            v127 = 0u;
            v124 = 0u;
            v125 = 0u;
            v86 = v108;
            v87 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v124, v159, 16);
            if (v87)
            {
              v88 = *(_QWORD *)v125;
              do
              {
                for (j = 0; j != v87; ++j)
                {
                  if (*(_QWORD *)v125 != v88)
                    objc_enumerationMutation(v86);
                  objc_msgSend(obja, "objectAtIndex:", objc_msgSend(obja, "indexOfObject:", *(_QWORD *)(*((_QWORD *)&v124 + 1) + 8 * j)));
                  v90 = (void *)objc_claimAutoreleasedReturnValue();
                  if (IMOSLoggingEnabled())
                  {
                    OSLogHandleForIMFoundationCategory();
                    v91 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v91, OS_LOG_TYPE_INFO))
                    {
                      objc_msgSend(v90, "attributeSet");
                      v92 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v92, "uniqueIdentifier");
                      v93 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)v161 = 138412290;
                      *(_QWORD *)v162 = v93;
                      _os_log_impl(&dword_1ABB60000, v91, OS_LOG_TYPE_INFO, "Setting CS Item with uniqueidentifier  %@ to be updatable", v161, 0xCu);

                    }
                  }
                  objc_msgSend(v90, "setIsUpdate:", 1);

                }
                v87 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v124, v159, 16);
              }
              while (v87);
            }

          }
          if (objc_msgSend(v115, "count"))
          {
            -[IMDCoreSpotlightManager _resolvedURLForItems:](self, "_resolvedURLForItems:", v115);
            -[IMDCoreSpotlightManager _FPProviderIDForItems:](self, "_FPProviderIDForItems:", v115);
            -[IMDCoreSpotlightManager reIndexWithLocalProofOfInclusionForItemsAsync:](self, "reIndexWithLocalProofOfInclusionForItemsAsync:", v115);
          }

          goto LABEL_114;
        }
        goto LABEL_77;
      }
    }
    objc_msgSend(v59, "attributeSet");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    +[IMDSharedWithYouMetadataManager collaborationMetadataKey](IMDSharedWithYouMetadataManager, "collaborationMetadataKey");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "valueForCustomKey:", v75);
    v76 = (void *)objc_claimAutoreleasedReturnValue();

    v77 = (void *)MEMORY[0x1E0CB3710];
    v78 = (void *)MEMORY[0x1E0C99E60];
    v160 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v160, 1);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "setWithArray:", v79);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v128 = 0;
    objc_msgSend(v77, "_strictlyUnarchivedObjectOfClasses:fromData:error:", v80, v76, &v128);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = v128;

    if (v81)
    {
      objc_msgSend(v81, "collaborationIdentifier");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      if (v83)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {

LABEL_93:
          objc_msgSend(v108, "addObject:", v59);
          goto LABEL_94;
        }
        objc_msgSend(v81, "handleToIdentityMap");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        v85 = v84 == 0;

        if (!v85)
          goto LABEL_93;
      }
    }
LABEL_94:

    goto LABEL_95;
  }
  v8 = 0;
LABEL_120:

  return v8;
}

- (void)_updateFilteringForSearchableItem:(id)a3 chatDictionary:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a3;
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0D397E8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getValueFromDomain:forKey:", CFSTR("com.apple.MobileSMS"), CFSTR("spamFiltrationExtensionID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.smsFilter.extension")))
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("properties"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", CFSTR("SMSSubCategory"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "integerValue");

    if (v10 == 4)
    {
      objc_msgSend(v12, "attributeSet");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setPotentialEventMessage:", MEMORY[0x1E0C9AAB0]);

    }
  }

}

- (id)_donationManager
{
  return +[IMDDonationManager sharedInstance](IMDDonationManager, "sharedInstance");
}

- (void)_postProcessIndexingForItem:(id)a3 chatDictionary:(id)a4 isReindexing:(BOOL)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("guid"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("groupPhotoGUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("groupPhotoPath"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "length") && objc_msgSend(v8, "length"))
  {
    -[IMDCoreSpotlightManager _donationManager](self, "_donationManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "copyGroupPhotoToExternalPathIfNecessary:chatGUID:attachmentFilepath:", v7, v10, v8);

  }
}

+ (id)resolvedURLCustomKey
{
  if (qword_1EEC40528 != -1)
    dispatch_once(&qword_1EEC40528, &unk_1E5AB8A10);
  return (id)qword_1EEC40520;
}

- (void)_updateItem:(id)a3 withResolvedURL:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((sub_1ABBD7240() & 1) == 0)
  {
    if (objc_msgSend(v7, "length"))
    {
      v8 = objc_alloc(MEMORY[0x1E0CA6B50]);
      v9 = objc_msgSend(v8, "initWithItemContentType:", *MEMORY[0x1E0CA5BF0]);
      objc_msgSend((id)objc_opt_class(), "resolvedURLCustomKey");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setValue:forCustomKey:](v9, "setValue:forCustomKey:", v7, v10);

      objc_msgSend(v6, "attributeSet");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "bundleID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setBundleID:](v9, "setBundleID:", v12);

      objc_msgSend(v6, "attributeSet");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setIdentifier:](v9, "setIdentifier:", v14);

      v15 = objc_alloc(MEMORY[0x1E0CA6B48]);
      objc_msgSend(v6, "uniqueIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "domainIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v15, "initWithUniqueIdentifier:domainIdentifier:attributeSet:", v16, v17, v9);

      objc_msgSend(v18, "setIsUpdate:", 1);
      -[IMDCoreSpotlightManager searchableIndex](self, "searchableIndex");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v18;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = sub_1ABBDE4E8;
      v21[3] = &unk_1E5AB09D8;
      v22 = v6;
      objc_msgSend(v19, "indexSearchableItems:completionHandler:", v20, v21);

    }
    else
    {
      IMLogHandleForCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_1ABC5E450();
    }

  }
}

- (void)_updateItem:(id)a3 withFPProviderID:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
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
  _QWORD v24[4];
  id v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((sub_1ABBD7240() & 1) == 0)
  {
    if (objc_msgSend(v7, "length"))
    {
      v8 = objc_alloc(MEMORY[0x1E0CA6B50]);
      v9 = objc_msgSend(v8, "initWithItemContentType:", *MEMORY[0x1E0CA5BF0]);
      -[NSObject setFileProviderID:](v9, "setFileProviderID:", v7);
      objc_msgSend(v6, "attributeSet");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "bundleID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setBundleID:](v9, "setBundleID:", v11);

      objc_msgSend(v6, "attributeSet");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setIdentifier:](v9, "setIdentifier:", v13);

      objc_msgSend(v6, "attributeSet");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "contentType");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setContentType:](v9, "setContentType:", v15);

      objc_msgSend(v6, "attributeSet");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "contentTypeTree");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setContentTypeTree:](v9, "setContentTypeTree:", v17);

      v18 = objc_alloc(MEMORY[0x1E0CA6B48]);
      objc_msgSend(v6, "uniqueIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "domainIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)objc_msgSend(v18, "initWithUniqueIdentifier:domainIdentifier:attributeSet:", v19, v20, v9);

      objc_msgSend(v21, "setIsUpdate:", 1);
      -[IMDCoreSpotlightManager searchableIndex](self, "searchableIndex");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = v21;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = sub_1ABBDE898;
      v24[3] = &unk_1E5AB09D8;
      v25 = v6;
      objc_msgSend(v22, "indexSearchableItems:completionHandler:", v23, v24);

    }
    else
    {
      IMLogHandleForCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_1ABC5E480();
    }

  }
}

- (void)_updateItem:(id)a3 withIdentityMap:(id)a4 localIdentity:(id)a5 localIdentityProof:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
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
  id v31;
  void *v32;
  void *v33;
  NSObject *v34;
  IMDCoreSpotlightManager *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  id v42;
  _QWORD v43[4];
  id v44;
  id v45;
  id v46;
  id v47;
  NSObject *v48;
  uint8_t buf[4];
  id v50;
  __int16 v51;
  id v52;
  __int16 v53;
  id v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if ((sub_1ABBD7240() & 1) == 0)
  {
    if (v11 && v12 && v13)
    {
      v14 = objc_alloc(MEMORY[0x1E0CA6B50]);
      v15 = objc_msgSend(v14, "initWithItemContentType:", *MEMORY[0x1E0CA5BF0]);
      v47 = 0;
      objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v12, 1, &v47);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v47;
      v46 = 0;
      objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v13, 1, &v46);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v46;
      v45 = 0;
      objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v11, 1, &v45);
      v40 = objc_claimAutoreleasedReturnValue();
      v19 = v45;
      v41 = v19;
      if (v17 || v42 || v19)
      {
        IMLogHandleForCategory();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          v50 = v17;
          v51 = 2112;
          v52 = v42;
          v53 = 2112;
          v54 = v41;
          _os_log_error_impl(&dword_1ABB60000, v34, OS_LOG_TYPE_ERROR, "Archive error for localIdentity: %@, localIdentityProof: %@ or identityMap: %@", buf, 0x20u);
        }
        v36 = (void *)v40;
      }
      else
      {
        objc_msgSend(v10, "attributeSet");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "bundleID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setBundleID:](v15, "setBundleID:", v21);

        objc_msgSend(v10, "attributeSet");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "identifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setIdentifier:](v15, "setIdentifier:", v23);

        objc_msgSend((id)objc_opt_class(), "localIdentityKey");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setValue:forCustomKey:](v15, "setValue:forCustomKey:", v16, v24);

        objc_msgSend((id)objc_opt_class(), "localIdentityProofKey");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setValue:forCustomKey:](v15, "setValue:forCustomKey:", v18, v25);

        objc_msgSend((id)objc_opt_class(), "handleToIdentityMapKey");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setValue:forCustomKey:](v15, "setValue:forCustomKey:", v40, v26);

        objc_msgSend(v10, "attributeSet");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "contentType");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setContentType:](v15, "setContentType:", v28);

        objc_msgSend(v10, "attributeSet");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "contentTypeTree");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setContentTypeTree:](v15, "setContentTypeTree:", v30);

        v31 = objc_alloc(MEMORY[0x1E0CA6B48]);
        objc_msgSend(v10, "uniqueIdentifier");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "domainIdentifier");
        v39 = v18;
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v31, "initWithUniqueIdentifier:domainIdentifier:attributeSet:", v32, v33, v15);

        -[NSObject setIsUpdate:](v34, "setIsUpdate:", 1);
        v35 = self;
        v36 = (void *)v40;
        -[IMDCoreSpotlightManager searchableIndex](v35, "searchableIndex");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = v34;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v48, 1);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v43[0] = MEMORY[0x1E0C809B0];
        v43[1] = 3221225472;
        v43[2] = sub_1ABBDEE68;
        v43[3] = &unk_1E5AB09D8;
        v44 = v10;
        objc_msgSend(v37, "indexSearchableItems:completionHandler:", v38, v43);

        v18 = v39;
        v17 = 0;

      }
    }
    else
    {
      IMLogHandleForCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v50 = v12;
        v51 = 2112;
        v52 = v13;
        v53 = 2112;
        v54 = v11;
        _os_log_error_impl(&dword_1ABB60000, v15, OS_LOG_TYPE_ERROR, "Invalid localIdentity: %@, localIdentityProof: %@ or identityMap: %@", buf, 0x20u);
      }
    }

  }
}

- (void)_resolvedURLForItems:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  NSObject *v15;
  const __CFString *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  __int128 v22;
  _QWORD v24[6];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  const __CFString *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v30 = objc_msgSend(v3, "count");
      _os_log_impl(&dword_1ABB60000, v4, OS_LOG_TYPE_INFO, "Checking if we need to add \"resolved\" URLs for %lu items", buf, 0xCu);
    }

  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v6)
  {
    v8 = *(_QWORD *)v26;
    *(_QWORD *)&v7 = 138412546;
    v22 = v7;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v26 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v9);
        objc_msgSend(v10, "attributeSet", v22);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "URL");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (qword_1EEC405A8 != -1)
          dispatch_once(&qword_1EEC405A8, &unk_1E5AB8D10);
        v13 = objc_msgSend(v12, "nr_isNewsURL");
        v14 = objc_msgSend(v12, "nr_isWebURL");
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            if (v13)
              v16 = CFSTR("YES");
            else
              v16 = CFSTR("NO");
            *(_DWORD *)buf = v22;
            v30 = (uint64_t)v16;
            if (v14)
              v17 = CFSTR("YES");
            else
              v17 = CFSTR("NO");
            v31 = 2112;
            v32 = v17;
            _os_log_impl(&dword_1ABB60000, v15, OS_LOG_TYPE_INFO, "isNewsURL: %@ isWebURL:%@", buf, 0x16u);
          }

        }
        if ((v13 | v14) == 1)
        {
          objc_msgSend((id)qword_1EEC40530, "sharedManager");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v18;
          if (v13)
            objc_msgSend(v18, "createResolutionOperationForNewsURL:", v12);
          else
            objc_msgSend(v18, "createResolutionOperationForWebURL:", v12);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          v24[0] = MEMORY[0x1E0C809B0];
          v24[1] = 3221225472;
          v24[2] = sub_1ABBDF320;
          v24[3] = &unk_1E5AB8A60;
          v24[4] = v10;
          v24[5] = self;
          objc_msgSend(v21, "setResolutionCompletion:", v24);
          objc_msgSend(v21, "start");

        }
        else if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1ABB60000, v20, OS_LOG_TYPE_INFO, "URL was not classified as either WebURL or a News URL", buf, 2u);
          }

        }
        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v6);
  }

}

- (void)_FPProviderIDForItems:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  void (*v15)(id, _QWORD, void *);
  id v16;
  void *v17;
  NSObject *v18;
  _QWORD aBlock[4];
  id v21;
  id v22;
  IMDCoreSpotlightManager *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29[128];
  uint8_t buf[4];
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v31 = objc_msgSend(v3, "count");
      _os_log_impl(&dword_1ABB60000, v4, OS_LOG_TYPE_INFO, "Checking if we need to add FileProviderID for %lu items", buf, 0xCu);
    }

  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v26;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v26 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v8);
        objc_msgSend(v9, "attributeSet");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "URL");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "isShared");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "BOOLValue");

        if (v11)
          v14 = v13;
        else
          v14 = 0;
        if (v14 == 1)
        {
          if (qword_1EEC40540 != -1)
            dispatch_once(&qword_1EEC40540, &unk_1E5AB8A80);
          v15 = (void (*)(id, _QWORD, void *))off_1EEC40538;
          aBlock[0] = MEMORY[0x1E0C809B0];
          aBlock[1] = 3221225472;
          aBlock[2] = sub_1ABBDF84C;
          aBlock[3] = &unk_1E5AB8AF0;
          v16 = v11;
          v21 = v16;
          v22 = v10;
          v23 = self;
          v24 = v9;
          v17 = _Block_copy(aBlock);
          v15(v16, 0, v17);

        }
        else if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1ABB60000, v18, OS_LOG_TYPE_INFO, "URL was not classified as a CollaborationURL", buf, 2u);
          }

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v6);
  }

}

- (void)reIndexWithLocalProofOfInclusionForItemsAsync:(id)a3
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  _BOOL4 v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  NSObject *v35;
  NSObject *v36;
  int v37;
  NSObject *v38;
  NSObject *v39;
  uint64_t v40;
  id obj;
  uint64_t v43;
  void *v44;
  id v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  char v51;
  _BYTE v52[15];
  _QWORD v53[6];
  id v54;
  __int128 *p_buf;
  char v56;
  _BYTE v57[15];
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  char v62;
  _BYTE v63[7];
  id v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  uint8_t v69[128];
  __int128 buf;
  uint64_t v71;
  uint64_t (*v72)(uint64_t, uint64_t);
  void (*v73)(uint64_t);
  id v74;
  uint8_t v75[4];
  uint64_t v76;
  uint64_t v77;
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = objc_msgSend(v3, "count");
      _os_log_impl(&dword_1ABB60000, v4, OS_LOG_TYPE_INFO, "Generating and donating local proof of inclusion for %lu items", (uint8_t *)&buf, 0xCu);
    }

  }
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  obj = v3;
  v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v78, 16);
  if (v46)
  {
    v43 = *(_QWORD *)v66;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v66 != v43)
        {
          v6 = v5;
          objc_enumerationMutation(obj);
          v5 = v6;
        }
        v48 = v5;
        v7 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * v5);
        objc_msgSend(v7, "attributeSet");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "URL");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "isShared");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "BOOLValue");

        if (v49)
          v10 = v9;
        else
          v10 = 0;
        if (v10 != 1)
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v35 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
            {
              LOWORD(buf) = 0;
              _os_log_impl(&dword_1ABB60000, v35, OS_LOG_TYPE_INFO, "URL was not classified as a CollaborationURL", (uint8_t *)&buf, 2u);
            }

          }
          goto LABEL_48;
        }
        objc_msgSend(v7, "attributeSet");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "accountHandles");
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "attributeSet");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        +[IMDSharedWithYouMetadataManager collaborationMetadataKey](IMDSharedWithYouMetadataManager, "collaborationMetadataKey");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "valueForCustomKey:", v13);
        v47 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = (void *)MEMORY[0x1E0CB3710];
        v15 = (void *)MEMORY[0x1E0C99E60];
        v77 = objc_opt_class();
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v77, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setWithArray:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = 0;
        objc_msgSend(v14, "_strictlyUnarchivedObjectOfClasses:fromData:error:", v17, v47, &v64);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = v64;

        if (!v18)
        {
          IMLogHandleForCategory();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            sub_1ABC5E548(v75, v45, &v76, v36);
LABEL_45:

LABEL_46:
          v37 = 1;
          goto LABEL_47;
        }
        objc_msgSend(v18, "collaborationIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v19 == 0;

        if (v20)
        {
          IMLogHandleForCategory();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            sub_1ABC5E5BC(&v62, v63);
          goto LABEL_45;
        }
        if ((objc_opt_respondsToSelector() & 1) == 0
          || (objc_msgSend(v18, "handleToIdentityMap"),
              v21 = (void *)objc_claimAutoreleasedReturnValue(),
              v22 = v21 == 0,
              v21,
              v22))
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v36 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
            {
              LOWORD(buf) = 0;
              _os_log_impl(&dword_1ABB60000, v36, OS_LOG_TYPE_INFO, "handleToIdentityMap is required for identity proof lookup. Not indexing proof of inclusion this item. This may not be a generic 3rd party collaboration.", (uint8_t *)&buf, 2u);
            }
            goto LABEL_45;
          }
          goto LABEL_46;
        }
        *(_QWORD *)&buf = 0;
        *((_QWORD *)&buf + 1) = &buf;
        v71 = 0x3032000000;
        v72 = sub_1ABBD784C;
        v73 = sub_1ABBD785C;
        v74 = 0;
        v58 = 0u;
        v59 = 0u;
        v60 = 0u;
        v61 = 0u;
        v23 = v44;
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v58, v69, 16);
        if (v24)
        {
          v25 = *(_QWORD *)v59;
          do
          {
            for (i = 0; i != v24; ++i)
            {
              if (*(_QWORD *)v59 != v25)
                objc_enumerationMutation(v23);
              v27 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * i);
              if ((objc_opt_respondsToSelector() & 1) != 0)
              {
                objc_msgSend(v18, "handleToIdentityMap");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "objectForKey:", v27);
                v29 = (void *)objc_claimAutoreleasedReturnValue();

                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                  objc_storeStrong((id *)(*((_QWORD *)&buf + 1) + 40), v29);

              }
            }
            v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v58, v69, 16);
          }
          while (v24);
        }

        v30 = objc_alloc(+[IMDCoreSpotlightManager __SLCollaborationHandshakeController](IMDCoreSpotlightManager, "__SLCollaborationHandshakeController"));
        -[IMDCoreSpotlightManager _personIdentityQueue](self, "_personIdentityQueue");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = (void *)objc_msgSend(v30, "initWithTargetSerialQueue:synchronous:", v31, 1);

        if (v32)
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v33 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
            objc_msgSend(v18, "collaborationIdentifier");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v53[0] = MEMORY[0x1E0C809B0];
            v53[1] = 3221225472;
            v53[2] = sub_1ABBE065C;
            v53[3] = &unk_1E5AB8B18;
            p_buf = &buf;
            v53[4] = self;
            v53[5] = v7;
            v54 = v18;
            objc_msgSend(v32, "generateProofForIdentity:collaborationIdentifier:timeout:completion:", v33, v34, v53, 10.0);

          }
          else
          {
            IMLogHandleForCategory();
            v39 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
              sub_1ABC5E614(&v51, v52);

          }
          v37 = 0;
        }
        else
        {
          IMLogHandleForCategory();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            sub_1ABC5E5E8(&v56, v57);

          v37 = 1;
        }

        _Block_object_dispose(&buf, 8);
LABEL_47:

        if (v37)
        {

          goto LABEL_61;
        }
LABEL_48:

        v5 = v48 + 1;
      }
      while (v48 + 1 != v46);
      v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v78, 16);
      v46 = v40;
    }
    while (v40);
  }
LABEL_61:

}

- (id)newChatSearchableItemForChatDictionary:(id)a3 optionalLastMessageDate:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  id v12;

  v6 = a3;
  v12 = 0;
  v7 = -[IMDCoreSpotlightManager newChatSearchableItemForChatDictionary:optionalLastMessageDate:error:](self, "newChatSearchableItemForChatDictionary:optionalLastMessageDate:error:", v6, a4, &v12);
  v8 = v12;
  if (v8)
  {
    IMLogHandleForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1ABC5E734();

    IMLogHandleForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1ABC5E6D4();

  }
  return v7;
}

- (id)newChatSearchableItemForChatDictionary:(id)a3 optionalLastMessageDate:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  id v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  unint64_t v43;
  void *v44;
  int v45;
  void *v46;
  int v47;
  id v48;
  void *v49;
  void *v50;
  unint64_t v51;
  void *v52;
  void *v53;
  unint64_t v54;
  int v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v62;
  void *v63;
  void *v64;
  id v65;
  id v66;
  id v67;
  void *v68;
  id obj;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  uint64_t v74;
  void *v75;
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v7)
  {
    IMDPersistenceCheckNotDatabaseThread();
    _IMDCoreSpotlightChatUIDForChatDictionary(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", CFSTR("guid"));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (!v9 || !v10)
    {
      if (!a5)
      {
        v33 = 0;
LABEL_46:

        goto LABEL_47;
      }
      v67 = v8;
      v34 = (void *)MEMORY[0x1E0CB35C8];
      v74 = *MEMORY[0x1E0CB2D50];
      v35 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("chatIdentifier"));
      v15 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("groupID"));
      v36 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("style"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v35;
      v39 = (void *)v36;
      objc_msgSend(v38, "stringWithFormat:", CFSTR("Chat dictionary malformed. unique identifier %@ guid %@ chat identifier %@ group ID %@ style %@"), v9, v11, v15, v36, v37);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = v40;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v75, &v74, 1);
      v20 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Messages.IMDCoreSpotlight"), 1, v20);
      v33 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_45:

      v8 = v67;
      goto LABEL_46;
    }
    objc_msgSend(v7, "objectForKey:", CFSTR("lastMessageDate"));
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v12)
      v14 = (void *)v12;
    else
      v14 = v8;
    v15 = v14;

    v16 = objc_alloc(MEMORY[0x1E0CA6B50]);
    v17 = (void *)objc_msgSend(v16, "initWithItemContentType:", *MEMORY[0x1E0CA5BF0]);
    v63 = v11;
    objc_msgSend(v17, "setAccountIdentifier:", v11);
    v68 = v17;
    objc_msgSend(v17, "setLastUsedDate:", v15);
    objc_msgSend(v7, "objectForKey:", CFSTR("participants"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v70 = 0u;
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    obj = v18;
    v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v76, 16);
    v67 = v8;
    if (v21)
    {
      v22 = v21;
      v62 = v15;
      v64 = v9;
      v65 = v7;
      v23 = 0;
      v24 = *(_QWORD *)v71;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v71 != v24)
            objc_enumerationMutation(obj);
          v26 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * i);
          _IMDCoreSpotlightCNContactForAddress(v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = v27;
          if ((v23 & 1) != 0)
            v29 = v23;
          else
            v29 = 1;
          if (v27)
            v23 = v29;
          _IMDCoreSpotlightFullNameForContact(v27, 0);
          v30 = (id)objc_claimAutoreleasedReturnValue();
          if (!v30)
            v30 = v26;
          _IMDCoreSpotlightPerson(v30, v26, v28, (void *)*MEMORY[0x1E0D38F68]);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          if (v31)
          {
            objc_msgSend(v19, "addObject:", v31);
            objc_msgSend(v20, "addObject:", v26);
          }

        }
        v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v76, 16);
      }
      while (v22);
      v32 = v23 & 1;
      v9 = v64;
      v7 = v65;
      v15 = v62;
    }
    else
    {
      v32 = 0;
    }

    v66 = v19;
    objc_msgSend(v68, "setPrimaryRecipients:", v19);
    objc_msgSend(v68, "setRecipientAddresses:", v20);
    objc_msgSend(v7, "objectForKey:", CFSTR("groupName"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (v41)
    {
      objc_msgSend(v68, "setSubject:", v41);
      objc_msgSend(v68, "setDisplayName:", v41);
    }
    objc_msgSend(v7, "valueForKey:", CFSTR("style"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    v43 = 0x1E0CB3000;
    if (v42)
    {
      objc_msgSend(v7, "valueForKey:", CFSTR("style"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v44, "charValue");

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%c"), v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "chatStyleCustomKey");
      v47 = v32;
      v48 = v15;
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "setValue:forCustomKey:", v46, v49);

      v15 = v48;
      v32 = v47;
      v43 = 0x1E0CB3000uLL;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v45 == 43);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "setIsGroupThread:", v50);

    }
    v51 = v43;
    objc_msgSend(v7, "objectForKey:", CFSTR("syndicationType"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    v37 = obj;
    if (v52
      && ((objc_msgSend(v7, "objectForKey:", CFSTR("syndicationType")),
           v53 = (void *)objc_claimAutoreleasedReturnValue(),
           v54 = objc_msgSend(v53, "integerValue"),
           v53,
           v54 < 2)
        ? (v55 = v32)
        : (v55 = 0),
          v55 == 1))
    {
      objc_msgSend(*(id *)(v51 + 2024), "numberWithBool:", 1);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "chatAutoDonatingCutomKey");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "setValue:forCustomKey:", v56, v57);

      objc_msgSend(v7, "objectForKey:", CFSTR("syndicationDate"));
      v58 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = v63;
      if (!v58)
      {
LABEL_44:
        v39 = v68;
        objc_msgSend(v68, "associateConversationEntityWithIdentifier:displayTitle:", v9, v41);
        v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6B48]), "initWithUniqueIdentifier:domainIdentifier:attributeSet:", v9, CFSTR("chatDomain"), v68);

        v40 = v66;
        goto LABEL_45;
      }
      objc_msgSend(v7, "objectForKey:", CFSTR("syndicationDate"));
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v59)
      {
LABEL_43:

        goto LABEL_44;
      }
      objc_msgSend((id)objc_opt_class(), "chatAutoDonatingServerDateCustomKey");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "setValue:forCustomKey:", v59, v60);
    }
    else
    {
      objc_msgSend(*(id *)(v51 + 2024), "numberWithBool:", 0);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "chatAutoDonatingCutomKey");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "setValue:forCustomKey:", v59, v60);
      v11 = v63;
    }

    goto LABEL_43;
  }
  v33 = 0;
LABEL_47:

  return v33;
}

+ (id)chatAutoDonatingCutomKey
{
  if (qword_1ED0D3768 != -1)
    dispatch_once(&qword_1ED0D3768, &unk_1E5AB8B38);
  return (id)qword_1ED0D3760;
}

+ (id)chatAutoDonatingServerDateCustomKey
{
  if (qword_1ED0D3740 != -1)
    dispatch_once(&qword_1ED0D3740, &unk_1E5AAE5D8);
  return (id)qword_1ED0D3818;
}

+ (id)chatStyleCustomKey
{
  if (qword_1ED0D3940 != -1)
    dispatch_once(&qword_1ED0D3940, &unk_1E5AB8B58);
  return (id)qword_1ED0D3938;
}

+ (id)localIdentityProofKey
{
  if (qword_1EEC40570 != -1)
    dispatch_once(&qword_1EEC40570, &unk_1E5AAE858);
  return (id)qword_1EEC40568;
}

+ (id)localIdentityKey
{
  if (qword_1EEC40580 != -1)
    dispatch_once(&qword_1EEC40580, &unk_1E5AAE618);
  return (id)qword_1EEC40578;
}

+ (id)handleToIdentityMapKey
{
  if (qword_1EEC40590 != -1)
    dispatch_once(&qword_1EEC40590, &unk_1E5AB8B78);
  return (id)qword_1EEC40588;
}

+ (id)threadIdentifierCustomKey
{
  if (qword_1EEC40348 != -1)
    dispatch_once(&qword_1EEC40348, &unk_1E5AAE878);
  return (id)qword_1EEC40340;
}

- (void)addChatSearchableItemForChatGUID:(id)a3 reason:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[IMDCoreSpotlightManager _chatDictionaryForChatGUID:](self, "_chatDictionaryForChatGUID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v8 = -[IMDCoreSpotlightManager newChatSearchableItemForChatDictionary:optionalLastMessageDate:error:](self, "newChatSearchableItemForChatDictionary:optionalLastMessageDate:error:", v7, 0, &v14);
  v9 = v14;
  v10 = v9;
  if (v8)
  {
    -[IMDCoreSpotlightManager searchableIndex](self, "searchableIndex");
    v11 = objc_claimAutoreleasedReturnValue();
    v15[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1ABBE1440(v11, 0, v12, a4, 0);

LABEL_8:
    goto LABEL_9;
  }
  if (v9)
  {
    IMLogHandleForCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1ABC5E7F4();

    IMLogHandleForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1ABC5E794();
    goto LABEL_8;
  }
LABEL_9:

}

- (void)deleteChatSearchableItemForChatGUID:(id)a3 reason:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  -[IMDCoreSpotlightManager _chatDictionaryForChatGUID:](self, "_chatDictionaryForChatGUID:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    _IMDCoreSpotlightChatUIDForChatDictionary(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[IMDCoreSpotlightManager searchableIndex](self, "searchableIndex");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1ABBD921C(v9, v10, a4);

    }
  }

}

- (id)_chatDictionaryForChatGUID:(id)a3
{
  id v3;
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v3 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = sub_1ABBD784C;
  v14 = sub_1ABBD785C;
  v15 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1ABBE1940;
  v7[3] = &unk_1E5AB8BA0;
  v4 = v3;
  v8 = v4;
  v9 = &v10;
  IMDPersistencePerformBlock(v7, 1);
  v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v5;
}

- (void)setNeedsMessageReindexingWithReason:(int64_t)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  NSObject *v7;
  void *v8;
  _BOOL4 v9;
  uint64_t v10;
  int64_t v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  _QWORD v18[5];
  id v19;
  _QWORD aBlock[5];
  void (**v21)(_QWORD);
  uint64_t v22;
  int64_t v23;
  int64_t v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  int64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(_QWORD))a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v26 = "-[IMDCoreSpotlightManager setNeedsMessageReindexingWithReason:completion:]";
      _os_log_impl(&dword_1ABB60000, v7, OS_LOG_TYPE_INFO, "%s starting reindex", buf, 0xCu);
    }

  }
  -[IMDCoreSpotlightManager searchableIndex](self, "searchableIndex");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8 == 0;

  if (v9)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1ABB60000, v16, OS_LOG_TYPE_INFO, "IMDCoreSpotlight: Failed to create index!", buf, 2u);
      }

    }
    if (v6)
      goto LABEL_23;
  }
  else
  {
    v10 = -[IMDCoreSpotlightManager maxRowID](self, "maxRowID");
    v11 = -[IMDCoreSpotlightManager totalMessages](self, "totalMessages");
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v26 = "-[IMDCoreSpotlightManager setNeedsMessageReindexingWithReason:completion:]";
        v27 = 2048;
        v28 = v10;
        v29 = 2048;
        v30 = v11;
        _os_log_impl(&dword_1ABB60000, v12, OS_LOG_TYPE_INFO, "%s max cmj rowID %lld total messages %lld", buf, 0x20u);
      }

    }
    if (v10 > 0)
    {
      +[IMSpotlightEventNotifier sharedNotifier](IMSpotlightEventNotifier, "sharedNotifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "reindexInitiatedWithTotalMessages:reason:", v11, a3);

      v14 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = sub_1ABBE1D14;
      aBlock[3] = &unk_1E5AB8BC8;
      aBlock[4] = self;
      v21 = v6;
      v22 = v10;
      v23 = v11;
      v24 = a3;
      v18[0] = v14;
      v18[1] = 3221225472;
      v18[2] = sub_1ABBE1FDC;
      v18[3] = &unk_1E5AB1E98;
      v18[4] = self;
      v19 = _Block_copy(aBlock);
      v15 = v19;
      sub_1ABBD7050(v18);

      goto LABEL_24;
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1ABB60000, v17, OS_LOG_TYPE_INFO, "IMDCoreSpotlight: Failed to get max cmj row ID for indexing!", buf, 2u);
      }

    }
    if (v6)
LABEL_23:
      v6[2](v6);
  }
LABEL_24:

}

- (void)_sanitizeIndexesForCurrentVersionIfNeeded:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  id *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _BOOL4 v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  _QWORD v26[4];
  void (**v27)(_QWORD);
  uint64_t *v28;
  _QWORD aBlock[4];
  id v30;
  NSObject *v31;
  uint64_t *v32;
  id obj;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint8_t buf[4];
  uint64_t v41;
  __int16 v42;
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(_QWORD))a3;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = sub_1ABBD784C;
  v38 = sub_1ABBD785C;
  v39 = 0;
  +[IMDSpotlightClientStateManager sharedManager](IMDSpotlightClientStateManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id *)(v35 + 5);
  obj = (id)v35[5];
  objc_msgSend(v5, "currentClientStateWithError:", &obj);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v6, obj);

  if (v35[5])
  {
    v4[2](v4);
    goto LABEL_26;
  }
  if ((objc_msgSend(v7, "needsIndexDrop") & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1ABB60000, v22, OS_LOG_TYPE_INFO, "Bypassing index version comparisons. **NOT** deleting indexes", buf, 2u);
      }

    }
    goto LABEL_25;
  }
  if (!objc_msgSend(v7, "needsReindex"))
  {
    if (!IMOSLoggingEnabled())
      goto LABEL_24;
    OSLogHandleForIMFoundationCategory();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      v24 = objc_msgSend(v7, "indexRevision");
      *(_DWORD *)buf = 134217984;
      v41 = v24;
      _os_log_impl(&dword_1ABB60000, v23, OS_LOG_TYPE_INFO, "Current idx version is %llu, index does not need deletion", buf, 0xCu);
    }
    goto LABEL_23;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = objc_msgSend(v7, "indexRevision");
      v10 = objc_msgSend(MEMORY[0x1E0D39B00], "_latestIndexRevision");
      *(_DWORD *)buf = 134218240;
      v41 = v9;
      v42 = 2048;
      v43 = v10;
      _os_log_impl(&dword_1ABB60000, v8, OS_LOG_TYPE_INFO, "Current idx version is %llu, expected is %llu, deleting prior indexes", buf, 0x16u);
    }

  }
  -[IMDCoreSpotlightManager searchableIndex](self, "searchableIndex");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11 == 0;

  if (v12)
  {
    if (!IMOSLoggingEnabled())
      goto LABEL_24;
    OSLogHandleForIMFoundationCategory();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1ABB60000, v23, OS_LOG_TYPE_INFO, "IMDCoreSpotlight: Failed to create index!", buf, 2u);
    }
LABEL_23:

LABEL_24:
    if (!v4)
      goto LABEL_26;
LABEL_25:
    ((void (*)(void (**)(_QWORD), _QWORD))v4[2])(v4, 0);
    goto LABEL_26;
  }
  v13 = objc_alloc_init(MEMORY[0x1E0D36AE8]);
  objc_msgSend(v13, "startTimingForKey:", CFSTR("CSDeleteAllIndexes"));
  v14 = dispatch_group_create();
  dispatch_group_enter(v14);
  v15 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1ABBE24E8;
  aBlock[3] = &unk_1E5AB8BF0;
  v16 = v13;
  v30 = v16;
  v32 = &v34;
  v17 = v14;
  v31 = v17;
  v18 = _Block_copy(aBlock);
  -[IMDCoreSpotlightManager searchableIndex](self, "searchableIndex");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_opt_respondsToSelector();

  -[IMDCoreSpotlightManager searchableIndex](self, "searchableIndex");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v20 & 1) != 0)
    objc_msgSend(v21, "deleteAllSearchableItemsWithReason:completionHandler:", IMCSIndexReasonFromIMIndexReason(), v18);
  else
    objc_msgSend(v21, "deleteAllSearchableItemsWithCompletionHandler:", v18);

  v26[0] = v15;
  v26[1] = 3221225472;
  v26[2] = sub_1ABBE2674;
  v26[3] = &unk_1E5AB8C18;
  v27 = v4;
  v28 = &v34;
  v25 = _Block_copy(v26);
  dispatch_group_notify(v17, MEMORY[0x1E0C80D38], v25);

LABEL_26:
  _Block_object_dispose(&v34, 8);

}

- (void)_enumerateSearchableChatItemsForAllChatsWithBlock:(id)a3 timingCollection:(id)a4
{
  void (**v5)(id, id);
  id v6;
  id v7;
  unint64_t v8;
  __int128 v9;
  NSObject *v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  __int128 v21;
  unint64_t v23;
  _QWORD v24[4];
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint8_t buf[4];
  unint64_t v34;
  __int16 v35;
  unint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, id))a3;
  v6 = a4;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = sub_1ABBD784C;
  v31 = sub_1ABBD785C;
  v32 = 0;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = sub_1ABBE2A60;
  v24[3] = &unk_1E5AB8BA0;
  v7 = v6;
  v25 = v7;
  v26 = &v27;
  IMDPersistencePerformBlock(v24, 1);
  v23 = objc_msgSend((id)v28[5], "count");
  if (v28[5])
  {
    v8 = objc_msgSend(MEMORY[0x1E0D397C8], "chatBatchSize");
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218240;
        v34 = v23;
        v35 = 2048;
        v36 = v8;
        _os_log_impl(&dword_1ABB60000, v10, OS_LOG_TYPE_INFO, "About to index %lu chats in batches of %lu", buf, 0x16u);
      }

    }
    if (v23)
    {
      v11 = 0;
      *(_QWORD *)&v9 = 134218240;
      v21 = v9;
      v12 = v23;
      do
      {
        if (v8 >= v12)
          v13 = v12;
        else
          v13 = v8;
        v14 = (void *)MEMORY[0x1AF435474]();
        objc_msgSend(v7, "startTimingForKey:", CFSTR("generateItems"));
        if (v8 >= v12)
          v15 = v12;
        else
          v15 = v8;
        v16 = (void *)v28[5];
        objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v11, v15, v21);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectsAtIndexes:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        v19 = -[IMDCoreSpotlightManager _newSearchableChatItemsForChats:](self, "_newSearchableChatItemsForChats:", v18);
        v5[2](v5, v19);

        objc_msgSend(v7, "stopTimingForKey:", CFSTR("generateItems"));
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v21;
            v34 = v13 + v11;
            v35 = 2048;
            v36 = v12;
            _os_log_impl(&dword_1ABB60000, v20, OS_LOG_TYPE_INFO, "Finished indexing a batch of chats, indexed %lu, %lu to go", buf, 0x16u);
          }

        }
        objc_autoreleasePoolPop(v14);
        v11 += v8;
        v12 -= v8;
      }
      while (v11 < v23);
    }
  }

  _Block_object_dispose(&v27, 8);
}

- (void)indexChatsWithReason:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD v10[6];
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if ((sub_1ABBD7240() & 1) == 0)
  {
    -[IMDCoreSpotlightManager searchableIndex](self, "searchableIndex");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = (void *)MEMORY[0x1AF435474]();
      v7 = objc_alloc_init(MEMORY[0x1E0D36AE8]);
      objc_msgSend(v7, "startTimingForKey:", CFSTR("totalTime"));
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = sub_1ABBE2CB4;
      v10[3] = &unk_1E5AB8C40;
      v10[4] = self;
      v10[5] = a3;
      -[IMDCoreSpotlightManager _enumerateSearchableChatItemsForAllChatsWithBlock:timingCollection:](self, "_enumerateSearchableChatItemsForAllChatsWithBlock:timingCollection:", v10, v7);
      objc_msgSend(v7, "stopTimingForKey:", CFSTR("totalTime"));
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          v11 = 138412290;
          v12 = v7;
          _os_log_impl(&dword_1ABB60000, v8, OS_LOG_TYPE_INFO, "indexChats timing %@", (uint8_t *)&v11, 0xCu);
        }

      }
      objc_autoreleasePoolPop(v6);
    }
    else if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        LOWORD(v11) = 0;
        _os_log_impl(&dword_1ABB60000, v9, OS_LOG_TYPE_INFO, "IMDCoreSpotlight: Failed to create index!", (uint8_t *)&v11, 2u);
      }

    }
  }
}

- (id)_newSearchableChatItemsForChats:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[IMDCoreSpotlightManager _chatCountForChats:](self, "_chatCountForChats:", v4);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v5);
  if (v5 >= 1)
  {
    v8 = 0;
    *(_QWORD *)&v7 = 138412290;
    v19 = v7;
    while (1)
    {
      -[IMDCoreSpotlightManager _chatDictionaryForChatAtIndex:withChats:](self, "_chatDictionaryForChatAtIndex:withChats:", v8, v4, v19);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      _IMDCoreSpotlightChatUIDForChatDictionary(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
        break;
LABEL_15:

      if (v5 == ++v8)
        goto LABEL_16;
    }
    objc_msgSend(v6, "objectForKey:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "attributeSet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "lastUsedDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "objectForKey:", CFSTR("lastMessageDate"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14 && v13 && objc_msgSend(v13, "compare:", v14) == 1)
    {
      if (!IMOSLoggingEnabled())
      {
LABEL_14:

        goto LABEL_15;
      }
      OSLogHandleForIMFoundationCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = v19;
        v21 = v10;
        _os_log_impl(&dword_1ABB60000, v15, OS_LOG_TYPE_INFO, "Not indexing UID %@, already indexed newer record", buf, 0xCu);
      }
    }
    else
    {
      v15 = -[IMDCoreSpotlightManager newChatSearchableItemForChatDictionary:optionalLastMessageDate:](self, "newChatSearchableItemForChatDictionary:optionalLastMessageDate:", v9, 0);
      if (v15)
        objc_msgSend(v6, "setObject:forKey:", v15, v10);
    }

    goto LABEL_14;
  }
LABEL_16:
  objc_msgSend(v6, "allValues");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "copy");

  return v17;
}

- (int64_t)_chatCountForChats:(id)a3
{
  return objc_msgSend(a3, "count");
}

- (id)_chatDictionaryForChatAtIndex:(unint64_t)a3 withChats:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v5 = a4;
  objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_1ABBD784C;
  v17 = sub_1ABBD785C;
  v18 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1ABBE3180;
  v10[3] = &unk_1E5AB8980;
  v12 = &v13;
  v7 = v6;
  v11 = v7;
  IMDPersistencePerformBlock(v10, 1);
  v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (void)_indexSearchableChatItems:(id)a3 withReason:(int64_t)a4 index:(id)a5 blocking:(BOOL)a6
{
  if (a6)
    sub_1ABBD733C(a5, 0, a3, a4, 60000000000);
  else
    sub_1ABBE1440(a5, 0, a3, a4, 0);
}

- (void)indexNextMessageBatchIfNeeded:(unint64_t)a3 reason:(int64_t)a4 completion:(id)a5
{
  void (**v8)(_QWORD);
  NSObject *v9;
  NSObject *v10;
  int v11;
  const __CFString *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t (**v16)(void *, _DWORD *);
  void *v17;
  char v18;
  char v19;
  NSObject *v20;
  NSObject *v21;
  int v22;
  int v23;
  const __CFString *v24;
  const __CFString *v25;
  NSObject *v26;
  int v27;
  _QWORD aBlock[5];
  id v29;
  id v30;
  unint64_t v31;
  int64_t v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  unint64_t v36;
  __int16 v37;
  const __CFString *v38;
  __int16 v39;
  const __CFString *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v8 = (void (**)(_QWORD))a5;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v34 = (const char *)a3;
      _os_log_impl(&dword_1ABB60000, v9, OS_LOG_TYPE_INFO, "Indexing next batch of messages. Batch size of %lu", buf, 0xCu);
    }

  }
  if (sub_1ABBD7240())
  {
    if (v8)
LABEL_41:
      v8[2](v8);
  }
  else if (objc_msgSend(MEMORY[0x1E0D397C8], "skipIndexing"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = objc_msgSend(MEMORY[0x1E0D397C8], "skipIndexing");
        v12 = CFSTR("NO");
        if (v11)
          v12 = CFSTR("YES");
        *(_DWORD *)buf = 138412290;
        v34 = (const char *)v12;
        _os_log_impl(&dword_1ABB60000, v10, OS_LOG_TYPE_INFO, "Skipping indexing next batch since skipIndexing is set to %@", buf, 0xCu);
      }

    }
    if (v8)
      goto LABEL_41;
  }
  else if (-[IMDCoreSpotlightManager _shouldIndexNextBatchForBatchSize:](self, "_shouldIndexNextBatchForBatchSize:", a3))
  {
    -[IMDCoreSpotlightManager searchableIndex](self, "searchableIndex");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = objc_alloc_init(MEMORY[0x1E0D36AE8]);
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = sub_1ABBE368C;
      aBlock[3] = &unk_1E5AB8C68;
      v31 = a3;
      aBlock[4] = self;
      v15 = v14;
      v29 = v15;
      v30 = v13;
      v32 = a4;
      v16 = (uint64_t (**)(void *, _DWORD *))_Block_copy(aBlock);
      v27 = 0;
      if (a3)
      {
        do
        {
          v17 = (void *)MEMORY[0x1AF435474]();
          v18 = v16[2](v16, &v27);
          objc_autoreleasePoolPop(v17);
          if (v27 < a3)
            v19 = v18;
          else
            v19 = 0;
        }
        while ((v19 & 1) != 0);
      }
      if (v8)
        v8[2](v8);
      objc_msgSend(v15, "stopTimingForKey:", CFSTR("totalTime"));
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v34 = (const char *)v15;
          _os_log_impl(&dword_1ABB60000, v20, OS_LOG_TYPE_INFO, "Timing %@", buf, 0xCu);
        }

      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1ABB60000, v26, OS_LOG_TYPE_INFO, "IMDCoreSpotlight: Failed to create index!", buf, 2u);
        }

      }
      if (v8)
        v8[2](v8);
    }

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        v22 = objc_msgSend(MEMORY[0x1E0D397C8], "needsIndexing");
        v23 = IMDSystemMigrationOccurred();
        v24 = CFSTR("NO");
        v34 = "-[IMDCoreSpotlightManager indexNextMessageBatchIfNeeded:reason:completion:]";
        v35 = 2048;
        if (v22)
          v25 = CFSTR("YES");
        else
          v25 = CFSTR("NO");
        *(_DWORD *)buf = 136315906;
        v36 = a3;
        v37 = 2112;
        if (v23)
          v24 = CFSTR("YES");
        v38 = v25;
        v39 = 2112;
        v40 = v24;
        _os_log_impl(&dword_1ABB60000, v21, OS_LOG_TYPE_INFO, "IMDCoreSpotlight %s - Not indexing. Batch size %lu needsIndexing %@ hasMigrated %@", buf, 0x2Au);
      }

    }
    if (v8)
      goto LABEL_41;
  }

}

- (id)_copyNewSearchableIndexesForMessagesWithLastRowID:(unint64_t *)a3 messageRecordCount:(unint64_t *)a4 messagesWithItemsGeneratedCount:(unint64_t *)a5 batchSize:(unint64_t)a6 timingCollection:(id)a7
{
  _QWORD v8[6];

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1ABBE39F4;
  v8[3] = &unk_1E5AB8C90;
  v8[4] = self;
  v8[5] = a5;
  IMDDeriveObjectsForMessagesWithLastRowIDAndBatchSizeUsingBlock(a3, a4, a6, a7, v8);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_indexSearchableItems:(id)a3 clientState:(id)a4 lastIndexedRowID:(unint64_t)a5 messagesInBatch:(unint64_t)a6 messagesWithItemsGeneratedCount:(unint64_t)a7 batchSize:(unint64_t)a8 lastBatch:(BOOL)a9 withIndex:(id)a10 reason:(int64_t)a11 blockUntilCompleted:(BOOL)a12 completion:(id)a13
{
  id v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  id v22;
  id v23;
  void (**v24)(_QWORD);
  unint64_t v25;
  NSObject *v26;
  id v27;
  id v28;
  _QWORD v29[4];
  void (**v30)(_QWORD);
  _QWORD aBlock[5];
  id v32;
  id v33;
  int64_t v34;
  unint64_t v35;
  BOOL v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v27 = a3;
  v18 = a4;
  v28 = a10;
  v19 = a13;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v38 = "-[IMDCoreSpotlightManager _indexSearchableItems:clientState:lastIndexedRowID:messagesInBatch:messagesWithIte"
            "msGeneratedCount:batchSize:lastBatch:withIndex:reason:blockUntilCompleted:completion:]";
      v39 = 2048;
      v40 = objc_msgSend(v27, "count");
      v41 = 2112;
      v42 = v28;
      _os_log_impl(&dword_1ABB60000, v20, OS_LOG_TYPE_INFO, "%s Generated %lu items to index!. Using Index %@", buf, 0x20u);
    }

  }
  v21 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1ABBE3D68;
  aBlock[3] = &unk_1E5AB8CB8;
  v36 = a9;
  aBlock[4] = self;
  v22 = v18;
  v32 = v22;
  v34 = a11;
  v35 = a5;
  v23 = v19;
  v33 = v23;
  v24 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (a9)
    v25 = 1;
  else
    v25 = a5;
  objc_msgSend(v22, "setLastIndexedRowID:", v25);
  objc_msgSend(v22, "setInitialIndexedMessages:", objc_msgSend(v22, "initialIndexedMessages") + a7);
  objc_msgSend(v22, "setProcessedMessageRecords:", objc_msgSend(v22, "processedMessageRecords") + a6);
  if (!-[IMDCoreSpotlightManager _shouldBypassForTesting](self, "_shouldBypassForTesting"))
  {
    if (!a12)
    {
      v29[0] = v21;
      v29[1] = 3221225472;
      v29[2] = sub_1ABBE3F90;
      v29[3] = &unk_1E5AB88A8;
      v30 = v24;
      sub_1ABBE1440(v28, v22, v27, a11, v29);

      goto LABEL_18;
    }
    if (sub_1ABBD733C(v28, v22, v27, a11, 60000000000) && IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1ABB60000, v26, OS_LOG_TYPE_INFO, "Timed out waiting for CoreSpotlight to finish indexing message items!", buf, 2u);
      }

    }
  }
  v24[2](v24);
LABEL_18:

}

- (void)_suspendReindexingDueToError:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;

  v3 = a3;
  IMLogHandleForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    sub_1ABC5E998();

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateByAddingTimeInterval:", 1800.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D397C8], "setReindexingSuspendedUntilDate:", v6);
  objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isInternalInstall");

  if (v8)
  {
    objc_msgSend(v3, "debugDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D397C8], "setReindexingSuspensionReason:", v9);

  }
  +[IMSpotlightEventNotifier sharedNotifier](IMSpotlightEventNotifier, "sharedNotifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "reindexSuspendedUntilDate:withError:", v6, v3);

}

- (BOOL)_shouldBypassForTesting
{
  return 0;
}

- (void)_setNeedsIndexing:(BOOL)a3
{
  id v4;

  IMSetDomainBoolForKey();
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    IMSetDomainValueForKey();

  }
}

- (void)_setNeedsDeferredIndexing:(BOOL)a3
{
  IMSetDomainBoolForKey();
}

- (BOOL)_shouldIndexNextBatchForBatchSize:(unint64_t)a3
{
  if (a3 && objc_msgSend(MEMORY[0x1E0D397C8], "needsIndexing"))
    return IMDSystemMigrationOccurred();
  else
    return 0;
}

- (BOOL)_shouldSkipMessagePartPrefixingForItemDictionary:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;

  objc_msgSend(a3, "objectForKey:", CFSTR("associatedMessageType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "integerValue") == 2007;
  else
    v5 = 0;

  return v5;
}

- (unint64_t)_batchSizeForTargetBatchSize:(unint64_t)a3 lastIndexedRowID:(unint64_t)a4 lastBatch:(BOOL *)a5
{
  unint64_t result;
  int v9;
  NSObject *v10;
  int v11;
  unint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  result = a3;
  if (a4 < a3)
  {
    v9 = IMOSLoggingEnabled();
    result = a4;
    if (v9)
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = 134217984;
        v12 = a4;
        _os_log_impl(&dword_1ABB60000, v10, OS_LOG_TYPE_INFO, "Reducing batch size to %lu, last batch?", (uint8_t *)&v11, 0xCu);
      }

      result = a4;
    }
  }
  if (a5)
    *a5 = a4 < a3;
  return result;
}

- (void)setBlocklistMessageGUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_blocklistMessageGUIDs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blocklistMessageGUIDs, 0);
  objc_storeStrong((id *)&self->_backpressureController, 0);
}

@end
