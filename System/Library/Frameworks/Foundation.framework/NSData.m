@implementation NSData

_QWORD *__54__NSData_NSData___base64EncodingAsString_withOptions___block_invoke(_QWORD *result, unsigned __int8 *a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4;
  unsigned int v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  for (; a4; --a4)
  {
    v5 = *a2++;
    v4 = v5;
    v6 = *(_QWORD *)(*(_QWORD *)(result[4] + 8) + 24) % 3uLL;
    switch(v6)
    {
      case 2uLL:
        v23 = _base64EncodingAsString_withOptions__DataEncodeTable[((unint64_t)(v4 | (*(unsigned __int8 *)(*(_QWORD *)(result[7] + 8) + 24) << 8)) >> 6) & 0x3F];
        v24 = result[10];
        v25 = *(_QWORD *)(result[6] + 8);
        v26 = *(_QWORD *)(v25 + 24);
        *(_QWORD *)(v25 + 24) = v26 + 1;
        *(_BYTE *)(v24 + v26) = v23;
        v27 = _base64EncodingAsString_withOptions__DataEncodeTable[v4 & 0x3F];
        v28 = result[10];
        v29 = *(_QWORD *)(result[6] + 8);
        v30 = *(_QWORD *)(v29 + 24);
        *(_QWORD *)(v29 + 24) = v30 + 1;
        *(_BYTE *)(v28 + v30) = v27;
        break;
      case 1uLL:
        v19 = _base64EncodingAsString_withOptions__DataEncodeTable[((unint64_t)(v4 | (*(unsigned __int8 *)(*(_QWORD *)(result[7] + 8) + 24) << 8)) >> 4) & 0x3F];
        v20 = result[10];
        v21 = *(_QWORD *)(result[6] + 8);
        v22 = *(_QWORD *)(v21 + 24);
        *(_QWORD *)(v21 + 24) = v22 + 1;
        *(_BYTE *)(v20 + v22) = v19;
        break;
      case 0uLL:
        v7 = result[6];
        if (result[8])
        {
          v8 = *(_QWORD *)(*(_QWORD *)(result[5] + 8) + 24);
          v9 = *(_QWORD *)(v7 + 8);
          if (v8 == *(_QWORD *)(v9 + 24))
          {
            v10 = result[9];
            if ((v10 & 0x10) != 0)
            {
              v11 = result[10];
              *(_QWORD *)(v9 + 24) = v8 + 1;
              *(_BYTE *)(v11 + v8) = 13;
              v10 = result[9];
              v7 = result[6];
            }
            if ((v10 & 0x20) != 0)
            {
              v12 = result[10];
              v13 = *(_QWORD *)(v7 + 8);
              v14 = *(_QWORD *)(v13 + 24);
              *(_QWORD *)(v13 + 24) = v14 + 1;
              *(_BYTE *)(v12 + v14) = 10;
              v7 = result[6];
            }
            *(_QWORD *)(*(_QWORD *)(result[5] + 8) + 24) = result[8] + *(_QWORD *)(*(_QWORD *)(v7 + 8) + 24);
            v7 = result[6];
          }
        }
        v15 = _base64EncodingAsString_withOptions__DataEncodeTable[v4 >> 2];
        v16 = result[10];
        v17 = *(_QWORD *)(v7 + 8);
        v18 = *(_QWORD *)(v17 + 24);
        *(_QWORD *)(v17 + 24) = v18 + 1;
        *(_BYTE *)(v16 + v18) = v15;
        break;
    }
    *(_BYTE *)(*(_QWORD *)(result[7] + 8) + 24) = v4;
    ++*(_QWORD *)(*(_QWORD *)(result[4] + 8) + 24);
  }
  return result;
}

uint64_t __55__NSData_NSData___initWithBase64EncodedObject_options___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_decodeBase64EncodedCharacterBuffer:length:options:buffer:bufferLength:state:", a2, a4, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32);
  if ((result & 1) == 0)
    *a5 = 1;
  return result;
}

void __32__NSData_NSData__initWithCoder___block_invoke(uint64_t a1)
{
  xpc_release(*(xpc_object_t *)(a1 + 32));
}

uint64_t __84__NSData_NSDataCompression___produceDataWithCompressionOperation_algorithm_handler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "processBytes:size:", a2);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  *a5 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) ^ 1;
  return result;
}

uint64_t __84__NSData_NSDataCompression___produceDataWithCompressionOperation_algorithm_handler___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    if (a3)
      return objc_msgSend(*(id *)(result + 32), "appendBytes:length:", a2, a3);
  }
  return result;
}

uint64_t __38__NSData_NSData__mutableCopyWithZone___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendBytes:length:", a2);
}

uint64_t __78__NSData_NSDataCompression___decompressedDataUsingCompressionAlgorithm_error___block_invoke(uint64_t result, void *a2)
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[6];

  v7[5] = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v3 = result;
    v4 = objc_alloc(MEMORY[0x1E0C99D50]);
    v5 = objc_msgSend(a2, "bytes");
    v6 = objc_msgSend(a2, "length");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __78__NSData_NSDataCompression___decompressedDataUsingCompressionAlgorithm_error___block_invoke_2;
    v7[3] = &unk_1E0F4D128;
    v7[4] = a2;
    result = objc_msgSend(v4, "initWithBytesNoCopy:length:deallocator:", v5, v6, v7);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 32) + 8) + 40) = result;
  }
  return result;
}

uint64_t __76__NSData_NSDataCompression___compressedDataUsingCompressionAlgorithm_error___block_invoke(uint64_t result, void *a2)
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[6];

  v7[5] = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v3 = result;
    v4 = objc_alloc(MEMORY[0x1E0C99D50]);
    v5 = objc_msgSend(a2, "bytes");
    v6 = objc_msgSend(a2, "length");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __76__NSData_NSDataCompression___compressedDataUsingCompressionAlgorithm_error___block_invoke_2;
    v7[3] = &unk_1E0F4D128;
    v7[4] = a2;
    result = objc_msgSend(v4, "initWithBytesNoCopy:length:deallocator:", v5, v6, v7);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 32) + 8) + 40) = result;
  }
  return result;
}

uint64_t __28__NSData_NSData___isCompact__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "length");
  if (a4 != result)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  *a5 = 1;
  return result;
}

uint64_t __32__NSData_NSData__isEqualToData___block_invoke(_QWORD *a1, const void *a2, uint64_t a3, size_t __n, _BYTE *a5)
{
  uint64_t v7;
  uint64_t result;

  v7 = a1[5];
  if (!v7)
    v7 = a1[6];
  result = memcmp((const void *)(v7 + a3), a2, __n);
  if ((_DWORD)result)
    *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = 0;
  *a5 = *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) ^ 1;
  return result;
}

uint64_t __32__NSData_NSData__isEqualToData___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  void *v7;
  uint64_t result;
  _QWORD v9[9];

  v9[8] = *MEMORY[0x1E0C80C00];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __32__NSData_NSData__isEqualToData___block_invoke_3;
  v9[3] = &unk_1E0F4D1A0;
  v9[6] = a4;
  v9[7] = a2;
  v7 = *(void **)(a1 + 32);
  v9[4] = *(_QWORD *)(a1 + 40);
  v9[5] = a3;
  result = objc_msgSend(v7, "enumerateByteRangesUsingBlock:", v9);
  *a5 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) ^ 1;
  return result;
}

_QWORD *__32__NSData_NSData__isEqualToData___block_invoke_3(_QWORD *result, uint64_t a2, unint64_t a3, uint64_t a4, _BYTE *a5)
{
  _QWORD *v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  size_t v13;
  unint64_t v14;
  unint64_t v15;
  BOOL v16;
  unint64_t v17;
  const void *v18;
  unint64_t v19;

  v6 = result;
  v7 = result[5];
  v8 = result[6] + v7;
  if (v8 <= a3)
  {
    *a5 = 1;
    v9 = result[5];
    v8 = v9 + result[6];
  }
  else
  {
    v9 = result[5];
  }
  if (v8 >= a3 + a4)
    v10 = a3 + a4;
  else
    v10 = v8;
  if (a3 <= v9 && v9 < a3 + a4)
  {
    v13 = v10 - v9;
    if (v10 == v9)
      return result;
    goto LABEL_19;
  }
  if (v9 <= a3 && a3 < v8)
  {
    v13 = v10 - a3;
    v9 = a3;
    if (v10 != a3)
    {
LABEL_19:
      v14 = v9 - a3;
      v15 = v9 - v7;
      v16 = a3 >= v7;
      if (a3 >= v7)
        v17 = v15;
      else
        v17 = 0;
      v18 = (const void *)(result[7] + v17);
      if (v16)
        v19 = 0;
      else
        v19 = v14;
      result = (_QWORD *)memcmp(v18, (const void *)(a2 + v19), v13);
      *(_BYTE *)(*(_QWORD *)(v6[4] + 8) + 24) = (_DWORD)result == 0;
      *a5 = *(_BYTE *)(*(_QWORD *)(v6[4] + 8) + 24) ^ 1;
    }
  }
  return result;
}

@end
