@implementation AVTranslateFigMediaCharacteristicToAVMediaCharacteristic

id __AVTranslateFigMediaCharacteristicToAVMediaCharacteristic_block_invoke()
{
  id result;

  result = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("AVMediaCharacteristicVisual"), *MEMORY[0x1E0CC5E78], CFSTR("AVMediaCharacteristicAudible"), *MEMORY[0x1E0CC5E60], CFSTR("AVMediaCharacteristicLegible"), *MEMORY[0x1E0CC5E68], 0);
  AVTranslateFigMediaCharacteristicToAVMediaCharacteristic_sTranslationDict = (uint64_t)result;
  return result;
}

@end
