@implementation FigStreamPlaylistParserRemoteGetTypeID

uint64_t __FigStreamPlaylistParserRemoteGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  gFigStreamPlaylistParserRemoteTypeID = result;
  return result;
}

@end
