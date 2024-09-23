@implementation IAMTempTestMessages

- (IAMTempTestMessages)initWithDisplayType:(int64_t)a3
{
  IAMTempTestMessages *result;
  void *v5;
  uint64_t v6;
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
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int64_t v39;
  void *v40;
  void *v41;
  void *v42;
  IAMTempTestMessages *v43;
  void *v44;
  void *v45;
  void *v46;
  objc_super v47;

  v47.receiver = self;
  v47.super_class = (Class)IAMTempTestMessages;
  result = -[IAMTempTestMessages init](&v47, sel_init);
  if (result)
  {
    v43 = result;
    v39 = a3;
    v5 = (void *)objc_opt_new();
    objc_msgSend(v5, "setKey:", CFSTR("arbitraryKey1"));
    objc_msgSend(v5, "setValue:", CFSTR("arbitraryValue1"));
    v6 = objc_opt_new();
    objc_msgSend(v5, "setKey:", CFSTR("arbitraryKey2"));
    objc_msgSend(v5, "setValue:", CFSTR("arbitraryValue2"));
    v7 = (void *)objc_opt_new();
    objc_msgSend(v7, "setIdentifier:", CFSTR("NumberOfTracksPlayed"));
    objc_msgSend(v7, "setDataType:", 2);
    objc_msgSend(v7, "setComparisonType:", 4);
    objc_msgSend(v7, "setTriggerValue:", CFSTR("2"));
    v8 = (void *)objc_opt_new();
    objc_msgSend(v8, "setIdentifier:", CFSTR("1234-5678"));
    objc_msgSend(v8, "setType:", 0);
    v40 = v8;
    v44 = v7;
    objc_msgSend(v8, "setTriggerCondition:", v7);
    v9 = (void *)objc_opt_new();
    objc_msgSend(v9, "setPageType:", 1);
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObjects:", v5, v6, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setActionDetails:", v10);

    objc_msgSend(v9, "setTargetId:", CFSTR("action1"));
    objc_msgSend(v9, "setTargetType:", 0);
    objc_msgSend(v9, "setActionType:", 2);
    v11 = (void *)objc_opt_new();
    objc_msgSend(v11, "setPageType:", 1);
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObjects:", v5, v6, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setActionDetails:", v12);

    objc_msgSend(v11, "setTargetId:", CFSTR("action2"));
    objc_msgSend(v11, "setTargetType:", 0);
    objc_msgSend(v11, "setActionType:", 2);
    v13 = (void *)objc_opt_new();
    objc_msgSend(v13, "setIdentifier:", CFSTR("1234-5678"));
    objc_msgSend(v13, "setDisplayText:", CFSTR("Got it!"));
    objc_msgSend(v13, "setURL:", CFSTR("http://apple.com"));
    objc_msgSend(v13, "setRequiresDelegate:", 0);
    v42 = v9;
    objc_msgSend(v13, "setClickEvent:", v9);
    v14 = (void *)objc_opt_new();
    objc_msgSend(v14, "setIdentifier:", CFSTR("987-654"));
    objc_msgSend(v14, "setDisplayText:", CFSTR("Got it!"));
    objc_msgSend(v14, "setURL:", CFSTR("http://apple.com"));
    objc_msgSend(v14, "setRequiresDelegate:", 0);
    v41 = v11;
    objc_msgSend(v13, "setClickEvent:", v11);
    v15 = (void *)objc_opt_new();
    objc_msgSend(v15, "setPageId:", CFSTR("page1"));
    objc_msgSend(v15, "setPageType:", 1);
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObjects:", v5, v6, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setPageDetails:", v16);

    objc_msgSend(v15, "setTargetId:", CFSTR("targetId"));
    objc_msgSend(v15, "setTargetType:", 0);
    v17 = (void *)objc_opt_new();
    objc_msgSend(v17, "setPageType:", 1);
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObjects:", v5, v6, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setActionDetails:", v18);

    objc_msgSend(v17, "setTargetId:", CFSTR("xbutton"));
    objc_msgSend(v17, "setTargetType:", 0);
    objc_msgSend(v17, "setActionType:", 2);
    v19 = (void *)objc_opt_new();
    objc_msgSend(v19, "setPageType:", 1);
    v45 = (void *)v6;
    v46 = v5;
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObjects:", v5, v6, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setActionDetails:", v20);

    objc_msgSend(v19, "setTargetId:", CFSTR("outsideOfCard"));
    objc_msgSend(v19, "setTargetType:", 0);
    objc_msgSend(v19, "setActionType:", 2);
    v21 = (void *)objc_opt_new();
    objc_msgSend(v21, "setTitle:", CFSTR("To Listen to this offline, tap one more time to download it."));
    objc_msgSend(v21, "setSubtitle:", CFSTR("Content 1 Subtitle"));
    objc_msgSend(v21, "setBody:", CFSTR("Content 1 Body"));
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObjects:", v13, v14, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setMessageActions:", v22);

    objc_msgSend(v21, "setPageEvent:", v15);
    objc_msgSend(v21, "setCloseClickEvent:", v17);
    objc_msgSend(v21, "setCardClickEvent:", v19);
    v23 = (void *)objc_opt_new();
    objc_msgSend(v23, "setTitle:", CFSTR("Content 2 Title"));
    objc_msgSend(v23, "setSubtitle:", CFSTR("Content 2 Subtitle"));
    objc_msgSend(v23, "setBody:", CFSTR("Content 2 Body"));
    v38 = v14;
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObjects:", v13, v14, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setMessageActions:", v24);

    v37 = v15;
    objc_msgSend(v21, "setPageEvent:", v15);
    v36 = v17;
    objc_msgSend(v21, "setCloseClickEvent:", v17);
    objc_msgSend(v21, "setCardClickEvent:", v19);
    v25 = 0;
    if (v39 == 1)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "URLForResource:withExtension:", CFSTR("listenOffline"), CFSTR("webarchive"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "URLByStandardizingPath");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v28 = (void *)objc_opt_new();
    objc_msgSend(v28, "setIdentifier:", CFSTR("message1"));
    objc_msgSend(v28, "setMessageType:", 1);
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObjects:", CFSTR("TEST_CUSTOM_TARGET"), 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setTargets:", v29);

    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObjects:", v21, v23, 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setContentPages:", v30);

    objc_msgSend(v28, "setRule:", v40);
    objc_msgSend(v28, "setMaximumDisplays:", 1);
    objc_msgSend(v25, "absoluteString");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setWebArchiveURL:", v31);

    v32 = objc_alloc(MEMORY[0x24BEC8808]);
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "bundleIdentifier");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void *)objc_msgSend(v32, "initWithApplicationMessage:bundleIdentifier:", v28, v34);
    -[IAMTempTestMessages setMessageEntry:](v43, "setMessageEntry:", v35);

    return v43;
  }
  return result;
}

- (ICInAppMessageEntry)messageEntry
{
  return self->_messageEntry;
}

- (void)setMessageEntry:(id)a3
{
  objc_storeStrong((id *)&self->_messageEntry, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageEntry, 0);
}

@end
