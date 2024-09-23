@implementation IOHIDManagerDeviceApplier

uint64_t ____IOHIDManagerDeviceApplier_block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = *(_QWORD *)(result + 32);
  --*(_DWORD *)(v1 + 112);
  LOBYTE(v1) = atomic_load((unsigned int *)(v1 + 116));
  if ((v1 & 2) != 0)
  {
    v2 = result;
    v3 = *(_QWORD *)(result + 32);
    if (!*(_DWORD *)(v3 + 112))
    {
      result = *(_QWORD *)(v3 + 104);
      if (result)
      {
        (*(void (**)(void))(result + 16))();
        _Block_release(*(const void **)(*(_QWORD *)(v2 + 32) + 104));
        v4 = *(_QWORD **)(v2 + 32);
        v4[13] = 0;
        return _IOHIDObjectInternalRelease(v4);
      }
    }
  }
  return result;
}

@end
