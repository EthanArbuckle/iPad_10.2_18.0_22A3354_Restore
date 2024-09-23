@implementation HKURLSessionCertVerificationDelegate

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v7;
  void (**v8)(id, uint64_t, _QWORD);
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v7 = a4;
  v8 = (void (**)(id, uint64_t, _QWORD))a5;
  objc_msgSend(v7, "protectionSpace");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "serverTrust");

  if (!v10)
  {
    _HKInitializeLogging();
    v16 = *MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_ERROR))
      -[HKURLSessionCertVerificationDelegate URLSession:didReceiveChallenge:completionHandler:].cold.1((uint64_t)self, v16, v17, v18, v19, v20, v21, v22);
    goto LABEL_10;
  }
  objc_msgSend(v7, "protectionSpace");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = HKAcceptAuthenticationChallengeWithTrust((__SecTrust *)objc_msgSend(v11, "serverTrust"));

  _HKInitializeLogging();
  v13 = *MEMORY[0x24BDD2FF8];
  v14 = *MEMORY[0x24BDD2FF8];
  if (!v12)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[HKURLSessionCertVerificationDelegate URLSession:didReceiveChallenge:completionHandler:].cold.2((uint64_t)self, v13, v23, v24, v25, v26, v27, v28);
LABEL_10:
    v15 = 2;
    goto LABEL_11;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[HKURLSessionCertVerificationDelegate URLSession:didReceiveChallenge:completionHandler:].cold.3((uint64_t)self, v13);
  v15 = 1;
LABEL_11:
  v8[2](v8, v15, 0);

}

- (void)URLSession:(uint64_t)a3 didReceiveChallenge:(uint64_t)a4 completionHandler:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_2163C4000, a2, a3, "%{public}@: Could not retrieve serverTrust from FHIR API connection", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)URLSession:(uint64_t)a3 didReceiveChallenge:(uint64_t)a4 completionHandler:(uint64_t)a5 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_2163C4000, a2, a3, "%{public}@: Failed authentication challenge for serverTrust!", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)URLSession:(uint64_t)a1 didReceiveChallenge:(NSObject *)a2 completionHandler:.cold.3(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_debug_impl(&dword_2163C4000, a2, OS_LOG_TYPE_DEBUG, "%{public}@: SecTrustStore verification passed for root cert from FHIR API", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1_0();
}

@end
