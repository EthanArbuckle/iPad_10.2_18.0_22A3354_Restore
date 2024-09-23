@implementation DDFaceTimeAudioAction

+ (id)matchingScheme
{
  return CFSTR("facetime-audio");
}

- (DDFaceTimeAudioAction)initWithURL:(id)a3 result:(__DDResult *)a4 context:(id)a5
{
  id v8;
  DDFaceTimeAudioAction *v9;
  DDFaceTimeAudioAction *v10;
  uint64_t v11;
  NSString *phoneNumber;
  objc_super v14;

  v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)DDFaceTimeAudioAction;
  v9 = -[DDTelephoneNumberAction initWithURL:result:context:](&v14, sel_initWithURL_result_context_, v8, a4, a5);
  v10 = v9;
  if (v8 && v9 && !v9->super.super._phoneNumber)
  {
    objc_msgSend(v8, "dd_emailFromMailtoScheme");
    v11 = objc_claimAutoreleasedReturnValue();
    phoneNumber = v10->super.super._phoneNumber;
    v10->super.super._phoneNumber = (NSString *)v11;

  }
  return v10;
}

- (id)localizedName
{
  return DDLocalizedString(CFSTR("FaceTime Audio"));
}

- (id)subtitle
{
  return 0;
}

- (id)callProvider
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0DBD1E0]);
  objc_msgSend(v2, "faceTimeProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)dialRequest
{
  void *v3;
  void *v4;

  -[DDFaceTimeAudioAction callProvider](self, "callProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DDCallAction dialRequestWithProvider:](self, "dialRequestWithProvider:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int)interactionType
{
  return 0;
}

+ (BOOL)isAvailable
{
  return objc_msgSend(MEMORY[0x1E0DBD1B8], "supportsFaceTimeAudioCalls");
}

- (id)notificationIconBundleIdentifier
{
  return CFSTR("com.apple.facetime");
}

- (id)notificationTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  DDLocalizedString(CFSTR("FaceTime Audio %@"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DDCallAction notificationTitleTargetString](self, "notificationTitleTargetString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
