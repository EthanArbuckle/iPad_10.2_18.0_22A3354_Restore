@implementation FMSongMetadata

- (FMSongMetadata)init
{
  FMSongMetadata *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FMSongMetadata;
  result = -[FMSongMetadata init](&v3, sel_init);
  if (result)
    result->_style = -1;
  return result;
}

- (NSString)artistName
{
  return self->_artistName;
}

- (void)setArtistName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)songName
{
  return self->_songName;
}

- (void)setSongName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)mood
{
  return self->_mood;
}

- (void)setMood:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)moodAlt
{
  return self->_moodAlt;
}

- (void)setMoodAlt:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)pace
{
  return self->_pace;
}

- (void)setPace:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSSet)genres
{
  return self->_genres;
}

- (void)setGenres:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSSet)regions
{
  return self->_regions;
}

- (void)setRegions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSSet)keywords
{
  return self->_keywords;
}

- (void)setKeywords:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSDictionary)weightedKeywords
{
  return self->_weightedKeywords;
}

- (void)setWeightedKeywords:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (double)visualTempo
{
  return self->_visualTempo;
}

- (void)setVisualTempo:(double)a3
{
  self->_visualTempo = a3;
}

- (double)arousal
{
  return self->_arousal;
}

- (void)setArousal:(double)a3
{
  self->_arousal = a3;
}

- (double)valence
{
  return self->_valence;
}

- (void)setValence:(double)a3
{
  self->_valence = a3;
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (BOOL)hidden
{
  return self->_hidden;
}

- (void)setHidden:(BOOL)a3
{
  self->_hidden = a3;
}

- (BOOL)recalled
{
  return self->_recalled;
}

- (void)setRecalled:(BOOL)a3
{
  self->_recalled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weightedKeywords, 0);
  objc_storeStrong((id *)&self->_keywords, 0);
  objc_storeStrong((id *)&self->_regions, 0);
  objc_storeStrong((id *)&self->_genres, 0);
  objc_storeStrong((id *)&self->_pace, 0);
  objc_storeStrong((id *)&self->_moodAlt, 0);
  objc_storeStrong((id *)&self->_mood, 0);
  objc_storeStrong((id *)&self->_songName, 0);
  objc_storeStrong((id *)&self->_artistName, 0);
}

@end
