@implementation CIFilter(Private)

+ (void)_propertyArrayFromFilters:()Private inputImageExtent:.cold.1()
{
  __assert_rtn("+[CIFilter(Private) _propertyArrayFromFilters:inputImageExtent:]", "CIFilter.mm", 1193, "affineFilter != nil || cropFilter != nil");
}

+ (void)_propertyArrayFromFilters:()Private inputImageExtent:.cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s warning: affine+crop region falls outside of image area, results may be wrong", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

+ (void)_filterArrayFromProperties:()Private .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s now returns nil.  Use _filterArrayFromProperties:inputImageExtent: instead", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

@end
