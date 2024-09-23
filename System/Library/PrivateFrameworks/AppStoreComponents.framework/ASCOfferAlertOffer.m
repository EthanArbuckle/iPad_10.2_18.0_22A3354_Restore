@implementation ASCOfferAlertOffer

- (ASCOfferAlertOffer)initWithID:(id)a3 titles:(id)a4 subtitles:(id)a5 flags:(int64_t)a6 ageRating:(id)a7 metrics:(id)a8 alertTitle:(id)a9 alertMessage:(id)a10 alertFooterMessage:(id)a11 isCancelable:(BOOL)a12 checkRestrictionsForContentRating:(id)a13 shouldCheckForAvailableDiskSpace:(BOOL)a14 remoteControllerRequirement:(id)a15 shouldIncludeActiveAccountInFooterMessage:(BOOL)a16 shouldPromptForConfirmation:(BOOL)a17 completionOffer:(id)a18
{
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  ASCOfferAlertOffer *v30;
  uint64_t v31;
  ASCAdamID *id;
  uint64_t v33;
  NSDictionary *titles;
  uint64_t v35;
  NSDictionary *subtitles;
  uint64_t v37;
  NSArray *metrics;
  uint64_t v39;
  NSString *alertTitle;
  uint64_t v41;
  NSString *alertMessage;
  uint64_t v43;
  NSString *v44;
  uint64_t v45;
  NSString *alertFooterMessage;
  uint64_t v47;
  NSNumber *checkRestrictionsForContentRating;
  uint64_t v49;
  NSString *remoteControllerRequirement;
  uint64_t v51;
  ASCOffer *completionOffer;
  id v56;
  id v57;
  id v58;
  objc_super v59;

  v22 = a3;
  v23 = a4;
  v58 = a5;
  v56 = a7;
  v57 = a8;
  v24 = a9;
  v25 = a10;
  v26 = a11;
  v27 = a13;
  v28 = a15;
  v29 = a18;
  v59.receiver = self;
  v59.super_class = (Class)ASCOfferAlertOffer;
  v30 = -[ASCOfferAlertOffer init](&v59, sel_init);
  if (v30)
  {
    v31 = objc_msgSend(v22, "copy");
    id = v30->_id;
    v30->_id = (ASCAdamID *)v31;

    v33 = objc_msgSend(v23, "copy");
    titles = v30->_titles;
    v30->_titles = (NSDictionary *)v33;

    v35 = objc_msgSend(v58, "copy");
    subtitles = v30->_subtitles;
    v30->_subtitles = (NSDictionary *)v35;

    v30->_flags = a6;
    objc_storeStrong((id *)&v30->_ageRating, a7);
    v37 = objc_msgSend(v57, "copy");
    metrics = v30->_metrics;
    v30->_metrics = (NSArray *)v37;

    v39 = objc_msgSend(v24, "copy");
    alertTitle = v30->_alertTitle;
    v30->_alertTitle = (NSString *)v39;

    v41 = objc_msgSend(v25, "copy");
    alertMessage = v30->_alertMessage;
    v30->_alertMessage = (NSString *)v41;

    v43 = objc_msgSend(v24, "copy");
    v44 = v30->_alertTitle;
    v30->_alertTitle = (NSString *)v43;

    v45 = objc_msgSend(v26, "copy");
    alertFooterMessage = v30->_alertFooterMessage;
    v30->_alertFooterMessage = (NSString *)v45;

    v30->_isCancelable = a12;
    v47 = objc_msgSend(v27, "copy");
    checkRestrictionsForContentRating = v30->_checkRestrictionsForContentRating;
    v30->_checkRestrictionsForContentRating = (NSNumber *)v47;

    v30->_shouldCheckForAvailableDiskSpace = a14;
    v49 = objc_msgSend(v28, "copy");
    remoteControllerRequirement = v30->_remoteControllerRequirement;
    v30->_remoteControllerRequirement = (NSString *)v49;

    v30->_shouldIncludeActiveAccountInFooterMessage = a16;
    v30->_shouldPromptForConfirmation = a17;
    v51 = objc_msgSend(v29, "copyWithZone:", 0);
    completionOffer = v30->_completionOffer;
    v30->_completionOffer = (ASCOffer *)v51;

  }
  return v30;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCOfferAlertOffer)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  ASCOfferAlertOffer *v18;
  _BOOL8 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _BOOL8 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _BOOL8 v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  void *v44;
  char v45;
  char v46;
  void *v47;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  char v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("id"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    ASCOfferTitlesDecodeForKey(v4, CFSTR("titles"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      ASCOfferTitlesDecodeForKey(v4, CFSTR("subtitles"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v8 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("flags"));
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ageRating"));
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        ASCMetricsDataDecodeArrayForKey(v4, CFSTR("metrics"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v56 = v8;
          objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("alertTitle"));
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("alertMessage"));
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("alertFooterMessage"));
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = v7;
          v57 = v9;
          if (objc_msgSend(v4, "containsValueForKey:", CFSTR("isCancelable")))
            v53 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isCancelable"));
          else
            v53 = 1;
          objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("checkRestrictionsForContentRating"));
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldCheckForAvailableDiskSpace"));
          objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("remoteControllerRequirement"));
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldIncludeActiveAccountInFooterMessage"));
          v46 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldPromptForConfirmation"));
          ASCOfferDecodeForKey(v4, CFSTR("completionOffer"));
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          BYTE1(v51) = v46;
          LOBYTE(v51) = v45;
          LOBYTE(v50) = v43;
          LOBYTE(v49) = v53;
          v7 = v58;
          self = objc_retain(-[ASCOfferAlertOffer initWithID:titles:subtitles:flags:ageRating:metrics:alertTitle:alertMessage:alertFooterMessage:isCancelable:checkRestrictionsForContentRating:shouldCheckForAvailableDiskSpace:remoteControllerRequirement:shouldIncludeActiveAccountInFooterMessage:shouldPromptForConfirmation:completionOffer:](self, "initWithID:titles:subtitles:flags:ageRating:metrics:alertTitle:alertMessage:alertFooterMessage:isCancelable:checkRestrictionsForContentRating:shouldCheckForAvailableDiskSpace:remoteControllerRequirement:shouldIncludeActiveAccountInFooterMessage:shouldPromptForConfirmation:completionOffer:", v5, v6, v58, v56, v60, v57, v55, v59, v54, v49, v52, v50, v44, v51,
                     v47));

          v9 = v57;
          v18 = self;
        }
        else
        {
          v35 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
          if (v35)
            -[ASCOfferAlertOffer initWithCoder:].cold.4(v35, v36, v37, v38, v39, v40, v41, v42);
          v18 = 0;
        }

      }
      else
      {
        v27 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
        if (v27)
          -[ASCOfferAlertOffer initWithCoder:].cold.3(v27, v28, v29, v30, v31, v32, v33, v34);
        v18 = 0;
      }

    }
    else
    {
      v19 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
      if (v19)
        -[ASCOfferAlertOffer initWithCoder:].cold.2(v19, v20, v21, v22, v23, v24, v25, v26);
      v18 = 0;
    }

  }
  else
  {
    v10 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v10)
      -[ASCOfferAlertOffer initWithCoder:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
    v18 = 0;
  }

  return v18;
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
  id v15;

  v4 = a3;
  -[ASCOfferAlertOffer id](self, "id");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("id"));

  -[ASCOfferAlertOffer titles](self, "titles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("titles"));

  -[ASCOfferAlertOffer subtitles](self, "subtitles");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("subtitles"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[ASCOfferAlertOffer flags](self, "flags"), CFSTR("flags"));
  -[ASCOfferAlertOffer ageRating](self, "ageRating");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("ageRating"));

  -[ASCOfferAlertOffer metrics](self, "metrics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("metrics"));

  -[ASCOfferAlertOffer alertTitle](self, "alertTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("alertTitle"));

  -[ASCOfferAlertOffer alertMessage](self, "alertMessage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("alertMessage"));

  -[ASCOfferAlertOffer alertFooterMessage](self, "alertFooterMessage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("alertFooterMessage"));

  objc_msgSend(v4, "encodeBool:forKey:", -[ASCOfferAlertOffer isCancelable](self, "isCancelable"), CFSTR("isCancelable"));
  -[ASCOfferAlertOffer checkRestrictionsForContentRating](self, "checkRestrictionsForContentRating");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("checkRestrictionsForContentRating"));

  objc_msgSend(v4, "encodeBool:forKey:", -[ASCOfferAlertOffer shouldCheckForAvailableDiskSpace](self, "shouldCheckForAvailableDiskSpace"), CFSTR("shouldCheckForAvailableDiskSpace"));
  -[ASCOfferAlertOffer remoteControllerRequirement](self, "remoteControllerRequirement");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("remoteControllerRequirement"));

  objc_msgSend(v4, "encodeBool:forKey:", -[ASCOfferAlertOffer shouldIncludeActiveAccountInFooterMessage](self, "shouldIncludeActiveAccountInFooterMessage"), CFSTR("shouldIncludeActiveAccountInFooterMessage"));
  objc_msgSend(v4, "encodeBool:forKey:", -[ASCOfferAlertOffer shouldPromptForConfirmation](self, "shouldPromptForConfirmation"), CFSTR("shouldPromptForConfirmation"));
  -[ASCOfferAlertOffer completionOffer](self, "completionOffer");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("completionOffer"));

}

- (ASCOfferAlertOffer)offerWithMetrics:(id)a3
{
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;
  BOOL v8;
  void *v9;
  BOOL v10;
  BOOL v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;

  v25 = a3;
  v23 = objc_alloc((Class)objc_opt_class());
  -[ASCOfferAlertOffer id](self, "id");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCOfferAlertOffer titles](self, "titles");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCOfferAlertOffer subtitles](self, "subtitles");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[ASCOfferAlertOffer flags](self, "flags");
  -[ASCOfferAlertOffer ageRating](self, "ageRating");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCOfferAlertOffer alertTitle](self, "alertTitle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCOfferAlertOffer alertMessage](self, "alertMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCOfferAlertOffer alertFooterMessage](self, "alertFooterMessage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ASCOfferAlertOffer isCancelable](self, "isCancelable");
  -[ASCOfferAlertOffer checkRestrictionsForContentRating](self, "checkRestrictionsForContentRating");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ASCOfferAlertOffer shouldCheckForAvailableDiskSpace](self, "shouldCheckForAvailableDiskSpace");
  -[ASCOfferAlertOffer remoteControllerRequirement](self, "remoteControllerRequirement");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[ASCOfferAlertOffer shouldIncludeActiveAccountInFooterMessage](self, "shouldIncludeActiveAccountInFooterMessage");
  v11 = -[ASCOfferAlertOffer shouldPromptForConfirmation](self, "shouldPromptForConfirmation");
  -[ASCOfferAlertOffer completionOffer](self, "completionOffer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE1(v16) = v11;
  LOBYTE(v16) = v10;
  LOBYTE(v15) = v8;
  LOBYTE(v14) = v6;
  v24 = (void *)objc_msgSend(v23, "initWithID:titles:subtitles:flags:ageRating:metrics:alertTitle:alertMessage:alertFooterMessage:isCancelable:checkRestrictionsForContentRating:shouldCheckForAvailableDiskSpace:remoteControllerRequirement:shouldIncludeActiveAccountInFooterMessage:shouldPromptForConfirmation:completionOffer:", v22, v21, v20, v19, v18, v25, v17, v4, v5, v14, v7, v15, v9, v16, v12);

  return (ASCOfferAlertOffer *)v24;
}

- (unint64_t)hash
{
  ASCHasher *v3;
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
  unint64_t v15;

  v3 = objc_alloc_init(ASCHasher);
  -[ASCOfferAlertOffer id](self, "id");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v4);

  -[ASCOfferAlertOffer titles](self, "titles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v5);

  -[ASCOfferAlertOffer subtitles](self, "subtitles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v6);

  -[ASCHasher combineInteger:](v3, "combineInteger:", -[ASCOfferAlertOffer flags](self, "flags"));
  -[ASCOfferAlertOffer ageRating](self, "ageRating");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v7);

  -[ASCOfferAlertOffer metrics](self, "metrics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v8);

  -[ASCOfferAlertOffer alertTitle](self, "alertTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v9);

  -[ASCOfferAlertOffer alertMessage](self, "alertMessage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v10);

  -[ASCOfferAlertOffer alertFooterMessage](self, "alertFooterMessage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v11);

  -[ASCHasher combineBool:](v3, "combineBool:", -[ASCOfferAlertOffer isCancelable](self, "isCancelable"));
  -[ASCOfferAlertOffer checkRestrictionsForContentRating](self, "checkRestrictionsForContentRating");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v12);

  -[ASCHasher combineBool:](v3, "combineBool:", -[ASCOfferAlertOffer shouldCheckForAvailableDiskSpace](self, "shouldCheckForAvailableDiskSpace"));
  -[ASCOfferAlertOffer remoteControllerRequirement](self, "remoteControllerRequirement");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v13);

  -[ASCHasher combineBool:](v3, "combineBool:", -[ASCOfferAlertOffer shouldIncludeActiveAccountInFooterMessage](self, "shouldIncludeActiveAccountInFooterMessage"));
  -[ASCHasher combineBool:](v3, "combineBool:", -[ASCOfferAlertOffer shouldPromptForConfirmation](self, "shouldPromptForConfirmation"));
  -[ASCOfferAlertOffer completionOffer](self, "completionOffer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v14);

  v15 = -[ASCHasher finalizeHash](v3, "finalizeHash");
  return v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  char v17;
  int64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  uint64_t v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v55;
  void *v56;
  int v57;
  int v58;
  void *v59;
  void *v60;
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
  int v72;
  void *v73;
  void *v74;

  v4 = a3;
  objc_opt_class();
  v5 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  if (v7)
  {
    -[ASCOfferAlertOffer id](self, "id");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "id");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v8 && v9)
    {
      if (objc_msgSend(v8, "isEqual:", v9))
      {
LABEL_10:
        -[ASCOfferAlertOffer titles](self, "titles");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "titles");
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = (void *)v12;
        if (v11 && v12)
        {
          if (objc_msgSend(v11, "isEqual:", v12))
          {
LABEL_13:
            -[ASCOfferAlertOffer subtitles](self, "subtitles");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "subtitles");
            v15 = objc_claimAutoreleasedReturnValue();
            v16 = (void *)v15;
            if (v14 && v15)
            {
              if (!objc_msgSend(v14, "isEqual:", v15))
                goto LABEL_40;
            }
            else if (v14 != (void *)v15)
            {
              goto LABEL_40;
            }
            v18 = -[ASCOfferAlertOffer flags](self, "flags");
            if (v18 == objc_msgSend(v7, "flags"))
            {
              -[ASCOfferAlertOffer ageRating](self, "ageRating");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "ageRating");
              v20 = objc_claimAutoreleasedReturnValue();
              v21 = (void *)v20;
              if (v19 && v20)
              {
                v22 = v19;
                v71 = v14;
                v23 = v16;
                v24 = v19;
                v25 = v21;
                v26 = objc_msgSend(v22, "isEqual:", v21);
                v21 = v25;
                v19 = v24;
                v16 = v23;
                v14 = v71;
                if (v26)
                {
LABEL_27:
                  v69 = v21;
                  v70 = v19;
                  -[ASCOfferAlertOffer metrics](self, "metrics");
                  v27 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v7, "metrics");
                  v28 = objc_claimAutoreleasedReturnValue();
                  v29 = (void *)v28;
                  v74 = (void *)v27;
                  if (v27 && v28)
                  {
                    v30 = (void *)v28;
                    v31 = objc_msgSend(v74, "isEqual:", v28);
                    v29 = v30;
                    if (v31)
                    {
LABEL_30:
                      v67 = v29;
                      -[ASCOfferAlertOffer alertTitle](self, "alertTitle");
                      v32 = objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v7, "alertTitle");
                      v33 = objc_claimAutoreleasedReturnValue();
                      v34 = (void *)v33;
                      v68 = (void *)v32;
                      if (v32 && v33)
                      {
                        v35 = (void *)v33;
                        v36 = objc_msgSend(v68, "isEqual:", v33);
                        v34 = v35;
                        if (v36)
                        {
LABEL_33:
                          v65 = v34;
                          -[ASCOfferAlertOffer alertMessage](self, "alertMessage");
                          v37 = objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v7, "alertMessage");
                          v38 = objc_claimAutoreleasedReturnValue();
                          v39 = (void *)v38;
                          v66 = (void *)v37;
                          if (v37 && v38)
                          {
                            v40 = (void *)v38;
                            v41 = objc_msgSend(v66, "isEqual:", v38);
                            v39 = v40;
                            if (v41)
                            {
LABEL_36:
                              v63 = v39;
                              -[ASCOfferAlertOffer alertFooterMessage](self, "alertFooterMessage");
                              v42 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v7, "alertFooterMessage");
                              v43 = objc_claimAutoreleasedReturnValue();
                              v64 = v42;
                              v62 = (void *)v43;
                              if (v42 && v43)
                              {
                                if (!objc_msgSend(v42, "isEqual:", v43))
                                  goto LABEL_51;
                              }
                              else if (v42 != (void *)v43)
                              {
LABEL_51:
                                v17 = 0;
LABEL_69:

                                v39 = v63;
                                goto LABEL_70;
                              }
                              v44 = -[ASCOfferAlertOffer isCancelable](self, "isCancelable");
                              if (v44 != objc_msgSend(v7, "isCancelable"))
                                goto LABEL_51;
                              -[ASCOfferAlertOffer checkRestrictionsForContentRating](self, "checkRestrictionsForContentRating");
                              v45 = objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v7, "checkRestrictionsForContentRating");
                              v46 = objc_claimAutoreleasedReturnValue();
                              v61 = (void *)v45;
                              if (v45 && v46)
                              {
                                v47 = (void *)v46;
                                if (!objc_msgSend(v61, "isEqual:", v46))
                                  goto LABEL_58;
                              }
                              else
                              {
                                v47 = (void *)v46;
                                if (v61 != (void *)v46)
                                {
LABEL_58:
                                  v17 = 0;
LABEL_68:

                                  goto LABEL_69;
                                }
                              }
                              v72 = -[ASCOfferAlertOffer shouldCheckForAvailableDiskSpace](self, "shouldCheckForAvailableDiskSpace");
                              if (v72 != objc_msgSend(v7, "shouldCheckForAvailableDiskSpace"))
                                goto LABEL_58;
                              v73 = v14;
                              v60 = v16;
                              -[ASCOfferAlertOffer remoteControllerRequirement](self, "remoteControllerRequirement");
                              v48 = objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v7, "remoteControllerRequirement");
                              v49 = objc_claimAutoreleasedReturnValue();
                              v50 = (void *)v49;
                              v51 = (void *)v48;
                              if (v48 && v49)
                              {
                                v52 = (void *)v48;
                                v53 = v50;
                                if (!objc_msgSend(v52, "isEqual:", v50))
                                  goto LABEL_66;
                              }
                              else
                              {
                                v53 = (void *)v49;
                                if (v51 != (void *)v49)
                                  goto LABEL_66;
                              }
                              v57 = -[ASCOfferAlertOffer shouldIncludeActiveAccountInFooterMessage](self, "shouldIncludeActiveAccountInFooterMessage");
                              if (v57 == objc_msgSend(v7, "shouldIncludeActiveAccountInFooterMessage"))
                              {
                                v58 = -[ASCOfferAlertOffer shouldPromptForConfirmation](self, "shouldPromptForConfirmation");
                                if (v58 == objc_msgSend(v7, "shouldPromptForConfirmation"))
                                {
                                  -[ASCOfferAlertOffer completionOffer](self, "completionOffer");
                                  v55 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend(v7, "completionOffer");
                                  v56 = v55;
                                  v59 = (void *)objc_claimAutoreleasedReturnValue();
                                  if (v55 && v59)
                                    v17 = objc_msgSend(v55, "isEqual:", v59);
                                  else
                                    v17 = v55 == v59;

                                  goto LABEL_67;
                                }
                              }
LABEL_66:
                              v17 = 0;
LABEL_67:

                              v16 = v60;
                              v14 = v73;
                              goto LABEL_68;
                            }
                          }
                          else if (v37 == v38)
                          {
                            goto LABEL_36;
                          }
                          v17 = 0;
LABEL_70:

                          v34 = v65;
                          goto LABEL_71;
                        }
                      }
                      else if (v32 == v33)
                      {
                        goto LABEL_33;
                      }
                      v17 = 0;
LABEL_71:

                      v29 = v67;
                      goto LABEL_72;
                    }
                  }
                  else if (v27 == v28)
                  {
                    goto LABEL_30;
                  }
                  v17 = 0;
LABEL_72:

                  v21 = v69;
                  v19 = v70;
                  goto LABEL_73;
                }
              }
              else if (v19 == (void *)v20)
              {
                goto LABEL_27;
              }
              v17 = 0;
LABEL_73:

              goto LABEL_74;
            }
LABEL_40:
            v17 = 0;
LABEL_74:

            goto LABEL_75;
          }
        }
        else if (v11 == (void *)v12)
        {
          goto LABEL_13;
        }
        v17 = 0;
LABEL_75:

        goto LABEL_76;
      }
    }
    else if (v8 == (void *)v9)
    {
      goto LABEL_10;
    }
    v17 = 0;
LABEL_76:

    goto LABEL_77;
  }
  v17 = 0;
LABEL_77:

  return v17;
}

- (NSString)description
{
  ASCDescriber *v3;
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

  v3 = -[ASCDescriber initWithObject:]([ASCDescriber alloc], "initWithObject:", self);
  -[ASCOfferAlertOffer id](self, "id");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v4, CFSTR("id"));

  -[ASCOfferAlertOffer titles](self, "titles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v5, CFSTR("titles"));

  -[ASCOfferAlertOffer subtitles](self, "subtitles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v6, CFSTR("subtitles"));

  ASCOfferFlagsGetDescription(-[ASCOfferAlertOffer flags](self, "flags"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v7, CFSTR("flags"));

  -[ASCOfferAlertOffer ageRating](self, "ageRating");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v8, CFSTR("ageRating"));

  -[ASCOfferAlertOffer metrics](self, "metrics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addSensitiveObject:withName:](v3, "addSensitiveObject:withName:", v9, CFSTR("metrics"));

  -[ASCOfferAlertOffer alertTitle](self, "alertTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v10, CFSTR("alertTitle"));

  -[ASCOfferAlertOffer alertMessage](self, "alertMessage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v11, CFSTR("alertMessage"));

  -[ASCOfferAlertOffer alertFooterMessage](self, "alertFooterMessage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v12, CFSTR("alertFooterMessage"));

  -[ASCDescriber addBool:withName:](v3, "addBool:withName:", -[ASCOfferAlertOffer isCancelable](self, "isCancelable"), CFSTR("isCancelable"));
  -[ASCOfferAlertOffer checkRestrictionsForContentRating](self, "checkRestrictionsForContentRating");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v13, CFSTR("checkRestrictionsForContentRating"));

  -[ASCDescriber addBool:withName:](v3, "addBool:withName:", -[ASCOfferAlertOffer shouldCheckForAvailableDiskSpace](self, "shouldCheckForAvailableDiskSpace"), CFSTR("shouldCheckForAvailableDiskSpace"));
  -[ASCOfferAlertOffer remoteControllerRequirement](self, "remoteControllerRequirement");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v14, CFSTR("remoteControllerRequirement"));

  -[ASCDescriber addBool:withName:](v3, "addBool:withName:", -[ASCOfferAlertOffer shouldIncludeActiveAccountInFooterMessage](self, "shouldIncludeActiveAccountInFooterMessage"), CFSTR("shouldIncludeActiveAccountInFooterMessage"));
  -[ASCDescriber addBool:withName:](v3, "addBool:withName:", -[ASCOfferAlertOffer shouldPromptForConfirmation](self, "shouldPromptForConfirmation"), CFSTR("shouldPromptForConfirmation"));
  -[ASCOfferAlertOffer completionOffer](self, "completionOffer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v15, CFSTR("completionOffer"));

  -[ASCDescriber finalizeDescription](v3, "finalizeDescription");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v16;
}

- (ASCAdamID)id
{
  return self->_id;
}

- (NSDictionary)titles
{
  return self->_titles;
}

- (NSDictionary)subtitles
{
  return self->_subtitles;
}

- (int64_t)flags
{
  return self->_flags;
}

- (NSNumber)ageRating
{
  return self->_ageRating;
}

- (NSArray)metrics
{
  return self->_metrics;
}

- (NSString)alertTitle
{
  return self->_alertTitle;
}

- (NSString)alertMessage
{
  return self->_alertMessage;
}

- (NSString)alertFooterMessage
{
  return self->_alertFooterMessage;
}

- (BOOL)isCancelable
{
  return self->_isCancelable;
}

- (NSNumber)checkRestrictionsForContentRating
{
  return self->_checkRestrictionsForContentRating;
}

- (BOOL)shouldCheckForAvailableDiskSpace
{
  return self->_shouldCheckForAvailableDiskSpace;
}

- (NSString)remoteControllerRequirement
{
  return self->_remoteControllerRequirement;
}

- (BOOL)shouldIncludeActiveAccountInFooterMessage
{
  return self->_shouldIncludeActiveAccountInFooterMessage;
}

- (BOOL)shouldPromptForConfirmation
{
  return self->_shouldPromptForConfirmation;
}

- (ASCOffer)completionOffer
{
  return self->_completionOffer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionOffer, 0);
  objc_storeStrong((id *)&self->_remoteControllerRequirement, 0);
  objc_storeStrong((id *)&self->_checkRestrictionsForContentRating, 0);
  objc_storeStrong((id *)&self->_alertFooterMessage, 0);
  objc_storeStrong((id *)&self->_alertMessage, 0);
  objc_storeStrong((id *)&self->_alertTitle, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_ageRating, 0);
  objc_storeStrong((id *)&self->_subtitles, 0);
  objc_storeStrong((id *)&self->_titles, 0);
  objc_storeStrong((id *)&self->_id, 0);
}

- (void)initWithCoder:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BCB7B000, MEMORY[0x1E0C81028], a3, "Could not decode ASCOfferAlertOffer because id was missing", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)initWithCoder:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BCB7B000, MEMORY[0x1E0C81028], a3, "Could not decode ASCOfferAlertOffer because titles was missing", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)initWithCoder:(uint64_t)a3 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BCB7B000, MEMORY[0x1E0C81028], a3, "Could not decode ASCOfferAlertOffer because subtitles was missing", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)initWithCoder:(uint64_t)a3 .cold.4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BCB7B000, MEMORY[0x1E0C81028], a3, "Could not decode ASCOfferAlertOffer because metrics was missing", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

@end
