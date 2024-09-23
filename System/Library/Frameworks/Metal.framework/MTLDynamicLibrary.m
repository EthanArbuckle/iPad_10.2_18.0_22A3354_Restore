@implementation MTLDynamicLibrary

uint64_t __59___MTLDynamicLibrary_dynamicLibraryTypeAtURL_device_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  MTLArchitecture *v8;
  float *v9;
  _QWORD *v10;
  uint64_t v12;
  uint64_t v13;

  v13 = a2;
  v8 = -[MTLArchitecture initWithCPUType:cpuSubtype:]([MTLArchitecture alloc], "initWithCPUType:cpuSubtype:", a2, HIDWORD(a2));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v8);
  v9 = (float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48);
  v12 = (a2 << 32) | (a2 >> 32);
  v10 = std::unordered_map<unsigned long long,+[_MTLDynamicLibrary dynamicLibraryTypeAtURL:device:error:]::archSliceId>::operator[](v9, (unint64_t *)&v12);
  *v10 = a3;
  v10[1] = a4;

  if (v13 == *(_QWORD *)(a1 + 80))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = a3;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = a4;
  }
  else if (*(_DWORD *)(a1 + 88) == (_DWORD)a2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
  }
  return 1;
}

uint64_t __59___MTLDynamicLibrary_dynamicLibraryTypeAtURL_device_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3 + a2 <= (unint64_t)objc_msgSend(*(id *)(a1 + 32), "length"))
    return objc_msgSend(*(id *)(a1 + 32), "bytes") + a2;
  else
    return 0;
}

uint64_t __59___MTLDynamicLibrary_dynamicLibraryTypeAtURL_device_error___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8;
  uint64_t result;
  unint64_t v10;

  if (*(_QWORD *)(a3 + 96))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  v8 = *(_QWORD *)(a3 + 48);
  if (*(_BYTE *)(a3 + 41))
  {
    if (*(_DWORD *)(a1 + 64) == (_DWORD)v8)
      goto LABEL_5;
    return 0;
  }
  if (*(_QWORD *)(a1 + 56) != v8)
    return 0;
LABEL_5:
  result = objc_msgSend(*(id *)(a3 + 56), "length");
  if (result)
  {
    v10 = a5 + a4 + *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    return v10 <= objc_msgSend(*(id *)(a1 + 32), "length");
  }
  return result;
}

uint64_t __59___MTLDynamicLibrary_dynamicLibraryTypeAtURL_device_error___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;

  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) + a2;
  if (v4 + a3 <= (unint64_t)objc_msgSend(*(id *)(a1 + 32), "length"))
    return objc_msgSend(*(id *)(a1 + 32), "bytes") + v4;
  else
    return 0;
}

@end
