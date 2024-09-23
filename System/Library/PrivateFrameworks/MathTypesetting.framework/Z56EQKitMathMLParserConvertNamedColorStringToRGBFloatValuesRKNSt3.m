@implementation Z56EQKitMathMLParserConvertNamedColorStringToRGBFloatValuesRKNSt3

uint64_t **___Z56EQKitMathMLParserConvertNamedColorStringToRGBFloatValuesRKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERdS8_S8__block_invoke()
{
  uint64_t **result;
  uint64_t **v1;
  char **v2;
  uint64_t v3;
  char **v4;

  result = (uint64_t **)operator new(0x18uLL, MEMORY[0x24BEDB6B8]);
  if (result)
  {
    v1 = result;
    result[2] = 0;
    result[1] = 0;
    *result = (uint64_t *)(result + 1);
    v2 = &_HTMLColors;
    v3 = 147;
    do
    {
      v4 = v2;
      result = (uint64_t **)std::__tree<std::__value_type<std::string_view,std::string_view>,std::__map_value_compare<std::string_view,std::__value_type<std::string_view,std::string_view>,std::less<std::string_view>,true>,std::allocator<std::__value_type<std::string_view,std::string_view>>>::__emplace_unique_key_args<std::string_view,std::piecewise_construct_t const&,std::tuple<std::string_view const&>,std::tuple<>>(v1, (uint64_t)v2, (uint64_t)&std::piecewise_construct, (_OWORD **)&v4);
      *((_OWORD *)result + 3) = *((_OWORD *)v2 + 1);
      v2 += 4;
      --v3;
    }
    while (v3);
    EQKitMathMLParserConvertNamedColorStringToRGBFloatValues(std::string const&,double &,double &,double &)::sMap = (uint64_t)v1;
  }
  return result;
}

@end
