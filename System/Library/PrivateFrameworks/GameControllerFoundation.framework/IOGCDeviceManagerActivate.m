@implementation IOGCDeviceManagerActivate

void __IOGCDeviceManagerActivate_block_invoke(uint64_t a1)
{
  uint64_t v1;
  void (**v2)(_QWORD);

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void (***)(_QWORD))(v1 + 48);
  *(_QWORD *)(v1 + 48) = 0;
  if (v2)
  {
    v2[2](v2);
    _Block_release(v2);
  }
}

@end
