@implementation ZN6Symbol22initializeWithCSSymbolE10

char *___ZN6Symbol22initializeWithCSSymbolE10_CSTypeRef_block_invoke(uint64_t a1)
{
  uint64_t v1;
  unint64_t v2;
  char *result;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(v1 + 112);
  if (v2 >= *(_QWORD *)(v1 + 120))
  {
    result = std::vector<SourceInfo>::__emplace_back_slow_path<_CSTypeRef &>((void **)(v1 + 104));
  }
  else
  {
    SourceInfo::SourceInfo(*(_OWORD **)(v1 + 112));
    result = (char *)(v2 + 56);
    *(_QWORD *)(v1 + 112) = v2 + 56;
  }
  *(_QWORD *)(v1 + 112) = result;
  return result;
}

@end
