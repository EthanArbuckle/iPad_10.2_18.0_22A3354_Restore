@implementation FigMPEG2ParserCreate

malloc_zone_t *__FigMPEG2ParserCreate_block_invoke()
{
  malloc_zone_t *result;
  CFAllocatorContext v1;

  result = malloc_create_zone(0, 0);
  gFigMPEG2ParserZone = (uint64_t)result;
  if (result)
  {
    malloc_set_zone_name(result, "FigMPEG2ParserZone");
    *(_OWORD *)&v1.copyDescription = xmmword_1E2F95AB0;
    *(_OWORD *)&v1.reallocate = *(_OWORD *)&off_1E2F95AC0;
    v1.preferredSize = 0;
    *(_OWORD *)&v1.version = xmmword_1E2F95A90;
    *(_OWORD *)&v1.retain = unk_1E2F95AA0;
    result = (malloc_zone_t *)CFAllocatorCreate(0, &v1);
    FigMPEG2ParserCreate_sFigMPEG2ParserZoneAllocator = (uint64_t)result;
  }
  return result;
}

@end
