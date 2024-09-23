@implementation ZL30outputBackingBindFunctionTablev

_QWORD *___ZL30outputBackingBindFunctionTablev_block_invoke()
{
  _QWORD *result;
  __int128 v1;

  LOWORD(v1) = 769;
  BYTE2(v1) = 0;
  *((_QWORD *)&v1 + 1) = 0;
  std::__hash_table<std::__hash_value_type<MLE5PortBindStrategyKey,BOOL (*)(e5rt_io_port *,objc_object *,NSError * {__autoreleasing}*)>,std::__unordered_map_hasher<MLE5PortBindStrategyKey,std::__hash_value_type<MLE5PortBindStrategyKey,BOOL (*)(e5rt_io_port *,objc_object *,NSError * {__autoreleasing}*)>,MLE5PortBindStrategyKey::hash,std::equal_to<MLE5PortBindStrategyKey>,true>,std::__unordered_map_equal<MLE5PortBindStrategyKey,std::__hash_value_type<MLE5PortBindStrategyKey,BOOL (*)(e5rt_io_port *,objc_object *,NSError * {__autoreleasing}*)>,std::equal_to<MLE5PortBindStrategyKey>,MLE5PortBindStrategyKey::hash,true>,std::allocator<std::__hash_value_type<MLE5PortBindStrategyKey,BOOL (*)(e5rt_io_port *,objc_object *,NSError * {__autoreleasing}*)>>>::__emplace_unique_key_args<MLE5PortBindStrategyKey,std::piecewise_construct_t const&,std::tuple<MLE5PortBindStrategyKey&&>,std::tuple<>>((unsigned __int8 *)&v1, &v1)[4] = MLE5BindPixelBufferOutputBackingToTensorPort;
  LOWORD(v1) = 257;
  BYTE2(v1) = 0;
  *((_QWORD *)&v1 + 1) = 0;
  std::__hash_table<std::__hash_value_type<MLE5PortBindStrategyKey,BOOL (*)(e5rt_io_port *,objc_object *,NSError * {__autoreleasing}*)>,std::__unordered_map_hasher<MLE5PortBindStrategyKey,std::__hash_value_type<MLE5PortBindStrategyKey,BOOL (*)(e5rt_io_port *,objc_object *,NSError * {__autoreleasing}*)>,MLE5PortBindStrategyKey::hash,std::equal_to<MLE5PortBindStrategyKey>,true>,std::__unordered_map_equal<MLE5PortBindStrategyKey,std::__hash_value_type<MLE5PortBindStrategyKey,BOOL (*)(e5rt_io_port *,objc_object *,NSError * {__autoreleasing}*)>,std::equal_to<MLE5PortBindStrategyKey>,MLE5PortBindStrategyKey::hash,true>,std::allocator<std::__hash_value_type<MLE5PortBindStrategyKey,BOOL (*)(e5rt_io_port *,objc_object *,NSError * {__autoreleasing}*)>>>::__emplace_unique_key_args<MLE5PortBindStrategyKey,std::piecewise_construct_t const&,std::tuple<MLE5PortBindStrategyKey&&>,std::tuple<>>((unsigned __int8 *)&v1, &v1)[4] = MLE5BindMultiArrayOutputBackingToTensorPort;
  LOWORD(v1) = 770;
  BYTE2(v1) = 0;
  *((_QWORD *)&v1 + 1) = 0;
  result = std::__hash_table<std::__hash_value_type<MLE5PortBindStrategyKey,BOOL (*)(e5rt_io_port *,objc_object *,NSError * {__autoreleasing}*)>,std::__unordered_map_hasher<MLE5PortBindStrategyKey,std::__hash_value_type<MLE5PortBindStrategyKey,BOOL (*)(e5rt_io_port *,objc_object *,NSError * {__autoreleasing}*)>,MLE5PortBindStrategyKey::hash,std::equal_to<MLE5PortBindStrategyKey>,true>,std::__unordered_map_equal<MLE5PortBindStrategyKey,std::__hash_value_type<MLE5PortBindStrategyKey,BOOL (*)(e5rt_io_port *,objc_object *,NSError * {__autoreleasing}*)>,std::equal_to<MLE5PortBindStrategyKey>,MLE5PortBindStrategyKey::hash,true>,std::allocator<std::__hash_value_type<MLE5PortBindStrategyKey,BOOL (*)(e5rt_io_port *,objc_object *,NSError * {__autoreleasing}*)>>>::__emplace_unique_key_args<MLE5PortBindStrategyKey,std::piecewise_construct_t const&,std::tuple<MLE5PortBindStrategyKey&&>,std::tuple<>>((unsigned __int8 *)&v1, &v1);
  result[4] = MLE5BindPixelBufferOutputBackingToSurfacePort;
  return result;
}

@end
