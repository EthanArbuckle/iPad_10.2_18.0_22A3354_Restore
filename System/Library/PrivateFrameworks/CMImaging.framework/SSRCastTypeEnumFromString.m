@implementation SSRCastTypeEnumFromString

void __SSRCastTypeEnumFromString_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[15];
  _QWORD v3[16];

  v3[15] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("Standard");
  v2[1] = CFSTR("NoFilter");
  v3[0] = &unk_1E9513BD0;
  v3[1] = &unk_1E9513BE8;
  v2[2] = CFSTR("WarmAuthentic");
  v2[3] = CFSTR("StarkBW");
  v3[2] = &unk_1E9513C00;
  v3[3] = &unk_1E9513C18;
  v2[4] = CFSTR("Colorful");
  v2[5] = CFSTR("DreamyHues");
  v3[4] = &unk_1E9513C30;
  v3[5] = &unk_1E9513C48;
  v2[6] = CFSTR("UrbanCool");
  v2[7] = CFSTR("Earthy");
  v3[6] = &unk_1E9513C60;
  v3[7] = &unk_1E9513C78;
  v2[8] = CFSTR("CloudCover");
  v2[9] = CFSTR("TanWarm");
  v3[8] = &unk_1E9513C90;
  v3[9] = &unk_1E9513CA8;
  v2[10] = CFSTR("BlushWarm");
  v2[11] = CFSTR("GoldWarm");
  v3[10] = &unk_1E9513CC0;
  v3[11] = &unk_1E9513CD8;
  v2[12] = CFSTR("Neutral");
  v2[13] = CFSTR("Cool");
  v3[12] = &unk_1E9513CF0;
  v3[13] = &unk_1E9513D08;
  v2[14] = CFSTR("LongGray");
  v3[14] = &unk_1E9513D20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 15);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)SSRCastTypeEnumFromString_map;
  SSRCastTypeEnumFromString_map = v0;

}

@end
