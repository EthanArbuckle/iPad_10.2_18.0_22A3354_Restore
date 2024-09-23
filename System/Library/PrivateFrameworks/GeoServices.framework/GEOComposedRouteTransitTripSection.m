@implementation GEOComposedRouteTransitTripSection

- (BOOL)isTransfer
{
  return 0;
}

- (GEOComposedRouteTransitTripSection)initWithCoordinates:(id)a3 segment:(id)a4 segmentIndex:(unint64_t)a5 steps:(id)a6 startCoordinateIndex:(unsigned int)a7 coordinateCount:(unsigned int)a8 stepIndex:(unint64_t)a9 toNodeSignificance:(int)a10 transitLineColor:(id)a11 startDistance:(double)a12 lengthScaleFactor:(double)a13 decoderData:(id)a14
{
  uint64_t v16;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  char *v33;
  __int128 v34;
  char *v35;
  int v37;
  id v39;
  id v40;
  id v41;
  id v42;
  objc_super v43;

  v16 = *(_QWORD *)&a7;
  v42 = a3;
  v41 = a4;
  v21 = a6;
  v40 = a11;
  v39 = a14;
  objc_msgSend(v21, "objectAtIndexedSubscript:", a9);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "originStop");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "latLng");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "coordinate");
  v26 = v25;
  v28 = v27;
  objc_msgSend(v22, "destinationStop");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "latLng");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "coordinate");
  v43.receiver = self;
  v43.super_class = (Class)GEOComposedRouteTransitTripSection;
  v37 = 1;
  v33 = -[GEOComposedRouteSection initWithCoordinates:segment:segmentIndex:steps:startCoordinateIndex:coordinateCount:transportType:finalStepIndex:fallbackStartCoordinate:fallbackEndCoordinate:startDistance:lengthScaleFactor:](&v43, sel_initWithCoordinates_segment_segmentIndex_steps_startCoordinateIndex_coordinateCount_transportType_finalStepIndex_fallbackStartCoordinate_fallbackEndCoordinate_startDistance_lengthScaleFactor_, v42, v41, a5, v21, v16, a8, v26, v28, v31, v32, a12, a13, v37, a9);

  if (v33)
  {
    objc_msgSend(v33, "_initSupportWithDecoderData:step:toNodeSignificance:transitLineColor:", v39, v22, a10, v40);
    v34 = *((_OWORD *)v33 + 5);
    *((_OWORD *)v33 + 17) = *(_OWORD *)(v33 + 56);
    *((_OWORD *)v33 + 18) = v34;
    v35 = v33;
  }

  return (GEOComposedRouteTransitTripSection *)v33;
}

- (GEOComposedRouteTransitTripSection)initWithCoordinates:(id)a3 segment:(id)a4 segmentIndex:(unint64_t)a5 steps:(id)a6 startCoordinateIndex:(unsigned int)a7 coordinateCount:(unsigned int)a8 stepIndex:(unint64_t)a9 toNodeSignificance:(int)a10 transitLineColor:(id)a11 startDistance:(double)a12 lengthScaleFactor:(double)a13 fallbackStartCoordinate:(id)a14 fallbackEndCoordinate:(id)a15
{
  uint64_t v15;
  uint64_t v16;
  double var1;
  double var0;
  double v21;
  double v22;
  id v27;
  id v28;
  char *v29;
  void *v30;
  __int128 v31;
  char *v32;
  int v34;
  objc_super v35;

  v15 = *(_QWORD *)&a8;
  v16 = *(_QWORD *)&a7;
  var1 = a15.var1;
  var0 = a15.var0;
  v21 = a14.var1;
  v22 = a14.var0;
  v27 = a6;
  v28 = a11;
  v35.receiver = self;
  v35.super_class = (Class)GEOComposedRouteTransitTripSection;
  v34 = 1;
  v29 = -[GEOComposedRouteSection initWithCoordinates:segment:segmentIndex:steps:startCoordinateIndex:coordinateCount:transportType:finalStepIndex:fallbackStartCoordinate:fallbackEndCoordinate:startDistance:lengthScaleFactor:](&v35, sel_initWithCoordinates_segment_segmentIndex_steps_startCoordinateIndex_coordinateCount_transportType_finalStepIndex_fallbackStartCoordinate_fallbackEndCoordinate_startDistance_lengthScaleFactor_, a3, a4, a5, v27, v16, v15, v22, v21, var0, var1, a12, a13, v34, a9);
  if (v29)
  {
    objc_msgSend(v27, "objectAtIndexedSubscript:", a9);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "_initSupportWithDecoderData:step:toNodeSignificance:transitLineColor:", 0, v30, a10, v28);
    v31 = *((_OWORD *)v29 + 5);
    *((_OWORD *)v29 + 17) = *(_OWORD *)(v29 + 56);
    *((_OWORD *)v29 + 18) = v31;
    v32 = v29;

  }
  return (GEOComposedRouteTransitTripSection *)v29;
}

- (void)_initSupportWithDecoderData:(id)a3 step:(id)a4 toNodeSignificance:(int)a5 transitLineColor:(id)a6
{
  void *v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  char *v36;
  char *v37;
  float v38;
  float v39;
  float v40;
  float v41;
  float v42;
  float v43;
  id v44;
  _BYTE v45[4];
  float v46;
  float v47;
  float v48;
  float v49;

  v7 = *(void **)&a5;
  v44 = a3;
  v10 = a4;
  v11 = a6;
  objc_msgSend(v10, "originStop");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOComposedRouteTransitTripSection _hallForStop:withDecoderData:](self, "_hallForStop:withDecoderData:", v12, v44);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[GEOComposedRouteTransitTripSection _stationForHall:withDecoderData:](self, "_stationForHall:withDecoderData:", v13, v44);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "originStop");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "muid");
  v17 = objc_msgSend(v13, "muid");
  v18 = objc_msgSend(v14, "muid");
  self->_fromNodeID.stopID = v16;
  self->_fromNodeID.hallID = v17;
  self->_fromNodeID.stationID = v18;

  objc_msgSend(v10, "destinationStop");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOComposedRouteTransitTripSection _hallForStop:withDecoderData:](self, "_hallForStop:withDecoderData:", v19, v44);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[GEOComposedRouteTransitTripSection _stationForHall:withDecoderData:](self, "_stationForHall:withDecoderData:", v20, v44);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "destinationStop");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "muid");
  v24 = objc_msgSend(v20, "muid");
  v25 = objc_msgSend(v21, "muid");
  self->_toNodeID.stopID = v23;
  self->_toNodeID.hallID = v24;
  self->_toNodeID.stationID = v25;

  objc_msgSend(v10, "transitLine");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  self->_lineID = objc_msgSend(v26, "muid");

  objc_msgSend(v10, "originStop");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "latLng");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "coordinate");
  self->_fromNodeLocation.latitude = v29;
  self->_fromNodeLocation.longitude = v30;

  objc_msgSend(v10, "destinationStop");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "latLng");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "coordinate");
  self->_toNodeLocation.latitude = v33;
  self->_toNodeLocation.longitude = v34;

  self->_toNodeSignificance = (int)v7;
  v35 = v11;
  if (!v11)
  {
    objc_msgSend(v10, "transitLine");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lineColorString");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v36 = (char *)objc_msgSend(objc_retainAutorelease(v35), "UTF8String");
  v37 = v36;
  if (v36)
  {
    if (*v36 == 35)
      v37 = v36 + 1;
    geo::_colorWithHexString<float,4,(geo::ColorSpace)2>((uint64_t)v45, v37);
    if (!v11)
      goto LABEL_7;
  }
  else
  {
    v45[0] = 0;
    if (!v11)
    {
LABEL_7:

    }
  }
  if (v45[0])
  {
    v38 = v47;
    v40 = v48;
    v39 = v49;
    if (v46 >= 0.04045)
      v41 = powf((float)(v46 + 0.055) / 1.055, 2.4);
    else
      v41 = v46 / 12.92;
    if (v38 >= 0.04045)
      v42 = powf((float)(v38 + 0.055) / 1.055, 2.4);
    else
      v42 = v38 / 12.92;
    if (v40 >= 0.04045)
      v43 = powf((float)(v40 + 0.055) / 1.055, 2.4);
    else
      v43 = v40 / 12.92;
    self->_lineColor._backing._e[0] = v41;
    self->_lineColor._backing._e[1] = v42;
    self->_lineColor._backing._e[2] = v43;
    self->_lineColor._backing._e[3] = v39;
  }

}

- (id)_hallForStop:(id)a3 withDecoderData:(id)a4
{
  id v5;
  id v6;
  unsigned int v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "hasHallIndex")
    && (v7 = objc_msgSend(v5, "hallIndex"), objc_msgSend(v6, "hallsCount") > (unint64_t)v7))
  {
    objc_msgSend(v6, "hallAtIndex:", objc_msgSend(v5, "hallIndex"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_stationForHall:(id)a3 withDecoderData:(id)a4
{
  id v5;
  id v6;
  unsigned int v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "hasStationIndex")
    && (v7 = objc_msgSend(v5, "stationIndex"), objc_msgSend(v6, "stationsCount") > (unint64_t)v7))
  {
    objc_msgSend(v6, "stationAtIndex:", objc_msgSend(v5, "stationIndex"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)_MapsCarPlay_isEqual:(id)a3
{
  GEOComposedRouteTransitTripSection *v4;
  uint64_t v5;
  char v6;
  GEOComposedRouteTransitTripSection *v7;
  float64x2_t v10;
  int32x2_t v11;
  int32x2_t v12;
  float64x2_t v13;
  int32x2_t v14;
  int32x2_t v15;
  objc_super v16;

  v4 = (GEOComposedRouteTransitTripSection *)a3;
  if (self == v4)
  {
    v6 = 1;
    goto LABEL_14;
  }
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    v7 = v4;
    v16.receiver = self;
    v16.super_class = (Class)GEOComposedRouteTransitTripSection;
    if (!-[GEOComposedRouteSection _MapsCarPlay_isEqual:](&v16, sel__MapsCarPlay_isEqual_, v7)
      || self->_lineID != v7->_lineID
      || self->_toNodeSignificance != v7->_toNodeSignificance)
    {
      goto LABEL_12;
    }
    if (*(_QWORD *)self->_lineColor._backing._e != *(_QWORD *)v7->_lineColor._backing._e
      || *(_QWORD *)&self->_lineColor._backing._e[2] != *(_QWORD *)&v7->_lineColor._backing._e[2])
    {
      goto LABEL_12;
    }
    v6 = 0;
    if (self->_fromNodeID.stopID != v7->_fromNodeID.stopID)
      goto LABEL_13;
    if (self->_fromNodeID.hallID != v7->_fromNodeID.hallID)
      goto LABEL_13;
    if (self->_fromNodeID.stationID != v7->_fromNodeID.stationID)
      goto LABEL_13;
    v6 = 0;
    if (self->_toNodeID.stopID != v7->_toNodeID.stopID
      || self->_toNodeID.hallID != v7->_toNodeID.hallID
      || self->_toNodeID.stationID != v7->_toNodeID.stationID)
    {
      goto LABEL_13;
    }
    v10 = (float64x2_t)vdupq_n_s64(0x3E45798EE0000000uLL);
    v11 = vmovn_s64(vcgtq_f64(v10, vabdq_f64((float64x2_t)self->_fromNodeLocation, (float64x2_t)v7->_fromNodeLocation)));
    if ((v11.i32[0] & v11.i32[1] & 1) != 0
      && (v12 = vmovn_s64(vcgtq_f64(v10, vabdq_f64((float64x2_t)self->_toNodeLocation, (float64x2_t)v7->_toNodeLocation))),
          (v12.i32[0] & v12.i32[1] & 1) != 0)
      && (v13 = (float64x2_t)vdupq_n_s64(0x3E45798EE2308C3AuLL),
          v14 = vmovn_s64(vcgtq_f64(v13, vabdq_f64((float64x2_t)self->_originalBounds.origin, (float64x2_t)v7->_originalBounds.origin))), (v14.i32[0] & v14.i32[1] & 1) != 0))
    {
      v15 = vmovn_s64(vcgtq_f64(v13, vabdq_f64((float64x2_t)self->_originalBounds.size, (float64x2_t)v7->_originalBounds.size)));
      v6 = v15.i8[0] & v15.i8[4];
    }
    else
    {
LABEL_12:
      v6 = 0;
    }
LABEL_13:

    goto LABEL_14;
  }
  v6 = 0;
LABEL_14:

  return v6 & 1;
}

- (NSString)description
{
  long double v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = GEOCoordinateRegionForMapRect(self->super._bounds.origin.x, self->super._bounds.origin.y, self->super._bounds.size.width, self->super._bounds.size.height);
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("p:[%u:%u] stops:[%llu:%llu] (%f,%f)±(%f,%f)"), self->super._startPointIndex, -[GEOComposedRouteSection endPointIndex](self, "endPointIndex"), self->_fromNodeID.stopID, self->_toNodeID.stopID, *(_QWORD *)&v3, v4, v5, v6);
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)fromNodeID
{
  *($371C1E790C2F9CD427EBE083D2037053 *)retstr = *($371C1E790C2F9CD427EBE083D2037053 *)((char *)self + 160);
  return self;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)toNodeID
{
  *($371C1E790C2F9CD427EBE083D2037053 *)retstr = *($371C1E790C2F9CD427EBE083D2037053 *)((char *)self + 184);
  return self;
}

- (unint64_t)lineID
{
  return self->_lineID;
}

- (int)toNodeSignificance
{
  return self->_toNodeSignificance;
}

- (Color<float,)lineColor
{
  Color<float, 4, geo::ColorSpace::Linear> *v2;
  Color<float, 4, geo::ColorSpace::Linear> lineColor;
  Color<float, 4, geo::ColorSpace::Linear> result;

  lineColor = self->_lineColor;
  *v2 = lineColor;
  result._backing._e[0] = lineColor._backing._e[0];
  return result;
}

@end
