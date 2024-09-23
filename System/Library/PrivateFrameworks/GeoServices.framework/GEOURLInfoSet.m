@implementation GEOURLInfoSet

void __49__GEOURLInfoSet_Extras__alternateResourcesNSURLs__block_invoke(uint64_t a1, void *a2, unint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "count") > a3)
  {
    v7 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URLWithString:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      goto LABEL_4;
  }
  objc_msgSend(v10, "nsURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
LABEL_4:
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "removeAllObjects");
    *a4 = 1;
  }

}

- (GEOURLInfo)polyLocationShiftURL
{
  -[GEOURLInfoSet _readPolyLocationShiftURL]((uint64_t)self);
  return self->_polyLocationShiftURL;
}

- (void)_readPolyLocationShiftURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 492) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPolyLocationShiftURL_tags_1336);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (GEOURLInfo)dispatcherURL
{
  -[GEOURLInfoSet _readDispatcherURL]((uint64_t)self);
  return self->_dispatcherURL;
}

- (void)_readDispatcherURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 490) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDispatcherURL_tags_1342);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (GEOURLInfoSet)init
{
  GEOURLInfoSet *v2;
  GEOURLInfoSet *v3;
  GEOURLInfoSet *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOURLInfoSet;
  v2 = -[GEOURLInfoSet init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (NSArray)alternateResourcesNSURLs
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  NSArray *v9;
  _QWORD v11[4];
  id v12;
  id v13;

  _getValue(GeoServicesConfig_AlternateResourceURLs, (uint64_t)off_1EDF4CC48, 1, 0, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[GEOURLInfoSet alternateResourcesURLsCount](self, "alternateResourcesURLsCount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOURLInfoSet alternateResourcesURLs](self, "alternateResourcesURLs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __49__GEOURLInfoSet_Extras__alternateResourcesNSURLs__block_invoke;
  v11[3] = &unk_1E1C11AE0;
  v12 = v3;
  v6 = v4;
  v13 = v6;
  v7 = v3;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v11);

  v8 = v13;
  v9 = (NSArray *)v6;

  return v9;
}

- (NSMutableArray)alternateResourcesURLs
{
  -[GEOURLInfoSet _readAlternateResourcesURLs]((uint64_t)self);
  return self->_alternateResourcesURLs;
}

- (unint64_t)alternateResourcesURLsCount
{
  -[GEOURLInfoSet _readAlternateResourcesURLs]((uint64_t)self);
  return -[NSMutableArray count](self->_alternateResourcesURLs, "count");
}

- (void)_readAlternateResourcesURLs
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 488) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAlternateResourcesURLs_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (NSURL)resourcesProxyURL
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (GEOAuthProxyEnabledForURLInfoSet(self)
    && (-[GEOURLInfoSet resourcesURL](self, "resourcesURL"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "useAuthProxy"),
        v3,
        v4))
  {
    GEOGetURLIgnoringManifest(39);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v6 = (void *)MEMORY[0x1E0C99E98];
      -[GEOURLInfoSet authProxyURL](self, "authProxyURL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "url");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "URLWithString:", v8);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v5 = 0;
  }
  return (NSURL *)v5;
}

- (BOOL)hasAuthProxyURL
{
  -[GEOURLInfoSet _readAuthProxyURL]((uint64_t)self);
  return self->_authProxyURL != 0;
}

- (void)_readAuthProxyURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 489) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAuthProxyURL_tags_1357);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (GEOURLInfo)resourcesURL
{
  -[GEOURLInfoSet _readResourcesURL]((uint64_t)self);
  return self->_resourcesURL;
}

- (void)_readResourcesURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 493) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readResourcesURL_tags_1328);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (GEOURLInfo)searchAttributionManifestURL
{
  -[GEOURLInfoSet _readSearchAttributionManifestURL]((uint64_t)self);
  return self->_searchAttributionManifestURL;
}

- (void)_readSearchAttributionManifestURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 494) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSearchAttributionManifestURL_tags_1329);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasDataSet
{
  return *(_DWORD *)&self->_flags & 1;
}

- (BOOL)hasSearchAttributionManifestURL
{
  -[GEOURLInfoSet _readSearchAttributionManifestURL]((uint64_t)self);
  return self->_searchAttributionManifestURL != 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  GEOURLInfo *resourcesURL;
  GEOURLInfo *searchAttributionManifestURL;
  GEOURLInfo *directionsURL;
  GEOURLInfo *etaURL;
  GEOURLInfo *batchReverseGeocoderURL;
  GEOURLInfo *simpleETAURL;
  GEOURLInfo *addressCorrectionInitURL;
  GEOURLInfo *addressCorrectionUpdateURL;
  GEOURLInfo *polyLocationShiftURL;
  GEOURLInfo *problemSubmissionURL;
  GEOURLInfo *problemStatusURL;
  GEOURLInfo *reverseGeocoderVersionsURL;
  GEOURLInfo *problemCategoriesURL;
  GEOURLInfo *announcementsURL;
  GEOURLInfo *dispatcherURL;
  GEOURLInfo *problemOptInURL;
  GEOURLInfo *abExperimentURL;
  GEOURLInfo *businessPortalBaseURL;
  GEOURLInfo *logMessageUsageURL;
  GEOURLInfo *spatialLookupURL;
  GEOURLInfo *realtimeTrafficProbeURL;
  GEOURLInfo *batchTrafficProbeURL;
  GEOURLInfo *proactiveRoutingURL;
  GEOURLInfo *logMessageUsageV3URL;
  GEOURLInfo *backgroundDispatcherURL;
  GEOURLInfo *bluePOIDispatcherURL;
  GEOURLInfo *backgroundRevGeoURL;
  GEOURLInfo *wifiConnectionQualityProbeURL;
  GEOURLInfo *muninBaseURL;
  GEOURLInfo *authProxyURL;
  GEOURLInfo *wifiQualityURL;
  GEOURLInfo *feedbackSubmissionURL;
  GEOURLInfo *feedbackLookupURL;
  GEOURLInfo *junctionImageServiceURL;
  GEOURLInfo *analyticsCohortSessionURL;
  GEOURLInfo *analyticsLongSessionURL;
  GEOURLInfo *analyticsShortSessionURL;
  GEOURLInfo *analyticsSessionlessURL;
  GEOURLInfo *webModuleBaseURL;
  GEOURLInfo *wifiQualityTileURL;
  NSMutableArray *alternateResourcesURLs;
  GEOURLInfo *tokenAuthenticationURL;
  GEOURLInfo *authenticatedClientFeatureFlagURL;
  GEOURLInfo *addressCorrectionTaggedLocationURL;
  GEOURLInfo *proactiveAppClipURL;
  GEOURLInfo *enrichmentSubmissionURL;
  GEOURLInfo *ugcLogDiscardURL;
  GEOURLInfo *batchReverseGeocoderPlaceRequestURL;
  GEOURLInfo *pressureProbeDataURL;
  GEOURLInfo *poiBusynessActivityCollectionURL;
  GEOURLInfo *rapWebBundleURL;
  GEOURLInfo *networkSelectionHarvestURL;
  GEOURLInfo *offlineDataBatchListURL;
  GEOURLInfo *offlineDataSizeURL;
  GEOURLInfo *offlineDataDownloadBaseURL;
  GEOURLInfo *bcxDispatcherURL;
  char v62;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_119;
  -[GEOURLInfoSet readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  v5 = *((_QWORD *)v4 + 61);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((v5 & 1) == 0 || self->_dataSet != *((_DWORD *)v4 + 121))
      goto LABEL_119;
  }
  else if ((v5 & 1) != 0)
  {
LABEL_119:
    v62 = 0;
    goto LABEL_120;
  }
  resourcesURL = self->_resourcesURL;
  if ((unint64_t)resourcesURL | *((_QWORD *)v4 + 48) && !-[GEOURLInfo isEqual:](resourcesURL, "isEqual:"))
    goto LABEL_119;
  searchAttributionManifestURL = self->_searchAttributionManifestURL;
  if ((unint64_t)searchAttributionManifestURL | *((_QWORD *)v4 + 50))
  {
    if (!-[GEOURLInfo isEqual:](searchAttributionManifestURL, "isEqual:"))
      goto LABEL_119;
  }
  directionsURL = self->_directionsURL;
  if ((unint64_t)directionsURL | *((_QWORD *)v4 + 23))
  {
    if (!-[GEOURLInfo isEqual:](directionsURL, "isEqual:"))
      goto LABEL_119;
  }
  etaURL = self->_etaURL;
  if ((unint64_t)etaURL | *((_QWORD *)v4 + 26))
  {
    if (!-[GEOURLInfo isEqual:](etaURL, "isEqual:"))
      goto LABEL_119;
  }
  batchReverseGeocoderURL = self->_batchReverseGeocoderURL;
  if ((unint64_t)batchReverseGeocoderURL | *((_QWORD *)v4 + 18))
  {
    if (!-[GEOURLInfo isEqual:](batchReverseGeocoderURL, "isEqual:"))
      goto LABEL_119;
  }
  simpleETAURL = self->_simpleETAURL;
  if ((unint64_t)simpleETAURL | *((_QWORD *)v4 + 51))
  {
    if (!-[GEOURLInfo isEqual:](simpleETAURL, "isEqual:"))
      goto LABEL_119;
  }
  addressCorrectionInitURL = self->_addressCorrectionInitURL;
  if ((unint64_t)addressCorrectionInitURL | *((_QWORD *)v4 + 4))
  {
    if (!-[GEOURLInfo isEqual:](addressCorrectionInitURL, "isEqual:"))
      goto LABEL_119;
  }
  addressCorrectionUpdateURL = self->_addressCorrectionUpdateURL;
  if ((unint64_t)addressCorrectionUpdateURL | *((_QWORD *)v4 + 6))
  {
    if (!-[GEOURLInfo isEqual:](addressCorrectionUpdateURL, "isEqual:"))
      goto LABEL_119;
  }
  polyLocationShiftURL = self->_polyLocationShiftURL;
  if ((unint64_t)polyLocationShiftURL | *((_QWORD *)v4 + 38))
  {
    if (!-[GEOURLInfo isEqual:](polyLocationShiftURL, "isEqual:"))
      goto LABEL_119;
  }
  problemSubmissionURL = self->_problemSubmissionURL;
  if ((unint64_t)problemSubmissionURL | *((_QWORD *)v4 + 45))
  {
    if (!-[GEOURLInfo isEqual:](problemSubmissionURL, "isEqual:"))
      goto LABEL_119;
  }
  problemStatusURL = self->_problemStatusURL;
  if ((unint64_t)problemStatusURL | *((_QWORD *)v4 + 44))
  {
    if (!-[GEOURLInfo isEqual:](problemStatusURL, "isEqual:"))
      goto LABEL_119;
  }
  reverseGeocoderVersionsURL = self->_reverseGeocoderVersionsURL;
  if ((unint64_t)reverseGeocoderVersionsURL | *((_QWORD *)v4 + 49))
  {
    if (!-[GEOURLInfo isEqual:](reverseGeocoderVersionsURL, "isEqual:"))
      goto LABEL_119;
  }
  problemCategoriesURL = self->_problemCategoriesURL;
  if ((unint64_t)problemCategoriesURL | *((_QWORD *)v4 + 42))
  {
    if (!-[GEOURLInfo isEqual:](problemCategoriesURL, "isEqual:"))
      goto LABEL_119;
  }
  announcementsURL = self->_announcementsURL;
  if ((unint64_t)announcementsURL | *((_QWORD *)v4 + 12))
  {
    if (!-[GEOURLInfo isEqual:](announcementsURL, "isEqual:"))
      goto LABEL_119;
  }
  dispatcherURL = self->_dispatcherURL;
  if ((unint64_t)dispatcherURL | *((_QWORD *)v4 + 24))
  {
    if (!-[GEOURLInfo isEqual:](dispatcherURL, "isEqual:"))
      goto LABEL_119;
  }
  problemOptInURL = self->_problemOptInURL;
  if ((unint64_t)problemOptInURL | *((_QWORD *)v4 + 43))
  {
    if (!-[GEOURLInfo isEqual:](problemOptInURL, "isEqual:"))
      goto LABEL_119;
  }
  abExperimentURL = self->_abExperimentURL;
  if ((unint64_t)abExperimentURL | *((_QWORD *)v4 + 3))
  {
    if (!-[GEOURLInfo isEqual:](abExperimentURL, "isEqual:"))
      goto LABEL_119;
  }
  businessPortalBaseURL = self->_businessPortalBaseURL;
  if ((unint64_t)businessPortalBaseURL | *((_QWORD *)v4 + 22))
  {
    if (!-[GEOURLInfo isEqual:](businessPortalBaseURL, "isEqual:"))
      goto LABEL_119;
  }
  logMessageUsageURL = self->_logMessageUsageURL;
  if ((unint64_t)logMessageUsageURL | *((_QWORD *)v4 + 30))
  {
    if (!-[GEOURLInfo isEqual:](logMessageUsageURL, "isEqual:"))
      goto LABEL_119;
  }
  spatialLookupURL = self->_spatialLookupURL;
  if ((unint64_t)spatialLookupURL | *((_QWORD *)v4 + 52))
  {
    if (!-[GEOURLInfo isEqual:](spatialLookupURL, "isEqual:"))
      goto LABEL_119;
  }
  realtimeTrafficProbeURL = self->_realtimeTrafficProbeURL;
  if ((unint64_t)realtimeTrafficProbeURL | *((_QWORD *)v4 + 47))
  {
    if (!-[GEOURLInfo isEqual:](realtimeTrafficProbeURL, "isEqual:"))
      goto LABEL_119;
  }
  batchTrafficProbeURL = self->_batchTrafficProbeURL;
  if ((unint64_t)batchTrafficProbeURL | *((_QWORD *)v4 + 19))
  {
    if (!-[GEOURLInfo isEqual:](batchTrafficProbeURL, "isEqual:"))
      goto LABEL_119;
  }
  proactiveRoutingURL = self->_proactiveRoutingURL;
  if ((unint64_t)proactiveRoutingURL | *((_QWORD *)v4 + 41))
  {
    if (!-[GEOURLInfo isEqual:](proactiveRoutingURL, "isEqual:"))
      goto LABEL_119;
  }
  logMessageUsageV3URL = self->_logMessageUsageV3URL;
  if ((unint64_t)logMessageUsageV3URL | *((_QWORD *)v4 + 31))
  {
    if (!-[GEOURLInfo isEqual:](logMessageUsageV3URL, "isEqual:"))
      goto LABEL_119;
  }
  backgroundDispatcherURL = self->_backgroundDispatcherURL;
  if ((unint64_t)backgroundDispatcherURL | *((_QWORD *)v4 + 15))
  {
    if (!-[GEOURLInfo isEqual:](backgroundDispatcherURL, "isEqual:"))
      goto LABEL_119;
  }
  bluePOIDispatcherURL = self->_bluePOIDispatcherURL;
  if ((unint64_t)bluePOIDispatcherURL | *((_QWORD *)v4 + 21))
  {
    if (!-[GEOURLInfo isEqual:](bluePOIDispatcherURL, "isEqual:"))
      goto LABEL_119;
  }
  backgroundRevGeoURL = self->_backgroundRevGeoURL;
  if ((unint64_t)backgroundRevGeoURL | *((_QWORD *)v4 + 16))
  {
    if (!-[GEOURLInfo isEqual:](backgroundRevGeoURL, "isEqual:"))
      goto LABEL_119;
  }
  wifiConnectionQualityProbeURL = self->_wifiConnectionQualityProbeURL;
  if ((unint64_t)wifiConnectionQualityProbeURL | *((_QWORD *)v4 + 56))
  {
    if (!-[GEOURLInfo isEqual:](wifiConnectionQualityProbeURL, "isEqual:"))
      goto LABEL_119;
  }
  muninBaseURL = self->_muninBaseURL;
  if ((unint64_t)muninBaseURL | *((_QWORD *)v4 + 32))
  {
    if (!-[GEOURLInfo isEqual:](muninBaseURL, "isEqual:"))
      goto LABEL_119;
  }
  authProxyURL = self->_authProxyURL;
  if ((unint64_t)authProxyURL | *((_QWORD *)v4 + 13))
  {
    if (!-[GEOURLInfo isEqual:](authProxyURL, "isEqual:"))
      goto LABEL_119;
  }
  wifiQualityURL = self->_wifiQualityURL;
  if ((unint64_t)wifiQualityURL | *((_QWORD *)v4 + 58))
  {
    if (!-[GEOURLInfo isEqual:](wifiQualityURL, "isEqual:"))
      goto LABEL_119;
  }
  feedbackSubmissionURL = self->_feedbackSubmissionURL;
  if ((unint64_t)feedbackSubmissionURL | *((_QWORD *)v4 + 28))
  {
    if (!-[GEOURLInfo isEqual:](feedbackSubmissionURL, "isEqual:"))
      goto LABEL_119;
  }
  feedbackLookupURL = self->_feedbackLookupURL;
  if ((unint64_t)feedbackLookupURL | *((_QWORD *)v4 + 27))
  {
    if (!-[GEOURLInfo isEqual:](feedbackLookupURL, "isEqual:"))
      goto LABEL_119;
  }
  junctionImageServiceURL = self->_junctionImageServiceURL;
  if ((unint64_t)junctionImageServiceURL | *((_QWORD *)v4 + 29))
  {
    if (!-[GEOURLInfo isEqual:](junctionImageServiceURL, "isEqual:"))
      goto LABEL_119;
  }
  analyticsCohortSessionURL = self->_analyticsCohortSessionURL;
  if ((unint64_t)analyticsCohortSessionURL | *((_QWORD *)v4 + 8))
  {
    if (!-[GEOURLInfo isEqual:](analyticsCohortSessionURL, "isEqual:"))
      goto LABEL_119;
  }
  analyticsLongSessionURL = self->_analyticsLongSessionURL;
  if ((unint64_t)analyticsLongSessionURL | *((_QWORD *)v4 + 9))
  {
    if (!-[GEOURLInfo isEqual:](analyticsLongSessionURL, "isEqual:"))
      goto LABEL_119;
  }
  analyticsShortSessionURL = self->_analyticsShortSessionURL;
  if ((unint64_t)analyticsShortSessionURL | *((_QWORD *)v4 + 11))
  {
    if (!-[GEOURLInfo isEqual:](analyticsShortSessionURL, "isEqual:"))
      goto LABEL_119;
  }
  analyticsSessionlessURL = self->_analyticsSessionlessURL;
  if ((unint64_t)analyticsSessionlessURL | *((_QWORD *)v4 + 10))
  {
    if (!-[GEOURLInfo isEqual:](analyticsSessionlessURL, "isEqual:"))
      goto LABEL_119;
  }
  webModuleBaseURL = self->_webModuleBaseURL;
  if ((unint64_t)webModuleBaseURL | *((_QWORD *)v4 + 55))
  {
    if (!-[GEOURLInfo isEqual:](webModuleBaseURL, "isEqual:"))
      goto LABEL_119;
  }
  wifiQualityTileURL = self->_wifiQualityTileURL;
  if ((unint64_t)wifiQualityTileURL | *((_QWORD *)v4 + 57))
  {
    if (!-[GEOURLInfo isEqual:](wifiQualityTileURL, "isEqual:"))
      goto LABEL_119;
  }
  alternateResourcesURLs = self->_alternateResourcesURLs;
  if ((unint64_t)alternateResourcesURLs | *((_QWORD *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](alternateResourcesURLs, "isEqual:"))
      goto LABEL_119;
  }
  tokenAuthenticationURL = self->_tokenAuthenticationURL;
  if ((unint64_t)tokenAuthenticationURL | *((_QWORD *)v4 + 53))
  {
    if (!-[GEOURLInfo isEqual:](tokenAuthenticationURL, "isEqual:"))
      goto LABEL_119;
  }
  authenticatedClientFeatureFlagURL = self->_authenticatedClientFeatureFlagURL;
  if ((unint64_t)authenticatedClientFeatureFlagURL | *((_QWORD *)v4 + 14))
  {
    if (!-[GEOURLInfo isEqual:](authenticatedClientFeatureFlagURL, "isEqual:"))
      goto LABEL_119;
  }
  addressCorrectionTaggedLocationURL = self->_addressCorrectionTaggedLocationURL;
  if ((unint64_t)addressCorrectionTaggedLocationURL | *((_QWORD *)v4 + 5))
  {
    if (!-[GEOURLInfo isEqual:](addressCorrectionTaggedLocationURL, "isEqual:"))
      goto LABEL_119;
  }
  proactiveAppClipURL = self->_proactiveAppClipURL;
  if ((unint64_t)proactiveAppClipURL | *((_QWORD *)v4 + 40))
  {
    if (!-[GEOURLInfo isEqual:](proactiveAppClipURL, "isEqual:"))
      goto LABEL_119;
  }
  enrichmentSubmissionURL = self->_enrichmentSubmissionURL;
  if ((unint64_t)enrichmentSubmissionURL | *((_QWORD *)v4 + 25))
  {
    if (!-[GEOURLInfo isEqual:](enrichmentSubmissionURL, "isEqual:"))
      goto LABEL_119;
  }
  ugcLogDiscardURL = self->_ugcLogDiscardURL;
  if ((unint64_t)ugcLogDiscardURL | *((_QWORD *)v4 + 54))
  {
    if (!-[GEOURLInfo isEqual:](ugcLogDiscardURL, "isEqual:"))
      goto LABEL_119;
  }
  batchReverseGeocoderPlaceRequestURL = self->_batchReverseGeocoderPlaceRequestURL;
  if ((unint64_t)batchReverseGeocoderPlaceRequestURL | *((_QWORD *)v4 + 17))
  {
    if (!-[GEOURLInfo isEqual:](batchReverseGeocoderPlaceRequestURL, "isEqual:"))
      goto LABEL_119;
  }
  pressureProbeDataURL = self->_pressureProbeDataURL;
  if ((unint64_t)pressureProbeDataURL | *((_QWORD *)v4 + 39))
  {
    if (!-[GEOURLInfo isEqual:](pressureProbeDataURL, "isEqual:"))
      goto LABEL_119;
  }
  poiBusynessActivityCollectionURL = self->_poiBusynessActivityCollectionURL;
  if ((unint64_t)poiBusynessActivityCollectionURL | *((_QWORD *)v4 + 37))
  {
    if (!-[GEOURLInfo isEqual:](poiBusynessActivityCollectionURL, "isEqual:"))
      goto LABEL_119;
  }
  rapWebBundleURL = self->_rapWebBundleURL;
  if ((unint64_t)rapWebBundleURL | *((_QWORD *)v4 + 46))
  {
    if (!-[GEOURLInfo isEqual:](rapWebBundleURL, "isEqual:"))
      goto LABEL_119;
  }
  networkSelectionHarvestURL = self->_networkSelectionHarvestURL;
  if ((unint64_t)networkSelectionHarvestURL | *((_QWORD *)v4 + 33))
  {
    if (!-[GEOURLInfo isEqual:](networkSelectionHarvestURL, "isEqual:"))
      goto LABEL_119;
  }
  offlineDataBatchListURL = self->_offlineDataBatchListURL;
  if ((unint64_t)offlineDataBatchListURL | *((_QWORD *)v4 + 34))
  {
    if (!-[GEOURLInfo isEqual:](offlineDataBatchListURL, "isEqual:"))
      goto LABEL_119;
  }
  offlineDataSizeURL = self->_offlineDataSizeURL;
  if ((unint64_t)offlineDataSizeURL | *((_QWORD *)v4 + 36))
  {
    if (!-[GEOURLInfo isEqual:](offlineDataSizeURL, "isEqual:"))
      goto LABEL_119;
  }
  offlineDataDownloadBaseURL = self->_offlineDataDownloadBaseURL;
  if ((unint64_t)offlineDataDownloadBaseURL | *((_QWORD *)v4 + 35))
  {
    if (!-[GEOURLInfo isEqual:](offlineDataDownloadBaseURL, "isEqual:"))
      goto LABEL_119;
  }
  bcxDispatcherURL = self->_bcxDispatcherURL;
  if ((unint64_t)bcxDispatcherURL | *((_QWORD *)v4 + 20))
    v62 = -[GEOURLInfo isEqual:](bcxDispatcherURL, "isEqual:");
  else
    v62 = 1;
LABEL_120:

  return v62;
}

- (void)readAll:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v7;
  int *v8;

  v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if (v3)
      v8 = (int *)&readAll__recursiveTag_1411;
    else
      v8 = (int *)&readAll__nonRecursiveTag_1412;
    GEOURLInfoSetReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOURLInfoSetCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

- (void)_addNoFlagsAlternateResourcesURL:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 56);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 56);
      *(_QWORD *)(a1 + 56) = v5;

      v4 = *(void **)(a1 + 56);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (GEOURLInfoSet)initWithData:(id)a3
{
  GEOURLInfoSet *v3;
  GEOURLInfoSet *v4;
  GEOURLInfoSet *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOURLInfoSet;
  v3 = -[GEOURLInfoSet initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (unsigned)dataSet
{
  return self->_dataSet;
}

- (void)setDataSet:(unsigned int)a3
{
  *(_QWORD *)&self->_flags |= 0x400000000000001uLL;
  self->_dataSet = a3;
}

- (void)setHasDataSet:(BOOL)a3
{
  self->_flags = ($849DB59CDEB6081B285FC803EA4BE0F6)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFFELL | a3 | 0x400000000000000);
}

- (BOOL)hasResourcesURL
{
  -[GEOURLInfoSet _readResourcesURL]((uint64_t)self);
  return self->_resourcesURL != 0;
}

- (void)setResourcesURL:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x400800000000000uLL;
  objc_storeStrong((id *)&self->_resourcesURL, a3);
}

- (void)setSearchAttributionManifestURL:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x402000000000000uLL;
  objc_storeStrong((id *)&self->_searchAttributionManifestURL, a3);
}

- (void)_readDirectionsURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 490) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDirectionsURL_tags_1330);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasDirectionsURL
{
  -[GEOURLInfoSet _readDirectionsURL]((uint64_t)self);
  return self->_directionsURL != 0;
}

- (GEOURLInfo)directionsURL
{
  -[GEOURLInfoSet _readDirectionsURL]((uint64_t)self);
  return self->_directionsURL;
}

- (void)setDirectionsURL:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x400000000400000uLL;
  objc_storeStrong((id *)&self->_directionsURL, a3);
}

- (void)_readEtaURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 491) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readEtaURL_tags_1331);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasEtaURL
{
  -[GEOURLInfoSet _readEtaURL]((uint64_t)self);
  return self->_etaURL != 0;
}

- (GEOURLInfo)etaURL
{
  -[GEOURLInfoSet _readEtaURL]((uint64_t)self);
  return self->_etaURL;
}

- (void)setEtaURL:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x400000002000000uLL;
  objc_storeStrong((id *)&self->_etaURL, a3);
}

- (void)_readBatchReverseGeocoderURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 490) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBatchReverseGeocoderURL_tags_1332);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasBatchReverseGeocoderURL
{
  -[GEOURLInfoSet _readBatchReverseGeocoderURL]((uint64_t)self);
  return self->_batchReverseGeocoderURL != 0;
}

- (GEOURLInfo)batchReverseGeocoderURL
{
  -[GEOURLInfoSet _readBatchReverseGeocoderURL]((uint64_t)self);
  return self->_batchReverseGeocoderURL;
}

- (void)setBatchReverseGeocoderURL:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x400000000020000uLL;
  objc_storeStrong((id *)&self->_batchReverseGeocoderURL, a3);
}

- (void)_readSimpleETAURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 494) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSimpleETAURL_tags_1333);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasSimpleETAURL
{
  -[GEOURLInfoSet _readSimpleETAURL]((uint64_t)self);
  return self->_simpleETAURL != 0;
}

- (GEOURLInfo)simpleETAURL
{
  -[GEOURLInfoSet _readSimpleETAURL]((uint64_t)self);
  return self->_simpleETAURL;
}

- (void)setSimpleETAURL:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x404000000000000uLL;
  objc_storeStrong((id *)&self->_simpleETAURL, a3);
}

- (void)_readAddressCorrectionInitURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 488) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAddressCorrectionInitURL_tags_1334);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasAddressCorrectionInitURL
{
  -[GEOURLInfoSet _readAddressCorrectionInitURL]((uint64_t)self);
  return self->_addressCorrectionInitURL != 0;
}

- (GEOURLInfo)addressCorrectionInitURL
{
  -[GEOURLInfoSet _readAddressCorrectionInitURL]((uint64_t)self);
  return self->_addressCorrectionInitURL;
}

- (void)setAddressCorrectionInitURL:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x400000000000008uLL;
  objc_storeStrong((id *)&self->_addressCorrectionInitURL, a3);
}

- (void)_readAddressCorrectionUpdateURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 488) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAddressCorrectionUpdateURL_tags_1335);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasAddressCorrectionUpdateURL
{
  -[GEOURLInfoSet _readAddressCorrectionUpdateURL]((uint64_t)self);
  return self->_addressCorrectionUpdateURL != 0;
}

- (GEOURLInfo)addressCorrectionUpdateURL
{
  -[GEOURLInfoSet _readAddressCorrectionUpdateURL]((uint64_t)self);
  return self->_addressCorrectionUpdateURL;
}

- (void)setAddressCorrectionUpdateURL:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x400000000000020uLL;
  objc_storeStrong((id *)&self->_addressCorrectionUpdateURL, a3);
}

- (BOOL)hasPolyLocationShiftURL
{
  -[GEOURLInfoSet _readPolyLocationShiftURL]((uint64_t)self);
  return self->_polyLocationShiftURL != 0;
}

- (void)setPolyLocationShiftURL:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x400002000000000uLL;
  objc_storeStrong((id *)&self->_polyLocationShiftURL, a3);
}

- (void)_readProblemSubmissionURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 493) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readProblemSubmissionURL_tags_1337);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasProblemSubmissionURL
{
  -[GEOURLInfoSet _readProblemSubmissionURL]((uint64_t)self);
  return self->_problemSubmissionURL != 0;
}

- (GEOURLInfo)problemSubmissionURL
{
  -[GEOURLInfoSet _readProblemSubmissionURL]((uint64_t)self);
  return self->_problemSubmissionURL;
}

- (void)setProblemSubmissionURL:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x400100000000000uLL;
  objc_storeStrong((id *)&self->_problemSubmissionURL, a3);
}

- (void)_readProblemStatusURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 493) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readProblemStatusURL_tags_1338);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasProblemStatusURL
{
  -[GEOURLInfoSet _readProblemStatusURL]((uint64_t)self);
  return self->_problemStatusURL != 0;
}

- (GEOURLInfo)problemStatusURL
{
  -[GEOURLInfoSet _readProblemStatusURL]((uint64_t)self);
  return self->_problemStatusURL;
}

- (void)setProblemStatusURL:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x400080000000000uLL;
  objc_storeStrong((id *)&self->_problemStatusURL, a3);
}

- (void)_readReverseGeocoderVersionsURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 494) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readReverseGeocoderVersionsURL_tags_1339);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasReverseGeocoderVersionsURL
{
  -[GEOURLInfoSet _readReverseGeocoderVersionsURL]((uint64_t)self);
  return self->_reverseGeocoderVersionsURL != 0;
}

- (GEOURLInfo)reverseGeocoderVersionsURL
{
  -[GEOURLInfoSet _readReverseGeocoderVersionsURL]((uint64_t)self);
  return self->_reverseGeocoderVersionsURL;
}

- (void)setReverseGeocoderVersionsURL:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x401000000000000uLL;
  objc_storeStrong((id *)&self->_reverseGeocoderVersionsURL, a3);
}

- (void)_readProblemCategoriesURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 493) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readProblemCategoriesURL_tags_1340);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasProblemCategoriesURL
{
  -[GEOURLInfoSet _readProblemCategoriesURL]((uint64_t)self);
  return self->_problemCategoriesURL != 0;
}

- (GEOURLInfo)problemCategoriesURL
{
  -[GEOURLInfoSet _readProblemCategoriesURL]((uint64_t)self);
  return self->_problemCategoriesURL;
}

- (void)setProblemCategoriesURL:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x400020000000000uLL;
  objc_storeStrong((id *)&self->_problemCategoriesURL, a3);
}

- (void)_readAnnouncementsURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 489) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAnnouncementsURL_tags_1341);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasAnnouncementsURL
{
  -[GEOURLInfoSet _readAnnouncementsURL]((uint64_t)self);
  return self->_announcementsURL != 0;
}

- (GEOURLInfo)announcementsURL
{
  -[GEOURLInfoSet _readAnnouncementsURL]((uint64_t)self);
  return self->_announcementsURL;
}

- (void)setAnnouncementsURL:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x400000000000800uLL;
  objc_storeStrong((id *)&self->_announcementsURL, a3);
}

- (BOOL)hasDispatcherURL
{
  -[GEOURLInfoSet _readDispatcherURL]((uint64_t)self);
  return self->_dispatcherURL != 0;
}

- (void)setDispatcherURL:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x400000000800000uLL;
  objc_storeStrong((id *)&self->_dispatcherURL, a3);
}

- (void)_readProblemOptInURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 493) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readProblemOptInURL_tags_1343);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasProblemOptInURL
{
  -[GEOURLInfoSet _readProblemOptInURL]((uint64_t)self);
  return self->_problemOptInURL != 0;
}

- (GEOURLInfo)problemOptInURL
{
  -[GEOURLInfoSet _readProblemOptInURL]((uint64_t)self);
  return self->_problemOptInURL;
}

- (void)setProblemOptInURL:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x400040000000000uLL;
  objc_storeStrong((id *)&self->_problemOptInURL, a3);
}

- (void)_readAbExperimentURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 488) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAbExperimentURL_tags_1344);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasAbExperimentURL
{
  -[GEOURLInfoSet _readAbExperimentURL]((uint64_t)self);
  return self->_abExperimentURL != 0;
}

- (GEOURLInfo)abExperimentURL
{
  -[GEOURLInfoSet _readAbExperimentURL]((uint64_t)self);
  return self->_abExperimentURL;
}

- (void)setAbExperimentURL:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x400000000000004uLL;
  objc_storeStrong((id *)&self->_abExperimentURL, a3);
}

- (void)_readBusinessPortalBaseURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 490) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBusinessPortalBaseURL_tags_1345);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasBusinessPortalBaseURL
{
  -[GEOURLInfoSet _readBusinessPortalBaseURL]((uint64_t)self);
  return self->_businessPortalBaseURL != 0;
}

- (GEOURLInfo)businessPortalBaseURL
{
  -[GEOURLInfoSet _readBusinessPortalBaseURL]((uint64_t)self);
  return self->_businessPortalBaseURL;
}

- (void)setBusinessPortalBaseURL:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x400000000200000uLL;
  objc_storeStrong((id *)&self->_businessPortalBaseURL, a3);
}

- (void)_readLogMessageUsageURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 491) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLogMessageUsageURL_tags_1346);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasLogMessageUsageURL
{
  -[GEOURLInfoSet _readLogMessageUsageURL]((uint64_t)self);
  return self->_logMessageUsageURL != 0;
}

- (GEOURLInfo)logMessageUsageURL
{
  -[GEOURLInfoSet _readLogMessageUsageURL]((uint64_t)self);
  return self->_logMessageUsageURL;
}

- (void)setLogMessageUsageURL:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x400000020000000uLL;
  objc_storeStrong((id *)&self->_logMessageUsageURL, a3);
}

- (void)_readSpatialLookupURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 494) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSpatialLookupURL_tags_1347);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasSpatialLookupURL
{
  -[GEOURLInfoSet _readSpatialLookupURL]((uint64_t)self);
  return self->_spatialLookupURL != 0;
}

- (GEOURLInfo)spatialLookupURL
{
  -[GEOURLInfoSet _readSpatialLookupURL]((uint64_t)self);
  return self->_spatialLookupURL;
}

- (void)setSpatialLookupURL:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x408000000000000uLL;
  objc_storeStrong((id *)&self->_spatialLookupURL, a3);
}

- (void)_readRealtimeTrafficProbeURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 493) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRealtimeTrafficProbeURL_tags_1348);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasRealtimeTrafficProbeURL
{
  -[GEOURLInfoSet _readRealtimeTrafficProbeURL]((uint64_t)self);
  return self->_realtimeTrafficProbeURL != 0;
}

- (GEOURLInfo)realtimeTrafficProbeURL
{
  -[GEOURLInfoSet _readRealtimeTrafficProbeURL]((uint64_t)self);
  return self->_realtimeTrafficProbeURL;
}

- (void)setRealtimeTrafficProbeURL:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x400400000000000uLL;
  objc_storeStrong((id *)&self->_realtimeTrafficProbeURL, a3);
}

- (void)_readBatchTrafficProbeURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 490) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBatchTrafficProbeURL_tags_1349);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasBatchTrafficProbeURL
{
  -[GEOURLInfoSet _readBatchTrafficProbeURL]((uint64_t)self);
  return self->_batchTrafficProbeURL != 0;
}

- (GEOURLInfo)batchTrafficProbeURL
{
  -[GEOURLInfoSet _readBatchTrafficProbeURL]((uint64_t)self);
  return self->_batchTrafficProbeURL;
}

- (void)setBatchTrafficProbeURL:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x400000000040000uLL;
  objc_storeStrong((id *)&self->_batchTrafficProbeURL, a3);
}

- (void)_readProactiveRoutingURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 493) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readProactiveRoutingURL_tags_1350);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasProactiveRoutingURL
{
  -[GEOURLInfoSet _readProactiveRoutingURL]((uint64_t)self);
  return self->_proactiveRoutingURL != 0;
}

- (GEOURLInfo)proactiveRoutingURL
{
  -[GEOURLInfoSet _readProactiveRoutingURL]((uint64_t)self);
  return self->_proactiveRoutingURL;
}

- (void)setProactiveRoutingURL:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x400010000000000uLL;
  objc_storeStrong((id *)&self->_proactiveRoutingURL, a3);
}

- (void)_readLogMessageUsageV3URL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 491) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLogMessageUsageV3URL_tags_1351);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasLogMessageUsageV3URL
{
  -[GEOURLInfoSet _readLogMessageUsageV3URL]((uint64_t)self);
  return self->_logMessageUsageV3URL != 0;
}

- (GEOURLInfo)logMessageUsageV3URL
{
  -[GEOURLInfoSet _readLogMessageUsageV3URL]((uint64_t)self);
  return self->_logMessageUsageV3URL;
}

- (void)setLogMessageUsageV3URL:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x400000040000000uLL;
  objc_storeStrong((id *)&self->_logMessageUsageV3URL, a3);
}

- (void)_readBackgroundDispatcherURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 489) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBackgroundDispatcherURL_tags_1352);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasBackgroundDispatcherURL
{
  -[GEOURLInfoSet _readBackgroundDispatcherURL]((uint64_t)self);
  return self->_backgroundDispatcherURL != 0;
}

- (GEOURLInfo)backgroundDispatcherURL
{
  -[GEOURLInfoSet _readBackgroundDispatcherURL]((uint64_t)self);
  return self->_backgroundDispatcherURL;
}

- (void)setBackgroundDispatcherURL:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x400000000004000uLL;
  objc_storeStrong((id *)&self->_backgroundDispatcherURL, a3);
}

- (void)_readBluePOIDispatcherURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 490) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBluePOIDispatcherURL_tags_1353);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasBluePOIDispatcherURL
{
  -[GEOURLInfoSet _readBluePOIDispatcherURL]((uint64_t)self);
  return self->_bluePOIDispatcherURL != 0;
}

- (GEOURLInfo)bluePOIDispatcherURL
{
  -[GEOURLInfoSet _readBluePOIDispatcherURL]((uint64_t)self);
  return self->_bluePOIDispatcherURL;
}

- (void)setBluePOIDispatcherURL:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x400000000100000uLL;
  objc_storeStrong((id *)&self->_bluePOIDispatcherURL, a3);
}

- (void)_readBackgroundRevGeoURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 489) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBackgroundRevGeoURL_tags_1354);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasBackgroundRevGeoURL
{
  -[GEOURLInfoSet _readBackgroundRevGeoURL]((uint64_t)self);
  return self->_backgroundRevGeoURL != 0;
}

- (GEOURLInfo)backgroundRevGeoURL
{
  -[GEOURLInfoSet _readBackgroundRevGeoURL]((uint64_t)self);
  return self->_backgroundRevGeoURL;
}

- (void)setBackgroundRevGeoURL:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x400000000008000uLL;
  objc_storeStrong((id *)&self->_backgroundRevGeoURL, a3);
}

- (void)_readWifiConnectionQualityProbeURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 494) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readWifiConnectionQualityProbeURL_tags_1355);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasWifiConnectionQualityProbeURL
{
  -[GEOURLInfoSet _readWifiConnectionQualityProbeURL]((uint64_t)self);
  return self->_wifiConnectionQualityProbeURL != 0;
}

- (GEOURLInfo)wifiConnectionQualityProbeURL
{
  -[GEOURLInfoSet _readWifiConnectionQualityProbeURL]((uint64_t)self);
  return self->_wifiConnectionQualityProbeURL;
}

- (void)setWifiConnectionQualityProbeURL:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x480000000000000uLL;
  objc_storeStrong((id *)&self->_wifiConnectionQualityProbeURL, a3);
}

- (void)_readMuninBaseURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 491) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMuninBaseURL_tags_1356);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasMuninBaseURL
{
  -[GEOURLInfoSet _readMuninBaseURL]((uint64_t)self);
  return self->_muninBaseURL != 0;
}

- (GEOURLInfo)muninBaseURL
{
  -[GEOURLInfoSet _readMuninBaseURL]((uint64_t)self);
  return self->_muninBaseURL;
}

- (void)setMuninBaseURL:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x400000080000000uLL;
  objc_storeStrong((id *)&self->_muninBaseURL, a3);
}

- (GEOURLInfo)authProxyURL
{
  -[GEOURLInfoSet _readAuthProxyURL]((uint64_t)self);
  return self->_authProxyURL;
}

- (void)setAuthProxyURL:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x400000000001000uLL;
  objc_storeStrong((id *)&self->_authProxyURL, a3);
}

- (void)_readWifiQualityURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 495) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readWifiQualityURL_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasWifiQualityURL
{
  -[GEOURLInfoSet _readWifiQualityURL]((uint64_t)self);
  return self->_wifiQualityURL != 0;
}

- (GEOURLInfo)wifiQualityURL
{
  -[GEOURLInfoSet _readWifiQualityURL]((uint64_t)self);
  return self->_wifiQualityURL;
}

- (void)setWifiQualityURL:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x600000000000000uLL;
  objc_storeStrong((id *)&self->_wifiQualityURL, a3);
}

- (void)_readFeedbackSubmissionURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 491) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFeedbackSubmissionURL_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasFeedbackSubmissionURL
{
  -[GEOURLInfoSet _readFeedbackSubmissionURL]((uint64_t)self);
  return self->_feedbackSubmissionURL != 0;
}

- (GEOURLInfo)feedbackSubmissionURL
{
  -[GEOURLInfoSet _readFeedbackSubmissionURL]((uint64_t)self);
  return self->_feedbackSubmissionURL;
}

- (void)setFeedbackSubmissionURL:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x400000008000000uLL;
  objc_storeStrong((id *)&self->_feedbackSubmissionURL, a3);
}

- (void)_readFeedbackLookupURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 491) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFeedbackLookupURL_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasFeedbackLookupURL
{
  -[GEOURLInfoSet _readFeedbackLookupURL]((uint64_t)self);
  return self->_feedbackLookupURL != 0;
}

- (GEOURLInfo)feedbackLookupURL
{
  -[GEOURLInfoSet _readFeedbackLookupURL]((uint64_t)self);
  return self->_feedbackLookupURL;
}

- (void)setFeedbackLookupURL:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x400000004000000uLL;
  objc_storeStrong((id *)&self->_feedbackLookupURL, a3);
}

- (void)_readJunctionImageServiceURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 491) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readJunctionImageServiceURL_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasJunctionImageServiceURL
{
  -[GEOURLInfoSet _readJunctionImageServiceURL]((uint64_t)self);
  return self->_junctionImageServiceURL != 0;
}

- (GEOURLInfo)junctionImageServiceURL
{
  -[GEOURLInfoSet _readJunctionImageServiceURL]((uint64_t)self);
  return self->_junctionImageServiceURL;
}

- (void)setJunctionImageServiceURL:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x400000010000000uLL;
  objc_storeStrong((id *)&self->_junctionImageServiceURL, a3);
}

- (void)_readAnalyticsCohortSessionURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 488) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAnalyticsCohortSessionURL_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasAnalyticsCohortSessionURL
{
  -[GEOURLInfoSet _readAnalyticsCohortSessionURL]((uint64_t)self);
  return self->_analyticsCohortSessionURL != 0;
}

- (GEOURLInfo)analyticsCohortSessionURL
{
  -[GEOURLInfoSet _readAnalyticsCohortSessionURL]((uint64_t)self);
  return self->_analyticsCohortSessionURL;
}

- (void)setAnalyticsCohortSessionURL:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x400000000000080uLL;
  objc_storeStrong((id *)&self->_analyticsCohortSessionURL, a3);
}

- (void)_readAnalyticsLongSessionURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 489) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAnalyticsLongSessionURL_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasAnalyticsLongSessionURL
{
  -[GEOURLInfoSet _readAnalyticsLongSessionURL]((uint64_t)self);
  return self->_analyticsLongSessionURL != 0;
}

- (GEOURLInfo)analyticsLongSessionURL
{
  -[GEOURLInfoSet _readAnalyticsLongSessionURL]((uint64_t)self);
  return self->_analyticsLongSessionURL;
}

- (void)setAnalyticsLongSessionURL:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x400000000000100uLL;
  objc_storeStrong((id *)&self->_analyticsLongSessionURL, a3);
}

- (void)_readAnalyticsShortSessionURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 489) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAnalyticsShortSessionURL_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasAnalyticsShortSessionURL
{
  -[GEOURLInfoSet _readAnalyticsShortSessionURL]((uint64_t)self);
  return self->_analyticsShortSessionURL != 0;
}

- (GEOURLInfo)analyticsShortSessionURL
{
  -[GEOURLInfoSet _readAnalyticsShortSessionURL]((uint64_t)self);
  return self->_analyticsShortSessionURL;
}

- (void)setAnalyticsShortSessionURL:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x400000000000400uLL;
  objc_storeStrong((id *)&self->_analyticsShortSessionURL, a3);
}

- (void)_readAnalyticsSessionlessURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 489) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAnalyticsSessionlessURL_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasAnalyticsSessionlessURL
{
  -[GEOURLInfoSet _readAnalyticsSessionlessURL]((uint64_t)self);
  return self->_analyticsSessionlessURL != 0;
}

- (GEOURLInfo)analyticsSessionlessURL
{
  -[GEOURLInfoSet _readAnalyticsSessionlessURL]((uint64_t)self);
  return self->_analyticsSessionlessURL;
}

- (void)setAnalyticsSessionlessURL:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x400000000000200uLL;
  objc_storeStrong((id *)&self->_analyticsSessionlessURL, a3);
}

- (void)_readWebModuleBaseURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 494) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readWebModuleBaseURL_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasWebModuleBaseURL
{
  -[GEOURLInfoSet _readWebModuleBaseURL]((uint64_t)self);
  return self->_webModuleBaseURL != 0;
}

- (GEOURLInfo)webModuleBaseURL
{
  -[GEOURLInfoSet _readWebModuleBaseURL]((uint64_t)self);
  return self->_webModuleBaseURL;
}

- (void)setWebModuleBaseURL:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x440000000000000uLL;
  objc_storeStrong((id *)&self->_webModuleBaseURL, a3);
}

- (void)_readWifiQualityTileURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 495) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readWifiQualityTileURL_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasWifiQualityTileURL
{
  -[GEOURLInfoSet _readWifiQualityTileURL]((uint64_t)self);
  return self->_wifiQualityTileURL != 0;
}

- (GEOURLInfo)wifiQualityTileURL
{
  -[GEOURLInfoSet _readWifiQualityTileURL]((uint64_t)self);
  return self->_wifiQualityTileURL;
}

- (void)setWifiQualityTileURL:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x500000000000000uLL;
  objc_storeStrong((id *)&self->_wifiQualityTileURL, a3);
}

- (void)setAlternateResourcesURLs:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *alternateResourcesURLs;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x40uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x400000000000000uLL;
  alternateResourcesURLs = self->_alternateResourcesURLs;
  self->_alternateResourcesURLs = v4;

}

- (void)clearAlternateResourcesURLs
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x40uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x400000000000000uLL;
  -[NSMutableArray removeAllObjects](self->_alternateResourcesURLs, "removeAllObjects");
}

- (void)addAlternateResourcesURL:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOURLInfoSet _readAlternateResourcesURLs]((uint64_t)self);
  -[GEOURLInfoSet _addNoFlagsAlternateResourcesURL:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x40uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x400000000000000uLL;
}

- (id)alternateResourcesURLAtIndex:(unint64_t)a3
{
  -[GEOURLInfoSet _readAlternateResourcesURLs]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_alternateResourcesURLs, "objectAtIndex:", a3);
}

+ (Class)alternateResourcesURLType
{
  return (Class)objc_opt_class();
}

- (void)_readTokenAuthenticationURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 494) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTokenAuthenticationURL_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasTokenAuthenticationURL
{
  -[GEOURLInfoSet _readTokenAuthenticationURL]((uint64_t)self);
  return self->_tokenAuthenticationURL != 0;
}

- (GEOURLInfo)tokenAuthenticationURL
{
  -[GEOURLInfoSet _readTokenAuthenticationURL]((uint64_t)self);
  return self->_tokenAuthenticationURL;
}

- (void)setTokenAuthenticationURL:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x410000000000000uLL;
  objc_storeStrong((id *)&self->_tokenAuthenticationURL, a3);
}

- (void)_readAuthenticatedClientFeatureFlagURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 489) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAuthenticatedClientFeatureFlagURL_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasAuthenticatedClientFeatureFlagURL
{
  -[GEOURLInfoSet _readAuthenticatedClientFeatureFlagURL]((uint64_t)self);
  return self->_authenticatedClientFeatureFlagURL != 0;
}

- (GEOURLInfo)authenticatedClientFeatureFlagURL
{
  -[GEOURLInfoSet _readAuthenticatedClientFeatureFlagURL]((uint64_t)self);
  return self->_authenticatedClientFeatureFlagURL;
}

- (void)setAuthenticatedClientFeatureFlagURL:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x400000000002000uLL;
  objc_storeStrong((id *)&self->_authenticatedClientFeatureFlagURL, a3);
}

- (void)_readAddressCorrectionTaggedLocationURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 488) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAddressCorrectionTaggedLocationURL_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasAddressCorrectionTaggedLocationURL
{
  -[GEOURLInfoSet _readAddressCorrectionTaggedLocationURL]((uint64_t)self);
  return self->_addressCorrectionTaggedLocationURL != 0;
}

- (GEOURLInfo)addressCorrectionTaggedLocationURL
{
  -[GEOURLInfoSet _readAddressCorrectionTaggedLocationURL]((uint64_t)self);
  return self->_addressCorrectionTaggedLocationURL;
}

- (void)setAddressCorrectionTaggedLocationURL:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x400000000000010uLL;
  objc_storeStrong((id *)&self->_addressCorrectionTaggedLocationURL, a3);
}

- (void)_readProactiveAppClipURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 492) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readProactiveAppClipURL_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasProactiveAppClipURL
{
  -[GEOURLInfoSet _readProactiveAppClipURL]((uint64_t)self);
  return self->_proactiveAppClipURL != 0;
}

- (GEOURLInfo)proactiveAppClipURL
{
  -[GEOURLInfoSet _readProactiveAppClipURL]((uint64_t)self);
  return self->_proactiveAppClipURL;
}

- (void)setProactiveAppClipURL:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x400008000000000uLL;
  objc_storeStrong((id *)&self->_proactiveAppClipURL, a3);
}

- (void)_readEnrichmentSubmissionURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 491) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readEnrichmentSubmissionURL_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasEnrichmentSubmissionURL
{
  -[GEOURLInfoSet _readEnrichmentSubmissionURL]((uint64_t)self);
  return self->_enrichmentSubmissionURL != 0;
}

- (GEOURLInfo)enrichmentSubmissionURL
{
  -[GEOURLInfoSet _readEnrichmentSubmissionURL]((uint64_t)self);
  return self->_enrichmentSubmissionURL;
}

- (void)setEnrichmentSubmissionURL:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x400000001000000uLL;
  objc_storeStrong((id *)&self->_enrichmentSubmissionURL, a3);
}

- (void)_readUgcLogDiscardURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 494) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readUgcLogDiscardURL_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasUgcLogDiscardURL
{
  -[GEOURLInfoSet _readUgcLogDiscardURL]((uint64_t)self);
  return self->_ugcLogDiscardURL != 0;
}

- (GEOURLInfo)ugcLogDiscardURL
{
  -[GEOURLInfoSet _readUgcLogDiscardURL]((uint64_t)self);
  return self->_ugcLogDiscardURL;
}

- (void)setUgcLogDiscardURL:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x420000000000000uLL;
  objc_storeStrong((id *)&self->_ugcLogDiscardURL, a3);
}

- (void)_readBatchReverseGeocoderPlaceRequestURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 490) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBatchReverseGeocoderPlaceRequestURL_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasBatchReverseGeocoderPlaceRequestURL
{
  -[GEOURLInfoSet _readBatchReverseGeocoderPlaceRequestURL]((uint64_t)self);
  return self->_batchReverseGeocoderPlaceRequestURL != 0;
}

- (GEOURLInfo)batchReverseGeocoderPlaceRequestURL
{
  -[GEOURLInfoSet _readBatchReverseGeocoderPlaceRequestURL]((uint64_t)self);
  return self->_batchReverseGeocoderPlaceRequestURL;
}

- (void)setBatchReverseGeocoderPlaceRequestURL:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x400000000010000uLL;
  objc_storeStrong((id *)&self->_batchReverseGeocoderPlaceRequestURL, a3);
}

- (void)_readPressureProbeDataURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 492) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPressureProbeDataURL_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasPressureProbeDataURL
{
  -[GEOURLInfoSet _readPressureProbeDataURL]((uint64_t)self);
  return self->_pressureProbeDataURL != 0;
}

- (GEOURLInfo)pressureProbeDataURL
{
  -[GEOURLInfoSet _readPressureProbeDataURL]((uint64_t)self);
  return self->_pressureProbeDataURL;
}

- (void)setPressureProbeDataURL:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x400004000000000uLL;
  objc_storeStrong((id *)&self->_pressureProbeDataURL, a3);
}

- (void)_readPoiBusynessActivityCollectionURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 492) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(_QWORD *)(a1 + 8), &_readPoiBusynessActivityCollectionURL_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasPoiBusynessActivityCollectionURL
{
  -[GEOURLInfoSet _readPoiBusynessActivityCollectionURL]((uint64_t)self);
  return self->_poiBusynessActivityCollectionURL != 0;
}

- (GEOURLInfo)poiBusynessActivityCollectionURL
{
  -[GEOURLInfoSet _readPoiBusynessActivityCollectionURL]((uint64_t)self);
  return self->_poiBusynessActivityCollectionURL;
}

- (void)setPoiBusynessActivityCollectionURL:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x400001000000000uLL;
  objc_storeStrong((id *)&self->_poiBusynessActivityCollectionURL, a3);
}

- (void)_readRapWebBundleURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 493) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRapWebBundleURL_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasRapWebBundleURL
{
  -[GEOURLInfoSet _readRapWebBundleURL]((uint64_t)self);
  return self->_rapWebBundleURL != 0;
}

- (GEOURLInfo)rapWebBundleURL
{
  -[GEOURLInfoSet _readRapWebBundleURL]((uint64_t)self);
  return self->_rapWebBundleURL;
}

- (void)setRapWebBundleURL:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x400200000000000uLL;
  objc_storeStrong((id *)&self->_rapWebBundleURL, a3);
}

- (void)_readNetworkSelectionHarvestURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 492) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readNetworkSelectionHarvestURL_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasNetworkSelectionHarvestURL
{
  -[GEOURLInfoSet _readNetworkSelectionHarvestURL]((uint64_t)self);
  return self->_networkSelectionHarvestURL != 0;
}

- (GEOURLInfo)networkSelectionHarvestURL
{
  -[GEOURLInfoSet _readNetworkSelectionHarvestURL]((uint64_t)self);
  return self->_networkSelectionHarvestURL;
}

- (void)setNetworkSelectionHarvestURL:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x400000100000000uLL;
  objc_storeStrong((id *)&self->_networkSelectionHarvestURL, a3);
}

- (void)_readOfflineDataBatchListURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 492) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOfflineDataBatchListURL_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasOfflineDataBatchListURL
{
  -[GEOURLInfoSet _readOfflineDataBatchListURL]((uint64_t)self);
  return self->_offlineDataBatchListURL != 0;
}

- (GEOURLInfo)offlineDataBatchListURL
{
  -[GEOURLInfoSet _readOfflineDataBatchListURL]((uint64_t)self);
  return self->_offlineDataBatchListURL;
}

- (void)setOfflineDataBatchListURL:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x400000200000000uLL;
  objc_storeStrong((id *)&self->_offlineDataBatchListURL, a3);
}

- (void)_readOfflineDataSizeURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 492) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOfflineDataSizeURL_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasOfflineDataSizeURL
{
  -[GEOURLInfoSet _readOfflineDataSizeURL]((uint64_t)self);
  return self->_offlineDataSizeURL != 0;
}

- (GEOURLInfo)offlineDataSizeURL
{
  -[GEOURLInfoSet _readOfflineDataSizeURL]((uint64_t)self);
  return self->_offlineDataSizeURL;
}

- (void)setOfflineDataSizeURL:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x400000800000000uLL;
  objc_storeStrong((id *)&self->_offlineDataSizeURL, a3);
}

- (void)_readOfflineDataDownloadBaseURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 492) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOfflineDataDownloadBaseURL_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasOfflineDataDownloadBaseURL
{
  -[GEOURLInfoSet _readOfflineDataDownloadBaseURL]((uint64_t)self);
  return self->_offlineDataDownloadBaseURL != 0;
}

- (GEOURLInfo)offlineDataDownloadBaseURL
{
  -[GEOURLInfoSet _readOfflineDataDownloadBaseURL]((uint64_t)self);
  return self->_offlineDataDownloadBaseURL;
}

- (void)setOfflineDataDownloadBaseURL:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x400000400000000uLL;
  objc_storeStrong((id *)&self->_offlineDataDownloadBaseURL, a3);
}

- (void)_readBcxDispatcherURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 490) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOURLInfoSetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBcxDispatcherURL_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasBcxDispatcherURL
{
  -[GEOURLInfoSet _readBcxDispatcherURL]((uint64_t)self);
  return self->_bcxDispatcherURL != 0;
}

- (GEOURLInfo)bcxDispatcherURL
{
  -[GEOURLInfoSet _readBcxDispatcherURL]((uint64_t)self);
  return self->_bcxDispatcherURL;
}

- (void)setBcxDispatcherURL:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x400000000080000uLL;
  objc_storeStrong((id *)&self->_bcxDispatcherURL, a3);
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
  v8.super_class = (Class)GEOURLInfoSet;
  -[GEOURLInfoSet description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOURLInfoSet dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOURLInfoSet _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  id v71;
  void *v72;
  void *v73;
  id v74;
  void *v75;
  void *v76;
  id v77;
  void *v78;
  void *v79;
  id v80;
  void *v81;
  void *v82;
  id v83;
  void *v84;
  void *v85;
  id v86;
  void *v87;
  void *v88;
  id v89;
  void *v90;
  void *v91;
  id v92;
  void *v93;
  void *v94;
  id v95;
  void *v96;
  void *v97;
  id v98;
  void *v99;
  void *v100;
  id v101;
  void *v102;
  void *v103;
  id v104;
  void *v105;
  void *v106;
  id v107;
  void *v108;
  void *v109;
  id v110;
  void *v111;
  void *v112;
  id v113;
  void *v114;
  void *v115;
  id v116;
  void *v117;
  void *v118;
  id v119;
  void *v120;
  void *v121;
  id v122;
  void *v123;
  void *v124;
  id v125;
  void *v126;
  id v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t i;
  void *v132;
  id v133;
  void *v134;
  void *v135;
  id v136;
  void *v137;
  void *v138;
  id v139;
  void *v140;
  void *v141;
  id v142;
  void *v143;
  void *v144;
  id v145;
  void *v146;
  void *v147;
  id v148;
  void *v149;
  void *v150;
  id v151;
  void *v152;
  void *v153;
  id v154;
  void *v155;
  void *v156;
  id v157;
  void *v158;
  void *v159;
  id v160;
  void *v161;
  void *v162;
  id v163;
  void *v164;
  void *v165;
  id v166;
  void *v167;
  void *v168;
  id v169;
  void *v170;
  void *v171;
  id v172;
  void *v173;
  void *v174;
  id v175;
  void *v176;
  void *v177;
  id v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  id v183;
  id v184;
  id v185;
  _QWORD v187[4];
  id v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  _BYTE v193[128];
  uint64_t v194;

  v194 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)(a1 + 488) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 484));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("dataSet"));

  }
  objc_msgSend((id)a1, "resourcesURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v6, "jsonRepresentation");
    else
      objc_msgSend(v6, "dictionaryRepresentation");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("resourcesURL"));
  }

  objc_msgSend((id)a1, "searchAttributionManifestURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v9, "jsonRepresentation");
    else
      objc_msgSend(v9, "dictionaryRepresentation");
    v11 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("searchAttributionManifestURL"));
  }

  objc_msgSend((id)a1, "directionsURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v12, "jsonRepresentation");
    else
      objc_msgSend(v12, "dictionaryRepresentation");
    v14 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("directionsURL"));
  }

  objc_msgSend((id)a1, "etaURL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v15, "jsonRepresentation");
    else
      objc_msgSend(v15, "dictionaryRepresentation");
    v17 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("etaURL"));
  }

  objc_msgSend((id)a1, "batchReverseGeocoderURL");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v18, "jsonRepresentation");
    else
      objc_msgSend(v18, "dictionaryRepresentation");
    v20 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("batchReverseGeocoderURL"));
  }

  objc_msgSend((id)a1, "simpleETAURL");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v21)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v21, "jsonRepresentation");
    else
      objc_msgSend(v21, "dictionaryRepresentation");
    v23 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("simpleETAURL"));
  }

  objc_msgSend((id)a1, "addressCorrectionInitURL");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v24)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v24, "jsonRepresentation");
    else
      objc_msgSend(v24, "dictionaryRepresentation");
    v26 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v26, CFSTR("addressCorrectionInitURL"));
  }

  objc_msgSend((id)a1, "addressCorrectionUpdateURL");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (v27)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v27, "jsonRepresentation");
    else
      objc_msgSend(v27, "dictionaryRepresentation");
    v29 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v29, CFSTR("addressCorrectionUpdateURL"));
  }

  objc_msgSend((id)a1, "polyLocationShiftURL");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v30;
  if (v30)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v30, "jsonRepresentation");
    else
      objc_msgSend(v30, "dictionaryRepresentation");
    v32 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v32, CFSTR("polyLocationShiftURL"));
  }

  objc_msgSend((id)a1, "problemSubmissionURL");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v33;
  if (v33)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v33, "jsonRepresentation");
    else
      objc_msgSend(v33, "dictionaryRepresentation");
    v35 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v35, CFSTR("problemSubmissionURL"));
  }

  objc_msgSend((id)a1, "problemStatusURL");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v36;
  if (v36)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v36, "jsonRepresentation");
    else
      objc_msgSend(v36, "dictionaryRepresentation");
    v38 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v38, CFSTR("problemStatusURL"));
  }

  objc_msgSend((id)a1, "reverseGeocoderVersionsURL");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v39;
  if (v39)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v39, "jsonRepresentation");
    else
      objc_msgSend(v39, "dictionaryRepresentation");
    v41 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v41, CFSTR("reverseGeocoderVersionsURL"));
  }

  objc_msgSend((id)a1, "problemCategoriesURL");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v42;
  if (v42)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v42, "jsonRepresentation");
    else
      objc_msgSend(v42, "dictionaryRepresentation");
    v44 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v44, CFSTR("problemCategoriesURL"));
  }

  objc_msgSend((id)a1, "announcementsURL");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v45;
  if (v45)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v45, "jsonRepresentation");
    else
      objc_msgSend(v45, "dictionaryRepresentation");
    v47 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v47, CFSTR("announcementsURL"));
  }

  objc_msgSend((id)a1, "dispatcherURL");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v48;
  if (v48)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v48, "jsonRepresentation");
    else
      objc_msgSend(v48, "dictionaryRepresentation");
    v50 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v50, CFSTR("dispatcherURL"));
  }

  objc_msgSend((id)a1, "problemOptInURL");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v51;
  if (v51)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v51, "jsonRepresentation");
    else
      objc_msgSend(v51, "dictionaryRepresentation");
    v53 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v53, CFSTR("problemOptInURL"));
  }

  objc_msgSend((id)a1, "abExperimentURL");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v54;
  if (v54)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v54, "jsonRepresentation");
    else
      objc_msgSend(v54, "dictionaryRepresentation");
    v56 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v56, CFSTR("abExperimentURL"));
  }

  objc_msgSend((id)a1, "businessPortalBaseURL");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = v57;
  if (v57)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v57, "jsonRepresentation");
    else
      objc_msgSend(v57, "dictionaryRepresentation");
    v59 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v59, CFSTR("businessPortalBaseURL"));
  }

  objc_msgSend((id)a1, "logMessageUsageURL");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = v60;
  if (v60)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v60, "jsonRepresentation");
    else
      objc_msgSend(v60, "dictionaryRepresentation");
    v62 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v62, CFSTR("logMessageUsageURL"));
  }

  objc_msgSend((id)a1, "spatialLookupURL");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = v63;
  if (v63)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v63, "jsonRepresentation");
    else
      objc_msgSend(v63, "dictionaryRepresentation");
    v65 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v65, CFSTR("spatialLookupURL"));
  }

  objc_msgSend((id)a1, "realtimeTrafficProbeURL");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = v66;
  if (v66)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v66, "jsonRepresentation");
    else
      objc_msgSend(v66, "dictionaryRepresentation");
    v68 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v68, CFSTR("realtimeTrafficProbeURL"));
  }

  objc_msgSend((id)a1, "batchTrafficProbeURL");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = v69;
  if (v69)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v69, "jsonRepresentation");
    else
      objc_msgSend(v69, "dictionaryRepresentation");
    v71 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v71, CFSTR("batchTrafficProbeURL"));
  }

  objc_msgSend((id)a1, "proactiveRoutingURL");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = v72;
  if (v72)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v72, "jsonRepresentation");
    else
      objc_msgSend(v72, "dictionaryRepresentation");
    v74 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v74, CFSTR("proactiveRoutingURL"));
  }

  objc_msgSend((id)a1, "logMessageUsageV3URL");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = v75;
  if (v75)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v75, "jsonRepresentation");
    else
      objc_msgSend(v75, "dictionaryRepresentation");
    v77 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v77, CFSTR("logMessageUsageV3URL"));
  }

  objc_msgSend((id)a1, "backgroundDispatcherURL");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = v78;
  if (v78)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v78, "jsonRepresentation");
    else
      objc_msgSend(v78, "dictionaryRepresentation");
    v80 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v80, CFSTR("backgroundDispatcherURL"));
  }

  objc_msgSend((id)a1, "bluePOIDispatcherURL");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = v81;
  if (v81)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v81, "jsonRepresentation");
    else
      objc_msgSend(v81, "dictionaryRepresentation");
    v83 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v83, CFSTR("bluePOIDispatcherURL"));
  }

  objc_msgSend((id)a1, "backgroundRevGeoURL");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = v84;
  if (v84)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v84, "jsonRepresentation");
    else
      objc_msgSend(v84, "dictionaryRepresentation");
    v86 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v86, CFSTR("backgroundRevGeoURL"));
  }

  objc_msgSend((id)a1, "wifiConnectionQualityProbeURL");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = v87;
  if (v87)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v87, "jsonRepresentation");
    else
      objc_msgSend(v87, "dictionaryRepresentation");
    v89 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v89, CFSTR("wifiConnectionQualityProbeURL"));
  }

  objc_msgSend((id)a1, "muninBaseURL");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = v90;
  if (v90)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v90, "jsonRepresentation");
    else
      objc_msgSend(v90, "dictionaryRepresentation");
    v92 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v92, CFSTR("muninBaseURL"));
  }

  objc_msgSend((id)a1, "authProxyURL");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = v93;
  if (v93)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v93, "jsonRepresentation");
    else
      objc_msgSend(v93, "dictionaryRepresentation");
    v95 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v95, CFSTR("authProxyURL"));
  }

  objc_msgSend((id)a1, "wifiQualityURL");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = v96;
  if (v96)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v96, "jsonRepresentation");
    else
      objc_msgSend(v96, "dictionaryRepresentation");
    v98 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v98, CFSTR("wifiQualityURL"));
  }

  objc_msgSend((id)a1, "feedbackSubmissionURL");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v100 = v99;
  if (v99)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v99, "jsonRepresentation");
    else
      objc_msgSend(v99, "dictionaryRepresentation");
    v101 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v101, CFSTR("feedbackSubmissionURL"));
  }

  objc_msgSend((id)a1, "feedbackLookupURL");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v103 = v102;
  if (v102)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v102, "jsonRepresentation");
    else
      objc_msgSend(v102, "dictionaryRepresentation");
    v104 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v104, CFSTR("feedbackLookupURL"));
  }

  objc_msgSend((id)a1, "junctionImageServiceURL");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v106 = v105;
  if (v105)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v105, "jsonRepresentation");
    else
      objc_msgSend(v105, "dictionaryRepresentation");
    v107 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v107, CFSTR("junctionImageServiceURL"));
  }

  objc_msgSend((id)a1, "analyticsCohortSessionURL");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v109 = v108;
  if (v108)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v108, "jsonRepresentation");
    else
      objc_msgSend(v108, "dictionaryRepresentation");
    v110 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v110, CFSTR("analyticsCohortSessionURL"));
  }

  objc_msgSend((id)a1, "analyticsLongSessionURL");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v112 = v111;
  if (v111)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v111, "jsonRepresentation");
    else
      objc_msgSend(v111, "dictionaryRepresentation");
    v113 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v113, CFSTR("analyticsLongSessionURL"));
  }

  objc_msgSend((id)a1, "analyticsShortSessionURL");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v115 = v114;
  if (v114)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v114, "jsonRepresentation");
    else
      objc_msgSend(v114, "dictionaryRepresentation");
    v116 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v116, CFSTR("analyticsShortSessionURL"));
  }

  objc_msgSend((id)a1, "analyticsSessionlessURL");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v118 = v117;
  if (v117)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v117, "jsonRepresentation");
    else
      objc_msgSend(v117, "dictionaryRepresentation");
    v119 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v119, CFSTR("analyticsSessionlessURL"));
  }

  objc_msgSend((id)a1, "webModuleBaseURL");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v121 = v120;
  if (v120)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v120, "jsonRepresentation");
    else
      objc_msgSend(v120, "dictionaryRepresentation");
    v122 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v122, CFSTR("webModuleBaseURL"));
  }

  objc_msgSend((id)a1, "wifiQualityTileURL");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v124 = v123;
  if (v123)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v123, "jsonRepresentation");
    else
      objc_msgSend(v123, "dictionaryRepresentation");
    v125 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v125, CFSTR("wifiQualityTileURL"));
  }

  if (objc_msgSend(*(id *)(a1 + 56), "count"))
  {
    v126 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
    v189 = 0u;
    v190 = 0u;
    v191 = 0u;
    v192 = 0u;
    v127 = *(id *)(a1 + 56);
    v128 = objc_msgSend(v127, "countByEnumeratingWithState:objects:count:", &v189, v193, 16);
    if (v128)
    {
      v129 = v128;
      v130 = *(_QWORD *)v190;
      do
      {
        for (i = 0; i != v129; ++i)
        {
          if (*(_QWORD *)v190 != v130)
            objc_enumerationMutation(v127);
          v132 = *(void **)(*((_QWORD *)&v189 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v132, "jsonRepresentation");
          else
            objc_msgSend(v132, "dictionaryRepresentation");
          v133 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v126, "addObject:", v133);
        }
        v129 = objc_msgSend(v127, "countByEnumeratingWithState:objects:count:", &v189, v193, 16);
      }
      while (v129);
    }

    objc_msgSend(v4, "setObject:forKey:", v126, CFSTR("alternateResourcesURL"));
  }
  objc_msgSend((id)a1, "tokenAuthenticationURL");
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  v135 = v134;
  if (v134)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v134, "jsonRepresentation");
    else
      objc_msgSend(v134, "dictionaryRepresentation");
    v136 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v136, CFSTR("tokenAuthenticationURL"));
  }

  objc_msgSend((id)a1, "authenticatedClientFeatureFlagURL");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  v138 = v137;
  if (v137)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v137, "jsonRepresentation");
    else
      objc_msgSend(v137, "dictionaryRepresentation");
    v139 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v139, CFSTR("authenticatedClientFeatureFlagURL"));
  }

  objc_msgSend((id)a1, "addressCorrectionTaggedLocationURL");
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  v141 = v140;
  if (v140)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v140, "jsonRepresentation");
    else
      objc_msgSend(v140, "dictionaryRepresentation");
    v142 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v142, CFSTR("addressCorrectionTaggedLocationURL"));
  }

  objc_msgSend((id)a1, "proactiveAppClipURL");
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  v144 = v143;
  if (v143)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v143, "jsonRepresentation");
    else
      objc_msgSend(v143, "dictionaryRepresentation");
    v145 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v145, CFSTR("proactiveAppClipURL"));
  }

  objc_msgSend((id)a1, "enrichmentSubmissionURL");
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  v147 = v146;
  if (v146)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v146, "jsonRepresentation");
    else
      objc_msgSend(v146, "dictionaryRepresentation");
    v148 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v148, CFSTR("enrichmentSubmissionURL"));
  }

  objc_msgSend((id)a1, "ugcLogDiscardURL");
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  v150 = v149;
  if (v149)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v149, "jsonRepresentation");
    else
      objc_msgSend(v149, "dictionaryRepresentation");
    v151 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v151, CFSTR("ugcLogDiscardURL"));
  }

  objc_msgSend((id)a1, "batchReverseGeocoderPlaceRequestURL");
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  v153 = v152;
  if (v152)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v152, "jsonRepresentation");
    else
      objc_msgSend(v152, "dictionaryRepresentation");
    v154 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v154, CFSTR("batchReverseGeocoderPlaceRequestURL"));
  }

  objc_msgSend((id)a1, "pressureProbeDataURL");
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  v156 = v155;
  if (v155)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v155, "jsonRepresentation");
    else
      objc_msgSend(v155, "dictionaryRepresentation");
    v157 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v157, CFSTR("pressureProbeDataURL"));
  }

  objc_msgSend((id)a1, "poiBusynessActivityCollectionURL");
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  v159 = v158;
  if (v158)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v158, "jsonRepresentation");
    else
      objc_msgSend(v158, "dictionaryRepresentation");
    v160 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v160, CFSTR("poiBusynessActivityCollectionURL"));
  }

  objc_msgSend((id)a1, "rapWebBundleURL");
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  v162 = v161;
  if (v161)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v161, "jsonRepresentation");
    else
      objc_msgSend(v161, "dictionaryRepresentation");
    v163 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v163, CFSTR("rapWebBundleURL"));
  }

  objc_msgSend((id)a1, "networkSelectionHarvestURL");
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  v165 = v164;
  if (v164)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v164, "jsonRepresentation");
    else
      objc_msgSend(v164, "dictionaryRepresentation");
    v166 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v166, CFSTR("networkSelectionHarvestURL"));
  }

  objc_msgSend((id)a1, "offlineDataBatchListURL");
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  v168 = v167;
  if (v167)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v167, "jsonRepresentation");
    else
      objc_msgSend(v167, "dictionaryRepresentation");
    v169 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v169, CFSTR("offlineDataBatchListURL"));
  }

  objc_msgSend((id)a1, "offlineDataSizeURL");
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  v171 = v170;
  if (v170)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v170, "jsonRepresentation");
    else
      objc_msgSend(v170, "dictionaryRepresentation");
    v172 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v172, CFSTR("offlineDataSizeURL"));
  }

  objc_msgSend((id)a1, "offlineDataDownloadBaseURL");
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  v174 = v173;
  if (v173)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v173, "jsonRepresentation");
    else
      objc_msgSend(v173, "dictionaryRepresentation");
    v175 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v175, CFSTR("offlineDataDownloadBaseURL"));
  }

  objc_msgSend((id)a1, "bcxDispatcherURL");
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  v177 = v176;
  if (v176)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v176, "jsonRepresentation");
    else
      objc_msgSend(v176, "dictionaryRepresentation");
    v178 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v178, CFSTR("bcxDispatcherURL"));
  }

  v179 = *(void **)(a1 + 16);
  if (v179)
  {
    objc_msgSend(v179, "dictionaryRepresentation");
    v180 = (void *)objc_claimAutoreleasedReturnValue();
    v181 = v180;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v180, "count"));
      v182 = (void *)objc_claimAutoreleasedReturnValue();
      v187[0] = MEMORY[0x1E0C809B0];
      v187[1] = 3221225472;
      v187[2] = __43__GEOURLInfoSet__dictionaryRepresentation___block_invoke;
      v187[3] = &unk_1E1C00600;
      v183 = v182;
      v188 = v183;
      objc_msgSend(v181, "enumerateKeysAndObjectsUsingBlock:", v187);
      v184 = v183;

      v181 = v184;
    }
    objc_msgSend(v4, "setObject:forKey:", v181, CFSTR("Unknown Fields"));

  }
  v185 = v4;

  return v185;
}

- (id)jsonRepresentation
{
  return -[GEOURLInfoSet _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __43__GEOURLInfoSet__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v8, v9);

  }
  else
  {
    objc_msgSend(v10, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v5, v8);
  }

}

- (GEOURLInfoSet)initWithDictionary:(id)a3
{
  return (GEOURLInfoSet *)-[GEOURLInfoSet _initWithDictionary:isJSON:](self, a3, 0);
}

- (id)_initWithDictionary:(char)a3 isJSON:
{
  id v5;
  void *v6;
  void *v7;
  GEOURLInfo *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  GEOURLInfo *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  GEOURLInfo *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  GEOURLInfo *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  GEOURLInfo *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  GEOURLInfo *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  GEOURLInfo *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  GEOURLInfo *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  GEOURLInfo *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  GEOURLInfo *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  GEOURLInfo *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  GEOURLInfo *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  GEOURLInfo *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  GEOURLInfo *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  GEOURLInfo *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  GEOURLInfo *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  GEOURLInfo *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  GEOURLInfo *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  GEOURLInfo *v80;
  uint64_t v81;
  void *v82;
  void *v83;
  GEOURLInfo *v84;
  uint64_t v85;
  void *v86;
  void *v87;
  GEOURLInfo *v88;
  uint64_t v89;
  void *v90;
  void *v91;
  GEOURLInfo *v92;
  uint64_t v93;
  void *v94;
  void *v95;
  GEOURLInfo *v96;
  uint64_t v97;
  void *v98;
  void *v99;
  GEOURLInfo *v100;
  uint64_t v101;
  void *v102;
  void *v103;
  GEOURLInfo *v104;
  uint64_t v105;
  void *v106;
  void *v107;
  GEOURLInfo *v108;
  uint64_t v109;
  void *v110;
  void *v111;
  GEOURLInfo *v112;
  uint64_t v113;
  void *v114;
  void *v115;
  GEOURLInfo *v116;
  uint64_t v117;
  void *v118;
  void *v119;
  GEOURLInfo *v120;
  uint64_t v121;
  void *v122;
  void *v123;
  GEOURLInfo *v124;
  uint64_t v125;
  void *v126;
  void *v127;
  GEOURLInfo *v128;
  uint64_t v129;
  void *v130;
  void *v131;
  GEOURLInfo *v132;
  uint64_t v133;
  void *v134;
  void *v135;
  GEOURLInfo *v136;
  uint64_t v137;
  void *v138;
  void *v139;
  GEOURLInfo *v140;
  uint64_t v141;
  void *v142;
  void *v143;
  GEOURLInfo *v144;
  uint64_t v145;
  void *v146;
  void *v147;
  GEOURLInfo *v148;
  uint64_t v149;
  void *v150;
  void *v151;
  GEOURLInfo *v152;
  uint64_t v153;
  void *v154;
  void *v155;
  GEOURLInfo *v156;
  uint64_t v157;
  void *v158;
  void *v159;
  GEOURLInfo *v160;
  uint64_t v161;
  void *v162;
  void *v163;
  GEOURLInfo *v164;
  uint64_t v165;
  void *v166;
  void *v167;
  id v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t i;
  uint64_t v173;
  GEOURLInfo *v174;
  uint64_t v175;
  void *v176;
  void *v177;
  GEOURLInfo *v178;
  uint64_t v179;
  void *v180;
  void *v181;
  GEOURLInfo *v182;
  uint64_t v183;
  void *v184;
  void *v185;
  GEOURLInfo *v186;
  uint64_t v187;
  void *v188;
  void *v189;
  GEOURLInfo *v190;
  uint64_t v191;
  void *v192;
  void *v193;
  GEOURLInfo *v194;
  uint64_t v195;
  void *v196;
  void *v197;
  GEOURLInfo *v198;
  uint64_t v199;
  void *v200;
  void *v201;
  GEOURLInfo *v202;
  uint64_t v203;
  void *v204;
  void *v205;
  GEOURLInfo *v206;
  uint64_t v207;
  void *v208;
  void *v209;
  GEOURLInfo *v210;
  uint64_t v211;
  void *v212;
  void *v213;
  GEOURLInfo *v214;
  uint64_t v215;
  void *v216;
  void *v217;
  GEOURLInfo *v218;
  uint64_t v219;
  void *v220;
  void *v221;
  GEOURLInfo *v222;
  uint64_t v223;
  void *v224;
  void *v225;
  GEOURLInfo *v226;
  uint64_t v227;
  void *v228;
  void *v229;
  GEOURLInfo *v230;
  uint64_t v231;
  void *v232;
  void *v233;
  GEOURLInfo *v234;
  uint64_t v235;
  void *v236;
  id v238;
  __int128 v239;
  __int128 v240;
  __int128 v241;
  __int128 v242;
  _BYTE v243[128];
  uint64_t v244;

  v244 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (id)objc_msgSend(a1, "init");

    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("dataSet"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setDataSet:", objc_msgSend(v6, "unsignedIntValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("resourcesURL"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = [GEOURLInfo alloc];
        if ((a3 & 1) != 0)
          v9 = -[GEOURLInfo initWithJSON:](v8, "initWithJSON:", v7);
        else
          v9 = -[GEOURLInfo initWithDictionary:](v8, "initWithDictionary:", v7);
        v10 = (void *)v9;
        objc_msgSend(a1, "setResourcesURL:", v9);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("searchAttributionManifestURL"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = [GEOURLInfo alloc];
        if ((a3 & 1) != 0)
          v13 = -[GEOURLInfo initWithJSON:](v12, "initWithJSON:", v11);
        else
          v13 = -[GEOURLInfo initWithDictionary:](v12, "initWithDictionary:", v11);
        v14 = (void *)v13;
        objc_msgSend(a1, "setSearchAttributionManifestURL:", v13);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("directionsURL"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v16 = [GEOURLInfo alloc];
        if ((a3 & 1) != 0)
          v17 = -[GEOURLInfo initWithJSON:](v16, "initWithJSON:", v15);
        else
          v17 = -[GEOURLInfo initWithDictionary:](v16, "initWithDictionary:", v15);
        v18 = (void *)v17;
        objc_msgSend(a1, "setDirectionsURL:", v17);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("etaURL"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v20 = [GEOURLInfo alloc];
        if ((a3 & 1) != 0)
          v21 = -[GEOURLInfo initWithJSON:](v20, "initWithJSON:", v19);
        else
          v21 = -[GEOURLInfo initWithDictionary:](v20, "initWithDictionary:", v19);
        v22 = (void *)v21;
        objc_msgSend(a1, "setEtaURL:", v21);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("batchReverseGeocoderURL"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v24 = [GEOURLInfo alloc];
        if ((a3 & 1) != 0)
          v25 = -[GEOURLInfo initWithJSON:](v24, "initWithJSON:", v23);
        else
          v25 = -[GEOURLInfo initWithDictionary:](v24, "initWithDictionary:", v23);
        v26 = (void *)v25;
        objc_msgSend(a1, "setBatchReverseGeocoderURL:", v25);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("simpleETAURL"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v28 = [GEOURLInfo alloc];
        if ((a3 & 1) != 0)
          v29 = -[GEOURLInfo initWithJSON:](v28, "initWithJSON:", v27);
        else
          v29 = -[GEOURLInfo initWithDictionary:](v28, "initWithDictionary:", v27);
        v30 = (void *)v29;
        objc_msgSend(a1, "setSimpleETAURL:", v29);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("addressCorrectionInitURL"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v32 = [GEOURLInfo alloc];
        if ((a3 & 1) != 0)
          v33 = -[GEOURLInfo initWithJSON:](v32, "initWithJSON:", v31);
        else
          v33 = -[GEOURLInfo initWithDictionary:](v32, "initWithDictionary:", v31);
        v34 = (void *)v33;
        objc_msgSend(a1, "setAddressCorrectionInitURL:", v33);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("addressCorrectionUpdateURL"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v36 = [GEOURLInfo alloc];
        if ((a3 & 1) != 0)
          v37 = -[GEOURLInfo initWithJSON:](v36, "initWithJSON:", v35);
        else
          v37 = -[GEOURLInfo initWithDictionary:](v36, "initWithDictionary:", v35);
        v38 = (void *)v37;
        objc_msgSend(a1, "setAddressCorrectionUpdateURL:", v37);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("polyLocationShiftURL"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v40 = [GEOURLInfo alloc];
        if ((a3 & 1) != 0)
          v41 = -[GEOURLInfo initWithJSON:](v40, "initWithJSON:", v39);
        else
          v41 = -[GEOURLInfo initWithDictionary:](v40, "initWithDictionary:", v39);
        v42 = (void *)v41;
        objc_msgSend(a1, "setPolyLocationShiftURL:", v41);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("problemSubmissionURL"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v44 = [GEOURLInfo alloc];
        if ((a3 & 1) != 0)
          v45 = -[GEOURLInfo initWithJSON:](v44, "initWithJSON:", v43);
        else
          v45 = -[GEOURLInfo initWithDictionary:](v44, "initWithDictionary:", v43);
        v46 = (void *)v45;
        objc_msgSend(a1, "setProblemSubmissionURL:", v45);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("problemStatusURL"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v48 = [GEOURLInfo alloc];
        if ((a3 & 1) != 0)
          v49 = -[GEOURLInfo initWithJSON:](v48, "initWithJSON:", v47);
        else
          v49 = -[GEOURLInfo initWithDictionary:](v48, "initWithDictionary:", v47);
        v50 = (void *)v49;
        objc_msgSend(a1, "setProblemStatusURL:", v49);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("reverseGeocoderVersionsURL"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v52 = [GEOURLInfo alloc];
        if ((a3 & 1) != 0)
          v53 = -[GEOURLInfo initWithJSON:](v52, "initWithJSON:", v51);
        else
          v53 = -[GEOURLInfo initWithDictionary:](v52, "initWithDictionary:", v51);
        v54 = (void *)v53;
        objc_msgSend(a1, "setReverseGeocoderVersionsURL:", v53);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("problemCategoriesURL"));
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v56 = [GEOURLInfo alloc];
        if ((a3 & 1) != 0)
          v57 = -[GEOURLInfo initWithJSON:](v56, "initWithJSON:", v55);
        else
          v57 = -[GEOURLInfo initWithDictionary:](v56, "initWithDictionary:", v55);
        v58 = (void *)v57;
        objc_msgSend(a1, "setProblemCategoriesURL:", v57);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("announcementsURL"));
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v60 = [GEOURLInfo alloc];
        if ((a3 & 1) != 0)
          v61 = -[GEOURLInfo initWithJSON:](v60, "initWithJSON:", v59);
        else
          v61 = -[GEOURLInfo initWithDictionary:](v60, "initWithDictionary:", v59);
        v62 = (void *)v61;
        objc_msgSend(a1, "setAnnouncementsURL:", v61);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("dispatcherURL"));
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v64 = [GEOURLInfo alloc];
        if ((a3 & 1) != 0)
          v65 = -[GEOURLInfo initWithJSON:](v64, "initWithJSON:", v63);
        else
          v65 = -[GEOURLInfo initWithDictionary:](v64, "initWithDictionary:", v63);
        v66 = (void *)v65;
        objc_msgSend(a1, "setDispatcherURL:", v65);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("problemOptInURL"));
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v68 = [GEOURLInfo alloc];
        if ((a3 & 1) != 0)
          v69 = -[GEOURLInfo initWithJSON:](v68, "initWithJSON:", v67);
        else
          v69 = -[GEOURLInfo initWithDictionary:](v68, "initWithDictionary:", v67);
        v70 = (void *)v69;
        objc_msgSend(a1, "setProblemOptInURL:", v69);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("abExperimentURL"));
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v72 = [GEOURLInfo alloc];
        if ((a3 & 1) != 0)
          v73 = -[GEOURLInfo initWithJSON:](v72, "initWithJSON:", v71);
        else
          v73 = -[GEOURLInfo initWithDictionary:](v72, "initWithDictionary:", v71);
        v74 = (void *)v73;
        objc_msgSend(a1, "setAbExperimentURL:", v73);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("businessPortalBaseURL"));
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v76 = [GEOURLInfo alloc];
        if ((a3 & 1) != 0)
          v77 = -[GEOURLInfo initWithJSON:](v76, "initWithJSON:", v75);
        else
          v77 = -[GEOURLInfo initWithDictionary:](v76, "initWithDictionary:", v75);
        v78 = (void *)v77;
        objc_msgSend(a1, "setBusinessPortalBaseURL:", v77);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("logMessageUsageURL"));
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v80 = [GEOURLInfo alloc];
        if ((a3 & 1) != 0)
          v81 = -[GEOURLInfo initWithJSON:](v80, "initWithJSON:", v79);
        else
          v81 = -[GEOURLInfo initWithDictionary:](v80, "initWithDictionary:", v79);
        v82 = (void *)v81;
        objc_msgSend(a1, "setLogMessageUsageURL:", v81);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("spatialLookupURL"));
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v84 = [GEOURLInfo alloc];
        if ((a3 & 1) != 0)
          v85 = -[GEOURLInfo initWithJSON:](v84, "initWithJSON:", v83);
        else
          v85 = -[GEOURLInfo initWithDictionary:](v84, "initWithDictionary:", v83);
        v86 = (void *)v85;
        objc_msgSend(a1, "setSpatialLookupURL:", v85);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("realtimeTrafficProbeURL"));
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v88 = [GEOURLInfo alloc];
        if ((a3 & 1) != 0)
          v89 = -[GEOURLInfo initWithJSON:](v88, "initWithJSON:", v87);
        else
          v89 = -[GEOURLInfo initWithDictionary:](v88, "initWithDictionary:", v87);
        v90 = (void *)v89;
        objc_msgSend(a1, "setRealtimeTrafficProbeURL:", v89);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("batchTrafficProbeURL"));
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v92 = [GEOURLInfo alloc];
        if ((a3 & 1) != 0)
          v93 = -[GEOURLInfo initWithJSON:](v92, "initWithJSON:", v91);
        else
          v93 = -[GEOURLInfo initWithDictionary:](v92, "initWithDictionary:", v91);
        v94 = (void *)v93;
        objc_msgSend(a1, "setBatchTrafficProbeURL:", v93);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("proactiveRoutingURL"));
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v96 = [GEOURLInfo alloc];
        if ((a3 & 1) != 0)
          v97 = -[GEOURLInfo initWithJSON:](v96, "initWithJSON:", v95);
        else
          v97 = -[GEOURLInfo initWithDictionary:](v96, "initWithDictionary:", v95);
        v98 = (void *)v97;
        objc_msgSend(a1, "setProactiveRoutingURL:", v97);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("logMessageUsageV3URL"));
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v100 = [GEOURLInfo alloc];
        if ((a3 & 1) != 0)
          v101 = -[GEOURLInfo initWithJSON:](v100, "initWithJSON:", v99);
        else
          v101 = -[GEOURLInfo initWithDictionary:](v100, "initWithDictionary:", v99);
        v102 = (void *)v101;
        objc_msgSend(a1, "setLogMessageUsageV3URL:", v101);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("backgroundDispatcherURL"));
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v104 = [GEOURLInfo alloc];
        if ((a3 & 1) != 0)
          v105 = -[GEOURLInfo initWithJSON:](v104, "initWithJSON:", v103);
        else
          v105 = -[GEOURLInfo initWithDictionary:](v104, "initWithDictionary:", v103);
        v106 = (void *)v105;
        objc_msgSend(a1, "setBackgroundDispatcherURL:", v105);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("bluePOIDispatcherURL"));
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v108 = [GEOURLInfo alloc];
        if ((a3 & 1) != 0)
          v109 = -[GEOURLInfo initWithJSON:](v108, "initWithJSON:", v107);
        else
          v109 = -[GEOURLInfo initWithDictionary:](v108, "initWithDictionary:", v107);
        v110 = (void *)v109;
        objc_msgSend(a1, "setBluePOIDispatcherURL:", v109);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("backgroundRevGeoURL"));
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v112 = [GEOURLInfo alloc];
        if ((a3 & 1) != 0)
          v113 = -[GEOURLInfo initWithJSON:](v112, "initWithJSON:", v111);
        else
          v113 = -[GEOURLInfo initWithDictionary:](v112, "initWithDictionary:", v111);
        v114 = (void *)v113;
        objc_msgSend(a1, "setBackgroundRevGeoURL:", v113);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("wifiConnectionQualityProbeURL"));
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v116 = [GEOURLInfo alloc];
        if ((a3 & 1) != 0)
          v117 = -[GEOURLInfo initWithJSON:](v116, "initWithJSON:", v115);
        else
          v117 = -[GEOURLInfo initWithDictionary:](v116, "initWithDictionary:", v115);
        v118 = (void *)v117;
        objc_msgSend(a1, "setWifiConnectionQualityProbeURL:", v117);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("muninBaseURL"));
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v120 = [GEOURLInfo alloc];
        if ((a3 & 1) != 0)
          v121 = -[GEOURLInfo initWithJSON:](v120, "initWithJSON:", v119);
        else
          v121 = -[GEOURLInfo initWithDictionary:](v120, "initWithDictionary:", v119);
        v122 = (void *)v121;
        objc_msgSend(a1, "setMuninBaseURL:", v121);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("authProxyURL"));
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v124 = [GEOURLInfo alloc];
        if ((a3 & 1) != 0)
          v125 = -[GEOURLInfo initWithJSON:](v124, "initWithJSON:", v123);
        else
          v125 = -[GEOURLInfo initWithDictionary:](v124, "initWithDictionary:", v123);
        v126 = (void *)v125;
        objc_msgSend(a1, "setAuthProxyURL:", v125);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("wifiQualityURL"));
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v128 = [GEOURLInfo alloc];
        if ((a3 & 1) != 0)
          v129 = -[GEOURLInfo initWithJSON:](v128, "initWithJSON:", v127);
        else
          v129 = -[GEOURLInfo initWithDictionary:](v128, "initWithDictionary:", v127);
        v130 = (void *)v129;
        objc_msgSend(a1, "setWifiQualityURL:", v129);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("feedbackSubmissionURL"));
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v132 = [GEOURLInfo alloc];
        if ((a3 & 1) != 0)
          v133 = -[GEOURLInfo initWithJSON:](v132, "initWithJSON:", v131);
        else
          v133 = -[GEOURLInfo initWithDictionary:](v132, "initWithDictionary:", v131);
        v134 = (void *)v133;
        objc_msgSend(a1, "setFeedbackSubmissionURL:", v133);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("feedbackLookupURL"));
      v135 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v136 = [GEOURLInfo alloc];
        if ((a3 & 1) != 0)
          v137 = -[GEOURLInfo initWithJSON:](v136, "initWithJSON:", v135);
        else
          v137 = -[GEOURLInfo initWithDictionary:](v136, "initWithDictionary:", v135);
        v138 = (void *)v137;
        objc_msgSend(a1, "setFeedbackLookupURL:", v137);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("junctionImageServiceURL"));
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v140 = [GEOURLInfo alloc];
        if ((a3 & 1) != 0)
          v141 = -[GEOURLInfo initWithJSON:](v140, "initWithJSON:", v139);
        else
          v141 = -[GEOURLInfo initWithDictionary:](v140, "initWithDictionary:", v139);
        v142 = (void *)v141;
        objc_msgSend(a1, "setJunctionImageServiceURL:", v141);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("analyticsCohortSessionURL"));
      v143 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v144 = [GEOURLInfo alloc];
        if ((a3 & 1) != 0)
          v145 = -[GEOURLInfo initWithJSON:](v144, "initWithJSON:", v143);
        else
          v145 = -[GEOURLInfo initWithDictionary:](v144, "initWithDictionary:", v143);
        v146 = (void *)v145;
        objc_msgSend(a1, "setAnalyticsCohortSessionURL:", v145);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("analyticsLongSessionURL"));
      v147 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v148 = [GEOURLInfo alloc];
        if ((a3 & 1) != 0)
          v149 = -[GEOURLInfo initWithJSON:](v148, "initWithJSON:", v147);
        else
          v149 = -[GEOURLInfo initWithDictionary:](v148, "initWithDictionary:", v147);
        v150 = (void *)v149;
        objc_msgSend(a1, "setAnalyticsLongSessionURL:", v149);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("analyticsShortSessionURL"));
      v151 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v152 = [GEOURLInfo alloc];
        if ((a3 & 1) != 0)
          v153 = -[GEOURLInfo initWithJSON:](v152, "initWithJSON:", v151);
        else
          v153 = -[GEOURLInfo initWithDictionary:](v152, "initWithDictionary:", v151);
        v154 = (void *)v153;
        objc_msgSend(a1, "setAnalyticsShortSessionURL:", v153);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("analyticsSessionlessURL"));
      v155 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v156 = [GEOURLInfo alloc];
        if ((a3 & 1) != 0)
          v157 = -[GEOURLInfo initWithJSON:](v156, "initWithJSON:", v155);
        else
          v157 = -[GEOURLInfo initWithDictionary:](v156, "initWithDictionary:", v155);
        v158 = (void *)v157;
        objc_msgSend(a1, "setAnalyticsSessionlessURL:", v157);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("webModuleBaseURL"));
      v159 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v160 = [GEOURLInfo alloc];
        if ((a3 & 1) != 0)
          v161 = -[GEOURLInfo initWithJSON:](v160, "initWithJSON:", v159);
        else
          v161 = -[GEOURLInfo initWithDictionary:](v160, "initWithDictionary:", v159);
        v162 = (void *)v161;
        objc_msgSend(a1, "setWebModuleBaseURL:", v161);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("wifiQualityTileURL"));
      v163 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v164 = [GEOURLInfo alloc];
        if ((a3 & 1) != 0)
          v165 = -[GEOURLInfo initWithJSON:](v164, "initWithJSON:", v163);
        else
          v165 = -[GEOURLInfo initWithDictionary:](v164, "initWithDictionary:", v163);
        v166 = (void *)v165;
        objc_msgSend(a1, "setWifiQualityTileURL:", v165);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("alternateResourcesURL"));
      v167 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v238 = v5;
        v241 = 0u;
        v242 = 0u;
        v239 = 0u;
        v240 = 0u;
        v168 = v167;
        v169 = objc_msgSend(v168, "countByEnumeratingWithState:objects:count:", &v239, v243, 16);
        if (v169)
        {
          v170 = v169;
          v171 = *(_QWORD *)v240;
          do
          {
            for (i = 0; i != v170; ++i)
            {
              if (*(_QWORD *)v240 != v171)
                objc_enumerationMutation(v168);
              v173 = *(_QWORD *)(*((_QWORD *)&v239 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v174 = [GEOURLInfo alloc];
                if ((a3 & 1) != 0)
                  v175 = -[GEOURLInfo initWithJSON:](v174, "initWithJSON:", v173);
                else
                  v175 = -[GEOURLInfo initWithDictionary:](v174, "initWithDictionary:", v173);
                v176 = (void *)v175;
                objc_msgSend(a1, "addAlternateResourcesURL:", v175);

              }
            }
            v170 = objc_msgSend(v168, "countByEnumeratingWithState:objects:count:", &v239, v243, 16);
          }
          while (v170);
        }

        v5 = v238;
      }

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("tokenAuthenticationURL"));
      v177 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v178 = [GEOURLInfo alloc];
        if ((a3 & 1) != 0)
          v179 = -[GEOURLInfo initWithJSON:](v178, "initWithJSON:", v177);
        else
          v179 = -[GEOURLInfo initWithDictionary:](v178, "initWithDictionary:", v177);
        v180 = (void *)v179;
        objc_msgSend(a1, "setTokenAuthenticationURL:", v179);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("authenticatedClientFeatureFlagURL"));
      v181 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v182 = [GEOURLInfo alloc];
        if ((a3 & 1) != 0)
          v183 = -[GEOURLInfo initWithJSON:](v182, "initWithJSON:", v181);
        else
          v183 = -[GEOURLInfo initWithDictionary:](v182, "initWithDictionary:", v181);
        v184 = (void *)v183;
        objc_msgSend(a1, "setAuthenticatedClientFeatureFlagURL:", v183);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("addressCorrectionTaggedLocationURL"));
      v185 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v186 = [GEOURLInfo alloc];
        if ((a3 & 1) != 0)
          v187 = -[GEOURLInfo initWithJSON:](v186, "initWithJSON:", v185);
        else
          v187 = -[GEOURLInfo initWithDictionary:](v186, "initWithDictionary:", v185);
        v188 = (void *)v187;
        objc_msgSend(a1, "setAddressCorrectionTaggedLocationURL:", v187);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("proactiveAppClipURL"));
      v189 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v190 = [GEOURLInfo alloc];
        if ((a3 & 1) != 0)
          v191 = -[GEOURLInfo initWithJSON:](v190, "initWithJSON:", v189);
        else
          v191 = -[GEOURLInfo initWithDictionary:](v190, "initWithDictionary:", v189);
        v192 = (void *)v191;
        objc_msgSend(a1, "setProactiveAppClipURL:", v191);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("enrichmentSubmissionURL"));
      v193 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v194 = [GEOURLInfo alloc];
        if ((a3 & 1) != 0)
          v195 = -[GEOURLInfo initWithJSON:](v194, "initWithJSON:", v193);
        else
          v195 = -[GEOURLInfo initWithDictionary:](v194, "initWithDictionary:", v193);
        v196 = (void *)v195;
        objc_msgSend(a1, "setEnrichmentSubmissionURL:", v195);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ugcLogDiscardURL"));
      v197 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v198 = [GEOURLInfo alloc];
        if ((a3 & 1) != 0)
          v199 = -[GEOURLInfo initWithJSON:](v198, "initWithJSON:", v197);
        else
          v199 = -[GEOURLInfo initWithDictionary:](v198, "initWithDictionary:", v197);
        v200 = (void *)v199;
        objc_msgSend(a1, "setUgcLogDiscardURL:", v199);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("batchReverseGeocoderPlaceRequestURL"));
      v201 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v202 = [GEOURLInfo alloc];
        if ((a3 & 1) != 0)
          v203 = -[GEOURLInfo initWithJSON:](v202, "initWithJSON:", v201);
        else
          v203 = -[GEOURLInfo initWithDictionary:](v202, "initWithDictionary:", v201);
        v204 = (void *)v203;
        objc_msgSend(a1, "setBatchReverseGeocoderPlaceRequestURL:", v203);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("pressureProbeDataURL"));
      v205 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v206 = [GEOURLInfo alloc];
        if ((a3 & 1) != 0)
          v207 = -[GEOURLInfo initWithJSON:](v206, "initWithJSON:", v205);
        else
          v207 = -[GEOURLInfo initWithDictionary:](v206, "initWithDictionary:", v205);
        v208 = (void *)v207;
        objc_msgSend(a1, "setPressureProbeDataURL:", v207);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("poiBusynessActivityCollectionURL"));
      v209 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v210 = [GEOURLInfo alloc];
        if ((a3 & 1) != 0)
          v211 = -[GEOURLInfo initWithJSON:](v210, "initWithJSON:", v209);
        else
          v211 = -[GEOURLInfo initWithDictionary:](v210, "initWithDictionary:", v209);
        v212 = (void *)v211;
        objc_msgSend(a1, "setPoiBusynessActivityCollectionURL:", v211);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("rapWebBundleURL"));
      v213 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v214 = [GEOURLInfo alloc];
        if ((a3 & 1) != 0)
          v215 = -[GEOURLInfo initWithJSON:](v214, "initWithJSON:", v213);
        else
          v215 = -[GEOURLInfo initWithDictionary:](v214, "initWithDictionary:", v213);
        v216 = (void *)v215;
        objc_msgSend(a1, "setRapWebBundleURL:", v215);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("networkSelectionHarvestURL"));
      v217 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v218 = [GEOURLInfo alloc];
        if ((a3 & 1) != 0)
          v219 = -[GEOURLInfo initWithJSON:](v218, "initWithJSON:", v217);
        else
          v219 = -[GEOURLInfo initWithDictionary:](v218, "initWithDictionary:", v217);
        v220 = (void *)v219;
        objc_msgSend(a1, "setNetworkSelectionHarvestURL:", v219);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("offlineDataBatchListURL"));
      v221 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v222 = [GEOURLInfo alloc];
        if ((a3 & 1) != 0)
          v223 = -[GEOURLInfo initWithJSON:](v222, "initWithJSON:", v221);
        else
          v223 = -[GEOURLInfo initWithDictionary:](v222, "initWithDictionary:", v221);
        v224 = (void *)v223;
        objc_msgSend(a1, "setOfflineDataBatchListURL:", v223);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("offlineDataSizeURL"));
      v225 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v226 = [GEOURLInfo alloc];
        if ((a3 & 1) != 0)
          v227 = -[GEOURLInfo initWithJSON:](v226, "initWithJSON:", v225);
        else
          v227 = -[GEOURLInfo initWithDictionary:](v226, "initWithDictionary:", v225);
        v228 = (void *)v227;
        objc_msgSend(a1, "setOfflineDataSizeURL:", v227);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("offlineDataDownloadBaseURL"));
      v229 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v230 = [GEOURLInfo alloc];
        if ((a3 & 1) != 0)
          v231 = -[GEOURLInfo initWithJSON:](v230, "initWithJSON:", v229);
        else
          v231 = -[GEOURLInfo initWithDictionary:](v230, "initWithDictionary:", v229);
        v232 = (void *)v231;
        objc_msgSend(a1, "setOfflineDataDownloadBaseURL:", v231);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("bcxDispatcherURL"));
      v233 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v234 = [GEOURLInfo alloc];
        if ((a3 & 1) != 0)
          v235 = -[GEOURLInfo initWithJSON:](v234, "initWithJSON:", v233);
        else
          v235 = -[GEOURLInfo initWithDictionary:](v234, "initWithDictionary:", v233);
        v236 = (void *)v235;
        objc_msgSend(a1, "setBcxDispatcherURL:", v235);

      }
      a1 = a1;

    }
  }

  return a1;
}

- (GEOURLInfoSet)initWithJSON:(id)a3
{
  return (GEOURLInfoSet *)-[GEOURLInfoSet _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOURLInfoSetIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOURLInfoSetReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  PBDataReader *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader
    && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_QWORD *)&self->_flags & 0x7FFFFFFFFFFFFFCLL) == 0))
  {
    v10 = self->_reader;
    objc_sync_enter(v10);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v11);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v10);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOURLInfoSet readAll:](self, "readAll:", 0);
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteUint32Field();
    if (self->_resourcesURL)
      PBDataWriterWriteSubmessage();
    if (self->_searchAttributionManifestURL)
      PBDataWriterWriteSubmessage();
    if (self->_directionsURL)
      PBDataWriterWriteSubmessage();
    if (self->_etaURL)
      PBDataWriterWriteSubmessage();
    if (self->_batchReverseGeocoderURL)
      PBDataWriterWriteSubmessage();
    if (self->_simpleETAURL)
      PBDataWriterWriteSubmessage();
    if (self->_addressCorrectionInitURL)
      PBDataWriterWriteSubmessage();
    if (self->_addressCorrectionUpdateURL)
      PBDataWriterWriteSubmessage();
    if (self->_polyLocationShiftURL)
      PBDataWriterWriteSubmessage();
    if (self->_problemSubmissionURL)
      PBDataWriterWriteSubmessage();
    if (self->_problemStatusURL)
      PBDataWriterWriteSubmessage();
    if (self->_reverseGeocoderVersionsURL)
      PBDataWriterWriteSubmessage();
    if (self->_problemCategoriesURL)
      PBDataWriterWriteSubmessage();
    if (self->_announcementsURL)
      PBDataWriterWriteSubmessage();
    if (self->_dispatcherURL)
      PBDataWriterWriteSubmessage();
    if (self->_problemOptInURL)
      PBDataWriterWriteSubmessage();
    if (self->_abExperimentURL)
      PBDataWriterWriteSubmessage();
    if (self->_businessPortalBaseURL)
      PBDataWriterWriteSubmessage();
    if (self->_logMessageUsageURL)
      PBDataWriterWriteSubmessage();
    if (self->_spatialLookupURL)
      PBDataWriterWriteSubmessage();
    if (self->_realtimeTrafficProbeURL)
      PBDataWriterWriteSubmessage();
    if (self->_batchTrafficProbeURL)
      PBDataWriterWriteSubmessage();
    if (self->_proactiveRoutingURL)
      PBDataWriterWriteSubmessage();
    if (self->_logMessageUsageV3URL)
      PBDataWriterWriteSubmessage();
    if (self->_backgroundDispatcherURL)
      PBDataWriterWriteSubmessage();
    if (self->_bluePOIDispatcherURL)
      PBDataWriterWriteSubmessage();
    if (self->_backgroundRevGeoURL)
      PBDataWriterWriteSubmessage();
    if (self->_wifiConnectionQualityProbeURL)
      PBDataWriterWriteSubmessage();
    if (self->_muninBaseURL)
      PBDataWriterWriteSubmessage();
    if (self->_authProxyURL)
      PBDataWriterWriteSubmessage();
    if (self->_wifiQualityURL)
      PBDataWriterWriteSubmessage();
    if (self->_feedbackSubmissionURL)
      PBDataWriterWriteSubmessage();
    if (self->_feedbackLookupURL)
      PBDataWriterWriteSubmessage();
    if (self->_junctionImageServiceURL)
      PBDataWriterWriteSubmessage();
    if (self->_analyticsCohortSessionURL)
      PBDataWriterWriteSubmessage();
    if (self->_analyticsLongSessionURL)
      PBDataWriterWriteSubmessage();
    if (self->_analyticsShortSessionURL)
      PBDataWriterWriteSubmessage();
    if (self->_analyticsSessionlessURL)
      PBDataWriterWriteSubmessage();
    if (self->_webModuleBaseURL)
      PBDataWriterWriteSubmessage();
    if (self->_wifiQualityTileURL)
      PBDataWriterWriteSubmessage();
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = self->_alternateResourcesURLs;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

    if (self->_tokenAuthenticationURL)
      PBDataWriterWriteSubmessage();
    if (self->_authenticatedClientFeatureFlagURL)
      PBDataWriterWriteSubmessage();
    if (self->_addressCorrectionTaggedLocationURL)
      PBDataWriterWriteSubmessage();
    if (self->_proactiveAppClipURL)
      PBDataWriterWriteSubmessage();
    if (self->_enrichmentSubmissionURL)
      PBDataWriterWriteSubmessage();
    if (self->_ugcLogDiscardURL)
      PBDataWriterWriteSubmessage();
    if (self->_batchReverseGeocoderPlaceRequestURL)
      PBDataWriterWriteSubmessage();
    if (self->_pressureProbeDataURL)
      PBDataWriterWriteSubmessage();
    if (self->_poiBusynessActivityCollectionURL)
      PBDataWriterWriteSubmessage();
    if (self->_rapWebBundleURL)
      PBDataWriterWriteSubmessage();
    if (self->_networkSelectionHarvestURL)
      PBDataWriterWriteSubmessage();
    if (self->_offlineDataBatchListURL)
      PBDataWriterWriteSubmessage();
    if (self->_offlineDataSizeURL)
      PBDataWriterWriteSubmessage();
    if (self->_offlineDataDownloadBaseURL)
      PBDataWriterWriteSubmessage();
    if (self->_bcxDispatcherURL)
      PBDataWriterWriteSubmessage();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v12);
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  id *v8;
  id *v9;

  v9 = (id *)a3;
  -[GEOURLInfoSet readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v9 + 1, self->_reader);
  *((_DWORD *)v9 + 118) = self->_readerMarkPos;
  *((_DWORD *)v9 + 119) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v9 + 121) = self->_dataSet;
    v9[61] = (id)((unint64_t)v9[61] | 1);
  }
  if (self->_resourcesURL)
    objc_msgSend(v9, "setResourcesURL:");
  if (self->_searchAttributionManifestURL)
    objc_msgSend(v9, "setSearchAttributionManifestURL:");
  if (self->_directionsURL)
    objc_msgSend(v9, "setDirectionsURL:");
  if (self->_etaURL)
    objc_msgSend(v9, "setEtaURL:");
  if (self->_batchReverseGeocoderURL)
    objc_msgSend(v9, "setBatchReverseGeocoderURL:");
  if (self->_simpleETAURL)
    objc_msgSend(v9, "setSimpleETAURL:");
  if (self->_addressCorrectionInitURL)
    objc_msgSend(v9, "setAddressCorrectionInitURL:");
  if (self->_addressCorrectionUpdateURL)
    objc_msgSend(v9, "setAddressCorrectionUpdateURL:");
  if (self->_polyLocationShiftURL)
    objc_msgSend(v9, "setPolyLocationShiftURL:");
  if (self->_problemSubmissionURL)
    objc_msgSend(v9, "setProblemSubmissionURL:");
  if (self->_problemStatusURL)
    objc_msgSend(v9, "setProblemStatusURL:");
  if (self->_reverseGeocoderVersionsURL)
    objc_msgSend(v9, "setReverseGeocoderVersionsURL:");
  if (self->_problemCategoriesURL)
    objc_msgSend(v9, "setProblemCategoriesURL:");
  if (self->_announcementsURL)
    objc_msgSend(v9, "setAnnouncementsURL:");
  if (self->_dispatcherURL)
    objc_msgSend(v9, "setDispatcherURL:");
  if (self->_problemOptInURL)
    objc_msgSend(v9, "setProblemOptInURL:");
  if (self->_abExperimentURL)
    objc_msgSend(v9, "setAbExperimentURL:");
  if (self->_businessPortalBaseURL)
    objc_msgSend(v9, "setBusinessPortalBaseURL:");
  if (self->_logMessageUsageURL)
    objc_msgSend(v9, "setLogMessageUsageURL:");
  if (self->_spatialLookupURL)
    objc_msgSend(v9, "setSpatialLookupURL:");
  if (self->_realtimeTrafficProbeURL)
    objc_msgSend(v9, "setRealtimeTrafficProbeURL:");
  if (self->_batchTrafficProbeURL)
    objc_msgSend(v9, "setBatchTrafficProbeURL:");
  if (self->_proactiveRoutingURL)
    objc_msgSend(v9, "setProactiveRoutingURL:");
  if (self->_logMessageUsageV3URL)
    objc_msgSend(v9, "setLogMessageUsageV3URL:");
  if (self->_backgroundDispatcherURL)
    objc_msgSend(v9, "setBackgroundDispatcherURL:");
  if (self->_bluePOIDispatcherURL)
    objc_msgSend(v9, "setBluePOIDispatcherURL:");
  if (self->_backgroundRevGeoURL)
    objc_msgSend(v9, "setBackgroundRevGeoURL:");
  if (self->_wifiConnectionQualityProbeURL)
    objc_msgSend(v9, "setWifiConnectionQualityProbeURL:");
  if (self->_muninBaseURL)
    objc_msgSend(v9, "setMuninBaseURL:");
  if (self->_authProxyURL)
    objc_msgSend(v9, "setAuthProxyURL:");
  if (self->_wifiQualityURL)
    objc_msgSend(v9, "setWifiQualityURL:");
  if (self->_feedbackSubmissionURL)
    objc_msgSend(v9, "setFeedbackSubmissionURL:");
  if (self->_feedbackLookupURL)
    objc_msgSend(v9, "setFeedbackLookupURL:");
  if (self->_junctionImageServiceURL)
    objc_msgSend(v9, "setJunctionImageServiceURL:");
  if (self->_analyticsCohortSessionURL)
    objc_msgSend(v9, "setAnalyticsCohortSessionURL:");
  if (self->_analyticsLongSessionURL)
    objc_msgSend(v9, "setAnalyticsLongSessionURL:");
  if (self->_analyticsShortSessionURL)
    objc_msgSend(v9, "setAnalyticsShortSessionURL:");
  if (self->_analyticsSessionlessURL)
    objc_msgSend(v9, "setAnalyticsSessionlessURL:");
  if (self->_webModuleBaseURL)
    objc_msgSend(v9, "setWebModuleBaseURL:");
  if (self->_wifiQualityTileURL)
    objc_msgSend(v9, "setWifiQualityTileURL:");
  if (-[GEOURLInfoSet alternateResourcesURLsCount](self, "alternateResourcesURLsCount"))
  {
    objc_msgSend(v9, "clearAlternateResourcesURLs");
    v4 = -[GEOURLInfoSet alternateResourcesURLsCount](self, "alternateResourcesURLsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOURLInfoSet alternateResourcesURLAtIndex:](self, "alternateResourcesURLAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addAlternateResourcesURL:", v7);

      }
    }
  }
  if (self->_tokenAuthenticationURL)
    objc_msgSend(v9, "setTokenAuthenticationURL:");
  v8 = v9;
  if (self->_authenticatedClientFeatureFlagURL)
  {
    objc_msgSend(v9, "setAuthenticatedClientFeatureFlagURL:");
    v8 = v9;
  }
  if (self->_addressCorrectionTaggedLocationURL)
  {
    objc_msgSend(v9, "setAddressCorrectionTaggedLocationURL:");
    v8 = v9;
  }
  if (self->_proactiveAppClipURL)
  {
    objc_msgSend(v9, "setProactiveAppClipURL:");
    v8 = v9;
  }
  if (self->_enrichmentSubmissionURL)
  {
    objc_msgSend(v9, "setEnrichmentSubmissionURL:");
    v8 = v9;
  }
  if (self->_ugcLogDiscardURL)
  {
    objc_msgSend(v9, "setUgcLogDiscardURL:");
    v8 = v9;
  }
  if (self->_batchReverseGeocoderPlaceRequestURL)
  {
    objc_msgSend(v9, "setBatchReverseGeocoderPlaceRequestURL:");
    v8 = v9;
  }
  if (self->_pressureProbeDataURL)
  {
    objc_msgSend(v9, "setPressureProbeDataURL:");
    v8 = v9;
  }
  if (self->_poiBusynessActivityCollectionURL)
  {
    objc_msgSend(v9, "setPoiBusynessActivityCollectionURL:");
    v8 = v9;
  }
  if (self->_rapWebBundleURL)
  {
    objc_msgSend(v9, "setRapWebBundleURL:");
    v8 = v9;
  }
  if (self->_networkSelectionHarvestURL)
  {
    objc_msgSend(v9, "setNetworkSelectionHarvestURL:");
    v8 = v9;
  }
  if (self->_offlineDataBatchListURL)
  {
    objc_msgSend(v9, "setOfflineDataBatchListURL:");
    v8 = v9;
  }
  if (self->_offlineDataSizeURL)
  {
    objc_msgSend(v9, "setOfflineDataSizeURL:");
    v8 = v9;
  }
  if (self->_offlineDataDownloadBaseURL)
  {
    objc_msgSend(v9, "setOfflineDataDownloadBaseURL:");
    v8 = v9;
  }
  if (self->_bcxDispatcherURL)
  {
    objc_msgSend(v9, "setBcxDispatcherURL:");
    v8 = v9;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  void *v44;
  id v45;
  void *v46;
  id v47;
  void *v48;
  id v49;
  void *v50;
  id v51;
  void *v52;
  id v53;
  void *v54;
  id v55;
  void *v56;
  id v57;
  void *v58;
  id v59;
  void *v60;
  id v61;
  void *v62;
  id v63;
  void *v64;
  id v65;
  void *v66;
  id v67;
  void *v68;
  id v69;
  void *v70;
  id v71;
  void *v72;
  id v73;
  void *v74;
  id v75;
  void *v76;
  id v77;
  void *v78;
  id v79;
  void *v80;
  id v81;
  void *v82;
  id v83;
  void *v84;
  id v85;
  void *v86;
  id v87;
  void *v88;
  NSMutableArray *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t i;
  void *v93;
  id v94;
  void *v95;
  id v96;
  void *v97;
  id v98;
  void *v99;
  id v100;
  void *v101;
  id v102;
  void *v103;
  id v104;
  void *v105;
  id v106;
  void *v107;
  id v108;
  void *v109;
  id v110;
  void *v111;
  id v112;
  void *v113;
  id v114;
  void *v115;
  id v116;
  void *v117;
  id v118;
  void *v119;
  id v120;
  void *v121;
  id v122;
  void *v123;
  PBUnknownFields *v124;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  _BYTE v130[128];
  uint64_t v131;

  v131 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*((_BYTE *)&self->_flags + 7) & 4) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOURLInfoSetReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_15;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOURLInfoSet readAll:](self, "readAll:", 0);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 484) = self->_dataSet;
    *(_QWORD *)(v5 + 488) |= 1uLL;
  }
  v9 = -[GEOURLInfo copyWithZone:](self->_resourcesURL, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 384);
  *(_QWORD *)(v5 + 384) = v9;

  v11 = -[GEOURLInfo copyWithZone:](self->_searchAttributionManifestURL, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 400);
  *(_QWORD *)(v5 + 400) = v11;

  v13 = -[GEOURLInfo copyWithZone:](self->_directionsURL, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 184);
  *(_QWORD *)(v5 + 184) = v13;

  v15 = -[GEOURLInfo copyWithZone:](self->_etaURL, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 208);
  *(_QWORD *)(v5 + 208) = v15;

  v17 = -[GEOURLInfo copyWithZone:](self->_batchReverseGeocoderURL, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 144);
  *(_QWORD *)(v5 + 144) = v17;

  v19 = -[GEOURLInfo copyWithZone:](self->_simpleETAURL, "copyWithZone:", a3);
  v20 = *(void **)(v5 + 408);
  *(_QWORD *)(v5 + 408) = v19;

  v21 = -[GEOURLInfo copyWithZone:](self->_addressCorrectionInitURL, "copyWithZone:", a3);
  v22 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v21;

  v23 = -[GEOURLInfo copyWithZone:](self->_addressCorrectionUpdateURL, "copyWithZone:", a3);
  v24 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v23;

  v25 = -[GEOURLInfo copyWithZone:](self->_polyLocationShiftURL, "copyWithZone:", a3);
  v26 = *(void **)(v5 + 304);
  *(_QWORD *)(v5 + 304) = v25;

  v27 = -[GEOURLInfo copyWithZone:](self->_problemSubmissionURL, "copyWithZone:", a3);
  v28 = *(void **)(v5 + 360);
  *(_QWORD *)(v5 + 360) = v27;

  v29 = -[GEOURLInfo copyWithZone:](self->_problemStatusURL, "copyWithZone:", a3);
  v30 = *(void **)(v5 + 352);
  *(_QWORD *)(v5 + 352) = v29;

  v31 = -[GEOURLInfo copyWithZone:](self->_reverseGeocoderVersionsURL, "copyWithZone:", a3);
  v32 = *(void **)(v5 + 392);
  *(_QWORD *)(v5 + 392) = v31;

  v33 = -[GEOURLInfo copyWithZone:](self->_problemCategoriesURL, "copyWithZone:", a3);
  v34 = *(void **)(v5 + 336);
  *(_QWORD *)(v5 + 336) = v33;

  v35 = -[GEOURLInfo copyWithZone:](self->_announcementsURL, "copyWithZone:", a3);
  v36 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v35;

  v37 = -[GEOURLInfo copyWithZone:](self->_dispatcherURL, "copyWithZone:", a3);
  v38 = *(void **)(v5 + 192);
  *(_QWORD *)(v5 + 192) = v37;

  v39 = -[GEOURLInfo copyWithZone:](self->_problemOptInURL, "copyWithZone:", a3);
  v40 = *(void **)(v5 + 344);
  *(_QWORD *)(v5 + 344) = v39;

  v41 = -[GEOURLInfo copyWithZone:](self->_abExperimentURL, "copyWithZone:", a3);
  v42 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v41;

  v43 = -[GEOURLInfo copyWithZone:](self->_businessPortalBaseURL, "copyWithZone:", a3);
  v44 = *(void **)(v5 + 176);
  *(_QWORD *)(v5 + 176) = v43;

  v45 = -[GEOURLInfo copyWithZone:](self->_logMessageUsageURL, "copyWithZone:", a3);
  v46 = *(void **)(v5 + 240);
  *(_QWORD *)(v5 + 240) = v45;

  v47 = -[GEOURLInfo copyWithZone:](self->_spatialLookupURL, "copyWithZone:", a3);
  v48 = *(void **)(v5 + 416);
  *(_QWORD *)(v5 + 416) = v47;

  v49 = -[GEOURLInfo copyWithZone:](self->_realtimeTrafficProbeURL, "copyWithZone:", a3);
  v50 = *(void **)(v5 + 376);
  *(_QWORD *)(v5 + 376) = v49;

  v51 = -[GEOURLInfo copyWithZone:](self->_batchTrafficProbeURL, "copyWithZone:", a3);
  v52 = *(void **)(v5 + 152);
  *(_QWORD *)(v5 + 152) = v51;

  v53 = -[GEOURLInfo copyWithZone:](self->_proactiveRoutingURL, "copyWithZone:", a3);
  v54 = *(void **)(v5 + 328);
  *(_QWORD *)(v5 + 328) = v53;

  v55 = -[GEOURLInfo copyWithZone:](self->_logMessageUsageV3URL, "copyWithZone:", a3);
  v56 = *(void **)(v5 + 248);
  *(_QWORD *)(v5 + 248) = v55;

  v57 = -[GEOURLInfo copyWithZone:](self->_backgroundDispatcherURL, "copyWithZone:", a3);
  v58 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v57;

  v59 = -[GEOURLInfo copyWithZone:](self->_bluePOIDispatcherURL, "copyWithZone:", a3);
  v60 = *(void **)(v5 + 168);
  *(_QWORD *)(v5 + 168) = v59;

  v61 = -[GEOURLInfo copyWithZone:](self->_backgroundRevGeoURL, "copyWithZone:", a3);
  v62 = *(void **)(v5 + 128);
  *(_QWORD *)(v5 + 128) = v61;

  v63 = -[GEOURLInfo copyWithZone:](self->_wifiConnectionQualityProbeURL, "copyWithZone:", a3);
  v64 = *(void **)(v5 + 448);
  *(_QWORD *)(v5 + 448) = v63;

  v65 = -[GEOURLInfo copyWithZone:](self->_muninBaseURL, "copyWithZone:", a3);
  v66 = *(void **)(v5 + 256);
  *(_QWORD *)(v5 + 256) = v65;

  v67 = -[GEOURLInfo copyWithZone:](self->_authProxyURL, "copyWithZone:", a3);
  v68 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v67;

  v69 = -[GEOURLInfo copyWithZone:](self->_wifiQualityURL, "copyWithZone:", a3);
  v70 = *(void **)(v5 + 464);
  *(_QWORD *)(v5 + 464) = v69;

  v71 = -[GEOURLInfo copyWithZone:](self->_feedbackSubmissionURL, "copyWithZone:", a3);
  v72 = *(void **)(v5 + 224);
  *(_QWORD *)(v5 + 224) = v71;

  v73 = -[GEOURLInfo copyWithZone:](self->_feedbackLookupURL, "copyWithZone:", a3);
  v74 = *(void **)(v5 + 216);
  *(_QWORD *)(v5 + 216) = v73;

  v75 = -[GEOURLInfo copyWithZone:](self->_junctionImageServiceURL, "copyWithZone:", a3);
  v76 = *(void **)(v5 + 232);
  *(_QWORD *)(v5 + 232) = v75;

  v77 = -[GEOURLInfo copyWithZone:](self->_analyticsCohortSessionURL, "copyWithZone:", a3);
  v78 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v77;

  v79 = -[GEOURLInfo copyWithZone:](self->_analyticsLongSessionURL, "copyWithZone:", a3);
  v80 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v79;

  v81 = -[GEOURLInfo copyWithZone:](self->_analyticsShortSessionURL, "copyWithZone:", a3);
  v82 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v81;

  v83 = -[GEOURLInfo copyWithZone:](self->_analyticsSessionlessURL, "copyWithZone:", a3);
  v84 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v83;

  v85 = -[GEOURLInfo copyWithZone:](self->_webModuleBaseURL, "copyWithZone:", a3);
  v86 = *(void **)(v5 + 440);
  *(_QWORD *)(v5 + 440) = v85;

  v87 = -[GEOURLInfo copyWithZone:](self->_wifiQualityTileURL, "copyWithZone:", a3);
  v88 = *(void **)(v5 + 456);
  *(_QWORD *)(v5 + 456) = v87;

  v128 = 0u;
  v129 = 0u;
  v126 = 0u;
  v127 = 0u;
  v89 = self->_alternateResourcesURLs;
  v90 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v89, "countByEnumeratingWithState:objects:count:", &v126, v130, 16);
  if (v90)
  {
    v91 = *(_QWORD *)v127;
    do
    {
      for (i = 0; i != v90; ++i)
      {
        if (*(_QWORD *)v127 != v91)
          objc_enumerationMutation(v89);
        v93 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v126 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v126);
        objc_msgSend((id)v5, "addAlternateResourcesURL:", v93);

      }
      v90 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v89, "countByEnumeratingWithState:objects:count:", &v126, v130, 16);
    }
    while (v90);
  }

  v94 = -[GEOURLInfo copyWithZone:](self->_tokenAuthenticationURL, "copyWithZone:", a3);
  v95 = *(void **)(v5 + 424);
  *(_QWORD *)(v5 + 424) = v94;

  v96 = -[GEOURLInfo copyWithZone:](self->_authenticatedClientFeatureFlagURL, "copyWithZone:", a3);
  v97 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v96;

  v98 = -[GEOURLInfo copyWithZone:](self->_addressCorrectionTaggedLocationURL, "copyWithZone:", a3);
  v99 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v98;

  v100 = -[GEOURLInfo copyWithZone:](self->_proactiveAppClipURL, "copyWithZone:", a3);
  v101 = *(void **)(v5 + 320);
  *(_QWORD *)(v5 + 320) = v100;

  v102 = -[GEOURLInfo copyWithZone:](self->_enrichmentSubmissionURL, "copyWithZone:", a3);
  v103 = *(void **)(v5 + 200);
  *(_QWORD *)(v5 + 200) = v102;

  v104 = -[GEOURLInfo copyWithZone:](self->_ugcLogDiscardURL, "copyWithZone:", a3);
  v105 = *(void **)(v5 + 432);
  *(_QWORD *)(v5 + 432) = v104;

  v106 = -[GEOURLInfo copyWithZone:](self->_batchReverseGeocoderPlaceRequestURL, "copyWithZone:", a3);
  v107 = *(void **)(v5 + 136);
  *(_QWORD *)(v5 + 136) = v106;

  v108 = -[GEOURLInfo copyWithZone:](self->_pressureProbeDataURL, "copyWithZone:", a3);
  v109 = *(void **)(v5 + 312);
  *(_QWORD *)(v5 + 312) = v108;

  v110 = -[GEOURLInfo copyWithZone:](self->_poiBusynessActivityCollectionURL, "copyWithZone:", a3);
  v111 = *(void **)(v5 + 296);
  *(_QWORD *)(v5 + 296) = v110;

  v112 = -[GEOURLInfo copyWithZone:](self->_rapWebBundleURL, "copyWithZone:", a3);
  v113 = *(void **)(v5 + 368);
  *(_QWORD *)(v5 + 368) = v112;

  v114 = -[GEOURLInfo copyWithZone:](self->_networkSelectionHarvestURL, "copyWithZone:", a3);
  v115 = *(void **)(v5 + 264);
  *(_QWORD *)(v5 + 264) = v114;

  v116 = -[GEOURLInfo copyWithZone:](self->_offlineDataBatchListURL, "copyWithZone:", a3);
  v117 = *(void **)(v5 + 272);
  *(_QWORD *)(v5 + 272) = v116;

  v118 = -[GEOURLInfo copyWithZone:](self->_offlineDataSizeURL, "copyWithZone:", a3);
  v119 = *(void **)(v5 + 288);
  *(_QWORD *)(v5 + 288) = v118;

  v120 = -[GEOURLInfo copyWithZone:](self->_offlineDataDownloadBaseURL, "copyWithZone:", a3);
  v121 = *(void **)(v5 + 280);
  *(_QWORD *)(v5 + 280) = v120;

  v122 = -[GEOURLInfo copyWithZone:](self->_bcxDispatcherURL, "copyWithZone:", a3);
  v123 = *(void **)(v5 + 160);
  *(_QWORD *)(v5 + 160) = v122;

  v124 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v124;
LABEL_15:

  return (id)v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  unint64_t v54;
  unint64_t v55;
  unint64_t v56;
  unint64_t v57;
  unint64_t v58;

  -[GEOURLInfoSet readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v3 = 2654435761 * self->_dataSet;
  else
    v3 = 0;
  v4 = -[GEOURLInfo hash](self->_resourcesURL, "hash") ^ v3;
  v5 = -[GEOURLInfo hash](self->_searchAttributionManifestURL, "hash");
  v6 = v4 ^ v5 ^ -[GEOURLInfo hash](self->_directionsURL, "hash");
  v7 = -[GEOURLInfo hash](self->_etaURL, "hash");
  v8 = v7 ^ -[GEOURLInfo hash](self->_batchReverseGeocoderURL, "hash");
  v9 = v6 ^ v8 ^ -[GEOURLInfo hash](self->_simpleETAURL, "hash");
  v10 = -[GEOURLInfo hash](self->_addressCorrectionInitURL, "hash");
  v11 = v10 ^ -[GEOURLInfo hash](self->_addressCorrectionUpdateURL, "hash");
  v12 = v11 ^ -[GEOURLInfo hash](self->_polyLocationShiftURL, "hash");
  v13 = v9 ^ v12 ^ -[GEOURLInfo hash](self->_problemSubmissionURL, "hash");
  v14 = -[GEOURLInfo hash](self->_problemStatusURL, "hash");
  v15 = v14 ^ -[GEOURLInfo hash](self->_reverseGeocoderVersionsURL, "hash");
  v16 = v15 ^ -[GEOURLInfo hash](self->_problemCategoriesURL, "hash");
  v17 = v16 ^ -[GEOURLInfo hash](self->_announcementsURL, "hash");
  v18 = v13 ^ v17 ^ -[GEOURLInfo hash](self->_dispatcherURL, "hash");
  v19 = -[GEOURLInfo hash](self->_problemOptInURL, "hash");
  v20 = v19 ^ -[GEOURLInfo hash](self->_abExperimentURL, "hash");
  v21 = v20 ^ -[GEOURLInfo hash](self->_businessPortalBaseURL, "hash");
  v22 = v21 ^ -[GEOURLInfo hash](self->_logMessageUsageURL, "hash");
  v23 = v22 ^ -[GEOURLInfo hash](self->_spatialLookupURL, "hash");
  v24 = v18 ^ v23 ^ -[GEOURLInfo hash](self->_realtimeTrafficProbeURL, "hash");
  v25 = -[GEOURLInfo hash](self->_batchTrafficProbeURL, "hash");
  v26 = v25 ^ -[GEOURLInfo hash](self->_proactiveRoutingURL, "hash");
  v27 = v26 ^ -[GEOURLInfo hash](self->_logMessageUsageV3URL, "hash");
  v28 = v27 ^ -[GEOURLInfo hash](self->_backgroundDispatcherURL, "hash");
  v29 = v28 ^ -[GEOURLInfo hash](self->_bluePOIDispatcherURL, "hash");
  v30 = v29 ^ -[GEOURLInfo hash](self->_backgroundRevGeoURL, "hash");
  v31 = v24 ^ v30 ^ -[GEOURLInfo hash](self->_wifiConnectionQualityProbeURL, "hash");
  v32 = -[GEOURLInfo hash](self->_muninBaseURL, "hash");
  v33 = v32 ^ -[GEOURLInfo hash](self->_authProxyURL, "hash");
  v34 = v33 ^ -[GEOURLInfo hash](self->_wifiQualityURL, "hash");
  v35 = v34 ^ -[GEOURLInfo hash](self->_feedbackSubmissionURL, "hash");
  v36 = v35 ^ -[GEOURLInfo hash](self->_feedbackLookupURL, "hash");
  v37 = v36 ^ -[GEOURLInfo hash](self->_junctionImageServiceURL, "hash");
  v38 = v37 ^ -[GEOURLInfo hash](self->_analyticsCohortSessionURL, "hash");
  v39 = v31 ^ v38 ^ -[GEOURLInfo hash](self->_analyticsLongSessionURL, "hash");
  v40 = -[GEOURLInfo hash](self->_analyticsShortSessionURL, "hash");
  v41 = v40 ^ -[GEOURLInfo hash](self->_analyticsSessionlessURL, "hash");
  v42 = v41 ^ -[GEOURLInfo hash](self->_webModuleBaseURL, "hash");
  v43 = v42 ^ -[GEOURLInfo hash](self->_wifiQualityTileURL, "hash");
  v44 = v43 ^ -[NSMutableArray hash](self->_alternateResourcesURLs, "hash");
  v45 = v44 ^ -[GEOURLInfo hash](self->_tokenAuthenticationURL, "hash");
  v46 = v45 ^ -[GEOURLInfo hash](self->_authenticatedClientFeatureFlagURL, "hash");
  v47 = v46 ^ -[GEOURLInfo hash](self->_addressCorrectionTaggedLocationURL, "hash");
  v48 = v39 ^ v47 ^ -[GEOURLInfo hash](self->_proactiveAppClipURL, "hash");
  v49 = -[GEOURLInfo hash](self->_enrichmentSubmissionURL, "hash");
  v50 = v49 ^ -[GEOURLInfo hash](self->_ugcLogDiscardURL, "hash");
  v51 = v50 ^ -[GEOURLInfo hash](self->_batchReverseGeocoderPlaceRequestURL, "hash");
  v52 = v51 ^ -[GEOURLInfo hash](self->_pressureProbeDataURL, "hash");
  v53 = v52 ^ -[GEOURLInfo hash](self->_poiBusynessActivityCollectionURL, "hash");
  v54 = v53 ^ -[GEOURLInfo hash](self->_rapWebBundleURL, "hash");
  v55 = v54 ^ -[GEOURLInfo hash](self->_networkSelectionHarvestURL, "hash");
  v56 = v55 ^ -[GEOURLInfo hash](self->_offlineDataBatchListURL, "hash");
  v57 = v56 ^ -[GEOURLInfo hash](self->_offlineDataSizeURL, "hash");
  v58 = v48 ^ v57 ^ -[GEOURLInfo hash](self->_offlineDataDownloadBaseURL, "hash");
  return v58 ^ -[GEOURLInfo hash](self->_bcxDispatcherURL, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  GEOURLInfo *resourcesURL;
  uint64_t v6;
  GEOURLInfo *searchAttributionManifestURL;
  uint64_t v8;
  GEOURLInfo *directionsURL;
  uint64_t v10;
  GEOURLInfo *etaURL;
  uint64_t v12;
  GEOURLInfo *batchReverseGeocoderURL;
  uint64_t v14;
  GEOURLInfo *simpleETAURL;
  uint64_t v16;
  GEOURLInfo *addressCorrectionInitURL;
  uint64_t v18;
  GEOURLInfo *addressCorrectionUpdateURL;
  uint64_t v20;
  GEOURLInfo *polyLocationShiftURL;
  uint64_t v22;
  GEOURLInfo *problemSubmissionURL;
  uint64_t v24;
  GEOURLInfo *problemStatusURL;
  uint64_t v26;
  GEOURLInfo *reverseGeocoderVersionsURL;
  uint64_t v28;
  GEOURLInfo *problemCategoriesURL;
  uint64_t v30;
  GEOURLInfo *announcementsURL;
  uint64_t v32;
  GEOURLInfo *dispatcherURL;
  uint64_t v34;
  GEOURLInfo *problemOptInURL;
  uint64_t v36;
  GEOURLInfo *abExperimentURL;
  uint64_t v38;
  GEOURLInfo *businessPortalBaseURL;
  uint64_t v40;
  GEOURLInfo *logMessageUsageURL;
  uint64_t v42;
  GEOURLInfo *spatialLookupURL;
  uint64_t v44;
  GEOURLInfo *realtimeTrafficProbeURL;
  uint64_t v46;
  GEOURLInfo *batchTrafficProbeURL;
  uint64_t v48;
  GEOURLInfo *proactiveRoutingURL;
  uint64_t v50;
  GEOURLInfo *logMessageUsageV3URL;
  uint64_t v52;
  GEOURLInfo *backgroundDispatcherURL;
  uint64_t v54;
  GEOURLInfo *bluePOIDispatcherURL;
  uint64_t v56;
  GEOURLInfo *backgroundRevGeoURL;
  uint64_t v58;
  GEOURLInfo *wifiConnectionQualityProbeURL;
  uint64_t v60;
  GEOURLInfo *muninBaseURL;
  uint64_t v62;
  GEOURLInfo *authProxyURL;
  uint64_t v64;
  GEOURLInfo *wifiQualityURL;
  uint64_t v66;
  GEOURLInfo *feedbackSubmissionURL;
  uint64_t v68;
  GEOURLInfo *feedbackLookupURL;
  uint64_t v70;
  GEOURLInfo *junctionImageServiceURL;
  uint64_t v72;
  GEOURLInfo *analyticsCohortSessionURL;
  uint64_t v74;
  GEOURLInfo *analyticsLongSessionURL;
  uint64_t v76;
  GEOURLInfo *analyticsShortSessionURL;
  uint64_t v78;
  GEOURLInfo *analyticsSessionlessURL;
  uint64_t v80;
  GEOURLInfo *webModuleBaseURL;
  uint64_t v82;
  GEOURLInfo *wifiQualityTileURL;
  uint64_t v84;
  id v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t i;
  GEOURLInfo *tokenAuthenticationURL;
  uint64_t v91;
  GEOURLInfo *authenticatedClientFeatureFlagURL;
  uint64_t v93;
  GEOURLInfo *addressCorrectionTaggedLocationURL;
  uint64_t v95;
  GEOURLInfo *proactiveAppClipURL;
  uint64_t v97;
  GEOURLInfo *enrichmentSubmissionURL;
  uint64_t v99;
  GEOURLInfo *ugcLogDiscardURL;
  uint64_t v101;
  GEOURLInfo *batchReverseGeocoderPlaceRequestURL;
  uint64_t v103;
  GEOURLInfo *pressureProbeDataURL;
  uint64_t v105;
  GEOURLInfo *poiBusynessActivityCollectionURL;
  uint64_t v107;
  GEOURLInfo *rapWebBundleURL;
  uint64_t v109;
  GEOURLInfo *networkSelectionHarvestURL;
  uint64_t v111;
  GEOURLInfo *offlineDataBatchListURL;
  uint64_t v113;
  GEOURLInfo *offlineDataSizeURL;
  uint64_t v115;
  GEOURLInfo *offlineDataDownloadBaseURL;
  uint64_t v117;
  GEOURLInfo *bcxDispatcherURL;
  uint64_t v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  _BYTE v124[128];
  uint64_t v125;

  v125 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  if ((*((_BYTE *)v4 + 488) & 1) != 0)
  {
    self->_dataSet = *((_DWORD *)v4 + 121);
    *(_QWORD *)&self->_flags |= 1uLL;
  }
  resourcesURL = self->_resourcesURL;
  v6 = *((_QWORD *)v4 + 48);
  if (resourcesURL)
  {
    if (v6)
      -[GEOURLInfo mergeFrom:](resourcesURL, "mergeFrom:");
  }
  else if (v6)
  {
    -[GEOURLInfoSet setResourcesURL:](self, "setResourcesURL:");
  }
  searchAttributionManifestURL = self->_searchAttributionManifestURL;
  v8 = *((_QWORD *)v4 + 50);
  if (searchAttributionManifestURL)
  {
    if (v8)
      -[GEOURLInfo mergeFrom:](searchAttributionManifestURL, "mergeFrom:");
  }
  else if (v8)
  {
    -[GEOURLInfoSet setSearchAttributionManifestURL:](self, "setSearchAttributionManifestURL:");
  }
  directionsURL = self->_directionsURL;
  v10 = *((_QWORD *)v4 + 23);
  if (directionsURL)
  {
    if (v10)
      -[GEOURLInfo mergeFrom:](directionsURL, "mergeFrom:");
  }
  else if (v10)
  {
    -[GEOURLInfoSet setDirectionsURL:](self, "setDirectionsURL:");
  }
  etaURL = self->_etaURL;
  v12 = *((_QWORD *)v4 + 26);
  if (etaURL)
  {
    if (v12)
      -[GEOURLInfo mergeFrom:](etaURL, "mergeFrom:");
  }
  else if (v12)
  {
    -[GEOURLInfoSet setEtaURL:](self, "setEtaURL:");
  }
  batchReverseGeocoderURL = self->_batchReverseGeocoderURL;
  v14 = *((_QWORD *)v4 + 18);
  if (batchReverseGeocoderURL)
  {
    if (v14)
      -[GEOURLInfo mergeFrom:](batchReverseGeocoderURL, "mergeFrom:");
  }
  else if (v14)
  {
    -[GEOURLInfoSet setBatchReverseGeocoderURL:](self, "setBatchReverseGeocoderURL:");
  }
  simpleETAURL = self->_simpleETAURL;
  v16 = *((_QWORD *)v4 + 51);
  if (simpleETAURL)
  {
    if (v16)
      -[GEOURLInfo mergeFrom:](simpleETAURL, "mergeFrom:");
  }
  else if (v16)
  {
    -[GEOURLInfoSet setSimpleETAURL:](self, "setSimpleETAURL:");
  }
  addressCorrectionInitURL = self->_addressCorrectionInitURL;
  v18 = *((_QWORD *)v4 + 4);
  if (addressCorrectionInitURL)
  {
    if (v18)
      -[GEOURLInfo mergeFrom:](addressCorrectionInitURL, "mergeFrom:");
  }
  else if (v18)
  {
    -[GEOURLInfoSet setAddressCorrectionInitURL:](self, "setAddressCorrectionInitURL:");
  }
  addressCorrectionUpdateURL = self->_addressCorrectionUpdateURL;
  v20 = *((_QWORD *)v4 + 6);
  if (addressCorrectionUpdateURL)
  {
    if (v20)
      -[GEOURLInfo mergeFrom:](addressCorrectionUpdateURL, "mergeFrom:");
  }
  else if (v20)
  {
    -[GEOURLInfoSet setAddressCorrectionUpdateURL:](self, "setAddressCorrectionUpdateURL:");
  }
  polyLocationShiftURL = self->_polyLocationShiftURL;
  v22 = *((_QWORD *)v4 + 38);
  if (polyLocationShiftURL)
  {
    if (v22)
      -[GEOURLInfo mergeFrom:](polyLocationShiftURL, "mergeFrom:");
  }
  else if (v22)
  {
    -[GEOURLInfoSet setPolyLocationShiftURL:](self, "setPolyLocationShiftURL:");
  }
  problemSubmissionURL = self->_problemSubmissionURL;
  v24 = *((_QWORD *)v4 + 45);
  if (problemSubmissionURL)
  {
    if (v24)
      -[GEOURLInfo mergeFrom:](problemSubmissionURL, "mergeFrom:");
  }
  else if (v24)
  {
    -[GEOURLInfoSet setProblemSubmissionURL:](self, "setProblemSubmissionURL:");
  }
  problemStatusURL = self->_problemStatusURL;
  v26 = *((_QWORD *)v4 + 44);
  if (problemStatusURL)
  {
    if (v26)
      -[GEOURLInfo mergeFrom:](problemStatusURL, "mergeFrom:");
  }
  else if (v26)
  {
    -[GEOURLInfoSet setProblemStatusURL:](self, "setProblemStatusURL:");
  }
  reverseGeocoderVersionsURL = self->_reverseGeocoderVersionsURL;
  v28 = *((_QWORD *)v4 + 49);
  if (reverseGeocoderVersionsURL)
  {
    if (v28)
      -[GEOURLInfo mergeFrom:](reverseGeocoderVersionsURL, "mergeFrom:");
  }
  else if (v28)
  {
    -[GEOURLInfoSet setReverseGeocoderVersionsURL:](self, "setReverseGeocoderVersionsURL:");
  }
  problemCategoriesURL = self->_problemCategoriesURL;
  v30 = *((_QWORD *)v4 + 42);
  if (problemCategoriesURL)
  {
    if (v30)
      -[GEOURLInfo mergeFrom:](problemCategoriesURL, "mergeFrom:");
  }
  else if (v30)
  {
    -[GEOURLInfoSet setProblemCategoriesURL:](self, "setProblemCategoriesURL:");
  }
  announcementsURL = self->_announcementsURL;
  v32 = *((_QWORD *)v4 + 12);
  if (announcementsURL)
  {
    if (v32)
      -[GEOURLInfo mergeFrom:](announcementsURL, "mergeFrom:");
  }
  else if (v32)
  {
    -[GEOURLInfoSet setAnnouncementsURL:](self, "setAnnouncementsURL:");
  }
  dispatcherURL = self->_dispatcherURL;
  v34 = *((_QWORD *)v4 + 24);
  if (dispatcherURL)
  {
    if (v34)
      -[GEOURLInfo mergeFrom:](dispatcherURL, "mergeFrom:");
  }
  else if (v34)
  {
    -[GEOURLInfoSet setDispatcherURL:](self, "setDispatcherURL:");
  }
  problemOptInURL = self->_problemOptInURL;
  v36 = *((_QWORD *)v4 + 43);
  if (problemOptInURL)
  {
    if (v36)
      -[GEOURLInfo mergeFrom:](problemOptInURL, "mergeFrom:");
  }
  else if (v36)
  {
    -[GEOURLInfoSet setProblemOptInURL:](self, "setProblemOptInURL:");
  }
  abExperimentURL = self->_abExperimentURL;
  v38 = *((_QWORD *)v4 + 3);
  if (abExperimentURL)
  {
    if (v38)
      -[GEOURLInfo mergeFrom:](abExperimentURL, "mergeFrom:");
  }
  else if (v38)
  {
    -[GEOURLInfoSet setAbExperimentURL:](self, "setAbExperimentURL:");
  }
  businessPortalBaseURL = self->_businessPortalBaseURL;
  v40 = *((_QWORD *)v4 + 22);
  if (businessPortalBaseURL)
  {
    if (v40)
      -[GEOURLInfo mergeFrom:](businessPortalBaseURL, "mergeFrom:");
  }
  else if (v40)
  {
    -[GEOURLInfoSet setBusinessPortalBaseURL:](self, "setBusinessPortalBaseURL:");
  }
  logMessageUsageURL = self->_logMessageUsageURL;
  v42 = *((_QWORD *)v4 + 30);
  if (logMessageUsageURL)
  {
    if (v42)
      -[GEOURLInfo mergeFrom:](logMessageUsageURL, "mergeFrom:");
  }
  else if (v42)
  {
    -[GEOURLInfoSet setLogMessageUsageURL:](self, "setLogMessageUsageURL:");
  }
  spatialLookupURL = self->_spatialLookupURL;
  v44 = *((_QWORD *)v4 + 52);
  if (spatialLookupURL)
  {
    if (v44)
      -[GEOURLInfo mergeFrom:](spatialLookupURL, "mergeFrom:");
  }
  else if (v44)
  {
    -[GEOURLInfoSet setSpatialLookupURL:](self, "setSpatialLookupURL:");
  }
  realtimeTrafficProbeURL = self->_realtimeTrafficProbeURL;
  v46 = *((_QWORD *)v4 + 47);
  if (realtimeTrafficProbeURL)
  {
    if (v46)
      -[GEOURLInfo mergeFrom:](realtimeTrafficProbeURL, "mergeFrom:");
  }
  else if (v46)
  {
    -[GEOURLInfoSet setRealtimeTrafficProbeURL:](self, "setRealtimeTrafficProbeURL:");
  }
  batchTrafficProbeURL = self->_batchTrafficProbeURL;
  v48 = *((_QWORD *)v4 + 19);
  if (batchTrafficProbeURL)
  {
    if (v48)
      -[GEOURLInfo mergeFrom:](batchTrafficProbeURL, "mergeFrom:");
  }
  else if (v48)
  {
    -[GEOURLInfoSet setBatchTrafficProbeURL:](self, "setBatchTrafficProbeURL:");
  }
  proactiveRoutingURL = self->_proactiveRoutingURL;
  v50 = *((_QWORD *)v4 + 41);
  if (proactiveRoutingURL)
  {
    if (v50)
      -[GEOURLInfo mergeFrom:](proactiveRoutingURL, "mergeFrom:");
  }
  else if (v50)
  {
    -[GEOURLInfoSet setProactiveRoutingURL:](self, "setProactiveRoutingURL:");
  }
  logMessageUsageV3URL = self->_logMessageUsageV3URL;
  v52 = *((_QWORD *)v4 + 31);
  if (logMessageUsageV3URL)
  {
    if (v52)
      -[GEOURLInfo mergeFrom:](logMessageUsageV3URL, "mergeFrom:");
  }
  else if (v52)
  {
    -[GEOURLInfoSet setLogMessageUsageV3URL:](self, "setLogMessageUsageV3URL:");
  }
  backgroundDispatcherURL = self->_backgroundDispatcherURL;
  v54 = *((_QWORD *)v4 + 15);
  if (backgroundDispatcherURL)
  {
    if (v54)
      -[GEOURLInfo mergeFrom:](backgroundDispatcherURL, "mergeFrom:");
  }
  else if (v54)
  {
    -[GEOURLInfoSet setBackgroundDispatcherURL:](self, "setBackgroundDispatcherURL:");
  }
  bluePOIDispatcherURL = self->_bluePOIDispatcherURL;
  v56 = *((_QWORD *)v4 + 21);
  if (bluePOIDispatcherURL)
  {
    if (v56)
      -[GEOURLInfo mergeFrom:](bluePOIDispatcherURL, "mergeFrom:");
  }
  else if (v56)
  {
    -[GEOURLInfoSet setBluePOIDispatcherURL:](self, "setBluePOIDispatcherURL:");
  }
  backgroundRevGeoURL = self->_backgroundRevGeoURL;
  v58 = *((_QWORD *)v4 + 16);
  if (backgroundRevGeoURL)
  {
    if (v58)
      -[GEOURLInfo mergeFrom:](backgroundRevGeoURL, "mergeFrom:");
  }
  else if (v58)
  {
    -[GEOURLInfoSet setBackgroundRevGeoURL:](self, "setBackgroundRevGeoURL:");
  }
  wifiConnectionQualityProbeURL = self->_wifiConnectionQualityProbeURL;
  v60 = *((_QWORD *)v4 + 56);
  if (wifiConnectionQualityProbeURL)
  {
    if (v60)
      -[GEOURLInfo mergeFrom:](wifiConnectionQualityProbeURL, "mergeFrom:");
  }
  else if (v60)
  {
    -[GEOURLInfoSet setWifiConnectionQualityProbeURL:](self, "setWifiConnectionQualityProbeURL:");
  }
  muninBaseURL = self->_muninBaseURL;
  v62 = *((_QWORD *)v4 + 32);
  if (muninBaseURL)
  {
    if (v62)
      -[GEOURLInfo mergeFrom:](muninBaseURL, "mergeFrom:");
  }
  else if (v62)
  {
    -[GEOURLInfoSet setMuninBaseURL:](self, "setMuninBaseURL:");
  }
  authProxyURL = self->_authProxyURL;
  v64 = *((_QWORD *)v4 + 13);
  if (authProxyURL)
  {
    if (v64)
      -[GEOURLInfo mergeFrom:](authProxyURL, "mergeFrom:");
  }
  else if (v64)
  {
    -[GEOURLInfoSet setAuthProxyURL:](self, "setAuthProxyURL:");
  }
  wifiQualityURL = self->_wifiQualityURL;
  v66 = *((_QWORD *)v4 + 58);
  if (wifiQualityURL)
  {
    if (v66)
      -[GEOURLInfo mergeFrom:](wifiQualityURL, "mergeFrom:");
  }
  else if (v66)
  {
    -[GEOURLInfoSet setWifiQualityURL:](self, "setWifiQualityURL:");
  }
  feedbackSubmissionURL = self->_feedbackSubmissionURL;
  v68 = *((_QWORD *)v4 + 28);
  if (feedbackSubmissionURL)
  {
    if (v68)
      -[GEOURLInfo mergeFrom:](feedbackSubmissionURL, "mergeFrom:");
  }
  else if (v68)
  {
    -[GEOURLInfoSet setFeedbackSubmissionURL:](self, "setFeedbackSubmissionURL:");
  }
  feedbackLookupURL = self->_feedbackLookupURL;
  v70 = *((_QWORD *)v4 + 27);
  if (feedbackLookupURL)
  {
    if (v70)
      -[GEOURLInfo mergeFrom:](feedbackLookupURL, "mergeFrom:");
  }
  else if (v70)
  {
    -[GEOURLInfoSet setFeedbackLookupURL:](self, "setFeedbackLookupURL:");
  }
  junctionImageServiceURL = self->_junctionImageServiceURL;
  v72 = *((_QWORD *)v4 + 29);
  if (junctionImageServiceURL)
  {
    if (v72)
      -[GEOURLInfo mergeFrom:](junctionImageServiceURL, "mergeFrom:");
  }
  else if (v72)
  {
    -[GEOURLInfoSet setJunctionImageServiceURL:](self, "setJunctionImageServiceURL:");
  }
  analyticsCohortSessionURL = self->_analyticsCohortSessionURL;
  v74 = *((_QWORD *)v4 + 8);
  if (analyticsCohortSessionURL)
  {
    if (v74)
      -[GEOURLInfo mergeFrom:](analyticsCohortSessionURL, "mergeFrom:");
  }
  else if (v74)
  {
    -[GEOURLInfoSet setAnalyticsCohortSessionURL:](self, "setAnalyticsCohortSessionURL:");
  }
  analyticsLongSessionURL = self->_analyticsLongSessionURL;
  v76 = *((_QWORD *)v4 + 9);
  if (analyticsLongSessionURL)
  {
    if (v76)
      -[GEOURLInfo mergeFrom:](analyticsLongSessionURL, "mergeFrom:");
  }
  else if (v76)
  {
    -[GEOURLInfoSet setAnalyticsLongSessionURL:](self, "setAnalyticsLongSessionURL:");
  }
  analyticsShortSessionURL = self->_analyticsShortSessionURL;
  v78 = *((_QWORD *)v4 + 11);
  if (analyticsShortSessionURL)
  {
    if (v78)
      -[GEOURLInfo mergeFrom:](analyticsShortSessionURL, "mergeFrom:");
  }
  else if (v78)
  {
    -[GEOURLInfoSet setAnalyticsShortSessionURL:](self, "setAnalyticsShortSessionURL:");
  }
  analyticsSessionlessURL = self->_analyticsSessionlessURL;
  v80 = *((_QWORD *)v4 + 10);
  if (analyticsSessionlessURL)
  {
    if (v80)
      -[GEOURLInfo mergeFrom:](analyticsSessionlessURL, "mergeFrom:");
  }
  else if (v80)
  {
    -[GEOURLInfoSet setAnalyticsSessionlessURL:](self, "setAnalyticsSessionlessURL:");
  }
  webModuleBaseURL = self->_webModuleBaseURL;
  v82 = *((_QWORD *)v4 + 55);
  if (webModuleBaseURL)
  {
    if (v82)
      -[GEOURLInfo mergeFrom:](webModuleBaseURL, "mergeFrom:");
  }
  else if (v82)
  {
    -[GEOURLInfoSet setWebModuleBaseURL:](self, "setWebModuleBaseURL:");
  }
  wifiQualityTileURL = self->_wifiQualityTileURL;
  v84 = *((_QWORD *)v4 + 57);
  if (wifiQualityTileURL)
  {
    if (v84)
      -[GEOURLInfo mergeFrom:](wifiQualityTileURL, "mergeFrom:");
  }
  else if (v84)
  {
    -[GEOURLInfoSet setWifiQualityTileURL:](self, "setWifiQualityTileURL:");
  }
  v122 = 0u;
  v123 = 0u;
  v120 = 0u;
  v121 = 0u;
  v85 = *((id *)v4 + 7);
  v86 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v120, v124, 16);
  if (v86)
  {
    v87 = v86;
    v88 = *(_QWORD *)v121;
    do
    {
      for (i = 0; i != v87; ++i)
      {
        if (*(_QWORD *)v121 != v88)
          objc_enumerationMutation(v85);
        -[GEOURLInfoSet addAlternateResourcesURL:](self, "addAlternateResourcesURL:", *(_QWORD *)(*((_QWORD *)&v120 + 1) + 8 * i), (_QWORD)v120);
      }
      v87 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v120, v124, 16);
    }
    while (v87);
  }

  tokenAuthenticationURL = self->_tokenAuthenticationURL;
  v91 = *((_QWORD *)v4 + 53);
  if (tokenAuthenticationURL)
  {
    if (v91)
      -[GEOURLInfo mergeFrom:](tokenAuthenticationURL, "mergeFrom:");
  }
  else if (v91)
  {
    -[GEOURLInfoSet setTokenAuthenticationURL:](self, "setTokenAuthenticationURL:");
  }
  authenticatedClientFeatureFlagURL = self->_authenticatedClientFeatureFlagURL;
  v93 = *((_QWORD *)v4 + 14);
  if (authenticatedClientFeatureFlagURL)
  {
    if (v93)
      -[GEOURLInfo mergeFrom:](authenticatedClientFeatureFlagURL, "mergeFrom:");
  }
  else if (v93)
  {
    -[GEOURLInfoSet setAuthenticatedClientFeatureFlagURL:](self, "setAuthenticatedClientFeatureFlagURL:");
  }
  addressCorrectionTaggedLocationURL = self->_addressCorrectionTaggedLocationURL;
  v95 = *((_QWORD *)v4 + 5);
  if (addressCorrectionTaggedLocationURL)
  {
    if (v95)
      -[GEOURLInfo mergeFrom:](addressCorrectionTaggedLocationURL, "mergeFrom:");
  }
  else if (v95)
  {
    -[GEOURLInfoSet setAddressCorrectionTaggedLocationURL:](self, "setAddressCorrectionTaggedLocationURL:");
  }
  proactiveAppClipURL = self->_proactiveAppClipURL;
  v97 = *((_QWORD *)v4 + 40);
  if (proactiveAppClipURL)
  {
    if (v97)
      -[GEOURLInfo mergeFrom:](proactiveAppClipURL, "mergeFrom:");
  }
  else if (v97)
  {
    -[GEOURLInfoSet setProactiveAppClipURL:](self, "setProactiveAppClipURL:");
  }
  enrichmentSubmissionURL = self->_enrichmentSubmissionURL;
  v99 = *((_QWORD *)v4 + 25);
  if (enrichmentSubmissionURL)
  {
    if (v99)
      -[GEOURLInfo mergeFrom:](enrichmentSubmissionURL, "mergeFrom:");
  }
  else if (v99)
  {
    -[GEOURLInfoSet setEnrichmentSubmissionURL:](self, "setEnrichmentSubmissionURL:");
  }
  ugcLogDiscardURL = self->_ugcLogDiscardURL;
  v101 = *((_QWORD *)v4 + 54);
  if (ugcLogDiscardURL)
  {
    if (v101)
      -[GEOURLInfo mergeFrom:](ugcLogDiscardURL, "mergeFrom:");
  }
  else if (v101)
  {
    -[GEOURLInfoSet setUgcLogDiscardURL:](self, "setUgcLogDiscardURL:");
  }
  batchReverseGeocoderPlaceRequestURL = self->_batchReverseGeocoderPlaceRequestURL;
  v103 = *((_QWORD *)v4 + 17);
  if (batchReverseGeocoderPlaceRequestURL)
  {
    if (v103)
      -[GEOURLInfo mergeFrom:](batchReverseGeocoderPlaceRequestURL, "mergeFrom:");
  }
  else if (v103)
  {
    -[GEOURLInfoSet setBatchReverseGeocoderPlaceRequestURL:](self, "setBatchReverseGeocoderPlaceRequestURL:");
  }
  pressureProbeDataURL = self->_pressureProbeDataURL;
  v105 = *((_QWORD *)v4 + 39);
  if (pressureProbeDataURL)
  {
    if (v105)
      -[GEOURLInfo mergeFrom:](pressureProbeDataURL, "mergeFrom:");
  }
  else if (v105)
  {
    -[GEOURLInfoSet setPressureProbeDataURL:](self, "setPressureProbeDataURL:");
  }
  poiBusynessActivityCollectionURL = self->_poiBusynessActivityCollectionURL;
  v107 = *((_QWORD *)v4 + 37);
  if (poiBusynessActivityCollectionURL)
  {
    if (v107)
      -[GEOURLInfo mergeFrom:](poiBusynessActivityCollectionURL, "mergeFrom:");
  }
  else if (v107)
  {
    -[GEOURLInfoSet setPoiBusynessActivityCollectionURL:](self, "setPoiBusynessActivityCollectionURL:");
  }
  rapWebBundleURL = self->_rapWebBundleURL;
  v109 = *((_QWORD *)v4 + 46);
  if (rapWebBundleURL)
  {
    if (v109)
      -[GEOURLInfo mergeFrom:](rapWebBundleURL, "mergeFrom:");
  }
  else if (v109)
  {
    -[GEOURLInfoSet setRapWebBundleURL:](self, "setRapWebBundleURL:");
  }
  networkSelectionHarvestURL = self->_networkSelectionHarvestURL;
  v111 = *((_QWORD *)v4 + 33);
  if (networkSelectionHarvestURL)
  {
    if (v111)
      -[GEOURLInfo mergeFrom:](networkSelectionHarvestURL, "mergeFrom:");
  }
  else if (v111)
  {
    -[GEOURLInfoSet setNetworkSelectionHarvestURL:](self, "setNetworkSelectionHarvestURL:");
  }
  offlineDataBatchListURL = self->_offlineDataBatchListURL;
  v113 = *((_QWORD *)v4 + 34);
  if (offlineDataBatchListURL)
  {
    if (v113)
      -[GEOURLInfo mergeFrom:](offlineDataBatchListURL, "mergeFrom:");
  }
  else if (v113)
  {
    -[GEOURLInfoSet setOfflineDataBatchListURL:](self, "setOfflineDataBatchListURL:");
  }
  offlineDataSizeURL = self->_offlineDataSizeURL;
  v115 = *((_QWORD *)v4 + 36);
  if (offlineDataSizeURL)
  {
    if (v115)
      -[GEOURLInfo mergeFrom:](offlineDataSizeURL, "mergeFrom:");
  }
  else if (v115)
  {
    -[GEOURLInfoSet setOfflineDataSizeURL:](self, "setOfflineDataSizeURL:");
  }
  offlineDataDownloadBaseURL = self->_offlineDataDownloadBaseURL;
  v117 = *((_QWORD *)v4 + 35);
  if (offlineDataDownloadBaseURL)
  {
    if (v117)
      -[GEOURLInfo mergeFrom:](offlineDataDownloadBaseURL, "mergeFrom:");
  }
  else if (v117)
  {
    -[GEOURLInfoSet setOfflineDataDownloadBaseURL:](self, "setOfflineDataDownloadBaseURL:");
  }
  bcxDispatcherURL = self->_bcxDispatcherURL;
  v119 = *((_QWORD *)v4 + 20);
  if (bcxDispatcherURL)
  {
    if (v119)
      -[GEOURLInfo mergeFrom:](bcxDispatcherURL, "mergeFrom:");
  }
  else if (v119)
  {
    -[GEOURLInfoSet setBcxDispatcherURL:](self, "setBcxDispatcherURL:");
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOURLInfoSetReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_1415);
      objc_sync_exit(v5);

    }
  }
  os_unfair_lock_unlock(p_readerLock);
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_readerLock;
  PBUnknownFields *unknownFields;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x400000000000002uLL;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOURLInfoSet readAll:](self, "readAll:", 0);
    -[GEOURLInfo clearUnknownFields:](self->_resourcesURL, "clearUnknownFields:", 1);
    -[GEOURLInfo clearUnknownFields:](self->_searchAttributionManifestURL, "clearUnknownFields:", 1);
    -[GEOURLInfo clearUnknownFields:](self->_directionsURL, "clearUnknownFields:", 1);
    -[GEOURLInfo clearUnknownFields:](self->_etaURL, "clearUnknownFields:", 1);
    -[GEOURLInfo clearUnknownFields:](self->_batchReverseGeocoderURL, "clearUnknownFields:", 1);
    -[GEOURLInfo clearUnknownFields:](self->_simpleETAURL, "clearUnknownFields:", 1);
    -[GEOURLInfo clearUnknownFields:](self->_addressCorrectionInitURL, "clearUnknownFields:", 1);
    -[GEOURLInfo clearUnknownFields:](self->_addressCorrectionUpdateURL, "clearUnknownFields:", 1);
    -[GEOURLInfo clearUnknownFields:](self->_polyLocationShiftURL, "clearUnknownFields:", 1);
    -[GEOURLInfo clearUnknownFields:](self->_problemSubmissionURL, "clearUnknownFields:", 1);
    -[GEOURLInfo clearUnknownFields:](self->_problemStatusURL, "clearUnknownFields:", 1);
    -[GEOURLInfo clearUnknownFields:](self->_reverseGeocoderVersionsURL, "clearUnknownFields:", 1);
    -[GEOURLInfo clearUnknownFields:](self->_problemCategoriesURL, "clearUnknownFields:", 1);
    -[GEOURLInfo clearUnknownFields:](self->_announcementsURL, "clearUnknownFields:", 1);
    -[GEOURLInfo clearUnknownFields:](self->_dispatcherURL, "clearUnknownFields:", 1);
    -[GEOURLInfo clearUnknownFields:](self->_problemOptInURL, "clearUnknownFields:", 1);
    -[GEOURLInfo clearUnknownFields:](self->_abExperimentURL, "clearUnknownFields:", 1);
    -[GEOURLInfo clearUnknownFields:](self->_businessPortalBaseURL, "clearUnknownFields:", 1);
    -[GEOURLInfo clearUnknownFields:](self->_logMessageUsageURL, "clearUnknownFields:", 1);
    -[GEOURLInfo clearUnknownFields:](self->_spatialLookupURL, "clearUnknownFields:", 1);
    -[GEOURLInfo clearUnknownFields:](self->_realtimeTrafficProbeURL, "clearUnknownFields:", 1);
    -[GEOURLInfo clearUnknownFields:](self->_batchTrafficProbeURL, "clearUnknownFields:", 1);
    -[GEOURLInfo clearUnknownFields:](self->_proactiveRoutingURL, "clearUnknownFields:", 1);
    -[GEOURLInfo clearUnknownFields:](self->_logMessageUsageV3URL, "clearUnknownFields:", 1);
    -[GEOURLInfo clearUnknownFields:](self->_backgroundDispatcherURL, "clearUnknownFields:", 1);
    -[GEOURLInfo clearUnknownFields:](self->_bluePOIDispatcherURL, "clearUnknownFields:", 1);
    -[GEOURLInfo clearUnknownFields:](self->_backgroundRevGeoURL, "clearUnknownFields:", 1);
    -[GEOURLInfo clearUnknownFields:](self->_wifiConnectionQualityProbeURL, "clearUnknownFields:", 1);
    -[GEOURLInfo clearUnknownFields:](self->_muninBaseURL, "clearUnknownFields:", 1);
    -[GEOURLInfo clearUnknownFields:](self->_authProxyURL, "clearUnknownFields:", 1);
    -[GEOURLInfo clearUnknownFields:](self->_wifiQualityURL, "clearUnknownFields:", 1);
    -[GEOURLInfo clearUnknownFields:](self->_feedbackSubmissionURL, "clearUnknownFields:", 1);
    -[GEOURLInfo clearUnknownFields:](self->_feedbackLookupURL, "clearUnknownFields:", 1);
    -[GEOURLInfo clearUnknownFields:](self->_junctionImageServiceURL, "clearUnknownFields:", 1);
    -[GEOURLInfo clearUnknownFields:](self->_analyticsCohortSessionURL, "clearUnknownFields:", 1);
    -[GEOURLInfo clearUnknownFields:](self->_analyticsLongSessionURL, "clearUnknownFields:", 1);
    -[GEOURLInfo clearUnknownFields:](self->_analyticsShortSessionURL, "clearUnknownFields:", 1);
    -[GEOURLInfo clearUnknownFields:](self->_analyticsSessionlessURL, "clearUnknownFields:", 1);
    -[GEOURLInfo clearUnknownFields:](self->_webModuleBaseURL, "clearUnknownFields:", 1);
    -[GEOURLInfo clearUnknownFields:](self->_wifiQualityTileURL, "clearUnknownFields:", 1);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = self->_alternateResourcesURLs;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "clearUnknownFields:", 1, (_QWORD)v12);
        }
        while (v9 != v11);
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

    -[GEOURLInfo clearUnknownFields:](self->_tokenAuthenticationURL, "clearUnknownFields:", 1);
    -[GEOURLInfo clearUnknownFields:](self->_authenticatedClientFeatureFlagURL, "clearUnknownFields:", 1);
    -[GEOURLInfo clearUnknownFields:](self->_addressCorrectionTaggedLocationURL, "clearUnknownFields:", 1);
    -[GEOURLInfo clearUnknownFields:](self->_proactiveAppClipURL, "clearUnknownFields:", 1);
    -[GEOURLInfo clearUnknownFields:](self->_enrichmentSubmissionURL, "clearUnknownFields:", 1);
    -[GEOURLInfo clearUnknownFields:](self->_ugcLogDiscardURL, "clearUnknownFields:", 1);
    -[GEOURLInfo clearUnknownFields:](self->_batchReverseGeocoderPlaceRequestURL, "clearUnknownFields:", 1);
    -[GEOURLInfo clearUnknownFields:](self->_pressureProbeDataURL, "clearUnknownFields:", 1);
    -[GEOURLInfo clearUnknownFields:](self->_poiBusynessActivityCollectionURL, "clearUnknownFields:", 1);
    -[GEOURLInfo clearUnknownFields:](self->_rapWebBundleURL, "clearUnknownFields:", 1);
    -[GEOURLInfo clearUnknownFields:](self->_networkSelectionHarvestURL, "clearUnknownFields:", 1);
    -[GEOURLInfo clearUnknownFields:](self->_offlineDataBatchListURL, "clearUnknownFields:", 1);
    -[GEOURLInfo clearUnknownFields:](self->_offlineDataSizeURL, "clearUnknownFields:", 1);
    -[GEOURLInfo clearUnknownFields:](self->_offlineDataDownloadBaseURL, "clearUnknownFields:", 1);
    -[GEOURLInfo clearUnknownFields:](self->_bcxDispatcherURL, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wifiQualityURL, 0);
  objc_storeStrong((id *)&self->_wifiQualityTileURL, 0);
  objc_storeStrong((id *)&self->_wifiConnectionQualityProbeURL, 0);
  objc_storeStrong((id *)&self->_webModuleBaseURL, 0);
  objc_storeStrong((id *)&self->_ugcLogDiscardURL, 0);
  objc_storeStrong((id *)&self->_tokenAuthenticationURL, 0);
  objc_storeStrong((id *)&self->_spatialLookupURL, 0);
  objc_storeStrong((id *)&self->_simpleETAURL, 0);
  objc_storeStrong((id *)&self->_searchAttributionManifestURL, 0);
  objc_storeStrong((id *)&self->_reverseGeocoderVersionsURL, 0);
  objc_storeStrong((id *)&self->_resourcesURL, 0);
  objc_storeStrong((id *)&self->_realtimeTrafficProbeURL, 0);
  objc_storeStrong((id *)&self->_rapWebBundleURL, 0);
  objc_storeStrong((id *)&self->_problemSubmissionURL, 0);
  objc_storeStrong((id *)&self->_problemStatusURL, 0);
  objc_storeStrong((id *)&self->_problemOptInURL, 0);
  objc_storeStrong((id *)&self->_problemCategoriesURL, 0);
  objc_storeStrong((id *)&self->_proactiveRoutingURL, 0);
  objc_storeStrong((id *)&self->_proactiveAppClipURL, 0);
  objc_storeStrong((id *)&self->_pressureProbeDataURL, 0);
  objc_storeStrong((id *)&self->_polyLocationShiftURL, 0);
  objc_storeStrong((id *)&self->_poiBusynessActivityCollectionURL, 0);
  objc_storeStrong((id *)&self->_offlineDataSizeURL, 0);
  objc_storeStrong((id *)&self->_offlineDataDownloadBaseURL, 0);
  objc_storeStrong((id *)&self->_offlineDataBatchListURL, 0);
  objc_storeStrong((id *)&self->_networkSelectionHarvestURL, 0);
  objc_storeStrong((id *)&self->_muninBaseURL, 0);
  objc_storeStrong((id *)&self->_logMessageUsageV3URL, 0);
  objc_storeStrong((id *)&self->_logMessageUsageURL, 0);
  objc_storeStrong((id *)&self->_junctionImageServiceURL, 0);
  objc_storeStrong((id *)&self->_feedbackSubmissionURL, 0);
  objc_storeStrong((id *)&self->_feedbackLookupURL, 0);
  objc_storeStrong((id *)&self->_etaURL, 0);
  objc_storeStrong((id *)&self->_enrichmentSubmissionURL, 0);
  objc_storeStrong((id *)&self->_dispatcherURL, 0);
  objc_storeStrong((id *)&self->_directionsURL, 0);
  objc_storeStrong((id *)&self->_businessPortalBaseURL, 0);
  objc_storeStrong((id *)&self->_bluePOIDispatcherURL, 0);
  objc_storeStrong((id *)&self->_bcxDispatcherURL, 0);
  objc_storeStrong((id *)&self->_batchTrafficProbeURL, 0);
  objc_storeStrong((id *)&self->_batchReverseGeocoderURL, 0);
  objc_storeStrong((id *)&self->_batchReverseGeocoderPlaceRequestURL, 0);
  objc_storeStrong((id *)&self->_backgroundRevGeoURL, 0);
  objc_storeStrong((id *)&self->_backgroundDispatcherURL, 0);
  objc_storeStrong((id *)&self->_authenticatedClientFeatureFlagURL, 0);
  objc_storeStrong((id *)&self->_authProxyURL, 0);
  objc_storeStrong((id *)&self->_announcementsURL, 0);
  objc_storeStrong((id *)&self->_analyticsShortSessionURL, 0);
  objc_storeStrong((id *)&self->_analyticsSessionlessURL, 0);
  objc_storeStrong((id *)&self->_analyticsLongSessionURL, 0);
  objc_storeStrong((id *)&self->_analyticsCohortSessionURL, 0);
  objc_storeStrong((id *)&self->_alternateResourcesURLs, 0);
  objc_storeStrong((id *)&self->_addressCorrectionUpdateURL, 0);
  objc_storeStrong((id *)&self->_addressCorrectionTaggedLocationURL, 0);
  objc_storeStrong((id *)&self->_addressCorrectionInitURL, 0);
  objc_storeStrong((id *)&self->_abExperimentURL, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
