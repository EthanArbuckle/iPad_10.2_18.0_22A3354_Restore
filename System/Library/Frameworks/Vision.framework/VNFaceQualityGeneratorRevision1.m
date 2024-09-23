@implementation VNFaceQualityGeneratorRevision1

+ (id)espressoModelFileNameForConfigurationOptions:(id)a3
{
  return CFSTR("face_quality_v1.0_fp16.espresso");
}

+ (basic_string_view<char,)modelVersionIDForConfigurationOptions:(id)a3
{
  char *v3;
  unint64_t v4;
  basic_string_view<char, std::char_traits<char>> result;

  v3 = "v1";
  v4 = 2;
  result.var1 = v4;
  result.var0 = v3;
  return result;
}

@end
