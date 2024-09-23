@implementation CRKInstructorExtensionOptimizerShim

- (void)didAcceptAdminTransport:(id)a3
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a3;
  _CRKLogGeneral_3();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    -[CRKInstructorExtensionOptimizerShim didAcceptAdminTransport:].cold.1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

}

- (void)beginRequestWithExtensionContext:(id)a3
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a3;
  _CRKLogGeneral_3();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    -[CRKInstructorExtensionOptimizerShim beginRequestWithExtensionContext:].cold.1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

}

- (void)didAcceptAdminTransport:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_218C99000, a2, a3, "(SHOULD NOT BE CALLED) CRKInstructorExtensionOptimizerShim didAcceptAdminTransport: %{public}@", a5, a6, a7, a8, 2u);
}

- (void)beginRequestWithExtensionContext:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_218C99000, a2, a3, "(SHOULD NOT BE CALLED) CRKInstructorExtensionOptimizerShim beginRequestWithExtensionContext: %{public}@", a5, a6, a7, a8, 2u);
}

@end
