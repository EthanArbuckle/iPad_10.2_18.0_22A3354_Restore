@implementation MTLAddDevice

void __MTLAddDevice_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  int v4;

  if (_getWrappedDeviceFn)
  {
    v2 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "_deviceWrapper");
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    if (v2 == *(_QWORD *)(v3 + 40))
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = _getWrappedDeviceFn();
      v4 = 1;
    }
    else
    {
      v4 = 0;
      *(_QWORD *)(v3 + 40) = v2;
    }
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend((id)_deviceArray, "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  if (v4)

}

@end
