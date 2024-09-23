@implementation MPCReportingLyricsViewEvent

- (MPModelSong)modelSong
{
  return self->_modelSong;
}

- (void)setModelSong:(id)a3
{
  objc_storeStrong((id *)&self->_modelSong, a3);
}

- (MPModelPlayEvent)modelPlayEvent
{
  return self->_modelPlayEvent;
}

- (void)setModelPlayEvent:(id)a3
{
  objc_storeStrong((id *)&self->_modelPlayEvent, a3);
}

- (NSString)lyricsID
{
  return self->_lyricsID;
}

- (void)setLyricsID:(id)a3
{
  objc_storeStrong((id *)&self->_lyricsID, a3);
}

- (double)visibleDuration
{
  return self->_visibleDuration;
}

- (void)setVisibleDuration:(double)a3
{
  self->_visibleDuration = a3;
}

- (int64_t)displayType
{
  return self->_displayType;
}

- (void)setDisplayType:(int64_t)a3
{
  self->_displayType = a3;
}

- (int64_t)displayedCharacterCount
{
  return self->_displayedCharacterCount;
}

- (void)setDisplayedCharacterCount:(int64_t)a3
{
  self->_displayedCharacterCount = a3;
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)featureName
{
  return self->_featureName;
}

- (void)setFeatureName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)queueGroupingID
{
  return self->_queueGroupingID;
}

- (void)setQueueGroupingID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSData)recommendationData
{
  return self->_recommendationData;
}

- (void)setRecommendationData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (int64_t)sourceType
{
  return self->_sourceType;
}

- (void)setSourceType:(int64_t)a3
{
  self->_sourceType = a3;
}

- (BOOL)continuityCameraUsed
{
  return self->_continuityCameraUsed;
}

- (void)setContinuityCameraUsed:(BOOL)a3
{
  self->_continuityCameraUsed = a3;
}

- (int64_t)userPreferenceSyllable
{
  return self->_userPreferenceSyllable;
}

- (void)setUserPreferenceSyllable:(int64_t)a3
{
  self->_userPreferenceSyllable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recommendationData, 0);
  objc_storeStrong((id *)&self->_queueGroupingID, 0);
  objc_storeStrong((id *)&self->_featureName, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_lyricsID, 0);
  objc_storeStrong((id *)&self->_modelPlayEvent, 0);
  objc_storeStrong((id *)&self->_modelSong, 0);
}

@end
