@implementation _MKLabelMarkerItem

+ (id)labelMarkerItemWithLabelMarker:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithLabelMarker:", v3);

  return v4;
}

- (_MKLabelMarkerItem)initWithLabelMarker:(id)a3
{
  id v5;
  _MKLabelMarkerItem *v6;
  _MKLabelMarkerItem *v7;
  _MKLabelMarkerItem *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_MKLabelMarkerItem;
  v6 = -[_MKLabelMarkerItem init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_labelMarker, a3);
    v8 = v7;
  }

  return v7;
}

- (BOOL)isValid
{
  return 1;
}

- (id)name
{
  return (id)-[VKLabelMarker text](self->_labelMarker, "text");
}

- (int)referenceFrame
{
  void *v2;

  v2 = (void *)MEMORY[0x1E0D27178];
  -[_MKLabelMarkerItem coordinate](self, "coordinate");
  if (objc_msgSend(v2, "isLocationShiftRequiredForCoordinate:"))
    return 2;
  else
    return 1;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate
{
  VKLabelMarker *labelMarker;
  double v3;
  double v4;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  labelMarker = self->_labelMarker;
  if (labelMarker)
  {
    -[VKLabelMarker coordinate](labelMarker, "coordinate");
  }
  else
  {
    v3 = -180.0;
    v4 = -180.0;
  }
  result.var1 = v4;
  result.var0 = v3;
  return result;
}

- (BOOL)_hasResolvablePartialInformation
{
  return 1;
}

- (id)_labelMarker
{
  return self->_labelMarker;
}

- (BOOL)_hasMUID
{
  return -[VKLabelMarker _mapkit_hasMUID](self->_labelMarker, "_mapkit_hasMUID");
}

- (unint64_t)_muid
{
  return -[VKLabelMarker _mapkit_muid](self->_labelMarker, "_mapkit_muid");
}

- (id)_identifier
{
  VKLabelMarker *labelMarker;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;

  if (-[VKLabelMarker _mapkit_hasMUID](self->_labelMarker, "_mapkit_hasMUID"))
  {
    labelMarker = self->_labelMarker;
    if (labelMarker)
    {
      -[VKLabelMarker coordinate](labelMarker, "coordinate");
      v5 = v4;
      v7 = v6;
    }
    else
    {
      v5 = -180.0;
      v7 = -180.0;
    }
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D271C0]), "initWithMUID:resultProviderID:coordinate:", -[VKLabelMarker _mapkit_muid](self->_labelMarker, "_mapkit_muid"), 0, v5, v7);
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (BOOL)_isTransitDisplayFeature
{
  objc_super v4;

  if ((-[VKLabelMarker isTransit](self->_labelMarker, "isTransit") & 1) != 0)
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)_MKLabelMarkerItem;
  return -[GEOBaseMapItem _isTransitDisplayFeature](&v4, sel__isTransitDisplayFeature);
}

- (id)_styleAttributes
{
  return (id)-[VKLabelMarker styleAttributes](self->_labelMarker, "styleAttributes");
}

- (id)_venueInfo
{
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void **v9;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  if (!-[VKLabelMarker venueID](self->_labelMarker, "venueID"))
    return 0;
  if (-[VKLabelMarker venueBuildingID](self->_labelMarker, "venueBuildingID"))
  {
    if (-[VKLabelMarker venueLevelID](self->_labelMarker, "venueLevelID"))
    {
      v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D276D0]), "initWithOrdinal:levelID:", -[VKLabelMarker venueFloorOrdinal](self->_labelMarker, "venueFloorOrdinal"), -[VKLabelMarker venueLevelID](self->_labelMarker, "venueLevelID"));
      v4 = -[VKLabelMarker venueComponentID](self->_labelMarker, "venueComponentID");
      v5 = objc_alloc(MEMORY[0x1E0D276C8]);
      v6 = -[VKLabelMarker venueBuildingID](self->_labelMarker, "venueBuildingID");
      if (v4)
      {
        v7 = (void *)objc_msgSend(v5, "initWithBuildingID:floorInfo:unitID:", v6, v3, -[VKLabelMarker venueComponentID](self->_labelMarker, "venueComponentID"));
        v17[0] = v7;
        v8 = 4;
        v9 = (void **)v17;
      }
      else
      {
        v7 = (void *)objc_msgSend(v5, "initWithBuildingID:floorInfo:", v6, v3);
        v16 = v7;
        v8 = 3;
        v9 = &v16;
      }
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D276C8]), "initWithBuildingID:", -[VKLabelMarker venueBuildingID](self->_labelMarker, "venueBuildingID"));
      v15 = v3;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 2;
    }

  }
  else
  {
    v11 = (void *)MEMORY[0x1E0C9AA60];
    v8 = 1;
  }
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D276D8]), "initWithVenueID:componentIdentifiers:", -[VKLabelMarker venueID](self->_labelMarker, "venueID"), v11);
  v13 = objc_alloc(MEMORY[0x1E0D27200]);
  v14 = (void *)objc_msgSend(v13, "initWithIdentifier:featureType:filters:parent:contents:", v12, v8, MEMORY[0x1E0C9AA60], 0, 0);

  return v14;
}

- (BOOL)_hasVenueFeatureType
{
  void *v2;
  BOOL v3;

  -[_MKLabelMarkerItem _venueInfo](self, "_venueInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (int)_venueFeatureType
{
  void *v3;
  void *v4;
  int v5;

  -[_MKLabelMarkerItem _venueInfo](self, "_venueInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[_MKLabelMarkerItem _venueInfo](self, "_venueInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "venueFeatureType");

  return v5;
}

- (id)_place
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  -[_MKLabelMarkerItem coordinate](self, "coordinate");
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D27330]), "initWithLatitude:longitude:", v3, v4);
  -[_MKLabelMarkerItem name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setName:", v6);

  v7 = objc_alloc_init(MEMORY[0x1E0D26F28]);
  -[_MKLabelMarkerItem name](self, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setName:", v8);

  objc_msgSend(v7, "setUID:", -[_MKLabelMarkerItem _muid](self, "_muid"));
  objc_msgSend(v5, "addBusiness:", v7);

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelMarker, 0);
}

@end
