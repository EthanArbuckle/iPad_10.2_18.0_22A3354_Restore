@implementation NSData(ISStoreIndex_BlobTable)

- (uint64_t)_ISStoreIndex_isValid
{
  uint64_t result;

  result = objc_msgSend(a1, "_ISStoreIndex_blobTableHeader");
  if (result)
    return *(_BYTE *)(result + 4) && *(_DWORD *)result == 11;
  return result;
}

- (uint64_t)_ISStoreIndex_blobTableHeader
{
  if ((unint64_t)objc_msgSend(a1, "length") < 0xD)
    return 0;
  else
    return objc_msgSend(objc_retainAutorelease(a1), "bytes");
}

- (uint64_t)_ISStoreIndex_blobForID:()ISStoreIndex_BlobTable
{
  unint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t result;
  _QWORD *v9;

  v5 = objc_msgSend(a1, "length");
  v6 = objc_retainAutorelease(a1);
  v7 = objc_msgSend(v6, "bytes");
  result = objc_msgSend(v6, "_ISStoreIndex_blobTableHeader");
  if (result)
  {
    if (a3 < v5
      && (v9 = (_QWORD *)(a3 + v7 + 12), a3 + v7 != -12)
      && *(_BYTE *)(a3 + v7 + 20)
      && *v9 == a3)
    {
      if ((unint64_t)v9 + HIDWORD(*v9) + 12 >= v5 + v7)
        return 0;
      else
        return a3 + v7 + 12;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (unsigned)_ISStoreIndex_blobDataForID:()ISStoreIndex_BlobTable
{
  unsigned int *v2;
  unsigned int *v3;
  id v4;
  id v5;
  uint64_t v6;
  _QWORD v8[5];

  v2 = (unsigned int *)objc_msgSend(a1, "_ISStoreIndex_blobForID:");
  if (v2)
  {
    v3 = v2;
    v4 = a1;
    v5 = objc_alloc(MEMORY[0x1E0C99D50]);
    v6 = v3[1];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __62__NSData_ISStoreIndex_BlobTable___ISStoreIndex_blobDataForID___block_invoke;
    v8[3] = &__block_descriptor_40_e12_v24__0_v8Q16l;
    v8[4] = v4;
    v2 = (unsigned int *)objc_msgSend(v5, "initWithBytesNoCopy:length:deallocator:", v3 + 3, v6, v8);
  }
  return v2;
}

- (void)_ISStoreIndex_enumerateBlobsWithBock:()ISStoreIndex_BlobTable
{
  void (**v4)(id, unint64_t, _BYTE *);
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  BOOL v13;
  unint64_t v14;
  char v16;

  v4 = a3;
  v5 = objc_msgSend(a1, "length");
  v6 = objc_retainAutorelease(a1);
  v7 = objc_msgSend(v6, "bytes");
  v8 = objc_msgSend(v6, "_ISStoreIndex_blobTableHeader");
  if (v8)
  {
    v9 = v7 + 12;
    if (v7 != -12)
    {
      v10 = v8;
      v11 = v5 + v7;
      while (1)
      {
        v12 = *(_QWORD *)v9;
        if (!*(_QWORD *)v9)
          break;
        v13 = *(_DWORD *)(v10 + 8) > v12;
        v14 = HIDWORD(v12) + v9 + 12;
        if (!v13 || v14 >= v11)
          break;
        if (*(_BYTE *)(v9 + 8))
        {
          v16 = 0;
          v4[2](v4, v9, &v16);
          if (v16)
            break;
          v9 += *(unsigned int *)(v9 + 4) + 12;
          if (!v9)
            break;
        }
        else
        {
          v9 = v14;
          if (!v14)
            break;
        }
      }
    }
  }

}

@end
