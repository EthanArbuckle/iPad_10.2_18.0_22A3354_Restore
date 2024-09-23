@implementation CNFeatureFlags

+ (CNFeatureFlags)currentFlags
{
  if (currentFlags_cn_once_token_1 != -1)
    dispatch_once(&currentFlags_cn_once_token_1, &__block_literal_global_39);
  return (CNFeatureFlags *)(id)currentFlags_cn_once_object_1;
}

void __30__CNFeatureFlags_currentFlags__block_invoke()
{
  CNFeatureFlags *v0;
  void *v1;

  v0 = objc_alloc_init(CNFeatureFlags);
  v1 = (void *)currentFlags_cn_once_object_1;
  currentFlags_cn_once_object_1 = (uint64_t)v0;

}

- (BOOL)isFeatureEnabled:(unint64_t)a3
{
  BOOL result;

  switch(a3)
  {
    case 0uLL:
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
    case 8uLL:
    case 9uLL:
    case 0xAuLL:
    case 0xBuLL:
    case 0xCuLL:
    case 0xDuLL:
    case 0xEuLL:
    case 0xFuLL:
    case 0x10uLL:
    case 0x11uLL:
    case 0x12uLL:
    case 0x13uLL:
    case 0x14uLL:
      result = _os_feature_enabled_impl();
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

@end
