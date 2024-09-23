@implementation _CDInteractionRecorder(CopresenceCore_CDInteractionRecorder)

+ (uint64_t)sharedInstance
{
  return objc_msgSend(MEMORY[0x1E0D158D8], "interactionRecorder");
}

@end
