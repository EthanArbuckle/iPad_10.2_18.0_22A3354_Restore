@implementation MPCModelPlaybackIntentTracklistToken

+ (MPPropertySet)requiredPropertiesForStaticMediaClips
{
  return (MPPropertySet *)+[MPCModelMediaClipAVItem requiredMediaClipProperties](MPCModelMediaClipAVItem, "requiredMediaClipProperties");
}

- (void)setStartItemIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setRequest:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MPCModelPlaybackIntentTracklistToken)initWithCoder:(id)a3
{
  id v4;
  MPCModelPlaybackIntentTracklistToken *v5;
  uint64_t v6;
  MPModelRequest *request;
  uint64_t v8;
  MPIdentifierSet *startItemIdentifiers;

  v4 = a3;
  v5 = -[MPCModelPlaybackIntentTracklistToken init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MPCModelPlaybackIntentTracklistTokenRequest"));
    v6 = objc_claimAutoreleasedReturnValue();
    request = v5->_request;
    v5->_request = (MPModelRequest *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MPCModelPlaybackIntentTracklistTokenStartItemIdentifiers"));
    v8 = objc_claimAutoreleasedReturnValue();
    startItemIdentifiers = v5->_startItemIdentifiers;
    v5->_startItemIdentifiers = (MPIdentifierSet *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  MPModelRequest *request;
  id v5;

  request = self->_request;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", request, CFSTR("MPCModelPlaybackIntentTracklistTokenRequest"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_startItemIdentifiers, CFSTR("MPCModelPlaybackIntentTracklistTokenStartItemIdentifiers"));

}

- (MPModelRequest)request
{
  return self->_request;
}

- (MPIdentifierSet)startItemIdentifiers
{
  return self->_startItemIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startItemIdentifiers, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end
