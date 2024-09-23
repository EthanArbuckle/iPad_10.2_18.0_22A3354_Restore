@implementation VNFaceQualityGeneratorRevision3

+ (id)espressoModelFileNameForConfigurationOptions:(id)a3
{
  return CFSTR("facequality_regression-n6vfnwub35_11333-quant-fp16.espresso");
}

+ (basic_string_view<char,)modelVersionIDForConfigurationOptions:(id)a3
{
  char *v3;
  unint64_t v4;
  basic_string_view<char, std::char_traits<char>> result;

  v3 = "v3_drop4";
  v4 = 8;
  result.var1 = v4;
  result.var0 = v3;
  return result;
}

@end
