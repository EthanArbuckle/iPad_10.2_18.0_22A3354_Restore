@implementation MUETAHelper

+ (id)etaSymbolForTransportType:(unint64_t)a3
{
  if (a3 - 1 > 7)
    return CFSTR("arrow.triangle.turn.up.right.circle.fill");
  else
    return off_1E2E03D40[a3 - 1];
}

+ (int)analyticsActionForTransportType:(unint64_t)a3
{
  int result;

  result = 17099;
  switch(a3)
  {
    case 1uLL:
      result = 11012;
      break;
    case 2uLL:
      result = 11013;
      break;
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      return result;
    case 4uLL:
      result = 11014;
      break;
    case 8uLL:
      result = 11026;
      break;
    default:
      if (a3 == 0xFFFFFFF)
        result = 6003;
      else
        result = 17099;
      break;
  }
  return result;
}

+ (id)axIDStringForTransportType:(unint64_t)a3
{
  id result;

  result = 0;
  switch(a3)
  {
    case 1uLL:
      result = CFSTR("Driving");
      break;
    case 2uLL:
      result = CFSTR("Walking");
      break;
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      return result;
    case 4uLL:
      result = CFSTR("Transit");
      break;
    case 8uLL:
      result = CFSTR("Cycling");
      break;
    default:
      if (a3 == 0xFFFFFFF)
        result = CFSTR("Any");
      else
        result = 0;
      break;
  }
  return result;
}

+ (id)axLabelForTransportType:(unint64_t)a3
{
  unint64_t v3;
  __CFString *v4;

  v3 = a3 - 1;
  if (a3 - 1 <= 7 && ((0x8Bu >> v3) & 1) != 0)
  {
    _MULocalizedStringFromThisBundle(off_1E2E03D80[v3]);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = &stru_1E2E05448;
  }
  return v4;
}

@end
