@implementation ZNK14HALS

char *___ZNK14HALS_IOContext17GetIssueReportersEv_block_invoke(uint64_t a1)
{
  uint64_t v1;
  char *result;

  v1 = *(_QWORD *)(a1 + 40);
  result = (char *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (result != (char *)(v1 + 160))
    return std::vector<long long>::__assign_with_size[abi:ne180100]<long long *,long long *>(result, *(char **)(v1 + 160), *(_QWORD *)(v1 + 168), (uint64_t)(*(_QWORD *)(v1 + 168) - *(_QWORD *)(v1 + 160)) >> 3);
  return result;
}

@end
