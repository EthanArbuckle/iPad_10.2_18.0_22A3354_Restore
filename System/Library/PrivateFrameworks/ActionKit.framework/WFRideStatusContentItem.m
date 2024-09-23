@implementation WFRideStatusContentItem

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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[11];

  v31[9] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BE19490];
  WFLocalizedContentPropertyNameMarker(CFSTR("Vehicle Information"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "keyPath:name:class:", CFSTR("vehicleDescription"), v30, objc_opt_class());
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v29;
  v3 = (void *)MEMORY[0x24BE19490];
  WFLocalizedContentPropertyNameMarker(CFSTR("Drop Off Time"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "keyPath:name:class:", CFSTR("estimatedDropOffDate"), v28, objc_opt_class());
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v27;
  v4 = (void *)MEMORY[0x24BE19490];
  WFLocalizedContentPropertyNameMarker(CFSTR("Pickup Time"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyPath:name:class:", CFSTR("estimatedPickupDate"), v26, objc_opt_class());
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v31[2] = v25;
  v5 = (void *)MEMORY[0x24BE19490];
  WFLocalizedContentPropertyNameMarker(CFSTR("Pickup Location"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keyPath:name:class:", CFSTR("pickupLocation"), v24, getCLPlacemarkClass_44698());
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v31[3] = v23;
  v6 = (void *)MEMORY[0x24BE19490];
  WFLocalizedContentPropertyNameMarker(CFSTR("Drop Off Location"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "keyPath:name:class:", CFSTR("dropOffLocation"), v22, getCLPlacemarkClass_44698());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v31[4] = v7;
  v8 = (void *)MEMORY[0x24BE19490];
  WFLocalizedContentPropertyNameMarker(CFSTR("Minimum Price"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "keyPath:name:class:", CFSTR("minimumPrice"), v9, objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v31[5] = v10;
  v11 = (void *)MEMORY[0x24BE19490];
  WFLocalizedContentPropertyNameMarker(CFSTR("Maximum Price"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "keyPath:name:class:", CFSTR("maximumPrice"), v12, objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v31[6] = v13;
  v14 = (void *)MEMORY[0x24BE19490];
  WFLocalizedContentPropertyNameMarker(CFSTR("Ride Option Name"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "keyPath:name:class:", CFSTR("rideOptionName"), v15, objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v31[7] = v16;
  v17 = (void *)MEMORY[0x24BE19490];
  WFLocalizedContentPropertyNameMarker(CFSTR("Driver"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "keyPath:name:class:", CFSTR("driver"), v18, objc_opt_class());
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v31[8] = v19;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 9);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (id)ownedTypes
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF00];
  objc_msgSend(MEMORY[0x24BE19598], "typeWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)typeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Ride Status"), CFSTR("Ride Status"));
}

+ (id)pluralTypeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Ride Statuses"), CFSTR("Ride Statuses"));
}

+ (id)countDescription
{
  return WFLocalizedPluralString(CFSTR("%d Rides"));
}

- (INRideStatus)rideStatus
{
  return (INRideStatus *)-[WFRideStatusContentItem objectForClass:](self, "objectForClass:", objc_opt_class());
}

- (id)vehicleDescription
{
  void *v2;
  void *v3;
  void *v4;

  -[WFRideStatusContentItem rideStatus](self, "rideStatus");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "vehicle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "wfName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)estimatedDropOffDate
{
  void *v2;
  void *v3;

  -[WFRideStatusContentItem rideStatus](self, "rideStatus");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "estimatedDropOffDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)estimatedPickupDate
{
  void *v2;
  void *v3;

  -[WFRideStatusContentItem rideStatus](self, "rideStatus");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "estimatedPickupDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)pickupLocation
{
  void *v2;
  void *v3;

  -[WFRideStatusContentItem rideStatus](self, "rideStatus");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pickupLocation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)dropOffLocation
{
  void *v2;
  void *v3;

  -[WFRideStatusContentItem rideStatus](self, "rideStatus");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dropOffLocation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)minimumPrice
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = objc_alloc(MEMORY[0x24BDD9C80]);
  -[WFRideStatusContentItem rideStatus](self, "rideStatus");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rideOption");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "priceRange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "minimumPrice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFRideStatusContentItem rideStatus](self, "rideStatus");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rideOption");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "priceRange");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "currencyCode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v3, "initWithAmount:currencyCode:", v7, v11);

  return v12;
}

- (id)maximumPrice
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = objc_alloc(MEMORY[0x24BDD9C80]);
  -[WFRideStatusContentItem rideStatus](self, "rideStatus");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rideOption");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "priceRange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "maximumPrice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFRideStatusContentItem rideStatus](self, "rideStatus");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rideOption");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "priceRange");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "currencyCode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v3, "initWithAmount:currencyCode:", v7, v11);

  return v12;
}

- (id)rideOptionName
{
  void *v2;
  void *v3;
  void *v4;

  -[WFRideStatusContentItem rideStatus](self, "rideStatus");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rideOption");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)disclaimerMessage
{
  void *v2;
  void *v3;
  void *v4;

  -[WFRideStatusContentItem rideStatus](self, "rideStatus");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rideOption");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "disclaimerMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)driver
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BE19408];
  -[WFRideStatusContentItem rideStatus](self, "rideStatus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "driver");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cnContactWithINPerson:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
