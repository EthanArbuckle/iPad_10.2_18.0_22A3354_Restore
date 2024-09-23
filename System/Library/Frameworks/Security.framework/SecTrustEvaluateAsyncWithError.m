@implementation SecTrustEvaluateAsyncWithError

void __SecTrustEvaluateAsyncWithError_block_invoke(uint64_t a1, int a2)
{
  const void *Error;
  uint64_t v4;
  NSObject *v5;
  CFErrorRef v6;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  int v11;

  if (a2)
  {
    Error = SecCopyLastError(a2);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    if (Error)
      CFRelease(Error);
  }
  else
  {
    v8 = 0;
    v9 = &v8;
    v10 = 0x2000000000;
    v11 = 0;
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(NSObject **)(v4 + 136);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 0x40000000;
    v7[2] = __SecTrustEvaluateAsyncWithError_block_invoke_2;
    v7[3] = &unk_1E1FDA818;
    v7[4] = &v8;
    v7[5] = v4;
    dispatch_sync(v5, v7);
    SecTrustLogFailureDescription(*(__SecTrust **)(a1 + 40), *((_DWORD *)v9 + 6));
    v6 = SecTrustCopyError(*(_QWORD *)(a1 + 40));
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    if (v6)
      CFRelease(v6);
    _Block_object_dispose(&v8, 8);
  }
}

uint64_t __SecTrustEvaluateAsyncWithError_block_invoke_2(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(result + 40) + 112);
  return result;
}

@end
