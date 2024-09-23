@implementation IMServiceAgent

+ (id)notificationCenter
{
  return 0;
}

+ (int64_t)serviceAgentCapabilities
{
  return 0;
}

+ (id)sharedAgent
{
  return (id)MEMORY[0x1E0DE7D20](IMServiceAgentImpl, sel_sharedAgent);
}

+ (id)imageURLForStatus:(unint64_t)a3
{
  return (id)MEMORY[0x1E0DE7D20](IMServiceAgentImpl, sel_imageURLForStatus_);
}

+ (id)imageNameForStatus:(unint64_t)a3
{
  return (id)MEMORY[0x1E0DE7D20](IMServiceAgentImpl, sel_imageNameForStatus_);
}

+ (void)forgetStatusImageAppearance
{
  +[IMServiceAgentImpl forgetStatusImageAppearance](IMServiceAgentImpl, "forgetStatusImageAppearance");
}

- (id)serviceWithName:(id)a3
{
  return 0;
}

- (id)serviceWithNameNonBlocking:(id)a3
{
  return 0;
}

- (id)notificationCenter
{
  return 0;
}

- (NSArray)myAvailableMessages
{
  return 0;
}

- (NSArray)myAwayMessages
{
  return 0;
}

- (NSDictionary)currentAVChatInfo
{
  return 0;
}

- (unint64_t)requestAudioReflectorStart
{
  return 0;
}

- (unint64_t)requestAudioReflectorStop
{
  return 0;
}

- (unint64_t)requestVideoStillForPerson:(id)a3
{
  return 0;
}

- (unint64_t)vcCapabilities
{
  return 0;
}

- (id)myPictureData
{
  void *v2;
  void *v3;
  void *v4;

  +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bestAccountForStatus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "myPictureData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
