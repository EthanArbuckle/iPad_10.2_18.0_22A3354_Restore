@implementation AFVoiceIdScoreCard

- (AFVoiceIdScoreCard)initWithBuilder:(id)a3
{
  void (**v4)(id, _AFVoiceIdScoreCardMutation *);
  AFVoiceIdScoreCard *v5;
  AFVoiceIdScoreCard *v6;
  _AFVoiceIdScoreCardMutation *v7;
  void *v8;
  uint64_t v9;
  NSNumber *spIdAudioProcessedDuration;
  void *v11;
  uint64_t v12;
  NSNumber *spIdUnknownUserScore;
  void *v14;
  uint64_t v15;
  NSDictionary *spIdKnownUserScores;
  void *v17;
  uint64_t v18;
  NSNumber *spIdUserScoresVersion;
  void *v20;
  uint64_t v21;
  NSString *spIdScoreThresholdingType;
  void *v23;
  uint64_t v24;
  NSString *spIdAssetVersion;
  void *v26;
  uint64_t v27;
  NSString *userClassified;
  void *v29;
  uint64_t v30;
  NSNumber *lowScoreThreshold;
  void *v32;
  uint64_t v33;
  NSNumber *highScoreThreshold;
  void *v35;
  uint64_t v36;
  NSNumber *confidentScoreThreshold;
  void *v38;
  uint64_t v39;
  NSNumber *deltaScoreThreshold;
  objc_super v42;

  v4 = (void (**)(id, _AFVoiceIdScoreCardMutation *))a3;
  v42.receiver = self;
  v42.super_class = (Class)AFVoiceIdScoreCard;
  v5 = -[AFVoiceIdScoreCard init](&v42, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_AFVoiceIdScoreCardMutation initWithBase:]([_AFVoiceIdScoreCardMutation alloc], "initWithBase:", 0);
    v4[2](v4, v7);
    if (-[_AFVoiceIdScoreCardMutation isDirty](v7, "isDirty"))
    {
      -[_AFVoiceIdScoreCardMutation getSpIdAudioProcessedDuration](v7, "getSpIdAudioProcessedDuration");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "copy");
      spIdAudioProcessedDuration = v6->_spIdAudioProcessedDuration;
      v6->_spIdAudioProcessedDuration = (NSNumber *)v9;

      -[_AFVoiceIdScoreCardMutation getSpIdUnknownUserScore](v7, "getSpIdUnknownUserScore");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "copy");
      spIdUnknownUserScore = v6->_spIdUnknownUserScore;
      v6->_spIdUnknownUserScore = (NSNumber *)v12;

      -[_AFVoiceIdScoreCardMutation getSpIdKnownUserScores](v7, "getSpIdKnownUserScores");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "copy");
      spIdKnownUserScores = v6->_spIdKnownUserScores;
      v6->_spIdKnownUserScores = (NSDictionary *)v15;

      -[_AFVoiceIdScoreCardMutation getSpIdUserScoresVersion](v7, "getSpIdUserScoresVersion");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "copy");
      spIdUserScoresVersion = v6->_spIdUserScoresVersion;
      v6->_spIdUserScoresVersion = (NSNumber *)v18;

      -[_AFVoiceIdScoreCardMutation getSpIdScoreThresholdingType](v7, "getSpIdScoreThresholdingType");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "copy");
      spIdScoreThresholdingType = v6->_spIdScoreThresholdingType;
      v6->_spIdScoreThresholdingType = (NSString *)v21;

      -[_AFVoiceIdScoreCardMutation getSpIdAssetVersion](v7, "getSpIdAssetVersion");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "copy");
      spIdAssetVersion = v6->_spIdAssetVersion;
      v6->_spIdAssetVersion = (NSString *)v24;

      -[_AFVoiceIdScoreCardMutation getUserClassified](v7, "getUserClassified");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "copy");
      userClassified = v6->_userClassified;
      v6->_userClassified = (NSString *)v27;

      v6->_userIdentityClassification = -[_AFVoiceIdScoreCardMutation getUserIdentityClassification](v7, "getUserIdentityClassification");
      -[_AFVoiceIdScoreCardMutation getLowScoreThreshold](v7, "getLowScoreThreshold");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "copy");
      lowScoreThreshold = v6->_lowScoreThreshold;
      v6->_lowScoreThreshold = (NSNumber *)v30;

      -[_AFVoiceIdScoreCardMutation getHighScoreThreshold](v7, "getHighScoreThreshold");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "copy");
      highScoreThreshold = v6->_highScoreThreshold;
      v6->_highScoreThreshold = (NSNumber *)v33;

      -[_AFVoiceIdScoreCardMutation getConfidentScoreThreshold](v7, "getConfidentScoreThreshold");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "copy");
      confidentScoreThreshold = v6->_confidentScoreThreshold;
      v6->_confidentScoreThreshold = (NSNumber *)v36;

      -[_AFVoiceIdScoreCardMutation getDeltaScoreThreshold](v7, "getDeltaScoreThreshold");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "copy");
      deltaScoreThreshold = v6->_deltaScoreThreshold;
      v6->_deltaScoreThreshold = (NSNumber *)v39;

    }
  }

  return v6;
}

- (AFVoiceIdScoreCard)init
{
  return -[AFVoiceIdScoreCard initWithBuilder:](self, "initWithBuilder:", 0);
}

- (AFVoiceIdScoreCard)initWithSpIdAudioProcessedDuration:(id)a3 spIdUnknownUserScore:(id)a4 spIdKnownUserScores:(id)a5 spIdUserScoresVersion:(id)a6 spIdScoreThresholdingType:(id)a7 spIdAssetVersion:(id)a8 userClassified:(id)a9 userIdentityClassification:(int64_t)a10 lowScoreThreshold:(id)a11 highScoreThreshold:(id)a12 confidentScoreThreshold:(id)a13 deltaScoreThreshold:(id)a14
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  AFVoiceIdScoreCard *v38;
  id v40;
  id v41;
  id v42;
  _QWORD v44[4];
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  int64_t v56;

  v40 = a3;
  v19 = a4;
  v20 = a5;
  v21 = a6;
  v22 = a7;
  v23 = a8;
  v24 = a9;
  v25 = a11;
  v26 = a12;
  v27 = a13;
  v28 = a14;
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __286__AFVoiceIdScoreCard_initWithSpIdAudioProcessedDuration_spIdUnknownUserScore_spIdKnownUserScores_spIdUserScoresVersion_spIdScoreThresholdingType_spIdAssetVersion_userClassified_userIdentityClassification_lowScoreThreshold_highScoreThreshold_confidentScoreThreshold_deltaScoreThreshold___block_invoke;
  v44[3] = &unk_1E3A32840;
  v45 = v40;
  v46 = v19;
  v47 = v20;
  v48 = v21;
  v49 = v22;
  v50 = v23;
  v51 = v24;
  v52 = v25;
  v53 = v26;
  v54 = v27;
  v55 = v28;
  v56 = a10;
  v42 = v28;
  v41 = v27;
  v29 = v26;
  v30 = v25;
  v31 = v24;
  v32 = v23;
  v33 = v22;
  v34 = v21;
  v35 = v20;
  v36 = v19;
  v37 = v40;
  v38 = -[AFVoiceIdScoreCard initWithBuilder:](self, "initWithBuilder:", v44);

  return v38;
}

- (AFVoiceIdScoreCard)initWithSpIdAudioProcessedDuration:(id)a3 spIdUnknownUserScore:(id)a4 spIdKnownUserScores:(id)a5 spIdUserScoresVersion:(id)a6 spIdScoreThresholdingType:(id)a7 spIdAssetVersion:(id)a8 userClassified:(id)a9 userIdentityClassification:(int64_t)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  AFVoiceIdScoreCard *v30;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  int64_t v40;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __205__AFVoiceIdScoreCard_initWithSpIdAudioProcessedDuration_spIdUnknownUserScore_spIdKnownUserScores_spIdUserScoresVersion_spIdScoreThresholdingType_spIdAssetVersion_userClassified_userIdentityClassification___block_invoke;
  v32[3] = &unk_1E3A32868;
  v33 = v16;
  v34 = v17;
  v35 = v18;
  v36 = v19;
  v37 = v20;
  v38 = v21;
  v39 = v22;
  v40 = a10;
  v23 = v22;
  v24 = v21;
  v25 = v20;
  v26 = v19;
  v27 = v18;
  v28 = v17;
  v29 = v16;
  v30 = -[AFVoiceIdScoreCard initWithBuilder:](self, "initWithBuilder:", v32);

  return v30;
}

- (NSString)description
{
  return (NSString *)-[AFVoiceIdScoreCard _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  void *v4;
  NSNumber *spIdAudioProcessedDuration;
  NSNumber *spIdUnknownUserScore;
  NSDictionary *spIdKnownUserScores;
  NSNumber *spIdUserScoresVersion;
  NSString *spIdScoreThresholdingType;
  NSString *spIdAssetVersion;
  unint64_t userIdentityClassification;
  NSString *userClassified;
  __CFString *v13;
  __CFString *v14;
  void *v15;
  id v17;
  objc_super v18;

  v17 = objc_alloc(MEMORY[0x1E0CB3940]);
  v18.receiver = self;
  v18.super_class = (Class)AFVoiceIdScoreCard;
  -[AFVoiceIdScoreCard description](&v18, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  spIdAudioProcessedDuration = self->_spIdAudioProcessedDuration;
  spIdUnknownUserScore = self->_spIdUnknownUserScore;
  spIdKnownUserScores = self->_spIdKnownUserScores;
  spIdUserScoresVersion = self->_spIdUserScoresVersion;
  spIdScoreThresholdingType = self->_spIdScoreThresholdingType;
  spIdAssetVersion = self->_spIdAssetVersion;
  userClassified = self->_userClassified;
  userIdentityClassification = self->_userIdentityClassification;
  if (userIdentityClassification > 4)
    v13 = CFSTR("(unknown)");
  else
    v13 = off_1E3A32620[userIdentityClassification];
  v14 = v13;
  v15 = (void *)objc_msgSend(v17, "initWithFormat:", CFSTR("%@ {spIdAudioProcessedDuration = %@, spIdUnknownUserScore = %@, spIdKnownUserScores = %@, spIdUserScoresVersion = %@, spIdScoreThresholdingType = %@, spIdAssetVersion = %@, userClassified = %@, userIdentityClassification = %@, lowScoreThreshold = %@, highScoreThreshold = %@, confidentScoreThreshold = %@, deltaScoreThreshold = %@}"), v4, spIdAudioProcessedDuration, spIdUnknownUserScore, spIdKnownUserScores, spIdUserScoresVersion, spIdScoreThresholdingType, spIdAssetVersion, userClassified, v14, self->_lowScoreThreshold, self->_highScoreThreshold, self->_confidentScoreThreshold, self->_deltaScoreThreshold);

  return v15;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;

  v3 = -[NSNumber hash](self->_spIdAudioProcessedDuration, "hash");
  v4 = -[NSNumber hash](self->_spIdUnknownUserScore, "hash") ^ v3;
  v5 = -[NSDictionary hash](self->_spIdKnownUserScores, "hash");
  v6 = v4 ^ v5 ^ -[NSNumber hash](self->_spIdUserScoresVersion, "hash");
  v7 = -[NSString hash](self->_spIdScoreThresholdingType, "hash");
  v8 = v7 ^ -[NSString hash](self->_spIdAssetVersion, "hash");
  v9 = v6 ^ v8 ^ -[NSString hash](self->_userClassified, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_userIdentityClassification);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hash");
  v12 = v9 ^ v11 ^ -[NSNumber hash](self->_lowScoreThreshold, "hash");
  v13 = -[NSNumber hash](self->_highScoreThreshold, "hash");
  v14 = v13 ^ -[NSNumber hash](self->_confidentScoreThreshold, "hash");
  v15 = v12 ^ v14 ^ -[NSNumber hash](self->_deltaScoreThreshold, "hash");

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  AFVoiceIdScoreCard *v4;
  AFVoiceIdScoreCard *v5;
  int64_t userIdentityClassification;
  NSNumber *v7;
  NSNumber *spIdAudioProcessedDuration;
  NSNumber *v9;
  NSNumber *spIdUnknownUserScore;
  NSDictionary *v11;
  NSDictionary *spIdKnownUserScores;
  NSNumber *v13;
  NSNumber *spIdUserScoresVersion;
  NSString *v15;
  NSString *spIdScoreThresholdingType;
  NSString *v17;
  NSString *spIdAssetVersion;
  NSString *v19;
  NSString *userClassified;
  NSNumber *v21;
  NSNumber *lowScoreThreshold;
  NSNumber *v23;
  NSNumber *highScoreThreshold;
  NSNumber *v25;
  NSNumber *confidentScoreThreshold;
  NSNumber *v27;
  NSNumber *deltaScoreThreshold;
  NSNumber *v29;
  int v30;
  BOOL v31;
  NSNumber *v33;
  NSNumber *v34;
  NSString *v35;

  v4 = (AFVoiceIdScoreCard *)a3;
  if (self == v4)
  {
    v31 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      userIdentityClassification = self->_userIdentityClassification;
      if (userIdentityClassification == -[AFVoiceIdScoreCard userIdentityClassification](v5, "userIdentityClassification"))
      {
        -[AFVoiceIdScoreCard spIdAudioProcessedDuration](v5, "spIdAudioProcessedDuration");
        v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        spIdAudioProcessedDuration = self->_spIdAudioProcessedDuration;
        if (spIdAudioProcessedDuration == v7
          || -[NSNumber isEqual:](spIdAudioProcessedDuration, "isEqual:", v7))
        {
          -[AFVoiceIdScoreCard spIdUnknownUserScore](v5, "spIdUnknownUserScore");
          v9 = (NSNumber *)objc_claimAutoreleasedReturnValue();
          spIdUnknownUserScore = self->_spIdUnknownUserScore;
          if (spIdUnknownUserScore == v9 || -[NSNumber isEqual:](spIdUnknownUserScore, "isEqual:", v9))
          {
            -[AFVoiceIdScoreCard spIdKnownUserScores](v5, "spIdKnownUserScores");
            v11 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
            spIdKnownUserScores = self->_spIdKnownUserScores;
            if (spIdKnownUserScores == v11
              || -[NSDictionary isEqual:](spIdKnownUserScores, "isEqual:", v11))
            {
              -[AFVoiceIdScoreCard spIdUserScoresVersion](v5, "spIdUserScoresVersion");
              v13 = (NSNumber *)objc_claimAutoreleasedReturnValue();
              spIdUserScoresVersion = self->_spIdUserScoresVersion;
              if (spIdUserScoresVersion == v13
                || -[NSNumber isEqual:](spIdUserScoresVersion, "isEqual:", v13))
              {
                -[AFVoiceIdScoreCard spIdScoreThresholdingType](v5, "spIdScoreThresholdingType");
                v15 = (NSString *)objc_claimAutoreleasedReturnValue();
                spIdScoreThresholdingType = self->_spIdScoreThresholdingType;
                if (spIdScoreThresholdingType == v15
                  || -[NSString isEqual:](spIdScoreThresholdingType, "isEqual:", v15))
                {
                  -[AFVoiceIdScoreCard spIdAssetVersion](v5, "spIdAssetVersion");
                  v17 = (NSString *)objc_claimAutoreleasedReturnValue();
                  spIdAssetVersion = self->_spIdAssetVersion;
                  if (spIdAssetVersion == v17 || -[NSString isEqual:](spIdAssetVersion, "isEqual:", v17))
                  {
                    -[AFVoiceIdScoreCard userClassified](v5, "userClassified");
                    v19 = (NSString *)objc_claimAutoreleasedReturnValue();
                    userClassified = self->_userClassified;
                    if (userClassified == v19 || -[NSString isEqual:](userClassified, "isEqual:", v19))
                    {
                      v35 = v19;
                      -[AFVoiceIdScoreCard lowScoreThreshold](v5, "lowScoreThreshold");
                      v21 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                      lowScoreThreshold = self->_lowScoreThreshold;
                      if (lowScoreThreshold == v21
                        || -[NSNumber isEqual:](lowScoreThreshold, "isEqual:", v21))
                      {
                        v34 = v21;
                        -[AFVoiceIdScoreCard highScoreThreshold](v5, "highScoreThreshold");
                        v23 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                        highScoreThreshold = self->_highScoreThreshold;
                        if (highScoreThreshold == v23
                          || -[NSNumber isEqual:](highScoreThreshold, "isEqual:", v23))
                        {
                          v33 = v23;
                          -[AFVoiceIdScoreCard confidentScoreThreshold](v5, "confidentScoreThreshold");
                          v25 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                          confidentScoreThreshold = self->_confidentScoreThreshold;
                          if (confidentScoreThreshold == v25
                            || -[NSNumber isEqual:](confidentScoreThreshold, "isEqual:", v25))
                          {
                            -[AFVoiceIdScoreCard deltaScoreThreshold](v5, "deltaScoreThreshold");
                            v27 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                            deltaScoreThreshold = self->_deltaScoreThreshold;
                            v31 = 1;
                            if (deltaScoreThreshold != v27)
                            {
                              v29 = v27;
                              v30 = -[NSNumber isEqual:](deltaScoreThreshold, "isEqual:", v27);
                              v27 = v29;
                              if (!v30)
                                v31 = 0;
                            }

                          }
                          else
                          {
                            v31 = 0;
                          }

                          v23 = v33;
                        }
                        else
                        {
                          v31 = 0;
                        }

                        v21 = v34;
                      }
                      else
                      {
                        v31 = 0;
                      }

                      v19 = v35;
                    }
                    else
                    {
                      v31 = 0;
                    }

                  }
                  else
                  {
                    v31 = 0;
                  }

                }
                else
                {
                  v31 = 0;
                }

              }
              else
              {
                v31 = 0;
              }

            }
            else
            {
              v31 = 0;
            }

          }
          else
          {
            v31 = 0;
          }

        }
        else
        {
          v31 = 0;
        }

      }
      else
      {
        v31 = 0;
      }

    }
    else
    {
      v31 = 0;
    }
  }

  return v31;
}

- (AFVoiceIdScoreCard)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  AFVoiceIdScoreCard *v23;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFVoiceIdScoreCard::spIdAudioProcessedDuration"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFVoiceIdScoreCard::spIdUnknownUserScore"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v5, v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v7, CFSTR("AFVoiceIdScoreCard::spIdKnownUserScores"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFVoiceIdScoreCard::spIdUserScoresVersion"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFVoiceIdScoreCard::spIdScoreThresholdingType"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFVoiceIdScoreCard::spIdAssetVersion"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFVoiceIdScoreCard::userClassified"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFVoiceIdScoreCard::userIdentityClassification"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "integerValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFVoiceIdScoreCard::lowScoreThreshold"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFVoiceIdScoreCard::highScoreThreshold"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFVoiceIdScoreCard::confidentScoreThreshold"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFVoiceIdScoreCard::deltaScoreThreshold"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = -[AFVoiceIdScoreCard initWithSpIdAudioProcessedDuration:spIdUnknownUserScore:spIdKnownUserScores:spIdUserScoresVersion:spIdScoreThresholdingType:spIdAssetVersion:userClassified:userIdentityClassification:lowScoreThreshold:highScoreThreshold:confidentScoreThreshold:deltaScoreThreshold:](self, "initWithSpIdAudioProcessedDuration:spIdUnknownUserScore:spIdKnownUserScores:spIdUserScoresVersion:spIdScoreThresholdingType:spIdAssetVersion:userClassified:userIdentityClassification:lowScoreThreshold:highScoreThreshold:confidentScoreThreshold:deltaScoreThreshold:", v21, v18, v8, v9, v20, v19, v10, v12, v17, v13, v14, v15);
  return v23;
}

- (void)encodeWithCoder:(id)a3
{
  NSNumber *spIdAudioProcessedDuration;
  void *v5;
  id v6;

  spIdAudioProcessedDuration = self->_spIdAudioProcessedDuration;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", spIdAudioProcessedDuration, CFSTR("AFVoiceIdScoreCard::spIdAudioProcessedDuration"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_spIdUnknownUserScore, CFSTR("AFVoiceIdScoreCard::spIdUnknownUserScore"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_spIdKnownUserScores, CFSTR("AFVoiceIdScoreCard::spIdKnownUserScores"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_spIdUserScoresVersion, CFSTR("AFVoiceIdScoreCard::spIdUserScoresVersion"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_spIdScoreThresholdingType, CFSTR("AFVoiceIdScoreCard::spIdScoreThresholdingType"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_spIdAssetVersion, CFSTR("AFVoiceIdScoreCard::spIdAssetVersion"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_userClassified, CFSTR("AFVoiceIdScoreCard::userClassified"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_userIdentityClassification);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("AFVoiceIdScoreCard::userIdentityClassification"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_lowScoreThreshold, CFSTR("AFVoiceIdScoreCard::lowScoreThreshold"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_highScoreThreshold, CFSTR("AFVoiceIdScoreCard::highScoreThreshold"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_confidentScoreThreshold, CFSTR("AFVoiceIdScoreCard::confidentScoreThreshold"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_deltaScoreThreshold, CFSTR("AFVoiceIdScoreCard::deltaScoreThreshold"));

}

- (AFVoiceIdScoreCard)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  AFVoiceIdScoreCard *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  id v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  AFVoiceIdScoreCard *v41;
  void *v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("spIdAudioProcessedDuration"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v43 = v6;
    else
      v43 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("spIdUnknownUserScore"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v41 = self;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v40 = v8;
    else
      v40 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("spIdKnownUserScores"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v42 = v5;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v9, "count"));
      v44 = 0u;
      v45 = 0u;
      v46 = 0u;
      v47 = 0u;
      v37 = v9;
      v11 = v9;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v45;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v45 != v14)
              objc_enumerationMutation(v11);
            v16 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v11, "objectForKey:", v16);
              v17 = (id)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v18 = v17;

                if (v18)
                  objc_msgSend(v10, "setObject:forKey:", v18, v16);
              }
              else
              {

                v18 = 0;
              }

            }
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
        }
        while (v13);
      }

      v39 = (void *)objc_msgSend(v10, "copy");
      v5 = v42;
      v9 = v37;
    }
    else
    {
      v39 = 0;
    }

    objc_msgSend(v5, "objectForKey:", CFSTR("spIdUserScoresVersion"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v38 = v19;
    else
      v38 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("spIdScoreThresholdingType"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v36 = v20;
    else
      v36 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("spIdAssetVersion"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v35 = v21;
    else
      v35 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("userClassified"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v23 = v22;
    else
      v23 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("userIdentityClassification"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v25 = AFUserIdentityClassficationGetFromName(v24);
    else
      v25 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("lowScoreThreshold"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v27 = v26;
    else
      v27 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("highScoreThreshold"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v29 = v28;
    else
      v29 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("confidentScoreThreshold"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v31 = v30;
    else
      v31 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("deltaScoreThreshold"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v33 = v32;
    else
      v33 = 0;

    self = -[AFVoiceIdScoreCard initWithSpIdAudioProcessedDuration:spIdUnknownUserScore:spIdKnownUserScores:spIdUserScoresVersion:spIdScoreThresholdingType:spIdAssetVersion:userClassified:userIdentityClassification:lowScoreThreshold:highScoreThreshold:confidentScoreThreshold:deltaScoreThreshold:](v41, "initWithSpIdAudioProcessedDuration:spIdUnknownUserScore:spIdKnownUserScores:spIdUserScoresVersion:spIdScoreThresholdingType:spIdAssetVersion:userClassified:userIdentityClassification:lowScoreThreshold:highScoreThreshold:confidentScoreThreshold:deltaScoreThreshold:", v43, v40, v39, v38, v36, v35, v23, v25, v27, v29, v31, v33);
    v7 = self;
    v5 = v42;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)buildDictionaryRepresentation
{
  id v3;
  void *v4;
  NSNumber *spIdAudioProcessedDuration;
  NSNumber *spIdUnknownUserScore;
  void *v7;
  NSDictionary *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  NSNumber *spIdUserScoresVersion;
  NSString *spIdScoreThresholdingType;
  NSString *spIdAssetVersion;
  NSString *userClassified;
  unint64_t userIdentityClassification;
  __CFString *v21;
  __CFString *v22;
  NSNumber *lowScoreThreshold;
  NSNumber *highScoreThreshold;
  NSNumber *confidentScoreThreshold;
  NSNumber *deltaScoreThreshold;
  void *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = v3;
  spIdAudioProcessedDuration = self->_spIdAudioProcessedDuration;
  if (spIdAudioProcessedDuration)
    objc_msgSend(v3, "setObject:forKey:", spIdAudioProcessedDuration, CFSTR("spIdAudioProcessedDuration"));
  spIdUnknownUserScore = self->_spIdUnknownUserScore;
  if (spIdUnknownUserScore)
    objc_msgSend(v4, "setObject:forKey:", spIdUnknownUserScore, CFSTR("spIdUnknownUserScore"));
  if (self->_spIdKnownUserScores)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", -[NSDictionary count](self->_spIdKnownUserScores, "count"));
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v8 = self->_spIdKnownUserScores;
    v9 = -[NSDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v30 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
          -[NSDictionary objectForKey:](self->_spIdKnownUserScores, "objectForKey:", v13, (_QWORD)v29);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKey:", v14, v13);

        }
        v10 = -[NSDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v10);
    }

    v15 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("spIdKnownUserScores"));

  }
  spIdUserScoresVersion = self->_spIdUserScoresVersion;
  if (spIdUserScoresVersion)
    objc_msgSend(v4, "setObject:forKey:", spIdUserScoresVersion, CFSTR("spIdUserScoresVersion"));
  spIdScoreThresholdingType = self->_spIdScoreThresholdingType;
  if (spIdScoreThresholdingType)
    objc_msgSend(v4, "setObject:forKey:", spIdScoreThresholdingType, CFSTR("spIdScoreThresholdingType"));
  spIdAssetVersion = self->_spIdAssetVersion;
  if (spIdAssetVersion)
    objc_msgSend(v4, "setObject:forKey:", spIdAssetVersion, CFSTR("spIdAssetVersion"));
  userClassified = self->_userClassified;
  if (userClassified)
    objc_msgSend(v4, "setObject:forKey:", userClassified, CFSTR("userClassified"));
  userIdentityClassification = self->_userIdentityClassification;
  if (userIdentityClassification > 4)
    v21 = CFSTR("(unknown)");
  else
    v21 = off_1E3A32620[userIdentityClassification];
  v22 = v21;
  objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("userIdentityClassification"));

  lowScoreThreshold = self->_lowScoreThreshold;
  if (lowScoreThreshold)
    objc_msgSend(v4, "setObject:forKey:", lowScoreThreshold, CFSTR("lowScoreThreshold"));
  highScoreThreshold = self->_highScoreThreshold;
  if (highScoreThreshold)
    objc_msgSend(v4, "setObject:forKey:", highScoreThreshold, CFSTR("highScoreThreshold"));
  confidentScoreThreshold = self->_confidentScoreThreshold;
  if (confidentScoreThreshold)
    objc_msgSend(v4, "setObject:forKey:", confidentScoreThreshold, CFSTR("confidentScoreThreshold"));
  deltaScoreThreshold = self->_deltaScoreThreshold;
  if (deltaScoreThreshold)
    objc_msgSend(v4, "setObject:forKey:", deltaScoreThreshold, CFSTR("deltaScoreThreshold"));
  v27 = (void *)objc_msgSend(v4, "copy", (_QWORD)v29);

  return v27;
}

- (NSNumber)spIdAudioProcessedDuration
{
  return self->_spIdAudioProcessedDuration;
}

- (NSNumber)spIdUnknownUserScore
{
  return self->_spIdUnknownUserScore;
}

- (NSDictionary)spIdKnownUserScores
{
  return self->_spIdKnownUserScores;
}

- (NSNumber)spIdUserScoresVersion
{
  return self->_spIdUserScoresVersion;
}

- (NSString)spIdScoreThresholdingType
{
  return self->_spIdScoreThresholdingType;
}

- (NSString)spIdAssetVersion
{
  return self->_spIdAssetVersion;
}

- (NSString)userClassified
{
  return self->_userClassified;
}

- (int64_t)userIdentityClassification
{
  return self->_userIdentityClassification;
}

- (NSNumber)lowScoreThreshold
{
  return self->_lowScoreThreshold;
}

- (NSNumber)highScoreThreshold
{
  return self->_highScoreThreshold;
}

- (NSNumber)confidentScoreThreshold
{
  return self->_confidentScoreThreshold;
}

- (NSNumber)deltaScoreThreshold
{
  return self->_deltaScoreThreshold;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deltaScoreThreshold, 0);
  objc_storeStrong((id *)&self->_confidentScoreThreshold, 0);
  objc_storeStrong((id *)&self->_highScoreThreshold, 0);
  objc_storeStrong((id *)&self->_lowScoreThreshold, 0);
  objc_storeStrong((id *)&self->_userClassified, 0);
  objc_storeStrong((id *)&self->_spIdAssetVersion, 0);
  objc_storeStrong((id *)&self->_spIdScoreThresholdingType, 0);
  objc_storeStrong((id *)&self->_spIdUserScoresVersion, 0);
  objc_storeStrong((id *)&self->_spIdKnownUserScores, 0);
  objc_storeStrong((id *)&self->_spIdUnknownUserScore, 0);
  objc_storeStrong((id *)&self->_spIdAudioProcessedDuration, 0);
}

void __205__AFVoiceIdScoreCard_initWithSpIdAudioProcessedDuration_spIdUnknownUserScore_spIdKnownUserScores_spIdUserScoresVersion_spIdScoreThresholdingType_spIdAssetVersion_userClassified_userIdentityClassification___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = a1[4];
  v4 = a2;
  objc_msgSend(v4, "setSpIdAudioProcessedDuration:", v3);
  objc_msgSend(v4, "setSpIdUnknownUserScore:", a1[5]);
  objc_msgSend(v4, "setSpIdKnownUserScores:", a1[6]);
  objc_msgSend(v4, "setSpIdUserScoresVersion:", a1[7]);
  objc_msgSend(v4, "setSpIdScoreThresholdingType:", a1[8]);
  objc_msgSend(v4, "setSpIdAssetVersion:", a1[9]);
  objc_msgSend(v4, "setUserClassified:", a1[10]);
  objc_msgSend(v4, "setUserIdentityClassification:", a1[11]);

}

void __286__AFVoiceIdScoreCard_initWithSpIdAudioProcessedDuration_spIdUnknownUserScore_spIdKnownUserScores_spIdUserScoresVersion_spIdScoreThresholdingType_spIdAssetVersion_userClassified_userIdentityClassification_lowScoreThreshold_highScoreThreshold_confidentScoreThreshold_deltaScoreThreshold___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = a1[4];
  v4 = a2;
  objc_msgSend(v4, "setSpIdAudioProcessedDuration:", v3);
  objc_msgSend(v4, "setSpIdUnknownUserScore:", a1[5]);
  objc_msgSend(v4, "setSpIdKnownUserScores:", a1[6]);
  objc_msgSend(v4, "setSpIdUserScoresVersion:", a1[7]);
  objc_msgSend(v4, "setSpIdScoreThresholdingType:", a1[8]);
  objc_msgSend(v4, "setSpIdAssetVersion:", a1[9]);
  objc_msgSend(v4, "setUserClassified:", a1[10]);
  objc_msgSend(v4, "setUserIdentityClassification:", a1[15]);
  objc_msgSend(v4, "setLowScoreThreshold:", a1[11]);
  objc_msgSend(v4, "setHighScoreThreshold:", a1[12]);
  objc_msgSend(v4, "setConfidentScoreThreshold:", a1[13]);
  objc_msgSend(v4, "setDeltaScoreThreshold:", a1[14]);

}

+ (id)newWithBuilder:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBuilder:", v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  void (**v4)(id, _AFVoiceIdScoreCardMutation *);
  _AFVoiceIdScoreCardMutation *v5;
  AFVoiceIdScoreCard *v6;
  void *v7;
  uint64_t v8;
  NSNumber *spIdAudioProcessedDuration;
  void *v10;
  uint64_t v11;
  NSNumber *spIdUnknownUserScore;
  void *v13;
  uint64_t v14;
  NSDictionary *spIdKnownUserScores;
  void *v16;
  uint64_t v17;
  NSNumber *spIdUserScoresVersion;
  void *v19;
  uint64_t v20;
  NSString *spIdScoreThresholdingType;
  void *v22;
  uint64_t v23;
  NSString *spIdAssetVersion;
  void *v25;
  uint64_t v26;
  NSString *userClassified;
  void *v28;
  uint64_t v29;
  NSNumber *lowScoreThreshold;
  void *v31;
  uint64_t v32;
  NSNumber *highScoreThreshold;
  void *v34;
  uint64_t v35;
  NSNumber *confidentScoreThreshold;
  void *v37;
  uint64_t v38;
  NSNumber *deltaScoreThreshold;

  v4 = (void (**)(id, _AFVoiceIdScoreCardMutation *))a3;
  if (v4)
  {
    v5 = -[_AFVoiceIdScoreCardMutation initWithBase:]([_AFVoiceIdScoreCardMutation alloc], "initWithBase:", self);
    v4[2](v4, v5);
    if (-[_AFVoiceIdScoreCardMutation isDirty](v5, "isDirty"))
    {
      v6 = objc_alloc_init(AFVoiceIdScoreCard);
      -[_AFVoiceIdScoreCardMutation getSpIdAudioProcessedDuration](v5, "getSpIdAudioProcessedDuration");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "copy");
      spIdAudioProcessedDuration = v6->_spIdAudioProcessedDuration;
      v6->_spIdAudioProcessedDuration = (NSNumber *)v8;

      -[_AFVoiceIdScoreCardMutation getSpIdUnknownUserScore](v5, "getSpIdUnknownUserScore");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "copy");
      spIdUnknownUserScore = v6->_spIdUnknownUserScore;
      v6->_spIdUnknownUserScore = (NSNumber *)v11;

      -[_AFVoiceIdScoreCardMutation getSpIdKnownUserScores](v5, "getSpIdKnownUserScores");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "copy");
      spIdKnownUserScores = v6->_spIdKnownUserScores;
      v6->_spIdKnownUserScores = (NSDictionary *)v14;

      -[_AFVoiceIdScoreCardMutation getSpIdUserScoresVersion](v5, "getSpIdUserScoresVersion");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "copy");
      spIdUserScoresVersion = v6->_spIdUserScoresVersion;
      v6->_spIdUserScoresVersion = (NSNumber *)v17;

      -[_AFVoiceIdScoreCardMutation getSpIdScoreThresholdingType](v5, "getSpIdScoreThresholdingType");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "copy");
      spIdScoreThresholdingType = v6->_spIdScoreThresholdingType;
      v6->_spIdScoreThresholdingType = (NSString *)v20;

      -[_AFVoiceIdScoreCardMutation getSpIdAssetVersion](v5, "getSpIdAssetVersion");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "copy");
      spIdAssetVersion = v6->_spIdAssetVersion;
      v6->_spIdAssetVersion = (NSString *)v23;

      -[_AFVoiceIdScoreCardMutation getUserClassified](v5, "getUserClassified");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "copy");
      userClassified = v6->_userClassified;
      v6->_userClassified = (NSString *)v26;

      v6->_userIdentityClassification = -[_AFVoiceIdScoreCardMutation getUserIdentityClassification](v5, "getUserIdentityClassification");
      -[_AFVoiceIdScoreCardMutation getLowScoreThreshold](v5, "getLowScoreThreshold");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "copy");
      lowScoreThreshold = v6->_lowScoreThreshold;
      v6->_lowScoreThreshold = (NSNumber *)v29;

      -[_AFVoiceIdScoreCardMutation getHighScoreThreshold](v5, "getHighScoreThreshold");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "copy");
      highScoreThreshold = v6->_highScoreThreshold;
      v6->_highScoreThreshold = (NSNumber *)v32;

      -[_AFVoiceIdScoreCardMutation getConfidentScoreThreshold](v5, "getConfidentScoreThreshold");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "copy");
      confidentScoreThreshold = v6->_confidentScoreThreshold;
      v6->_confidentScoreThreshold = (NSNumber *)v35;

      -[_AFVoiceIdScoreCardMutation getDeltaScoreThreshold](v5, "getDeltaScoreThreshold");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "copy");
      deltaScoreThreshold = v6->_deltaScoreThreshold;
      v6->_deltaScoreThreshold = (NSNumber *)v38;

    }
    else
    {
      v6 = (AFVoiceIdScoreCard *)-[AFVoiceIdScoreCard copy](self, "copy");
    }

  }
  else
  {
    v6 = (AFVoiceIdScoreCard *)-[AFVoiceIdScoreCard copy](self, "copy");
  }

  return v6;
}

@end
