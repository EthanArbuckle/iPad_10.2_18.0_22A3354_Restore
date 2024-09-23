@implementation MKLocalSearchRequest

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  CLLocationCoordinate2D center;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = -[NSString copy](self->_naturalLanguageQuery, "copy");
  v6 = *(void **)(v4 + 8);
  *(_QWORD *)(v4 + 8) = v5;

  *(_BYTE *)(v4 + 16) = self->_hasRegion;
  center = self->_region.center;
  *($2AEA816EAF9616B0E64737FB4BB06332 *)(v4 + 40) = self->_region.span;
  *(CLLocationCoordinate2D *)(v4 + 24) = center;
  *(_QWORD *)(v4 + 128) = self->_regionPriority;
  objc_storeStrong((id *)(v4 + 64), self->_geoCompletionItem);
  v8 = -[CLLocation copy](self->_deviceLocation, "copy");
  v9 = *(void **)(v4 + 72);
  *(_QWORD *)(v4 + 72) = v8;

  v10 = -[_MKLocalSearchMerchantParameters copy](self->_merchantParameters, "copy");
  v11 = *(void **)(v4 + 80);
  *(_QWORD *)(v4 + 80) = v10;

  v12 = -[_MKLocalSearchExternalTransitLookupParameters copy](self->_externalTransitLookupParameters, "copy");
  v13 = *(void **)(v4 + 88);
  *(_QWORD *)(v4 + 88) = v12;

  v14 = -[NSArray copy](self->_phoneNumbers, "copy");
  v15 = *(void **)(v4 + 96);
  *(_QWORD *)(v4 + 96) = v14;

  v16 = -[NSArray copy](self->_muids, "copy");
  v17 = *(void **)(v4 + 104);
  *(_QWORD *)(v4 + 104) = v16;

  *(_DWORD *)(v4 + 60) = self->_resultProviderID;
  v18 = -[NSString copy](self->_canonicalSearchString, "copy");
  v19 = *(void **)(v4 + 120);
  *(_QWORD *)(v4 + 120) = v18;

  *(_BYTE *)(v4 + 57) = self->_hasSentFeedbackForCompletion;
  v20 = -[MKPointOfInterestFilter copy](self->_pointOfInterestFilter, "copy");
  v21 = *(void **)(v4 + 144);
  *(_QWORD *)(v4 + 144) = v20;

  v22 = -[MKAddressFilter copy](self->_addressFilter, "copy");
  v23 = *(void **)(v4 + 152);
  *(_QWORD *)(v4 + 152) = v22;

  *(_QWORD *)(v4 + 136) = self->_resultTypes;
  return (id)v4;
}

- (MKLocalSearchRequest)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MKLocalSearchRequest;
  return -[MKLocalSearchRequest init](&v3, sel_init);
}

- (void)_setAllowPhoneNumberLookupUsingCellular:(BOOL)a3
{
  self->_allowPhoneNumberLookupUsingCellular = a3;
}

- (void)_setPhoneNumbers:(id)a3
{
  objc_storeStrong((id *)&self->_phoneNumbers, a3);
}

- (NSArray)_phoneNumbers
{
  return self->_phoneNumbers;
}

- (_MKLocalSearchMerchantParameters)_merchantParameters
{
  return self->_merchantParameters;
}

- (_MKLocalSearchExternalTransitLookupParameters)_externalTransitLookupParameters
{
  return self->_externalTransitLookupParameters;
}

- (BOOL)_allowPhoneNumberLookupUsingCellular
{
  return self->_allowPhoneNumberLookupUsingCellular;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addressFilter, 0);
  objc_storeStrong((id *)&self->_pointOfInterestFilter, 0);
  objc_storeStrong((id *)&self->_canonicalSearchString, 0);
  objc_storeStrong((id *)&self->_contactsDataString, 0);
  objc_storeStrong((id *)&self->_muids, 0);
  objc_storeStrong((id *)&self->_phoneNumbers, 0);
  objc_storeStrong((id *)&self->_externalTransitLookupParameters, 0);
  objc_storeStrong((id *)&self->_merchantParameters, 0);
  objc_storeStrong((id *)&self->_deviceLocation, 0);
  objc_storeStrong((id *)&self->_geoCompletionItem, 0);
  objc_storeStrong((id *)&self->_naturalLanguageQuery, 0);
}

+ (MKLocalSearchRequest)searchRequestWithCompletion:(id)a3
{
  id v3;
  MKLocalSearchRequest *v4;

  v3 = a3;
  v4 = -[MKLocalSearchRequest initWithCompletion:]([MKLocalSearchRequest alloc], "initWithCompletion:", v3);

  return v4;
}

- (MKLocalSearchRequest)initWithCompletion:(MKLocalSearchCompletion *)completion
{
  MKLocalSearchCompletion *v4;
  MKLocalSearchRequest *v5;
  void *v6;
  uint64_t v7;
  GEOCompletionItem *geoCompletionItem;
  MKLocalSearchRequest *v9;
  objc_super v11;

  v4 = completion;
  v11.receiver = self;
  v11.super_class = (Class)MKLocalSearchRequest;
  v5 = -[MKLocalSearchRequest init](&v11, sel_init);
  if (v5)
  {
    -[MKLocalSearchCompletion queryLine](v4, "queryLine");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKLocalSearchRequest setNaturalLanguageQuery:](v5, "setNaturalLanguageQuery:", v6);

    -[MKLocalSearchCompletion geoCompletionItem](v4, "geoCompletionItem");
    v7 = objc_claimAutoreleasedReturnValue();
    geoCompletionItem = v5->_geoCompletionItem;
    v5->_geoCompletionItem = (GEOCompletionItem *)v7;

    v5->_hasSentFeedbackForCompletion = -[MKLocalSearchCompletion _alreadySentFeedback](v4, "_alreadySentFeedback");
    v9 = v5;
  }

  return v5;
}

- (MKLocalSearchRequest)initWithNaturalLanguageQuery:(NSString *)naturalLanguageQuery
{
  NSString *v4;
  MKLocalSearchRequest *v5;
  MKLocalSearchRequest *v6;
  MKLocalSearchRequest *v7;

  v4 = naturalLanguageQuery;
  v5 = -[MKLocalSearchRequest init](self, "init");
  v6 = v5;
  if (v5)
  {
    -[MKLocalSearchRequest setNaturalLanguageQuery:](v5, "setNaturalLanguageQuery:", v4);
    v7 = v6;
  }

  return v6;
}

- (MKLocalSearchRequest)initWithNaturalLanguageQuery:(NSString *)naturalLanguageQuery region:(MKCoordinateRegion)region
{
  double longitudeDelta;
  double latitudeDelta;
  double longitude;
  double latitude;
  NSString *v9;
  MKLocalSearchRequest *v10;
  MKLocalSearchRequest *v11;
  MKLocalSearchRequest *v12;

  longitudeDelta = region.span.longitudeDelta;
  latitudeDelta = region.span.latitudeDelta;
  longitude = region.center.longitude;
  latitude = region.center.latitude;
  v9 = naturalLanguageQuery;
  v10 = -[MKLocalSearchRequest init](self, "init");
  v11 = v10;
  if (v10)
  {
    -[MKLocalSearchRequest setNaturalLanguageQuery:](v10, "setNaturalLanguageQuery:", v9);
    -[MKLocalSearchRequest setRegion:](v11, "setRegion:", latitude, longitude, latitudeDelta, longitudeDelta);
    v12 = v11;
  }

  return v11;
}

- (MKLocalSearchRequest)initWithMapsURL:(id)a3
{
  id v5;
  MKLocalSearchRequest *v6;
  _MKURLParser *v7;
  NSObject *p_super;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  MKLocalSearchRequest *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  const char *v20;
  void *v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = -[MKLocalSearchRequest init](self, "init");
  if (v6)
  {
    if (!v5)
    {
      GEOFindOrCreateLog();
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v24 = v15;
        _os_log_impl(&dword_18B0B0000, p_super, OS_LOG_TYPE_ERROR, "%{public}@ called with nil for a URL", buf, 0xCu);

      }
      goto LABEL_19;
    }
    v7 = -[_MKURLParser initWithURL:]([_MKURLParser alloc], "initWithURL:", v5);
    if (!v7)
    {
      GEOFindOrCreateLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v24 = v17;
        v25 = 2114;
        v26 = v5;
        _os_log_impl(&dword_18B0B0000, v16, OS_LOG_TYPE_ERROR, "%{public}@ could not build a parser for %{public}@", buf, 0x16u);

      }
      p_super = 0;
      goto LABEL_19;
    }
    p_super = &v7->super;
    if (-[_MKURLParser parseIncludingCustomParameters:](v7, "parseIncludingCustomParameters:", 0))
    {
      v9 = -[NSObject searchUID](p_super, "searchUID");
      v10 = -[NSObject searchProviderID](p_super, "searchProviderID");
      if (v9)
      {
        v11 = v10;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v12;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[MKLocalSearchRequest _setMuids:](v6, "_setMuids:", v13);

        -[MKLocalSearchRequest _setResultProviderID:](v6, "_setResultProviderID:", v11);
        v14 = v6;
LABEL_20:

        goto LABEL_21;
      }
      GEOFindOrCreateLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        goto LABEL_18;
      NSStringFromSelector(a2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v24 = v19;
      v25 = 2114;
      v26 = v5;
      v20 = "%{public}@ could not find a muid in %{public}@";
    }
    else
    {
      GEOFindOrCreateLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
LABEL_18:

LABEL_19:
        v14 = 0;
        goto LABEL_20;
      }
      NSStringFromSelector(a2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v24 = v19;
      v25 = 2114;
      v26 = v5;
      v20 = "%{public}@ failed parsing %{public}@";
    }
    _os_log_impl(&dword_18B0B0000, v18, OS_LOG_TYPE_ERROR, v20, buf, 0x16u);

    goto LABEL_18;
  }
  v14 = 0;
LABEL_21:

  return v14;
}

- (id)_dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *naturalLanguageQuery;
  double latitudeDelta;
  double longitudeDelta;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  GEOCompletionItem *geoCompletionItem;
  CLLocation *deviceLocation;
  _MKLocalSearchMerchantParameters *merchantParameters;
  _MKLocalSearchExternalTransitLookupParameters *externalTransitLookupParameters;
  NSArray *phoneNumbers;
  NSArray *muids;
  void *v18;
  NSString *canonicalSearchString;
  void *v20;
  MKPointOfInterestFilter *pointOfInterestFilter;
  MKAddressFilter *addressFilter;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  naturalLanguageQuery = self->_naturalLanguageQuery;
  if (naturalLanguageQuery)
    objc_msgSend(v3, "setObject:forKey:", naturalLanguageQuery, CFSTR("naturalLanguageQuery"));
  if (self->_hasRegion)
  {
    latitudeDelta = self->_region.span.latitudeDelta;
    longitudeDelta = self->_region.span.longitudeDelta;
    v8 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%+.8f, %+.8f"), *(_QWORD *)&self->_region.center.latitude, *(_QWORD *)&self->_region.center.longitude);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("<center:%@ span:%+.8f, %+.8f>"), v9, *(_QWORD *)&latitudeDelta, *(_QWORD *)&longitudeDelta);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("region"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_regionPriority);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("regionPriority"));

  }
  geoCompletionItem = self->_geoCompletionItem;
  if (geoCompletionItem)
    objc_msgSend(v4, "setObject:forKey:", geoCompletionItem, CFSTR("completionItem"));
  deviceLocation = self->_deviceLocation;
  if (deviceLocation)
    objc_msgSend(v4, "setObject:forKey:", deviceLocation, CFSTR("deviceLocation"));
  merchantParameters = self->_merchantParameters;
  if (merchantParameters)
    objc_msgSend(v4, "setObject:forKey:", merchantParameters, CFSTR("merchantParameters"));
  externalTransitLookupParameters = self->_externalTransitLookupParameters;
  if (externalTransitLookupParameters)
    objc_msgSend(v4, "setObject:forKey:", externalTransitLookupParameters, CFSTR("externalTransitLookupParameters"));
  phoneNumbers = self->_phoneNumbers;
  if (phoneNumbers)
    objc_msgSend(v4, "setObject:forKey:", phoneNumbers, CFSTR("phoneNumbers"));
  muids = self->_muids;
  if (muids)
    objc_msgSend(v4, "setObject:forKey:", muids, CFSTR("muids"));
  if (self->_resultProviderID)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("resultProviderID"));

  }
  canonicalSearchString = self->_canonicalSearchString;
  if (canonicalSearchString)
    objc_msgSend(v4, "setObject:forKey:", canonicalSearchString, CFSTR("canonicalSearchString"));
  if (self->_resultTypes)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("resultTypes"));

  }
  pointOfInterestFilter = self->_pointOfInterestFilter;
  if (pointOfInterestFilter)
    objc_msgSend(v4, "setObject:forKey:", pointOfInterestFilter, CFSTR("pointOfInterestFilter"));
  addressFilter = self->_addressFilter;
  if (addressFilter)
    objc_msgSend(v4, "setObject:forKey:", addressFilter, CFSTR("addressFilter"));
  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)MKLocalSearchRequest;
  -[MKLocalSearchRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKLocalSearchRequest _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setRegion:(MKCoordinateRegion)region
{
  self->_region = ($81FBFA6FC28C00D72B6EC59C78D6FC53)region;
  self->_hasRegion = 1;
}

- (void)_setContactsDataString:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[NSString isEqualToString:](self->_contactsDataString, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_contactsDataString, a3);
    +[MKMapItem _fillOutRequest:withMapsDataString:](MKMapItem, "_fillOutRequest:withMapsDataString:", self, self->_contactsDataString);
  }

}

- (NSString)naturalLanguageQuery
{
  return self->_naturalLanguageQuery;
}

- (void)setNaturalLanguageQuery:(NSString *)naturalLanguageQuery
{
  objc_setProperty_nonatomic_copy(self, a2, naturalLanguageQuery, 8);
}

- (MKCoordinateRegion)region
{
  double latitude;
  double longitude;
  double latitudeDelta;
  double longitudeDelta;
  MKCoordinateRegion result;

  latitude = self->_region.center.latitude;
  longitude = self->_region.center.longitude;
  latitudeDelta = self->_region.span.latitudeDelta;
  longitudeDelta = self->_region.span.longitudeDelta;
  result.span.longitudeDelta = longitudeDelta;
  result.span.latitudeDelta = latitudeDelta;
  result.center.longitude = longitude;
  result.center.latitude = latitude;
  return result;
}

- (BOOL)_hasRegion
{
  return self->_hasRegion;
}

- (GEOCompletionItem)geoCompletionItem
{
  return self->_geoCompletionItem;
}

- (CLLocation)_deviceLocation
{
  return self->_deviceLocation;
}

- (void)_setDeviceLocation:(id)a3
{
  objc_storeStrong((id *)&self->_deviceLocation, a3);
}

- (void)_setMerchantParameters:(id)a3
{
  objc_storeStrong((id *)&self->_merchantParameters, a3);
}

- (void)_setExternalTransitLookupParameters:(id)a3
{
  objc_storeStrong((id *)&self->_externalTransitLookupParameters, a3);
}

- (NSArray)_muids
{
  return self->_muids;
}

- (void)_setMuids:(id)a3
{
  objc_storeStrong((id *)&self->_muids, a3);
}

- (int)_resultProviderID
{
  return self->_resultProviderID;
}

- (void)_setResultProviderID:(int)a3
{
  self->_resultProviderID = a3;
}

- (NSString)_contactsDataString
{
  return self->_contactsDataString;
}

- (NSString)_canonicalSearchString
{
  return self->_canonicalSearchString;
}

- (void)_setCanonicalSearchString:(id)a3
{
  objc_storeStrong((id *)&self->_canonicalSearchString, a3);
}

- (BOOL)hasSentFeedbackForCompletion
{
  return self->_hasSentFeedbackForCompletion;
}

- (void)setHasSentFeedbackForCompletion:(BOOL)a3
{
  self->_hasSentFeedbackForCompletion = a3;
}

- (int64_t)regionPriority
{
  return self->_regionPriority;
}

- (void)setRegionPriority:(int64_t)a3
{
  self->_regionPriority = a3;
}

- (MKLocalSearchResultType)resultTypes
{
  return self->_resultTypes;
}

- (void)setResultTypes:(MKLocalSearchResultType)resultTypes
{
  self->_resultTypes = resultTypes;
}

- (MKPointOfInterestFilter)pointOfInterestFilter
{
  return self->_pointOfInterestFilter;
}

- (void)setPointOfInterestFilter:(MKPointOfInterestFilter *)pointOfInterestFilter
{
  objc_setProperty_nonatomic_copy(self, a2, pointOfInterestFilter, 144);
}

- (MKAddressFilter)addressFilter
{
  return self->_addressFilter;
}

- (void)setAddressFilter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

@end
