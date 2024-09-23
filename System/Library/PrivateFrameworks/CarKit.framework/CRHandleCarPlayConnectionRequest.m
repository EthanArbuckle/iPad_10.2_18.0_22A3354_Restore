@implementation CRHandleCarPlayConnectionRequest

uint64_t __CRHandleCarPlayConnectionRequest_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "handleCarPlayConnectionRequestForConnectionID:startSessionProperties:reply:", *(unsigned int *)(a1 + 40), *(_QWORD *)(a1 + 32), &__block_literal_global_17);
}

void __CRHandleCarPlayConnectionRequest_block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];

  v4 = a3;
  CarGeneralLogging();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1A83A2000, v6, OS_LOG_TYPE_DEFAULT, "carkitd successfully handled the start session request", v7, 2u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    __CRHandleCarPlayConnectionRequest_block_invoke_2_cold_1();
  }

}

void __CRHandleCarPlayConnectionRequest_block_invoke_43(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  CarGeneralLogging();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __CRHandleCarPlayConnectionRequest_block_invoke_43_cold_1();

}

void __CRHandleCarPlayConnectionRequest_block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1A83A2000, v0, v1, "carkitd failed to handle the start session request: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __CRHandleCarPlayConnectionRequest_block_invoke_43_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1A83A2000, v0, v1, "failed to send carkitd the start session request: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
