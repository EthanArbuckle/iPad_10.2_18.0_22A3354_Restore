@implementation HPSSettingHelper

+ (BOOL)shouldDisableUpdateSettingForKeyPath:(id)a3
{
  return objc_msgSend(&unk_24F9C4698, "containsObject:", a3);
}

@end
