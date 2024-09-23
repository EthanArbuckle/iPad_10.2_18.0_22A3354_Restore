@implementation INReportIncidentIntent

- (INReportIncidentIntent)initWithIncidentType:(id)a3 startTime:(id)a4 additionalDetails:(id)a5 isClear:(id)a6
{
  return -[INReportIncidentIntent initWithIncidentType:startTime:isClear:userLocation:additionalDetails:](self, "initWithIncidentType:startTime:isClear:userLocation:additionalDetails:", 0, a4, a6, 0, a5);
}

- (id)_typedBackingStore
{
  void *v2;
  void *v3;
  id v4;

  -[INIntent backingStore](self, "backingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (id)_metadata
{
  void *v2;
  void *v3;

  -[INReportIncidentIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "intentMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_setMetadata:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[INReportIncidentIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIntentMetadata:", v4);

}

- (INReportIncidentIntent)initWithIncidentType:(id)a3 startTime:(id)a4 isClear:(id)a5 userLocation:(id)a6 additionalDetails:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  INReportIncidentIntent *v17;
  INReportIncidentIntent *v18;
  objc_super v20;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)INReportIncidentIntent;
  v17 = -[INIntent init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    -[INReportIncidentIntent setIncidentType:](v17, "setIncidentType:", v12);
    -[INReportIncidentIntent setStartTime:](v18, "setStartTime:", v13);
    -[INReportIncidentIntent setIsClear:](v18, "setIsClear:", v14);
    -[INReportIncidentIntent setUserLocation:](v18, "setUserLocation:", v15);
    -[INReportIncidentIntent setAdditionalDetails:](v18, "setAdditionalDetails:", v16);
  }

  return v18;
}

- (NSString)incidentType
{
  void *v2;
  void *v3;
  void *v4;

  -[INReportIncidentIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "incidentType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromSupportedTrafficIncidentType(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setIncidentType:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INReportIncidentIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToSupportedTrafficIncidentType(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setIncidentType:", v5);
}

- (NSNumber)startTime
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[INReportIncidentIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasStartTime"))
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[INReportIncidentIntent _typedBackingStore](self, "_typedBackingStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "startTime");
    objc_msgSend(v4, "numberWithDouble:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return (NSNumber *)v6;
}

- (void)setStartTime:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[INReportIncidentIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v5, "doubleValue");
    objc_msgSend(v4, "setStartTime:");
  }
  else
  {
    objc_msgSend(v4, "setHasStartTime:", 0);
  }

}

- (NSNumber)isClear
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[INReportIncidentIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasIsClear"))
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[INReportIncidentIntent _typedBackingStore](self, "_typedBackingStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "isClear"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return (NSNumber *)v6;
}

- (void)setIsClear:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[INReportIncidentIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "setIsClear:", objc_msgSend(v5, "BOOLValue"));
  else
    objc_msgSend(v4, "setHasIsClear:", 0);

}

- (CLPlacemark)userLocation
{
  void *v2;
  void *v3;
  void *v4;

  -[INReportIncidentIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userLocation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromLocation(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (CLPlacemark *)v4;
}

- (void)setUserLocation:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INReportIncidentIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToLocation(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setUserLocation:", v5);
}

- (NSString)additionalDetails
{
  void *v2;
  void *v3;
  void *v4;

  -[INReportIncidentIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "additionalDetails");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setAdditionalDetails:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INReportIncidentIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToString(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setAdditionalDetails:", v5);
}

- (id)_dictionaryRepresentation
{
  uint64_t v3;
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
  void *v15;
  _QWORD v16[5];
  _QWORD v17[6];

  v17[5] = *MEMORY[0x1E0C80C00];
  v16[0] = CFSTR("incidentType");
  -[INReportIncidentIntent incidentType](self, "incidentType");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v17[0] = v3;
  v16[1] = CFSTR("startTime");
  -[INReportIncidentIntent startTime](self, "startTime", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[1] = v6;
  v16[2] = CFSTR("isClear");
  -[INReportIncidentIntent isClear](self, "isClear");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[2] = v8;
  v16[3] = CFSTR("userLocation");
  -[INReportIncidentIntent userLocation](self, "userLocation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[3] = v10;
  v16[4] = CFSTR("additionalDetails");
  -[INReportIncidentIntent additionalDetails](self, "additionalDetails");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[4] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)

  if (!v9)
  if (!v7)

  if (!v5)
  if (!v4)

  return v13;
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a4;
  -[INReportIncidentIntent _typedBackingStore](self, "_typedBackingStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v6;
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v7, "userLocation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueRedactedLocationFromLocation(v9, a3, v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setUserLocation:", v10);

  objc_msgSend(v7, "additionalDetails");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueRedactedStringFromString(v11, a3, v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setAdditionalDetails:", v12);
  -[INIntent setBackingStore:](self, "setBackingStore:", v8);

}

- (id)domain
{
  return CFSTR("Geo");
}

- (id)verb
{
  return CFSTR("ReportIncident");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
