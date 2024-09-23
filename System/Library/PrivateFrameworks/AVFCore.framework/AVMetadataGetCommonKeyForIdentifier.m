@implementation AVMetadataGetCommonKeyForIdentifier

id __AVMetadataGetCommonKeyForIdentifier_block_invoke()
{
  id result;
  const __CFString *v1;
  _QWORD v2[2];

  v2[1] = *MEMORY[0x1E0C80C00];
  v1 = CFSTR("m3u8/NAME");
  v2[0] = *MEMORY[0x1E0CC4728];
  result = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v2, &v1, 1);
  AVMetadataGetCommonKeyForIdentifier_commonKeysForMetadataIdentifiers = (uint64_t)result;
  return result;
}

@end
