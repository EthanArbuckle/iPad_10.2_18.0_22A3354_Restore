@implementation CIContext(ImageRepresentation)

- (void)HEIF10RepresentationOfImage:()ImageRepresentation colorSpace:options:error:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s requires an image with a finite non-empty extent.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)HEIF10RepresentationOfImage:()ImageRepresentation colorSpace:options:error:.cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s unsupported colorspace.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)HEIF10RepresentationOfImage:()ImageRepresentation colorSpace:options:error:.cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s failed to create a CVPixelBuffer.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)HEIF10RepresentationOfImage:()ImageRepresentation colorSpace:options:error:.cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s failed to render image.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)HEIF10RepresentationOfImage:()ImageRepresentation colorSpace:options:error:.cold.6()
{
  void *v0;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", CFSTR("OSStatus soft_CMPhotoCompressionSessionCreate(CFAllocatorRef, CFDictionaryRef, CMPhotoCompressionSessionRef *)"), CFSTR("CIContext_ImageReps.mm"), 76, CFSTR("%s"), OUTLINED_FUNCTION_0_0());
  __break(1u);
}

- (void)HEIF10RepresentationOfImage:()ImageRepresentation colorSpace:options:error:.cold.7(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s failed to create a PhotoCompressionSession.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)HEIF10RepresentationOfImage:()ImageRepresentation colorSpace:options:error:.cold.8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s failed to close the PhotoCompressionSession.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)HEIF10RepresentationOfImage:()ImageRepresentation colorSpace:options:error:.cold.9(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s failed to add image to the PhotoCompressionSession.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)HEIF10RepresentationOfImage:()ImageRepresentation colorSpace:options:error:.cold.10(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s failed to open the PhotoCompressionSession.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

@end
