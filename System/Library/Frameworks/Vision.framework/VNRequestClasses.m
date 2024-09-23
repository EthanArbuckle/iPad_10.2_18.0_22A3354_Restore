@implementation VNRequestClasses

void __VNRequestClasses_block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;
  id v3;
  _QWORD v4[4];
  id v5;

  v0 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __VNRequestClasses_block_invoke_2;
  v4[3] = &unk_1E4548E40;
  v3 = v0;
  v5 = v3;
  +[VNClassRegistrar enumerateEntriesUsingBlock:](VNClassRegistrar, "enumerateEntriesUsingBlock:", v4);
  v1 = objc_msgSend(v3, "copy");
  v2 = (void *)VNRequestClasses::ourRequestClasses;
  VNRequestClasses::ourRequestClasses = v1;

}

void __VNRequestClasses_block_invoke_2(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  Class v6;
  NSString *aClassName;

  aClassName = a4;
  if ((a2 - 1) <= 1)
  {
    v6 = NSClassFromString(aClassName);
    if (v6)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
  }

}

@end
