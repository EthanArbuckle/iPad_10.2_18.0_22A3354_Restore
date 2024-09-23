@implementation _AFInterstitialConfigurationMutation

- (_AFInterstitialConfigurationMutation)initWithBase:(id)a3
{
  id v5;
  _AFInterstitialConfigurationMutation *v6;
  _AFInterstitialConfigurationMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFInterstitialConfigurationMutation;
  v6 = -[_AFInterstitialConfigurationMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_base, a3);

  return v7;
}

- (BOOL)isDirty
{
  return *(_WORD *)&self->_mutationFlags & 1;
}

- (int64_t)getStyle
{
  if ((*(_WORD *)&self->_mutationFlags & 2) != 0)
    return self->_style;
  else
    return -[AFInterstitialConfiguration style](self->_base, "style");
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
  *(_WORD *)&self->_mutationFlags |= 3u;
}

- (id)getLanguageCode
{
  NSString *v2;

  if ((*(_WORD *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_languageCode;
  }
  else
  {
    -[AFInterstitialConfiguration languageCode](self->_base, "languageCode");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setLanguageCode:(id)a3
{
  objc_storeStrong((id *)&self->_languageCode, a3);
  *(_WORD *)&self->_mutationFlags |= 5u;
}

- (int64_t)getGender
{
  if ((*(_WORD *)&self->_mutationFlags & 8) != 0)
    return self->_gender;
  else
    return -[AFInterstitialConfiguration gender](self->_base, "gender");
}

- (void)setGender:(int64_t)a3
{
  self->_gender = a3;
  *(_WORD *)&self->_mutationFlags |= 9u;
}

- (id)getRecordRoute
{
  NSString *v2;

  if ((*(_WORD *)&self->_mutationFlags & 0x10) != 0)
  {
    v2 = self->_recordRoute;
  }
  else
  {
    -[AFInterstitialConfiguration recordRoute](self->_base, "recordRoute");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setRecordRoute:(id)a3
{
  objc_storeStrong((id *)&self->_recordRoute, a3);
  *(_WORD *)&self->_mutationFlags |= 0x11u;
}

- (BOOL)getIsVoiceTrigger
{
  if ((*(_WORD *)&self->_mutationFlags & 0x20) != 0)
    return self->_isVoiceTrigger;
  else
    return -[AFInterstitialConfiguration isVoiceTrigger](self->_base, "isVoiceTrigger");
}

- (void)setIsVoiceTrigger:(BOOL)a3
{
  self->_isVoiceTrigger = a3;
  *(_WORD *)&self->_mutationFlags |= 0x21u;
}

- (BOOL)getIsDucking
{
  if ((*(_WORD *)&self->_mutationFlags & 0x40) != 0)
    return self->_isDucking;
  else
    return -[AFInterstitialConfiguration isDucking](self->_base, "isDucking");
}

- (void)setIsDucking:(BOOL)a3
{
  self->_isDucking = a3;
  *(_WORD *)&self->_mutationFlags |= 0x41u;
}

- (BOOL)getIsTwoShot
{
  if ((*(_WORD *)&self->_mutationFlags & 0x80) != 0)
    return self->_isTwoShot;
  else
    return -[AFInterstitialConfiguration isTwoShot](self->_base, "isTwoShot");
}

- (void)setIsTwoShot:(BOOL)a3
{
  self->_isTwoShot = a3;
  *(_WORD *)&self->_mutationFlags |= 0x81u;
}

- (unint64_t)getSpeechEndHostTime
{
  if ((*(_WORD *)&self->_mutationFlags & 0x100) != 0)
    return self->_speechEndHostTime;
  else
    return -[AFInterstitialConfiguration speechEndHostTime](self->_base, "speechEndHostTime");
}

- (void)setSpeechEndHostTime:(unint64_t)a3
{
  self->_speechEndHostTime = a3;
  *(_WORD *)&self->_mutationFlags |= 0x101u;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordRoute, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

@end
