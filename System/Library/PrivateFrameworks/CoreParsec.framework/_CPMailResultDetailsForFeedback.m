@implementation _CPMailResultDetailsForFeedback

- (BOOL)readFrom:(id)a3
{
  double v3;

  return _CPMailResultDetailsForFeedbackReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  float v4;
  int v5;
  void *v6;
  id v7;

  v7 = a3;
  if (-[_CPMailResultDetailsForFeedback dataSources](self, "dataSources"))
    PBDataWriterWriteInt32Field();
  -[_CPMailResultDetailsForFeedback suggestionScore](self, "suggestionScore");
  if (v4 != 0.0)
    PBDataWriterWriteFloatField();
  v5 = -[_CPMailResultDetailsForFeedback skgMegadomeSpotlightIndexEntries](self, "skgMegadomeSpotlightIndexEntries");
  v6 = v7;
  if (v5)
  {
    PBDataWriterWriteInt32Field();
    v6 = v7;
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int dataSources;
  float suggestionScore;
  float v7;
  BOOL v8;
  int skgMegadomeSpotlightIndexEntries;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && (dataSources = self->_dataSources, dataSources == objc_msgSend(v4, "dataSources"))
    && (suggestionScore = self->_suggestionScore, objc_msgSend(v4, "suggestionScore"), suggestionScore == v7))
  {
    skgMegadomeSpotlightIndexEntries = self->_skgMegadomeSpotlightIndexEntries;
    v8 = skgMegadomeSpotlightIndexEntries == objc_msgSend(v4, "skgMegadomeSpotlightIndexEntries");
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v2;
  float suggestionScore;
  double v4;
  long double v5;

  suggestionScore = self->_suggestionScore;
  v4 = suggestionScore;
  if (suggestionScore < 0.0)
    v4 = -suggestionScore;
  v5 = round(v4);
  v2 = 2654435761 * self->_dataSources;
  return (2654435761 * self->_skgMegadomeSpotlightIndexEntries) ^ v2 ^ ((unint64_t)(fmod(v5, 1.84467441e19)
                                                                                           * 2654435760.0)
                                                                        + vcvtd_n_u64_f64(v4 - v5, 0x40uLL));
}

- (int)dataSources
{
  return self->_dataSources;
}

- (void)setDataSources:(int)a3
{
  self->_dataSources = a3;
}

- (float)suggestionScore
{
  return self->_suggestionScore;
}

- (void)setSuggestionScore:(float)a3
{
  self->_suggestionScore = a3;
}

- (int)skgMegadomeSpotlightIndexEntries
{
  return self->_skgMegadomeSpotlightIndexEntries;
}

- (void)setSkgMegadomeSpotlightIndexEntries:(int)a3
{
  self->_skgMegadomeSpotlightIndexEntries = a3;
}

- (_CPMailResultDetailsForFeedback)initWithFacade:(id)a3
{
  id v4;
  _CPMailResultDetailsForFeedback *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _CPMailResultDetailsForFeedback *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_CPMailResultDetailsForFeedback;
  v5 = -[_CPMailResultDetailsForFeedback init](&v12, sel_init);
  if (v5)
  {
    -[_CPMailResultDetailsForFeedback setDataSources:](v5, "setDataSources:", objc_msgSend(v4, "dataSources"));
    objc_msgSend(v4, "suggestionScore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "suggestionScore");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "floatValue");
      -[_CPMailResultDetailsForFeedback setSuggestionScore:](v5, "setSuggestionScore:");

    }
    objc_msgSend(v4, "skgMegadomeSpotlightIndexEntries");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "skgMegadomeSpotlightIndexEntries");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CPMailResultDetailsForFeedback setSkgMegadomeSpotlightIndexEntries:](v5, "setSkgMegadomeSpotlightIndexEntries:", objc_msgSend(v9, "intValue"));

    }
    v10 = v5;
  }

  return v5;
}

@end
