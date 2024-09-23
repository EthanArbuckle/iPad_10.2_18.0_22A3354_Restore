@implementation SFTranscription

- (unint64_t)hash
{
  return -[NSString hash](self->_formattedString, "hash");
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSArray *segments;
  NSString *formattedString;
  BOOL v7;

  v4 = a3;
  objc_opt_class();
  v7 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    segments = self->_segments;
    if (segments == (NSArray *)v4[2] || -[NSArray isEqual:](segments, "isEqual:"))
    {
      formattedString = self->_formattedString;
      if (formattedString == (NSString *)v4[1] || -[NSString isEqual:](formattedString, "isEqual:"))
        v7 = 1;
    }
  }

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SFTranscription;
  -[SFTranscription description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(", formattedString=%@, segments=%@, speakingRate=%f, averagePauseDuration=%f"), self->_formattedString, self->_segments, *(_QWORD *)&self->_speakingRate, *(_QWORD *)&self->_averagePauseDuration);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (SFTranscription)initWithCoder:(id)a3
{
  id v4;
  SFTranscription *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *segments;
  uint64_t v11;
  NSString *formattedString;
  double v13;
  double v14;
  objc_super v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SFTranscription;
  v5 = -[SFTranscription init](&v16, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("_segments"));
    v9 = objc_claimAutoreleasedReturnValue();
    segments = v5->_segments;
    v5->_segments = (NSArray *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_formattedString"));
    v11 = objc_claimAutoreleasedReturnValue();
    formattedString = v5->_formattedString;
    v5->_formattedString = (NSString *)v11;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_speakingRate"));
    v5->_speakingRate = v13;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_avgPauseDuration"));
    v5->_averagePauseDuration = v14;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *segments;
  id v5;

  segments = self->_segments;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", segments, CFSTR("_segments"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_formattedString, CFSTR("_formattedString"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_speakingRate"), self->_speakingRate);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_avgPauseDuration"), self->_averagePauseDuration);

}

- (id)_initWithSegments:(id)a3 formattedString:(id)a4 speakingRate:(double)a5 averagePauseDuration:(double)a6
{
  id v10;
  id v11;
  SFTranscription *v12;
  uint64_t v13;
  NSArray *segments;
  uint64_t v15;
  NSString *formattedString;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v18.receiver = self;
  v18.super_class = (Class)SFTranscription;
  v12 = -[SFTranscription init](&v18, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v10, "copy");
    segments = v12->_segments;
    v12->_segments = (NSArray *)v13;

    v15 = objc_msgSend(v11, "copy");
    formattedString = v12->_formattedString;
    v12->_formattedString = (NSString *)v15;

    v12->_speakingRate = a5;
    v12->_averagePauseDuration = a6;
  }

  return v12;
}

- (NSString)formattedString
{
  return self->_formattedString;
}

- (NSArray)segments
{
  return self->_segments;
}

- (double)speakingRate
{
  return self->_speakingRate;
}

- (NSTimeInterval)averagePauseDuration
{
  return self->_averagePauseDuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segments, 0);
  objc_storeStrong((id *)&self->_formattedString, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
