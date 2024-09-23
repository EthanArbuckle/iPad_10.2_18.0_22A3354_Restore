@implementation NSData(ISMutableStoreIndex_BlobTable)

+ (id)_ISMutableStoreIndex_mappedDataWithSize:()ISMutableStoreIndex_BlobTable
{
  _BYTE *v4;
  void *v5;
  _BYTE *v6;
  id v7;
  uint64_t v8;

  v4 = mmap(0, a3, 3, 4097, 0, 0);
  v5 = 0;
  if (v4 == (_BYTE *)-1)
    v6 = 0;
  else
    v6 = v4;
  if (a3 && v6)
  {
    v7 = objc_alloc(MEMORY[0x1E0C99D50]);
    v5 = (void *)objc_msgSend(v7, "initWithBytesNoCopy:length:deallocator:", v6, a3, *MEMORY[0x1E0CB2910]);
  }
  v8 = objc_msgSend(v5, "_ISStoreIndex_blobTableHeader");
  if (v8)
  {
    *(_DWORD *)v8 = 11;
    *(_DWORD *)(v8 + 8) = 0;
    v6[20] = 0;
    *(_BYTE *)(v8 + 4) = 1;
  }
  return v5;
}

- (uint64_t)_ISMutableStoreIndex_availableSpace
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = objc_msgSend(a1, "length");
  v3 = objc_msgSend(a1, "_ISStoreIndex_blobTableHeader");
  if (v3)
    v4 = v2 - *(unsigned int *)(v3 + 8) - 24;
  else
    v4 = 0;
  return v4 & ~(v4 >> 63);
}

- (uint64_t)_ISMutableStoreIndex_addBlobBuffer:()ISMutableStoreIndex_BlobTable size:
{
  uint64_t result;
  unint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  result = 0;
  if (a3)
  {
    if (a4)
    {
      v8 = objc_msgSend(a1, "length");
      v9 = objc_retainAutorelease(a1);
      v10 = objc_msgSend(v9, "bytes");
      result = objc_msgSend(v9, "_ISStoreIndex_blobTableHeader");
      if (result)
      {
        v11 = *(unsigned int *)(result + 8);
        v12 = (a4 + v11 + 12);
        if (v12 + 12 >= v8)
        {
          return 0;
        }
        else
        {
          v13 = v10 + v11 + 12;
          if (v12 + 24 < v8)
            *(_BYTE *)(v13 + 8) = 0;
          *(_DWORD *)(result + 8) = a4 + v11 + 12;
          *(_DWORD *)v13 = v11;
          *(_DWORD *)(v13 + 4) = a4;
          memcpy((void *)(v13 + 12), a3, a4);
          *(_BYTE *)(v13 + 8) = 1;
          return *(_QWORD *)v13;
        }
      }
    }
  }
  return result;
}

- (uint64_t)_ISMutableStoreIndex_addBlobData:()ISMutableStoreIndex_BlobTable
{
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = objc_retainAutorelease(a3);
  v5 = objc_msgSend(v4, "bytes");
  v6 = objc_msgSend(v4, "length");

  return objc_msgSend(a1, "_ISMutableStoreIndex_addBlobBuffer:size:", v5, v6);
}

- (uint64_t)_ISMutableStoreIndex_removeBlobForID:()ISMutableStoreIndex_BlobTable
{
  uint64_t result;

  result = objc_msgSend(a1, "_ISStoreIndex_blobForID:");
  *(_BYTE *)(result + 8) = 0;
  return result;
}

@end
