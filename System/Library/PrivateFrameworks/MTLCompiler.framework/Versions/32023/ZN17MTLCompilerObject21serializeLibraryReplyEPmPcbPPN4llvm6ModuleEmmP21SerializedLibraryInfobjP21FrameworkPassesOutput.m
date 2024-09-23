@implementation ZN17MTLCompilerObject21serializeLibraryReplyEPmPcbPPN4llvm6ModuleEmmP21SerializedLibraryInfobjP21FrameworkPassesOutput

void *___ZN17MTLCompilerObject21serializeLibraryReplyEPmPcbPPN4llvm6ModuleEmmP21SerializedLibraryInfobjP21FrameworkPassesOutput_block_invoke_4(uint64_t a1, const void **a2)
{
  char *v2;
  size_t v3;
  uint64_t v4;
  void *result;
  _BYTE *v6;

  v2 = (char *)*a2;
  v3 = (size_t)a2[1];
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  result = memcpy(*(void **)(v4 + 24), *a2, v3);
  v6 = (_BYTE *)(*(_QWORD *)(v4 + 24) + v3);
  *(_QWORD *)(v4 + 24) = v6;
  if (!v3 || v2[v3 - 1])
  {
    *v6 = 0;
    ++*(_QWORD *)(v4 + 24);
  }
  return result;
}

@end
