@implementation CRAccNavLaneGuidance

+ (Class)ACCNavigationInfoClass
{
  return (Class)objc_opt_class();
}

- (ACCNavigationLaneGuidanceInfo)laneGuidance
{
  id v3;
  id v4;

  objc_msgSend((id)objc_opt_class(), "ACCNavigationInfoClass");
  -[CRAccNavInfo accNavInfo](self, "accNavInfo");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return (ACCNavigationLaneGuidanceInfo *)v4;
}

- (unsigned)index
{
  return -[CRAccNavInfo uint16ForInfoType:](self, "uint16ForInfoType:", 1);
}

@end
