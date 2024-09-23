@implementation MPCRadioPlaybackIntentTracklistToken

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MPCRadioPlaybackIntentTracklistToken)initWithCoder:(id)a3
{
  id v4;
  MPCRadioPlaybackIntentTracklistToken *v5;
  uint64_t v6;
  MPModelRadioStation *radioStation;
  uint64_t v8;
  NSURL *radioStationURL;

  v4 = a3;
  v5 = -[MPCRadioPlaybackIntentTracklistToken init](self, "init");
  if (v5)
  {
    v5->_continueListeningStation = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("continue-listening"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("station"));
    v6 = objc_claimAutoreleasedReturnValue();
    radioStation = v5->_radioStation;
    v5->_radioStation = (MPModelRadioStation *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("url"));
    v8 = objc_claimAutoreleasedReturnValue();
    radioStationURL = v5->_radioStationURL;
    v5->_radioStationURL = (NSURL *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 continueListeningStation;
  id v5;

  continueListeningStation = self->_continueListeningStation;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", continueListeningStation, CFSTR("continue-listening"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_radioStation, CFSTR("station"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_radioStationURL, CFSTR("url"));

}

- (BOOL)continueListeningStation
{
  return self->_continueListeningStation;
}

- (void)setContinueListeningStation:(BOOL)a3
{
  self->_continueListeningStation = a3;
}

- (MPCModelRadioContentReference)nowPlayingContentReference
{
  return self->_nowPlayingContentReference;
}

- (void)setNowPlayingContentReference:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (MPCModelRadioContentReference)seedContentReference
{
  return self->_seedContentReference;
}

- (void)setSeedContentReference:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (MPModelRadioStation)radioStation
{
  return self->_radioStation;
}

- (void)setRadioStation:(id)a3
{
  objc_storeStrong((id *)&self->_radioStation, a3);
}

- (NSURL)radioStationURL
{
  return self->_radioStationURL;
}

- (void)setRadioStationURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_radioStationURL, 0);
  objc_storeStrong((id *)&self->_radioStation, 0);
  objc_storeStrong((id *)&self->_seedContentReference, 0);
  objc_storeStrong((id *)&self->_nowPlayingContentReference, 0);
}

@end
