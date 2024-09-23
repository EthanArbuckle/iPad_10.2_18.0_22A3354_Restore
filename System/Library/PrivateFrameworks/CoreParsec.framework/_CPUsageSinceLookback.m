@implementation _CPUsageSinceLookback

- (BOOL)readFrom:(id)a3
{
  return _CPUsageSinceLookbackReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  id v8;

  v8 = a3;
  if (-[_CPUsageSinceLookback collectionStartTimestamp](self, "collectionStartTimestamp"))
    PBDataWriterWriteInt64Field();
  if (-[_CPUsageSinceLookback collectionEndTimestamp](self, "collectionEndTimestamp"))
    PBDataWriterWriteInt64Field();
  if (-[_CPUsageSinceLookback client](self, "client"))
    PBDataWriterWriteInt32Field();
  if (-[_CPUsageSinceLookback totalUsagesInCollectionPeriod](self, "totalUsagesInCollectionPeriod"))
    PBDataWriterWriteInt32Field();
  -[_CPUsageSinceLookback context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_CPUsageSinceLookback context](self, "context");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_CPUsageSinceLookback configuredLookbackTimeInDays](self, "configuredLookbackTimeInDays"))
    PBDataWriterWriteInt32Field();
  if (-[_CPUsageSinceLookback activeDaysInCollectionPeriod](self, "activeDaysInCollectionPeriod"))
    PBDataWriterWriteInt32Field();
  if (-[_CPUsageSinceLookback totalEngagements](self, "totalEngagements"))
    PBDataWriterWriteInt32Field();
  if (-[_CPUsageSinceLookback isDiagnosticsAndUsageEnabled](self, "isDiagnosticsAndUsageEnabled"))
    PBDataWriterWriteBOOLField();
  if (-[_CPUsageSinceLookback invokedDays](self, "invokedDays"))
    PBDataWriterWriteInt32Field();
  if (-[_CPUsageSinceLookback zkwEngagedDays](self, "zkwEngagedDays"))
    PBDataWriterWriteInt32Field();
  if (-[_CPUsageSinceLookback searchedDays](self, "searchedDays"))
    PBDataWriterWriteInt32Field();
  if (-[_CPUsageSinceLookback suggestionOrAppleResultEngagedDays](self, "suggestionOrAppleResultEngagedDays"))
    PBDataWriterWriteInt32Field();
  if (-[_CPUsageSinceLookback webEngagedDays](self, "webEngagedDays"))
    PBDataWriterWriteInt32Field();
  if (-[_CPUsageSinceLookback voiceSearchDays](self, "voiceSearchDays"))
    PBDataWriterWriteInt32Field();
  v6 = -[_CPUsageSinceLookback numSearchEngagements](self, "numSearchEngagements");
  v7 = v8;
  if (v6)
  {
    PBDataWriterWriteInt32Field();
    v7 = v8;
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int64_t collectionStartTimestamp;
  int64_t collectionEndTimestamp;
  int client;
  int totalUsagesInCollectionPeriod;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  int configuredLookbackTimeInDays;
  int activeDaysInCollectionPeriod;
  int totalEngagements;
  int isDiagnosticsAndUsageEnabled;
  int invokedDays;
  int zkwEngagedDays;
  int searchedDays;
  int suggestionOrAppleResultEngagedDays;
  int webEngagedDays;
  int voiceSearchDays;
  int numSearchEngagements;
  BOOL v28;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_23;
  collectionStartTimestamp = self->_collectionStartTimestamp;
  if (collectionStartTimestamp != objc_msgSend(v4, "collectionStartTimestamp"))
    goto LABEL_23;
  collectionEndTimestamp = self->_collectionEndTimestamp;
  if (collectionEndTimestamp != objc_msgSend(v4, "collectionEndTimestamp"))
    goto LABEL_23;
  client = self->_client;
  if (client != objc_msgSend(v4, "client"))
    goto LABEL_23;
  totalUsagesInCollectionPeriod = self->_totalUsagesInCollectionPeriod;
  if (totalUsagesInCollectionPeriod != objc_msgSend(v4, "totalUsagesInCollectionPeriod"))
    goto LABEL_23;
  -[_CPUsageSinceLookback context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if ((v9 == 0) == (v10 != 0))
  {

LABEL_23:
    v28 = 0;
    goto LABEL_24;
  }
  -[_CPUsageSinceLookback context](self, "context");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_CPUsageSinceLookback context](self, "context");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "context");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_23;
  }
  else
  {

  }
  configuredLookbackTimeInDays = self->_configuredLookbackTimeInDays;
  if (configuredLookbackTimeInDays != objc_msgSend(v4, "configuredLookbackTimeInDays"))
    goto LABEL_23;
  activeDaysInCollectionPeriod = self->_activeDaysInCollectionPeriod;
  if (activeDaysInCollectionPeriod != objc_msgSend(v4, "activeDaysInCollectionPeriod"))
    goto LABEL_23;
  totalEngagements = self->_totalEngagements;
  if (totalEngagements != objc_msgSend(v4, "totalEngagements"))
    goto LABEL_23;
  isDiagnosticsAndUsageEnabled = self->_isDiagnosticsAndUsageEnabled;
  if (isDiagnosticsAndUsageEnabled != objc_msgSend(v4, "isDiagnosticsAndUsageEnabled"))
    goto LABEL_23;
  invokedDays = self->_invokedDays;
  if (invokedDays != objc_msgSend(v4, "invokedDays"))
    goto LABEL_23;
  zkwEngagedDays = self->_zkwEngagedDays;
  if (zkwEngagedDays != objc_msgSend(v4, "zkwEngagedDays"))
    goto LABEL_23;
  searchedDays = self->_searchedDays;
  if (searchedDays != objc_msgSend(v4, "searchedDays"))
    goto LABEL_23;
  suggestionOrAppleResultEngagedDays = self->_suggestionOrAppleResultEngagedDays;
  if (suggestionOrAppleResultEngagedDays != objc_msgSend(v4, "suggestionOrAppleResultEngagedDays"))
    goto LABEL_23;
  webEngagedDays = self->_webEngagedDays;
  if (webEngagedDays != objc_msgSend(v4, "webEngagedDays"))
    goto LABEL_23;
  voiceSearchDays = self->_voiceSearchDays;
  if (voiceSearchDays != objc_msgSend(v4, "voiceSearchDays"))
    goto LABEL_23;
  numSearchEngagements = self->_numSearchEngagements;
  v28 = numSearchEngagements == objc_msgSend(v4, "numSearchEngagements");
LABEL_24:

  return v28;
}

- (unint64_t)hash
{
  uint64_t v2;

  v2 = (2654435761 * self->_collectionEndTimestamp) ^ (2654435761 * self->_collectionStartTimestamp) ^ (2654435761 * self->_client) ^ (2654435761 * self->_totalUsagesInCollectionPeriod);
  return v2 ^ -[_CPDeviceContext hash](self->_context, "hash") ^ (2654435761 * self->_configuredLookbackTimeInDays) ^ (2654435761 * self->_activeDaysInCollectionPeriod) ^ (2654435761 * self->_totalEngagements) ^ (2654435761 * self->_isDiagnosticsAndUsageEnabled) ^ (2654435761 * self->_invokedDays) ^ (2654435761 * self->_zkwEngagedDays) ^ (2654435761 * self->_searchedDays) ^ (2654435761 * self->_suggestionOrAppleResultEngagedDays) ^ (2654435761 * self->_webEngagedDays) ^ (2654435761 * self->_voiceSearchDays) ^ (2654435761 * self->_numSearchEngagements);
}

- (int64_t)collectionStartTimestamp
{
  return self->_collectionStartTimestamp;
}

- (void)setCollectionStartTimestamp:(int64_t)a3
{
  self->_collectionStartTimestamp = a3;
}

- (int64_t)collectionEndTimestamp
{
  return self->_collectionEndTimestamp;
}

- (void)setCollectionEndTimestamp:(int64_t)a3
{
  self->_collectionEndTimestamp = a3;
}

- (int)client
{
  return self->_client;
}

- (void)setClient:(int)a3
{
  self->_client = a3;
}

- (int)totalUsagesInCollectionPeriod
{
  return self->_totalUsagesInCollectionPeriod;
}

- (void)setTotalUsagesInCollectionPeriod:(int)a3
{
  self->_totalUsagesInCollectionPeriod = a3;
}

- (_CPDeviceContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (int)configuredLookbackTimeInDays
{
  return self->_configuredLookbackTimeInDays;
}

- (void)setConfiguredLookbackTimeInDays:(int)a3
{
  self->_configuredLookbackTimeInDays = a3;
}

- (int)activeDaysInCollectionPeriod
{
  return self->_activeDaysInCollectionPeriod;
}

- (void)setActiveDaysInCollectionPeriod:(int)a3
{
  self->_activeDaysInCollectionPeriod = a3;
}

- (int)totalEngagements
{
  return self->_totalEngagements;
}

- (void)setTotalEngagements:(int)a3
{
  self->_totalEngagements = a3;
}

- (BOOL)isDiagnosticsAndUsageEnabled
{
  return self->_isDiagnosticsAndUsageEnabled;
}

- (void)setIsDiagnosticsAndUsageEnabled:(BOOL)a3
{
  self->_isDiagnosticsAndUsageEnabled = a3;
}

- (int)invokedDays
{
  return self->_invokedDays;
}

- (void)setInvokedDays:(int)a3
{
  self->_invokedDays = a3;
}

- (int)zkwEngagedDays
{
  return self->_zkwEngagedDays;
}

- (void)setZkwEngagedDays:(int)a3
{
  self->_zkwEngagedDays = a3;
}

- (int)searchedDays
{
  return self->_searchedDays;
}

- (void)setSearchedDays:(int)a3
{
  self->_searchedDays = a3;
}

- (int)suggestionOrAppleResultEngagedDays
{
  return self->_suggestionOrAppleResultEngagedDays;
}

- (void)setSuggestionOrAppleResultEngagedDays:(int)a3
{
  self->_suggestionOrAppleResultEngagedDays = a3;
}

- (int)webEngagedDays
{
  return self->_webEngagedDays;
}

- (void)setWebEngagedDays:(int)a3
{
  self->_webEngagedDays = a3;
}

- (int)voiceSearchDays
{
  return self->_voiceSearchDays;
}

- (void)setVoiceSearchDays:(int)a3
{
  self->_voiceSearchDays = a3;
}

- (int)numSearchEngagements
{
  return self->_numSearchEngagements;
}

- (void)setNumSearchEngagements:(int)a3
{
  self->_numSearchEngagements = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
}

@end
