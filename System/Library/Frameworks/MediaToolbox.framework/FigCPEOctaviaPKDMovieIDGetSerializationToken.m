@implementation FigCPEOctaviaPKDMovieIDGetSerializationToken

uint64_t __FigCPEOctaviaPKDMovieIDGetSerializationToken_block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 40) + 40);
  if (v1)
    **(_QWORD **)(result + 48) = v1;
  else
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = -12158;
  return result;
}

@end
