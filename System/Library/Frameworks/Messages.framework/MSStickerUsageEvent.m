@implementation MSStickerUsageEvent

+ (int64_t)autoSourceType
{
  return IMIsRunningIniMessageAppsViewService() != 0;
}

+ (int64_t)effectTypeFromVKCStickerEffectType:(unint64_t)a3
{
  if (a3 - 1 > 3)
    return 0;
  else
    return qword_1DB1D2330[a3 - 1];
}

+ (int64_t)stickerTypeFromExternalURI:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "containsString:", CFSTR("sticker:///user/")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "containsString:", CFSTR("sticker:///memoji/")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "containsString:", CFSTR("sticker:///emoji/")) & 1) != 0)
  {
    v4 = 2;
  }
  else
  {
    objc_msgSend(v3, "containsString:", CFSTR("sticker:///third_party/"));
    v4 = 3;
  }

  return v4;
}

+ (BOOL)isPreferredRepresentationAnimated:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "role");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CEC230]);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (int64_t)effectTypeForSticker:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;
  int64_t v6;

  v3 = a3;
  objc_msgSend(v3, "representations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[MSStickerUsageEvent isPreferredRepresentationAnimated:](MSStickerUsageEvent, "isPreferredRepresentationAnimated:", v4);

  if (v5)
    v6 = 5;
  else
    v6 = +[MSStickerUsageEvent effectTypeFromVKCStickerEffectType:](MSStickerUsageEvent, "effectTypeFromVKCStickerEffectType:", objc_msgSend(v3, "stickerEffectType"));

  return v6;
}

+ (int64_t)effectTypeForMediaPayload:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;
  int64_t v6;

  v3 = a3;
  objc_msgSend(v3, "stickerRepresentations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[MSStickerUsageEvent isPreferredRepresentationAnimated:](MSStickerUsageEvent, "isPreferredRepresentationAnimated:", v4);

  if (v5)
    v6 = 5;
  else
    v6 = +[MSStickerUsageEvent effectTypeFromVKCStickerEffectType:](MSStickerUsageEvent, "effectTypeFromVKCStickerEffectType:", objc_msgSend(v3, "stickerEffectType"));

  return v6;
}

- (MSStickerUsageEvent)initWithSticker:(id)a3
{
  id v4;
  MSStickerUsageEvent *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MSStickerUsageEvent;
  v5 = -[MSStickerUsageEvent init](&v8, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "externalURI");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSStickerUsageEvent setStickerType:](v5, "setStickerType:", +[MSStickerUsageEvent stickerTypeFromExternalURI:](MSStickerUsageEvent, "stickerTypeFromExternalURI:", v6));

    -[MSStickerUsageEvent setEffectType:](v5, "setEffectType:", +[MSStickerUsageEvent effectTypeForSticker:](MSStickerUsageEvent, "effectTypeForSticker:", v4));
    -[MSStickerUsageEvent setSourceType:](v5, "setSourceType:", +[MSStickerUsageEvent autoSourceType](MSStickerUsageEvent, "autoSourceType"));
  }

  return v5;
}

- (MSStickerUsageEvent)initWithMediaPayload:(id)a3
{
  id v4;
  MSStickerUsageEvent *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MSStickerUsageEvent;
  v5 = -[MSStickerUsageEvent init](&v8, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "externalURI");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSStickerUsageEvent setStickerType:](v5, "setStickerType:", +[MSStickerUsageEvent stickerTypeFromExternalURI:](MSStickerUsageEvent, "stickerTypeFromExternalURI:", v6));

    -[MSStickerUsageEvent setEffectType:](v5, "setEffectType:", +[MSStickerUsageEvent effectTypeForMediaPayload:](MSStickerUsageEvent, "effectTypeForMediaPayload:", v4));
    -[MSStickerUsageEvent setSourceType:](v5, "setSourceType:", +[MSStickerUsageEvent autoSourceType](MSStickerUsageEvent, "autoSourceType"));
  }

  return v5;
}

- (void)send
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  _QWORD v9[5];

  v9[4] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("usageSource");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[MSStickerUsageEvent sourceType](self, "sourceType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v8[1] = CFSTR("stickerType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[MSStickerUsageEvent stickerType](self, "stickerType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  v8[2] = CFSTR("usageType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[MSStickerUsageEvent usageType](self, "usageType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  v8[3] = CFSTR("effectType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[MSStickerUsageEvent effectType](self, "effectType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  AnalyticsSendEvent();
}

- (int64_t)sourceType
{
  return self->_sourceType;
}

- (void)setSourceType:(int64_t)a3
{
  self->_sourceType = a3;
}

- (int64_t)usageType
{
  return self->_usageType;
}

- (void)setUsageType:(int64_t)a3
{
  self->_usageType = a3;
}

- (int64_t)stickerType
{
  return self->_stickerType;
}

- (void)setStickerType:(int64_t)a3
{
  self->_stickerType = a3;
}

- (int64_t)effectType
{
  return self->_effectType;
}

- (void)setEffectType:(int64_t)a3
{
  self->_effectType = a3;
}

@end
