@implementation AFUserUtteranceSelectionResults

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AFUserUtteranceSelectionResults;
  -[AFUserUtteranceSelectionResults description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("combinedRank: %@ combinedScore: %@ interactionId: %@ onDeviceUtterancesPresent: %@ originalRank: %@ originalScore: %@ previousUtterance; %@ sessionId: %@ utteranceSource: %@"),
    self->_combinedRank,
    self->_combinedScore,
    self->_interactionId,
    self->_onDeviceUtterancesPresent,
    self->_originalRank,
    self->_originalScore,
    self->_previousUtterance,
    self->_sessionId,
    self->_utteranceSource);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  NSNumber *combinedRank;
  id v5;

  combinedRank = self->_combinedRank;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", combinedRank, CFSTR("_combinedRank"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_combinedScore, CFSTR("_combinedScore"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_interactionId, CFSTR("_interactionId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_onDeviceUtterancesPresent, CFSTR("_onDeviceUtterancesPresent"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_originalRank, CFSTR("_originalRank"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_originalScore, CFSTR("_originalScore"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_previousUtterance, CFSTR("_previousUtterance"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sessionId, CFSTR("_sessionId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_utteranceSource, CFSTR("_utteranceSource"));

}

- (AFUserUtteranceSelectionResults)initWithCoder:(id)a3
{
  id v4;
  AFUserUtteranceSelectionResults *v5;
  uint64_t v6;
  NSNumber *combinedRank;
  uint64_t v8;
  NSNumber *combinedScore;
  uint64_t v10;
  NSString *interactionId;
  uint64_t v12;
  NSNumber *onDeviceUtterancesPresent;
  uint64_t v14;
  NSNumber *originalRank;
  uint64_t v16;
  NSNumber *originalScore;
  uint64_t v18;
  NSString *previousUtterance;
  uint64_t v20;
  NSString *sessionId;
  uint64_t v22;
  NSString *utteranceSource;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)AFUserUtteranceSelectionResults;
  v5 = -[AFUserUtteranceSelectionResults init](&v25, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_combinedRank"));
    v6 = objc_claimAutoreleasedReturnValue();
    combinedRank = v5->_combinedRank;
    v5->_combinedRank = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_combinedScore"));
    v8 = objc_claimAutoreleasedReturnValue();
    combinedScore = v5->_combinedScore;
    v5->_combinedScore = (NSNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_interactionId"));
    v10 = objc_claimAutoreleasedReturnValue();
    interactionId = v5->_interactionId;
    v5->_interactionId = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_onDeviceUtterancesPresent"));
    v12 = objc_claimAutoreleasedReturnValue();
    onDeviceUtterancesPresent = v5->_onDeviceUtterancesPresent;
    v5->_onDeviceUtterancesPresent = (NSNumber *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_originalRank"));
    v14 = objc_claimAutoreleasedReturnValue();
    originalRank = v5->_originalRank;
    v5->_originalRank = (NSNumber *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_originalScore"));
    v16 = objc_claimAutoreleasedReturnValue();
    originalScore = v5->_originalScore;
    v5->_originalScore = (NSNumber *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_previousUtterance"));
    v18 = objc_claimAutoreleasedReturnValue();
    previousUtterance = v5->_previousUtterance;
    v5->_previousUtterance = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_sessionId"));
    v20 = objc_claimAutoreleasedReturnValue();
    sessionId = v5->_sessionId;
    v5->_sessionId = (NSString *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_utteranceSource"));
    v22 = objc_claimAutoreleasedReturnValue();
    utteranceSource = v5->_utteranceSource;
    v5->_utteranceSource = (NSString *)v22;

  }
  return v5;
}

- (NSNumber)combinedRank
{
  return self->_combinedRank;
}

- (void)setCombinedRank:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)combinedScore
{
  return self->_combinedScore;
}

- (void)setCombinedScore:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)interactionId
{
  return self->_interactionId;
}

- (void)setInteractionId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)onDeviceUtterancesPresent
{
  return self->_onDeviceUtterancesPresent;
}

- (void)setOnDeviceUtterancesPresent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)originalRank
{
  return self->_originalRank;
}

- (void)setOriginalRank:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSNumber)originalScore
{
  return self->_originalScore;
}

- (void)setOriginalScore:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)previousUtterance
{
  return self->_previousUtterance;
}

- (void)setPreviousUtterance:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)sessionId
{
  return self->_sessionId;
}

- (void)setSessionId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)utteranceSource
{
  return self->_utteranceSource;
}

- (void)setUtteranceSource:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_utteranceSource, 0);
  objc_storeStrong((id *)&self->_sessionId, 0);
  objc_storeStrong((id *)&self->_previousUtterance, 0);
  objc_storeStrong((id *)&self->_originalScore, 0);
  objc_storeStrong((id *)&self->_originalRank, 0);
  objc_storeStrong((id *)&self->_onDeviceUtterancesPresent, 0);
  objc_storeStrong((id *)&self->_interactionId, 0);
  objc_storeStrong((id *)&self->_combinedScore, 0);
  objc_storeStrong((id *)&self->_combinedRank, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
