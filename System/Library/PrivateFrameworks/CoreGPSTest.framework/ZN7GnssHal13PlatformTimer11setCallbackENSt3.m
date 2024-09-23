@implementation ZN7GnssHal13PlatformTimer11setCallbackENSt3

_QWORD *___ZN7GnssHal13PlatformTimer11setCallbackENSt3__18functionIFvvEEE_block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  _QWORD *result;
  uint64_t v6;
  _QWORD v7[3];
  _QWORD *v8;
  _QWORD v9[4];

  v9[3] = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  std::__function::__value_func<void ()(void)>::__value_func[abi:ne180100]((uint64_t)v7, a1 + 40);
  v2 = v1 + 8;
  if (v7 != (_QWORD *)(v1 + 8))
  {
    v3 = v8;
    v4 = *(_QWORD *)(v1 + 32);
    if (v8 == v7)
    {
      if (v4 == v2)
      {
        (*(void (**)(_QWORD *, _QWORD *))(v7[0] + 24))(v7, v9);
        (*(void (**)(_QWORD *))(*v8 + 32))(v8);
        v8 = 0;
        (*(void (**)(_QWORD, _QWORD *))(**(_QWORD **)(v1 + 32) + 24))(*(_QWORD *)(v1 + 32), v7);
        (*(void (**)(_QWORD))(**(_QWORD **)(v1 + 32) + 32))(*(_QWORD *)(v1 + 32));
        *(_QWORD *)(v1 + 32) = 0;
        v8 = v7;
        (*(void (**)(_QWORD *, uint64_t))(v9[0] + 24))(v9, v1 + 8);
        (*(void (**)(_QWORD *))(v9[0] + 32))(v9);
      }
      else
      {
        (*(void (**)(_QWORD *, uint64_t))(v7[0] + 24))(v7, v1 + 8);
        (*(void (**)(_QWORD *))(*v8 + 32))(v8);
        v8 = *(_QWORD **)(v1 + 32);
      }
      *(_QWORD *)(v1 + 32) = v2;
    }
    else if (v4 == v2)
    {
      (*(void (**)(uint64_t, _QWORD *))(*(_QWORD *)v2 + 24))(v1 + 8, v7);
      (*(void (**)(_QWORD))(**(_QWORD **)(v1 + 32) + 32))(*(_QWORD *)(v1 + 32));
      *(_QWORD *)(v1 + 32) = v8;
      v8 = v7;
    }
    else
    {
      v8 = *(_QWORD **)(v1 + 32);
      *(_QWORD *)(v1 + 32) = v3;
    }
  }
  result = v8;
  if (v8 == v7)
  {
    v6 = 4;
    result = v7;
  }
  else
  {
    if (!v8)
      return result;
    v6 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v6))();
}

@end
