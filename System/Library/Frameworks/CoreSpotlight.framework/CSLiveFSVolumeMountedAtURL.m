@implementation CSLiveFSVolumeMountedAtURL

void __CSLiveFSVolumeMountedAtURL_block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v13[16];

  csindex_xpc_dictionary_decode_status_with_error(a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  logForCSLogCategoryIndex();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __CSLiveFSVolumeMountedAtURL_block_invoke_cold_1((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_18C42F000, v5, OS_LOG_TYPE_INFO, "agent volume mounted complete", v13, 2u);
  }

  v12 = *(_QWORD *)(a1 + 32);
  if (v12)
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v3);

}

void __CSLiveFSVolumeMountedAtURL_block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_18C42F000, a2, a3, "agent volume mounted error %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
