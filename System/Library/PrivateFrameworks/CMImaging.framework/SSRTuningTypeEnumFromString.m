@implementation SSRTuningTypeEnumFromString

void __SSRTuningTypeEnumFromString_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[8];
  _QWORD v3[9];

  v3[8] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("DefaultParameters");
  v2[1] = CFSTR("WYSIWYG");
  v3[0] = &unk_1E9513BD0;
  v3[1] = &unk_1E9513BE8;
  v2[2] = CFSTR("UB");
  v2[3] = CFSTR("DF");
  v3[2] = &unk_1E9513C00;
  v3[3] = &unk_1E9513C18;
  v2[4] = CFSTR("DigitalFlash");
  v2[5] = CFSTR("SWFR");
  v3[4] = &unk_1E9513C30;
  v3[5] = &unk_1E9513C48;
  v2[6] = CFSTR("Video");
  v2[7] = CFSTR("QuadraSFD");
  v3[6] = &unk_1E9513C60;
  v3[7] = &unk_1E9513C78;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)SSRTuningTypeEnumFromString_map;
  SSRTuningTypeEnumFromString_map = v0;

}

@end
