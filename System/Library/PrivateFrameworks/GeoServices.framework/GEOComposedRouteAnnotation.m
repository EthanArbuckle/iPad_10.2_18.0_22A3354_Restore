@implementation GEOComposedRouteAnnotation

- (GEOComposedRouteAnnotation)initWithEnrouteNotice:(id)a3 enrouteNoticeIndex:(unint64_t)a4 legIndex:(unint64_t)a5 annotation:(id)a6 onRoute:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  float v17;
  uint64_t v18;
  GEOComposedRouteAnnotation *v19;
  GEOComposedRouteAnnotation *v20;
  double v21;
  double v22;
  GEOLatLng *v23;
  GEOLatLng *derivedPosition;
  GEOComposedRouteAnnotation *v25;
  NSObject *v27;
  const char *v28;
  objc_super v29;
  uint8_t buf[16];

  v12 = a3;
  v13 = a6;
  v14 = a7;
  if (objc_msgSend(v12, "type") != 3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      v27 = MEMORY[0x1E0C81028];
      v28 = "Assertion failed: enrouteNotice.type == GEOEnrouteNotice_Type_ANNOTATION";
      goto LABEL_15;
    }
LABEL_13:
    v25 = 0;
    goto LABEL_7;
  }
  objc_msgSend(v12, "routeAnnotation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      v27 = MEMORY[0x1E0C81028];
      v28 = "Assertion failed: enrouteNotice.routeAnnotation != ((void *)0)";
      goto LABEL_15;
    }
    goto LABEL_13;
  }
  objc_msgSend(v12, "routeAnnotation");
  v16 = (id)objc_claimAutoreleasedReturnValue();

  if (v16 != v13)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      goto LABEL_13;
    *(_WORD *)buf = 0;
    v27 = MEMORY[0x1E0C81028];
    v28 = "Assertion failed: enrouteNotice.routeAnnotation == annotation";
LABEL_15:
    _os_log_fault_impl(&dword_1885A9000, v27, OS_LOG_TYPE_FAULT, v28, buf, 2u);
    goto LABEL_13;
  }
  objc_msgSend(v13, "offsetMeters");
  v18 = objc_msgSend(v14, "routeCoordinateForDistance:afterStartOfLegIndex:", a5, v17);
  v29.receiver = self;
  v29.super_class = (Class)GEOComposedRouteAnnotation;
  v19 = -[GEOComposedEnrouteNotice initWithEnrouteNotice:enrouteNoticeIndex:legIndex:onRoute:withPolylineCoordinate:](&v29, sel_initWithEnrouteNotice_enrouteNoticeIndex_legIndex_onRoute_withPolylineCoordinate_, v12, a4, a5, v14, v18);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_annotation, a6);
    objc_msgSend(v14, "pointAtRouteCoordinate:", v18);
    v23 = -[GEOLatLng initWithLatitude:longitude:]([GEOLatLng alloc], "initWithLatitude:longitude:", v21, v22);
    derivedPosition = v20->_derivedPosition;
    v20->_derivedPosition = v23;

  }
  self = v20;
  v25 = self;
LABEL_7:

  return v25;
}

- (id)description
{
  id v3;
  void *v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  __CFString *v11;
  void *v12;
  void *v13;
  float v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (-[GEOEnrouteNotice hasType](self->super._enrouteNotice, "hasType"))
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    v5 = -[GEOEnrouteNotice type](self->super._enrouteNotice, "type");
    if (v5 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v5);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E1C12898[(int)v5];
    }
    objc_msgSend(v4, "stringWithFormat:", CFSTR("[%@]"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v7);

  }
  if (-[GEORouteAnnotation hasArtwork](self->_annotation, "hasArtwork"))
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    -[GEORouteAnnotation artwork](self->_annotation, "artwork");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "artworkType");
    if (v10 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v10);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = off_1E1C128B8[(int)v10];
    }
    objc_msgSend(v8, "stringWithFormat:", CFSTR("[%@]"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v12);

  }
  if (-[GEORouteAnnotation hasOffsetMeters](self->_annotation, "hasOffsetMeters"))
  {
    v13 = (void *)MEMORY[0x1E0CB3940];
    -[GEORouteAnnotation offsetMeters](self->_annotation, "offsetMeters");
    objc_msgSend(v13, "stringWithFormat:", CFSTR("Offset Meters: %g"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v15);

  }
  v16 = (void *)MEMORY[0x1E0CB3940];
  -[GEOComposedRouteAnnotation position](self, "position");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "lat");
  v19 = v18;
  -[GEOComposedRouteAnnotation position](self, "position");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "lng");
  objc_msgSend(v16, "stringWithFormat:", CFSTR("%f, %f"), v19, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v22);

  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(" "));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (id)position
{
  return self->_derivedPosition;
}

- (GEOPBTransitArtwork)artwork
{
  return -[GEORouteAnnotation artwork](self->_annotation, "artwork");
}

- (GEOMiniCard)infoCard
{
  return -[GEORouteAnnotation infoCard](self->_annotation, "infoCard");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOComposedRouteAnnotation)initWithCoder:(id)a3
{
  id v4;
  GEOComposedRouteAnnotation *v5;
  uint64_t v6;
  GEORouteAnnotation *annotation;
  uint64_t v8;
  GEOLatLng *derivedPosition;
  GEOComposedRouteAnnotation *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GEOComposedRouteAnnotation;
  v5 = -[GEOComposedEnrouteNotice initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_annotation"));
    v6 = objc_claimAutoreleasedReturnValue();
    annotation = v5->_annotation;
    v5->_annotation = (GEORouteAnnotation *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_derivedPosition"));
    v8 = objc_claimAutoreleasedReturnValue();
    derivedPosition = v5->_derivedPosition;
    v5->_derivedPosition = (GEOLatLng *)v8;

    v10 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GEOComposedRouteAnnotation;
  v4 = a3;
  -[GEOComposedEnrouteNotice encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_annotation, CFSTR("_annotation"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_derivedPosition, CFSTR("_derivedPosition"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_derivedPosition, 0);
  objc_storeStrong((id *)&self->_annotation, 0);
}

@end
