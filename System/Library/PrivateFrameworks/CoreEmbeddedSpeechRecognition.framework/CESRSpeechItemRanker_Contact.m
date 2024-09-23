@implementation CESRSpeechItemRanker_Contact

- (CESRSpeechItemRanker_Contact)initWithInstance:(id)a3 speechProfileSite:(id)a4 categoryGroup:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSString *trialContactRankingStrategy;
  CESRPeopleSuggesterPriorRetriever *v12;
  CESRMegadomeContactPriorRetriever *v13;
  CESRSpeechItemRanker_Contact *v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  trialContactRankingStrategy = self->_trialContactRankingStrategy;
  self->_trialContactRankingStrategy = 0;

  -[CESRSpeechItemRanker_Contact _activateEnrolledTrialExperiments](self, "_activateEnrolledTrialExperiments");
  v12 = objc_alloc_init(CESRPeopleSuggesterPriorRetriever);
  if (-[NSString isEqualToString:](self->_trialContactRankingStrategy, "isEqualToString:", CFSTR("MegadomeContactTop20")))
  {
    v13 = objc_alloc_init(CESRMegadomeContactPriorRetriever);

    v12 = (CESRPeopleSuggesterPriorRetriever *)v13;
  }
  v14 = -[CESRSpeechItemRanker_Contact initWithInstance:speechProfileSite:categoryGroup:priorRetriever:](self, "initWithInstance:speechProfileSite:categoryGroup:priorRetriever:", v8, v9, v10, v12);

  return v14;
}

- (CESRSpeechItemRanker_Contact)initWithInstance:(id)a3 speechProfileSite:(id)a4 categoryGroup:(id)a5 priorRetriever:(id)a6
{
  id v11;
  CESRSpeechItemRanker_Contact *v12;
  CESRSpeechItemRanker_Contact *v13;
  uint64_t v14;
  NSMutableSet *codepathIds;
  objc_super v17;

  v11 = a6;
  v17.receiver = self;
  v17.super_class = (Class)CESRSpeechItemRanker_Contact;
  v12 = -[CESRSpeechItemRanker initWithInstance:speechProfileSite:categoryGroup:](&v17, sel_initWithInstance_speechProfileSite_categoryGroup_, a3, a4, a5);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_priorRetriever, a6);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v14 = objc_claimAutoreleasedReturnValue();
    codepathIds = v13->_codepathIds;
    v13->_codepathIds = (NSMutableSet *)v14;

    if (!v13->_didFetchExperiments)
      -[CESRSpeechItemRanker_Contact _activateEnrolledTrialExperiments](v13, "_activateEnrolledTrialExperiments");
  }

  return v13;
}

- (void)_activateEnrolledTrialExperiments
{
  void *v3;
  NSString *v4;
  NSString *trialContactRankingStrategy;
  id v6;

  objc_msgSend(MEMORY[0x1E0DC09C8], "clientWithIdentifier:", 111);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "levelForFactor:withNamespaceName:", CFSTR("contact_boosting_strategy"), CFSTR("SIRI_SPEECH_SV_SPEECH_PROFILE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  trialContactRankingStrategy = self->_trialContactRankingStrategy;
  self->_trialContactRankingStrategy = v4;

  self->_didFetchExperiments = 1;
}

- (id)getAllCodepathIds
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("043fda7b-2fc0-489e-8cce-319c22dcf3ba"), CFSTR("502484ea-7a73-454a-8e1f-9f04983d6358"), 0);
}

- (id)getActivatedCodepathIds
{
  id v3;
  objc_super v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CESRSpeechItemRanker_Contact;
  if (-[CESRSpeechItemRanker enumeratedItemCount](&v6, sel_enumeratedItemCount) >= 1)
    -[NSMutableSet addObject:](self->_codepathIds, "addObject:", CFSTR("043fda7b-2fc0-489e-8cce-319c22dcf3ba"));
  v5.receiver = self;
  v5.super_class = (Class)CESRSpeechItemRanker_Contact;
  v3 = -[CESRSpeechItemRanker enumeratedItemCount](&v5, sel_enumeratedItemCount);
  if ((uint64_t)v3 >= -[CESRSpeechItemRanker calculateItemLimit](self, "calculateItemLimit"))
    -[NSMutableSet addObject:](self->_codepathIds, "addObject:", CFSTR("502484ea-7a73-454a-8e1f-9f04983d6358"));
  return self->_codepathIds;
}

- (BOOL)addSet:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if (objc_msgSend(v4, "itemType") == 19668)
  {
    v7.receiver = self;
    v7.super_class = (Class)CESRSpeechItemRanker_Contact;
    v5 = -[CESRSpeechItemRanker addSet:](&v7, sel_addSet_, v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)enumerateRankedItemsWithError:(id *)a3 usingBlock:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  unsigned int v11;
  unsigned int v12;
  int v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  id v17;
  BOOL v18;
  NSObject *v20;
  objc_super v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _BYTE *v25;
  uint8_t v26[4];
  const char *v27;
  __int16 v28;
  unsigned int v29;
  __int16 v30;
  int v31;
  __int16 v32;
  int v33;
  _BYTE buf[24];
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = -[CESRSpeechItemRanker calculateItemLimit](self, "calculateItemLimit");
  if (-[NSString isEqualToString:](self->_trialContactRankingStrategy, "isEqualToString:", CFSTR("PeopleSuggesterTop20")))
  {
    -[CESRPriorRetriever allPriorInfoWithThreshold:](self->_priorRetriever, "allPriorInfoWithThreshold:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x1E0CFE6C0];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
      goto LABEL_13;
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[CESRSpeechItemRanker_Contact enumerateRankedItemsWithError:usingBlock:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = CFSTR("PeopleSuggesterTop20");
LABEL_7:
    _os_log_impl(&dword_1B3E5F000, v9, OS_LOG_TYPE_INFO, "%s Active ASR A/B trial experiment for Contact Boosting. Treatment = %@", buf, 0x16u);
    goto LABEL_13;
  }
  if (-[NSString isEqualToString:](self->_trialContactRankingStrategy, "isEqualToString:", CFSTR("MegadomeContactTop20")))
  {
    -[CESRPriorRetriever allPriorInfoWithThreshold:](self->_priorRetriever, "allPriorInfoWithThreshold:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x1E0CFE6C0];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
      goto LABEL_13;
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[CESRSpeechItemRanker_Contact enumerateRankedItemsWithError:usingBlock:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = CFSTR("MegadomeContactTop20");
    goto LABEL_7;
  }
  if (-[NSString isEqualToString:](self->_trialContactRankingStrategy, "isEqualToString:", CFSTR("NoBoosting")))
  {
    v10 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[CESRSpeechItemRanker_Contact enumerateRankedItemsWithError:usingBlock:]";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = CFSTR("NoBoosting");
      _os_log_impl(&dword_1B3E5F000, v10, OS_LOG_TYPE_INFO, "%s Active ASR A/B trial experiment for Contact Boosting. Treatment = %@. Disabling priors.", buf, 0x16u);
    }
    v8 = 0;
  }
  else
  {
    -[CESRPriorRetriever allPriorInfoWithThreshold:](self->_priorRetriever, "allPriorInfoWithThreshold:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_13:
  v11 = objc_msgSend(v8, "count");
  v12 = v11;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v35 = 0;
  if (!v11)
  {
    v15 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v26 = 136315138;
      v27 = "-[CESRSpeechItemRanker_Contact enumerateRankedItemsWithError:usingBlock:]";
      _os_log_error_impl(&dword_1B3E5F000, v15, OS_LOG_TYPE_ERROR, "%s No priors available. Disabling filter", v26, 0xCu);
    }
    goto LABEL_20;
  }
  v13 = v7 - v11;
  if (v7 < v11)
  {
    v14 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v26 = 136315394;
      v27 = "-[CESRSpeechItemRanker_Contact enumerateRankedItemsWithError:usingBlock:]";
      v28 = 1024;
      v29 = v12;
      _os_log_error_impl(&dword_1B3E5F000, v14, OS_LOG_TYPE_ERROR, "%s Unexpected prior count (%u) Disabling filter", v26, 0x12u);
    }
LABEL_20:

    v8 = 0;
    goto LABEL_21;
  }
  v35 = v7 - v11;
  v20 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v26 = 136315906;
    v27 = "-[CESRSpeechItemRanker_Contact enumerateRankedItemsWithError:usingBlock:]";
    v28 = 1024;
    v29 = v12;
    v30 = 1024;
    v31 = v7;
    v32 = 1024;
    v33 = v13;
    _os_log_impl(&dword_1B3E5F000, v20, OS_LOG_TYPE_INFO, "%s Received priors for %u contacts with limit: %u allowance: %u", v26, 0x1Eu);
  }
LABEL_21:
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __73__CESRSpeechItemRanker_Contact_enumerateRankedItemsWithError_usingBlock___block_invoke;
  v22[3] = &unk_1E6733A90;
  v16 = v8;
  v23 = v16;
  v17 = v6;
  v24 = v17;
  v25 = buf;
  v21.receiver = self;
  v21.super_class = (Class)CESRSpeechItemRanker_Contact;
  v18 = -[CESRSpeechItemRanker enumerateRankedItemsWithError:usingBlock:](&v21, sel_enumerateRankedItemsWithError_usingBlock_, a3, v22);

  _Block_object_dispose(buf, 8);
  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_codepathIds, 0);
  objc_storeStrong((id *)&self->_trialContactRankingStrategy, 0);
  objc_storeStrong((id *)&self->_priorRetriever, 0);
}

@end
