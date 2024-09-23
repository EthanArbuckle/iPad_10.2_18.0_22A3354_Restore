@implementation SFVoiceAnalytics

- (void)encodeWithCoder:(id)a3
{
  SFAcousticFeature *jitter;
  id v5;

  jitter = self->_jitter;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", jitter, CFSTR("_jitter"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_shimmer, CFSTR("_shimmer"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_pitch, CFSTR("_pitch"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_voicing, CFSTR("_voicing"));

}

- (SFVoiceAnalytics)initWithCoder:(id)a3
{
  id v4;
  SFVoiceAnalytics *v5;
  uint64_t v6;
  SFAcousticFeature *jitter;
  uint64_t v8;
  SFAcousticFeature *shimmer;
  uint64_t v10;
  SFAcousticFeature *pitch;
  uint64_t v12;
  SFAcousticFeature *voicing;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SFVoiceAnalytics;
  v5 = -[SFVoiceAnalytics init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_jitter"));
    v6 = objc_claimAutoreleasedReturnValue();
    jitter = v5->_jitter;
    v5->_jitter = (SFAcousticFeature *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_shimmer"));
    v8 = objc_claimAutoreleasedReturnValue();
    shimmer = v5->_shimmer;
    v5->_shimmer = (SFAcousticFeature *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_pitch"));
    v10 = objc_claimAutoreleasedReturnValue();
    pitch = v5->_pitch;
    v5->_pitch = (SFAcousticFeature *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_voicing"));
    v12 = objc_claimAutoreleasedReturnValue();
    voicing = v5->_voicing;
    v5->_voicing = (SFAcousticFeature *)v12;

  }
  return v5;
}

- (id)_initWithJitter:(id)a3 shimmer:(id)a4 pitch:(id)a5 voicing:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  SFVoiceAnalytics *v14;
  uint64_t v15;
  SFAcousticFeature *jitter;
  uint64_t v17;
  SFAcousticFeature *shimmer;
  uint64_t v19;
  SFAcousticFeature *pitch;
  uint64_t v21;
  SFAcousticFeature *voicing;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)SFVoiceAnalytics;
  v14 = -[SFVoiceAnalytics init](&v24, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    jitter = v14->_jitter;
    v14->_jitter = (SFAcousticFeature *)v15;

    v17 = objc_msgSend(v11, "copy");
    shimmer = v14->_shimmer;
    v14->_shimmer = (SFAcousticFeature *)v17;

    v19 = objc_msgSend(v12, "copy");
    pitch = v14->_pitch;
    v14->_pitch = (SFAcousticFeature *)v19;

    v21 = objc_msgSend(v13, "copy");
    voicing = v14->_voicing;
    v14->_voicing = (SFAcousticFeature *)v21;

  }
  return v14;
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SFVoiceAnalytics;
  -[SFVoiceAnalytics description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(", jitter=%@, shimmer=%@, pitch=%@, voicing=%@"), self->_jitter, self->_shimmer, self->_pitch, self->_voicing);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (SFAcousticFeature)jitter
{
  return self->_jitter;
}

- (SFAcousticFeature)shimmer
{
  return self->_shimmer;
}

- (SFAcousticFeature)pitch
{
  return self->_pitch;
}

- (SFAcousticFeature)voicing
{
  return self->_voicing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voicing, 0);
  objc_storeStrong((id *)&self->_pitch, 0);
  objc_storeStrong((id *)&self->_shimmer, 0);
  objc_storeStrong((id *)&self->_jitter, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
