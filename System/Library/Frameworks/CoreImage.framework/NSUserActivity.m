@implementation NSUserActivity

uint64_t __55__NSUserActivity_CIBarcodeDescriptor__setDetectedCode___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7;

  v7 = archivedDataWithRootObject(*(_QWORD *)(a1 + 32));
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD, _QWORD))(a5 + 16))(a5, a4, v7, 0, 0);
}

@end
