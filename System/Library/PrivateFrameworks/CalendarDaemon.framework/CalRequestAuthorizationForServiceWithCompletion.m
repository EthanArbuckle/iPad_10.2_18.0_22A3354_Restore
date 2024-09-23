@implementation CalRequestAuthorizationForServiceWithCompletion

void __CalRequestAuthorizationForServiceWithCompletion_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t authorization_right;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (a3)
  {
    v7 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      v13 = 138412290;
      v14 = a3;
      v8 = "Failed to request TCC server authorization change: %@";
      v9 = v7;
      v10 = 12;
LABEL_4:
      _os_log_impl(&dword_1B6A18000, v9, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v13, v10);
    }
  }
  else
  {
    if (v5)
    {
      authorization_right = tcc_authorization_record_get_authorization_right();
      goto LABEL_8;
    }
    v12 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v13) = 0;
      v8 = "Received a null authorization record";
      v9 = v12;
      v10 = 2;
      goto LABEL_4;
    }
  }
  authorization_right = 1;
LABEL_8:
  (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), authorization_right);

}

@end
