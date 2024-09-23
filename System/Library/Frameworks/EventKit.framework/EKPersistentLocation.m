@implementation EKPersistentLocation

- (int)entityType
{
  return 14;
}

+ (id)defaultPropertiesToLoad
{
  if (defaultPropertiesToLoad_onceToken_3 != -1)
    dispatch_once(&defaultPropertiesToLoad_onceToken_3, &__block_literal_global_25);
  return (id)defaultPropertiesToLoad_defaultPropertiesToLoad_3;
}

+ (Class)meltedClass
{
  return (Class)objc_opt_class();
}

- (id)title
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B7A0]);
}

- (id)address
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B748]);
}

void __47__EKPersistentLocation_defaultPropertiesToLoad__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[8];

  v5[7] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D0B748];
  v5[0] = *MEMORY[0x1E0D0B7A0];
  v5[1] = v0;
  v1 = *MEMORY[0x1E0D0B778];
  v5[2] = *MEMORY[0x1E0D0B770];
  v5[3] = v1;
  v2 = *MEMORY[0x1E0D0B780];
  v5[4] = *MEMORY[0x1E0D0B760];
  v5[5] = v2;
  v5[6] = *MEMORY[0x1E0D0B798];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 7);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)defaultPropertiesToLoad_defaultPropertiesToLoad_3;
  defaultPropertiesToLoad_defaultPropertiesToLoad_3 = v3;

}

+ (id)relations
{
  if (relations_onceToken_6 != -1)
    dispatch_once(&relations_onceToken_6, &__block_literal_global_2_0);
  return (id)relations_relations_6;
}

void __33__EKPersistentLocation_relations__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v0 = *MEMORY[0x1E0D0B3E0];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0D0B3E0], *MEMORY[0x1E0D0B290], *MEMORY[0x1E0D0B400], *MEMORY[0x1E0D0B2B8], 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[EKRelation relationWithEntityName:toMany:inversePropertyNames:ownsRelated:](EKRelation, "relationWithEntityName:toMany:inversePropertyNames:ownsRelated:", CFSTR("CalendarItem"), 0, v1, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setInversePropertyIsApplicable:", &__block_literal_global_8);
  v2 = objc_alloc(MEMORY[0x1E0C99D80]);
  v3 = *MEMORY[0x1E0D0B758];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[EKRelation relationWithEntityName:toMany:inversePropertyNames:ownsRelated:](EKRelation, "relationWithEntityName:toMany:inversePropertyNames:ownsRelated:", CFSTR("Alarm"), 0, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v2, "initWithObjectsAndKeys:", v8, v3, v5, *MEMORY[0x1E0D0B750], 0);
  v7 = (void *)relations_relations_6;
  relations_relations_6 = v6;

}

BOOL __33__EKPersistentLocation_relations__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  id v9;
  _BOOL8 v10;

  v6 = a2;
  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "primitiveRelationValueForKey:", v6);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = v9 == v8;

  }
  else
  {
    v10 = 1;
  }

  return v10;
}

+ (Class)alternateUniverseClass
{
  return (Class)objc_opt_class();
}

- (void)setTitle:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B7A0]);
}

- (void)setAddress:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B748]);
}

- (id)latitude
{
  return -[EKPersistentObject primitiveNumberValueForKey:](self, "primitiveNumberValueForKey:", *MEMORY[0x1E0D0B770]);
}

- (void)setLatitude:(id)a3
{
  -[EKPersistentObject primitiveSetNumberValue:forKey:](self, "primitiveSetNumberValue:forKey:", a3, *MEMORY[0x1E0D0B770]);
}

- (id)longitude
{
  return -[EKPersistentObject primitiveNumberValueForKey:](self, "primitiveNumberValueForKey:", *MEMORY[0x1E0D0B778]);
}

- (void)setLongitude:(id)a3
{
  -[EKPersistentObject primitiveSetNumberValue:forKey:](self, "primitiveSetNumberValue:forKey:", a3, *MEMORY[0x1E0D0B778]);
}

- (id)referenceFrame
{
  return -[EKPersistentObject primitiveNumberValueForKey:](self, "primitiveNumberValueForKey:", *MEMORY[0x1E0D0B790]);
}

- (void)setReferenceFrame:(id)a3
{
  -[EKPersistentObject primitiveSetNumberValue:forKey:](self, "primitiveSetNumberValue:forKey:", a3, *MEMORY[0x1E0D0B790]);
}

- (id)radius
{
  return -[EKPersistentObject primitiveNumberValueForKey:](self, "primitiveNumberValueForKey:", *MEMORY[0x1E0D0B788]);
}

- (void)setRadius:(id)a3
{
  -[EKPersistentObject primitiveSetNumberValue:forKey:](self, "primitiveSetNumberValue:forKey:", a3, *MEMORY[0x1E0D0B788]);
}

- (id)contactLabel
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B760]);
}

- (void)setContactLabel:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B760]);
}

- (id)mapKitHandle
{
  return -[EKPersistentObject primitiveDataValueForKey:](self, "primitiveDataValueForKey:", *MEMORY[0x1E0D0B780]);
}

- (void)setMapKitHandle:(id)a3
{
  -[EKPersistentObject primitiveSetDataValue:forKey:](self, "primitiveSetDataValue:forKey:", a3, *MEMORY[0x1E0D0B780]);
}

- (id)routing
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B798]);
}

- (void)setRouting:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B798]);
}

- (id)derivedFrom
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B768]);
}

- (void)setDerivedFrom:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B768]);
}

- (void)setCalendarItemOwner:(id)a3
{
  -[EKPersistentObject primitiveSetRelationValue:forKey:](self, "primitiveSetRelationValue:forKey:", a3, *MEMORY[0x1E0D0B758]);
}

- (id)calendarItemOwner
{
  return -[EKPersistentObject primitiveRelationValueForKey:](self, "primitiveRelationValueForKey:", *MEMORY[0x1E0D0B758]);
}

- (void)setAlarmOwner:(id)a3
{
  -[EKPersistentObject primitiveSetRelationValue:forKey:](self, "primitiveSetRelationValue:forKey:", a3, *MEMORY[0x1E0D0B750]);
}

- (id)alarmOwner
{
  return -[EKPersistentObject primitiveRelationValueForKey:](self, "primitiveRelationValueForKey:", *MEMORY[0x1E0D0B750]);
}

- (id)copyWithZone:(_NSZone *)a3
{
  EKPersistentLocation *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = objc_alloc_init(EKPersistentLocation);
  -[EKPersistentLocation title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPersistentLocation setTitle:](v4, "setTitle:", v5);

  -[EKPersistentLocation address](self, "address");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPersistentLocation setAddress:](v4, "setAddress:", v6);

  -[EKPersistentLocation latitude](self, "latitude");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPersistentLocation setLatitude:](v4, "setLatitude:", v7);

  -[EKPersistentLocation longitude](self, "longitude");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPersistentLocation setLongitude:](v4, "setLongitude:", v8);

  -[EKPersistentLocation contactLabel](self, "contactLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPersistentLocation setContactLabel:](v4, "setContactLabel:", v9);

  -[EKPersistentLocation mapKitHandle](self, "mapKitHandle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPersistentLocation setMapKitHandle:](v4, "setMapKitHandle:", v10);

  -[EKPersistentLocation radius](self, "radius");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPersistentLocation setRadius:](v4, "setRadius:", v11);

  -[EKPersistentLocation routing](self, "routing");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPersistentLocation setRouting:](v4, "setRouting:", v12);

  return v4;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[EKPersistentLocation title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPersistentLocation address](self, "address");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPersistentLocation latitude](self, "latitude");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPersistentLocation longitude](self, "longitude");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPersistentLocation contactLabel](self, "contactLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPersistentLocation radius](self, "radius");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPersistentLocation routing](self, "routing");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ <%p> {title = %@; address = %@; lat = %@; long = %@; abID = %@; radius = %@, routing = %@}"),
    v4,
    self,
    v5,
    v6,
    v7,
    v8,
    v9,
    v10,
    v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)semanticIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[EKPersistentLocation title](self, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPersistentLocation address](self, "address");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPersistentLocation mapKitHandle](self, "mapKitHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPersistentLocation contactLabel](self, "contactLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPersistentLocation latitude](self, "latitude");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPersistentLocation longitude](self, "longitude");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPersistentLocation radius](self, "radius");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[EKStructuredLocationSemanticIdentifierGenerator semanticIdentifierForLocationWithTitle:address:mapKitHandle:contactLabel:latitude:longitude:radius:](EKStructuredLocationSemanticIdentifierGenerator, "semanticIdentifierForLocationWithTitle:address:mapKitHandle:contactLabel:latitude:longitude:radius:", v3, v4, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
