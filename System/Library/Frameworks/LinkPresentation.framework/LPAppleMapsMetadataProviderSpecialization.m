@implementation LPAppleMapsMetadataProviderSpecialization

+ (unint64_t)specialization
{
  return 1;
}

+ (id)specializedMetadataProviderForURLWithContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  LPAppleMapsMetadataProviderSpecialization *v7;

  v3 = a3;
  objc_msgSend(v3, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[LPPresentationSpecializations isAppleMapsURL:](LPPresentationSpecializations, "isAppleMapsURL:", v4))
  {

  }
  else
  {
    objc_msgSend(v3, "URL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = +[LPPresentationSpecializations isAppleMapsCollectionURL:](LPPresentationSpecializations, "isAppleMapsCollectionURL:", v5);

    if (!v6)
    {
      v7 = 0;
      goto LABEL_6;
    }
  }
  v7 = -[LPMetadataProviderSpecialization initWithContext:]([LPAppleMapsMetadataProviderSpecialization alloc], "initWithContext:", v3);
LABEL_6:

  return v7;
}

- (void)resolveMapRegionWithCompletionHandler:(id)a3
{
  id v4;
  _MKURLParser *v5;
  double v6;
  CLLocationDegrees v7;
  double v8;
  CLLocationDegrees v9;
  double v10;
  CLLocationDegrees v11;
  double v12;
  CLLocationDegrees v13;
  float v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  uint64_t v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  BOOL v40;
  void *v41;
  objc_class *v42;
  void *v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  CLLocationDegrees v53;
  double v54;
  CLLocationDegrees v55;
  CLLocationDegrees *v56;
  void *v57;
  CLLocationDegrees v58;
  CLLocationDegrees v59;
  float v60;
  double v61;
  void *v62;
  objc_class *v63;
  void *v64;
  double v65;
  double v66;
  void *v67;
  id v68;
  double v69;
  double v70;
  double v71;
  double v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  _QWORD v77[5];
  id v78;
  uint64_t *v79;
  _QWORD v80[4];
  id v81;
  uint64_t *v82;
  _QWORD v83[4];
  id v84;
  uint64_t *v85;
  uint64_t v86;
  double *v87;
  uint64_t v88;
  __n128 (*v89)(uint64_t, uint64_t);
  uint64_t (*v90)();
  void *v91;
  __int128 v92;
  __int128 v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  uint64_t *v98;
  uint64_t v99;
  uint64_t *v100;
  uint64_t v101;
  uint64_t v102;
  _QWORD v103[2];
  CLLocationCoordinate2D v104;
  CLLocationCoordinate2D v105;
  MKCoordinateSpan v106;
  MKCoordinateSpan v107;

  v103[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v86 = 0;
  v87 = (double *)&v86;
  v88 = 0x5012000000;
  v89 = __Block_byref_object_copy__9;
  v90 = __Block_byref_object_dispose__9;
  v91 = &unk_1A0D74BC9;
  v92 = 0u;
  v93 = 0u;
  v5 = self->_parser;
  -[_MKURLParser centerCoordinate](v5, "centerCoordinate");
  v7 = v6;
  v9 = v8;
  -[_MKURLParser span](v5, "span");
  v11 = v10;
  v13 = v12;
  -[_MKURLParser zoomLevel](v5, "zoomLevel");
  v15 = v14;
  v104.latitude = v7;
  v104.longitude = v9;
  v106.latitudeDelta = v11;
  v106.longitudeDelta = v13;
  regionAroundCoordinate(v104, v106, 200.0, v15);
  v20 = v17;
  if (v17 < -180.0
    || (v21 = v16, v17 > 180.0)
    || v16 < -90.0
    || v16 > 90.0
    || (v22 = v18, v18 < 0.0)
    || v18 > 180.0
    || (v23 = v19, v19 < 0.0)
    || v19 > 360.0)
  {
    -[_MKURLParser searchRegion](v5, "searchRegion");
    if (v25 < -180.0
      || v25 > 180.0
      || v24 < -90.0
      || v24 > 90.0
      || v26 < 0.0
      || v26 > 180.0
      || v27 < 0.0
      || v27 > 360.0)
    {
      getMKCoordinateRegionInvalid();
    }
    else
    {
      -[_MKURLParser searchRegion](v5, "searchRegion");
    }
    v21 = v28;
    v20 = v29;
    v22 = v30;
    v23 = v31;
  }

  *(double *)&v92 = v21;
  *((double *)&v92 + 1) = v20;
  *(double *)&v93 = v22;
  *((double *)&v93 + 1) = v23;
  if (-[_MKURLParser searchUID](self->_parser, "searchUID"))
  {
    v99 = 0;
    v100 = &v99;
    v101 = 0x2050000000;
    v32 = (void *)getMKMapServiceClass(void)::softClass;
    v102 = getMKMapServiceClass(void)::softClass;
    v33 = MEMORY[0x1E0C809B0];
    if (!getMKMapServiceClass(void)::softClass)
    {
      v94 = MEMORY[0x1E0C809B0];
      v95 = 3221225472;
      v96 = (uint64_t)___ZL20getMKMapServiceClassv_block_invoke;
      v97 = &unk_1E44A7DB0;
      v98 = &v99;
      ___ZL20getMKMapServiceClassv_block_invoke((uint64_t)&v94);
      v32 = (void *)v100[3];
    }
    v34 = objc_retainAutorelease(v32);
    _Block_object_dispose(&v99, 8);
    objc_msgSend(v34, "sharedService");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[_MKURLParser searchUID](self->_parser, "searchUID"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v103[0] = v36;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v103, 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "ticketForMUIDs:traits:", v37, 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    v83[0] = v33;
    v83[1] = 3221225472;
    v83[2] = __83__LPAppleMapsMetadataProviderSpecialization_resolveMapRegionWithCompletionHandler___block_invoke;
    v83[3] = &unk_1E44AA360;
    v84 = v4;
    v85 = &v86;
    objc_msgSend(v38, "submitWithHandler:networkActivity:", v83, 0);

    goto LABEL_53;
  }
  if (!-[LPAppleMapsMetadataProviderSpecialization isSearch](self, "isSearch"))
  {
    -[_MKURLParser addressString](self->_parser, "addressString");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v39 == 0;

    if (v40)
    {
      if (-[_MKURLParser exactPositionSpecified](self->_parser, "exactPositionSpecified")
        && (-[_MKURLParser centerCoordinate](self->_parser, "centerCoordinate"), v66 >= -180.0)
        && v66 <= 180.0
        && v65 >= -90.0
        && v65 <= 90.0)
      {
        -[LPAppleMapsMetadataProviderSpecialization geocoder](self, "geocoder");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = objc_alloc(MEMORY[0x1E0C9E3B8]);
        -[_MKURLParser centerCoordinate](self->_parser, "centerCoordinate");
        v70 = v69;
        v72 = v71;
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v74 = (void *)objc_msgSend(v68, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", v73, v70, v72, 0.0, *MEMORY[0x1E0C9E490], *MEMORY[0x1E0C9E490]);
        v77[0] = MEMORY[0x1E0C809B0];
        v77[1] = 3221225472;
        v77[2] = __83__LPAppleMapsMetadataProviderSpecialization_resolveMapRegionWithCompletionHandler___block_invoke_3;
        v77[3] = &unk_1E44AA3B0;
        v77[4] = self;
        v78 = v4;
        v79 = &v86;
        objc_msgSend(v67, "reverseGeocodeLocation:completionHandler:", v74, v77);

      }
      else
      {
        (*((void (**)(id, _QWORD, double, double, double, double))v4 + 2))(v4, 0, v87[6], v87[7], v87[8], v87[9]);
      }
      goto LABEL_53;
    }
  }
  v99 = 0;
  v100 = &v99;
  v101 = 0x2050000000;
  v41 = (void *)getMKLocalSearchRequestClass(void)::softClass;
  v102 = getMKLocalSearchRequestClass(void)::softClass;
  if (!getMKLocalSearchRequestClass(void)::softClass)
  {
    v94 = MEMORY[0x1E0C809B0];
    v95 = 3221225472;
    v96 = (uint64_t)___ZL28getMKLocalSearchRequestClassv_block_invoke;
    v97 = &unk_1E44A7DB0;
    v98 = &v99;
    ___ZL28getMKLocalSearchRequestClassv_block_invoke((uint64_t)&v94);
    v41 = (void *)v100[3];
  }
  v42 = objc_retainAutorelease(v41);
  _Block_object_dispose(&v99, 8);
  v43 = (void *)objc_msgSend([v42 alloc], "init");
  -[_MKURLParser addressString](self->_parser, "addressString");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v44;
  if (!v44)
  {
    -[_MKURLParser searchQuery](self->_parser, "searchQuery");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v43, "setNaturalLanguageQuery:", v45);
  if (!v44)

  -[_MKURLParser searchRegion](self->_parser, "searchRegion");
  if (v47 < -180.0 || v47 > 180.0 || v46 < -90.0 || v46 > 90.0 || v48 < 0.0 || v48 > 180.0 || v49 < 0.0 || v49 > 360.0)
  {
    -[_MKURLParser searchCoordinate](self->_parser, "searchCoordinate");
    if (v51 < -180.0 || v51 > 180.0 || v50 < -90.0 || v50 > 90.0)
      goto LABEL_50;
    -[_MKURLParser searchCoordinate](self->_parser, "searchCoordinate");
    v53 = v52;
    v55 = v54;
    v94 = 0;
    v95 = (uint64_t)&v94;
    v96 = 0x2020000000;
    v56 = (CLLocationDegrees *)getMKCoordinateSpanInvalidSymbolLoc(void)::ptr;
    v97 = (void *)getMKCoordinateSpanInvalidSymbolLoc(void)::ptr;
    if (!getMKCoordinateSpanInvalidSymbolLoc(void)::ptr)
    {
      v57 = MapKitLibrary();
      v56 = (CLLocationDegrees *)dlsym(v57, "MKCoordinateSpanInvalid");
      *(_QWORD *)(v95 + 24) = v56;
      getMKCoordinateSpanInvalidSymbolLoc(void)::ptr = (uint64_t)v56;
    }
    _Block_object_dispose(&v94, 8);
    if (!v56)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "MKCoordinateSpan getMKCoordinateSpanInvalid()");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "handleFailureInFunction:file:lineNumber:description:", v76, CFSTR("LPAppleMapsMetadataProviderSpecialization.mm"), 77, CFSTR("%s"), dlerror());

      __break(1u);
    }
    v58 = *v56;
    v59 = v56[1];
    -[_MKURLParser zoomLevel](self->_parser, "zoomLevel");
    v61 = v60;
    v105.latitude = v53;
    v105.longitude = v55;
    v107.latitudeDelta = v58;
    v107.longitudeDelta = v59;
    regionAroundCoordinate(v105, v107, 2000.0, v61);
  }
  else
  {
    -[_MKURLParser searchRegion](self->_parser, "searchRegion");
  }
  objc_msgSend(v43, "setRegion:");
LABEL_50:
  v99 = 0;
  v100 = &v99;
  v101 = 0x2050000000;
  v62 = (void *)getMKLocalSearchClass(void)::softClass;
  v102 = getMKLocalSearchClass(void)::softClass;
  if (!getMKLocalSearchClass(void)::softClass)
  {
    v94 = MEMORY[0x1E0C809B0];
    v95 = 3221225472;
    v96 = (uint64_t)___ZL21getMKLocalSearchClassv_block_invoke;
    v97 = &unk_1E44A7DB0;
    v98 = &v99;
    ___ZL21getMKLocalSearchClassv_block_invoke((uint64_t)&v94);
    v62 = (void *)v100[3];
  }
  v63 = objc_retainAutorelease(v62);
  _Block_object_dispose(&v99, 8);
  v64 = (void *)objc_msgSend([v63 alloc], "initWithRequest:", v43);
  v80[0] = MEMORY[0x1E0C809B0];
  v80[1] = 3221225472;
  v80[2] = __83__LPAppleMapsMetadataProviderSpecialization_resolveMapRegionWithCompletionHandler___block_invoke_2;
  v80[3] = &unk_1E44AA388;
  v82 = &v86;
  v81 = v4;
  objc_msgSend(v64, "startWithCompletionHandler:", v80);

LABEL_53:
  _Block_object_dispose(&v86, 8);

}

void __83__LPAppleMapsMetadataProviderSpecialization_resolveMapRegionWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v11 = a2;
  v5 = a3;
  if (!v5 && objc_msgSend(v11, "count"))
  {
    v6 = regionFromMapItems(v11);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    *(double *)(v7 + 48) = v6;
    *(_QWORD *)(v7 + 56) = v8;
    *(_QWORD *)(v7 + 64) = v9;
    *(_QWORD *)(v7 + 72) = v10;
  }
  (*(void (**)(double, double, double, double))(*(_QWORD *)(a1 + 32) + 16))(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 56), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 64), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 72));

}

void __83__LPAppleMapsMetadataProviderSpecialization_resolveMapRegionWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "mapItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = regionFromMapItems(v3);
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    *(double *)(v5 + 48) = v4;
    *(_QWORD *)(v5 + 56) = v6;
    *(_QWORD *)(v5 + 64) = v7;
    *(_QWORD *)(v5 + 72) = v8;
  }
  (*(void (**)(double, double, double, double))(*(_QWORD *)(a1 + 32) + 16))(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 56), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 64), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 72));

}

void __83__LPAppleMapsMetadataProviderSpecialization_resolveMapRegionWithCompletionHandler___block_invoke_3(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  double *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  double *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!*(_BYTE *)(a1[4] + 24))
  {
    if (v6 || !objc_msgSend(v5, "count"))
    {
      v8 = a1[5];
      v9 = *(double **)(a1[6] + 8);
      v10 = v9[6];
      v11 = v9[7];
      v12 = v9[8];
      v13 = v9[9];
      v14 = objc_alloc((Class)getMKMapItemClass());
      v15 = objc_alloc((Class)getMKPlacemarkClass());
      objc_msgSend(*(id *)(a1[4] + 40), "centerCoordinate");
      v16 = (void *)objc_msgSend(v15, "initWithCoordinate:");
      v17 = (void *)objc_msgSend(v14, "initWithPlacemark:", v16);
      v29[0] = v17;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, double, double, double, double))(v8 + 16))(v8, v18, v10, v11, v12, v13);
    }
    else
    {
      v19 = a1[5];
      v20 = *(double **)(a1[6] + 8);
      v21 = v20[6];
      v22 = v20[7];
      v23 = v20[8];
      v24 = v20[9];
      v25 = objc_alloc((Class)getMKMapItemClass());
      v26 = objc_alloc((Class)getMKPlacemarkClass());
      objc_msgSend(v5, "firstObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v26, "initWithPlacemark:", v16);
      v18 = (void *)objc_msgSend(v25, "initWithPlacemark:", v17);
      v28 = v18;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, double, double, double, double))(v19 + 16))(v19, v27, v21, v22, v23, v24);

    }
  }

}

- (id)geocoder
{
  CLGeocoder *geocoder;
  CLGeocoder *v4;
  CLGeocoder *v5;

  geocoder = self->_geocoder;
  if (!geocoder)
  {
    v4 = (CLGeocoder *)objc_alloc_init(MEMORY[0x1E0C9E390]);
    v5 = self->_geocoder;
    self->_geocoder = v4;

    geocoder = self->_geocoder;
  }
  return geocoder;
}

- (BOOL)isSearch
{
  void *v3;
  BOOL v4;
  void *v5;

  -[_MKURLParser searchQuery](self->_parser, "searchQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (-[_MKURLParser exactPositionSpecified](self->_parser, "exactPositionSpecified") & 1) == 0)
  {
    -[_MKURLParser addressString](self->_parser, "addressString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 == 0;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)populateImageWithMapSnapshot:(id)a3
{
  LPImage *v4;
  void *v5;
  void *v6;
  LPImage *v7;
  LPImage *v8;
  void *v9;
  void *v10;
  LPImage *v11;
  id v12;

  v12 = a3;
  v4 = [LPImage alloc];
  objc_msgSend(v12, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_lp_imageForcingUserInterfaceStyle:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[LPImage initWithPlatformImage:](v4, "initWithPlatformImage:", v6);
  -[LPMapMetadata setImage:](self->_mapMetadata, "setImage:", v7);

  v8 = [LPImage alloc];
  objc_msgSend(v12, "image");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_lp_imageForcingUserInterfaceStyle:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[LPImage initWithPlatformImage:](v8, "initWithPlatformImage:", v10);
  -[LPMapMetadata setDarkImage:](self->_mapMetadata, "setDarkImage:", v11);

}

- (void)start
{
  LPMapMetadata *v3;
  LPMapMetadata *mapMetadata;
  void *v5;
  objc_class *v6;
  id v7;
  void *v8;
  _MKURLParser *v9;
  _MKURLParser *parser;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v3 = objc_alloc_init(LPMapMetadata);
  mapMetadata = self->_mapMetadata;
  self->_mapMetadata = v3;

  v18 = 0;
  v19 = &v18;
  v20 = 0x2050000000;
  v5 = (void *)get_MKURLParserClass(void)::softClass;
  v21 = get_MKURLParserClass(void)::softClass;
  if (!get_MKURLParserClass(void)::softClass)
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = ___ZL20get_MKURLParserClassv_block_invoke;
    v17[3] = &unk_1E44A7DB0;
    v17[4] = &v18;
    ___ZL20get_MKURLParserClassv_block_invoke((uint64_t)v17);
    v5 = (void *)v19[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v18, 8);
  v7 = [v6 alloc];
  -[LPMetadataProviderSpecialization URL](self, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (_MKURLParser *)objc_msgSend(v7, "initWithURL:", v8);
  parser = self->_parser;
  self->_parser = v9;

  -[_MKURLParser parseIncludingCustomParameters:](self->_parser, "parseIncludingCustomParameters:", 1);
  if (-[_MKURLParser mapType](self->_parser, "mapType") == 107)
  {
    createSnapshotOptions();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKURLParser mapCamera](self->_parser, "mapCamera");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setCamera:", v12);

    objc_msgSend(v11, "setMapType:", -[_MKURLParser mapType](self->_parser, "mapType"));
    objc_msgSend(v11, "_setShowsPointLabels:", 0);
    -[LPAppleMapsMetadataProviderSpecialization continueWithLookAroundSnapshotWithOptions:](self, "continueWithLookAroundSnapshotWithOptions:", v11);

    return;
  }
  -[_MKURLParser collectionStorage](self->_parser, "collectionStorage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[LPAppleMapsMetadataProviderSpecialization completeWithCollection](self, "completeWithCollection");
    return;
  }
  if (-[_MKURLParser curatedCollectionMUID](self->_parser, "curatedCollectionMUID"))
  {
    -[LPAppleMapsMetadataProviderSpecialization completeWithCuratedCollection](self, "completeWithCuratedCollection");
    return;
  }
  if (-[_MKURLParser publisherMUID](self->_parser, "publisherMUID"))
  {
    -[LPAppleMapsMetadataProviderSpecialization completeWithPublisher](self, "completeWithPublisher");
    return;
  }
  -[_MKURLParser directionsSourceAddressString](self->_parser, "directionsSourceAddressString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {

  }
  else
  {
    -[_MKURLParser directionsDestinationAddressString](self->_parser, "directionsDestinationAddressString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __50__LPAppleMapsMetadataProviderSpecialization_start__block_invoke;
      v16[3] = &unk_1E44AA3D8;
      v16[4] = self;
      -[LPAppleMapsMetadataProviderSpecialization resolveMapRegionWithCompletionHandler:](self, "resolveMapRegionWithCompletionHandler:", v16);
      return;
    }
  }
  -[LPAppleMapsMetadataProviderSpecialization completeWithDirections](self, "completeWithDirections");
}

void __50__LPAppleMapsMetadataProviderSpecialization_start__block_invoke(uint64_t a1, void *a2, double a3, double a4, double a5, double a6)
{
  _BYTE *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a2;
  v11 = *(_BYTE **)(a1 + 32);
  if (!v11[24])
  {
    if (a4 < -180.0 || a4 > 180.0 || a3 < -90.0 || a3 > 90.0 || a5 < 0.0 || a5 > 180.0 || a6 < 0.0 || a6 > 360.0)
    {
      objc_msgSend(v11, "fail");
    }
    else
    {
      v12 = objc_msgSend(v14, "count");
      v13 = *(void **)(a1 + 32);
      if (v12)
        objc_msgSend(v13, "continueWithSnapshotOfMapItems:", v14);
      else
        objc_msgSend(v13, "continueWithSnapshotOfMapRegion:", a3, a4, a5, a6);
    }
  }

}

- (void)continueWithLookAroundSnapshotWithOptions:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[5];
  NSObject *v13;

  v4 = a3;
  v5 = dispatch_group_create();
  allocMKMapSnapshotterInstance_LP();
  v6 = (void *)objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "initWithOptions:", v4);
  dispatch_group_enter(v5);
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __87__LPAppleMapsMetadataProviderSpecialization_continueWithLookAroundSnapshotWithOptions___block_invoke;
  v12[3] = &unk_1E44AA400;
  v12[4] = self;
  v8 = v5;
  v13 = v8;
  objc_msgSend(v6, "startWithCompletionHandler:", v12);
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __87__LPAppleMapsMetadataProviderSpecialization_continueWithLookAroundSnapshotWithOptions___block_invoke_2;
  v10[3] = &unk_1E44A7D10;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  dispatch_group_notify(v8, MEMORY[0x1E0C80D38], v10);

}

void __87__LPAppleMapsMetadataProviderSpecialization_continueWithLookAroundSnapshotWithOptions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  _BYTE *v6;
  LPImage *v7;
  void *v8;
  LPImage *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  v6 = *(_BYTE **)(a1 + 32);
  if (!v6[24])
  {
    if (v5)
    {
      objc_msgSend(v6, "fail");
    }
    else
    {
      v7 = [LPImage alloc];
      objc_msgSend(v10, "image");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[LPImage initWithPlatformImage:](v7, "initWithPlatformImage:", v8);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setImage:", v9);

      dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
    }
  }

}

void __87__LPAppleMapsMetadataProviderSpecialization_continueWithLookAroundSnapshotWithOptions___block_invoke_2(uint64_t a1)
{
  _BYTE *v2;
  id *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  id v23;
  _QWORD v24[5];
  CLLocationCoordinate2D v25;

  v2 = *(_BYTE **)(a1 + 32);
  if (!v2[24])
  {
    if (objc_msgSend(v2, "isSearch"))
    {
      v3 = *(id **)(a1 + 32);
      objc_msgSend(v3[5], "searchQuery");
      v23 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "completeWithSearchQuery:");

    }
    else
    {
      v4 = *MEMORY[0x1E0C9E500];
      v5 = *(double *)(MEMORY[0x1E0C9E500] + 8);
      objc_msgSend(*(id *)(a1 + 40), "camera");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = *(void **)(a1 + 40);
      if (v6)
      {
        objc_msgSend(v7, "camera");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "centerCoordinate");
        v4 = v9;
        v5 = v10;

      }
      else
      {
        objc_msgSend(v7, "region");
        if (v18 >= -180.0
          && v18 <= 180.0
          && v17 >= -90.0
          && v17 <= 90.0
          && v19 >= 0.0
          && v19 <= 180.0
          && v20 >= 0.0
          && v20 <= 360.0)
        {
          objc_msgSend(*(id *)(a1 + 40), "region");
          v4 = v21;
          v5 = v22;
        }
      }
      v25.latitude = v4;
      v25.longitude = v5;
      v11 = CLLocationCoordinate2DIsValid(v25);
      v12 = *(void **)(a1 + 32);
      if (v11)
      {
        objc_msgSend(v12, "geocoder");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_alloc(MEMORY[0x1E0C9E3B8]);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_msgSend(v14, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", v15, v4, v5, 0.0, *MEMORY[0x1E0C9E490], *MEMORY[0x1E0C9E490]);
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __87__LPAppleMapsMetadataProviderSpecialization_continueWithLookAroundSnapshotWithOptions___block_invoke_3;
        v24[3] = &unk_1E44AA428;
        v24[4] = *(_QWORD *)(a1 + 32);
        objc_msgSend(v13, "reverseGeocodeLocation:completionHandler:", v16, v24);

      }
      else
      {
        objc_msgSend(v12, "fail");
      }
    }
  }
}

void __87__LPAppleMapsMetadataProviderSpecialization_continueWithLookAroundSnapshotWithOptions___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  _BYTE *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  v6 = v5;
  v7 = *(_BYTE **)(a1 + 32);
  if (!v7[24])
  {
    if (v5 || (v8 = objc_msgSend(v10, "count"), v7 = *(_BYTE **)(a1 + 32), !v8))
    {
      objc_msgSend(v7, "fail");
    }
    else
    {
      objc_msgSend(v10, "firstObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "completeWithPlacemark:", v9);

    }
  }

}

- (void)continueWithSnapshotOfMapRegion:(id *)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  _QWORD block[5];
  _QWORD v19[5];
  NSObject *v20;

  v7 = v6;
  v8 = v5;
  v9 = v4;
  v10 = v3;
  v12 = dispatch_group_create();
  createSnapshotOptions();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setRegion:", v10, v9, v8, v7);
  objc_msgSend(v13, "setMapType:", -[_MKURLParser mapType](self->_parser, "mapType"));
  objc_msgSend(v13, "_setAllowsSimultaneousLightDarkSnapshots:", 1);
  objc_msgSend(v13, "traitCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTraitCollection:", v14);

  allocMKMapSnapshotterInstance_LP();
  v15 = (void *)objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "initWithOptions:", v13);
  dispatch_group_enter(v12);
  v16 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __77__LPAppleMapsMetadataProviderSpecialization_continueWithSnapshotOfMapRegion___block_invoke;
  v19[3] = &unk_1E44AA400;
  v19[4] = self;
  v17 = v12;
  v20 = v17;
  objc_msgSend(v15, "startWithCompletionHandler:", v19);
  block[0] = v16;
  block[1] = 3221225472;
  block[2] = __77__LPAppleMapsMetadataProviderSpecialization_continueWithSnapshotOfMapRegion___block_invoke_2;
  block[3] = &unk_1E44A7CE8;
  block[4] = self;
  dispatch_group_notify(v17, MEMORY[0x1E0C80D38], block);

}

void __77__LPAppleMapsMetadataProviderSpecialization_continueWithSnapshotOfMapRegion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  _BYTE *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  v6 = *(_BYTE **)(a1 + 32);
  if (!v6[24])
  {
    if (v5)
    {
      objc_msgSend(v6, "fail");
    }
    else
    {
      objc_msgSend(v6, "populateImageWithMapSnapshot:", v7);
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
    }
  }

}

void __77__LPAppleMapsMetadataProviderSpecialization_continueWithSnapshotOfMapRegion___block_invoke_2(uint64_t a1)
{
  _BYTE *v2;
  int v3;
  id *v4;
  id v5;

  v2 = *(_BYTE **)(a1 + 32);
  if (!v2[24])
  {
    v3 = objc_msgSend(v2, "isSearch");
    v4 = *(id **)(a1 + 32);
    if (v3)
    {
      objc_msgSend(v4[5], "searchQuery");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "completeWithSearchQuery:");

    }
    else
    {
      objc_msgSend(v4, "fail");
    }
  }
}

- (void)continueWithSnapshotOfMapItems:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[5];
  NSObject *v14;

  v4 = a3;
  v5 = dispatch_group_create();
  allocMKAnnotatedMapSnapshotterInstance_LP();
  v6 = (void *)objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "initWithMapItems:mapSize:useSnapshotService:", v4, 1, 300.0, 300.0);
  objc_msgSend(v6, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTraitCollection:", v7);

  dispatch_group_enter(v5);
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __76__LPAppleMapsMetadataProviderSpecialization_continueWithSnapshotOfMapItems___block_invoke;
  v13[3] = &unk_1E44AA400;
  v13[4] = self;
  v9 = v5;
  v14 = v9;
  objc_msgSend(v6, "startWithCompletionHandler:", v13);
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __76__LPAppleMapsMetadataProviderSpecialization_continueWithSnapshotOfMapItems___block_invoke_2;
  v11[3] = &unk_1E44A7D10;
  v11[4] = self;
  v12 = v4;
  v10 = v4;
  dispatch_group_notify(v9, MEMORY[0x1E0C80D38], v11);

}

void __76__LPAppleMapsMetadataProviderSpecialization_continueWithSnapshotOfMapItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  _BYTE *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  v6 = *(_BYTE **)(a1 + 32);
  if (!v6[24])
  {
    if (v5)
    {
      objc_msgSend(v6, "fail");
    }
    else
    {
      objc_msgSend(v6, "populateImageWithMapSnapshot:", v7);
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
    }
  }

}

void __76__LPAppleMapsMetadataProviderSpecialization_continueWithSnapshotOfMapItems___block_invoke_2(uint64_t a1)
{
  _BYTE *v2;
  id *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(_BYTE **)(a1 + 32);
  if (!v2[24])
  {
    if (objc_msgSend(v2, "isSearch"))
    {
      v3 = *(id **)(a1 + 32);
      objc_msgSend(v3[5], "searchQuery");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "completeWithSearchQuery:");
LABEL_6:

      return;
    }
    v4 = objc_msgSend(*(id *)(a1 + 40), "count");
    v5 = *(void **)(a1 + 32);
    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 40), "firstObject");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "completeWithMapItem:");
      goto LABEL_6;
    }
    objc_msgSend(*(id *)(a1 + 32), "fail");
  }
}

- (void)cancel
{
  self->_cancelled = 1;
  -[CLGeocoder cancelGeocode](self->_geocoder, "cancelGeocode");
}

- (void)fail
{
  id v3;

  -[LPAppleMapsMetadataProviderSpecialization cancel](self, "cancel");
  -[LPMetadataProviderSpecialization delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "metadataProviderSpecializationDidFail:", self);

}

- (void)completeWithSearchQuery:(id)a3
{
  id v4;

  v4 = a3;
  -[LPMapMetadata setSearchQuery:](self->_mapMetadata, "setSearchQuery:");
  -[LPAppleMapsMetadataProviderSpecialization complete](self, "complete");

}

- (void)completeWithMapItem:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPMapMetadata setName:](self->_mapMetadata, "setName:", v4);

  objc_msgSend(v9, "_firstLocalizedCategoryName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPMapMetadata setCategory:](self->_mapMetadata, "setCategory:", v5);

  objc_msgSend(v9, "_identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPMapMetadata setIsPointOfInterest:](self->_mapMetadata, "setIsPointOfInterest:", v6 != 0);

  objc_msgSend(v9, "placemark");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v9, "placemark");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPAppleMapsMetadataProviderSpecialization completeWithPlacemark:](self, "completeWithPlacemark:", v8);

  }
  else
  {
    -[LPAppleMapsMetadataProviderSpecialization complete](self, "complete");
  }

}

- (void)completeWithPlacemark:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C973B0];
  v10 = v4;
  objc_msgSend(v4, "postalAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringFromPostalAddress:style:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPMapMetadata setAddress:](self->_mapMetadata, "setAddress:", v7);

  objc_msgSend(v10, "postalAddress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPMapMetadata setAddressComponents:](self->_mapMetadata, "setAddressComponents:", v8);

  objc_msgSend(v10, "location");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "coordinate");
  -[LPMapMetadata setLocation:](self->_mapMetadata, "setLocation:");

  -[LPAppleMapsMetadataProviderSpecialization complete](self, "complete");
}

- (void)completeWithDirections
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  -[_MKURLParser directionsSourceAddressString](self->_parser, "directionsSourceAddressString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPMapMetadata setDirectionsSourceAddress:](self->_mapMetadata, "setDirectionsSourceAddress:", v3);

  -[_MKURLParser directionsDestinationAddressString](self->_parser, "directionsDestinationAddressString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPMapMetadata setDirectionsDestinationAddress:](self->_mapMetadata, "setDirectionsDestinationAddress:", v4);

  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = -[_MKURLParser transportType](self->_parser, "transportType");
  v7 = 2;
  switch(v6)
  {
    case 2:
      break;
    case 4:
      v7 = 1;
      break;
    case 8:
      v7 = 3;
      break;
    default:
      v7 = 0;
      break;
  }
  objc_msgSend(v5, "numberWithInt:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPMapMetadata setTransportType:](self->_mapMetadata, "setTransportType:", v8);

  -[LPAppleMapsMetadataProviderSpecialization complete](self, "complete");
}

- (void)completeWithCollection
{
  LPMapCollectionMetadata *v3;
  LPMapCollectionMetadata *collectionMetadata;
  LPMapMetadata *mapMetadata;
  void *v6;
  uint64_t v7;
  objc_class *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v3 = objc_alloc_init(LPMapCollectionMetadata);
  collectionMetadata = self->_collectionMetadata;
  self->_collectionMetadata = v3;

  mapMetadata = self->_mapMetadata;
  self->_mapMetadata = 0;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2050000000;
  v6 = (void *)getMKCollectionStorageRefinerClass(void)::softClass;
  v17 = getMKCollectionStorageRefinerClass(void)::softClass;
  v7 = MEMORY[0x1E0C809B0];
  if (!getMKCollectionStorageRefinerClass(void)::softClass)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = ___ZL34getMKCollectionStorageRefinerClassv_block_invoke;
    v13[3] = &unk_1E44A7DB0;
    v13[4] = &v14;
    ___ZL34getMKCollectionStorageRefinerClassv_block_invoke((uint64_t)v13);
    v6 = (void *)v15[3];
  }
  v8 = objc_retainAutorelease(v6);
  _Block_object_dispose(&v14, 8);
  v9 = [v8 alloc];
  -[_MKURLParser collectionStorage](self->_parser, "collectionStorage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithCollectionStorage:", v10);

  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __67__LPAppleMapsMetadataProviderSpecialization_completeWithCollection__block_invoke;
  v12[3] = &unk_1E44AA450;
  v12[4] = self;
  objc_msgSend(v11, "fetchMapItems:", v12);

}

void __67__LPAppleMapsMetadataProviderSpecialization_completeWithCollection__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[5];
  NSObject *v13;

  v3 = a2;
  v4 = v3;
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 24))
  {
    if (objc_msgSend(v3, "count"))
    {
      allocMKAnnotatedMapSnapshotterInstance_LP();
      v5 = (void *)objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "initWithMapItems:mapSize:useSnapshotService:", v4, 1, 300.0, 300.0);
      objc_msgSend(v5, "traitCollection");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setTraitCollection:", v6);

      v7 = dispatch_group_create();
      dispatch_group_enter(v7);
      v8 = MEMORY[0x1E0C809B0];
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __67__LPAppleMapsMetadataProviderSpecialization_completeWithCollection__block_invoke_2;
      v12[3] = &unk_1E44AA400;
      v12[4] = *(_QWORD *)(a1 + 32);
      v13 = v7;
      v9 = v7;
      objc_msgSend(v5, "startWithCompletionHandler:", v12);
      v10[0] = v8;
      v10[1] = 3221225472;
      v10[2] = __67__LPAppleMapsMetadataProviderSpecialization_completeWithCollection__block_invoke_3;
      v10[3] = &unk_1E44A7D10;
      v10[4] = *(_QWORD *)(a1 + 32);
      v11 = v4;
      dispatch_group_notify(v9, MEMORY[0x1E0C80D38], v10);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "fail");
    }
  }

}

void __67__LPAppleMapsMetadataProviderSpecialization_completeWithCollection__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  _BYTE *v6;
  LPImage *v7;
  void *v8;
  void *v9;
  LPImage *v10;
  LPImage *v11;
  void *v12;
  void *v13;
  LPImage *v14;
  id v15;

  v15 = a2;
  v5 = a3;
  v6 = *(_BYTE **)(a1 + 32);
  if (!v6[24])
  {
    if (v5)
    {
      objc_msgSend(v6, "fail");
    }
    else
    {
      v7 = [LPImage alloc];
      objc_msgSend(v15, "image");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_lp_imageForcingUserInterfaceStyle:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[LPImage initWithPlatformImage:](v7, "initWithPlatformImage:", v9);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setImage:", v10);

      v11 = [LPImage alloc];
      objc_msgSend(v15, "image");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_lp_imageForcingUserInterfaceStyle:", 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[LPImage initWithPlatformImage:](v11, "initWithPlatformImage:", v13);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setDarkImage:", v14);

      dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
    }
  }

}

void __67__LPAppleMapsMetadataProviderSpecialization_completeWithCollection__block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 24))
  {
    objc_msgSend(*(id *)(v1 + 40), "collectionStorage");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setName:", v4);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "collectionStorage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setNumberOfItems:", objc_msgSend(v5, "placesCount"));

    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v7 = *(id *)(a1 + 40);
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10), "_cnPostalAddress", (_QWORD)v12);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
            objc_msgSend(v6, "addObject:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

    if (objc_msgSend(v6, "count"))
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setAddresses:", v6);
    objc_msgSend(*(id *)(a1 + 32), "complete", (_QWORD)v12);

  }
}

- (void)completeWithCuratedCollection
{
  LPMapCollectionMetadata *v3;
  LPMapCollectionMetadata *collectionMetadata;
  LPMapMetadata *mapMetadata;
  void *v6;
  uint64_t v7;
  objc_class *v8;
  MKPlaceCuratedCollectionRefiner *v9;
  MKPlaceCuratedCollectionRefiner *curatedCollectionRefiner;
  MKPlaceCuratedCollectionRefiner *v11;
  _QWORD v12[5];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v3 = objc_alloc_init(LPMapCollectionMetadata);
  collectionMetadata = self->_collectionMetadata;
  self->_collectionMetadata = v3;

  mapMetadata = self->_mapMetadata;
  self->_mapMetadata = 0;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2050000000;
  v6 = (void *)getMKPlaceCuratedCollectionRefinerClass(void)::softClass;
  v17 = getMKPlaceCuratedCollectionRefinerClass(void)::softClass;
  v7 = MEMORY[0x1E0C809B0];
  if (!getMKPlaceCuratedCollectionRefinerClass(void)::softClass)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = ___ZL39getMKPlaceCuratedCollectionRefinerClassv_block_invoke;
    v13[3] = &unk_1E44A7DB0;
    v13[4] = &v14;
    ___ZL39getMKPlaceCuratedCollectionRefinerClassv_block_invoke((uint64_t)v13);
    v6 = (void *)v15[3];
  }
  v8 = objc_retainAutorelease(v6);
  _Block_object_dispose(&v14, 8);
  v9 = (MKPlaceCuratedCollectionRefiner *)objc_msgSend([v8 alloc], "initWithCollectionIdentifier:providerIdentifier:", -[_MKURLParser curatedCollectionMUID](self->_parser, "curatedCollectionMUID"), -[_MKURLParser searchProviderID](self->_parser, "searchProviderID"));
  curatedCollectionRefiner = self->_curatedCollectionRefiner;
  self->_curatedCollectionRefiner = v9;

  v11 = self->_curatedCollectionRefiner;
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __74__LPAppleMapsMetadataProviderSpecialization_completeWithCuratedCollection__block_invoke;
  v12[3] = &unk_1E44AA4A0;
  v12[4] = self;
  -[MKPlaceCuratedCollectionRefiner fetchWithCallbackQueue:completion:](v11, "fetchWithCallbackQueue:completion:", MEMORY[0x1E0C80D38], v12);
}

void __74__LPAppleMapsMetadataProviderSpecialization_completeWithCuratedCollection__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  _BYTE *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  LPFetcherConfiguration *v19;
  void *v20;
  void *v21;
  LPImageFetcher *v22;
  void *v23;
  LPImageFetcher *v24;
  NSObject *v25;
  uint64_t v26;
  _QWORD v27[5];
  id v28;
  id v29;
  _QWORD v30[4];
  LPImageFetcher *v31;
  NSObject *v32;
  uint64_t v33;
  _QWORD v34[5];
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(_BYTE **)(a1 + 32);
  if (!v10[24])
  {
    if (v9)
    {
      objc_msgSend(v10, "fail");
    }
    else if (objc_msgSend(v8, "count"))
    {
      v11 = dispatch_group_create();
      objc_msgSend(v7, "photos");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "firstObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 0;
      v36 = &v35;
      v37 = 0x2050000000;
      v14 = (void *)getGEOMapItemPhotoOptionsClass(void)::softClass;
      v38 = getGEOMapItemPhotoOptionsClass(void)::softClass;
      v15 = MEMORY[0x1E0C809B0];
      if (!getGEOMapItemPhotoOptionsClass(void)::softClass)
      {
        v34[0] = MEMORY[0x1E0C809B0];
        v34[1] = 3221225472;
        v34[2] = ___ZL30getGEOMapItemPhotoOptionsClassv_block_invoke;
        v34[3] = &unk_1E44A7DB0;
        v34[4] = &v35;
        ___ZL30getGEOMapItemPhotoOptionsClassv_block_invoke((uint64_t)v34);
        v14 = (void *)v36[3];
      }
      v16 = objc_retainAutorelease(v14);
      _Block_object_dispose(&v35, 8);
      objc_msgSend(v16, "defaultPhotoOptionsWithAllowSmaller:", 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "bestPhotoForFrameSize:displayScale:options:", v17, 300.0, 300.0, 3.0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        dispatch_group_enter(v11);
        v19 = objc_alloc_init(LPFetcherConfiguration);
        objc_msgSend(*(id *)(a1 + 32), "context");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "webView");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[LPFetcherConfiguration setWebViewForProcessSharing:](v19, "setWebViewForProcessSharing:", v21);

        v22 = objc_alloc_init(LPImageFetcher);
        objc_msgSend(v18, "url");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[LPImageFetcher setURL:](v22, "setURL:", v23);

        -[LPFetcher setResponseClass:](v22, "setResponseClass:", objc_opt_class());
        v30[0] = v15;
        v30[1] = 3221225472;
        v30[2] = __74__LPAppleMapsMetadataProviderSpecialization_completeWithCuratedCollection__block_invoke_2;
        v30[3] = &unk_1E44AA478;
        v24 = v22;
        v31 = v24;
        v25 = v11;
        v26 = *(_QWORD *)(a1 + 32);
        v32 = v25;
        v33 = v26;
        -[LPImageFetcher fetchWithConfiguration:completionHandler:](v24, "fetchWithConfiguration:completionHandler:", v19, v30);

      }
      v27[0] = v15;
      v27[1] = 3221225472;
      v27[2] = __74__LPAppleMapsMetadataProviderSpecialization_completeWithCuratedCollection__block_invoke_3;
      v27[3] = &unk_1E44A8DD0;
      v27[4] = *(_QWORD *)(a1 + 32);
      v28 = v7;
      v29 = v8;
      dispatch_group_notify(v11, MEMORY[0x1E0C80D38], v27);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "fail");
    }
  }

}

void __74__LPAppleMapsMetadataProviderSpecialization_completeWithCuratedCollection__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = *(id *)(a1 + 32);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "image");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 56), "setImage:", v4);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __74__LPAppleMapsMetadataProviderSpecialization_completeWithCuratedCollection__block_invoke_3(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  id MKIconManagerClass;
  void *v6;
  void *v7;
  LPImage *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!*((_BYTE *)a1[4] + 24))
  {
    objc_msgSend(a1[5], "collectionTitle");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*((id *)a1[4] + 7), "setName:", v2);

    objc_msgSend(*((id *)a1[4] + 7), "setNumberOfItems:", objc_msgSend(a1[5], "numberOfItems"));
    objc_msgSend(a1[5], "publisherAttribution");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "displayName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*((id *)a1[4] + 7), "setPublisherName:", v4);

    MKIconManagerClass = getMKIconManagerClass();
    objc_msgSend(a1[5], "publisherAttribution");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MKIconManagerClass, "imageForIconID:contentScale:sizeGroup:nightMode:", objc_msgSend(v6, "iconIdentifier"), 1, 0, 3.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = -[LPImage initWithPlatformImage:]([LPImage alloc], "initWithPlatformImage:", v7);
    objc_msgSend(*((id *)a1[4] + 7), "setPublisherIcon:", v8);

    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v10 = a1[6];
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "_cnPostalAddress", (_QWORD)v15);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
            objc_msgSend(v9, "addObject:", v14);

        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v11);
    }

    if (objc_msgSend(v9, "count"))
      objc_msgSend(*((id *)a1[4] + 7), "setAddresses:", v9);
    objc_msgSend(a1[4], "complete", (_QWORD)v15);

  }
}

- (void)completeWithPublisher
{
  LPMapCollectionPublisherMetadata *v3;
  LPMapCollectionPublisherMetadata *publisherMetadata;
  LPMapMetadata *mapMetadata;
  void *v6;
  uint64_t v7;
  objc_class *v8;
  MKPlacePublisherRefiner *v9;
  MKPlacePublisherRefiner *publisherRefiner;
  MKPlacePublisherRefiner *v11;
  _QWORD v12[5];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v3 = objc_alloc_init(LPMapCollectionPublisherMetadata);
  publisherMetadata = self->_publisherMetadata;
  self->_publisherMetadata = v3;

  mapMetadata = self->_mapMetadata;
  self->_mapMetadata = 0;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2050000000;
  v6 = (void *)getMKPlacePublisherRefinerClass(void)::softClass;
  v17 = getMKPlacePublisherRefinerClass(void)::softClass;
  v7 = MEMORY[0x1E0C809B0];
  if (!getMKPlacePublisherRefinerClass(void)::softClass)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = ___ZL31getMKPlacePublisherRefinerClassv_block_invoke;
    v13[3] = &unk_1E44A7DB0;
    v13[4] = &v14;
    ___ZL31getMKPlacePublisherRefinerClassv_block_invoke((uint64_t)v13);
    v6 = (void *)v15[3];
  }
  v8 = objc_retainAutorelease(v6);
  _Block_object_dispose(&v14, 8);
  v9 = (MKPlacePublisherRefiner *)objc_msgSend([v8 alloc], "initWithPublisherIdentifier:providerIdentifier:", -[_MKURLParser publisherMUID](self->_parser, "publisherMUID"), -[_MKURLParser searchProviderID](self->_parser, "searchProviderID"));
  publisherRefiner = self->_publisherRefiner;
  self->_publisherRefiner = v9;

  v11 = self->_publisherRefiner;
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __66__LPAppleMapsMetadataProviderSpecialization_completeWithPublisher__block_invoke;
  v12[3] = &unk_1E44AA4C8;
  v12[4] = self;
  -[MKPlacePublisherRefiner fetchWithCallbackQueue:completion:](v11, "fetchWithCallbackQueue:completion:", MEMORY[0x1E0C80D38], v12);
}

void __66__LPAppleMapsMetadataProviderSpecialization_completeWithPublisher__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  _BYTE *v6;
  void *v7;
  void *v8;
  id MKIconManagerClass;
  void *v10;
  void *v11;
  LPImage *v12;
  id v13;

  v13 = a2;
  v5 = a3;
  v6 = *(_BYTE **)(a1 + 32);
  if (!v6[24])
  {
    if (v5 || !v13)
    {
      objc_msgSend(v6, "fail");
    }
    else
    {
      objc_msgSend(v13, "publisherAttribution");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "displayName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setName:", v8);

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setNumberOfPublishedCollections:", objc_msgSend(v13, "totalCollectionCount"));
      MKIconManagerClass = getMKIconManagerClass();
      objc_msgSend(v13, "publisherAttribution");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MKIconManagerClass, "imageForIconID:contentScale:sizeGroup:nightMode:", objc_msgSend(v10, "iconIdentifier"), 1, 0, 3.0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = -[LPImage initWithPlatformImage:]([LPImage alloc], "initWithPlatformImage:", v11);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setIcon:", v12);

      objc_msgSend(*(id *)(a1 + 32), "complete");
    }
  }

}

- (void)complete
{
  void *v3;
  void *v4;
  void *mapMetadata;
  void *v6;
  LPLinkMetadata *v7;

  v7 = objc_alloc_init(LPLinkMetadata);
  -[LPMetadataProviderSpecialization URL](self, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPLinkMetadata setURL:](v7, "setURL:", v3);

  -[LPMetadataProviderSpecialization URL](self, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPLinkMetadata setOriginalURL:](v7, "setOriginalURL:", v4);

  mapMetadata = self->_mapMetadata;
  if (!mapMetadata)
  {
    mapMetadata = self->_collectionMetadata;
    if (!mapMetadata)
      mapMetadata = self->_publisherMetadata;
  }
  -[LPLinkMetadata setSpecialization:](v7, "setSpecialization:", mapMetadata);
  -[LPMetadataProviderSpecialization delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "metadataProviderSpecialization:didCompleteWithMetadata:", self, v7);

}

- (void)_internalPostProcessResolvedMetadataWithCompletionHandler:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(void);

  v6 = (void (**)(void))a3;
  -[LPMapMetadata image](self->_mapMetadata, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_computeDominantColorForProperties");

  -[LPMapMetadata darkImage](self->_mapMetadata, "darkImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_computeDominantColorForProperties");

  v6[2]();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publisherRefiner, 0);
  objc_storeStrong((id *)&self->_curatedCollectionRefiner, 0);
  objc_storeStrong((id *)&self->_publisherMetadata, 0);
  objc_storeStrong((id *)&self->_collectionMetadata, 0);
  objc_storeStrong((id *)&self->_mapMetadata, 0);
  objc_storeStrong((id *)&self->_parser, 0);
  objc_storeStrong((id *)&self->_geocoder, 0);
}

@end
