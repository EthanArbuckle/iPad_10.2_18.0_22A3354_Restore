@implementation GEORPMapLocation(MKAdditions)

- (uint64_t)_setMapType:()MKAdditions region:
{
  uint64_t v4;
  unsigned int v6;

  v4 = 1;
  switch(a3)
  {
    case 0:
      return objc_msgSend(a1, "_setMapMode:region:", v4);
    case 1:
    case 3:
      v4 = 2;
      break;
    case 2:
    case 4:
      v4 = 3;
      break;
    default:
      if (a3 == 104)
        v6 = 4;
      else
        v6 = 0;
      if (a3 == 102)
        v4 = 1;
      else
        v4 = v6;
      break;
  }
  return objc_msgSend(a1, "_setMapMode:region:", v4);
}

@end
