@implementation NTKStringFromDateStyleDict

void ___NTKStringFromDateStyleDict_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E6CA0288;
  v2[1] = &unk_1E6CA02D0;
  v3[0] = CFSTR("day");
  v3[1] = CFSTR("weekday and day");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_NTKStringFromDateStyleDict_dictionary;
  _NTKStringFromDateStyleDict_dictionary = v0;

}

@end
