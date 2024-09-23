@implementation GEOMapURLBuilder

+ (id)URLForCoordinate:(id)a3 label:(id)a4
{
  return (id)objc_msgSend(a1, "URLForCoordinate:address:label:", 0, a4, a3.var0, a3.var1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enrichmentInfo, 0);
  objc_storeStrong((id *)&self->_muninViewState, 0);
  objc_storeStrong((id *)&self->_extraStorage, 0);
  objc_storeStrong((id *)&self->_collectionStorage, 0);
  objc_storeStrong((id *)&self->_dict, 0);
}

+ (id)URLForCoordinate:(id)a3 address:(id)a4 label:(id)a5
{
  double var1;
  double var0;
  id v8;
  id v9;
  id v10;
  void *v11;

  var1 = a3.var1;
  var0 = a3.var0;
  v8 = a5;
  v9 = a4;
  v10 = -[GEOMapURLBuilder initForCoordinate:address:label:]([GEOMapURLBuilder alloc], "initForCoordinate:address:label:", v9, v8, var0, var1);

  objc_msgSend(v10, "buildForWeb");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)initForCoordinate:(id)a3 address:(id)a4 label:(id)a5
{
  id v7;
  id v8;
  GEOMapURLBuilder *v9;
  uint64_t v10;
  NSMutableDictionary *dict;
  void *v12;
  objc_super v14;
  $F24F406B2B787EFB06265DBA3D28CBD5 v15;

  v15 = a3;
  v7 = a4;
  v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)GEOMapURLBuilder;
  v9 = -[GEOMapURLBuilder init](&v14, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
    dict = v9->_dict;
    v9->_dict = (NSMutableDictionary *)v10;

    -[GEOMapURLBuilder _stringForCoordinate2DPointer:](v9, "_stringForCoordinate2DPointer:", &v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9->_dict, "setObject:forKeyedSubscript:", v12, CFSTR("ll"));

    if (v7)
      -[NSMutableDictionary setObject:forKeyedSubscript:](v9->_dict, "setObject:forKeyedSubscript:", v7, CFSTR("address"));
    if (v8)
      -[NSMutableDictionary setObject:forKeyedSubscript:](v9->_dict, "setObject:forKeyedSubscript:", v8, CFSTR("q"));
  }

  return v9;
}

- (id)buildForWeb
{
  return _geo_URLForDictionary(2, self->_dict);
}

- (id)_stringForCoordinate2DPointer:(id *)a3
{
  void *v3;
  NSObject *v5;
  void *v6;
  uint8_t buf[4];
  void *v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lf,%lf"), *(_QWORD *)&a3->var0, *(_QWORD *)&a3->var1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOMapURLBuilder");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v9 = v6;
      v10 = 2082;
      v11 = "nil == coordinate";
      _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_ERROR, "%{public}@ forbids: %{public}s", buf, 0x16u);

    }
    v3 = 0;
  }
  return v3;
}

- (id)initForSearch:(id)a3
{
  id v4;
  GEOMapURLBuilder *v5;
  uint64_t v6;
  NSMutableDictionary *dict;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOMapURLBuilder;
  v5 = -[GEOMapURLBuilder init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
    dict = v5->_dict;
    v5->_dict = (NSMutableDictionary *)v6;

    -[NSMutableDictionary setObject:forKeyedSubscript:](v5->_dict, "setObject:forKeyedSubscript:", v4, CFSTR("q"));
  }

  return v5;
}

- (void)setNear:(id)a3
{
  void *v4;
  uint64_t v5;

  -[GEOMapURLBuilder _removeParametersAllBut:](self, "_removeParametersAllBut:", &unk_1E1E854E0, *(_QWORD *)&a3.var0, *(_QWORD *)&a3.var1);
  -[GEOMapURLBuilder _stringForCoordinate2DPointer:](self, "_stringForCoordinate2DPointer:", &v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_dict, "setObject:forKeyedSubscript:", v4, CFSTR("near"));

}

- (void)setSearchLocation:(id)a3 span:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  -[GEOMapURLBuilder _removeParametersAllBut:](self, "_removeParametersAllBut:", &unk_1E1E854F8, *(_QWORD *)&a4.var0, *(_QWORD *)&a4.var1, *(_QWORD *)&a3.var0, *(_QWORD *)&a3.var1);
  -[GEOMapURLBuilder _stringForCoordinate2DPointer:](self, "_stringForCoordinate2DPointer:", &v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_dict, "setObject:forKeyedSubscript:", v5, CFSTR("sll"));

  -[GEOMapURLBuilder _stringForCoordinateSpanPointer:](self, "_stringForCoordinateSpanPointer:", &v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_dict, "setObject:forKeyedSubscript:", v6, CFSTR("sspn"));

}

- (void)setSearchLocation:(id)a3 zoomLevel:(double)a4
{
  void *v6;
  void *v7;
  $F24F406B2B787EFB06265DBA3D28CBD5 v8;

  v8 = a3;
  -[GEOMapURLBuilder _removeParametersAllBut:](self, "_removeParametersAllBut:", &unk_1E1E85510);
  -[GEOMapURLBuilder _stringForCoordinate2DPointer:](self, "_stringForCoordinate2DPointer:", &v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_dict, "setObject:forKeyedSubscript:", v6, CFSTR("sll"));

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lf"), *(_QWORD *)&a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_dict, "setObject:forKeyedSubscript:", v7, CFSTR("z"));

}

+ (id)URLForSearch:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  v4 = -[GEOMapURLBuilder initForSearch:]([GEOMapURLBuilder alloc], "initForSearch:", v3);

  objc_msgSend(v4, "buildForWeb");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)URLForSearch:(id)a3 near:(id)a4
{
  double var1;
  double var0;
  id v6;
  id v7;
  void *v8;

  var1 = a4.var1;
  var0 = a4.var0;
  v6 = a3;
  v7 = -[GEOMapURLBuilder initForSearch:]([GEOMapURLBuilder alloc], "initForSearch:", v6);

  objc_msgSend(v7, "setNear:", var0, var1);
  objc_msgSend(v7, "buildForWeb");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)URLForSearch:(id)a3 at:(id)a4 span:(id)a5
{
  double var1;
  double var0;
  double v7;
  double v8;
  id v9;
  id v10;
  void *v11;

  var1 = a5.var1;
  var0 = a5.var0;
  v7 = a4.var1;
  v8 = a4.var0;
  v9 = a3;
  v10 = -[GEOMapURLBuilder initForSearch:]([GEOMapURLBuilder alloc], "initForSearch:", v9);

  objc_msgSend(v10, "setSearchLocation:span:", v8, v7, var0, var1);
  objc_msgSend(v10, "buildForWeb");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)URLForSearch:(id)a3 at:(id)a4 zoomLevel:(double)a5
{
  double var1;
  double var0;
  id v8;
  id v9;
  void *v10;

  var1 = a4.var1;
  var0 = a4.var0;
  v8 = a3;
  v9 = -[GEOMapURLBuilder initForSearch:]([GEOMapURLBuilder alloc], "initForSearch:", v8);

  objc_msgSend(v9, "setSearchLocation:zoomLevel:", var0, var1, a5);
  objc_msgSend(v9, "buildForWeb");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)initForCoordinate:(id)a3 label:(id)a4
{
  id v5;
  GEOMapURLBuilder *v6;
  uint64_t v7;
  NSMutableDictionary *dict;
  void *v9;
  objc_super v11;
  $F24F406B2B787EFB06265DBA3D28CBD5 v12;

  v12 = a3;
  v5 = a4;
  v11.receiver = self;
  v11.super_class = (Class)GEOMapURLBuilder;
  v6 = -[GEOMapURLBuilder init](&v11, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
    dict = v6->_dict;
    v6->_dict = (NSMutableDictionary *)v7;

    -[GEOMapURLBuilder _stringForCoordinate2DPointer:](v6, "_stringForCoordinate2DPointer:", &v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v6->_dict, "setObject:forKeyedSubscript:", v9, CFSTR("ll"));

    if (v5)
      -[NSMutableDictionary setObject:forKeyedSubscript:](v6->_dict, "setObject:forKeyedSubscript:", v5, CFSTR("q"));
  }

  return v6;
}

- (id)initForAddress:(id)a3 label:(id)a4
{
  id v6;
  id v7;
  GEOMapURLBuilder *v8;
  uint64_t v9;
  NSMutableDictionary *dict;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)GEOMapURLBuilder;
  v8 = -[GEOMapURLBuilder init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
    dict = v8->_dict;
    v8->_dict = (NSMutableDictionary *)v9;

    -[NSMutableDictionary setObject:forKeyedSubscript:](v8->_dict, "setObject:forKeyedSubscript:", v6, CFSTR("address"));
    if (v7)
      -[NSMutableDictionary setObject:forKeyedSubscript:](v8->_dict, "setObject:forKeyedSubscript:", v7, CFSTR("q"));
  }

  return v8;
}

- (void)setDisplayRegion:(id)a3
{
  void *v4;
  _QWORD v5[2];

  v5[0] = *(_QWORD *)&a3.var1.var0;
  v5[1] = *(_QWORD *)&a3.var1.var1;
  -[GEOMapURLBuilder _stringForCoordinateSpanPointer:](self, "_stringForCoordinateSpanPointer:", v5, *(_QWORD *)&a3.var0.var0, *(_QWORD *)&a3.var0.var1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_dict, "setObject:forKeyedSubscript:", v4, CFSTR("spn"));

}

+ (id)URLForAddress:(id)a3
{
  return (id)objc_msgSend(a1, "URLForAddress:label:", a3, 0);
}

+ (id)URLForAddress:(id)a3 label:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  v7 = -[GEOMapURLBuilder initForAddress:label:]([GEOMapURLBuilder alloc], "initForAddress:label:", v6, v5);

  objc_msgSend(v7, "buildForWeb");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)URLForCoordinate:(id)a3
{
  return (id)objc_msgSend(a1, "URLForCoordinate:label:", 0, a3.var0, a3.var1);
}

+ (id)URLForCoordinate:(id)a3 address:(id)a4 label:(id)a5 extraStorage:(id)a6
{
  double var1;
  double var0;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;

  var1 = a3.var1;
  var0 = a3.var0;
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = -[GEOMapURLBuilder initForCoordinate:address:label:]([GEOMapURLBuilder alloc], "initForCoordinate:address:label:", v12, v11, var0, var1);

  objc_msgSend(v13, "setExtraStorage:", v10);
  objc_msgSend(v13, "buildForWeb");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)URLForCoordinate:(id)a3 address:(id)a4 label:(id)a5 extraStorage:(id)a6 useWebPlaceCard:(BOOL)a7
{
  return (id)objc_msgSend(a1, "URLForCoordinate:address:label:extraStorage:useWebPlaceCard:muninViewState:", a4, a5, a6, a7, 0, a3.var0, a3.var1);
}

+ (id)URLForCoordinate:(id)a3 address:(id)a4 label:(id)a5 extraStorage:(id)a6 useWebPlaceCard:(BOOL)a7 muninViewState:(id)a8
{
  double var1;
  double var0;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;

  var1 = a3.var1;
  var0 = a3.var0;
  v14 = a8;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = -[GEOMapURLBuilder initForCoordinate:address:label:]([GEOMapURLBuilder alloc], "initForCoordinate:address:label:", v17, v16, var0, var1);

  objc_msgSend(v18, "setExtraStorage:", v15);
  objc_msgSend(v18, "setMuninViewState:", v14);

  if (a7)
    objc_msgSend(v18, "buildForWebPlaceCard");
  else
    objc_msgSend(v18, "buildForWeb");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)initForDirectionsTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v9[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[GEOMapURLBuilder initForDirectionsToAddresses:](self, "initForDirectionsToAddresses:", v6);

  }
  else
  {
    v7 = -[GEOMapURLBuilder initForDirectionsToAddresses:](self, "initForDirectionsToAddresses:", 0);
  }

  return v7;
}

- (id)initForDirectionsToAddresses:(id)a3
{
  id v4;
  GEOMapURLBuilder *v5;
  uint64_t v6;
  NSMutableDictionary *dict;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOMapURLBuilder;
  v5 = -[GEOMapURLBuilder init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
    dict = v5->_dict;
    v5->_dict = (NSMutableDictionary *)v6;

    -[NSMutableDictionary setObject:forKeyedSubscript:](v5->_dict, "setObject:forKeyedSubscript:", v4, CFSTR("daddr"));
  }

  return v5;
}

- (void)setStartAddress:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOMapURLBuilder _removeParametersAllBut:](self, "_removeParametersAllBut:", &unk_1E1E85528);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_dict, "setObject:forKeyedSubscript:", v4, CFSTR("saddr"));

}

- (void)setTransportType:(int)a3
{
  -[GEOMapURLBuilder _removeParametersAllBut:](self, "_removeParametersAllBut:", &unk_1E1E85540);
  if (a3 <= 3)
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_dict, "setObject:forKeyedSubscript:", off_1E1C07190[a3], CFSTR("dirflg"));
}

- (void)setDestinationLabel:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_dict, "setObject:forKeyedSubscript:", v4, CFSTR("label"));

}

- (void)setDestinationMUID:(unint64_t)a3 provider:(int)a4
{
  uint64_t v4;
  void *v6;
  id v7;

  if (a3)
  {
    v4 = *(_QWORD *)&a4;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu"), a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_dict, "setObject:forKeyedSubscript:", v6, CFSTR("auid"));

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_dict, "setObject:forKeyedSubscript:", v7, CFSTR("lsp"));

  }
}

+ (id)URLForDirectionsFrom:(id)a3 to:(id)a4
{
  NSObject *v5;
  void *v6;
  int v8;
  void *v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if ((unint64_t)a3 | (unint64_t)a4)
  {
    objc_msgSend(a1, "URLForDirectionsFrom:to:transport:");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOMapURLBuilder");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543618;
      v9 = v6;
      v10 = 2082;
      v11 = "nil == destinationAddress && nil == startAddress";
      _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_ERROR, "%{public}@ forbids: %{public}s", (uint8_t *)&v8, 0x16u);

    }
    return 0;
  }
}

+ (id)URLForDirectionsFrom:(id)a3 toDestinations:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(v8, "count");
  if (v7 || v9)
  {
    objc_msgSend(a1, "URLForDirectionsFrom:toDestinations:transport:", v7, v8, 4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOMapURLBuilder");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v11;
      v16 = 2082;
      v17 = "0u == destinationAddresses.count && nil == startAddress";
      _os_log_impl(&dword_1885A9000, v10, OS_LOG_TYPE_ERROR, "%{public}@ forbids: %{public}s", (uint8_t *)&v14, 0x16u);

    }
    v12 = 0;
  }

  return v12;
}

+ (id)URLForDirectionsFrom:(id)a3 to:(id)a4 transport:(int)a5
{
  uint64_t v5;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v5 = *(_QWORD *)&a5;
  v22 = *MEMORY[0x1E0C80C00];
  v9 = (unint64_t)a3;
  v10 = (unint64_t)a4;
  v11 = (void *)v10;
  if (v9 | v10)
  {
    if (v10)
    {
      v17 = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "URLForDirectionsFrom:toDestinations:transport:", v9, v15, v5);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(a1, "URLForDirectionsFrom:toDestinations:transport:", v9, 0, v5);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOMapURLBuilder");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v19 = v13;
      v20 = 2082;
      v21 = "nil == destinationAddress && nil == startAddress";
      _os_log_impl(&dword_1885A9000, v12, OS_LOG_TYPE_ERROR, "%{public}@ forbids: %{public}s", buf, 0x16u);

    }
    v14 = 0;
  }

  return v14;
}

+ (id)URLForDirectionsFrom:(id)a3 toDestinations:(id)a4 transport:(int)a5
{
  uint64_t v5;
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  const char *v20;
  uint64_t v21;

  v5 = *(_QWORD *)&a5;
  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = objc_msgSend(v9, "count");
  if (v8 || v10)
  {
    v14 = -[GEOMapURLBuilder initForDirectionsToAddresses:]([GEOMapURLBuilder alloc], "initForDirectionsToAddresses:", v9);
    v15 = v14;
    if (v8)
      objc_msgSend(v14, "setStartAddress:", v8);
    if ((_DWORD)v5 != 4)
      objc_msgSend(v15, "setTransportType:", v5);
    objc_msgSend(v15, "buildForWeb");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOMapURLBuilder");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v12;
      v19 = 2082;
      v20 = "0u == destinationAddresses.count && nil == startAddress";
      _os_log_impl(&dword_1885A9000, v11, OS_LOG_TYPE_ERROR, "%{public}@ forbids: %{public}s", (uint8_t *)&v17, 0x16u);

    }
    v13 = 0;
  }

  return v13;
}

+ (id)URLForDirectionsFromHereTo:(id)a3 transport:(int)a4
{
  void *v4;
  NSObject *v6;
  void *v7;
  int v9;
  void *v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    objc_msgSend(a1, "URLForDirectionsFrom:to:transport:", 0, a3, *(_QWORD *)&a4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOMapURLBuilder");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543618;
      v10 = v7;
      v11 = 2082;
      v12 = "nil == destinationAddress";
      _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_ERROR, "%{public}@ forbids: %{public}s", (uint8_t *)&v9, 0x16u);

    }
    v4 = 0;
  }
  return v4;
}

+ (id)URLForDirectionsFromHereToDestinations:(id)a3 transport:(int)a4
{
  uint64_t v4;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v4 = *(_QWORD *)&a4;
  v16 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(a1, "URLForDirectionsFrom:toDestinations:transport:", 0, v7, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOMapURLBuilder");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v10;
      v14 = 2082;
      v15 = "0u == destinationAddresses.count";
      _os_log_impl(&dword_1885A9000, v9, OS_LOG_TYPE_ERROR, "%{public}@ forbids: %{public}s", (uint8_t *)&v12, 0x16u);

    }
    v8 = 0;
  }

  return v8;
}

+ (id)URLForDirectionsFromHereTo:(id)a3
{
  void *v3;
  NSObject *v5;
  void *v6;
  int v8;
  void *v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    objc_msgSend(a1, "URLForDirectionsFromHereTo:transport:", a3, 4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOMapURLBuilder");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543618;
      v9 = v6;
      v10 = 2082;
      v11 = "nil == destinationAddress";
      _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_ERROR, "%{public}@ forbids: %{public}s", (uint8_t *)&v8, 0x16u);

    }
    v3 = 0;
  }
  return v3;
}

+ (id)URLForDirectionsFromHereToDestinations:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v10;
  void *v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(a1, "URLForDirectionsFrom:toDestinations:transport:", 0, v5, 4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOMapURLBuilder");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v8;
      v12 = 2082;
      v13 = "0u == destinationAddresses.count";
      _os_log_impl(&dword_1885A9000, v7, OS_LOG_TYPE_ERROR, "%{public}@ forbids: %{public}s", (uint8_t *)&v10, 0x16u);

    }
    v6 = 0;
  }

  return v6;
}

+ (id)URLForDirectionsFromHereTo:(id)a3 label:(id)a4 muid:(unint64_t)a5 provider:(int)a6 transport:(int)a7
{
  uint64_t v7;
  uint64_t v8;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  int v20;
  void *v21;
  __int16 v22;
  const char *v23;
  uint64_t v24;

  v7 = *(_QWORD *)&a7;
  v8 = *(_QWORD *)&a6;
  v24 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  if (v12)
  {
    v14 = -[GEOMapURLBuilder initForDirectionsTo:]([GEOMapURLBuilder alloc], "initForDirectionsTo:", v12);
    v15 = v14;
    if ((_DWORD)v7 != 4)
      objc_msgSend(v14, "setTransportType:", v7);
    objc_msgSend(v15, "setDestinationLabel:", v13);
    objc_msgSend(v15, "setDestinationMUID:provider:", a5, v8);
    objc_msgSend(v15, "buildForWeb");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOMapURLBuilder");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543618;
      v21 = v18;
      v22 = 2082;
      v23 = "nil == destinationAddress";
      _os_log_impl(&dword_1885A9000, v17, OS_LOG_TYPE_ERROR, "%{public}@ forbids: %{public}s", (uint8_t *)&v20, 0x16u);

    }
    v16 = 0;
  }

  return v16;
}

- (id)initForCameraAt:(id)a3 altitude:(double)a4 rotation:(double)a5 tilt:(double)a6 roll:(double)a7
{
  GEOMapURLBuilder *v11;
  uint64_t v12;
  NSMutableDictionary *dict;
  void *v14;
  void *v15;
  objc_super v17;
  $F24F406B2B787EFB06265DBA3D28CBD5 v18;

  v18 = a3;
  v17.receiver = self;
  v17.super_class = (Class)GEOMapURLBuilder;
  v11 = -[GEOMapURLBuilder init](&v17, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
    dict = v11->_dict;
    v11->_dict = (NSMutableDictionary *)v12;

    -[GEOMapURLBuilder _stringForCoordinate2DPointer:](v11, "_stringForCoordinate2DPointer:", &v18);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v11->_dict, "setObject:forKeyedSubscript:", v14, CFSTR("ll"));

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lf,%lf,%lf,%lf"), *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&a7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v11->_dict, "setObject:forKeyedSubscript:", v15, CFSTR("cam"));

  }
  return v11;
}

+ (id)URLForCameraAt:(id)a3 altitude:(double)a4 rotation:(double)a5 tilt:(double)a6 roll:(double)a7
{
  id v7;
  void *v8;

  v7 = -[GEOMapURLBuilder initForCameraAt:altitude:rotation:tilt:roll:]([GEOMapURLBuilder alloc], "initForCameraAt:altitude:rotation:tilt:roll:", a3.var0, a3.var1, a4, a5, a6, a7);
  objc_msgSend(v7, "buildForWeb");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)initForCameraAt:(id)a3 zoomLevel:(double)a4 rotation:(double)a5 tilt:(double)a6 roll:(double)a7
{
  GEOMapURLBuilder *v11;
  uint64_t v12;
  NSMutableDictionary *dict;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;
  $F24F406B2B787EFB06265DBA3D28CBD5 v19;

  v19 = a3;
  v18.receiver = self;
  v18.super_class = (Class)GEOMapURLBuilder;
  v11 = -[GEOMapURLBuilder init](&v18, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
    dict = v11->_dict;
    v11->_dict = (NSMutableDictionary *)v12;

    -[GEOMapURLBuilder _stringForCoordinate2DPointer:](v11, "_stringForCoordinate2DPointer:", &v19);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v11->_dict, "setObject:forKeyedSubscript:", v14, CFSTR("ll"));

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lf"), *(_QWORD *)&a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v11->_dict, "setObject:forKeyedSubscript:", v15, CFSTR("z"));

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lf,%lf,%lf"), *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&a7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v11->_dict, "setObject:forKeyedSubscript:", v16, CFSTR("cam"));

  }
  return v11;
}

+ (id)URLForCameraAt:(id)a3 zoomLevel:(double)a4 rotation:(double)a5 tilt:(double)a6 roll:(double)a7
{
  id v7;
  void *v8;

  v7 = -[GEOMapURLBuilder initForCameraAt:zoomLevel:rotation:tilt:roll:]([GEOMapURLBuilder alloc], "initForCameraAt:zoomLevel:rotation:tilt:roll:", a3.var0, a3.var1, a4, a5, a6, a7);
  objc_msgSend(v7, "buildForWeb");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)initForInternalBusiness:(id)a3 id:(unint64_t)a4 provider:(int)a5
{
  uint64_t v5;
  id v8;
  GEOMapURLBuilder *v9;
  uint64_t v10;
  NSMutableDictionary *dict;
  void *v12;
  void *v13;
  objc_super v15;

  v5 = *(_QWORD *)&a5;
  v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GEOMapURLBuilder;
  v9 = -[GEOMapURLBuilder init](&v15, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
    dict = v9->_dict;
    v9->_dict = (NSMutableDictionary *)v10;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu"), a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9->_dict, "setObject:forKeyedSubscript:", v12, CFSTR("auid"));

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9->_dict, "setObject:forKeyedSubscript:", v13, CFSTR("lsp"));

    if (v8)
    {
      if (objc_msgSend(v8, "length"))
        -[NSMutableDictionary setObject:forKeyedSubscript:](v9->_dict, "setObject:forKeyedSubscript:", v8, CFSTR("q"));
    }
  }

  return v9;
}

- (id)initForExternalBusiness:(id)a3 id:(id)a4 ofContentProvider:(id)a5
{
  id v8;
  id v9;
  id v10;
  GEOMapURLBuilder *v11;
  uint64_t v12;
  NSMutableDictionary *dict;
  void *v14;
  void *v15;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)GEOMapURLBuilder;
  v11 = -[GEOMapURLBuilder init](&v17, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
    dict = v11->_dict;
    v11->_dict = (NSMutableDictionary *)v12;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v11->_dict, "setObject:forKeyedSubscript:", v14, CFSTR("cp"));

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v11->_dict, "setObject:forKeyedSubscript:", v15, CFSTR("cpid"));

    if (v8)
    {
      if (objc_msgSend(v8, "length"))
        -[NSMutableDictionary setObject:forKeyedSubscript:](v11->_dict, "setObject:forKeyedSubscript:", v8, CFSTR("q"));
    }
  }

  return v11;
}

- (void)setBusinessCoordinate:(id)a3
{
  NSObject *v5;
  void *v6;
  $F24F406B2B787EFB06265DBA3D28CBD5 v7;
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (a3.var1 < -180.0 || a3.var1 > 180.0 || a3.var0 < -90.0 || a3.var0 > 90.0)
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOMapURLBuilder");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v9 = v6;
      _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_ERROR, "%{public}@ cannot set an invalid coordinate.", buf, 0xCu);

    }
  }
  else
  {
    -[GEOMapURLBuilder _removeParametersAllBut:](self, "_removeParametersAllBut:", &unk_1E1E85558, *(_QWORD *)&v7.var0, *(_QWORD *)&v7.var1);
    -[GEOMapURLBuilder _stringForCoordinate2DPointer:](self, "_stringForCoordinate2DPointer:", &v7);
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_dict, "setObject:forKeyedSubscript:", v5, CFSTR("ll"));
  }

}

- (void)setBusinessAddress:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (v5 && objc_msgSend(v5, "length"))
  {
    -[GEOMapURLBuilder _removeParametersAllBut:](self, "_removeParametersAllBut:", &unk_1E1E85570);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_dict, "setObject:forKeyedSubscript:", v6, CFSTR("address"));
  }
  else
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOMapURLBuilder");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v8;
      _os_log_impl(&dword_1885A9000, v7, OS_LOG_TYPE_ERROR, "%{public}@ cannot set an invalid postal address.", (uint8_t *)&v9, 0xCu);

    }
  }

}

+ (id)URLForInternalBusiness:(id)a3 id:(unint64_t)a4 provider:(int)a5
{
  uint64_t v5;
  id v7;
  id v8;
  void *v9;

  v5 = *(_QWORD *)&a5;
  v7 = a3;
  v8 = -[GEOMapURLBuilder initForInternalBusiness:id:provider:]([GEOMapURLBuilder alloc], "initForInternalBusiness:id:provider:", v7, a4, v5);

  objc_msgSend(v8, "buildForWeb");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)URLForInternalBusiness:(id)a3 id:(unint64_t)a4 provider:(int)a5 coordinate:(id)a6 address:(id)a7
{
  double var1;
  double var0;
  uint64_t v9;
  id v12;
  id v13;
  id v14;
  void *v15;

  var1 = a6.var1;
  var0 = a6.var0;
  v9 = *(_QWORD *)&a5;
  v12 = a7;
  v13 = a3;
  v14 = -[GEOMapURLBuilder initForInternalBusiness:id:provider:]([GEOMapURLBuilder alloc], "initForInternalBusiness:id:provider:", v13, a4, v9);

  objc_msgSend(v14, "setBusinessCoordinate:", var0, var1);
  objc_msgSend(v14, "setBusinessAddress:", v12);

  objc_msgSend(v14, "buildForWeb");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)URLForInternalBusiness:(id)a3 id:(unint64_t)a4 provider:(int)a5 coordinate:(id)a6 address:(id)a7 extraStorage:(id)a8
{
  return (id)objc_msgSend(a1, "URLForInternalBusiness:id:provider:coordinate:address:extraStorage:useWebPlaceCard:", a3, a4, *(_QWORD *)&a5, a7, a8, 0, a6.var0, a6.var1);
}

+ (id)URLForInternalBusiness:(id)a3 id:(unint64_t)a4 provider:(int)a5 coordinate:(id)a6 address:(id)a7 extraStorage:(id)a8 useWebPlaceCard:(BOOL)a9
{
  return (id)objc_msgSend(a1, "URLForInternalBusiness:id:provider:coordinate:address:extraStorage:useWebPlaceCard:muninViewState:", a3, a4, *(_QWORD *)&a5, a7, a8, a9, a6.var0, a6.var1, 0);
}

+ (id)URLForInternalBusiness:(id)a3 id:(unint64_t)a4 provider:(int)a5 coordinate:(id)a6 address:(id)a7 extraStorage:(id)a8 useWebPlaceCard:(BOOL)a9 muninViewState:(id)a10
{
  double var1;
  double var0;
  uint64_t v15;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;

  var1 = a6.var1;
  var0 = a6.var0;
  v15 = *(_QWORD *)&a5;
  v18 = a10;
  v19 = a8;
  v20 = a7;
  v21 = a3;
  v22 = -[GEOMapURLBuilder initForInternalBusiness:id:provider:]([GEOMapURLBuilder alloc], "initForInternalBusiness:id:provider:", v21, a4, v15);

  objc_msgSend(v22, "setBusinessCoordinate:", var0, var1);
  objc_msgSend(v22, "setBusinessAddress:", v20);

  objc_msgSend(v22, "setExtraStorage:", v19);
  objc_msgSend(v22, "setMuninViewState:", v18);

  if (a9)
    objc_msgSend(v22, "buildForWebPlaceCard");
  else
    objc_msgSend(v22, "buildForWeb");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

+ (id)URLForInternalBusiness:(id)a3 id:(unint64_t)a4 provider:(int)a5 coordinate:(id)a6 address:(id)a7 extraStorage:(id)a8 useWebPlaceCard:(BOOL)a9 enrichmentInfo:(id)a10
{
  double var1;
  double var0;
  uint64_t v14;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;

  var1 = a6.var1;
  var0 = a6.var0;
  v14 = *(_QWORD *)&a5;
  v17 = a8;
  v18 = a7;
  v19 = a3;
  v20 = -[GEOMapURLBuilder initForInternalBusiness:id:provider:]([GEOMapURLBuilder alloc], "initForInternalBusiness:id:provider:", v19, a4, v14);

  objc_msgSend(v20, "setBusinessCoordinate:", var0, var1);
  objc_msgSend(v20, "setBusinessAddress:", v18);

  objc_msgSend(v20, "setExtraStorage:", v17);
  if (a9)
    objc_msgSend(v20, "buildForWebPlaceCard");
  else
    objc_msgSend(v20, "buildForWeb");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

+ (id)URLForExternalBusiness:(id)a3 id:(id)a4 ofContentProvider:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[GEOMapURLBuilder initForExternalBusiness:id:ofContentProvider:]([GEOMapURLBuilder alloc], "initForExternalBusiness:id:ofContentProvider:", v9, v8, v7);

  objc_msgSend(v10, "buildForWeb");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)setMapRegion:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[4];
  _QWORD v19[2];

  v4 = a3;
  v5 = GEOMapRectForMapRegion(v4);
  v18[2] = GEOCoordinateRegionForMapRect(v5, v6, v7, v8);
  v18[3] = v9;
  v19[0] = v10;
  v19[1] = v11;
  -[GEOMapURLBuilder _stringForCoordinateSpanPointer:](self, "_stringForCoordinateSpanPointer:", v19);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_dict, "setObject:forKeyedSubscript:", v12, CFSTR("spn"));

  objc_msgSend(v4, "centerLat");
  v14 = v13;
  objc_msgSend(v4, "centerLng");
  v16 = v15;

  v18[0] = v14;
  v18[1] = v16;
  -[GEOMapURLBuilder _stringForCoordinate2DPointer:](self, "_stringForCoordinate2DPointer:", v18);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_dict, "setObject:forKeyedSubscript:", v17, CFSTR("ll"));

}

- (id)initForTransitLine:(unint64_t)a3 withName:(id)a4 mapRegion:(id)a5
{
  id v8;
  id v9;
  GEOMapURLBuilder *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *dict;
  void *v13;
  objc_super v15;

  v8 = a4;
  v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)GEOMapURLBuilder;
  v10 = -[GEOMapURLBuilder init](&v15, sel_init);
  if (v10)
  {
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    dict = v10->_dict;
    v10->_dict = v11;

    -[GEOMapURLBuilder setMapType:](v10, "setMapType:", 3);
    if (v9)
      -[GEOMapURLBuilder setMapRegion:](v10, "setMapRegion:", v9);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu"), a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v10->_dict, "setObject:forKeyedSubscript:", v13, CFSTR("lineid"));

    if (v8)
      -[NSMutableDictionary setObject:forKeyedSubscript:](v10->_dict, "setObject:forKeyedSubscript:", v8, CFSTR("name"));
  }

  return v10;
}

+ (id)URLForTransitLine:(unint64_t)a3 withName:(id)a4 mapRegion:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;

  v7 = a5;
  v8 = a4;
  v9 = -[GEOMapURLBuilder initForTransitLine:withName:mapRegion:]([GEOMapURLBuilder alloc], "initForTransitLine:withName:mapRegion:", a3, v8, v7);

  objc_msgSend(v9, "buildForWeb");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)initForShowFavoritesType:(int64_t)a3
{
  GEOMapURLBuilder *v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *dict;
  const __CFString *v7;
  __CFString *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)GEOMapURLBuilder;
  v4 = -[GEOMapURLBuilder init](&v10, sel_init);
  if (v4)
  {
    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    dict = v4->_dict;
    v4->_dict = v5;

    v7 = CFSTR("pl");
    if (a3 == 2)
      v7 = CFSTR("tl");
    if (a3)
      v8 = (__CFString *)v7;
    else
      v8 = &stru_1E1C241D0;
    if (-[__CFString length](v8, "length"))
      -[NSMutableDictionary setObject:forKeyedSubscript:](v4->_dict, "setObject:forKeyedSubscript:", v8, CFSTR("showfavorites"));
  }
  return v4;
}

+ (id)URLForShowFavoritesType:(int64_t)a3
{
  id v3;
  void *v4;

  v3 = -[GEOMapURLBuilder initForShowFavoritesType:]([GEOMapURLBuilder alloc], "initForShowFavoritesType:", a3);
  objc_msgSend(v3, "buildForWeb");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)initForCollectionStorage:(id)a3
{
  id v4;
  GEOMapURLBuilder *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *dict;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOMapURLBuilder;
  v5 = -[GEOMapURLBuilder init](&v9, sel_init);
  if (v5)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    dict = v5->_dict;
    v5->_dict = v6;

    -[GEOMapURLBuilder setCollectionStorage:](v5, "setCollectionStorage:", v4);
  }

  return v5;
}

+ (id)URLForCollectionStorage:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  v4 = -[GEOMapURLBuilder initForCollectionStorage:]([GEOMapURLBuilder alloc], "initForCollectionStorage:", v3);

  objc_msgSend(v4, "buildForCollections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)initForCuratedCollection:(unint64_t)a3 provider:(int)a4
{
  uint64_t v4;
  GEOMapURLBuilder *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *dict;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = *(_QWORD *)&a4;
  v12.receiver = self;
  v12.super_class = (Class)GEOMapURLBuilder;
  v6 = -[GEOMapURLBuilder init](&v12, sel_init);
  if (v6)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    dict = v6->_dict;
    v6->_dict = v7;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu"), a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v6->_dict, "setObject:forKeyedSubscript:", v9, CFSTR("pg"));

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v6->_dict, "setObject:forKeyedSubscript:", v10, CFSTR("lsp"));

  }
  return v6;
}

+ (id)URLForCuratedCollection:(unint64_t)a3 provider:(int)a4
{
  id v4;
  void *v5;

  v4 = -[GEOMapURLBuilder initForCuratedCollection:provider:]([GEOMapURLBuilder alloc], "initForCuratedCollection:provider:", a3, *(_QWORD *)&a4);
  objc_msgSend(v4, "buildForCollections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)initForPublisher:(unint64_t)a3 provider:(int)a4
{
  uint64_t v4;
  GEOMapURLBuilder *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *dict;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = *(_QWORD *)&a4;
  v12.receiver = self;
  v12.super_class = (Class)GEOMapURLBuilder;
  v6 = -[GEOMapURLBuilder init](&v12, sel_init);
  if (v6)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    dict = v6->_dict;
    v6->_dict = v7;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu"), a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v6->_dict, "setObject:forKeyedSubscript:", v9, CFSTR("pp"));

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v6->_dict, "setObject:forKeyedSubscript:", v10, CFSTR("lsp"));

  }
  return v6;
}

+ (id)URLForPublisher:(unint64_t)a3 provider:(int)a4
{
  id v4;
  void *v5;

  v4 = -[GEOMapURLBuilder initForPublisher:provider:]([GEOMapURLBuilder alloc], "initForPublisher:provider:", a3, *(_QWORD *)&a4);
  objc_msgSend(v4, "buildForCollections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)build
{
  return _geo_URLForDictionary(1, self->_dict);
}

- (id)buildForCollections
{
  return _geo_URLForDictionary(4, self->_dict);
}

- (id)buildForWebPlaceCard
{
  return _geo_URLForDictionary(3, self->_dict);
}

- (void)setMapType:(int)a3
{
  if (a3 <= 4)
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_dict, "setObject:forKeyedSubscript:", off_1E1C071B0[a3], CFSTR("t"));
}

- (void)setContentProvider:(id)a3
{
  if (a3)
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_dict, "setObject:forKeyedSubscript:", a3, CFSTR("cp"));
}

- (void)addCodable:(id)a3 key:(id)a4 compressedKey:(id)a5
{
  id v8;
  id v9;
  Bytef *v10;
  unint64_t v11;
  uint64_t v12;
  int v13;
  void *v14;
  id v15;
  NSMutableDictionary *dict;
  id v17;
  void *v18;
  id v19;
  unint64_t v20;
  Bytef *v21;

  v19 = a5;
  if (a3)
  {
    v8 = a4;
    objc_msgSend(a3, "data");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "length")
      && (unint64_t)objc_msgSend(v9, "length") >= 0x1F5
      && (v20 = 0,
          v21 = 0,
          v9 = objc_retainAutorelease(v9),
          GEOZlibCompress((const Bytef *)objc_msgSend(v9, "bytes"), objc_msgSend(v9, "length"), &v21, &v20),
          (v10 = v21) != 0)
      && (v11 = v20, v11 < objc_msgSend(v9, "length")))
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v10, v11);
      v12 = objc_claimAutoreleasedReturnValue();

      v13 = 1;
      v9 = (id)v12;
    }
    else
    {
      v13 = 0;
    }
    objc_msgSend(v9, "base64EncodedStringWithOptions:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      v15 = v19;
    else
      v15 = v8;
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_dict, "setObject:forKeyedSubscript:", v14, v15);

    goto LABEL_14;
  }
  dict = self->_dict;
  v17 = a4;
  -[NSMutableDictionary removeObjectForKey:](dict, "removeObjectForKey:", v17);

  v18 = v19;
  if (v19)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_dict, "removeObjectForKey:", v19);
LABEL_14:
    v18 = v19;
  }

}

- (id)_stringForCoordinateSpanPointer:(id *)a3
{
  void *v3;
  NSObject *v5;
  void *v6;
  uint8_t buf[4];
  void *v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lf,%lf"), *(_QWORD *)&a3->var0, *(_QWORD *)&a3->var1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOMapURLBuilder");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v9 = v6;
      v10 = 2082;
      v11 = "nil == span";
      _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_ERROR, "%{public}@ forbids: %{public}s", buf, 0x16u);

    }
    v3 = 0;
  }
  return v3;
}

- (void)_removeParametersAllBut:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSMutableDictionary allKeys](self->_dict, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        if ((objc_msgSend(v4, "containsObject:", v10) & 1) == 0)
          -[NSMutableDictionary removeObjectForKey:](self->_dict, "removeObjectForKey:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)setExtraStorage:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_extraStorage, a3);
  v5 = a3;
  -[GEOMapURLBuilder addCodable:key:compressedKey:](self, "addCodable:key:compressedKey:", v5, CFSTR("_ext"), CFSTR("_extc"));

}

- (void)setCollectionStorage:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_collectionStorage, a3);
  v5 = a3;
  -[GEOMapURLBuilder addCodable:key:compressedKey:](self, "addCodable:key:compressedKey:", v5, CFSTR("ug"), 0);

}

- (void)setMuninViewState:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_muninViewState, a3);
  v5 = a3;
  -[GEOMapURLBuilder addCodable:key:compressedKey:](self, "addCodable:key:compressedKey:", v5, CFSTR("_mvs"), CFSTR("_mvsc"));

}

- (GEOURLCollectionStorage)collectionStorage
{
  return self->_collectionStorage;
}

- (GEOURLExtraStorage)extraStorage
{
  return self->_extraStorage;
}

- (GEOMuninViewState)muninViewState
{
  return self->_muninViewState;
}

- (GEOEnrichmentInfo)enrichmentInfo
{
  return self->_enrichmentInfo;
}

- (void)setEnrichmentInfo:(id)a3
{
  objc_storeStrong((id *)&self->_enrichmentInfo, a3);
}

@end
