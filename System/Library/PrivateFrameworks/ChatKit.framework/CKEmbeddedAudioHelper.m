@implementation CKEmbeddedAudioHelper

+ (BOOL)isEasyToRecognizeWord:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0D1F188];
  v4 = (void *)MEMORY[0x1E0C99DC8];
  v5 = a3;
  objc_msgSend(v4, "currentLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v3, "isEasyToRecognizeWord:forLocale:", v5, v6);

  return (char)v3;
}

@end
