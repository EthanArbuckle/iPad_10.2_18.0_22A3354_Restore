@implementation MRUSpatialAudioPreferences

- (MRUSpatialAudioPreferences)initWithMode:(int)a3 headTrackingEnabled:(BOOL)a4
{
  MRUSpatialAudioPreferences *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MRUSpatialAudioPreferences;
  result = -[MRUSpatialAudioPreferences init](&v7, sel_init);
  if (result)
  {
    result->_mode = a3;
    result->_isHeadTrackingEnabled = a4;
  }
  return result;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[MRUSpatialAudioPreferences descriptionForSpatialMode:](self, "descriptionForSpatialMode:", self->_mode);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (self->_isHeadTrackingEnabled)
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ mode: %@ | tracking: %@"), v4, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)descriptionForSpatialMode:(int)a3
{
  if (a3 > 3)
    return CFSTR("Unknown");
  else
    return off_1E581C240[a3];
}

- (int)mode
{
  return self->_mode;
}

- (BOOL)isHeadTrackingEnabled
{
  return self->_isHeadTrackingEnabled;
}

@end
