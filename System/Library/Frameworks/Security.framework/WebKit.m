@implementation WebKit

BOOL __client_is_WebKit_block_invoke()
{
  _BOOL8 result;

  result = process_matches_target((_BOOL8)"com.apple.WebKit");
  client_is_WebKit_is_WebKit = result;
  return result;
}

@end
