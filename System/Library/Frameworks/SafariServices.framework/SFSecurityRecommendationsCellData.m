@implementation SFSecurityRecommendationsCellData

- (SFSecurityRecommendationsCellData)initWithLoadingSubtitle
{
  void *v3;
  SFSecurityRecommendationsCellData *v4;

  _WBSLocalizedString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SFSecurityRecommendationsCellData initWithSubtitleText:numberOfWarnings:warningStyle:](self, "initWithSubtitleText:numberOfWarnings:warningStyle:", v3, 0, 0);

  return v4;
}

- (SFSecurityRecommendationsCellData)initWithSubtitleText:(id)a3 numberOfWarnings:(unint64_t)a4 warningStyle:(int64_t)a5
{
  id v8;
  SFSecurityRecommendationsCellData *v9;
  uint64_t v10;
  NSString *subtitleText;
  SFSecurityRecommendationsCellData *v12;
  objc_super v14;

  v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SFSecurityRecommendationsCellData;
  v9 = -[SFSecurityRecommendationsCellData init](&v14, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    subtitleText = v9->_subtitleText;
    v9->_subtitleText = (NSString *)v10;

    v9->_numberOfWarnings = a4;
    v9->_warningStyle = a5;
    v12 = v9;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  SFSecurityRecommendationsCellData *v4;
  SFSecurityRecommendationsCellData *v5;
  BOOL v6;

  v4 = (SFSecurityRecommendationsCellData *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[NSString isEqualToString:](self->_subtitleText, "isEqualToString:", v5->_subtitleText)
        && self->_numberOfWarnings == v5->_numberOfWarnings
        && self->_warningStyle == v5->_warningStyle;

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  return self->_numberOfWarnings ^ self->_warningStyle ^ -[NSString hash](self->_subtitleText, "hash");
}

- (NSString)subtitleText
{
  return self->_subtitleText;
}

- (void)setSubtitleText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (unint64_t)numberOfWarnings
{
  return self->_numberOfWarnings;
}

- (void)setNumberOfWarnings:(unint64_t)a3
{
  self->_numberOfWarnings = a3;
}

- (int64_t)warningStyle
{
  return self->_warningStyle;
}

- (void)setWarningStyle:(int64_t)a3
{
  self->_warningStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleText, 0);
}

@end
