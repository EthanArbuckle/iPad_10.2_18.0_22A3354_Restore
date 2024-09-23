@implementation AVTranslateAVMediaCharacteristicToFigMediaCharacteristic

id __AVTranslateAVMediaCharacteristicToFigMediaCharacteristic_block_invoke()
{
  id result;

  result = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E0CC5E78], CFSTR("AVMediaCharacteristicVisual"), *MEMORY[0x1E0CC5E60], CFSTR("AVMediaCharacteristicAudible"), *MEMORY[0x1E0CC5E68], CFSTR("AVMediaCharacteristicLegible"), 0);
  AVTranslateAVMediaCharacteristicToFigMediaCharacteristic_sTranslationDict = (uint64_t)result;
  return result;
}

@end
