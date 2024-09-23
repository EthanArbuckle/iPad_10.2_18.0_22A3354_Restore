@implementation ARCV3DColorComponentsForARKitSemanticsLUT8Elements

double __ARCV3DColorComponentsForARKitSemanticsLUT8Elements_block_invoke()
{
  double result;

  if (_CV3DColorMappingForRawSemantics_onceToken != -1)
    dispatch_once(&_CV3DColorMappingForRawSemantics_onceToken, &__block_literal_global_250);
  result = *(double *)&_CV3DColorMappingForRawSemantics_cv3DColors;
  ARCV3DColorComponentsForARKitSemanticsLUT8Elements_cv3DColors = _CV3DColorMappingForRawSemantics_cv3DColors;
  unk_1EF081E00 = xmmword_1EF081EB0;
  xmmword_1EF081E10 = xmmword_1EF081EA0;
  unk_1EF081E20 = xmmword_1EF081EC0;
  xmmword_1EF081E30 = xmmword_1EF081FC0;
  unk_1EF081E40 = xmmword_1EF081F80;
  xmmword_1EF081E50 = xmmword_1EF081F00;
  unk_1EF081E60 = xmmword_1EF081EF0;
  return result;
}

@end
