@implementation SCNCameraController(SPI)

- (void)_orthographicViewSpaceTranslationForZoomAtScreenPoint:()SPI scaleDelta:viewport:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_ERROR, "Error: Point of view has custom projection.", v1, 2u);
}

@end
