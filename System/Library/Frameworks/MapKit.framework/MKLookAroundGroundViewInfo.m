@implementation MKLookAroundGroundViewInfo

- (MKLookAroundGroundViewInfo)initWithStartHeading:(double)a3 endHeading:(double)a4 localityName:(id)a5 locationName:(id)a6 secondaryLocationName:(id)a7
{
  id v12;
  id v13;
  id v14;
  MKLookAroundGroundViewInfo *v15;
  MKLookAroundGroundViewInfo *v16;
  GEOLocationInfo *v17;
  GEOLocationInfo *locationInfo;
  void *v19;
  void *v20;
  void *v21;
  objc_super v23;

  v12 = a5;
  v13 = a6;
  v14 = a7;
  v23.receiver = self;
  v23.super_class = (Class)MKLookAroundGroundViewInfo;
  v15 = -[MKLookAroundGroundViewInfo init](&v23, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->_startHeading = a3;
    v15->_endHeading = a4;
    v17 = (GEOLocationInfo *)objc_alloc_init(MEMORY[0x1E0D27170]);
    locationInfo = v16->_locationInfo;
    v16->_locationInfo = v17;

    v19 = (void *)objc_msgSend(v12, "copy");
    -[GEOLocationInfo setLocalityName:](v16->_locationInfo, "setLocalityName:", v19);

    v20 = (void *)objc_msgSend(v13, "copy");
    -[GEOLocationInfo setLocationName:](v16->_locationInfo, "setLocationName:", v20);

    v21 = (void *)objc_msgSend(v14, "copy");
    -[GEOLocationInfo setSecondaryLocationName:](v16->_locationInfo, "setSecondaryLocationName:", v21);

  }
  return v16;
}

- (BOOL)isHeadingInRange:(double)a3
{
  double v5;
  double v6;
  double v7;
  BOOL v8;

  -[MKLookAroundGroundViewInfo startHeading](self, "startHeading");
  v6 = v5;
  -[MKLookAroundGroundViewInfo endHeading](self, "endHeading");
  if (v6 >= v7)
  {
    if (v6 <= v7)
      return 0;
    if (v6 <= a3 && v7 < a3)
      return 1;
    v8 = a3 >= 0.0;
  }
  else
  {
    v8 = v6 <= a3;
  }
  return v7 > a3 && v8;
}

- (double)startHeading
{
  return self->_startHeading;
}

- (double)endHeading
{
  return self->_endHeading;
}

- (GEOLocationInfo)locationInfo
{
  return self->_locationInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationInfo, 0);
}

@end
