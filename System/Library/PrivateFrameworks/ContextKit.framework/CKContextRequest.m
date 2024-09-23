@implementation CKContextRequest

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKContextRequest;
  v4 = a3;
  -[CKContextDonationItem encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  -[NSCoder encodeUInteger:forKey:](v4, (const char *)self->_type, (uint64_t)CFSTR("type"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_debug, CFSTR("debug"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeBool:forKey:", self->_dontSkip, CFSTR("dontSkip"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_incPending, CFSTR("incPending"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_timing, CFSTR("timing"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_overrideEnableCoreNLPTagging, CFSTR("overrideEnableCoreNLPTagging"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_includeHigherLevelTopics, CFSTR("includeHigherLevelTopics"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_includeStructuredExtractionResults, CFSTR("includeStructuredExtractionResults"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_textIsRaw, CFSTR("textIsRaw"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_includeRequestInResponse, CFSTR("includeRequestInResponse"));
  -[NSCoder encodeUInt32:forKey:](v4, (const char *)self->_topk, (uint64_t)CFSTR("topk"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_maxConstellationTopics, CFSTR("maxConstellationTopics"));
  objc_msgSend(v4, "encodeInt32:forKey:", self->_overrideConstellationMinCount, CFSTR("overrideConstellationMinCount"));
  objc_msgSend(v4, "encodeInt32:forKey:", self->_overrideConstellationMinWeight, CFSTR("overrideConstellationMinWeight"));
  -[NSCoder encodeUInteger:forKey:](v4, (const char *)self->_fingerprintMax, (uint64_t)CFSTR("fingerprintMax"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("donationTimeout"), self->_donationTimeout);
  objc_msgSend(v4, "encodeObject:forKey:", self->_overrideBlendAlpha, CFSTR("overrideBlendAlpha"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_overrideBlendBeta, CFSTR("overrideBlendBeta"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_overrideBlendGamma, CFSTR("overrideBlendGamma"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_urls, CFSTR("urls"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_itemIds, CFSTR("itemIds"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_desiredLanguageTags, CFSTR("desiredLanguageTags"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_donorBundleIdentifiers, CFSTR("donorBundleIdentifiers"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_allowedTopicTypeTags, CFSTR("allowedTopicTypeTags"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_preferredSceneIdentifiers, CFSTR("preferredSceneIdentifiers"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_includePartsOfSpeech, CFSTR("includePartsOfSpeech"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_includeLeadImage, CFSTR("includeLeadImage"));

}

- (void)executeCategorizationRequestWithReply:(id)a3
{
  id v4;
  id v5;
  _QWORD activity_block[5];
  id v7;

  v4 = a3;
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __58__CKContextRequest_executeCategorizationRequestWithReply___block_invoke;
  activity_block[3] = &unk_1E462F090;
  activity_block[4] = self;
  v7 = v4;
  v5 = v4;
  _os_activity_initiate(&dword_1A1AA2000, "ContextRequest executeCategorizationRequest", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __59__CKContextRequest__executeCategorizationRequestWithReply___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v5 = a3;
  v6 = a2;
  +[CKContextClient timeIntervalBetweenMachTime:andMachTime:](CKContextClient, "timeIntervalBetweenMachTime:andMachTime:", mach_absolute_time(), *(_QWORD *)(a1 + 40));
  v7 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
  if (v7)
    __59__CKContextRequest__executeCategorizationRequestWithReply___block_invoke_2_cold_1(v7, v8, v9, v10, v11, v12, v13, v14);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (id)initForClient:(id)a3
{
  id v5;
  CKContextRequest *v6;
  CKContextRequest *v7;
  uint64_t v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CKContextRequest;
  v6 = -[CKContextRequest init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_client, a3);
    v8 = objc_msgSend(v5, "defaultRequestType");
    v7->_type = v8;
    if (v8 == 14)
      v7->_includeHigherLevelTopics = 1;
  }

  return v7;
}

- (void)_executeCategorizationRequestWithReply:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;

  v4 = a3;
  v5 = mach_absolute_time();
  if (-[CKContextClient tryAcquireServiceSemaphoreNeedsIncPending:](self->_client, "tryAcquireServiceSemaphoreNeedsIncPending:", !self->_incPending))
  {
    +[CKContextXPCClient xpcConnection](CKContextXPCClient, "xpcConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __59__CKContextRequest__executeCategorizationRequestWithReply___block_invoke;
    v14[3] = &unk_1E462EFF0;
    v8 = v4;
    v15 = v8;
    objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v7;
    v11[1] = 3221225472;
    v11[2] = __59__CKContextRequest__executeCategorizationRequestWithReply___block_invoke_2;
    v11[3] = &unk_1E462F3B8;
    v13 = v5;
    v12 = v8;
    objc_msgSend(v9, "findCategorizationsForRequest:withReply:", self, v11);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.context"), 6, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v10);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_donorBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_desiredLanguageTags, 0);
  objc_storeStrong((id *)&self->_overrideBlendGamma, 0);
  objc_storeStrong((id *)&self->_overrideBlendBeta, 0);
  objc_storeStrong((id *)&self->_overrideBlendAlpha, 0);
  objc_storeStrong((id *)&self->_preferredSceneIdentifiers, 0);
  objc_storeStrong((id *)&self->_allowedTopicTypeTags, 0);
  objc_storeStrong((id *)&self->_itemIds, 0);
  objc_storeStrong((id *)&self->_urls, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

- (CKContextRequest)initWithCoder:(id)a3
{
  id v4;
  CKContextRequest *v5;
  double v6;
  id v7;
  uint64_t v8;
  NSNumber *overrideBlendAlpha;
  id v10;
  uint64_t v11;
  NSNumber *overrideBlendBeta;
  id v13;
  uint64_t v14;
  NSNumber *overrideBlendGamma;
  id v16;
  uint64_t v17;
  NSArray *urls;
  id v19;
  uint64_t v20;
  NSDictionary *itemIds;
  id v22;
  uint64_t v23;
  NSOrderedSet *desiredLanguageTags;
  id v25;
  uint64_t v26;
  NSArray *donorBundleIdentifiers;
  id v28;
  uint64_t v29;
  NSSet *allowedTopicTypeTags;
  id v31;
  uint64_t v32;
  NSSet *preferredSceneIdentifiers;
  objc_super v35;

  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)CKContextRequest;
  v5 = -[CKContextDonationItem initWithCoder:](&v35, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_type = (unint64_t)-[NSCoder decodeUIntegerForKey:](v4, CFSTR("type"));
    v5->_debug = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("debug"));
    v5->_dontSkip = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("dontSkip"));
    v5->_incPending = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("incPending"));
    v5->_timing = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("timing"));
    v5->_overrideEnableCoreNLPTagging = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("overrideEnableCoreNLPTagging"));
    v5->_includeHigherLevelTopics = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("includeHigherLevelTopics"));
    v5->_includeStructuredExtractionResults = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("includeStructuredExtractionResults"));
    v5->_textIsRaw = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("textIsRaw"));
    v5->_includeRequestInResponse = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("includeRequestInResponse"));
    v5->_topk = -[NSCoder decodeUInt32ForKey:](v4, CFSTR("topk"));
    v5->_maxConstellationTopics = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("maxConstellationTopics"));
    v5->_overrideConstellationMinCount = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("overrideConstellationMinCount"));
    v5->_overrideConstellationMinWeight = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("overrideConstellationMinWeight"));
    v5->_fingerprintMax = (unint64_t)-[NSCoder decodeUIntegerForKey:](v4, CFSTR("fingerprintMax"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("donationTimeout"));
    v5->_donationTimeout = v6;
    if (initWithCoder__onceToken != -1)
      dispatch_once(&initWithCoder__onceToken, &__block_literal_global_0);
    v7 = (id)initWithCoder__x;
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("overrideBlendAlpha"));
    v8 = objc_claimAutoreleasedReturnValue();
    overrideBlendAlpha = v5->_overrideBlendAlpha;
    v5->_overrideBlendAlpha = (NSNumber *)v8;

    if (initWithCoder__onceToken_50 != -1)
      dispatch_once(&initWithCoder__onceToken_50, &__block_literal_global_51);
    v10 = (id)initWithCoder__x_49;
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("overrideBlendBeta"));
    v11 = objc_claimAutoreleasedReturnValue();
    overrideBlendBeta = v5->_overrideBlendBeta;
    v5->_overrideBlendBeta = (NSNumber *)v11;

    if (initWithCoder__onceToken_55 != -1)
      dispatch_once(&initWithCoder__onceToken_55, &__block_literal_global_56);
    v13 = (id)initWithCoder__x_54;
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("overrideBlendGamma"));
    v14 = objc_claimAutoreleasedReturnValue();
    overrideBlendGamma = v5->_overrideBlendGamma;
    v5->_overrideBlendGamma = (NSNumber *)v14;

    if (initWithCoder__onceToken_60 != -1)
      dispatch_once(&initWithCoder__onceToken_60, &__block_literal_global_61);
    v16 = (id)initWithCoder__x_59;
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("urls"));
    v17 = objc_claimAutoreleasedReturnValue();
    urls = v5->_urls;
    v5->_urls = (NSArray *)v17;

    if (initWithCoder__onceToken_66 != -1)
      dispatch_once(&initWithCoder__onceToken_66, &__block_literal_global_67);
    v19 = (id)initWithCoder__x_65;
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("itemIds"));
    v20 = objc_claimAutoreleasedReturnValue();
    itemIds = v5->_itemIds;
    v5->_itemIds = (NSDictionary *)v20;

    if (initWithCoder__onceToken_72 != -1)
      dispatch_once(&initWithCoder__onceToken_72, &__block_literal_global_73);
    v22 = (id)initWithCoder__x_71;
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v22, CFSTR("desiredLanguageTags"));
    v23 = objc_claimAutoreleasedReturnValue();
    desiredLanguageTags = v5->_desiredLanguageTags;
    v5->_desiredLanguageTags = (NSOrderedSet *)v23;

    if (initWithCoder__onceToken_78 != -1)
      dispatch_once(&initWithCoder__onceToken_78, &__block_literal_global_79);
    v25 = (id)initWithCoder__x_77;
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v25, CFSTR("donorBundleIdentifiers"));
    v26 = objc_claimAutoreleasedReturnValue();
    donorBundleIdentifiers = v5->_donorBundleIdentifiers;
    v5->_donorBundleIdentifiers = (NSArray *)v26;

    if (initWithCoder__onceToken_84 != -1)
      dispatch_once(&initWithCoder__onceToken_84, &__block_literal_global_85);
    v28 = (id)initWithCoder__x_83;
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v28, CFSTR("allowedTopicTypeTags"));
    v29 = objc_claimAutoreleasedReturnValue();
    allowedTopicTypeTags = v5->_allowedTopicTypeTags;
    v5->_allowedTopicTypeTags = (NSSet *)v29;

    if (initWithCoder__onceToken_89 != -1)
      dispatch_once(&initWithCoder__onceToken_89, &__block_literal_global_90);
    v31 = (id)initWithCoder__x_88;
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v31, CFSTR("preferredSceneIdentifiers"));
    v32 = objc_claimAutoreleasedReturnValue();
    preferredSceneIdentifiers = v5->_preferredSceneIdentifiers;
    v5->_preferredSceneIdentifiers = (NSSet *)v32;

    v5->_includePartsOfSpeech = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("includePartsOfSpeech"));
    v5->_includeLeadImage = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("includeLeadImage"));
  }

  return v5;
}

- (void)setUrls:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSArray)urls
{
  return self->_urls;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setIncludeHigherLevelTopics:(BOOL)a3
{
  self->_includeHigherLevelTopics = a3;
}

- (BOOL)incPending
{
  return self->_incPending;
}

uint64_t __58__CKContextRequest_executeCategorizationRequestWithReply___block_invoke(uint64_t a1)
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    __37__CKContextRequest_executeWithReply___block_invoke_cold_1(a1);
  return objc_msgSend(*(id *)(a1 + 32), "_executeCategorizationRequestWithReply:", *(_QWORD *)(a1 + 40));
}

+ (void)initialize
{
  uint64_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)kWhitespaceAndNewlines;
    kWhitespaceAndNewlines = v2;

    _defaultRequestType = 0;
  }
}

+ (void)setDefaultRequestType:(unint64_t)a3
{
  _defaultRequestType = a3;
}

+ (void)findResultsForText:(id)a3 withReply:(id)a4
{
  objc_msgSend(a1, "findResultsForText:languageTag:requestType:withReply:", a3, 0, 0, a4);
}

+ (void)findResultsForText:(id)a3 languageTag:(id)a4 withReply:(id)a5
{
  objc_msgSend(a1, "findResultsForText:languageTag:requestType:withReply:", a3, a4, 0, a5);
}

+ (void)findResultsForText:(id)a3 languageTag:(id)a4 requestType:(unint64_t)a5 withReply:(id)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  unint64_t v20;

  v10 = a3;
  v11 = a4;
  v12 = (void *)objc_msgSend(a6, "copy");
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __73__CKContextRequest_findResultsForText_languageTag_requestType_withReply___block_invoke;
  v16[3] = &unk_1E462F0B8;
  v17 = v10;
  v18 = v11;
  v19 = v12;
  v20 = a5;
  v13 = v11;
  v14 = v12;
  v15 = v10;
  objc_msgSend(a1, "runOffMainThread:", v16);

}

void __73__CKContextRequest_findResultsForText_languageTag_requestType_withReply___block_invoke(uint64_t a1)
{
  CKContextRequest *v2;
  CKContextRequest *v3;
  _QWORD activity_block[4];
  CKContextRequest *v5;
  id v6;

  if (objc_msgSend(*(id *)(a1 + 32), "length"))
  {
    v2 = -[CKContextRequest initWithText:]([CKContextRequest alloc], "initWithText:", *(_QWORD *)(a1 + 32));
    -[CKContextDonationItem setLanguageTag:](v2, "setLanguageTag:", *(_QWORD *)(a1 + 40));
    -[CKContextRequest setType:](v2, "setType:", *(_QWORD *)(a1 + 56));
    activity_block[0] = MEMORY[0x1E0C809B0];
    activity_block[1] = 3221225472;
    activity_block[2] = __73__CKContextRequest_findResultsForText_languageTag_requestType_withReply___block_invoke_2;
    activity_block[3] = &unk_1E462F090;
    v5 = v2;
    v6 = *(id *)(a1 + 48);
    v3 = v2;
    _os_activity_initiate(&dword_1A1AA2000, "ContextRequest findResultsForText", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

uint64_t __73__CKContextRequest_findResultsForText_languageTag_requestType_withReply___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_executeWithReply:", *(_QWORD *)(a1 + 40));
}

- (void)setUrl:(id)a3
{
  void *v5;
  id v6;
  NSArray *v7;
  NSArray *urls;
  NSArray *v9;
  id v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v11[0] = a3;
    v5 = (void *)MEMORY[0x1E0C99D20];
    v6 = a3;
    objc_msgSend(v5, "arrayWithObjects:count:", v11, 1);
    v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
    urls = self->_urls;
    self->_urls = v7;

  }
  else
  {
    v9 = self->_urls;
    self->_urls = (NSArray *)MEMORY[0x1E0C9AA60];
    v10 = 0;

  }
}

- (NSString)url
{
  return (NSString *)-[NSArray firstObject](self->_urls, "firstObject");
}

- (id)copyWithZone:(_NSZone *)a3
{
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
  void *v20;
  void *v21;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithText:", &stru_1E462FA08);
  objc_msgSend(v4, "setType:", self->_type);
  -[CKContextDonationItem text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setText:", v6);

  -[CKContextDonationItem debugText](self, "debugText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setDebugText:", v8);

  -[CKContextDonationItem debugUrlString](self, "debugUrlString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setDebugUrlString:", v10);

  -[CKContextDonationItem title](self, "title");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v11);

  -[CKContextDonationItem contentAuthor](self, "contentAuthor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentAuthor:", v12);

  -[CKContextDonationItem contentDescription](self, "contentDescription");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentDescription:", v13);

  -[CKContextDonationItem contentKeywords](self, "contentKeywords");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentKeywords:", v14);

  -[CKContextDonationItem languageTag](self, "languageTag");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLanguageTag:", v15);

  objc_msgSend(v4, "setType:", -[CKContextRequest type](self, "type"));
  -[CKContextDonationItem uiElements](self, "uiElements");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUiElements:", v16);

  objc_msgSend(v4, "setTextIsRaw:", self->_textIsRaw);
  objc_msgSend(v4, "setUrls:", self->_urls);
  objc_msgSend(v4, "setIncludeHigherLevelTopics:", self->_includeHigherLevelTopics);
  objc_msgSend(v4, "setIncludeStructuredExtractionResults:", self->_includeStructuredExtractionResults);
  objc_msgSend(v4, "setIncludeLeadImage:", self->_includeLeadImage);
  objc_msgSend(v4, "setItemIds:", self->_itemIds);
  objc_msgSend(v4, "setMaxConstellationTopics:", self->_maxConstellationTopics);
  objc_msgSend(v4, "setAllowedTopicTypeTags:", self->_allowedTopicTypeTags);
  objc_msgSend(v4, "setDebug:", self->_debug);
  objc_msgSend(v4, "setDontSkip:", self->_dontSkip);
  objc_msgSend(v4, "setTiming:", self->_timing);
  objc_msgSend(v4, "setOverrideBlendAlpha:", self->_overrideBlendAlpha);
  objc_msgSend(v4, "setOverrideBlendBeta:", self->_overrideBlendBeta);
  objc_msgSend(v4, "setOverrideBlendGamma:", self->_overrideBlendGamma);
  objc_msgSend(v4, "setOverrideConstellationMinCount:", self->_overrideConstellationMinCount);
  objc_msgSend(v4, "setOverrideConstellationMinWeight:", self->_overrideConstellationMinWeight);
  objc_msgSend(v4, "setTopk:", self->_topk);
  objc_msgSend(v4, "setOverrideEnableCoreNLPTagging:", self->_overrideEnableCoreNLPTagging);
  objc_msgSend(v4, "setIncludeRequestInResponse:", self->_includeRequestInResponse);
  objc_msgSend(v4, "setIncPending:", self->_incPending);
  objc_msgSend(v4, "setDesiredLanguageTags:", self->_desiredLanguageTags);
  objc_msgSend(v4, "setDonorBundleIdentifiers:", self->_donorBundleIdentifiers);
  -[CKContextDonationItem leadImage](self, "leadImage");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLeadImage:", v17);

  -[CKContextDonationItem snapshot](self, "snapshot");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSnapshot:", v18);

  -[CKContextDonationItem rawHTML](self, "rawHTML");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRawHTML:", v19);

  -[CKContextRequest preferredSceneIdentifiers](self, "preferredSceneIdentifiers");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v20, "copy");
  objc_msgSend(v4, "setPreferredSceneIdentifiers:", v21);

  objc_msgSend(v4, "setIncludePartsOfSpeech:", self->_includePartsOfSpeech);
  return v4;
}

+ (void)runOffMainThread:(id)a3
{
  intptr_t v3;
  NSObject *v4;
  void (**block)(void);

  block = (void (**)(void))a3;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    LODWORD(v3) = qos_class_self();
    if (v3 >= 0x19)
      v3 = 25;
    else
      v3 = v3;
    dispatch_get_global_queue(v3, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v4, block);

  }
  else
  {
    block[2]();
  }

}

+ (void)warmUpForRequestType:(unint64_t)a3 withReply:(id)a4
{
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  unint64_t v10;

  v5 = (void *)objc_msgSend(a4, "copy");
  dispatch_get_global_queue(9, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__CKContextRequest_warmUpForRequestType_withReply___block_invoke;
  v8[3] = &unk_1E462F108;
  v9 = v5;
  v10 = a3;
  v7 = v5;
  dispatch_async(v6, v8);

}

void __51__CKContextRequest_warmUpForRequestType_withReply___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  uint64_t v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__CKContextRequest_warmUpForRequestType_withReply___block_invoke_2;
  v4[3] = &unk_1E462F108;
  v2 = *(id *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5 = v2;
  v6 = v3;
  _os_activity_initiate(&dword_1A1AA2000, "ContextRequest warmUpForRequestType", OS_ACTIVITY_FLAG_DEFAULT, v4);

}

void __51__CKContextRequest_warmUpForRequestType_withReply___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD *v10;
  _QWORD v11[4];
  char v12;

  +[CKContextXPCClient xpcConnection](CKContextXPCClient, "xpcConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2810000000;
  v11[3] = &unk_1A1AB4839;
  v12 = 0;
  v3 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__CKContextRequest_warmUpForRequestType_withReply___block_invoke_3;
  v8[3] = &unk_1E462F0E0;
  v10 = v11;
  v9 = *(id *)(a1 + 32);
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __51__CKContextRequest_warmUpForRequestType_withReply___block_invoke_4;
  v6[3] = &unk_1E462EFF0;
  v5 = *(_QWORD *)(a1 + 40);
  v7 = *(id *)(a1 + 32);
  objc_msgSend(v4, "warmUpForRequestType:withReply:", v5, v6);

  _Block_object_dispose(v11, 8);
}

void __51__CKContextRequest_warmUpForRequestType_withReply___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  unsigned __int8 *v4;
  unsigned __int8 v5;
  uint64_t v6;
  id v7;

  v3 = a2;
  v4 = (unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32);
  do
    v5 = __ldaxr(v4);
  while (__stlxr(1u, v4));
  if ((v5 & 1) == 0)
  {
    v6 = *(_QWORD *)(a1 + 32);
    if (v6)
    {
      v7 = v3;
      (*(void (**)(void))(v6 + 16))();
      v3 = v7;
    }
  }

}

uint64_t __51__CKContextRequest_warmUpForRequestType_withReply___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

- (void)capabilitiesWithReply:(id)a3
{
  void *v4;
  id v5;
  _QWORD activity_block[5];
  id v7;

  v4 = (void *)objc_msgSend(a3, "copy");
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __42__CKContextRequest_capabilitiesWithReply___block_invoke;
  activity_block[3] = &unk_1E462F040;
  activity_block[4] = self;
  v7 = v4;
  v5 = v4;
  _os_activity_initiate(&dword_1A1AA2000, "ContextRequest capabilitiesWithReply", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __42__CKContextRequest_capabilitiesWithReply___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD v14[4];
  char v15;
  _QWORD v16[4];
  char v17;

  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2810000000;
  v16[3] = &unk_1A1AB4839;
  v17 = 0;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2810000000;
  v14[3] = &unk_1A1AB4839;
  v15 = 0;
  v2 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __42__CKContextRequest_capabilitiesWithReply___block_invoke_2;
  v10[3] = &unk_1E462F130;
  v12 = v16;
  v13 = v14;
  v3 = *(id *)(a1 + 40);
  v10[4] = *(_QWORD *)(a1 + 32);
  v11 = v3;
  v4 = (void *)MEMORY[0x1A1B10ED0](v10);
  +[CKContextXPCClient xpcConnection](CKContextXPCClient, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  v8[1] = 3221225472;
  v8[2] = __42__CKContextRequest_capabilitiesWithReply___block_invoke_4;
  v8[3] = &unk_1E462EFF0;
  v6 = v4;
  v9 = v6;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "capabilitiesForRequestType:withReply:", objc_msgSend(*(id *)(a1 + 32), "type"), v6);

  _Block_object_dispose(v14, 8);
  _Block_object_dispose(v16, 8);
}

void __42__CKContextRequest_capabilitiesWithReply___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  unsigned __int8 *v10;
  unsigned __int8 v11;
  void *v12;
  unsigned __int8 *v13;
  unsigned __int8 v14;
  void *v15;
  _QWORD v16[4];
  id v17;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = (unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32);
  do
    v11 = __ldaxr(v10);
  while (__stlxr(1u, v10));
  if ((v11 & 1) == 0)
  {
    +[CKContextXPCClient isXPCConnectionError:](CKContextXPCClient, "isXPCConnectionError:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
      goto LABEL_9;
    v13 = (unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32);
    do
      v14 = __ldaxr(v13);
    while (__stlxr(1u, v13));
    if ((v14 & 1) != 0)
    {
LABEL_9:
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
    else
    {
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __42__CKContextRequest_capabilitiesWithReply___block_invoke_3;
      v16[3] = &unk_1E462EFF0;
      v17 = *(id *)(a1 + 40);
      objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", v16);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "capabilitiesForRequestType:withReply:", objc_msgSend(*(id *)(a1 + 32), "type"), *(_QWORD *)(a1 + 40));

    }
  }

}

void __42__CKContextRequest_capabilitiesWithReply___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = a2;
  objc_msgSend(v3, "set");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD, id))(v2 + 16))(v2, v5, 0, v4);

}

void __42__CKContextRequest_capabilitiesWithReply___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = a2;
  objc_msgSend(v3, "set");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD, id))(v2 + 16))(v2, v5, 0, v4);

}

+ (void)statusWithReply:(id)a3
{
  void *v3;
  id v4;
  _QWORD activity_block[4];
  id v6;

  v3 = (void *)objc_msgSend(a3, "copy");
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __36__CKContextRequest_statusWithReply___block_invoke;
  activity_block[3] = &unk_1E462F180;
  v6 = v3;
  v4 = v3;
  _os_activity_initiate(&dword_1A1AA2000, "ContextRequest statusWithReply", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __36__CKContextRequest_statusWithReply___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD *v13;
  _QWORD *v14;
  _QWORD v15[4];
  char v16;
  _QWORD v17[4];
  char v18;

  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2810000000;
  v17[3] = &unk_1A1AB4839;
  v18 = 0;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2810000000;
  v15[3] = &unk_1A1AB4839;
  v16 = 0;
  v1 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __36__CKContextRequest_statusWithReply___block_invoke_2;
  v11[3] = &unk_1E462F158;
  v13 = v17;
  v14 = v15;
  v12 = *(id *)(a1 + 32);
  v2 = (void *)MEMORY[0x1A1B10ED0](v11);
  +[CKContextXPCClient xpcConnection](CKContextXPCClient, "xpcConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v1;
  v7 = 3221225472;
  v8 = __36__CKContextRequest_statusWithReply___block_invoke_4;
  v9 = &unk_1E462EFF0;
  v4 = v2;
  v10 = v4;
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", &v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "statusWithReply:", v4, v6, v7, v8, v9);

  _Block_object_dispose(v15, 8);
  _Block_object_dispose(v17, 8);
}

void __36__CKContextRequest_statusWithReply___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  unsigned __int8 *v7;
  unsigned __int8 v8;
  void *v9;
  unsigned __int8 *v10;
  unsigned __int8 v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = (unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32);
  do
    v8 = __ldaxr(v7);
  while (__stlxr(1u, v7));
  if ((v8 & 1) == 0)
  {
    +[CKContextXPCClient isXPCConnectionError:](CKContextXPCClient, "isXPCConnectionError:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
      goto LABEL_9;
    v10 = (unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32);
    do
      v11 = __ldaxr(v10);
    while (__stlxr(1u, v10));
    if ((v11 & 1) != 0)
    {
LABEL_9:
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
    else
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __36__CKContextRequest_statusWithReply___block_invoke_3;
      v13[3] = &unk_1E462EFF0;
      v14 = *(id *)(a1 + 32);
      objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v13);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "statusWithReply:", *(_QWORD *)(a1 + 32));

    }
  }

}

uint64_t __36__CKContextRequest_statusWithReply___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __36__CKContextRequest_statusWithReply___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __34__CKContextRequest_initWithCoder___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)initWithCoder__x;
  initWithCoder__x = v2;

}

void __34__CKContextRequest_initWithCoder___block_invoke_2()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)initWithCoder__x_49;
  initWithCoder__x_49 = v2;

}

void __34__CKContextRequest_initWithCoder___block_invoke_3()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)initWithCoder__x_54;
  initWithCoder__x_54 = v2;

}

void __34__CKContextRequest_initWithCoder___block_invoke_4()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)initWithCoder__x_59;
  initWithCoder__x_59 = v2;

}

void __34__CKContextRequest_initWithCoder___block_invoke_5()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v4, 3);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1, v4, v5);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)initWithCoder__x_65;
  initWithCoder__x_65 = v2;

}

void __34__CKContextRequest_initWithCoder___block_invoke_6()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)initWithCoder__x_71;
  initWithCoder__x_71 = v2;

}

void __34__CKContextRequest_initWithCoder___block_invoke_7()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v4, 3);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1, v4, v5);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)initWithCoder__x_77;
  initWithCoder__x_77 = v2;

}

void __34__CKContextRequest_initWithCoder___block_invoke_8()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)initWithCoder__x_83;
  initWithCoder__x_83 = v2;

}

void __34__CKContextRequest_initWithCoder___block_invoke_9()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)initWithCoder__x_88;
  initWithCoder__x_88 = v2;

}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[CKContextDonationItem text](self, "text");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 31 * objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  CKContextRequest *v4;
  uint64_t v5;
  BOOL v6;
  CKContextRequest *v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
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
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  double donationTimeout;
  double v32;
  _BOOL4 includePartsOfSpeech;
  void *v35;
  NSSet *allowedTopicTypeTags;
  void *v37;
  NSArray *donorBundleIdentifiers;
  void *v39;
  NSOrderedSet *desiredLanguageTags;
  void *v41;
  NSDictionary *itemIds;
  void *v43;
  NSArray *urls;
  void *v45;
  NSNumber *overrideBlendGamma;
  void *v47;
  NSNumber *overrideBlendBeta;
  void *v49;
  NSNumber *overrideBlendAlpha;
  void *v51;
  unint64_t type;
  _BOOL4 debug;
  _BOOL4 dontSkip;
  _BOOL4 incPending;
  _BOOL4 timing;
  _BOOL4 overrideEnableCoreNLPTagging;
  _BOOL4 includeHigherLevelTopics;
  _BOOL4 includeStructuredExtractionResults;
  _BOOL4 textIsRaw;
  _BOOL4 includeRequestInResponse;
  unsigned int topk;
  int64_t maxConstellationTopics;
  int overrideConstellationMinCount;
  int overrideConstellationMinWeight;
  unint64_t fingerprintMax;
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

  v4 = (CKContextRequest *)a3;
  if (self == v4)
  {
    v6 = 1;
    goto LABEL_84;
  }
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    v7 = v4;
    v8 = -[CKContextRequest hash](self, "hash");
    if (v8 != -[CKContextRequest hash](v7, "hash"))
    {
      v6 = 0;
LABEL_83:

      goto LABEL_84;
    }
    -[CKContextDonationItem text](self, "text");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKContextDonationItem text](v7, "text");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v9)
    {
      if ((objc_msgSend(v9, "isEqual:", v10) & 1) != 0)
        goto LABEL_8;
    }
    else if (!v10)
    {
LABEL_8:
      -[CKContextDonationItem debugText](self, "debugText");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKContextDonationItem debugText](v7, "debugText");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v13;
      if (v12)
      {
        if ((objc_msgSend(v12, "isEqual:", v13) & 1) != 0)
          goto LABEL_10;
      }
      else if (!v13)
      {
LABEL_10:
        -[CKContextDonationItem debugUrlString](self, "debugUrlString");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKContextDonationItem debugUrlString](v7, "debugUrlString");
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = (void *)v16;
        if (v15)
        {
          if ((objc_msgSend(v15, "isEqual:", v16) & 1) != 0)
            goto LABEL_12;
        }
        else if (!v16)
        {
LABEL_12:
          -[CKContextDonationItem title](self, "title");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[CKContextDonationItem title](v7, "title");
          v19 = objc_claimAutoreleasedReturnValue();
          v76 = (void *)v19;
          if (v18)
          {
            if ((objc_msgSend(v18, "isEqual:", v19) & 1) != 0)
              goto LABEL_14;
          }
          else if (!v19)
          {
LABEL_14:
            v75 = v18;
            -[CKContextDonationItem contentAuthor](self, "contentAuthor");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[CKContextDonationItem contentAuthor](v7, "contentAuthor");
            v21 = objc_claimAutoreleasedReturnValue();
            v73 = (void *)v21;
            v74 = v20;
            if (v20)
            {
              if ((objc_msgSend(v20, "isEqual:", v21) & 1) != 0)
                goto LABEL_16;
            }
            else if (!v21)
            {
LABEL_16:
              -[CKContextDonationItem contentDescription](self, "contentDescription");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              -[CKContextDonationItem contentDescription](v7, "contentDescription");
              v23 = objc_claimAutoreleasedReturnValue();
              v71 = (void *)v23;
              v72 = v22;
              if (v22)
              {
                if ((objc_msgSend(v22, "isEqual:", v23) & 1) != 0)
                  goto LABEL_18;
              }
              else if (!v23)
              {
LABEL_18:
                -[CKContextDonationItem contentKeywords](self, "contentKeywords");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                -[CKContextDonationItem contentKeywords](v7, "contentKeywords");
                v25 = objc_claimAutoreleasedReturnValue();
                v69 = (void *)v25;
                v70 = v24;
                if (v24)
                {
                  if ((objc_msgSend(v24, "isEqual:", v25) & 1) != 0)
                    goto LABEL_20;
                }
                else if (!v25)
                {
LABEL_20:
                  -[CKContextDonationItem languageTag](self, "languageTag");
                  v26 = objc_claimAutoreleasedReturnValue();
                  -[CKContextDonationItem languageTag](v7, "languageTag");
                  v27 = objc_claimAutoreleasedReturnValue();
                  v28 = (void *)v27;
                  v68 = (void *)v26;
                  if (v26)
                  {
                    v29 = (void *)v26;
                    v30 = v28;
                    if ((objc_msgSend(v29, "isEqual:", v28) & 1) == 0)
                      goto LABEL_74;
                  }
                  else
                  {
                    v30 = (void *)v27;
                    if (v27)
                    {
LABEL_74:
                      v6 = 0;
LABEL_75:

                      goto LABEL_76;
                    }
                  }
                  type = self->_type;
                  if (type != -[CKContextRequest type](v7, "type"))
                    goto LABEL_74;
                  debug = self->_debug;
                  if (debug != -[CKContextRequest debug](v7, "debug"))
                    goto LABEL_74;
                  dontSkip = self->_dontSkip;
                  if (dontSkip != -[CKContextRequest dontSkip](v7, "dontSkip"))
                    goto LABEL_74;
                  incPending = self->_incPending;
                  if (incPending != -[CKContextRequest incPending](v7, "incPending"))
                    goto LABEL_74;
                  timing = self->_timing;
                  if (timing != -[CKContextRequest timing](v7, "timing"))
                    goto LABEL_74;
                  overrideEnableCoreNLPTagging = self->_overrideEnableCoreNLPTagging;
                  if (overrideEnableCoreNLPTagging != -[CKContextRequest overrideEnableCoreNLPTagging](v7, "overrideEnableCoreNLPTagging"))goto LABEL_74;
                  includeHigherLevelTopics = self->_includeHigherLevelTopics;
                  if (includeHigherLevelTopics != -[CKContextRequest includeHigherLevelTopics](v7, "includeHigherLevelTopics"))goto LABEL_74;
                  includeStructuredExtractionResults = self->_includeStructuredExtractionResults;
                  if (includeStructuredExtractionResults != -[CKContextRequest includeStructuredExtractionResults](v7, "includeStructuredExtractionResults"))goto LABEL_74;
                  textIsRaw = self->_textIsRaw;
                  if (textIsRaw != -[CKContextRequest textIsRaw](v7, "textIsRaw"))
                    goto LABEL_74;
                  includeRequestInResponse = self->_includeRequestInResponse;
                  if (includeRequestInResponse != -[CKContextRequest includeRequestInResponse](v7, "includeRequestInResponse"))goto LABEL_74;
                  topk = self->_topk;
                  if (topk != -[CKContextRequest topk](v7, "topk"))
                    goto LABEL_74;
                  maxConstellationTopics = self->_maxConstellationTopics;
                  if (maxConstellationTopics != -[CKContextRequest maxConstellationTopics](v7, "maxConstellationTopics"))goto LABEL_74;
                  overrideConstellationMinCount = self->_overrideConstellationMinCount;
                  if (overrideConstellationMinCount != -[CKContextRequest overrideConstellationMinCount](v7, "overrideConstellationMinCount"))goto LABEL_74;
                  overrideConstellationMinWeight = self->_overrideConstellationMinWeight;
                  if (overrideConstellationMinWeight != -[CKContextRequest overrideConstellationMinWeight](v7, "overrideConstellationMinWeight"))goto LABEL_74;
                  fingerprintMax = self->_fingerprintMax;
                  if (fingerprintMax != -[CKContextRequest fingerprintMax](v7, "fingerprintMax"))
                    goto LABEL_74;
                  donationTimeout = self->_donationTimeout;
                  -[CKContextRequest donationTimeout](v7, "donationTimeout");
                  if (donationTimeout != v32)
                    goto LABEL_74;
                  overrideBlendAlpha = self->_overrideBlendAlpha;
                  -[CKContextRequest overrideBlendAlpha](v7, "overrideBlendAlpha");
                  v67 = (void *)objc_claimAutoreleasedReturnValue();
                  if (overrideBlendAlpha)
                  {
                    if ((-[NSNumber isEqual:](overrideBlendAlpha, "isEqual:", v67) & 1) != 0)
                      goto LABEL_57;
                  }
                  else if (!v67)
                  {
LABEL_57:
                    overrideBlendBeta = self->_overrideBlendBeta;
                    -[CKContextRequest overrideBlendBeta](v7, "overrideBlendBeta");
                    v51 = (void *)objc_claimAutoreleasedReturnValue();
                    if (overrideBlendBeta)
                    {
                      if ((-[NSNumber isEqual:](overrideBlendBeta, "isEqual:", v51) & 1) != 0)
                        goto LABEL_59;
                    }
                    else if (!v51)
                    {
LABEL_59:
                      overrideBlendGamma = self->_overrideBlendGamma;
                      -[CKContextRequest overrideBlendGamma](v7, "overrideBlendGamma");
                      v49 = (void *)objc_claimAutoreleasedReturnValue();
                      if (overrideBlendGamma)
                      {
                        if ((-[NSNumber isEqual:](overrideBlendGamma, "isEqual:", v49) & 1) != 0)
                          goto LABEL_61;
                      }
                      else if (!v49)
                      {
LABEL_61:
                        urls = self->_urls;
                        -[CKContextRequest urls](v7, "urls");
                        v47 = (void *)objc_claimAutoreleasedReturnValue();
                        if (urls)
                        {
                          if ((-[NSArray isEqual:](urls, "isEqual:", v47) & 1) != 0)
                            goto LABEL_63;
                        }
                        else if (!v47)
                        {
LABEL_63:
                          itemIds = self->_itemIds;
                          -[CKContextRequest itemIds](v7, "itemIds");
                          v45 = (void *)objc_claimAutoreleasedReturnValue();
                          if (itemIds)
                          {
                            if ((-[NSDictionary isEqual:](itemIds, "isEqual:", v45) & 1) != 0)
                              goto LABEL_65;
                          }
                          else if (!v45)
                          {
LABEL_65:
                            desiredLanguageTags = self->_desiredLanguageTags;
                            -[CKContextRequest desiredLanguageTags](v7, "desiredLanguageTags");
                            v43 = (void *)objc_claimAutoreleasedReturnValue();
                            if (desiredLanguageTags)
                            {
                              if ((-[NSOrderedSet isEqual:](desiredLanguageTags, "isEqual:", v43) & 1) != 0)
                                goto LABEL_67;
                            }
                            else if (!v43)
                            {
LABEL_67:
                              donorBundleIdentifiers = self->_donorBundleIdentifiers;
                              -[CKContextRequest donorBundleIdentifiers](v7, "donorBundleIdentifiers");
                              v41 = (void *)objc_claimAutoreleasedReturnValue();
                              if (donorBundleIdentifiers)
                              {
                                if ((-[NSArray isEqual:](donorBundleIdentifiers, "isEqual:", v41) & 1) != 0)
                                  goto LABEL_69;
                              }
                              else if (!v41)
                              {
LABEL_69:
                                allowedTopicTypeTags = self->_allowedTopicTypeTags;
                                -[CKContextRequest allowedTopicTypeTags](v7, "allowedTopicTypeTags");
                                v39 = (void *)objc_claimAutoreleasedReturnValue();
                                if (allowedTopicTypeTags)
                                {
                                  if ((-[NSSet isEqual:](allowedTopicTypeTags, "isEqual:", v39) & 1) != 0)
                                    goto LABEL_71;
                                }
                                else if (!v39)
                                {
LABEL_71:
                                  -[CKContextRequest preferredSceneIdentifiers](v7, "preferredSceneIdentifiers", self->_preferredSceneIdentifiers);
                                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                                  if (v35)
                                  {
                                    if ((objc_msgSend(v35, "isEqual:", v37) & 1) != 0)
                                    {
LABEL_73:
                                      includePartsOfSpeech = self->_includePartsOfSpeech;
                                      v6 = includePartsOfSpeech == -[CKContextRequest includePartsOfSpeech](v7, "includePartsOfSpeech");
LABEL_103:

                                      goto LABEL_104;
                                    }
                                  }
                                  else if (!v37)
                                  {
                                    goto LABEL_73;
                                  }
                                  v6 = 0;
                                  goto LABEL_103;
                                }
                                v6 = 0;
LABEL_104:

                                goto LABEL_105;
                              }
                              v6 = 0;
LABEL_105:

                              goto LABEL_106;
                            }
                            v6 = 0;
LABEL_106:

                            goto LABEL_107;
                          }
                          v6 = 0;
LABEL_107:

                          goto LABEL_108;
                        }
                        v6 = 0;
LABEL_108:

                        goto LABEL_109;
                      }
                      v6 = 0;
LABEL_109:

                      goto LABEL_110;
                    }
                    v6 = 0;
LABEL_110:

                    goto LABEL_111;
                  }
                  v6 = 0;
LABEL_111:

                  goto LABEL_75;
                }
                v6 = 0;
LABEL_76:

                goto LABEL_77;
              }
              v6 = 0;
LABEL_77:

              goto LABEL_78;
            }
            v6 = 0;
LABEL_78:

            v18 = v75;
            goto LABEL_79;
          }
          v6 = 0;
LABEL_79:

          goto LABEL_80;
        }
        v6 = 0;
LABEL_80:

        goto LABEL_81;
      }
      v6 = 0;
LABEL_81:

      goto LABEL_82;
    }
    v6 = 0;
LABEL_82:

    goto LABEL_83;
  }
  v6 = 0;
LABEL_84:

  return v6;
}

- (CKContextRequest)initWithText:(id)a3
{
  id v4;
  CKContextRequest *v5;
  CKContextRequest *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CKContextRequest;
  v5 = -[CKContextRequest init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    -[CKContextRequest setText:](v5, "setText:", v4);
    v6->_type = _defaultRequestType;
  }

  return v6;
}

- (void)executeWithReply:(id)a3
{
  void *v4;
  id v5;
  _QWORD activity_block[5];
  id v7;

  v4 = (void *)objc_msgSend(a3, "copy");
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __37__CKContextRequest_executeWithReply___block_invoke;
  activity_block[3] = &unk_1E462F090;
  activity_block[4] = self;
  v7 = v4;
  v5 = v4;
  _os_activity_initiate(&dword_1A1AA2000, "ContextRequest executeWithReply", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

uint64_t __37__CKContextRequest_executeWithReply___block_invoke(uint64_t a1)
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    __37__CKContextRequest_executeWithReply___block_invoke_cold_1(a1);
  return objc_msgSend(*(id *)(a1 + 32), "_executeWithReply:", *(_QWORD *)(a1 + 40));
}

- (id)execute
{
  uint64_t v3;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v3 = mach_absolute_time();
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__0;
  v19 = __Block_byref_object_dispose__0;
  v20 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __27__CKContextRequest_execute__block_invoke;
  v14[3] = &unk_1E462F318;
  v14[4] = self;
  v14[5] = &v15;
  _os_activity_initiate(&dword_1A1AA2000, "ContextRequest execute", OS_ACTIVITY_FLAG_DEFAULT, v14);
  +[CKContextClient timeIntervalBetweenMachTime:andMachTime:](CKContextClient, "timeIntervalBetweenMachTime:andMachTime:", mach_absolute_time(), v3);
  v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
  if (v4)
    -[CKContextRequest execute].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
  v12 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v12;
}

void __27__CKContextRequest_execute__block_invoke(uint64_t a1)
{
  uint64_t v2;
  CKContextResponse *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  CKContextResponse *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  _QWORD v21[4];
  __int128 v22;

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    __37__CKContextRequest_executeWithReply___block_invoke_cold_1(a1);
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "tryAcquireServiceSemaphoreNeedsIncPending:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 128) == 0);
  if (v2 != 2)
  {
    if (v2)
    {
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 128) = 1;
    }
    else
    {
      v3 = [CKContextResponse alloc];
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.context"), 6, 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = -[CKContextResponse initWithError:requestType:](v3, "initWithError:requestType:", v4, objc_msgSend(*(id *)(a1 + 32), "type"));
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v7 = *(void **)(v6 + 40);
      *(_QWORD *)(v6 + 40) = v5;

    }
  }
  v8 = a1 + 40;
  v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (!v9)
  {
    +[CKContextXPCClient xpcConnection](CKContextXPCClient, "xpcConnection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __27__CKContextRequest_execute__block_invoke_103;
    v21[3] = &unk_1E462F2F0;
    v22 = *(_OWORD *)(a1 + 32);
    objc_msgSend(v10, "synchronousRemoteObjectProxyWithErrorHandler:", v21);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v11;
    v20[1] = 3221225472;
    v20[2] = __27__CKContextRequest_execute__block_invoke_2;
    v20[3] = &unk_1E462F2C8;
    v13 = *(_QWORD *)(a1 + 32);
    v20[4] = *(_QWORD *)(a1 + 40);
    objc_msgSend(v12, "findResultsForRequest:withReply:", v13, v20);

    v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (!v9)
    {
      v14 = [CKContextResponse alloc];
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.context"), 8, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[CKContextResponse initWithError:requestType:](v14, "initWithError:requestType:", v15, objc_msgSend(*(id *)(a1 + 32), "type"));
      v17 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v18 = *(void **)(v17 + 40);
      *(_QWORD *)(v17 + 40) = v16;

      v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "_postProcessResponse:", v9);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "error");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      __27__CKContextRequest_execute__block_invoke_cold_1(v8);
  }
}

void __27__CKContextRequest_execute__block_invoke_103(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  CKContextResponse *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v3;
    _os_log_impl(&dword_1A1AA2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Error in execute: %@", buf, 0xCu);
  }
  +[CKContextXPCClient isXPCConnectionError:](CKContextXPCClient, "isXPCConnectionError:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_105);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __27__CKContextRequest_execute__block_invoke_106;
    v11[3] = &unk_1E462F2C8;
    v7 = *(_QWORD *)(a1 + 32);
    v11[4] = *(_QWORD *)(a1 + 40);
    objc_msgSend(v6, "findResultsForRequest:withReply:", v7, v11);

  }
  v8 = -[CKContextResponse initWithError:requestType:]([CKContextResponse alloc], "initWithError:requestType:", v3, objc_msgSend(*(id *)(a1 + 32), "type"));
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

void __27__CKContextRequest_execute__block_invoke_104()
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __27__CKContextRequest_execute__block_invoke_104_cold_1();
}

void __27__CKContextRequest_execute__block_invoke_106(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __27__CKContextRequest_execute__block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)_postProcessResponse:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  int v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "code");
    if (v6 == 7 || v6 == 4)
    {
      v7 = -[CKContextRequest type](self, "type");
      if (v7 == 1 || v7 == 15 || -[CKContextRequest type](self, "type") == 10)
      {
        objc_msgSend(v5, "domain");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.siri.context"));

        if (v9)
          objc_msgSend(v10, "setError:", 0);
      }
    }
  }

}

- (void)_executeWithReply:(id)a3
{
  id v4;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  id v8;
  void (**v9)(_QWORD, _QWORD);
  void (**v10)(_QWORD, _QWORD);
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  CKContextResponse *v16;
  void *v17;
  CKContextResponse *v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[5];
  id v22;
  _QWORD *v23;
  _QWORD *v24;
  _QWORD v25[4];
  char v26;
  _QWORD v27[4];
  char v28;
  _QWORD v29[5];
  id v30;
  uint64_t v31;

  v4 = a3;
  v5 = mach_absolute_time();
  v6 = -[CKContextClient tryAcquireServiceSemaphoreNeedsIncPending:](self->_client, "tryAcquireServiceSemaphoreNeedsIncPending:", !self->_incPending);
  v7 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __38__CKContextRequest__executeWithReply___block_invoke;
  v29[3] = &unk_1E462F340;
  v31 = v5;
  v29[4] = self;
  v8 = v4;
  v30 = v8;
  v9 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A1B10ED0](v29);
  v10 = v9;
  if (v6)
  {
    v27[0] = 0;
    v27[1] = v27;
    v27[2] = 0x2810000000;
    v27[3] = &unk_1A1AB4839;
    v28 = 0;
    v25[0] = 0;
    v25[1] = v25;
    v25[2] = 0x2810000000;
    v25[3] = &unk_1A1AB4839;
    v26 = 0;
    v21[0] = v7;
    v21[1] = 3221225472;
    v21[2] = __38__CKContextRequest__executeWithReply___block_invoke_111;
    v21[3] = &unk_1E462F390;
    v23 = v27;
    v24 = v25;
    v11 = v9;
    v21[4] = self;
    v22 = v11;
    v12 = (void *)MEMORY[0x1A1B10ED0](v21);
    +[CKContextXPCClient xpcConnection](CKContextXPCClient, "xpcConnection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v7;
    v19[1] = 3221225472;
    v19[2] = __38__CKContextRequest__executeWithReply___block_invoke_3;
    v19[3] = &unk_1E462F368;
    v14 = v12;
    v19[4] = self;
    v20 = v14;
    objc_msgSend(v13, "remoteObjectProxyWithErrorHandler:", v19);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "findResultsForRequest:withReply:", self, v11);

    _Block_object_dispose(v25, 8);
    _Block_object_dispose(v27, 8);
  }
  else
  {
    v16 = [CKContextResponse alloc];
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.context"), 6, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[CKContextResponse initWithError:requestType:](v16, "initWithError:requestType:", v17, -[CKContextRequest type](self, "type"));

    ((void (**)(_QWORD, CKContextResponse *))v10)[2](v10, v18);
  }

}

void __38__CKContextRequest__executeWithReply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v3 = a2;
  +[CKContextClient timeIntervalBetweenMachTime:andMachTime:](CKContextClient, "timeIntervalBetweenMachTime:andMachTime:", mach_absolute_time(), *(_QWORD *)(a1 + 48));
  v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
  if (v4)
    __38__CKContextRequest__executeWithReply___block_invoke_cold_2(v4, v5, v6, v7, v8, v9, v10, v11);
  objc_msgSend(*(id *)(a1 + 32), "_postProcessResponse:", v3);
  objc_msgSend(v3, "error");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __38__CKContextRequest__executeWithReply___block_invoke_cold_1(v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __38__CKContextRequest__executeWithReply___block_invoke_111(uint64_t a1, void *a2)
{
  id v3;
  unsigned __int8 *v4;
  unsigned __int8 v5;
  void *v6;
  unsigned __int8 *v7;
  unsigned __int8 v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  uint64_t v15;
  id v16;

  v3 = a2;
  v4 = (unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32);
  do
    v5 = __ldaxr(v4);
  while (__stlxr(1u, v4));
  if ((v5 & 1) == 0)
  {
    +[CKContextXPCClient xpcConnection](CKContextXPCClient, "xpcConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
      goto LABEL_9;
    v7 = (unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32);
    do
      v8 = __ldaxr(v7);
    while (__stlxr(1u, v7));
    if ((v8 & 1) != 0)
    {
LABEL_9:
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
    else
    {
      v11 = MEMORY[0x1E0C809B0];
      v12 = 3221225472;
      v13 = __38__CKContextRequest__executeWithReply___block_invoke_2;
      v14 = &unk_1E462F368;
      v9 = *(id *)(a1 + 40);
      v15 = *(_QWORD *)(a1 + 32);
      v16 = v9;
      objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", &v11);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "findResultsForRequest:withReply:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v11, v12, v13, v14);

    }
  }

}

void __38__CKContextRequest__executeWithReply___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  CKContextResponse *v5;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  v5 = -[CKContextResponse initWithError:requestType:]([CKContextResponse alloc], "initWithError:requestType:", v4, objc_msgSend(*(id *)(a1 + 32), "type"));

  (*(void (**)(uint64_t, CKContextResponse *))(v3 + 16))(v3, v5);
}

void __38__CKContextRequest__executeWithReply___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  CKContextResponse *v5;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  v5 = -[CKContextResponse initWithError:requestType:]([CKContextResponse alloc], "initWithError:requestType:", v4, objc_msgSend(*(id *)(a1 + 32), "type"));

  (*(void (**)(uint64_t, CKContextResponse *))(v3 + 16))(v3, v5);
}

uint64_t __59__CKContextRequest__executeCategorizationRequestWithReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)requestWithText:(id)a3
{
  id v3;
  CKContextRequest *v4;

  v3 = a3;
  v4 = -[CKContextRequest initWithText:]([CKContextRequest alloc], "initWithText:", v3);

  return v4;
}

+ (BOOL)pingService
{
  int v2;
  char v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  char v7;
  BOOL v8;
  _QWORD v10[5];
  _QWORD v11[5];
  int v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v2 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v3 = 1;
  v4 = MEMORY[0x1E0C809B0];
  do
  {
    +[CKContextXPCClient xpcConnection](CKContextXPCClient, "xpcConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v4;
    v11[1] = 3221225472;
    v11[2] = __31__CKContextRequest_pingService__block_invoke;
    v11[3] = &unk_1E462F3E0;
    v12 = v2;
    v11[4] = &v17;
    objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
    v6 = objc_claimAutoreleasedReturnValue();
    v10[0] = v4;
    v10[1] = 3221225472;
    v10[2] = __31__CKContextRequest_pingService__block_invoke_112;
    v10[3] = &unk_1E462F408;
    v10[4] = &v13;
    objc_msgSend((id)v6, "pingServiceWithReply:", v10);

    LOBYTE(v6) = *((_BYTE *)v14 + 24) == 0;
    v7 = v6 & v3;
    v2 = 1;
    v3 = 0;
  }
  while ((v7 & 1) != 0);
  v8 = *((_BYTE *)v18 + 24) == 0;
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
  return v8;
}

void __31__CKContextRequest_pingService__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;

  v3 = a2;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 == (void *)*MEMORY[0x1E0CB28A8])
  {
    v5 = *(_DWORD *)(a1 + 40);

    if (!v5)
    {
      +[CKContextXPCClient invalidateXpcConnection](CKContextXPCClient, "invalidateXpcConnection");
      goto LABEL_6;
    }
  }
  else
  {

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __31__CKContextRequest_pingService__block_invoke_cold_1();
LABEL_6:

}

uint64_t __31__CKContextRequest_pingService__block_invoke_112(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  return result;
}

+ (BOOL)shutdownService
{
  int v2;
  char v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  char v7;
  BOOL v8;
  _QWORD v10[5];
  _QWORD v11[5];
  int v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v2 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v3 = 1;
  v4 = MEMORY[0x1E0C809B0];
  do
  {
    +[CKContextXPCClient xpcConnection](CKContextXPCClient, "xpcConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v4;
    v11[1] = 3221225472;
    v11[2] = __35__CKContextRequest_shutdownService__block_invoke;
    v11[3] = &unk_1E462F3E0;
    v12 = v2;
    v11[4] = &v17;
    objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
    v6 = objc_claimAutoreleasedReturnValue();
    v10[0] = v4;
    v10[1] = 3221225472;
    v10[2] = __35__CKContextRequest_shutdownService__block_invoke_113;
    v10[3] = &unk_1E462F408;
    v10[4] = &v13;
    objc_msgSend((id)v6, "shutdownServiceWithReply:", v10);

    LOBYTE(v6) = *((_BYTE *)v14 + 24) == 0;
    v7 = v6 & v3;
    v2 = 1;
    v3 = 0;
  }
  while ((v7 & 1) != 0);
  v8 = *((_BYTE *)v18 + 24) == 0;
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
  return v8;
}

void __35__CKContextRequest_shutdownService__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;

  v3 = a2;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 == (void *)*MEMORY[0x1E0CB28A8])
  {
    v5 = *(_DWORD *)(a1 + 40);

    if (!v5)
    {
      +[CKContextXPCClient invalidateXpcConnection](CKContextXPCClient, "invalidateXpcConnection");
      goto LABEL_6;
    }
  }
  else
  {

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __35__CKContextRequest_shutdownService__block_invoke_cold_1();
LABEL_6:

}

void __35__CKContextRequest_shutdownService__block_invoke_113(uint64_t a1)
{
  uint8_t v2[16];

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_1A1AA2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "shutdown returned OK", v2, 2u);
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
}

+ (void)logResultsShownForResponseId:(id)a3 shown:(unint64_t)a4 couldHaveShown:(unint64_t)a5 topicIds:(id)a6 serverOverride:(BOOL)a7 inputLength:(unint64_t)a8 requestType:(unint64_t)a9 logType:(unint64_t)a10
{
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  BOOL v28;

  v15 = a3;
  v16 = a6;
  dispatch_get_global_queue(9, 0);
  v17 = objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __126__CKContextRequest_logResultsShownForResponseId_shown_couldHaveShown_topicIds_serverOverride_inputLength_requestType_logType___block_invoke;
  v20[3] = &unk_1E462F450;
  v23 = a4;
  v24 = a5;
  v21 = v15;
  v22 = v16;
  v28 = a7;
  v25 = a8;
  v26 = a9;
  v27 = a10;
  v18 = v16;
  v19 = v15;
  dispatch_async(v17, v20);

}

void __126__CKContextRequest_logResultsShownForResponseId_shown_couldHaveShown_topicIds_serverOverride_inputLength_requestType_logType___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  +[CKContextXPCClient xpcConnection](CKContextXPCClient, "xpcConnection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_114);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logResultsShownForResponseId:shown:couldHaveShown:topicIds:serverOverride:inputLength:requestType:logType:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 88), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80));

}

void __126__CKContextRequest_logResultsShownForResponseId_shown_couldHaveShown_topicIds_serverOverride_inputLength_requestType_logType___block_invoke_2()
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __126__CKContextRequest_logResultsShownForResponseId_shown_couldHaveShown_topicIds_serverOverride_inputLength_requestType_logType___block_invoke_2_cold_1();
}

+ (void)logEngagementForResponseId:(id)a3 result:(id)a4 rank:(unint64_t)a5 inputLength:(unint64_t)a6 completionLength:(unint64_t)a7 requestType:(unint64_t)a8 logType:(unint64_t)a9
{
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  id v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;

  v14 = a3;
  v15 = a4;
  dispatch_get_global_queue(9, 0);
  v16 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __108__CKContextRequest_logEngagementForResponseId_result_rank_inputLength_completionLength_requestType_logType___block_invoke;
  block[3] = &unk_1E462F4C0;
  v20 = v14;
  v21 = v15;
  v22 = a5;
  v23 = a6;
  v24 = a7;
  v25 = a8;
  v26 = a9;
  v17 = v15;
  v18 = v14;
  dispatch_async(v16, block);

}

void __108__CKContextRequest_logEngagementForResponseId_result_rank_inputLength_completionLength_requestType_logType___block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(_QWORD *, void *);
  void *v8;
  id v9;
  id v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  +[CKContextXPCClient xpcConnection](CKContextXPCClient, "xpcConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v6 = 3221225472;
  v7 = __108__CKContextRequest_logEngagementForResponseId_result_rank_inputLength_completionLength_requestType_logType___block_invoke_2;
  v8 = &unk_1E462F498;
  v9 = *(id *)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  v3 = *(_OWORD *)(a1 + 64);
  v11 = *(_OWORD *)(a1 + 48);
  v12 = v3;
  v13 = *(_QWORD *)(a1 + 80);
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", &v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logEngagementForResponseId:result:rank:inputLength:completionLength:requestType:logType:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), v5, v6, v7, v8);

}

void __108__CKContextRequest_logEngagementForResponseId_result_rank_inputLength_completionLength_requestType_logType___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __108__CKContextRequest_logEngagementForResponseId_result_rank_inputLength_completionLength_requestType_logType___block_invoke_2_cold_1();
  +[CKContextXPCClient isXPCConnectionError:](CKContextXPCClient, "isXPCConnectionError:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_116);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "logEngagementForResponseId:result:rank:inputLength:completionLength:requestType:logType:", a1[4], a1[5], a1[6], a1[7], a1[8], a1[9], a1[10]);

  }
}

void __108__CKContextRequest_logEngagementForResponseId_result_rank_inputLength_completionLength_requestType_logType___block_invoke_115()
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __108__CKContextRequest_logEngagementForResponseId_result_rank_inputLength_completionLength_requestType_logType___block_invoke_115_cold_1();
}

+ (void)logTransactionSuccessfulForResponseId:(id)a3 inputLength:(unint64_t)a4 completionLength:(unint64_t)a5 requestType:(unint64_t)a6 logType:(unint64_t)a7
{
  id v11;
  NSObject *v12;
  id v13;
  _QWORD block[4];
  id v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;

  v11 = a3;
  dispatch_get_global_queue(9, 0);
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __107__CKContextRequest_logTransactionSuccessfulForResponseId_inputLength_completionLength_requestType_logType___block_invoke;
  block[3] = &unk_1E462F530;
  v15 = v11;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v13 = v11;
  dispatch_async(v12, block);

}

void __107__CKContextRequest_logTransactionSuccessfulForResponseId_inputLength_completionLength_requestType_logType___block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  __int128 v7;
  __int128 v8;

  +[CKContextXPCClient xpcConnection](CKContextXPCClient, "xpcConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __107__CKContextRequest_logTransactionSuccessfulForResponseId_inputLength_completionLength_requestType_logType___block_invoke_2;
  v5[3] = &unk_1E462F508;
  v6 = *(id *)(a1 + 32);
  v3 = *(_OWORD *)(a1 + 56);
  v7 = *(_OWORD *)(a1 + 40);
  v8 = v3;
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logTransactionSuccessfulForResponseId:inputLength:completionLength:requestType:logType:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

}

void __107__CKContextRequest_logTransactionSuccessfulForResponseId_inputLength_completionLength_requestType_logType___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __107__CKContextRequest_logTransactionSuccessfulForResponseId_inputLength_completionLength_requestType_logType___block_invoke_2_cold_1();
  +[CKContextXPCClient isXPCConnectionError:](CKContextXPCClient, "isXPCConnectionError:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_118);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "logTransactionSuccessfulForResponseId:inputLength:completionLength:requestType:logType:", a1[4], a1[5], a1[6], a1[7], a1[8]);

  }
}

void __107__CKContextRequest_logTransactionSuccessfulForResponseId_inputLength_completionLength_requestType_logType___block_invoke_117()
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __107__CKContextRequest_logTransactionSuccessfulForResponseId_inputLength_completionLength_requestType_logType___block_invoke_117_cold_1();
}

- (void)setText:(id)a3
{
  id v4;
  unint64_t v5;
  _BOOL4 v6;
  NSObject *v7;
  const char *v8;
  objc_super v9;
  uint8_t buf[16];

  v4 = a3;
  v5 = -[CKContextRequest type](self, "type");
  if ((v5 == 15 || v5 == 1) && !objc_msgSend(v4, "length"))
  {
    v6 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO);
    if (v4)
    {
      if (v6)
      {
        *(_WORD *)buf = 0;
        v7 = MEMORY[0x1E0C81028];
        v8 = "Tried to set empty request.text";
LABEL_9:
        _os_log_impl(&dword_1A1AA2000, v7, OS_LOG_TYPE_INFO, v8, buf, 2u);
      }
    }
    else if (v6)
    {
      *(_WORD *)buf = 0;
      v7 = MEMORY[0x1E0C81028];
      v8 = "Tried to set nil request.text";
      goto LABEL_9;
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)CKContextRequest;
  -[CKContextDonationItem setText:](&v9, sel_setText_, v4);

}

- (BOOL)isRequestingContentFromActiveApplications
{
  void *v3;
  BOOL result;

  result = (-[CKContextRequest type](self, "type") == 10
         || -[CKContextRequest type](self, "type") == 16
         || -[CKContextRequest type](self, "type") == 20)
        && (-[CKContextDonationItem text](self, "text"),
            v3 = (void *)objc_claimAutoreleasedReturnValue(),
            v3,
            !v3)
        && -[NSArray count](self->_urls, "count") == 0;
  return result;
}

+ (void)requestServiceSemaphoreWithReply:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  +[CKContextXPCClient xpcConnection](CKContextXPCClient, "xpcConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_121);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "semaphoreWithReply:", v3);

}

void __53__CKContextRequest_requestServiceSemaphoreWithReply___block_invoke()
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __53__CKContextRequest_requestServiceSemaphoreWithReply___block_invoke_cold_1();
}

+ (id)requestServiceSemaphore
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  id v13;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__0;
  v19 = __Block_byref_object_dispose__0;
  v2 = MEMORY[0x1E0C809B0];
  v20 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __43__CKContextRequest_requestServiceSemaphore__block_invoke;
  v14[3] = &unk_1E462F578;
  v14[4] = &v15;
  v3 = (void *)MEMORY[0x1A1B10ED0](v14, a2);
  +[CKContextXPCClient xpcConnection](CKContextXPCClient, "xpcConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v2;
  v10 = 3221225472;
  v11 = __43__CKContextRequest_requestServiceSemaphore__block_invoke_2;
  v12 = &unk_1E462EFF0;
  v5 = v3;
  v13 = v5;
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", &v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "semaphoreWithReply:", v5, v9, v10, v11, v12);

  v7 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v7;
}

void __43__CKContextRequest_requestServiceSemaphore__block_invoke(uint64_t a1, void *a2)
{
  id v4;
  id v5;

  v4 = a2;
  if (v4)
  {
    v5 = v4;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    v4 = v5;
  }

}

void __43__CKContextRequest_requestServiceSemaphore__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __43__CKContextRequest_requestServiceSemaphore__block_invoke_2_cold_1();
  +[CKContextXPCClient isXPCConnectionError:](CKContextXPCClient, "isXPCConnectionError:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_124);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "semaphoreWithReply:", *(_QWORD *)(a1 + 32));

  }
}

void __43__CKContextRequest_requestServiceSemaphore__block_invoke_123()
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __43__CKContextRequest_requestServiceSemaphore__block_invoke_123_cold_1();
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (BOOL)textIsRaw
{
  return self->_textIsRaw;
}

- (void)setTextIsRaw:(BOOL)a3
{
  self->_textIsRaw = a3;
}

- (BOOL)includeHigherLevelTopics
{
  return self->_includeHigherLevelTopics;
}

- (NSDictionary)itemIds
{
  return self->_itemIds;
}

- (void)setItemIds:(id)a3
{
  objc_storeStrong((id *)&self->_itemIds, a3);
}

- (int64_t)maxConstellationTopics
{
  return self->_maxConstellationTopics;
}

- (void)setMaxConstellationTopics:(int64_t)a3
{
  self->_maxConstellationTopics = a3;
}

- (NSSet)allowedTopicTypeTags
{
  return self->_allowedTopicTypeTags;
}

- (void)setAllowedTopicTypeTags:(id)a3
{
  objc_storeStrong((id *)&self->_allowedTopicTypeTags, a3);
}

- (BOOL)includeStructuredExtractionResults
{
  return self->_includeStructuredExtractionResults;
}

- (void)setIncludeStructuredExtractionResults:(BOOL)a3
{
  self->_includeStructuredExtractionResults = a3;
}

- (BOOL)includeLeadImage
{
  return self->_includeLeadImage;
}

- (void)setIncludeLeadImage:(BOOL)a3
{
  self->_includeLeadImage = a3;
}

- (BOOL)includePartsOfSpeech
{
  return self->_includePartsOfSpeech;
}

- (void)setIncludePartsOfSpeech:(BOOL)a3
{
  self->_includePartsOfSpeech = a3;
}

- (unint64_t)fingerprintMax
{
  return self->_fingerprintMax;
}

- (void)setFingerprintMax:(unint64_t)a3
{
  self->_fingerprintMax = a3;
}

- (double)donationTimeout
{
  return self->_donationTimeout;
}

- (void)setDonationTimeout:(double)a3
{
  self->_donationTimeout = a3;
}

- (NSSet)preferredSceneIdentifiers
{
  return self->_preferredSceneIdentifiers;
}

- (void)setPreferredSceneIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (BOOL)dontSkip
{
  return self->_dontSkip;
}

- (void)setDontSkip:(BOOL)a3
{
  self->_dontSkip = a3;
}

- (BOOL)timing
{
  return self->_timing;
}

- (void)setTiming:(BOOL)a3
{
  self->_timing = a3;
}

- (NSNumber)overrideBlendAlpha
{
  return self->_overrideBlendAlpha;
}

- (void)setOverrideBlendAlpha:(id)a3
{
  objc_storeStrong((id *)&self->_overrideBlendAlpha, a3);
}

- (NSNumber)overrideBlendBeta
{
  return self->_overrideBlendBeta;
}

- (void)setOverrideBlendBeta:(id)a3
{
  objc_storeStrong((id *)&self->_overrideBlendBeta, a3);
}

- (NSNumber)overrideBlendGamma
{
  return self->_overrideBlendGamma;
}

- (void)setOverrideBlendGamma:(id)a3
{
  objc_storeStrong((id *)&self->_overrideBlendGamma, a3);
}

- (int)overrideConstellationMinCount
{
  return self->_overrideConstellationMinCount;
}

- (void)setOverrideConstellationMinCount:(int)a3
{
  self->_overrideConstellationMinCount = a3;
}

- (int)overrideConstellationMinWeight
{
  return self->_overrideConstellationMinWeight;
}

- (void)setOverrideConstellationMinWeight:(int)a3
{
  self->_overrideConstellationMinWeight = a3;
}

- (unsigned)topk
{
  return self->_topk;
}

- (void)setTopk:(unsigned int)a3
{
  self->_topk = a3;
}

- (BOOL)overrideEnableCoreNLPTagging
{
  return self->_overrideEnableCoreNLPTagging;
}

- (void)setOverrideEnableCoreNLPTagging:(BOOL)a3
{
  self->_overrideEnableCoreNLPTagging = a3;
}

- (void)setIncPending:(BOOL)a3
{
  self->_incPending = a3;
}

- (BOOL)debug
{
  return self->_debug;
}

- (void)setDebug:(BOOL)a3
{
  self->_debug = a3;
}

- (BOOL)includeRequestInResponse
{
  return self->_includeRequestInResponse;
}

- (void)setIncludeRequestInResponse:(BOOL)a3
{
  self->_includeRequestInResponse = a3;
}

- (NSOrderedSet)desiredLanguageTags
{
  return self->_desiredLanguageTags;
}

- (void)setDesiredLanguageTags:(id)a3
{
  objc_storeStrong((id *)&self->_desiredLanguageTags, a3);
}

- (NSArray)donorBundleIdentifiers
{
  return self->_donorBundleIdentifiers;
}

- (void)setDonorBundleIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

void __37__CKContextRequest_executeWithReply___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_1(a1, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_1(&dword_1A1AA2000, MEMORY[0x1E0C81028], v1, "ContextRequest type: %lu", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)execute
{
  OUTLINED_FUNCTION_2_1(&dword_1A1AA2000, MEMORY[0x1E0C81028], a3, "ContextRequest round trip time for synchronous request: %f Msec", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

void __27__CKContextRequest_execute__block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)a1 + 8) + 40), "error");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_1A1AA2000, MEMORY[0x1E0C81028], v2, "Error in execute: %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_2_0();
}

void __27__CKContextRequest_execute__block_invoke_104_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_1A1AA2000, MEMORY[0x1E0C81028], v0, "Error in execute (second attempt): %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __38__CKContextRequest__executeWithReply___block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "error");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_1A1AA2000, MEMORY[0x1E0C81028], v2, "Error in executeWithReply: %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_2_0();
}

void __38__CKContextRequest__executeWithReply___block_invoke_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_1(&dword_1A1AA2000, MEMORY[0x1E0C81028], a3, "ContextRequest round trip time for async request: %f Msec", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

void __59__CKContextRequest__executeCategorizationRequestWithReply___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_1(&dword_1A1AA2000, MEMORY[0x1E0C81028], a3, "ContextRequest round trip time for async batch categorization request: %f Msec", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

void __31__CKContextRequest_pingService__block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_1A1AA2000, MEMORY[0x1E0C81028], v0, "Error in pingService: %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __35__CKContextRequest_shutdownService__block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_1A1AA2000, MEMORY[0x1E0C81028], v0, "Error in shutdownService: %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __126__CKContextRequest_logResultsShownForResponseId_shown_couldHaveShown_topicIds_serverOverride_inputLength_requestType_logType___block_invoke_2_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_1A1AA2000, MEMORY[0x1E0C81028], v0, "Error in logResultsShownForResponseId: %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __108__CKContextRequest_logEngagementForResponseId_result_rank_inputLength_completionLength_requestType_logType___block_invoke_2_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_1A1AA2000, MEMORY[0x1E0C81028], v0, "Error in logEngagementForResponseId: %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __108__CKContextRequest_logEngagementForResponseId_result_rank_inputLength_completionLength_requestType_logType___block_invoke_115_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_1A1AA2000, MEMORY[0x1E0C81028], v0, "Error in logEngagementForResponseId (second attempt): %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __107__CKContextRequest_logTransactionSuccessfulForResponseId_inputLength_completionLength_requestType_logType___block_invoke_2_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_1A1AA2000, MEMORY[0x1E0C81028], v0, "Error in logTransactionSuccessfulForResponseId: %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __107__CKContextRequest_logTransactionSuccessfulForResponseId_inputLength_completionLength_requestType_logType___block_invoke_117_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_1A1AA2000, MEMORY[0x1E0C81028], v0, "Error in logTransactionSuccessfulForResponseId (second attempt): %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __53__CKContextRequest_requestServiceSemaphoreWithReply___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_1A1AA2000, MEMORY[0x1E0C81028], v0, "Error retrieving service semaphore asynchronously: %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __43__CKContextRequest_requestServiceSemaphore__block_invoke_2_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_1A1AA2000, MEMORY[0x1E0C81028], v0, "Error in requestSemaphore: %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __43__CKContextRequest_requestServiceSemaphore__block_invoke_123_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_1A1AA2000, MEMORY[0x1E0C81028], v0, "Error in requestSemaphore (second attempt): %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

@end
