@implementation SCNMTLResourceManager(Textures)

- (void)newTextureWithDescriptor:()Textures .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, a1, a3, "Unreachable code: Asking to created a texture with an invalid format!", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

- (void)newTextureUsingMTKTextureLoaderWithURL:()Textures options:.cold.1(id *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_8_0(a1);
  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_3_3(&dword_1DCCB8000, v1, v2, "Error: Failed to load image with error %@", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_4_4();
}

- (void)newTextureUsingMTKTextureLoaderWithURL:()Textures options:.cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_textureDescriptorFromImage:()Textures needsMipMap:textureOptions:.cold.1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  C3DImageGetURL(a1);
  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_3_3(&dword_1DCCB8000, v1, v2, "Error: Cannot load image %@. Using dummy texture.", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_4_4();
}

- (void)_copyImage:()Textures toTexture:desc:textureOptions:needsMipMapGeneration:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, a1, a3, "Error: C3DRendererCreateTextureWithImage : error while getting bitmap bytes", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

- (void)_copyImage:()Textures toTexture:desc:textureOptions:needsMipMapGeneration:.cold.2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  C3DImageGetURL(a1);
  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_3_3(&dword_1DCCB8000, v1, v2, "Error: Cannot load image %@. Texture will be garbage.", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_4_4();
}

- (void)_copyImage:()Textures toTexture:desc:textureOptions:needsMipMapGeneration:.cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, a1, a3, "Error: unknown compression format", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

- (void)_copyImage:()Textures toTexture:desc:textureOptions:needsMipMapGeneration:.cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Too many mip level loaded", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)renderResourceForImageProxy:()Textures sampler:engineContext:didFallbackToDefaultTexture:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)renderResourceForImage:()Textures sampler:options:engineContext:didFallbackToDefaultTexture:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_5();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl(&dword_1DCCB8000, v1, OS_LOG_TYPE_ERROR, "Error: Failed to load texture named %@ : %@", v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

@end
