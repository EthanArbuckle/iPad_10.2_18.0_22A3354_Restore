@implementation HMCameraStreamVideoPreferences

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[HMCameraStreamVideoPreferences resolutions](self, "resolutions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<HMCameraStreamVideoPreferences resolutions: %@>"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (HMCameraStreamVideoPreferences)initWithCoder:(id)a3
{
  id v4;
  HMCameraStreamVideoPreferences *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[HMCameraStreamVideoPreferences init](self, "init");
  v6 = (void *)MEMORY[0x1E0C99E60];
  v11[0] = objc_opt_class();
  v11[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("HM.CameraStreamVideoResolutions"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMCameraStreamVideoPreferences setResolutions:](v5, "setResolutions:", v9);
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMCameraStreamVideoPreferences resolutions](self, "resolutions");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HM.CameraStreamVideoResolutions"));

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
    -[HMCameraStreamVideoPreferences resolutions](self, "resolutions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "resolutions");
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

  -[HMCameraStreamVideoPreferences resolutions](self, "resolutions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSSet)resolutions
{
  return (NSSet *)objc_getProperty(self, a2, 8, 1);
}

- (void)setResolutions:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolutions, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
