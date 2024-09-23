@implementation MSVHasherDigestDataBlocksFromURL

void __MSVHasherDigestDataBlocksFromURL_block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(v4, "length") + objc_msgSend(v3, "completedUnitCount"));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __MSVHasherDigestDataBlocksFromURL_block_invoke_3(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", 1);
  result = objc_msgSend(*(id *)(a1 + 40), "disarm");
  if ((_DWORD)result)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return result;
}

void __MSVHasherDigestDataBlocksFromURL_block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", 1);
  if (objc_msgSend(*(id *)(a1 + 40), "disarm"))
  {
    v3 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("MSVHasherError"), 2, v5, CFSTR("Unexpected IO error while reading data"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

  }
}

void __MSVHasherDigestDataBlocksFromURL_block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "stop");
  if (objc_msgSend(*(id *)(a1 + 40), "disarm"))
  {
    v2 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("MSVHasherError"), 1, CFSTR("NSProgress cancel method was called"));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

void __MSVHasherDigestDataBlocksFromURL_block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSProgress * _Nonnull MSVHasherDigestDataBlocksFromURL(NSURL *__strong _Nonnull, void (^__strong _Nonnull)(NSData *__strong), void (^__strong _Nonnull)(NSError * _Nullable __strong))_block_invoke");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("MSVHasher.m"), 48, CFSTR("MSVHasherDigestURL completion was not called."));

}

@end
