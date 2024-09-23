@implementation ATAudioTap

- (ATAudioTap)initWithTapDescription:(id)a3
{
  id v5;
  ATAudioTap *v6;
  ATAudioTap *v7;
  ATAudioTap *v8;
  NSObject *v9;
  objc_super v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v11.receiver = self;
    v11.super_class = (Class)ATAudioTap;
    v6 = -[ATAudioTap init](&v11, sel_init);
    v7 = v6;
    if (v6)
      objc_storeStrong((id *)&v6->_tapDescription, a3);
    self = v7;
    v8 = self;
  }
  else
  {
    gATAudioTapLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v13 = "ATAudioTap.mm";
      v14 = 1024;
      v15 = 387;
      _os_log_impl(&dword_1A0F4D000, v9, OS_LOG_TYPE_INFO, "%25s:%-5d tapDescription should be non-nil", buf, 0x12u);
    }

    v8 = 0;
  }

  return v8;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  const char *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATAudioTap tapDescription](self, "tapDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ATAudioTap isScreenSharingHost](self, "isScreenSharingHost");
  v9 = "";
  if (v8)
    v9 = ", screen sharing host -> YES";
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@@%p: tap description -> %@%s>"), v5, self, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_tapDescription, CFSTR("tapDescription"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_screenSharingHost, CFSTR("screenSharingHost"));

}

- (ATAudioTap)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ATAudioTap *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tapDescription"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ATAudioTap initWithTapDescription:](self, "initWithTapDescription:", v5);
  if (v6)
    v6->_screenSharingHost = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("screenSharingHost"));

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  ATAudioTap *v4;
  ATAudioTap *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  _BOOL4 v9;

  v4 = (ATAudioTap *)a3;
  if (v4 == self)
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[ATAudioTap tapDescription](self, "tapDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATAudioTap tapDescription](v5, "tapDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqual:", v7))
      {
        v8 = -[ATAudioTap isScreenSharingHost](self, "isScreenSharingHost");
        v9 = v8 ^ -[ATAudioTap isScreenSharingHost](v5, "isScreenSharingHost") ^ 1;
      }
      else
      {
        LOBYTE(v9) = 0;
      }

    }
    else
    {
      LOBYTE(v9) = 0;
    }
  }

  return v9;
}

- (ATAudioTapDescription)tapDescription
{
  return self->_tapDescription;
}

- (BOOL)isScreenSharingHost
{
  return self->_screenSharingHost;
}

- (void)setScreenSharingHost:(BOOL)a3
{
  self->_screenSharingHost = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapDescription, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
