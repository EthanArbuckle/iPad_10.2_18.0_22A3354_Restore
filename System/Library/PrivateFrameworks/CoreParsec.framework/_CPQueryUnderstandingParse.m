@implementation _CPQueryUnderstandingParse

- (BOOL)readFrom:(id)a3
{
  return _CPQueryUnderstandingParseReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (-[_CPQueryUnderstandingParse queryIntentType](self, "queryIntentType"))
    PBDataWriterWriteInt32Field();
  if (-[_CPQueryUnderstandingParse hasUnspecifiedTokens](self, "hasUnspecifiedTokens"))
    PBDataWriterWriteBOOLField();
  if (-[_CPQueryUnderstandingParse hasSortCriteriaTokens](self, "hasSortCriteriaTokens"))
    PBDataWriterWriteBOOLField();
  if (-[_CPQueryUnderstandingParse hasLocationTokens](self, "hasLocationTokens"))
    PBDataWriterWriteBOOLField();
  if (-[_CPQueryUnderstandingParse hasActionTokens](self, "hasActionTokens"))
    PBDataWriterWriteBOOLField();
  if (-[_CPQueryUnderstandingParse hasMediaTypeTokens](self, "hasMediaTypeTokens"))
    PBDataWriterWriteBOOLField();
  if (-[_CPQueryUnderstandingParse hasVisualQualityTokens](self, "hasVisualQualityTokens"))
    PBDataWriterWriteBOOLField();
  if (-[_CPQueryUnderstandingParse hasNounTokens](self, "hasNounTokens"))
    PBDataWriterWriteBOOLField();
  if (-[_CPQueryUnderstandingParse hasTimeTokens](self, "hasTimeTokens"))
    PBDataWriterWriteBOOLField();
  if (-[_CPQueryUnderstandingParse hasEventTokens](self, "hasEventTokens"))
    PBDataWriterWriteBOOLField();
  if (-[_CPQueryUnderstandingParse hasGenericLocationTokens](self, "hasGenericLocationTokens"))
    PBDataWriterWriteBOOLField();
  if (-[_CPQueryUnderstandingParse hasCaptureDeviceTokens](self, "hasCaptureDeviceTokens"))
    PBDataWriterWriteBOOLField();
  if (-[_CPQueryUnderstandingParse hasFavoritedTokens](self, "hasFavoritedTokens"))
    PBDataWriterWriteBOOLField();
  if (-[_CPQueryUnderstandingParse hasSourceAppTokens](self, "hasSourceAppTokens"))
    PBDataWriterWriteBOOLField();
  if (-[_CPQueryUnderstandingParse hasPersonTokens](self, "hasPersonTokens"))
    PBDataWriterWriteBOOLField();
  if (-[_CPQueryUnderstandingParse hasPersonSenderTokens](self, "hasPersonSenderTokens"))
    PBDataWriterWriteBOOLField();
  if (-[_CPQueryUnderstandingParse spotlightQueryIntent](self, "spotlightQueryIntent"))
    PBDataWriterWriteInt32Field();
  if (-[_CPQueryUnderstandingParse isUnsafeQuery](self, "isUnsafeQuery"))
    PBDataWriterWriteBOOLField();
  if (-[_CPQueryUnderstandingParse isBlocklistedQuery](self, "isBlocklistedQuery"))
    PBDataWriterWriteBOOLField();

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int queryIntentType;
  int hasUnspecifiedTokens;
  int hasSortCriteriaTokens;
  int hasLocationTokens;
  int hasActionTokens;
  int hasMediaTypeTokens;
  int hasVisualQualityTokens;
  int hasNounTokens;
  int hasTimeTokens;
  int hasEventTokens;
  int hasGenericLocationTokens;
  int hasCaptureDeviceTokens;
  int hasFavoritedTokens;
  int hasSourceAppTokens;
  int hasPersonTokens;
  int hasPersonSenderTokens;
  int spotlightQueryIntent;
  int isUnsafeQuery;
  int isBlocklistedQuery;
  BOOL v24;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_21;
  queryIntentType = self->_queryIntentType;
  if (queryIntentType != objc_msgSend(v4, "queryIntentType"))
    goto LABEL_21;
  hasUnspecifiedTokens = self->_hasUnspecifiedTokens;
  if (hasUnspecifiedTokens != objc_msgSend(v4, "hasUnspecifiedTokens"))
    goto LABEL_21;
  hasSortCriteriaTokens = self->_hasSortCriteriaTokens;
  if (hasSortCriteriaTokens != objc_msgSend(v4, "hasSortCriteriaTokens"))
    goto LABEL_21;
  hasLocationTokens = self->_hasLocationTokens;
  if (hasLocationTokens != objc_msgSend(v4, "hasLocationTokens"))
    goto LABEL_21;
  hasActionTokens = self->_hasActionTokens;
  if (hasActionTokens != objc_msgSend(v4, "hasActionTokens"))
    goto LABEL_21;
  hasMediaTypeTokens = self->_hasMediaTypeTokens;
  if (hasMediaTypeTokens != objc_msgSend(v4, "hasMediaTypeTokens"))
    goto LABEL_21;
  hasVisualQualityTokens = self->_hasVisualQualityTokens;
  if (hasVisualQualityTokens != objc_msgSend(v4, "hasVisualQualityTokens"))
    goto LABEL_21;
  hasNounTokens = self->_hasNounTokens;
  if (hasNounTokens != objc_msgSend(v4, "hasNounTokens"))
    goto LABEL_21;
  hasTimeTokens = self->_hasTimeTokens;
  if (hasTimeTokens != objc_msgSend(v4, "hasTimeTokens"))
    goto LABEL_21;
  hasEventTokens = self->_hasEventTokens;
  if (hasEventTokens != objc_msgSend(v4, "hasEventTokens"))
    goto LABEL_21;
  hasGenericLocationTokens = self->_hasGenericLocationTokens;
  if (hasGenericLocationTokens != objc_msgSend(v4, "hasGenericLocationTokens"))
    goto LABEL_21;
  hasCaptureDeviceTokens = self->_hasCaptureDeviceTokens;
  if (hasCaptureDeviceTokens == objc_msgSend(v4, "hasCaptureDeviceTokens")
    && (hasFavoritedTokens = self->_hasFavoritedTokens,
        hasFavoritedTokens == objc_msgSend(v4, "hasFavoritedTokens"))
    && (hasSourceAppTokens = self->_hasSourceAppTokens,
        hasSourceAppTokens == objc_msgSend(v4, "hasSourceAppTokens"))
    && (hasPersonTokens = self->_hasPersonTokens, hasPersonTokens == objc_msgSend(v4, "hasPersonTokens"))
    && (hasPersonSenderTokens = self->_hasPersonSenderTokens,
        hasPersonSenderTokens == objc_msgSend(v4, "hasPersonSenderTokens"))
    && (spotlightQueryIntent = self->_spotlightQueryIntent,
        spotlightQueryIntent == objc_msgSend(v4, "spotlightQueryIntent"))
    && (isUnsafeQuery = self->_isUnsafeQuery, isUnsafeQuery == objc_msgSend(v4, "isUnsafeQuery")))
  {
    isBlocklistedQuery = self->_isBlocklistedQuery;
    v24 = isBlocklistedQuery == objc_msgSend(v4, "isBlocklistedQuery");
  }
  else
  {
LABEL_21:
    v24 = 0;
  }

  return v24;
}

- (unint64_t)hash
{
  return (2654435761 * self->_hasUnspecifiedTokens) ^ (2654435761 * self->_hasSortCriteriaTokens) ^ (2654435761 * self->_queryIntentType) ^ (2654435761 * self->_hasLocationTokens) ^ (2654435761 * self->_hasActionTokens) ^ (2654435761 * self->_hasMediaTypeTokens) ^ (2654435761 * self->_hasVisualQualityTokens) ^ (2654435761 * self->_hasNounTokens) ^ (2654435761 * self->_hasTimeTokens) ^ (2654435761 * self->_hasEventTokens) ^ (2654435761 * self->_hasGenericLocationTokens) ^ (2654435761 * self->_hasCaptureDeviceTokens) ^ (2654435761 * self->_hasFavoritedTokens) ^ (2654435761 * self->_hasSourceAppTokens) ^ (2654435761 * self->_hasPersonTokens) ^ (2654435761 * self->_hasPersonSenderTokens) ^ (2654435761 * self->_spotlightQueryIntent) ^ (2654435761 * self->_isUnsafeQuery) ^ (2654435761 * self->_isBlocklistedQuery);
}

- (int)queryIntentType
{
  return self->_queryIntentType;
}

- (void)setQueryIntentType:(int)a3
{
  self->_queryIntentType = a3;
}

- (BOOL)hasUnspecifiedTokens
{
  return self->_hasUnspecifiedTokens;
}

- (void)setHasUnspecifiedTokens:(BOOL)a3
{
  self->_hasUnspecifiedTokens = a3;
}

- (BOOL)hasSortCriteriaTokens
{
  return self->_hasSortCriteriaTokens;
}

- (void)setHasSortCriteriaTokens:(BOOL)a3
{
  self->_hasSortCriteriaTokens = a3;
}

- (BOOL)hasLocationTokens
{
  return self->_hasLocationTokens;
}

- (void)setHasLocationTokens:(BOOL)a3
{
  self->_hasLocationTokens = a3;
}

- (BOOL)hasActionTokens
{
  return self->_hasActionTokens;
}

- (void)setHasActionTokens:(BOOL)a3
{
  self->_hasActionTokens = a3;
}

- (BOOL)hasMediaTypeTokens
{
  return self->_hasMediaTypeTokens;
}

- (void)setHasMediaTypeTokens:(BOOL)a3
{
  self->_hasMediaTypeTokens = a3;
}

- (BOOL)hasVisualQualityTokens
{
  return self->_hasVisualQualityTokens;
}

- (void)setHasVisualQualityTokens:(BOOL)a3
{
  self->_hasVisualQualityTokens = a3;
}

- (BOOL)hasNounTokens
{
  return self->_hasNounTokens;
}

- (void)setHasNounTokens:(BOOL)a3
{
  self->_hasNounTokens = a3;
}

- (BOOL)hasTimeTokens
{
  return self->_hasTimeTokens;
}

- (void)setHasTimeTokens:(BOOL)a3
{
  self->_hasTimeTokens = a3;
}

- (BOOL)hasEventTokens
{
  return self->_hasEventTokens;
}

- (void)setHasEventTokens:(BOOL)a3
{
  self->_hasEventTokens = a3;
}

- (BOOL)hasGenericLocationTokens
{
  return self->_hasGenericLocationTokens;
}

- (void)setHasGenericLocationTokens:(BOOL)a3
{
  self->_hasGenericLocationTokens = a3;
}

- (BOOL)hasCaptureDeviceTokens
{
  return self->_hasCaptureDeviceTokens;
}

- (void)setHasCaptureDeviceTokens:(BOOL)a3
{
  self->_hasCaptureDeviceTokens = a3;
}

- (BOOL)hasFavoritedTokens
{
  return self->_hasFavoritedTokens;
}

- (void)setHasFavoritedTokens:(BOOL)a3
{
  self->_hasFavoritedTokens = a3;
}

- (BOOL)hasSourceAppTokens
{
  return self->_hasSourceAppTokens;
}

- (void)setHasSourceAppTokens:(BOOL)a3
{
  self->_hasSourceAppTokens = a3;
}

- (BOOL)hasPersonTokens
{
  return self->_hasPersonTokens;
}

- (void)setHasPersonTokens:(BOOL)a3
{
  self->_hasPersonTokens = a3;
}

- (BOOL)hasPersonSenderTokens
{
  return self->_hasPersonSenderTokens;
}

- (void)setHasPersonSenderTokens:(BOOL)a3
{
  self->_hasPersonSenderTokens = a3;
}

- (int)spotlightQueryIntent
{
  return self->_spotlightQueryIntent;
}

- (void)setSpotlightQueryIntent:(int)a3
{
  self->_spotlightQueryIntent = a3;
}

- (BOOL)isUnsafeQuery
{
  return self->_isUnsafeQuery;
}

- (void)setIsUnsafeQuery:(BOOL)a3
{
  self->_isUnsafeQuery = a3;
}

- (BOOL)isBlocklistedQuery
{
  return self->_isBlocklistedQuery;
}

- (void)setIsBlocklistedQuery:(BOOL)a3
{
  self->_isBlocklistedQuery = a3;
}

- (_CPQueryUnderstandingParse)initWithFacade:(id)a3
{
  id v4;
  _CPQueryUnderstandingParse *v5;
  _CPQueryUnderstandingParse *v6;

  v4 = a3;
  v5 = -[_CPQueryUnderstandingParse init](self, "init");
  if (v5)
  {
    -[_CPQueryUnderstandingParse setQueryIntentType:](v5, "setQueryIntentType:", objc_msgSend(v4, "queryIntentType"));
    -[_CPQueryUnderstandingParse setHasUnspecifiedTokens:](v5, "setHasUnspecifiedTokens:", objc_msgSend(v4, "hasUnspecifiedTokens"));
    -[_CPQueryUnderstandingParse setHasSortCriteriaTokens:](v5, "setHasSortCriteriaTokens:", objc_msgSend(v4, "hasSortCriteriaTokens"));
    -[_CPQueryUnderstandingParse setHasLocationTokens:](v5, "setHasLocationTokens:", objc_msgSend(v4, "hasLocationTokens"));
    -[_CPQueryUnderstandingParse setHasPersonTokens:](v5, "setHasPersonTokens:", objc_msgSend(v4, "hasPersonTokens"));
    -[_CPQueryUnderstandingParse setHasPersonSenderTokens:](v5, "setHasPersonSenderTokens:", objc_msgSend(v4, "hasPersonSenderTokens"));
    -[_CPQueryUnderstandingParse setHasActionTokens:](v5, "setHasActionTokens:", objc_msgSend(v4, "hasActionTokens"));
    -[_CPQueryUnderstandingParse setHasMediaTypeTokens:](v5, "setHasMediaTypeTokens:", objc_msgSend(v4, "hasMediaTypeTokens"));
    -[_CPQueryUnderstandingParse setHasVisualQualityTokens:](v5, "setHasVisualQualityTokens:", objc_msgSend(v4, "hasVisualQualityTokens"));
    -[_CPQueryUnderstandingParse setHasNounTokens:](v5, "setHasNounTokens:", objc_msgSend(v4, "hasNounTokens"));
    -[_CPQueryUnderstandingParse setHasTimeTokens:](v5, "setHasTimeTokens:", objc_msgSend(v4, "hasTimeTokens"));
    -[_CPQueryUnderstandingParse setHasEventTokens:](v5, "setHasEventTokens:", objc_msgSend(v4, "hasEventTokens"));
    -[_CPQueryUnderstandingParse setHasGenericLocationTokens:](v5, "setHasGenericLocationTokens:", objc_msgSend(v4, "hasGenericLocationTokens"));
    -[_CPQueryUnderstandingParse setHasCaptureDeviceTokens:](v5, "setHasCaptureDeviceTokens:", objc_msgSend(v4, "hasCaptureDeviceTokens"));
    -[_CPQueryUnderstandingParse setHasFavoritedTokens:](v5, "setHasFavoritedTokens:", objc_msgSend(v4, "hasFavoritedTokens"));
    -[_CPQueryUnderstandingParse setHasSourceAppTokens:](v5, "setHasSourceAppTokens:", objc_msgSend(v4, "hasSourceAppTokens"));
    v6 = v5;
  }

  return v5;
}

@end
