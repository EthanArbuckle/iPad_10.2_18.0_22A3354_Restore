@implementation MKPOIEnrichmentAvailibility

+ (BOOL)shouldShowAppleRatingsForMapItem:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "_geoMapItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_hasAppleRatings");

  return v4;
}

+ (BOOL)shouldShowMorePhotosGalleryForMapItem:(id)a3
{
  return 1;
}

+ (BOOL)shouldShowCallToActionForMapItem:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  if (MapsFeature_IsEnabled_LagunaBeach())
    v5 = objc_msgSend(a1, "_shouldAllowUserToAddContributionsForMapItem:", v4);
  else
    v5 = 0;

  return v5;
}

+ (BOOL)shouldShowCallToActionForMapItem:(id)a3 options:(unint64_t)a4
{
  if ((a4 & 0xA0000000) == 0x20000000)
    return objc_msgSend(a1, "shouldShowCallToActionForMapItem:", a3);
  else
    return 0;
}

+ (BOOL)shouldShowRatingsCallToActionForMapItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  objc_msgSend(v4, "_geoMapItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_placeQuestionnaire");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "canCollectRatings")
    && (objc_msgSend(a1, "shouldShowCallToActionForMapItem:", v4) & 1) != 0;

  return v7;
}

+ (BOOL)shouldShowPhotosCallToActionForMapItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  objc_msgSend(v4, "_geoMapItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_placeQuestionnaire");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "canCollectPhotos")
    && (objc_msgSend(a1, "shouldShowCallToActionForMapItem:", v4) & 1) != 0;

  return v7;
}

+ (BOOL)shouldShowAddPhotoButtonsOnSingleFullScreenPhotoViewerForMapItem:(id)a3 photoAttribution:(id)a4
{
  id v5;
  char v6;

  v5 = a3;
  if (MapsFeature_IsEnabled_LagunaBeach() && GEOConfigGetBOOL())
    v6 = objc_msgSend(a1, "shouldShowPhotosCallToActionForMapItem:", v5);
  else
    v6 = 0;

  return v6;
}

+ (BOOL)shouldShowAddPhotoButtonOnEndOfPhotoSliderForMapItem:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  if (MapsFeature_IsEnabled_LagunaBeach() && GEOConfigGetBOOL())
    v5 = objc_msgSend(a1, "shouldShowPhotosCallToActionForMapItem:", v4);
  else
    v5 = 0;

  return v5;
}

+ (BOOL)shouldShowRatingInfoCallToActionOnPlaceCardHeaderForMapItem:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  if (MapsFeature_IsEnabled_LagunaBeach()
    && objc_msgSend(a1, "_isMapsApplication")
    && GEOCanUserMakeLagunaBeachContributions()
    && GEODoesUserHaveValidAccountForMakingContributions())
  {
    v5 = objc_msgSend(a1, "shouldShowAppleRatingsForMapItem:", v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (BOOL)shouldShowAddPhotoButtonOnMorePhotosGalleryForMapItem:(id)a3 usingAttributionsByProviderIds:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  char v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (MapsFeature_IsEnabled_LagunaBeach() && GEOConfigGetBOOL())
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(v7, "allValues", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          if ((objc_msgSend(v13, "isUserSubmitted") & 1) == 0 && !objc_msgSend(v13, "isBusinessOwned"))
          {

            goto LABEL_14;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v10)
          continue;
        break;
      }
    }

    v14 = objc_msgSend(a1, "shouldShowPhotosCallToActionForMapItem:", v6);
  }
  else
  {
LABEL_14:
    v14 = 0;
  }

  return v14;
}

+ (BOOL)shouldShowReportAnIssueOnPhotoGalleryForMapItem:(id)a3 photoAttribution:(id)a4
{
  id v5;
  char v6;
  char v7;

  v5 = a4;
  if (_MKRAPIsAvailable())
    v6 = objc_msgSend(v5, "supportsReportingIssue");
  else
    v6 = 0;
  v7 = v6 & objc_msgSend(a1, "_isMapsApplication");

  return v7;
}

+ (BOOL)_shouldAllowUserToAddContributionsForMapItem:(id)a3
{
  void *v3;
  void *v4;
  int v5;

  objc_msgSend(a3, "_geoMapItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_placeQuestionnaire");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "canShowCallToAction");

  if (v5 && GEOCanUserMakeLagunaBeachContributions())
    return GEODoesUserHaveValidAccountForMakingContributions();
  else
    return 0;
}

+ (BOOL)_isMapsApplication
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D26D08]);

  return v4;
}

@end
