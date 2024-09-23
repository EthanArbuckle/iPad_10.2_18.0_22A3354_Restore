@implementation SCNImageSource

- (id)textureSource
{
  NSObject *v3;

  v3 = scn_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    -[SCNImageSource textureSource].cold.1(a2);
  return 0;
}

- (BOOL)isOpaque
{
  return 1;
}

- (BOOL)isPremultiplied
{
  return 1;
}

- (void)connectToProxy:(__C3DImageProxy *)a3
{
  _OWORD v4[2];

  C3DImageProxySetSource((uint64_t)a3, self, 0);
  v4[0] = xmmword_1EA5A3DF0;
  v4[1] = *(_OWORD *)&off_1EA5A3E00;
  C3DImageProxySetCallbacks((uint64_t)a3, (uint64_t)v4);
}

- (void)textureSource
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_3_7(a1);
  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_3_3(&dword_1DCCB8000, v1, v2, "Error: SCNImageSource astract method invoked %@", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_4_4();
}

@end
