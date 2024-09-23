@implementation _MKURLHandler

+ (BOOL)canHandleURL:(id)a3
{
  return +[_MKURLHandler _MKGetURLSchemeTypeFor:](_MKURLHandler, "_MKGetURLSchemeTypeFor:", a3) != 0;
}

+ (unsigned)_MKGetURLSchemeTypeFor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  char v19;
  int v21;
  void *v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "scheme");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lowercaseString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("maps")) & 1) != 0)
    {
LABEL_3:
      v8 = 1;
LABEL_20:

      goto LABEL_21;
    }
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("map")) & 1) != 0)
    {
      v8 = 2;
      goto LABEL_20;
    }
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("mapitem")) & 1) != 0)
    {
      v8 = 3;
      goto LABEL_20;
    }
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("x-maps-mapitemhandles")) & 1) != 0)
    {
      v8 = 4;
      goto LABEL_20;
    }
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("http")) & 1) != 0
      || objc_msgSend(v7, "isEqualToString:", CFSTR("https")))
    {
      objc_msgSend(v5, "host");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lowercaseString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("maps.apple.com"));

      if ((v13 & 1) != 0)
        goto LABEL_3;
      objc_msgSend(v5, "host");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "lowercaseString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("collections.apple.com"));

      if ((v16 & 1) != 0
        || (objc_msgSend(v5, "host"),
            v17 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v17, "lowercaseString"),
            v18 = (void *)objc_claimAutoreleasedReturnValue(),
            v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("guides.apple.com")),
            v18,
            v17,
            (v19 & 1) != 0))
      {
        v8 = 5;
        goto LABEL_20;
      }
    }
    v8 = 0;
    goto LABEL_20;
  }
  GEOFindOrCreateLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138543618;
    v22 = v10;
    v23 = 2082;
    v24 = "nil == url";
    _os_log_impl(&dword_18B0B0000, v9, OS_LOG_TYPE_ERROR, "%{public}@ forbids: %{public}s", (uint8_t *)&v21, 0x16u);

  }
  v8 = 0;
LABEL_21:

  return v8;
}

- (BOOL)handleURL:(id)a3 sourceApplication:(id)a4 context:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  BOOL v14;
  void *v15;
  BOOL v16;
  NSObject *v17;
  void *v18;
  int v20;
  id v21;
  __int16 v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  GEOFindOrCreateLog();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v9)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v20 = 138477827;
      v21 = v9;
      _os_log_impl(&dword_18B0B0000, v13, OS_LOG_TYPE_DEBUG, "Handling URL: '%{private}@'", (uint8_t *)&v20, 0xCu);
    }

    switch(+[_MKURLHandler _MKGetURLSchemeTypeFor:](_MKURLHandler, "_MKGetURLSchemeTypeFor:", v9))
    {
      case 0u:
        GEOFindOrCreateLog();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v9, "scheme");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = 138543362;
          v21 = v18;
          _os_log_impl(&dword_18B0B0000, v17, OS_LOG_TYPE_ERROR, "Scheme '%{public}@' is not supported.", (uint8_t *)&v20, 0xCu);

        }
        goto LABEL_9;
      case 1u:
      case 5u:
        v14 = -[_MKURLHandler _handleMapsURL:sourceApplication:context:](self, "_handleMapsURL:sourceApplication:context:", v9, v10, v11);
        break;
      case 2u:
        v14 = -[_MKURLHandler _handleSharedMapURL:sourceApplication:context:](self, "_handleSharedMapURL:sourceApplication:context:", v9, v10, v11);
        break;
      case 3u:
        v14 = -[_MKURLHandler _handleMapItemURL:sourceApplication:context:](self, "_handleMapItemURL:sourceApplication:context:", v9, v10, v11);
        break;
      case 4u:
        v14 = -[_MKURLHandler _handleMapItemHandlesURL:sourceApplication:context:](self, "_handleMapItemHandlesURL:sourceApplication:context:", v9, v10, v11);
        break;
      default:
        goto LABEL_9;
    }
    v16 = v14;
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543618;
      v21 = v15;
      v22 = 2082;
      v23 = "nil == url";
      _os_log_impl(&dword_18B0B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@ forbids: %{public}s", (uint8_t *)&v20, 0x16u);

    }
LABEL_9:
    v16 = 0;
  }

  return v16;
}

- (void)_treatMapTypeFrom:(id)a3
{
  id v5;
  id WeakRetained;
  unint64_t v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

    if (WeakRetained)
    {
      v7 = objc_msgSend(v5, "mapType");
      if (v7 < 5 || v7 == 108 || v7 == 104)
      {
        v8 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v8, "URLHandler:setMapType:", self, objc_msgSend(v5, "mapType"));

      }
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543618;
      v12 = v10;
      v13 = 2082;
      v14 = "nil == parsed";
      _os_log_impl(&dword_18B0B0000, v9, OS_LOG_TYPE_ERROR, "%{public}@ forbids: %{public}s", (uint8_t *)&v11, 0x16u);

    }
  }

}

- (BOOL)_treatPinPositionFrom:(id)a3
{
  id v5;
  id WeakRetained;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  char v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  char v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  char v26;
  double v27;
  double v28;
  double v29;
  double v30;
  _BOOL4 v31;
  _BOOL4 v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  char v37;
  id v38;
  char v39;
  id v40;
  char v41;
  id v42;
  char v43;
  id v44;
  void *v45;
  void *v46;
  id v47;
  double v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  id v56;
  char v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  char v63;
  id v64;
  char v65;
  id v66;
  char v67;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  char v73;
  void *v74;
  void *v75;
  void *v76;
  _QWORD v77[4];
  id v78;
  _MKURLHandler *v79;
  __int128 v80;
  BOOL v81;
  _QWORD v82[4];
  id v83;
  _MKURLHandler *v84;
  __int128 v85;
  BOOL v86;
  _BYTE buf[22];
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v12;
      *(_WORD *)&buf[12] = 2082;
      *(_QWORD *)&buf[14] = "nil == parsed";
      _os_log_impl(&dword_18B0B0000, v7, OS_LOG_TYPE_ERROR, "%{public}@ forbids: %{public}s", buf, 0x16u);

    }
    v11 = 0;
    goto LABEL_57;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    if (!-[_MKURLHandler _treatRegionFrom:](self, "_treatRegionFrom:", v5))
      -[_MKURLHandler _treatSearchRegionFrom:](self, "_treatSearchRegionFrom:", v5);
    objc_msgSend(v5, "contentProvider");
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contentProviderID");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v7 && v8)
    {
      v10 = objc_loadWeakRetained((id *)&self->_delegate);
      v11 = objc_msgSend(v10, "URLHandler:showExternalBusinessID:ofContentProvider:", self, v9, v7);

LABEL_56:
LABEL_57:

      goto LABEL_58;
    }
    v13 = objc_msgSend(v5, "searchUID");
    v14 = objc_msgSend(v5, "searchProviderID");
    if (v13)
    {
      v15 = v14;
      objc_msgSend(v5, "directionsDestinationAddressString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "length");

      if (!v17)
      {
        v47 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v5, "centerCoordinate");
        v49 = v48;
        v51 = v50;
        objc_msgSend(v5, "searchQuery");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v47, "URLHandler:showMUID:resultProviderID:coordinate:query:", self, v13, v15, v52, v49, v51);

        goto LABEL_56;
      }
    }
    objc_msgSend(v5, "cnContactIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cnAddressIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "length"))
    {
      if (objc_msgSend(v19, "length"))
      {
        v20 = objc_loadWeakRetained((id *)&self->_delegate);
        v21 = objc_msgSend(v20, "URLHandler:showAddressByCNContactIdentifier:addressIdentifier:", self, v18, v19);

        if ((v21 & 1) != 0)
        {
          v11 = 1;
LABEL_55:

          goto LABEL_56;
        }
      }
    }
    v76 = v18;
    objc_msgSend(v5, "abRecordID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "abAddressID");
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)v23;
    if (v22)
    {
      if (v23)
      {
        v25 = objc_loadWeakRetained((id *)&self->_delegate);
        v26 = objc_msgSend(v25, "URLHandler:showAddressByRecordID:addressID:", self, v22, v24);

        if ((v26 & 1) != 0)
        {
          v11 = 1;
          v18 = v76;
LABEL_54:

          goto LABEL_55;
        }
      }
    }
    v74 = v22;
    v75 = v19;
    objc_msgSend(v5, "centerCoordinate");
    v28 = v27;
    v30 = v29;
    *(double *)buf = v27;
    *(double *)&buf[8] = v29;
    v31 = v29 >= -180.0;
    if (v29 > 180.0)
      v31 = 0;
    if (v27 < -90.0)
      v31 = 0;
    v32 = v27 <= 90.0 && v31;
    objc_msgSend(v5, "addressString");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "length");

    objc_msgSend(v5, "searchQuery");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "length");

    v37 = !v32;
    if (v32 && v34 && v36)
    {
      v38 = objc_loadWeakRetained((id *)&self->_delegate);
      v39 = objc_opt_respondsToSelector();

      if ((v39 & 1) != 0)
      {
        v40 = objc_loadWeakRetained((id *)&self->_delegate);
        v41 = objc_msgSend(v40, "URLHandlerShouldPerformRefinementRequest:", self);

        if ((v41 & 1) == 0)
        {
          v42 = objc_loadWeakRetained((id *)&self->_delegate);
          v43 = objc_opt_respondsToSelector();

          if ((v43 & 1) != 0)
          {
            v44 = objc_loadWeakRetained((id *)&self->_delegate);
            objc_msgSend(v5, "addressString");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "searchQuery");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = objc_msgSend(v44, "URLHandler:showAddress:label:at:", self, v45, v46, v28, v30);

LABEL_47:
            v18 = v76;
LABEL_53:
            v22 = v74;
            v19 = v75;
            goto LABEL_54;
          }
        }
      }
      +[MKMapService sharedService](MKMapService, "sharedService");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addressString");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "searchQuery");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "ticketForPlaceRefinementRequestWithCoordinate:addressLine:placeName:traits:", buf, v59, v60, 0);
      v61 = (void *)objc_claimAutoreleasedReturnValue();

      v82[0] = MEMORY[0x1E0C809B0];
      v82[1] = 3221225472;
      v82[2] = __39___MKURLHandler__treatPinPositionFrom___block_invoke;
      v82[3] = &unk_1E20D9540;
      v85 = *(_OWORD *)buf;
      v83 = v5;
      v84 = self;
      v86 = v32;
      objc_msgSend(v61, "submitWithHandler:networkActivity:", v82, 0);

    }
    else
    {
      if (!v36)
        v37 = 1;
      if ((v37 & 1) == 0)
      {
        v62 = objc_loadWeakRetained((id *)&self->_delegate);
        v63 = objc_opt_respondsToSelector();

        v18 = v76;
        if ((v63 & 1) != 0
          && (v64 = objc_loadWeakRetained((id *)&self->_delegate),
              v65 = objc_msgSend(v64, "URLHandlerShouldPerformReverseGeocoding:", self),
              v64,
              (v65 & 1) == 0)
          && (v66 = objc_loadWeakRetained((id *)&self->_delegate),
              v67 = objc_opt_respondsToSelector(),
              v66,
              (v67 & 1) != 0))
        {
          v68 = objc_loadWeakRetained((id *)&self->_delegate);
          objc_msgSend(v5, "searchQuery");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v68, "URLHandler:showLabel:at:", self, v69, v28, v30);

        }
        else
        {
          +[MKMapService sharedService](MKMapService, "sharedService");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "ticketForReverseGeocodeCoordinate:traits:", 0, v28, v30);
          v71 = (void *)objc_claimAutoreleasedReturnValue();

          v77[0] = MEMORY[0x1E0C809B0];
          v77[1] = 3221225472;
          v77[2] = __39___MKURLHandler__treatPinPositionFrom___block_invoke_2;
          v77[3] = &unk_1E20D9540;
          v80 = *(_OWORD *)buf;
          v78 = v5;
          v79 = self;
          v81 = v32;
          objc_msgSend(v71, "submitWithHandler:networkActivity:", v77, 0);

          v11 = 1;
        }
        goto LABEL_53;
      }
      if (!v34)
        goto LABEL_61;
      v53 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v5, "addressString");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "searchQuery");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = objc_msgSend(v53, "URLHandler:showAddress:label:", self, v54, v55);

      if ((v73 & 1) == 0)
      {
LABEL_61:
        if (!v32
          || (v56 = objc_loadWeakRetained((id *)&self->_delegate),
              v57 = objc_msgSend(v56, "URLHandler:showMapWithoutPinAt:", self, v28, v30),
              v56,
              (v57 & 1) == 0))
        {
          v11 = 0;
          goto LABEL_47;
        }
      }
    }
    v11 = 1;
    goto LABEL_47;
  }
  v11 = 0;
LABEL_58:

  return v11;
}

- (void)_treatTrackingModeFrom:(id)a3
{
  id v5;
  id WeakRetained;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

    if (WeakRetained && objc_msgSend(v5, "trackingModeSpecified"))
    {
      v7 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v7, "URLHandler:setUserTrackingMode:", self, objc_msgSend(v5, "trackingMode"));

    }
  }
  else
  {
    GEOFindOrCreateLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v9;
      v12 = 2082;
      v13 = "nil == parsed";
      _os_log_impl(&dword_18B0B0000, v8, OS_LOG_TYPE_ERROR, "%{public}@ forbids: %{public}s", (uint8_t *)&v10, 0x16u);

    }
  }

}

- (BOOL)_treatNavigationDirectionsFrom:(id)a3
{
  id v5;
  id WeakRetained;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  char v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  char v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  id v36;
  void *v37;
  uint64_t v38;
  id *location;
  uint64_t v40;
  _MKURLHandler *v41;
  void *v42;
  void *v43;
  unsigned int v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t v49[128];
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  const char *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v51 = v26;
      v52 = 2082;
      v53 = "nil == parsed";
      _os_log_impl(&dword_18B0B0000, v7, OS_LOG_TYPE_ERROR, "%{public}@ forbids: %{public}s", buf, 0x16u);

    }
    v27 = 0;
    goto LABEL_36;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    objc_msgSend(v5, "directionsSourceAddressString");
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "directionsDestinationAddressStrings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v7 || objc_msgSend(v8, "count"))
    {
      v10 = objc_msgSend(v5, "transportType");
      if (v10)
        v11 = v10;
      else
        v11 = 0xFFFFFFFLL;
      objc_msgSend(v5, "label");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v5, "searchUID");
      v14 = objc_loadWeakRetained((id *)&self->_delegate);
      v15 = objc_opt_respondsToSelector();

      if ((v15 & 1) != 0)
      {
        v38 = v13;
        location = (id *)&self->_delegate;
        v40 = v11;
        v41 = self;
        v42 = v12;
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v9, "count"));
        v45 = 0u;
        v46 = 0u;
        v47 = 0u;
        v48 = 0u;
        v43 = v9;
        v17 = v9;
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v46;
          do
          {
            for (i = 0; i != v19; ++i)
            {
              if (*(_QWORD *)v46 != v20)
                objc_enumerationMutation(v17);
              v22 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i);
              v23 = objc_alloc_init(MEMORY[0x1E0C99E08]);
              objc_msgSend(v23, "setObject:forKeyedSubscript:", v22, CFSTR("address"));
              objc_msgSend(v16, "addObject:", v23);

            }
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
          }
          while (v19);
        }

        v12 = v42;
        if (v38)
        {
          v24 = objc_msgSend(v16, "count");
          if (v24)
          {
            objc_msgSend(v16, "lastObject");
            v25 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v25 = objc_opt_new();
          }
          v30 = (void *)v25;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v38);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "setObject:forKeyedSubscript:", v31, CFSTR("muid"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v5, "searchProviderID"));
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "setObject:forKeyedSubscript:", v32, CFSTR("providerID"));

          if (objc_msgSend(v42, "length"))
            objc_msgSend(v30, "setObject:forKeyedSubscript:", v42, CFSTR("label"));
          if (!v24)
            objc_msgSend(v16, "addObject:", v30);

        }
        v33 = objc_loadWeakRetained(location);
        v34 = (void *)objc_msgSend(v16, "copy");
        v27 = objc_msgSend(v33, "URLHandler:showDirectionsFrom:toDestinations:using:", v41, v7, v34, v40);

        v9 = v43;
      }
      else if (v13 || objc_msgSend(v12, "length"))
      {
        v44 = objc_msgSend(v5, "searchProviderID");
        v28 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v9, "lastObject");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v28, "URLHandler:showDirectionsFrom:to:using:muid:providerId:showLabel:", self, v7, v29, v11, v13, v44, v12);

      }
      else
      {
        v36 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v9, "lastObject");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v36, "URLHandler:showDirectionsFrom:to:using:", self, v7, v37, v11);

      }
    }
    else
    {
      v27 = 0;
    }

LABEL_36:
    goto LABEL_37;
  }
  v27 = 0;
LABEL_37:

  return v27;
}

- (BOOL)_treatRegionFrom:(id)a3
{
  id v5;
  id WeakRetained;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  NSObject *v21;
  void *v22;
  BOOL v23;
  id v25;
  float v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  char v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  float v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  float v61;
  double v62;
  void *v63;
  _MKURLHandler *v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  int v78;
  void *v79;
  __int16 v80;
  const char *v81;
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    GEOFindOrCreateLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = 138543618;
      v79 = v22;
      v80 = 2082;
      v81 = "nil == parsed";
LABEL_18:
      _os_log_impl(&dword_18B0B0000, v21, OS_LOG_TYPE_ERROR, "%{public}@ forbids: %{public}s", (uint8_t *)&v78, 0x16u);

    }
LABEL_19:

    goto LABEL_20;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (!WeakRetained)
  {
    GEOFindOrCreateLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = 138543618;
      v79 = v22;
      v80 = 2082;
      v81 = "nil == _delegate";
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  v7 = objc_loadWeakRetained((id *)&self->_delegate);

  if (v7)
  {
    objc_msgSend(v5, "centerCoordinate");
    if (v9 >= -180.0 && v9 <= 180.0 && v8 >= -90.0 && v8 <= 90.0)
    {
      objc_msgSend(v5, "cameraCenterBasedAltitude");
      if (v10 > 0.0)
      {
        objc_msgSend(v5, "rotation");
        if (v11 <= 0.01)
        {
          objc_msgSend(v5, "rotation");
          if (v12 >= -0.01)
          {
            objc_msgSend(v5, "tilt");
            if (v13 <= 0.01)
            {
              objc_msgSend(v5, "tilt");
              if (v14 >= -0.01)
              {
                v15 = objc_loadWeakRetained((id *)&self->_delegate);
                objc_msgSend(v5, "centerCoordinate");
                v53 = v52;
                v55 = v54;
                objc_msgSend(v5, "cameraCenterBasedAltitude");
                v38 = objc_msgSend(v15, "URLHandler:setRegionWithCenter:altitude:", self, v53, v55, v56);
                goto LABEL_36;
              }
            }
          }
        }
        v15 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v5, "centerCoordinate");
        v17 = v16;
        v19 = v18;
        objc_msgSend(v5, "cameraCenterBasedAltitude");
        goto LABEL_30;
      }
      objc_msgSend(v5, "zoomLevel");
      if (v26 >= 0.0)
      {
        objc_msgSend(v5, "rotation");
        if (v39 > 0.01
          || (objc_msgSend(v5, "rotation"), v40 < -0.01)
          || (objc_msgSend(v5, "tilt"), v41 > 0.01)
          || (objc_msgSend(v5, "tilt"), v42 < -0.01))
        {
          v15 = objc_loadWeakRetained((id *)&self->_delegate);
          objc_msgSend(v5, "centerCoordinate");
          v44 = v43;
          v46 = v45;
          objc_msgSend(v5, "zoomLevel");
          v48 = v47;
          objc_msgSend(v5, "rotation");
          v50 = v49;
          objc_msgSend(v5, "tilt");
          v38 = objc_msgSend(v15, "URLHandler:setRegionWithCenterAndCamera:zoomLevel:pitch:yaw:", self, v44, v46, v48, v50, v51);
          goto LABEL_36;
        }
        v15 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v5, "centerCoordinate");
        v58 = v57;
        v60 = v59;
        objc_msgSend(v5, "zoomLevel");
        v62 = v61;
        v63 = v15;
        v64 = self;
        v65 = v58;
        v66 = v60;
      }
      else
      {
        objc_msgSend(v5, "altitude");
        if (v27 > 0.01
          || (objc_msgSend(v5, "rotation"), v28 > 0.01)
          || (objc_msgSend(v5, "rotation"), v29 < -0.01)
          || (objc_msgSend(v5, "tilt"), v30 > 0.01)
          || (objc_msgSend(v5, "tilt"), v31 < -0.01))
        {
          v15 = objc_loadWeakRetained((id *)&self->_delegate);
          objc_msgSend(v5, "centerCoordinate");
          v17 = v32;
          v19 = v33;
          objc_msgSend(v5, "altitude");
LABEL_30:
          v34 = v20;
          objc_msgSend(v5, "rotation");
          v36 = v35;
          objc_msgSend(v5, "tilt");
          v38 = objc_msgSend(v15, "URLHandler:setRegionWithCenterAndCamera:altitude:pitch:yaw:", self, v17, v19, v34, v36, v37);
LABEL_36:
          v23 = v38;

          goto LABEL_21;
        }
        objc_msgSend(v5, "span");
        if (v67 >= 0.0 && v67 <= 180.0 && v68 >= 0.0 && v68 <= 360.0)
        {
          objc_msgSend(v5, "span");
          if (v69 > 0.0)
          {
            objc_msgSend(v5, "centerCoordinate");
            v71 = v70;
            v73 = v72;
            objc_msgSend(v5, "span");
            v75 = v74;
            v77 = v76;
            v15 = objc_loadWeakRetained((id *)&self->_delegate);
            v38 = objc_msgSend(v15, "URLHandler:setRegion:", self, v71, v73, v75, v77);
            goto LABEL_36;
          }
        }
        v15 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v5, "centerCoordinate");
        v62 = *(double *)&_MKURLHandlerDefaultZoomLevel;
        v63 = v15;
        v64 = self;
      }
      v38 = objc_msgSend(v63, "URLHandler:setRegionWithCenter:zoomLevel:", v64, v65, v66, v62);
      goto LABEL_36;
    }
    v25 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v25, "URLHandler:setRegion:", self, -180.0, -180.0, NAN, NAN);

  }
LABEL_20:
  v23 = 0;
LABEL_21:

  return v23;
}

- (BOOL)_treatSearchRegionFrom:(id)a3
{
  id v5;
  id WeakRetained;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  char v12;
  double v13;
  double v14;
  id v15;
  char v16;
  BOOL v17;
  NSObject *v18;
  void *v19;
  id v20;
  int v22;
  void *v23;
  __int16 v24;
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    GEOFindOrCreateLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543618;
      v23 = v19;
      v24 = 2082;
      v25 = "nil == parsed";
LABEL_23:
      _os_log_impl(&dword_18B0B0000, v18, OS_LOG_TYPE_ERROR, "%{public}@ forbids: %{public}s", (uint8_t *)&v22, 0x16u);

    }
LABEL_24:

    goto LABEL_25;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (!WeakRetained)
  {
    GEOFindOrCreateLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543618;
      v23 = v19;
      v24 = 2082;
      v25 = "nil == _delegate";
      goto LABEL_23;
    }
    goto LABEL_24;
  }
  objc_msgSend(v5, "searchRegion");
  if (v8 < -180.0
    || v8 > 180.0
    || v7 < -90.0
    || v7 > 90.0
    || v9 < 0.0
    || v9 > 180.0
    || v10 < 0.0
    || v10 > 360.0
    || (v11 = objc_loadWeakRetained((id *)&self->_delegate),
        objc_msgSend(v5, "searchRegion"),
        v12 = objc_msgSend(v11, "URLHandler:setRegion:", self),
        v11,
        (v12 & 1) == 0))
  {
    objc_msgSend(v5, "searchCoordinate");
    if (v14 < -180.0
      || v14 > 180.0
      || v13 < -90.0
      || v13 > 90.0
      || (v15 = objc_loadWeakRetained((id *)&self->_delegate),
          objc_msgSend(v5, "searchCoordinate"),
          v16 = objc_msgSend(v15, "URLHandler:setRegionWithCenter:", self),
          v15,
          (v16 & 1) == 0))
    {
      v20 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v20, "URLHandler:setRegion:", self, -180.0, -180.0, NAN, NAN);

LABEL_25:
      v17 = 0;
      goto LABEL_26;
    }
  }
  v17 = 1;
LABEL_26:

  return v17;
}

- (BOOL)_treatSearchFrom:(id)a3
{
  id v5;
  id WeakRetained;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  char v13;
  NSObject *v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    GEOFindOrCreateLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v15;
      v19 = 2082;
      v20 = "nil == parsed";
      _os_log_impl(&dword_18B0B0000, v14, OS_LOG_TYPE_ERROR, "%{public}@ forbids: %{public}s", (uint8_t *)&v17, 0x16u);

    }
    goto LABEL_8;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (!WeakRetained)
  {
LABEL_8:
    v13 = 0;
    goto LABEL_11;
  }
  objc_msgSend(v5, "searchQuery");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "searchCoordinate");
  if (v7)
  {
    v10 = v8;
    v11 = v9;
    -[_MKURLHandler _treatSearchRegionFrom:](self, "_treatSearchRegionFrom:", v5);
    v12 = objc_loadWeakRetained((id *)&self->_delegate);
    v13 = objc_msgSend(v12, "URLHandler:search:at:", self, v7, v10, v11);

  }
  else
  {
    v13 = 0;
  }

LABEL_11:
  return v13;
}

- (BOOL)_treatContentProvider:(id)a3
{
  void *v4;
  id WeakRetained;

  objc_msgSend(a3, "contentProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  LOBYTE(self) = objc_msgSend(WeakRetained, "URLHandler:setContentProvider:", self, v4);

  return (char)self;
}

- (void)_treatGenericOptionsFrom:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    -[_MKURLHandler _treatMapTypeFrom:](self, "_treatMapTypeFrom:", v5);
    -[_MKURLHandler _treatTrackingModeFrom:](self, "_treatTrackingModeFrom:", v5);
    -[_MKURLHandler _treatContentProvider:](self, "_treatContentProvider:", v5);
  }
  else
  {
    GEOFindOrCreateLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543618;
      v9 = v7;
      v10 = 2082;
      v11 = "nil == parsed";
      _os_log_impl(&dword_18B0B0000, v6, OS_LOG_TYPE_ERROR, "%{public}@ forbids: %{public}s", (uint8_t *)&v8, 0x16u);

    }
  }

}

- (BOOL)_treatFavoritesFrom:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (!v5)
  {
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v10;
      v14 = 2082;
      v15 = "nil == parsed";
      _os_log_impl(&dword_18B0B0000, v9, OS_LOG_TYPE_ERROR, "%{public}@ forbids: %{public}s", (uint8_t *)&v12, 0x16u);

    }
    goto LABEL_7;
  }
  if ((unint64_t)(objc_msgSend(v5, "favoritesType") - 1) > 1)
  {
LABEL_7:
    v8 = 0;
    goto LABEL_8;
  }
  -[_MKURLHandler delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "URLHandler:showFavoritesType:", self, objc_msgSend(v6, "favoritesType"));

LABEL_8:
  return v8;
}

- (BOOL)_treatTransitLineFrom:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  NSObject *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    -[_MKURLHandler _treatRegionFrom:](self, "_treatRegionFrom:", v5);
    v6 = objc_msgSend(v5, "lineMUID");
    objc_msgSend(v5, "lineName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6 && objc_msgSend(v7, "length"))
    {
      -[_MKURLHandler delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "URLHandler:showLineWithID:name:", self, v6, v8);

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v12;
      v16 = 2082;
      v17 = "nil == parsed";
      _os_log_impl(&dword_18B0B0000, v11, OS_LOG_TYPE_ERROR, "%{public}@ forbids: %{public}s", (uint8_t *)&v14, 0x16u);

    }
    v10 = 0;
  }

  return v10;
}

- (BOOL)_treatTesterFrom:(id)a3
{
  id v5;
  void *v6;
  id WeakRetained;
  char v8;
  id v9;
  BOOL v10;
  NSObject *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (!v5)
  {
    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v12;
      v16 = 2082;
      v17 = "nil == parsed";
      _os_log_impl(&dword_18B0B0000, v11, OS_LOG_TYPE_ERROR, "%{public}@ forbids: %{public}s", (uint8_t *)&v14, 0x16u);

    }
    goto LABEL_8;
  }
  if (!objc_msgSend(v5, "tester")
    || (WeakRetained = objc_loadWeakRetained((id *)&self->_delegate),
        v8 = objc_opt_respondsToSelector(),
        WeakRetained,
        (v8 & 1) == 0))
  {
LABEL_8:
    v10 = 0;
    goto LABEL_9;
  }
  v9 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v9, "URLHandler:launchIntoTesterWithParam:", self, 0);

  v10 = 1;
LABEL_9:

  return v10;
}

- (BOOL)_treatMuninViewStateFrom:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id WeakRetained;
  void *v9;
  BOOL v10;
  NSObject *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (!v5)
  {
    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v12;
      v16 = 2082;
      v17 = "nil == parsed";
      _os_log_impl(&dword_18B0B0000, v11, OS_LOG_TYPE_ERROR, "%{public}@ forbids: %{public}s", (uint8_t *)&v14, 0x16u);

    }
    goto LABEL_7;
  }
  objc_msgSend(v5, "muninViewState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
LABEL_7:
    v10 = 0;
    goto LABEL_8;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v6, "muninViewState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "URLHandler:enterLookAroundWithViewState:", self, v9);

  v10 = 1;
LABEL_8:

  return v10;
}

- (BOOL)_treatOfflineDownloadFrom:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  char v11;
  NSObject *v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (!v5)
  {
    GEOFindOrCreateLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v13;
      v17 = 2082;
      v18 = "nil == parsed";
      _os_log_impl(&dword_18B0B0000, v12, OS_LOG_TYPE_ERROR, "%{public}@ forbids: %{public}s", (uint8_t *)&v15, 0x16u);

    }
    goto LABEL_7;
  }
  objc_msgSend(v5, "offlineDownloadRegion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
LABEL_7:
    v11 = 0;
    goto LABEL_8;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v6, "offlineDownloadRegion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "label");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(WeakRetained, "URLHandler:initiateOfflineDownloadForRegion:displayName:", self, v9, v10);

LABEL_8:
  return v11;
}

- (BOOL)_treatCollectionFrom:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id WeakRetained;
  void *v9;
  BOOL v10;
  NSObject *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (!v5)
  {
    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v12;
      v16 = 2082;
      v17 = "nil == parsed";
      _os_log_impl(&dword_18B0B0000, v11, OS_LOG_TYPE_ERROR, "%{public}@ forbids: %{public}s", (uint8_t *)&v14, 0x16u);

    }
    goto LABEL_7;
  }
  objc_msgSend(v5, "collectionStorage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
LABEL_7:
    v10 = 0;
    goto LABEL_8;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v6, "collectionStorage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "URLHandler:showCollection:", self, v9);

  v10 = 1;
LABEL_8:

  return v10;
}

- (BOOL)_treatCarDestinationsFrom:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (!v5)
  {
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v10;
      v14 = 2082;
      v15 = "nil == parsed";
      _os_log_impl(&dword_18B0B0000, v9, OS_LOG_TYPE_ERROR, "%{public}@ forbids: %{public}s", (uint8_t *)&v12, 0x16u);

    }
    goto LABEL_7;
  }
  if (!objc_msgSend(v5, "showCarDestinations"))
  {
LABEL_7:
    v8 = 0;
    goto LABEL_8;
  }
  -[_MKURLHandler delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "URLHandlerShowCarDestinations:", self);

LABEL_8:
  return v8;
}

- (BOOL)_treatCuratedCollectionFrom:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  char v11;
  NSObject *v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (!v5)
  {
    GEOFindOrCreateLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v13;
      v17 = 2082;
      v18 = "nil == parsed";
      _os_log_impl(&dword_18B0B0000, v12, OS_LOG_TYPE_ERROR, "%{public}@ forbids: %{public}s", (uint8_t *)&v15, 0x16u);

    }
    goto LABEL_7;
  }
  v7 = objc_msgSend(v5, "curatedCollectionMUID");
  v8 = objc_msgSend(v6, "searchProviderID");
  if (!v7)
  {
LABEL_7:
    v11 = 0;
    goto LABEL_8;
  }
  v9 = v8;
  -[_MKURLHandler delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "URLHandler:showCuratedCollectionWithID:resultProviderID:", self, v7, v9);

LABEL_8:
  return v11;
}

- (BOOL)_treatPublisherFrom:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  char v11;
  NSObject *v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (!v5)
  {
    GEOFindOrCreateLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v13;
      v17 = 2082;
      v18 = "nil == parsed";
      _os_log_impl(&dword_18B0B0000, v12, OS_LOG_TYPE_ERROR, "%{public}@ forbids: %{public}s", (uint8_t *)&v15, 0x16u);

    }
    goto LABEL_7;
  }
  v7 = objc_msgSend(v5, "publisherMUID");
  v8 = objc_msgSend(v6, "searchProviderID");
  if (!v7)
  {
LABEL_7:
    v11 = 0;
    goto LABEL_8;
  }
  v9 = v8;
  -[_MKURLHandler delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "URLHandler:showPublisherWithID:resultProviderID:", self, v7, v9);

LABEL_8:
  return v11;
}

- (BOOL)_treatAllCuratedCollectionsFrom:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (!v5)
  {
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v10;
      v14 = 2082;
      v15 = "nil == parsed";
      _os_log_impl(&dword_18B0B0000, v9, OS_LOG_TYPE_ERROR, "%{public}@ forbids: %{public}s", (uint8_t *)&v12, 0x16u);

    }
    goto LABEL_7;
  }
  if (!objc_msgSend(v5, "showAllCuratedCollections"))
  {
LABEL_7:
    v8 = 0;
    goto LABEL_8;
  }
  -[_MKURLHandler delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "URLHandlerShowAllCuratedCollections:", self);

LABEL_8:
  return v8;
}

- (BOOL)_handleMapsURL:(id)a3 sourceApplication:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  _MKURLParser *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  NSObject *v17;
  void *v18;
  int v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v8, "scheme");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "URLHandler:setSchemeForCapture:sourceApplication:isLaunchedFromTTL:ttlEventTime:", self, v11, v9, 0, 0);

  if (+[_MKURLParser isValidMapURL:](_MKURLParser, "isValidMapURL:", v8))
  {
    v12 = -[_MKURLParser initWithURL:]([_MKURLParser alloc], "initWithURL:", v8);
    -[_MKURLParser parseIncludingCustomParameters:](v12, "parseIncludingCustomParameters:", 1);
    -[_MKURLParser userSessionEntity](v12, "userSessionEntity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[_MKURLParser userSessionEntity](v12, "userSessionEntity");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D27698], "sharedInstance");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setMapsUserSessionEntity:", v14);

    }
    -[_MKURLHandler _treatGenericOptionsFrom:](self, "_treatGenericOptionsFrom:", v12);
    v16 = -[_MKURLHandler _treatMuninViewStateFrom:](self, "_treatMuninViewStateFrom:", v12)
       || -[_MKURLHandler _treatOfflineDownloadFrom:](self, "_treatOfflineDownloadFrom:", v12)
       || -[_MKURLHandler _treatCollectionFrom:](self, "_treatCollectionFrom:", v12)
       || -[_MKURLHandler _treatFavoritesFrom:](self, "_treatFavoritesFrom:", v12)
       || -[_MKURLHandler _treatTransitLineFrom:](self, "_treatTransitLineFrom:", v12)
       || -[_MKURLHandler _treatPinPositionFrom:](self, "_treatPinPositionFrom:", v12)
       || -[_MKURLHandler _treatNavigationDirectionsFrom:](self, "_treatNavigationDirectionsFrom:", v12)
       || -[_MKURLHandler _treatSearchFrom:](self, "_treatSearchFrom:", v12)
       || -[_MKURLHandler _treatTesterFrom:](self, "_treatTesterFrom:", v12)
       || -[_MKURLHandler _treatCarDestinationsFrom:](self, "_treatCarDestinationsFrom:", v12)
       || -[_MKURLHandler _treatCuratedCollectionFrom:](self, "_treatCuratedCollectionFrom:", v12)
       || -[_MKURLHandler _treatPublisherFrom:](self, "_treatPublisherFrom:", v12)
       || -[_MKURLHandler _treatAllCuratedCollectionsFrom:](self, "_treatAllCuratedCollectionsFrom:", v12);

  }
  else
  {
    GEOFindOrCreateLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543618;
      v21 = v18;
      v22 = 2114;
      v23 = v8;
      _os_log_impl(&dword_18B0B0000, v17, OS_LOG_TYPE_ERROR, "%{public}@ thinks this is not a valid URL: %{public}@", (uint8_t *)&v20, 0x16u);

    }
    v16 = 0;
  }

  return v16;
}

- (BOOL)_handleSharedMapURL:(id)a3 sourceApplication:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  MKURLSerializer *v11;
  void *v12;
  id v13;
  id v15;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(MKURLSerializer);
  v15 = 0;
  -[MKURLSerializer mapItemsFromUrl:options:](v11, "mapItemsFromUrl:options:", v10, &v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v15;
  LOBYTE(self) = -[_MKURLHandler _handleMapItems:withOptions:url:sourceApplication:context:](self, "_handleMapItems:withOptions:url:sourceApplication:context:", v12, v13, v10, v9, v8);

  return (char)self;
}

- (BOOL)_handleMapItemURL:(id)a3 sourceApplication:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v14;

  v14 = 0;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  +[MKMapItem mapItemsFromURL:options:](MKMapItem, "mapItemsFromURL:options:", v10, &v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v14;
  LOBYTE(self) = -[_MKURLHandler _handleMapItems:withOptions:url:sourceApplication:context:](self, "_handleMapItems:withOptions:url:sourceApplication:context:", v11, v12, v10, v9, v8);

  return (char)self;
}

- (void)adjustOptionsForRAP:(id)a3 options:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v9 = a3;
  v5 = *a4;
  if (!*a4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99D80]);
    *a4 = v5;
  }
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  objc_msgSend(v9, "absoluteString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("MKLaunchOptionsURLKey"));

  v8 = objc_retainAutorelease(v6);
  *a4 = v8;

}

- (BOOL)_handleMapItemHandlesURL:(id)a3 sourceApplication:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  id WeakRetained;
  char v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v18[4];
  id v19;
  _MKURLHandler *v20;
  id v21;
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    v13 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v13, "URLHandlerWillStartAsynchronousHandling:", self);

  }
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __68___MKURLHandler__handleMapItemHandlesURL_sourceApplication_context___block_invoke;
  v18[3] = &unk_1E20D9590;
  v19 = v8;
  v20 = self;
  v21 = v9;
  v22 = v10;
  v14 = v10;
  v15 = v9;
  v16 = v8;
  +[MKMapItem _mapItemsFromHandleURL:completionHandler:](MKMapItem, "_mapItemsFromHandleURL:completionHandler:", v16, v18);

  return 1;
}

- (BOOL)_handleMapItems:(id)a3 withOptions:(id)a4 url:(id)a5 sourceApplication:(id)a6 context:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id WeakRetained;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  char v22;
  id v23;
  void *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  BOOL v33;
  id v34;
  void *v35;
  BOOL v36;
  uint64_t v37;
  id v38;
  char v39;
  id v40;
  char v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  int v50;
  double v51;
  double v52;
  _BOOL4 v53;
  _BOOL4 v54;
  double v55;
  double v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  id v62;
  void *v64;
  BOOL v65;
  void *v66;
  void *v67;
  void *v68;
  BOOL v69;
  void *v70;
  uint64_t v71;
  void *v72;
  id v73;
  void *v74;
  id v75;
  void *v76;
  double v77;
  double v78;
  id v79;
  char v80;
  id v81;
  char v82;
  uint64_t v83;
  void (**v84)(_QWORD);
  void *v85;
  id v86;
  void *v87;
  id v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  BOOL v95;
  id v96;
  char v97;
  id v98;
  char v99;
  void *v100;
  void *v101;
  void *v102;
  double v103;
  void *v104;
  void *v105;
  void *v106;
  id v107;
  void *v108;
  void *v109;
  id v110;
  _QWORD v111[5];
  id v112;
  id v113;
  id v114;
  _QWORD v115[4];
  void (**v116)(_QWORD);
  _QWORD v117[4];
  id v118;
  _MKURLHandler *v119;
  id v120;
  id v121;
  id v122;
  _QWORD v123[4];
  id v124;
  _MKURLHandler *v125;
  id v126;
  id v127;
  _QWORD *v128;
  _QWORD v129[4];
  id v130;
  _MKURLHandler *v131;
  id v132;
  id v133;
  _QWORD *v134;
  _QWORD v135[6];
  _QWORD v136[4];
  uint64_t v137;
  uint64_t *v138;
  uint64_t v139;
  uint64_t (*v140)(uint64_t, uint64_t);
  void (*v141)(uint64_t);
  id v142;
  id v143;
  void *v144;
  void *v145;
  _QWORD v146[3];

  v146[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v110 = a7;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    v143 = v13;
    -[_MKURLHandler adjustOptionsForRAP:options:](self, "adjustOptionsForRAP:options:", v14, &v143);
    v17 = v143;

    if (!objc_msgSend(v15, "length"))
    {
      objc_msgSend(v17, "objectForKey:", CFSTR("MKLaunchOptionsReferralIdentifierKey"));
      v18 = objc_claimAutoreleasedReturnValue();

      v15 = (id)v18;
    }
    objc_msgSend(v17, "objectForKey:", CFSTR("MKLaunchOptionsFromTimeToLeaveNotificationKey"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "BOOLValue");

    if ((_DWORD)v20)
    {
      objc_msgSend(v17, "objectForKey:", CFSTR("_MKLaunchOptionsRoutingArrivalDateKey"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v107 = v21;
      else
        v107 = 0;

    }
    else
    {
      v107 = 0;
    }
    v23 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v14, "scheme");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "URLHandler:setSchemeForCapture:sourceApplication:isLaunchedFromTTL:ttlEventTime:", self, v24, v15, v20, v107);

    objc_msgSend(v17, "objectForKey:", CFSTR("MKLaunchOptionsMapType"));
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    if (v109)
    {
      v25 = objc_msgSend(v109, "unsignedIntegerValue");
      v26 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v26, "URLHandler:setMapType:", self, v25);

    }
    objc_msgSend(v17, "objectForKey:", CFSTR("MKLaunchOptionsShowsTraffic"));
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    if (v108)
    {
      v27 = objc_msgSend(v108, "BOOLValue");
      v28 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v28, "URLHandler:setShowTraffic:", self, v27);

    }
    if (objc_msgSend(v12, "indexOfObjectPassingTest:", &__block_literal_global_19) == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (objc_msgSend(v12, "count"))
      {
        objc_msgSend(v17, "objectForKey:", CFSTR("MKLaunchOptionsDirectionsMode"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (v29)
        {

LABEL_24:
          v137 = 0;
          v138 = &v137;
          v139 = 0x3032000000;
          v140 = __Block_byref_object_copy__7;
          v141 = __Block_byref_object_dispose__7;
          v142 = 0;
          v136[0] = 0;
          v136[1] = v136;
          v136[2] = 0x2020000000;
          v136[3] = 0;
          v37 = MEMORY[0x1E0C809B0];
          v135[0] = MEMORY[0x1E0C809B0];
          v135[1] = 3221225472;
          v135[2] = __75___MKURLHandler__handleMapItems_withOptions_url_sourceApplication_context___block_invoke_51;
          v135[3] = &unk_1E20D95D8;
          v135[4] = &v137;
          v135[5] = v136;
          objc_msgSend(v12, "enumerateObjectsUsingBlock:", v135);
          v38 = objc_loadWeakRetained((id *)&self->_delegate);
          v39 = objc_opt_respondsToSelector();

          if ((v39 & 1) != 0)
          {
            v40 = objc_loadWeakRetained((id *)&self->_delegate);
            v41 = objc_msgSend(v40, "URLHandlerShouldPerformRefinementRequest:", self);

            if ((v41 & 1) == 0)
            {
              v45 = objc_loadWeakRetained((id *)&self->_delegate);
              v22 = objc_msgSend(v45, "URLHandler:launchIntoDirectionsWithMapItems:options:context:", self, v12, v17, v110);
LABEL_68:

              _Block_object_dispose(v136, 8);
              _Block_object_dispose(&v137, 8);

              goto LABEL_69;
            }
          }
          v42 = (void *)v138[5];
          if (v42)
          {
            if (objc_msgSend(v42, "_hasResolvablePartialInformation"))
            {
              +[MKMapService sharedService](MKMapService, "sharedService");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend((id)v138[5], "_addressFormattedAsSinglelineAddress");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "ticketForForwardGeocodeString:traits:", v44, 0);
              v45 = (void *)objc_claimAutoreleasedReturnValue();

              v129[0] = v37;
              v129[1] = 3221225472;
              v129[2] = __75___MKURLHandler__handleMapItems_withOptions_url_sourceApplication_context___block_invoke_2;
              v129[3] = &unk_1E20D9600;
              v134 = v136;
              v130 = v12;
              v131 = self;
              v132 = v17;
              v133 = v110;
              objc_msgSend(v45, "submitWithHandler:networkActivity:", v129, 0);

              v22 = 1;
              v46 = v130;
LABEL_67:

              goto LABEL_68;
            }
            objc_msgSend((id)v138[5], "_geoAddress");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "structuredAddress");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            if (v49)
            {

            }
            else
            {
              objc_msgSend((id)v138[5], "_geoAddress");
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              v65 = objc_msgSend(v64, "formattedAddressLinesCount") == 0;

              if (!v65)
              {
                +[MKMapService sharedService](MKMapService, "sharedService");
                v66 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v66, "ticketForMapItemToRefine:traits:", v138[5], 0);
                v45 = (void *)objc_claimAutoreleasedReturnValue();

                v123[0] = v37;
                v123[1] = 3221225472;
                v123[2] = __75___MKURLHandler__handleMapItems_withOptions_url_sourceApplication_context___block_invoke_3;
                v123[3] = &unk_1E20D9600;
                v128 = v136;
                v124 = v12;
                v125 = self;
                v126 = v17;
                v127 = v110;
                objc_msgSend(v45, "submitWithHandler:networkActivity:", v123, 0);

                v22 = 1;
                v46 = v124;
                goto LABEL_67;
              }
            }
          }
          if ((unint64_t)objc_msgSend(v12, "count") <= 1)
            +[MKMapItem mapItemForCurrentLocation](MKMapItem, "mapItemForCurrentLocation");
          else
            objc_msgSend(v12, "firstObject");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "lastObject");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v45, "isCurrentLocation") & 1) != 0)
          {
            v50 = 0;
          }
          else
          {
            objc_msgSend(v45, "_coordinate");
            v53 = v52 < -180.0;
            if (v52 > 180.0)
              v53 = 1;
            if (v51 < -90.0)
              v53 = 1;
            v50 = v51 > 90.0 || v53;
          }
          if ((objc_msgSend(v46, "isCurrentLocation") & 1) != 0)
          {
            v54 = 0;
          }
          else
          {
            objc_msgSend(v46, "_coordinate");
            v54 = v56 < -180.0;
            if (v56 > 180.0)
              v54 = 1;
            if (v55 < -90.0)
              v54 = 1;
            if (v55 > 90.0)
              v54 = 1;
          }
          if ((v50 | v54) != 1)
          {
            v57 = objc_loadWeakRetained((id *)&self->_delegate);
            v22 = objc_msgSend(v57, "URLHandler:launchIntoDirectionsWithMapItems:options:context:", self, v12, v17, v110);
LABEL_66:

            goto LABEL_67;
          }
          if ((objc_msgSend(v45, "isCurrentLocation") & 1) != 0)
          {
            v57 = 0;
          }
          else
          {
            objc_msgSend(v45, "_addressFormattedAsSinglelineAddress");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            if (!objc_msgSend(v57, "length"))
            {
              v22 = 0;
              goto LABEL_66;
            }
          }
          if ((objc_msgSend(v46, "isCurrentLocation") & 1) != 0)
          {
            v61 = 0;
          }
          else
          {
            objc_msgSend(v46, "_addressFormattedAsSinglelineAddress");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            if (!objc_msgSend(v61, "length"))
            {
              v22 = 0;
              goto LABEL_65;
            }
          }
          v62 = objc_loadWeakRetained((id *)&self->_delegate);
          v22 = objc_msgSend(v62, "URLHandler:showDirectionsFrom:to:using:", self, v57, v61, 0xFFFFFFFLL);

LABEL_65:
          goto LABEL_66;
        }
        objc_msgSend(v17, "objectForKey:", CFSTR("MKLaunchOptionsLaunchIntoRoute"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = v35 == 0;

        if (!v36)
          goto LABEL_24;
        objc_msgSend(v17, "objectForKey:", CFSTR("MKLaunchOptionsLaunchIntoRAP"));
        v58 = (void *)objc_claimAutoreleasedReturnValue();

        if (v58)
        {
          v59 = objc_loadWeakRetained((id *)&self->_delegate);
          objc_msgSend(v12, "firstObject");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v59, "URLHandler:launchIntoRAPForMapItem:options:context:", self, v60, v17, v110);

          goto LABEL_69;
        }
        objc_msgSend(v17, "objectForKey:", CFSTR("MKLaunchOptionsLaunchIntoPhotoThumbnailGalleryKey"));
        v67 = (void *)objc_claimAutoreleasedReturnValue();

        if (v67)
        {
          objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("MKLaunchOptionsPhotoThumbnailGalleryAlbumIndex"));
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          v69 = v68 == 0;

          if (v69)
          {
            v71 = 0;
          }
          else
          {
            objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("MKLaunchOptionsPhotoThumbnailGalleryAlbumIndex"));
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            v71 = objc_msgSend(v70, "unsignedIntegerValue");

          }
          v75 = objc_loadWeakRetained((id *)&self->_delegate);
          objc_msgSend(v12, "firstObject");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v75, "URLHandler:launchIntoPhotoThumbnailGalleryForMapItem:albumIndex:options:context:", self, v76, v71, v17, v110);

          goto LABEL_69;
        }
        objc_msgSend(v17, "objectForKey:", CFSTR("MKLaunchOptionsLaunchIntoTableBookingKey"));
        v72 = (void *)objc_claimAutoreleasedReturnValue();

        if (v72)
        {
          v73 = objc_loadWeakRetained((id *)&self->_delegate);
          objc_msgSend(v12, "firstObject");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v73, "URLHandler:launchIntoTableBookingForMapItem:options:context:", self, v74, v17, v110);

          goto LABEL_69;
        }
        if (objc_msgSend(v12, "count") != 1)
        {
          v86 = objc_loadWeakRetained((id *)&self->_delegate);
          v22 = objc_msgSend(v86, "URLHandler:launchIntoSearchWithMapItems:options:context:", self, v12, v17, v110);

          goto LABEL_69;
        }
        objc_msgSend(v12, "firstObject");
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v106, "_coordinate");
        if (v78 < -180.0 || v78 > 180.0 || v77 < -90.0 || v77 > 90.0)
        {
          objc_msgSend(v106, "_addressFormattedAsSinglelineAddress");
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v87, "length"))
          {
            v88 = objc_loadWeakRetained((id *)&self->_delegate);
            objc_msgSend(v106, "name");
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v89, "length"))
            {
              objc_msgSend(v106, "name");
              v90 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = objc_msgSend(v88, "URLHandler:showAddress:label:", self, v87, v90);

            }
            else
            {
              v22 = objc_msgSend(v88, "URLHandler:showAddress:label:", self, v87, v87);
            }

          }
          else
          {
            v22 = 0;
          }
          goto LABEL_110;
        }
        if (objc_msgSend(v106, "_hasResolvablePartialInformation"))
        {
          v79 = objc_loadWeakRetained((id *)&self->_delegate);
          v80 = objc_opt_respondsToSelector();

          if ((v80 & 1) != 0
            && (v81 = objc_loadWeakRetained((id *)&self->_delegate),
                v82 = objc_msgSend(v81, "URLHandlerShouldPerformForwardGeocoding:", self),
                v81,
                (v82 & 1) == 0))
          {
            v87 = objc_loadWeakRetained((id *)&self->_delegate);
            v146[0] = v106;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v146, 1);
            v101 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v87, "URLHandler:launchIntoSearchWithMapItems:options:context:", self, v101, v17, v110);

          }
          else
          {
            v83 = MEMORY[0x1E0C809B0];
            v117[0] = MEMORY[0x1E0C809B0];
            v117[1] = 3221225472;
            v117[2] = __75___MKURLHandler__handleMapItems_withOptions_url_sourceApplication_context___block_invoke_4;
            v117[3] = &unk_1E20D9628;
            v118 = v106;
            v119 = self;
            v120 = v17;
            v121 = v110;
            v122 = v12;
            v84 = (void (**)(_QWORD))MEMORY[0x18D778DB8](v117);
            +[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager");
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v85, "isLocationServicesApproved")
              && (objc_msgSend(v85, "hasLocation") & 1) == 0)
            {
              +[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager");
              v102 = (void *)objc_claimAutoreleasedReturnValue();
              v103 = *MEMORY[0x1E0C9E4F8];
              v115[0] = v83;
              v115[1] = 3221225472;
              v115[2] = __75___MKURLHandler__handleMapItems_withOptions_url_sourceApplication_context___block_invoke_6;
              v115[3] = &unk_1E20D9650;
              v116 = v84;
              objc_msgSend(v102, "singleLocationUpdateWithDesiredAccuracy:handler:timeout:", v115, v103, 5.0);
              v104 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v104, "start");
            }
            else
            {
              v84[2](v84);
            }

            v22 = 1;
            v87 = v118;
          }
          goto LABEL_110;
        }
        objc_msgSend(v106, "_geoAddress");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v91, "structuredAddress");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        if (v92)
        {

        }
        else
        {
          objc_msgSend(v106, "_geoAddress");
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          v95 = objc_msgSend(v94, "formattedAddressLinesCount") == 0;

          if (!v95)
          {
            v96 = objc_loadWeakRetained((id *)&self->_delegate);
            v97 = objc_opt_respondsToSelector();

            if ((v97 & 1) != 0
              && (v98 = objc_loadWeakRetained((id *)&self->_delegate),
                  v99 = objc_msgSend(v98, "URLHandlerShouldPerformRefinementRequest:", self),
                  v98,
                  (v99 & 1) == 0))
            {
              v87 = objc_loadWeakRetained((id *)&self->_delegate);
              v145 = v106;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v145, 1);
              v105 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = objc_msgSend(v87, "URLHandler:launchIntoSearchWithMapItems:options:context:", self, v105, v17, v110);

            }
            else
            {
              +[MKMapService sharedService](MKMapService, "sharedService");
              v100 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v100, "ticketForMapItemToRefine:traits:", v106, 0);
              v87 = (void *)objc_claimAutoreleasedReturnValue();

              v111[0] = MEMORY[0x1E0C809B0];
              v111[1] = 3221225472;
              v111[2] = __75___MKURLHandler__handleMapItems_withOptions_url_sourceApplication_context___block_invoke_7;
              v111[3] = &unk_1E20D8E18;
              v111[4] = self;
              v112 = v17;
              v113 = v110;
              v114 = v12;
              objc_msgSend(v87, "submitWithHandler:networkActivity:", v111, 0);

              v22 = 1;
            }
            goto LABEL_110;
          }
        }
        v87 = objc_loadWeakRetained((id *)&self->_delegate);
        v144 = v106;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v144, 1);
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v87, "URLHandler:launchIntoShowMapItems:options:context:", self, v93, v17, v110);

LABEL_110:
        goto LABEL_69;
      }
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("_MKLaunchOptionsPreserveSearchResultsKey"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v31, "BOOLValue") & 1) != 0)
      {
        objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("MKLaunchOptionsSelectedIndex"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v32 == 0;

        if (!v33)
        {
          v34 = objc_loadWeakRetained((id *)&self->_delegate);
          v22 = objc_msgSend(v34, "URLHandler:launchIntoSearchWithMapItems:options:context:", self, 0, v17, v110);

          goto LABEL_69;
        }
      }
      else
      {

      }
      v47 = objc_loadWeakRetained((id *)&self->_delegate);
      v22 = objc_msgSend(v47, "URLHandler:launchWithOptions:", self, v17);

      goto LABEL_69;
    }
    v30 = objc_loadWeakRetained((id *)&self->_delegate);
    v22 = objc_msgSend(v30, "URLHandler:launchIntoDirectionsWithMapItems:options:context:", self, v12, v17, v110);

LABEL_69:
    v13 = v17;
    goto LABEL_70;
  }
  v22 = 0;
LABEL_70:

  return v22;
}

- (_MKURLHandlerDelegate)delegate
{
  return (_MKURLHandlerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
