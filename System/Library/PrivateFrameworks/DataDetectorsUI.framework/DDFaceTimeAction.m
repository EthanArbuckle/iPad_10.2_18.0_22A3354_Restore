@implementation DDFaceTimeAction

+ (id)matchingScheme
{
  return CFSTR("facetime");
}

- (id)localizedName
{
  return DDLocalizedString(CFSTR("FaceTime"));
}

- (id)iconName
{
  return CFSTR("video");
}

- (id)notificationTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  DDLocalizedString(CFSTR("FaceTime %@"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DDCallAction notificationTitleTargetString](self, "notificationTitleTargetString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)isAvailable
{
  return objc_msgSend(MEMORY[0x1E0DBD1B8], "supportsFaceTimeVideoCalls");
}

- (id)dialRequest
{
  void *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DDFaceTimeAction;
  -[DDFaceTimeAudioAction dialRequest](&v4, sel_dialRequest);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setVideo:", 1);
  return v2;
}

@end
