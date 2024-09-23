@implementation CRAccNavRouteGuidance

+ (Class)ACCNavigationInfoClass
{
  return (Class)objc_opt_class();
}

+ (id)resetForComponent:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setInfo:data:", 1, &unk_250966080);
  v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithComponent:accNavInfo:", v4, v5);

  return v6;
}

+ (id)loadingForComponent:(id)a3 sourceName:(id)a4 sourceSupported:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setInfo:data:", 1, &unk_250966098);
  objc_msgSend(v10, "setInfo:data:", 19, v8);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setInfo:data:", 20, v11);

  v12 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithComponent:accNavInfo:", v9, v10);
  return v12;
}

- (ACCNavigationRouteGuidanceUpdateInfo)routeGuidance
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

  return (ACCNavigationRouteGuidanceUpdateInfo *)v4;
}

- (unsigned)guidanceState
{
  return -[CRAccNavInfo uint8ForInfoType:](self, "uint8ForInfoType:", 1);
}

- (NSArray)currentManeuverIndexes
{
  void *v2;
  id v3;
  void *v4;

  -[CRAccNavInfo valueForInfoType:](self, "valueForInfoType:", 13);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v3 = v2;
  if (!v3 || (v4 = v3, (objc_opt_isKindOfClass() & 1) == 0))
  {

    v4 = (void *)MEMORY[0x24BDBD1A8];
  }

  return (NSArray *)v4;
}

- (BOOL)hasCurrentLaneGuidanceIndex
{
  void *v2;
  BOOL v3;

  -[CRAccNavInfo valueForInfoType:](self, "valueForInfoType:", 16);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (unsigned)currentLaneGuidanceIndex
{
  return -[CRAccNavInfo uint16ForInfoType:](self, "uint16ForInfoType:", 16);
}

@end
