@implementation NTKStringFromEditModeDict

void ___NTKStringFromEditModeDict_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[10];
  _QWORD v3[11];

  v3[10] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E6C9FD30;
  v2[1] = &unk_1E6CA0210;
  v3[0] = CFSTR("color");
  v3[1] = CFSTR("detail");
  v2[2] = &unk_1E6C9FD48;
  v2[3] = &unk_1E6C9FD60;
  v3[2] = CFSTR("content");
  v3[3] = CFSTR("typeface");
  v2[4] = &unk_1E6C9FD78;
  v2[5] = &unk_1E6CA0228;
  v3[4] = CFSTR("position");
  v3[5] = CFSTR("style");
  v2[6] = &unk_1E6C9FD90;
  v2[7] = &unk_1E6C9FDA8;
  v3[6] = CFSTR("data-sources");
  v3[7] = CFSTR("background");
  v2[8] = &unk_1E6C9FDC0;
  v2[9] = &unk_1E6C9FDD8;
  v3[8] = CFSTR("night");
  v3[9] = CFSTR("numerals");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 10);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_NTKStringFromEditModeDict_dictionary;
  _NTKStringFromEditModeDict_dictionary = v0;

}

@end
