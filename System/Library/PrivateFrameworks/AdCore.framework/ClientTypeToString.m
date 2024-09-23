@implementation ClientTypeToString

void __ClientTypeToString_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[7];
  _QWORD v3[8];

  v3[7] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E82BE5F0;
  v2[1] = &unk_1E82BE608;
  v3[0] = CFSTR("ClientType_Default");
  v3[1] = CFSTR("ClientType_Tilt");
  v2[2] = &unk_1E82BE620;
  v2[3] = &unk_1E82BE638;
  v3[2] = CFSTR("ClientType_AnonymousDemand");
  v3[3] = CFSTR("ClientType_Content");
  v2[4] = &unk_1E82BE650;
  v2[5] = &unk_1E82BE668;
  v3[4] = CFSTR("ClientType_Toro");
  v3[5] = CFSTR("ClientType_DevicePack");
  v2[6] = &unk_1E82BE680;
  v3[6] = CFSTR("ClientType_DeviceNewsPlusSubscriber");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 7);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)ClientTypeToString_strings;
  ClientTypeToString_strings = v0;

}

@end
