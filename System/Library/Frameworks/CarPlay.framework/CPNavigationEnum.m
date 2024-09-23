@implementation CPNavigationEnum

+ (id)stringForEnum:(int64_t)a3 navEnum:(unsigned __int8)a4
{
  void *v4;

  v4 = 0;
  switch(a4)
  {
    case 0u:
      return v4;
    case 1u:
      NSStringFromCPManeuverType(a3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2u:
      NSStringFromCPJunctionType(a3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3u:
      NSStringFromCPTrafficSide(a3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 4u:
      NSStringFromCPLaneStatus(a3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 5u:
      NSStringFromCPDistanceUnits(a3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 6u:
      NSStringFromCPGuidanceState(a3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 7u:
      NSStringFromCPManeuverState(a3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ERROR - %ld %d"), a3, a4);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
  }
  return v4;
}

@end
