@implementation Z76

uint64_t **___Z76_CSSymbolicatorCreateWithSignatureAdditionalSymbolOwnersFlagsAndNotificationIPK8__CFDataE10_CSTypeRefT_jjS3_U13block_pointerFvj19_CSNotificationDataE_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t Range;
  uint64_t **v5;
  unint64_t v6;
  unint64_t v8[3];

  Range = CSRegionGetRange(a2, a3);
  v5 = (uint64_t **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v8[0] = Range;
  v8[1] = Range;
  v8[2] = v6;
  return std::__tree<std::__value_type<unsigned long long,_CSRange>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,_CSRange>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,_CSRange>>>::__emplace_unique_key_args<unsigned long long,std::pair<unsigned long long,_CSRange>>(v5, v8, (uint64_t)v8);
}

@end
