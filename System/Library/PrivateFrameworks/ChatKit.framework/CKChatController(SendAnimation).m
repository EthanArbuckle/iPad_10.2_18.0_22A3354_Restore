@implementation CKChatController(SendAnimation)

- (void)_finishSendAnimation
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18DFCD000, log, OS_LOG_TYPE_ERROR, "Throw animation completed, but scroll intent is still ActiveThrowAnimation. Defensively updating scroll intent based on current content offset.", v1, 2u);
}

@end
