@implementation WFParkedCarContentItem

- (id)vehicleEvent
{
  return (id)-[WFParkedCarContentItem objectForClass:](self, "objectForClass:", getRTVehicleEventClass());
}

- (id)date
{
  void *v2;
  void *v3;

  -[WFParkedCarContentItem vehicleEvent](self, "vehicleEvent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)location
{
  void *v2;
  void *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  void *v8;

  -[WFParkedCarContentItem vehicleEvent](self, "vehicleEvent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "location");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_alloc((Class)getCLLocationClass_24490());
    objc_msgSend(v3, "latitude");
    v6 = v5;
    objc_msgSend(v3, "longitude");
    v8 = (void *)objc_msgSend(v4, "initWithLatitude:longitude:", v6, v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)notes
{
  void *v2;
  void *v3;

  -[WFParkedCarContentItem vehicleEvent](self, "vehicleEvent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)userSetLocation
{
  void *v2;
  char v3;

  -[WFParkedCarContentItem vehicleEvent](self, "vehicleEvent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userSetLocation");

  return v3;
}

- (id)photo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[WFParkedCarContentItem vehicleEvent](self, "vehicleEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "photo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x24BEC14E0];
    -[WFParkedCarContentItem vehicleEvent](self, "vehicleEvent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "photo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "imageWithData:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)generateObjectRepresentationForClass:(Class)a3 options:(id)a4 error:(id *)a5
{
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;

  if ((Class)objc_opt_class() == a3)
  {
    -[WFParkedCarContentItem date](self, "date");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    NSStringFromClass(a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(CFSTR("CLLocation"), "isEqualToString:", v7);

    if (!v8)
    {
LABEL_7:
      v11 = 0;
      return v11;
    }
    -[WFParkedCarContentItem location](self, "location");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;
  if (!v9)
    goto LABEL_7;
  objc_msgSend(MEMORY[0x24BE19590], "object:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)defaultSourceForRepresentation:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BE19428];
  objc_msgSend(MEMORY[0x24BE19390], "locationWithSystemAppBundleIdentifier:", CFSTR("com.apple.Maps"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributionSetWithOrigin:disclosureLevel:", v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)preferredDisplayStyle
{
  return 1;
}

+ (id)stringConversionBehavior
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BE19468];
  objc_msgSend(a1, "propertyForName:", CFSTR("Location"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessingProperty:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)ownedTypes
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF00];
  objc_msgSend(MEMORY[0x24BE19598], "typeWithClass:", getRTVehicleEventClass());
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

  v2 = (void *)MEMORY[0x24BDBCF00];
  objc_msgSend(MEMORY[0x24BE19598], "typeWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE19598], "typeWithClassName:frameworkName:location:", CFSTR("CLLocation"), CFSTR("CoreLocation"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)contentCategories
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = *MEMORY[0x24BE196E8];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)typeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Parked Car"), CFSTR("Parked Car"));
}

+ (id)pluralTypeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Parked Cars"), CFSTR("Parked Cars"));
}

+ (id)countDescription
{
  return WFLocalizedPluralString(CFSTR("%d parked cars"));
}

+ (id)propertyBuilders
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[6];

  v20[5] = *MEMORY[0x24BDAC8D0];
  if ((id)objc_opt_class() != a1)
    return 0;
  v3 = (void *)MEMORY[0x24BE19490];
  WFLocalizedContentPropertyNameMarker(CFSTR("Date"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "keyPath:name:class:", CFSTR("date"), v19, objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v18;
  v4 = (void *)MEMORY[0x24BE19490];
  WFLocalizedContentPropertyNameMarker(CFSTR("Location"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyPath:name:class:", CFSTR("location"), v5, getCLLocationClass_24490());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v6;
  v7 = (void *)MEMORY[0x24BE19490];
  WFLocalizedContentPropertyNameMarker(CFSTR("Notes"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "keyPath:name:class:", CFSTR("notes"), v8, objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v9;
  v10 = (void *)MEMORY[0x24BE19490];
  WFLocalizedContentPropertyNameMarker(CFSTR("Photo"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "keyPath:name:class:", CFSTR("photo"), v11, objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = v12;
  v13 = (void *)MEMORY[0x24BE19490];
  WFLocalizedContentPropertyNameMarker(CFSTR("Was Location Set by User"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "keyPath:name:class:", CFSTR("userSetLocation"), v14, objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[4] = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

@end
