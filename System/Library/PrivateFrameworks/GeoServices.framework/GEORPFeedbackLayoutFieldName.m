@implementation GEORPFeedbackLayoutFieldName

- (int)workflowFieldName
{
  if ((*(_BYTE *)&self->_flags & 0x80000000) != 0)
    return self->_workflowFieldName;
  else
    return 0;
}

- (void)setWorkflowFieldName:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x80u;
  self->_workflowFieldName = a3;
}

- (void)setHasWorkflowFieldName:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = v3 & 0x80 | *(_BYTE *)&self->_flags & 0x7F;
}

- (BOOL)hasWorkflowFieldName
{
  return *(_BYTE *)&self->_flags >> 7;
}

- (id)workflowFieldNameAsString:(int)a3
{
  if (a3 < 0xA)
    return off_1E1C13308[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsWorkflowFieldName:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_WORKFLOW_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_WORKFLOW_LABEL")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_WORKFLOW_SEARCH")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_WORKFLOW_NAVIGATION")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_WORKFLOW_TRANSIT")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_WORKFLOW_PLACE")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_WORKFLOW_ADDRESS")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_WORKFLOW_HOME")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_WORKFLOW_WORK")) & 1) != 0)
  {
    v4 = 8;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_WORKFLOW_OTHER")))
  {
    v4 = 9;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)poiFieldName
{
  if ((*(_BYTE *)&self->_flags & 0x20) != 0)
    return self->_poiFieldName;
  else
    return 0;
}

- (void)setPoiFieldName:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x20u;
  self->_poiFieldName = a3;
}

- (void)setHasPoiFieldName:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xDF | v3;
}

- (BOOL)hasPoiFieldName
{
  return (*(_BYTE *)&self->_flags >> 5) & 1;
}

- (id)poiFieldNameAsString:(int)a3
{
  if (a3 < 9)
    return off_1E1C13358[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsPoiFieldName:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_POI_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_POI_NAME")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_POI_CATEGORY")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_POI_HOURS")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_POI_WEBSITE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_POI_PHONE")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_POI_AMENITIES")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_POI_PARENT_CONTAINMENT")) & 1) != 0)
  {
    v4 = 7;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_POI_CHILD_CONTAINMENT")))
  {
    v4 = 8;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)addressFieldName
{
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    return self->_addressFieldName;
  else
    return 0;
}

- (void)setAddressFieldName:(int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_addressFieldName = a3;
}

- (void)setHasAddressFieldName:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasAddressFieldName
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)addressFieldNameAsString:(int)a3
{
  __CFString *v3;

  if (a3 < 8 && ((0xFDu >> a3) & 1) != 0)
  {
    v3 = off_1E1C133A0[a3];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsAddressFieldName:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_ADDRESS_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_ADDRESS_LOCATION")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_ADDRESS_LOCATION_ENTRY_POINT")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_ADDRESS_BASIC")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_ADDRESS_UNIT")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_ADDRESS_FLOOR")) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_ADDRESS_BLDG")))
  {
    v4 = 7;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)otherFieldName
{
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
    return self->_otherFieldName;
  else
    return 0;
}

- (void)setOtherFieldName:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x10u;
  self->_otherFieldName = a3;
}

- (void)setHasOtherFieldName:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xEF | v3;
}

- (BOOL)hasOtherFieldName
{
  return (*(_BYTE *)&self->_flags >> 4) & 1;
}

- (id)otherFieldNameAsString:(int)a3
{
  if (a3 < 3)
    return off_1E1C133E0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsOtherFieldName:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_OTHER_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_OTHER_PHOTO")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_OTHER_COMMENTS")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)groundviewFieldName
{
  if ((*(_BYTE *)&self->_flags & 4) != 0)
    return self->_groundviewFieldName;
  else
    return 0;
}

- (void)setGroundviewFieldName:(int)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_groundviewFieldName = a3;
}

- (void)setHasGroundviewFieldName:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasGroundviewFieldName
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (id)groundviewFieldNameAsString:(int)a3
{
  __CFString *v3;

  if (a3 < 0xD && ((0x10FFu >> a3) & 1) != 0)
  {
    v3 = off_1E1C133F8[a3];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsGroundviewFieldName:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_GROUNDVIEW_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_GROUNDVIEW_TITLE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_GROUNDVIEW_LOCATION")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_GROUNDVIEW_SUBTYPE_BAD_IMAGERY")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_GROUNDVIEW_SUBTYPE_BLUR_FACE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_GROUNDVIEW_SUBTYPE_BLUR_ADDRESS")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_GROUNDVIEW_SUBTYPE_BAD_LABEL")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_GROUNDVIEW_SUBTYPE_OTHER")) & 1) != 0)
  {
    v4 = 7;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_GROUNDVIEW_CONTACT_INFO")))
  {
    v4 = 12;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)incidentType
{
  if ((*(_BYTE *)&self->_flags & 8) != 0)
    return self->_incidentType;
  else
    return 0;
}

- (void)setIncidentType:(int)a3
{
  *(_BYTE *)&self->_flags |= 8u;
  self->_incidentType = a3;
}

- (void)setHasIncidentType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasIncidentType
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (id)incidentTypeAsString:(int)a3
{
  if (a3 < 0x12)
    return off_1E1C13538[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsIncidentType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROAD_CLOSURE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LANE_CLOSURE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WEATHER")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EVENT")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ACCIDENT")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HAZARD")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROADWORKS")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAMP_CLOSURE")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OTHER")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRAFFIC")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WALKING_CLOSURE")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MANEUVER_CLOSURE")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AREA_ADVISORY")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AREA_CLOSURE")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CONGESTION_ZONE")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPEED_CHECK")) & 1) != 0)
  {
    v4 = 16;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("NO_THOROUGHFARE_CLOSURE")))
  {
    v4 = 17;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)poiImageCorrectionType
{
  if ((*(_BYTE *)&self->_flags & 0x40) != 0)
    return self->_poiImageCorrectionType;
  else
    return 0;
}

- (void)setPoiImageCorrectionType:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x40u;
  self->_poiImageCorrectionType = a3;
}

- (void)setHasPoiImageCorrectionType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xBF | v3;
}

- (BOOL)hasPoiImageCorrectionType
{
  return (*(_BYTE *)&self->_flags >> 6) & 1;
}

- (id)poiImageCorrectionTypeAsString:(int)a3
{
  if (a3 < 9)
    return off_1E1C13460[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsPoiImageCorrectionType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("POI_IMAGE_CORRECTION_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("POI_IMAGE_CORRECTION_OTHER")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("POI_IMAGE_CORRECTION_IRRELEVANT")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("POI_IMAGE_CORRECTION_OFFENSIVE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("POI_IMAGE_CORRECTION_POOR_QUALITY")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("POI_IMAGE_CORRECTION_PRIVACY_ISSUE")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("POI_IMAGE_CORRECTION_LEGAL_ISSUE")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("POI_IMAGE_CORRECTION_COPYRIGHT_VIOLATION")) & 1) != 0)
  {
    v4 = 7;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("POI_IMAGE_CORRECTION_INAPPROPRIATE_ATTRIBUTION")))
  {
    v4 = 8;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)curatedCollectionFieldName
{
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    return self->_curatedCollectionFieldName;
  else
    return 0;
}

- (void)setCuratedCollectionFieldName:(int)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_curatedCollectionFieldName = a3;
}

- (void)setHasCuratedCollectionFieldName:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasCuratedCollectionFieldName
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (id)curatedCollectionFieldNameAsString:(int)a3
{
  if (a3 < 8)
    return off_1E1C134A8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsCuratedCollectionFieldName:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_CURATED_COLLECTION_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_CURATED_COLLECTION_BAD_URL")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_CURATED_COLLECTION_BAD_DESCRIPTION")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_CURATED_COLLECTION_OTHER")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_CURATED_COLLECTION_PLACE_INACCURATE_DETAILS")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_CURATED_COLLECTION_PLACE_BAD_URL")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_CURATED_COLLECTION_PLACE_BAD_DESCRIPTION")) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_CURATED_COLLECTION_PLACE_OTHER")))
  {
    v4 = 7;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasIncidentField
{
  return self->_incidentField != 0;
}

- (GEORPIncidentField)incidentField
{
  return self->_incidentField;
}

- (void)setIncidentField:(id)a3
{
  objc_storeStrong((id *)&self->_incidentField, a3);
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
  v8.super_class = (Class)GEORPFeedbackLayoutFieldName;
  -[GEORPFeedbackLayoutFieldName description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPFeedbackLayoutFieldName dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPFeedbackLayoutFieldName _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  char v5;
  uint64_t v6;
  __CFString *v7;
  const __CFString *v8;
  uint64_t v9;
  __CFString *v10;
  const __CFString *v11;
  uint64_t v12;
  __CFString *v13;
  const __CFString *v14;
  uint64_t v15;
  __CFString *v16;
  const __CFString *v17;
  uint64_t v18;
  __CFString *v19;
  const __CFString *v20;
  uint64_t v21;
  __CFString *v22;
  const __CFString *v23;
  uint64_t v24;
  __CFString *v25;
  const __CFString *v26;
  uint64_t v27;
  __CFString *v28;
  const __CFString *v29;
  void *v30;
  void *v31;
  void *v32;
  const __CFString *v33;

  if (!a1)
  {
    v4 = 0;
    return v4;
  }
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(a1 + 48);
  if (v5 < 0)
  {
    v6 = *(int *)(a1 + 44);
    if (v6 >= 0xA)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 44));
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E1C13308[v6];
    }
    if (a2)
      v8 = CFSTR("workflowFieldName");
    else
      v8 = CFSTR("workflow_field_name");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

    v5 = *(_BYTE *)(a1 + 48);
    if ((v5 & 0x20) == 0)
    {
LABEL_4:
      if ((v5 & 1) == 0)
        goto LABEL_5;
      goto LABEL_25;
    }
  }
  else if ((*(_BYTE *)(a1 + 48) & 0x20) == 0)
  {
    goto LABEL_4;
  }
  v9 = *(int *)(a1 + 36);
  if (v9 >= 9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 36));
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = off_1E1C13358[v9];
  }
  if (a2)
    v11 = CFSTR("poiFieldName");
  else
    v11 = CFSTR("poi_field_name");
  objc_msgSend(v4, "setObject:forKey:", v10, v11);

  v5 = *(_BYTE *)(a1 + 48);
  if ((v5 & 1) == 0)
  {
LABEL_5:
    if ((v5 & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_33;
  }
LABEL_25:
  v12 = *(int *)(a1 + 16);
  if (v12 < 8 && ((0xFDu >> v12) & 1) != 0)
  {
    v13 = off_1E1C133A0[v12];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 16));
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  if (a2)
    v14 = CFSTR("addressFieldName");
  else
    v14 = CFSTR("address_field_name");
  objc_msgSend(v4, "setObject:forKey:", v13, v14);

  v5 = *(_BYTE *)(a1 + 48);
  if ((v5 & 0x10) == 0)
  {
LABEL_6:
    if ((v5 & 4) == 0)
      goto LABEL_7;
    goto LABEL_40;
  }
LABEL_33:
  v15 = *(int *)(a1 + 32);
  if (v15 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 32));
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = off_1E1C133E0[v15];
  }
  if (a2)
    v17 = CFSTR("otherFieldName");
  else
    v17 = CFSTR("other_field_name");
  objc_msgSend(v4, "setObject:forKey:", v16, v17);

  v5 = *(_BYTE *)(a1 + 48);
  if ((v5 & 4) == 0)
  {
LABEL_7:
    if ((v5 & 8) == 0)
      goto LABEL_8;
    goto LABEL_48;
  }
LABEL_40:
  v18 = *(int *)(a1 + 24);
  if (v18 < 0xD && ((0x10FFu >> v18) & 1) != 0)
  {
    v19 = off_1E1C133F8[v18];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 24));
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  if (a2)
    v20 = CFSTR("groundviewFieldName");
  else
    v20 = CFSTR("groundview_field_name");
  objc_msgSend(v4, "setObject:forKey:", v19, v20);

  v5 = *(_BYTE *)(a1 + 48);
  if ((v5 & 8) == 0)
  {
LABEL_8:
    if ((v5 & 0x40) == 0)
      goto LABEL_9;
LABEL_55:
    v24 = *(int *)(a1 + 40);
    if (v24 >= 9)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 40));
      v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v25 = off_1E1C13460[v24];
    }
    if (a2)
      v26 = CFSTR("poiImageCorrectionType");
    else
      v26 = CFSTR("poi_image_correction_type");
    objc_msgSend(v4, "setObject:forKey:", v25, v26);

    if ((*(_BYTE *)(a1 + 48) & 2) == 0)
      goto LABEL_69;
    goto LABEL_62;
  }
LABEL_48:
  v21 = *(int *)(a1 + 28);
  if (v21 >= 0x12)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 28));
    v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = off_1E1C13538[v21];
  }
  if (a2)
    v23 = CFSTR("incidentType");
  else
    v23 = CFSTR("incident_type");
  objc_msgSend(v4, "setObject:forKey:", v22, v23);

  v5 = *(_BYTE *)(a1 + 48);
  if ((v5 & 0x40) != 0)
    goto LABEL_55;
LABEL_9:
  if ((v5 & 2) != 0)
  {
LABEL_62:
    v27 = *(int *)(a1 + 20);
    if (v27 >= 8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 20));
      v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v28 = off_1E1C134A8[v27];
    }
    if (a2)
      v29 = CFSTR("curatedCollectionFieldName");
    else
      v29 = CFSTR("curated_collection_field_name");
    objc_msgSend(v4, "setObject:forKey:", v28, v29);

  }
LABEL_69:
  objc_msgSend((id)a1, "incidentField");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v30;
  if (v30)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v30, "jsonRepresentation");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = CFSTR("incidentField");
    }
    else
    {
      objc_msgSend(v30, "dictionaryRepresentation");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = CFSTR("incident_field");
    }
    objc_msgSend(v4, "setObject:forKey:", v32, v33);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPFeedbackLayoutFieldName _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPFeedbackLayoutFieldName)initWithDictionary:(id)a3
{
  return (GEORPFeedbackLayoutFieldName *)-[GEORPFeedbackLayoutFieldName _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  id v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;
  id v12;
  uint64_t v13;
  const __CFString *v14;
  void *v15;
  id v16;
  uint64_t v17;
  const __CFString *v18;
  void *v19;
  id v20;
  uint64_t v21;
  const __CFString *v22;
  void *v23;
  id v24;
  uint64_t v25;
  const __CFString *v26;
  void *v27;
  id v28;
  uint64_t v29;
  const __CFString *v30;
  void *v31;
  id v32;
  uint64_t v33;
  const __CFString *v34;
  void *v35;
  id v36;
  uint64_t v37;
  const __CFString *v38;
  void *v39;
  GEORPIncidentField *v40;
  uint64_t v41;
  void *v42;

  v5 = a2;
  if (!a1)
    goto LABEL_230;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_230;
  if (a3)
    v6 = CFSTR("workflowFieldName");
  else
    v6 = CFSTR("workflow_field_name");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_WORKFLOW_UNKNOWN")) & 1) != 0)
    {
      v9 = 0;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_WORKFLOW_LABEL")) & 1) != 0)
    {
      v9 = 1;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_WORKFLOW_SEARCH")) & 1) != 0)
    {
      v9 = 2;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_WORKFLOW_NAVIGATION")) & 1) != 0)
    {
      v9 = 3;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_WORKFLOW_TRANSIT")) & 1) != 0)
    {
      v9 = 4;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_WORKFLOW_PLACE")) & 1) != 0)
    {
      v9 = 5;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_WORKFLOW_ADDRESS")) & 1) != 0)
    {
      v9 = 6;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_WORKFLOW_HOME")) & 1) != 0)
    {
      v9 = 7;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_WORKFLOW_WORK")) & 1) != 0)
    {
      v9 = 8;
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_WORKFLOW_OTHER")))
    {
      v9 = 9;
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_32;
    v9 = objc_msgSend(v7, "intValue");
  }
  objc_msgSend(a1, "setWorkflowFieldName:", v9);
LABEL_32:

  if (a3)
    v10 = CFSTR("poiFieldName");
  else
    v10 = CFSTR("poi_field_name");
  objc_msgSend(v5, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = v11;
    if ((objc_msgSend(v12, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_POI_UNKNOWN")) & 1) != 0)
    {
      v13 = 0;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_POI_NAME")) & 1) != 0)
    {
      v13 = 1;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_POI_CATEGORY")) & 1) != 0)
    {
      v13 = 2;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_POI_HOURS")) & 1) != 0)
    {
      v13 = 3;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_POI_WEBSITE")) & 1) != 0)
    {
      v13 = 4;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_POI_PHONE")) & 1) != 0)
    {
      v13 = 5;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_POI_AMENITIES")) & 1) != 0)
    {
      v13 = 6;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_POI_PARENT_CONTAINMENT")) & 1) != 0)
    {
      v13 = 7;
    }
    else if (objc_msgSend(v12, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_POI_CHILD_CONTAINMENT")))
    {
      v13 = 8;
    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_59;
    v13 = objc_msgSend(v11, "intValue");
  }
  objc_msgSend(a1, "setPoiFieldName:", v13);
LABEL_59:

  if (a3)
    v14 = CFSTR("addressFieldName");
  else
    v14 = CFSTR("address_field_name");
  objc_msgSend(v5, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = v15;
    if ((objc_msgSend(v16, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_ADDRESS_UNKNOWN")) & 1) != 0)
    {
      v17 = 0;
    }
    else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_ADDRESS_LOCATION")) & 1) != 0)
    {
      v17 = 2;
    }
    else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_ADDRESS_LOCATION_ENTRY_POINT")) & 1) != 0)
    {
      v17 = 3;
    }
    else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_ADDRESS_BASIC")) & 1) != 0)
    {
      v17 = 4;
    }
    else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_ADDRESS_UNIT")) & 1) != 0)
    {
      v17 = 5;
    }
    else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_ADDRESS_FLOOR")) & 1) != 0)
    {
      v17 = 6;
    }
    else if (objc_msgSend(v16, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_ADDRESS_BLDG")))
    {
      v17 = 7;
    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_82;
    v17 = objc_msgSend(v15, "intValue");
  }
  objc_msgSend(a1, "setAddressFieldName:", v17);
LABEL_82:

  if (a3)
    v18 = CFSTR("otherFieldName");
  else
    v18 = CFSTR("other_field_name");
  objc_msgSend(v5, "objectForKeyedSubscript:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v20 = v19;
    if ((objc_msgSend(v20, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_OTHER_UNKNOWN")) & 1) != 0)
    {
      v21 = 0;
    }
    else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_OTHER_PHOTO")) & 1) != 0)
    {
      v21 = 1;
    }
    else if (objc_msgSend(v20, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_OTHER_COMMENTS")))
    {
      v21 = 2;
    }
    else
    {
      v21 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_97;
    v21 = objc_msgSend(v19, "intValue");
  }
  objc_msgSend(a1, "setOtherFieldName:", v21);
LABEL_97:

  if (a3)
    v22 = CFSTR("groundviewFieldName");
  else
    v22 = CFSTR("groundview_field_name");
  objc_msgSend(v5, "objectForKeyedSubscript:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v24 = v23;
    if ((objc_msgSend(v24, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_GROUNDVIEW_UNKNOWN")) & 1) != 0)
    {
      v25 = 0;
    }
    else if ((objc_msgSend(v24, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_GROUNDVIEW_TITLE")) & 1) != 0)
    {
      v25 = 1;
    }
    else if ((objc_msgSend(v24, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_GROUNDVIEW_LOCATION")) & 1) != 0)
    {
      v25 = 2;
    }
    else if ((objc_msgSend(v24, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_GROUNDVIEW_SUBTYPE_BAD_IMAGERY")) & 1) != 0)
    {
      v25 = 3;
    }
    else if ((objc_msgSend(v24, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_GROUNDVIEW_SUBTYPE_BLUR_FACE")) & 1) != 0)
    {
      v25 = 4;
    }
    else if ((objc_msgSend(v24, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_GROUNDVIEW_SUBTYPE_BLUR_ADDRESS")) & 1) != 0)
    {
      v25 = 5;
    }
    else if ((objc_msgSend(v24, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_GROUNDVIEW_SUBTYPE_BAD_LABEL")) & 1) != 0)
    {
      v25 = 6;
    }
    else if ((objc_msgSend(v24, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_GROUNDVIEW_SUBTYPE_OTHER")) & 1) != 0)
    {
      v25 = 7;
    }
    else if (objc_msgSend(v24, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_GROUNDVIEW_CONTACT_INFO")))
    {
      v25 = 12;
    }
    else
    {
      v25 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_124;
    v25 = objc_msgSend(v23, "intValue");
  }
  objc_msgSend(a1, "setGroundviewFieldName:", v25);
LABEL_124:

  if (a3)
    v26 = CFSTR("incidentType");
  else
    v26 = CFSTR("incident_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v28 = v27;
    if ((objc_msgSend(v28, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
    {
      v29 = 0;
    }
    else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("ROAD_CLOSURE")) & 1) != 0)
    {
      v29 = 1;
    }
    else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("LANE_CLOSURE")) & 1) != 0)
    {
      v29 = 2;
    }
    else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("WEATHER")) & 1) != 0)
    {
      v29 = 3;
    }
    else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("EVENT")) & 1) != 0)
    {
      v29 = 4;
    }
    else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("ACCIDENT")) & 1) != 0)
    {
      v29 = 5;
    }
    else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("HAZARD")) & 1) != 0)
    {
      v29 = 6;
    }
    else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("ROADWORKS")) & 1) != 0)
    {
      v29 = 7;
    }
    else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("RAMP_CLOSURE")) & 1) != 0)
    {
      v29 = 8;
    }
    else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("OTHER")) & 1) != 0)
    {
      v29 = 9;
    }
    else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("TRAFFIC")) & 1) != 0)
    {
      v29 = 10;
    }
    else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("WALKING_CLOSURE")) & 1) != 0)
    {
      v29 = 11;
    }
    else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("MANEUVER_CLOSURE")) & 1) != 0)
    {
      v29 = 12;
    }
    else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("AREA_ADVISORY")) & 1) != 0)
    {
      v29 = 13;
    }
    else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("AREA_CLOSURE")) & 1) != 0)
    {
      v29 = 14;
    }
    else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("CONGESTION_ZONE")) & 1) != 0)
    {
      v29 = 15;
    }
    else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("SPEED_CHECK")) & 1) != 0)
    {
      v29 = 16;
    }
    else if (objc_msgSend(v28, "isEqualToString:", CFSTR("NO_THOROUGHFARE_CLOSURE")))
    {
      v29 = 17;
    }
    else
    {
      v29 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_169;
    v29 = objc_msgSend(v27, "intValue");
  }
  objc_msgSend(a1, "setIncidentType:", v29);
LABEL_169:

  if (a3)
    v30 = CFSTR("poiImageCorrectionType");
  else
    v30 = CFSTR("poi_image_correction_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v32 = v31;
    if ((objc_msgSend(v32, "isEqualToString:", CFSTR("POI_IMAGE_CORRECTION_UNKNOWN")) & 1) != 0)
    {
      v33 = 0;
    }
    else if ((objc_msgSend(v32, "isEqualToString:", CFSTR("POI_IMAGE_CORRECTION_OTHER")) & 1) != 0)
    {
      v33 = 1;
    }
    else if ((objc_msgSend(v32, "isEqualToString:", CFSTR("POI_IMAGE_CORRECTION_IRRELEVANT")) & 1) != 0)
    {
      v33 = 2;
    }
    else if ((objc_msgSend(v32, "isEqualToString:", CFSTR("POI_IMAGE_CORRECTION_OFFENSIVE")) & 1) != 0)
    {
      v33 = 3;
    }
    else if ((objc_msgSend(v32, "isEqualToString:", CFSTR("POI_IMAGE_CORRECTION_POOR_QUALITY")) & 1) != 0)
    {
      v33 = 4;
    }
    else if ((objc_msgSend(v32, "isEqualToString:", CFSTR("POI_IMAGE_CORRECTION_PRIVACY_ISSUE")) & 1) != 0)
    {
      v33 = 5;
    }
    else if ((objc_msgSend(v32, "isEqualToString:", CFSTR("POI_IMAGE_CORRECTION_LEGAL_ISSUE")) & 1) != 0)
    {
      v33 = 6;
    }
    else if ((objc_msgSend(v32, "isEqualToString:", CFSTR("POI_IMAGE_CORRECTION_COPYRIGHT_VIOLATION")) & 1) != 0)
    {
      v33 = 7;
    }
    else if (objc_msgSend(v32, "isEqualToString:", CFSTR("POI_IMAGE_CORRECTION_INAPPROPRIATE_ATTRIBUTION")))
    {
      v33 = 8;
    }
    else
    {
      v33 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_196;
    v33 = objc_msgSend(v31, "intValue");
  }
  objc_msgSend(a1, "setPoiImageCorrectionType:", v33);
LABEL_196:

  if (a3)
    v34 = CFSTR("curatedCollectionFieldName");
  else
    v34 = CFSTR("curated_collection_field_name");
  objc_msgSend(v5, "objectForKeyedSubscript:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v36 = v35;
    if ((objc_msgSend(v36, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_CURATED_COLLECTION_UNKNOWN")) & 1) != 0)
    {
      v37 = 0;
    }
    else if ((objc_msgSend(v36, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_CURATED_COLLECTION_BAD_URL")) & 1) != 0)
    {
      v37 = 1;
    }
    else if ((objc_msgSend(v36, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_CURATED_COLLECTION_BAD_DESCRIPTION")) & 1) != 0)
    {
      v37 = 2;
    }
    else if ((objc_msgSend(v36, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_CURATED_COLLECTION_OTHER")) & 1) != 0)
    {
      v37 = 3;
    }
    else if ((objc_msgSend(v36, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_CURATED_COLLECTION_PLACE_INACCURATE_DETAILS")) & 1) != 0)
    {
      v37 = 4;
    }
    else if ((objc_msgSend(v36, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_CURATED_COLLECTION_PLACE_BAD_URL")) & 1) != 0)
    {
      v37 = 5;
    }
    else if ((objc_msgSend(v36, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_CURATED_COLLECTION_PLACE_BAD_DESCRIPTION")) & 1) != 0)
    {
      v37 = 6;
    }
    else if (objc_msgSend(v36, "isEqualToString:", CFSTR("FEEDBACK_LAYOUT_CURATED_COLLECTION_PLACE_OTHER")))
    {
      v37 = 7;
    }
    else
    {
      v37 = 0;
    }

    goto LABEL_220;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v37 = objc_msgSend(v35, "intValue");
LABEL_220:
    objc_msgSend(a1, "setCuratedCollectionFieldName:", v37);
  }

  if (a3)
    v38 = CFSTR("incidentField");
  else
    v38 = CFSTR("incident_field");
  objc_msgSend(v5, "objectForKeyedSubscript:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v40 = [GEORPIncidentField alloc];
    if ((a3 & 1) != 0)
      v41 = -[GEORPIncidentField initWithJSON:](v40, "initWithJSON:", v39);
    else
      v41 = -[GEORPIncidentField initWithDictionary:](v40, "initWithDictionary:", v39);
    v42 = (void *)v41;
    objc_msgSend(a1, "setIncidentField:", v41);

  }
LABEL_230:

  return a1;
}

- (GEORPFeedbackLayoutFieldName)initWithJSON:(id)a3
{
  return (GEORPFeedbackLayoutFieldName *)-[GEORPFeedbackLayoutFieldName _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPFeedbackLayoutFieldNameIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPFeedbackLayoutFieldNameReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char flags;
  id v6;

  v4 = a3;
  flags = (char)self->_flags;
  v6 = v4;
  if (flags < 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
    flags = (char)self->_flags;
    if ((flags & 0x20) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 0x20) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  v4 = v6;
  flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_4:
    if ((flags & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteInt32Field();
  v4 = v6;
  flags = (char)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_5:
    if ((flags & 4) == 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteInt32Field();
  v4 = v6;
  flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_6:
    if ((flags & 8) == 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteInt32Field();
  v4 = v6;
  flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_7:
    if ((flags & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteInt32Field();
  v4 = v6;
  flags = (char)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_8:
    if ((flags & 2) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_19:
  PBDataWriterWriteInt32Field();
  v4 = v6;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
LABEL_9:
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
LABEL_10:
  if (self->_incidentField)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  $D205515FC21CC39D9BB1EA96C5051829 flags;
  _DWORD *v5;
  _DWORD *v6;

  v6 = a3;
  -[GEORPFeedbackLayoutFieldName readAll:](self, "readAll:", 0);
  flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x80000000) == 0)
  {
    v5 = v6;
    if ((*(_BYTE *)&flags & 0x20) == 0)
      goto LABEL_4;
    goto LABEL_3;
  }
  v5 = v6;
  v6[11] = self->_workflowFieldName;
  *((_BYTE *)v6 + 48) |= 0x80u;
  *(_BYTE *)&flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x20) != 0)
  {
LABEL_3:
    v5[9] = self->_poiFieldName;
    *((_BYTE *)v5 + 48) |= 0x20u;
    *(_BYTE *)&flags = self->_flags;
  }
LABEL_4:
  if ((*(_BYTE *)&flags & 1) != 0)
  {
    v5[4] = self->_addressFieldName;
    *((_BYTE *)v5 + 48) |= 1u;
    *(_BYTE *)&flags = self->_flags;
    if ((*(_BYTE *)&flags & 0x10) == 0)
    {
LABEL_6:
      if ((*(_BYTE *)&flags & 4) == 0)
        goto LABEL_7;
      goto LABEL_16;
    }
  }
  else if ((*(_BYTE *)&flags & 0x10) == 0)
  {
    goto LABEL_6;
  }
  v5[8] = self->_otherFieldName;
  *((_BYTE *)v5 + 48) |= 0x10u;
  *(_BYTE *)&flags = self->_flags;
  if ((*(_BYTE *)&flags & 4) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&flags & 8) == 0)
      goto LABEL_8;
    goto LABEL_17;
  }
LABEL_16:
  v5[6] = self->_groundviewFieldName;
  *((_BYTE *)v5 + 48) |= 4u;
  *(_BYTE *)&flags = self->_flags;
  if ((*(_BYTE *)&flags & 8) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&flags & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_18;
  }
LABEL_17:
  v5[7] = self->_incidentType;
  *((_BYTE *)v5 + 48) |= 8u;
  *(_BYTE *)&flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x40) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&flags & 2) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_18:
  v5[10] = self->_poiImageCorrectionType;
  *((_BYTE *)v5 + 48) |= 0x40u;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
LABEL_10:
    v5[5] = self->_curatedCollectionFieldName;
    *((_BYTE *)v5 + 48) |= 2u;
  }
LABEL_11:
  if (self->_incidentField)
  {
    objc_msgSend(v6, "setIncidentField:");
    v5 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  char flags;
  id v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  flags = (char)self->_flags;
  if (flags < 0)
  {
    *(_DWORD *)(v5 + 44) = self->_workflowFieldName;
    *(_BYTE *)(v5 + 48) |= 0x80u;
    flags = (char)self->_flags;
    if ((flags & 0x20) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 36) = self->_poiFieldName;
  *(_BYTE *)(v5 + 48) |= 0x20u;
  flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_4:
    if ((flags & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  *(_DWORD *)(v5 + 16) = self->_addressFieldName;
  *(_BYTE *)(v5 + 48) |= 1u;
  flags = (char)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_5:
    if ((flags & 4) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  *(_DWORD *)(v5 + 32) = self->_otherFieldName;
  *(_BYTE *)(v5 + 48) |= 0x10u;
  flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_6:
    if ((flags & 8) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  *(_DWORD *)(v5 + 24) = self->_groundviewFieldName;
  *(_BYTE *)(v5 + 48) |= 4u;
  flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_7:
    if ((flags & 0x40) == 0)
      goto LABEL_8;
LABEL_17:
    *(_DWORD *)(v5 + 40) = self->_poiImageCorrectionType;
    *(_BYTE *)(v5 + 48) |= 0x40u;
    if ((*(_BYTE *)&self->_flags & 2) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_16:
  *(_DWORD *)(v5 + 28) = self->_incidentType;
  *(_BYTE *)(v5 + 48) |= 8u;
  flags = (char)self->_flags;
  if ((flags & 0x40) != 0)
    goto LABEL_17;
LABEL_8:
  if ((flags & 2) != 0)
  {
LABEL_9:
    *(_DWORD *)(v5 + 20) = self->_curatedCollectionFieldName;
    *(_BYTE *)(v5 + 48) |= 2u;
  }
LABEL_10:
  v8 = -[GEORPIncidentField copyWithZone:](self->_incidentField, "copyWithZone:", a3);
  v9 = (void *)v6[1];
  v6[1] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  $D205515FC21CC39D9BB1EA96C5051829 flags;
  GEORPIncidentField *incidentField;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_44;
  -[GEORPFeedbackLayoutFieldName readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x80000000) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 0x80) == 0 || self->_workflowFieldName != *((_DWORD *)v4 + 11))
      goto LABEL_44;
  }
  else if ((*((_BYTE *)v4 + 48) & 0x80) != 0)
  {
LABEL_44:
    v7 = 0;
    goto LABEL_45;
  }
  if ((*(_BYTE *)&flags & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 0x20) == 0 || self->_poiFieldName != *((_DWORD *)v4 + 9))
      goto LABEL_44;
  }
  else if ((*((_BYTE *)v4 + 48) & 0x20) != 0)
  {
    goto LABEL_44;
  }
  if ((*(_BYTE *)&flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_addressFieldName != *((_DWORD *)v4 + 4))
      goto LABEL_44;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
    goto LABEL_44;
  }
  if ((*(_BYTE *)&flags & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 0x10) == 0 || self->_otherFieldName != *((_DWORD *)v4 + 8))
      goto LABEL_44;
  }
  else if ((*((_BYTE *)v4 + 48) & 0x10) != 0)
  {
    goto LABEL_44;
  }
  if ((*(_BYTE *)&flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 4) == 0 || self->_groundviewFieldName != *((_DWORD *)v4 + 6))
      goto LABEL_44;
  }
  else if ((*((_BYTE *)v4 + 48) & 4) != 0)
  {
    goto LABEL_44;
  }
  if ((*(_BYTE *)&flags & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 8) == 0 || self->_incidentType != *((_DWORD *)v4 + 7))
      goto LABEL_44;
  }
  else if ((*((_BYTE *)v4 + 48) & 8) != 0)
  {
    goto LABEL_44;
  }
  if ((*(_BYTE *)&flags & 0x40) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 0x40) == 0 || self->_poiImageCorrectionType != *((_DWORD *)v4 + 10))
      goto LABEL_44;
  }
  else if ((*((_BYTE *)v4 + 48) & 0x40) != 0)
  {
    goto LABEL_44;
  }
  if ((*(_BYTE *)&flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 2) == 0 || self->_curatedCollectionFieldName != *((_DWORD *)v4 + 5))
      goto LABEL_44;
  }
  else if ((*((_BYTE *)v4 + 48) & 2) != 0)
  {
    goto LABEL_44;
  }
  incidentField = self->_incidentField;
  if ((unint64_t)incidentField | *((_QWORD *)v4 + 1))
    v7 = -[GEORPIncidentField isEqual:](incidentField, "isEqual:");
  else
    v7 = 1;
LABEL_45:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  -[GEORPFeedbackLayoutFieldName readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 0x80000000) != 0)
  {
    v3 = 2654435761 * self->_workflowFieldName;
    if ((*(_BYTE *)&self->_flags & 0x20) == 0)
    {
LABEL_3:
      v4 = 0;
      if ((*(_BYTE *)&self->_flags & 1) != 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_flags & 0x20) == 0)
      goto LABEL_3;
  }
  v4 = 2654435761 * self->_poiFieldName;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_addressFieldName;
    if ((*(_BYTE *)&self->_flags & 0x10) != 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  v5 = 0;
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_otherFieldName;
    if ((*(_BYTE *)&self->_flags & 4) != 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  v6 = 0;
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
LABEL_6:
    v7 = 2654435761 * self->_groundviewFieldName;
    if ((*(_BYTE *)&self->_flags & 8) != 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  v7 = 0;
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
LABEL_7:
    v8 = 2654435761 * self->_incidentType;
    if ((*(_BYTE *)&self->_flags & 0x40) != 0)
      goto LABEL_8;
LABEL_16:
    v9 = 0;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_9;
LABEL_17:
    v10 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ -[GEORPIncidentField hash](self->_incidentField, "hash");
  }
LABEL_15:
  v8 = 0;
  if ((*(_BYTE *)&self->_flags & 0x40) == 0)
    goto LABEL_16;
LABEL_8:
  v9 = 2654435761 * self->_poiImageCorrectionType;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_17;
LABEL_9:
  v10 = 2654435761 * self->_curatedCollectionFieldName;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ -[GEORPIncidentField hash](self->_incidentField, "hash");
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  int v5;
  GEORPIncidentField *incidentField;
  uint64_t v7;
  int *v8;

  v8 = (int *)a3;
  objc_msgSend(v8, "readAll:", 0);
  v4 = v8;
  v5 = *((char *)v8 + 48);
  if ((v5 & 0x80000000) == 0)
  {
    if ((v5 & 0x20) == 0)
      goto LABEL_4;
    goto LABEL_3;
  }
  self->_workflowFieldName = v8[11];
  *(_BYTE *)&self->_flags |= 0x80u;
  LOBYTE(v5) = *((_BYTE *)v8 + 48);
  if ((v5 & 0x20) != 0)
  {
LABEL_3:
    self->_poiFieldName = v8[9];
    *(_BYTE *)&self->_flags |= 0x20u;
    LOBYTE(v5) = *((_BYTE *)v8 + 48);
  }
LABEL_4:
  if ((v5 & 1) != 0)
  {
    self->_addressFieldName = v8[4];
    *(_BYTE *)&self->_flags |= 1u;
    LOBYTE(v5) = *((_BYTE *)v8 + 48);
    if ((v5 & 0x10) == 0)
    {
LABEL_6:
      if ((v5 & 4) == 0)
        goto LABEL_7;
      goto LABEL_16;
    }
  }
  else if ((v5 & 0x10) == 0)
  {
    goto LABEL_6;
  }
  self->_otherFieldName = v8[8];
  *(_BYTE *)&self->_flags |= 0x10u;
  LOBYTE(v5) = *((_BYTE *)v8 + 48);
  if ((v5 & 4) == 0)
  {
LABEL_7:
    if ((v5 & 8) == 0)
      goto LABEL_8;
    goto LABEL_17;
  }
LABEL_16:
  self->_groundviewFieldName = v8[6];
  *(_BYTE *)&self->_flags |= 4u;
  LOBYTE(v5) = *((_BYTE *)v8 + 48);
  if ((v5 & 8) == 0)
  {
LABEL_8:
    if ((v5 & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_18;
  }
LABEL_17:
  self->_incidentType = v8[7];
  *(_BYTE *)&self->_flags |= 8u;
  LOBYTE(v5) = *((_BYTE *)v8 + 48);
  if ((v5 & 0x40) == 0)
  {
LABEL_9:
    if ((v5 & 2) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_18:
  self->_poiImageCorrectionType = v8[10];
  *(_BYTE *)&self->_flags |= 0x40u;
  if ((v8[12] & 2) != 0)
  {
LABEL_10:
    self->_curatedCollectionFieldName = v8[5];
    *(_BYTE *)&self->_flags |= 2u;
  }
LABEL_11:
  incidentField = self->_incidentField;
  v7 = *((_QWORD *)v8 + 1);
  if (incidentField)
  {
    if (v7)
    {
      -[GEORPIncidentField mergeFrom:](incidentField, "mergeFrom:");
LABEL_24:
      v4 = v8;
    }
  }
  else if (v7)
  {
    -[GEORPFeedbackLayoutFieldName setIncidentField:](self, "setIncidentField:");
    goto LABEL_24;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_incidentField, 0);
}

@end
