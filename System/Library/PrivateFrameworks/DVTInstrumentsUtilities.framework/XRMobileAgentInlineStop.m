@implementation XRMobileAgentInlineStop

- (int)agentStopDiagnosticsTypeCode
{
  return 21;
}

- (void)receiveMobileAgent:(id)a3
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  objc_msgSend_hello(v11, v3, v4, v5, v6);
  objc_msgSend_goodbye(v11, v7, v8, v9, v10);

}

@end
