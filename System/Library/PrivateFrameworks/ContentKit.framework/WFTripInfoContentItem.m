@implementation WFTripInfoContentItem

+ (id)propertyBuilders
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  _QWORD v14[5];

  v14[4] = *MEMORY[0x24BDAC8D0];
  WFLocalizedContentPropertyNameMarker(CFSTR("Travel Time"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("travelTime"), v13, objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeUnits:", 124);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  WFLocalizedContentPropertyNameMarker(CFSTR("Arrival Time"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("arrivalTime"), v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v5;
  WFLocalizedContentPropertyNameMarker(CFSTR("Route Name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("routeName"), v6, objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v7;
  WFLocalizedContentPropertyNameMarker(CFSTR("Distance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("distance"), v8, objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "measurementUnitType:", *MEMORY[0x24BEC19E8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)stringConversionBehavior
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "propertyForName:", CFSTR("Travel Time"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentItemStringConversionBehavior accessingProperty:](WFContentItemStringConversionBehavior, "accessingProperty:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)ownedTypes
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF00];
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)outputTypes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BDBCF00];
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)contentCategories
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("Location");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)typeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Trip info (singular)"), CFSTR("Trip info"));
}

+ (id)pluralTypeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Trip info (plural)"), CFSTR("Trip info"));
}

+ (id)countDescription
{
  return WFLocalizedPluralString(CFSTR("%d Trip infos"));
}

- (WFTripInfo)tripInfo
{
  return (WFTripInfo *)-[WFContentItem objectForClass:](self, "objectForClass:", objc_opt_class());
}

- (id)travelTime
{
  void *v2;
  void *v3;

  -[WFTripInfoContentItem tripInfo](self, "tripInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "expectedTravelTime");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)arrivalTime
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCE60];
  -[WFTripInfoContentItem travelTime](self, "travelTime");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeInterval");
  objc_msgSend(v2, "dateWithTimeIntervalSinceNow:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)routeName
{
  void *v2;
  void *v3;

  -[WFTripInfoContentItem tripInfo](self, "tripInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "routeName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)distance
{
  void *v2;
  void *v3;

  -[WFTripInfoContentItem tripInfo](self, "tripInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "distance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)generateObjectRepresentationForClass:(Class)a3 options:(id)a4 error:(id *)a5
{
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  if ((Class)objc_opt_class() == a3)
  {
    -[WFTripInfoContentItem travelTime](self, "travelTime");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "absoluteTimeString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFObjectRepresentation object:](WFObjectRepresentation, "object:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
    return v7;
  }
  if ((Class)objc_opt_class() == a3)
  {
    -[WFTripInfoContentItem travelTime](self, "travelTime");
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v8 = (void *)v10;
    +[WFObjectRepresentation object:](WFObjectRepresentation, "object:", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if ((Class)objc_opt_class() == a3)
  {
    -[WFTripInfoContentItem distance](self, "distance");
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  v7 = 0;
  return v7;
}

@end
