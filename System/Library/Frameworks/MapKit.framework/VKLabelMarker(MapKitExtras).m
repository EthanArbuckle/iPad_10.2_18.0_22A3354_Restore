@implementation VKLabelMarker(MapKitExtras)

- (BOOL)_mapkit_hasMUID
{
  return (objc_msgSend(a1, "hasBusinessID") & 1) != 0 || objc_msgSend(a1, "featureID") != 0;
}

- (uint64_t)_mapkit_muid
{
  if (objc_msgSend(a1, "hasBusinessID"))
    return objc_msgSend(a1, "businessID");
  else
    return objc_msgSend(a1, "featureID");
}

- (MKMapItemIdentifier)identifier
{
  double v2;
  double v3;
  double v4;

  objc_msgSend(a1, "coordinate");
  v3 = v2;
  objc_msgSend(a1, "coordinate");
  return -[MKMapItemIdentifier initWithMUID:resultProviderID:coordinate:]([MKMapItemIdentifier alloc], "initWithMUID:resultProviderID:coordinate:", objc_msgSend(a1, "_mapkit_muid"), 0, v3, v4);
}

- (MKMapItemIdentifier)flyoverTourIdentifier
{
  double v2;
  double v3;
  double v4;
  MKMapItemIdentifier *v5;

  if (objc_msgSend(a1, "isFlyoverTour"))
  {
    objc_msgSend(a1, "coordinate");
    v3 = v2;
    objc_msgSend(a1, "coordinate");
    v5 = -[MKMapItemIdentifier initWithMUID:resultProviderID:coordinate:]([MKMapItemIdentifier alloc], "initWithMUID:resultProviderID:coordinate:", objc_msgSend(a1, "featureID"), 0, v3, v4);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)_annotationTitle
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a1, "featureType") == 6
    && (objc_msgSend(a1, "relatedTexts"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        v3 = objc_msgSend(v2, "count"),
        v2,
        v3))
  {
    objc_msgSend(a1, "relatedTexts");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_mapkit_componentsJoinedInCommaDelimitedList");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return v5;
  }
  else if (objc_msgSend(a1, "isTransitLine"))
  {
    objc_msgSend(a1, "relatedSubTexts");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(a1, "countFeatureIDs");
    v9 = (void *)v8;
    if (v8)
    {
      if (v8 == 1)
      {
        objc_msgSend(v7, "firstObject");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        _MKLocalizedStringFromThisBundle(CFSTR("%d lines"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v10, v9);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    if (!objc_msgSend(v9, "length"))
    {
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      objc_msgSend(a1, "imageKeys");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v24;
LABEL_13:
        v15 = 0;
        v16 = v9;
        while (1)
        {
          if (*(_QWORD *)v24 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v15), "shieldText");
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v9, "length"))
            break;
          ++v15;
          v16 = v9;
          if (v13 == v15)
          {
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
            if (v13)
              goto LABEL_13;
            break;
          }
        }
      }

    }
    if (!objc_msgSend(v9, "length"))
    {
      objc_msgSend(a1, "transitSystems");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "count");

      if (v18 == 1)
      {
        objc_msgSend(a1, "transitSystems");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "firstObject");
        v20 = objc_claimAutoreleasedReturnValue();

        v9 = (void *)v20;
      }
    }
    if (!objc_msgSend(v9, "length"))
    {
      objc_msgSend(a1, "text");
      v21 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v21;
    }
    v22 = v9;

    return v22;
  }
  else
  {
    objc_msgSend(a1, "text");
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (uint64_t)suppressCallout
{
  void *v1;
  uint64_t v2;

  objc_getAssociatedObject(a1, &_MKLabelMarkerShowCallout);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (void)setSuppressCallout:()MapKitExtras
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, &_MKLabelMarkerShowCallout, v2, (void *)0x303);

}

@end
