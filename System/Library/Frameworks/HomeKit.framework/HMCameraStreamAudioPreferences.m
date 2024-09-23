@implementation HMCameraStreamAudioPreferences

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[HMCameraStreamAudioPreferences codecs](self, "codecs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<HMCameraStreamAudioPreferences codecs: %@>"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (HMCameraStreamAudioPreferences)initWithCoder:(id)a3
{
  id v4;
  HMCameraStreamAudioPreferences *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[HMCameraStreamAudioPreferences init](self, "init");
  v6 = (void *)MEMORY[0x1E0C99E60];
  v11[0] = objc_opt_class();
  v11[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("HM.CameraStreamAudioCodecs"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMCameraStreamAudioPreferences setCodecs:](v5, "setCodecs:", v9);
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMCameraStreamAudioPreferences codecs](self, "codecs");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HM.CameraStreamAudioCodecs"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    -[HMCameraStreamAudioPreferences codecs](self, "codecs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "codecs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToSet:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMCameraStreamAudioPreferences codecs](self, "codecs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSSet)codecs
{
  return (NSSet *)objc_getProperty(self, a2, 8, 1);
}

- (void)setCodecs:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_codecs, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
