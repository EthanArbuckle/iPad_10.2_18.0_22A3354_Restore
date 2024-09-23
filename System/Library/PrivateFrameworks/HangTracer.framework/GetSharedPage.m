@implementation GetSharedPage

void __GetSharedPage_block_invoke()
{
  _QWORD *v0;
  NSObject *v1;
  int v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v0 = mmap(0, 0x1028uLL, 3, 4097, -1, 0);
  GetSharedPage__sharedPage = (uint64_t)v0;
  if (v0 == (_QWORD *)-1)
  {
    GetSharedPage__sharedPage = 0;
    shared_ht_log_handle();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      v2 = *__error();
      v3[0] = 67109120;
      v3[1] = v2;
      _os_log_impl(&dword_1AF62F000, v1, OS_LOG_TYPE_DEFAULT, "Unable to create shared page: %{errno}d", (uint8_t *)v3, 8u);
    }

  }
  else
  {
    *(_DWORD *)v0 = 7;
    v0[516] = 1;
    *((_DWORD *)v0 + 1030) = 0;
  }
}

@end
