@implementation INSearchForPhotosIntent

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

  -[INSearchForPhotosIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INSearchForPhotosIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIntentMetadata:", v4);

}

- (int64_t)_intentCategory
{
  return 9;
}

- (id)_categoryVerb
{
  return CFSTR("Search");
}

- (INSearchForPhotosIntent)initWithDateCreated:(INDateComponentsRange *)dateCreated locationCreated:(CLPlacemark *)locationCreated albumName:(NSString *)albumName searchTerms:(NSArray *)searchTerms includedAttributes:(INPhotoAttributeOptions)includedAttributes excludedAttributes:(INPhotoAttributeOptions)excludedAttributes peopleInPhoto:(NSArray *)peopleInPhoto
{
  INDateComponentsRange *v15;
  CLPlacemark *v16;
  NSString *v17;
  NSArray *v18;
  NSArray *v19;
  INSearchForPhotosIntent *v20;
  INSearchForPhotosIntent *v21;
  objc_super v23;

  v15 = dateCreated;
  v16 = locationCreated;
  v17 = albumName;
  v18 = searchTerms;
  v19 = peopleInPhoto;
  v23.receiver = self;
  v23.super_class = (Class)INSearchForPhotosIntent;
  v20 = -[INIntent init](&v23, sel_init);
  v21 = v20;
  if (v20)
  {
    -[INSearchForPhotosIntent setDateCreated:](v20, "setDateCreated:", v15);
    -[INSearchForPhotosIntent setLocationCreated:](v21, "setLocationCreated:", v16);
    -[INSearchForPhotosIntent setAlbumName:](v21, "setAlbumName:", v17);
    -[INSearchForPhotosIntent setSearchTerms:](v21, "setSearchTerms:", v18);
    -[INSearchForPhotosIntent setIncludedAttributes:](v21, "setIncludedAttributes:", includedAttributes);
    -[INSearchForPhotosIntent setExcludedAttributes:](v21, "setExcludedAttributes:", excludedAttributes);
    -[INSearchForPhotosIntent setPeopleInPhoto:](v21, "setPeopleInPhoto:", v19);
  }

  return v21;
}

- (INDateComponentsRange)dateCreated
{
  void *v2;
  void *v3;
  void *v4;

  -[INSearchForPhotosIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateCreated");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromDateTimeRange(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (INDateComponentsRange *)v4;
}

- (void)setDateCreated:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INSearchForPhotosIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToDateTimeRange(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setDateCreated:", v5);
}

- (CLPlacemark)locationCreated
{
  void *v2;
  void *v3;
  void *v4;

  -[INSearchForPhotosIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "locationCreated");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromLocation(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (CLPlacemark *)v4;
}

- (void)setLocationCreated:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INSearchForPhotosIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToLocation(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setLocationCreated:", v5);
}

- (NSString)albumName
{
  void *v2;
  void *v3;
  void *v4;

  -[INSearchForPhotosIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "albumName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setAlbumName:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INSearchForPhotosIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToString(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setAlbumName:", v5);
}

- (NSArray)searchTerms
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[INSearchForPhotosIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "searchTerm");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "dataStrings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromStrings(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (INConditionalOperator)searchTermsOperator
{
  void *v2;
  void *v3;
  void *v4;
  INConditionalOperator v5;

  -[INSearchForPhotosIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "searchTerm");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "conditionType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = INIntentSlotValueTransformFromCondition(v4);

  return v5;
}

- (void)setSearchTerms:(id)a3
{
  void *v4;
  _INPBStringList *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[INSearchForPhotosIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "searchTerm");
  v5 = (_INPBStringList *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v5 = objc_alloc_init(_INPBStringList);
    -[INSearchForPhotosIntent _typedBackingStore](self, "_typedBackingStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSearchTerm:", v5);

  }
  INIntentSlotValueTransformToStrings(v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBStringList setDataStrings:](v5, "setDataStrings:", v7);

}

- (INPhotoAttributeOptions)includedAttributes
{
  void *v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  INPhotoAttributeOptions v8;

  v8 = 0;
  -[INSearchForPhotosIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "includedAttributesCount");

  if (!v4)
    return 0;
  for (i = 0; i != v4; ++i)
  {
    -[INSearchForPhotosIntent _typedBackingStore](self, "_typedBackingStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    INPhotoAttributeOptionsAddBackingType((uint64_t *)&v8, objc_msgSend(v6, "includedAttributeAtIndex:", i));

  }
  return v8;
}

- (void)setIncludedAttributes:(unint64_t)a3
{
  void *v5;
  _QWORD v6[5];

  -[INSearchForPhotosIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clearIncludedAttributes");

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__INSearchForPhotosIntent_setIncludedAttributes___block_invoke;
  v6[3] = &unk_1E2295130;
  v6[4] = self;
  INPhotoAttributeOptionsEnumerateBackingTypes(a3, v6);
}

- (INPhotoAttributeOptions)excludedAttributes
{
  void *v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  INPhotoAttributeOptions v8;

  v8 = 0;
  -[INSearchForPhotosIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "excludedAttributesCount");

  if (!v4)
    return 0;
  for (i = 0; i != v4; ++i)
  {
    -[INSearchForPhotosIntent _typedBackingStore](self, "_typedBackingStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    INPhotoAttributeOptionsAddBackingType((uint64_t *)&v8, objc_msgSend(v6, "excludedAttributeAtIndex:", i));

  }
  return v8;
}

- (void)setExcludedAttributes:(unint64_t)a3
{
  void *v5;
  _QWORD v6[5];

  -[INSearchForPhotosIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clearExcludedAttributes");

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__INSearchForPhotosIntent_setExcludedAttributes___block_invoke;
  v6[3] = &unk_1E2295130;
  v6[4] = self;
  INPhotoAttributeOptionsEnumerateBackingTypes(a3, v6);
}

- (NSArray)peopleInPhoto
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[INSearchForPhotosIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "peopleInPhoto");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "contacts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromContacts(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (INConditionalOperator)peopleInPhotoOperator
{
  void *v2;
  void *v3;
  void *v4;
  INConditionalOperator v5;

  -[INSearchForPhotosIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "peopleInPhoto");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "condition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = INIntentSlotValueTransformFromCondition(v4);

  return v5;
}

- (void)setPeopleInPhoto:(id)a3
{
  void *v4;
  _INPBContactList *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[INSearchForPhotosIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "peopleInPhoto");
  v5 = (_INPBContactList *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v5 = objc_alloc_init(_INPBContactList);
    -[INSearchForPhotosIntent _typedBackingStore](self, "_typedBackingStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPeopleInPhoto:", v5);

  }
  INIntentSlotValueTransformToContacts(v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBContactList setContacts:](v5, "setContacts:", v7);

}

- (NSArray)events
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[INSearchForPhotosIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "events");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "events");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromEvents(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (int64_t)eventsOperator
{
  void *v2;
  void *v3;
  void *v4;
  int64_t v5;

  -[INSearchForPhotosIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "events");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "condition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = INIntentSlotValueTransformFromCondition(v4);

  return v5;
}

- (void)setEvents:(id)a3
{
  void *v4;
  _INPBEventList *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[INSearchForPhotosIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "events");
  v5 = (_INPBEventList *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v5 = objc_alloc_init(_INPBEventList);
    -[INSearchForPhotosIntent _typedBackingStore](self, "_typedBackingStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setEvents:", v5);

  }
  INIntentSlotValueTransformToEvents(v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBEventList setEvents:](v5, "setEvents:", v7);

}

- (NSArray)places
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[INSearchForPhotosIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "places");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "places");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromPlaces(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (int64_t)placesOperator
{
  void *v2;
  void *v3;
  void *v4;
  int64_t v5;

  -[INSearchForPhotosIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "places");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "condition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = INIntentSlotValueTransformFromCondition(v4);

  return v5;
}

- (void)setPlaces:(id)a3
{
  void *v4;
  _INPBPlaceList *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[INSearchForPhotosIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "places");
  v5 = (_INPBPlaceList *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v5 = objc_alloc_init(_INPBPlaceList);
    -[INSearchForPhotosIntent _typedBackingStore](self, "_typedBackingStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPlaces:", v5);

  }
  INIntentSlotValueTransformToPlaces(v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBPlaceList setPlaces:](v5, "setPlaces:", v7);

}

- (NSArray)activities
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[INSearchForPhotosIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "activities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromActivities(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (int64_t)activitiesOperator
{
  void *v2;
  void *v3;
  void *v4;
  int64_t v5;

  -[INSearchForPhotosIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "condition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = INIntentSlotValueTransformFromCondition(v4);

  return v5;
}

- (void)setActivities:(id)a3
{
  void *v4;
  _INPBActivityList *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[INSearchForPhotosIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activities");
  v5 = (_INPBActivityList *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v5 = objc_alloc_init(_INPBActivityList);
    -[INSearchForPhotosIntent _typedBackingStore](self, "_typedBackingStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setActivities:", v5);

  }
  INIntentSlotValueTransformToActivities(v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBActivityList setActivities:](v5, "setActivities:", v7);

}

- (NSArray)geographicalFeatures
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[INSearchForPhotosIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "geographicalFeatures");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "geographicalFeatures");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromGeographicalFeatures(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (int64_t)geographicalFeaturesOperator
{
  void *v2;
  void *v3;
  void *v4;
  int64_t v5;

  -[INSearchForPhotosIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "geographicalFeatures");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "condition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = INIntentSlotValueTransformFromCondition(v4);

  return v5;
}

- (void)setGeographicalFeatures:(id)a3
{
  void *v4;
  _INPBGeographicalFeatureList *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[INSearchForPhotosIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "geographicalFeatures");
  v5 = (_INPBGeographicalFeatureList *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v5 = objc_alloc_init(_INPBGeographicalFeatureList);
    -[INSearchForPhotosIntent _typedBackingStore](self, "_typedBackingStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setGeographicalFeatures:", v5);

  }
  INIntentSlotValueTransformToGeographicalFeatures(v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBGeographicalFeatureList setGeographicalFeatures:](v5, "setGeographicalFeatures:", v7);

}

- (NSString)memoryName
{
  void *v2;
  void *v3;
  void *v4;

  -[INSearchForPhotosIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "memoryName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setMemoryName:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INSearchForPhotosIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToString(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setMemoryName:", v5);
}

- (id)_dictionaryRepresentation
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[7];
  _QWORD v25[9];

  v25[7] = *MEMORY[0x1E0C80C00];
  v24[0] = CFSTR("dateCreated");
  -[INSearchForPhotosIntent dateCreated](self, "dateCreated");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v22 = (void *)v3;
  v25[0] = v3;
  v24[1] = CFSTR("locationCreated");
  -[INSearchForPhotosIntent locationCreated](self, "locationCreated");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v21 = (void *)v5;
  v25[1] = v5;
  v24[2] = CFSTR("albumName");
  -[INSearchForPhotosIntent albumName](self, "albumName");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v20 = (void *)v7;
  v25[2] = v7;
  v24[3] = CFSTR("searchTerms");
  -[INSearchForPhotosIntent searchTerms](self, "searchTerms");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v19 = (void *)v9;
  v25[3] = v9;
  v24[4] = CFSTR("includedAttributes");
  INPhotoAttributeOptionsGetNames(-[INSearchForPhotosIntent includedAttributes](self, "includedAttributes"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v23 = v4;
  v25[4] = v12;
  v24[5] = CFSTR("excludedAttributes");
  INPhotoAttributeOptionsGetNames(-[INSearchForPhotosIntent excludedAttributes](self, "excludedAttributes"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[5] = v14;
  v24[6] = CFSTR("peopleInPhoto");
  -[INSearchForPhotosIntent peopleInPhoto](self, "peopleInPhoto");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[6] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)

  if (!v13)
  if (!v11)

  if (!v10)
  if (!v8)

  if (!v6)
  if (!v23)

  return v17;
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v6 = a4;
  -[INSearchForPhotosIntent _typedBackingStore](self, "_typedBackingStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v6;
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v7, "dateCreated");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueRedactedDateTimeRangeFromDateTimeRange(v9, a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDateCreated:", v10);

  objc_msgSend(v7, "locationCreated");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueRedactedLocationFromLocation(v11, a3, v21);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLocationCreated:", v12);

  objc_msgSend(v7, "albumName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueRedactedStringFromString(v13, a3, v21);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAlbumName:", v14);

  objc_msgSend(v8, "searchTerm");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dataStrings");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueRedactedStringsFromStrings(v16, a3, v21);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setDataStrings:", v17);
  objc_msgSend(v8, "peopleInPhoto");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "contacts");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueRedactedContactsFromContacts(v19, a3, v21);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "setContacts:", v20);
  -[INIntent setBackingStore:](self, "setBackingStore:", v8);

}

- (id)domain
{
  return CFSTR("Photos");
}

- (id)verb
{
  return CFSTR("SearchForPhotos");
}

void __49__INSearchForPhotosIntent_setExcludedAttributes___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_typedBackingStore");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addExcludedAttribute:", a2);

}

void __49__INSearchForPhotosIntent_setIncludedAttributes___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_typedBackingStore");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addIncludedAttribute:", a2);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
