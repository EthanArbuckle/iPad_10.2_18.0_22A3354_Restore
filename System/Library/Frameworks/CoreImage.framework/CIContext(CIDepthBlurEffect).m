@implementation CIContext(CIDepthBlurEffect)

- (void)depthBlurEffectFilterForImageData:()CIDepthBlurEffect options:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s Unable to read RGB image data from data", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)depthBlurEffectFilterForImageData:()CIDepthBlurEffect options:.cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s Unable to extract disparity image data from data", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)depthBlurEffectFilterForImageURL:()CIDepthBlurEffect options:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s Unable to read RGB image data from URL", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)depthBlurEffectFilterForImageURL:()CIDepthBlurEffect options:.cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s Unable to extract disparity image data from URL", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)_performFaceDetection:()CIDepthBlurEffect image:orientation:filter:.cold.1()
{
  __assert_rtn("-[CIContext(CIDepthBlurEffect) _performFaceDetection:image:orientation:filter:]", "CIContext_SDOF.mm", 274, "nGoodFaces <= DBE_MAX_NUM_GOOD_FACES");
}

- (void)depthBlurEffectFilterForImage:()CIDepthBlurEffect disparityImage:portraitEffectsMatte:hairSemanticSegmentation:glassesMatte:gainMap:orientation:options:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s requires an RGB image and a disparity image.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)depthBlurEffectFilterForImage:()CIDepthBlurEffect disparityImage:portraitEffectsMatte:hairSemanticSegmentation:glassesMatte:gainMap:orientation:options:.cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s requires an image with a finite non-empty extent.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)depthBlurEffectFilterForImage:()CIDepthBlurEffect disparityImage:portraitEffectsMatte:hairSemanticSegmentation:glassesMatte:gainMap:orientation:options:.cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s requires a valid image orientation.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

@end
