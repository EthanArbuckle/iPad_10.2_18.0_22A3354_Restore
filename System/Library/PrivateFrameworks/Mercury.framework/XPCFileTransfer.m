@implementation XPCFileTransfer

void __XPCFileTransfer_open_block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[4];
  _QWORD v5[5];

  v5[4] = *MEMORY[0x1E0C80C08];
  v0 = *MEMORY[0x1E0C99918];
  v4[0] = *MEMORY[0x1E0C99940];
  v4[1] = v0;
  v5[0] = &unk_1E8CB1780;
  v5[1] = &unk_1E8CB1798;
  v1 = *MEMORY[0x1E0C99928];
  v4[2] = *MEMORY[0x1E0C99920];
  v4[3] = v1;
  v5[2] = &unk_1E8CB17B0;
  v5[3] = &unk_1E8CB17C8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 4);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)XPCFileTransfer_open_protectionTypes;
  XPCFileTransfer_open_protectionTypes = v2;

}

@end
