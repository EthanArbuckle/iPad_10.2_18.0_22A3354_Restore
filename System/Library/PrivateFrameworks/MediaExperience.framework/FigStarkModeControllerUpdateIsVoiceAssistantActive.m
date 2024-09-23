@implementation FigStarkModeControllerUpdateIsVoiceAssistantActive

uint64_t __FigStarkModeControllerUpdateIsVoiceAssistantActive_block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 128) = *(_BYTE *)(result + 40);
  return result;
}

@end
