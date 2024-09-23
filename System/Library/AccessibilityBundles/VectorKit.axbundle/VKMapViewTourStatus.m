@implementation VKMapViewTourStatus

- (id)_tourStatusAnnouncementWithLength:(unint64_t)a3
{
  void *v4;
  _BOOL4 v5;
  void *v6;
  int v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  float v15;
  float v16;
  double v17;
  double v18;
  double v19;
  BOOL v20;
  double v21;
  int v22;
  double v23;
  uint64_t v24;
  void *v25;
  void *v26;
  __CFString *v27;
  __CFString *v28;
  __CFString *v29;
  __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  float v42;
  float v43;
  int v44;
  double v45;
  _BOOL4 v46;
  unint64_t v47;
  char v48;
  uint64_t v49;
  void *v50;
  __CFString *v51;
  __CFString *v52;
  __CFString *v53;
  __CFString *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  void *v62;
  __CFString *v63;
  void *v64;
  uint64_t v65;
  void *v67;
  void *v68;
  void *v69;
  const __CFString *v70;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;

  -[VKMapViewTourStatus currentLocation](self, "currentLocation");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKMapViewTourStatus lastCurrentLocation](self, "lastCurrentLocation");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKMapViewTourStatus futureLocation](self, "futureLocation");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKMapViewTourStatus lastFutureLocation](self, "lastFutureLocation");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKMapViewTourStatus futurePOI](self, "futurePOI");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKMapViewTourStatus lastFuturePOI](self, "lastFuturePOI");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[VKMapViewTourStatus isStationary](self, "isStationary");
  if (!v76)
    goto LABEL_20;
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_navigation_distanceUsesMetricSystem");

  objc_msgSend(v76, "accessibilityContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKMapViewTourStatus currentPoint](self, "currentPoint");
  v10 = v9;
  v12 = v11;
  -[VKMapViewTourStatus futurePoint](self, "futurePoint");
  objc_msgSend(v8, "accessibilityRealDistanceBetweenPoint:screenPoint2:", v10, v12, v13, v14);
  v16 = v15;
  v17 = v15;

  if (v7)
  {
    if (v16 > 15.0 || (-[VKMapViewTourStatus lastFutureDistance](self, "lastFutureDistance"), v18 <= 15.0))
    {
      if (v16 <= 30.0)
      {
        -[VKMapViewTourStatus lastFutureDistance](self, "lastFutureDistance");
        v20 = v19 <= 30.0;
        goto LABEL_13;
      }
LABEL_11:
      v22 = 0;
      goto LABEL_16;
    }
LABEL_9:
    v22 = 1;
    goto LABEL_16;
  }
  if (v17 <= 30.479999)
  {
    -[VKMapViewTourStatus lastFutureDistance](self, "lastFutureDistance");
    if (v21 > 30.479999)
      goto LABEL_9;
  }
  if (v17 > 15.2399995)
    goto LABEL_11;
  -[VKMapViewTourStatus lastFutureDistance](self, "lastFutureDistance");
  v20 = v23 <= 15.2399995;
LABEL_13:
  v22 = !v20;
LABEL_16:
  if ((objc_msgSend(v76, "isEqual:", v74) ^ 1 | v22) == 1)
  {
    if (a3 == 2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v76, "trueLabel");
      v24 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v76, "accessibilityLabel");
      v24 = objc_claimAutoreleasedReturnValue();
    }
    v26 = (void *)v24;
    -[VKMapViewTourStatus setLastFutureDistance:](self, "setLastFutureDistance:", v17);
    v27 = CFSTR("APPROACHING_LOCATION_METERS");
    if (v5)
      v27 = CFSTR("FACING_LOCATION_METERS");
    v28 = v27;
    if ((v7 & 1) == 0)
    {
      v29 = CFSTR("APPROACHING_LOCATION_FEET");
      if (v5)
        v29 = CFSTR("FACING_LOCATION_FEET");
      v30 = v29;

      v28 = v30;
    }
    v31 = (void *)MEMORY[0x24BDD17C8];
    AXVectorKitLocString(v28);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    AXFormatInteger();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "localizedStringWithFormat:", v32, v26, v33);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
      goto LABEL_60;
    goto LABEL_30;
  }
LABEL_20:
  v25 = 0;
  if (!v4)
    goto LABEL_60;
LABEL_30:
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "_navigation_distanceUsesMetricSystem");

  objc_msgSend(v4, "location");
  VKLocationCoordinate2DForVKPoint();
  v37 = v36;
  v39 = v38;
  objc_msgSend(v4, "accessibilityContainer");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "accessibilityConvertCoordinateToWindow:", v37, v39);

  objc_msgSend(v4, "accessibilityContainer");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKMapViewTourStatus currentPoint](self, "currentPoint");
  objc_msgSend(v41, "accessibilityRealDistanceBetweenPoint:screenPoint2:");
  v43 = v42;

  if (v43 <= 15.0)
    v44 = v35;
  else
    v44 = 0;
  if (v44 == 1)
  {
    -[VKMapViewTourStatus lastPOIDistance](self, "lastPOIDistance");
    v46 = v45 > 15.0;
  }
  else
  {
    v46 = 0;
  }
  if (objc_msgSend(v4, "isEqual:", v72))
  {
    if (-[VKMapViewTourStatus futurePOISide](self, "futurePOISide"))
    {
      v47 = -[VKMapViewTourStatus lastFuturePOISide](self, "lastFuturePOISide");
      v48 = v47 != -[VKMapViewTourStatus futurePOISide](self, "futurePOISide") || v46;
      if ((v48 & 1) == 0)
        goto LABEL_60;
    }
    else if (!v46)
    {
      goto LABEL_60;
    }
  }
  if (a3 == 2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v4, "trueLabel");
    v49 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "accessibilityLabel");
    v49 = objc_claimAutoreleasedReturnValue();
  }
  v50 = (void *)v49;
  -[VKMapViewTourStatus setLastPOIDistance:](self, "setLastPOIDistance:", v43);
  v51 = CFSTR("APPROACHING_LOCATION_METERS");
  if (v5)
    v51 = CFSTR("FACING_LOCATION_METERS");
  v52 = v51;
  if ((v35 & 1) == 0)
  {
    v53 = CFSTR("APPROACHING_LOCATION_FEET");
    if (v5)
      v53 = CFSTR("FACING_LOCATION_FEET");
    v54 = v53;

    v52 = v54;
  }
  v55 = (void *)MEMORY[0x24BDD17C8];
  AXVectorKitLocString(v52);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  AXFormatInteger();
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "localizedStringWithFormat:", v56, v50, v57);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[VKMapViewTourStatus futurePOISide](self, "futurePOISide", v68, CFSTR("__AXStringForVariablesSentinel")))
  {
    if (-[VKMapViewTourStatus futurePOISide](self, "futurePOISide") == 1)
      AXVectorKitLocString(CFSTR("APPROACHING_LEFT"));
    else
      AXVectorKitLocString(CFSTR("APPROACHING_RIGHT"));
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = CFSTR("__AXStringForVariablesSentinel");
    __UIAXStringForVariables();
    v59 = objc_claimAutoreleasedReturnValue();

    v58 = (void *)v59;
  }

  v25 = v58;
LABEL_60:
  if (v75 && (objc_msgSend(v75, "isEqual:", v73) & 1) == 0)
  {
    if (a3 == 2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v75, "trueLabel");
      v60 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v75, "accessibilityLabel", v67, v70);
      v60 = objc_claimAutoreleasedReturnValue();
    }
    v61 = (void *)v60;
    v62 = (void *)MEMORY[0x24BDD17C8];
    if (objc_msgSend(v75, "isRoad", v67))
      v63 = CFSTR("ON_ROAD");
    else
      v63 = CFSTR("AT_POI");
    AXVectorKitLocString(v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "localizedStringWithFormat:", v64, v61);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v65 = objc_claimAutoreleasedReturnValue();

    v25 = (void *)v65;
  }

  return v25;
}

- (id)longTourStatusAnnouncement
{
  return -[VKMapViewTourStatus _tourStatusAnnouncementWithLength:](self, "_tourStatusAnnouncementWithLength:", 1);
}

- (id)shortTourStatusAnnouncement
{
  return -[VKMapViewTourStatus _tourStatusAnnouncementWithLength:](self, "_tourStatusAnnouncementWithLength:", 2);
}

- (id)_stringForSide:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("Left");
  if (a3 == 2)
    v3 = CFSTR("Right");
  if (a3)
    return (id)v3;
  else
    return CFSTR("None");
}

- (void)updateTourStatusWithCurrentLocation:(id)a3 currentPoint:(CGPoint)a4 futureLocation:(id)a5 futurePoint:(CGPoint)a6 tourPOI:(id)a7 tourPOISide:(unint64_t)a8 isStationary:(BOOL)a9
{
  _BOOL8 v9;
  double y;
  double x;
  double v15;
  double v16;
  id v18;
  id v19;
  void *v20;
  double v21;
  double v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  char v31;
  id v32;

  v9 = a9;
  y = a6.y;
  x = a6.x;
  v15 = a4.y;
  v16 = a4.x;
  v32 = a3;
  v18 = a5;
  v19 = a7;
  -[VKMapViewTourStatus setIsStationary:](self, "setIsStationary:", v9);
  -[VKMapViewTourStatus currentLocation](self, "currentLocation");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKMapViewTourStatus setLastCurrentLocation:](self, "setLastCurrentLocation:", v20);

  -[VKMapViewTourStatus setCurrentLocation:](self, "setCurrentLocation:", v32);
  -[VKMapViewTourStatus setCurrentPoint:](self, "setCurrentPoint:", v16, v15);
  -[VKMapViewTourStatus futurePoint](self, "futurePoint");
  *(float *)&v21 = x - v21;
  *(float *)&v22 = y - v22;
  if (sqrtf((float)(*(float *)&v21 * *(float *)&v21) + (float)(*(float *)&v22 * *(float *)&v22)) >= 4.0 || v9)
  {
    -[VKMapViewTourStatus futureLocation](self, "futureLocation");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24 || v9)
    {
      -[VKMapViewTourStatus futureLocation](self, "futureLocation");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[VKMapViewTourStatus setLastFutureLocation:](self, "setLastFutureLocation:", v25);

    }
    -[VKMapViewTourStatus setFutureLocation:](self, "setFutureLocation:", v18);
    -[VKMapViewTourStatus setFuturePoint:](self, "setFuturePoint:", x, y);
  }
  if (v9
    || (-[VKMapViewTourStatus futurePOI](self, "futurePOI"),
        v26 = (void *)objc_claimAutoreleasedReturnValue(),
        v26,
        v26))
  {
    -[VKMapViewTourStatus lastFuturePOI](self, "lastFuturePOI");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKMapViewTourStatus futurePOI](self, "futurePOI");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v27, "isEqual:", v28);

    -[VKMapViewTourStatus futurePOI](self, "futurePOI");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKMapViewTourStatus setLastFuturePOI:](self, "setLastFuturePOI:", v30);

    if (-[VKMapViewTourStatus futurePOISide](self, "futurePOISide"))
      v31 = 0;
    else
      v31 = v29;
    if ((v31 & 1) == 0)
      -[VKMapViewTourStatus setLastFuturePOISide:](self, "setLastFuturePOISide:", -[VKMapViewTourStatus futurePOISide](self, "futurePOISide"));
  }
  -[VKMapViewTourStatus setFuturePOI:](self, "setFuturePOI:", v19);
  -[VKMapViewTourStatus setFuturePOISide:](self, "setFuturePOISide:", a8);

}

- (VKFeatureAccessibilityElement)currentLocation
{
  return self->_currentLocation;
}

- (void)setCurrentLocation:(id)a3
{
  objc_storeStrong((id *)&self->_currentLocation, a3);
}

- (VKFeatureAccessibilityElement)lastCurrentLocation
{
  return self->_lastCurrentLocation;
}

- (void)setLastCurrentLocation:(id)a3
{
  objc_storeStrong((id *)&self->_lastCurrentLocation, a3);
}

- (VKFeatureAccessibilityElement)futureLocation
{
  return self->_futureLocation;
}

- (void)setFutureLocation:(id)a3
{
  objc_storeStrong((id *)&self->_futureLocation, a3);
}

- (VKFeatureAccessibilityElement)lastFutureLocation
{
  return self->_lastFutureLocation;
}

- (void)setLastFutureLocation:(id)a3
{
  objc_storeStrong((id *)&self->_lastFutureLocation, a3);
}

- (VKPointFeatureAccessibilityElement)futurePOI
{
  return self->_futurePOI;
}

- (void)setFuturePOI:(id)a3
{
  objc_storeStrong((id *)&self->_futurePOI, a3);
}

- (VKPointFeatureAccessibilityElement)lastFuturePOI
{
  return self->_lastFuturePOI;
}

- (void)setLastFuturePOI:(id)a3
{
  objc_storeStrong((id *)&self->_lastFuturePOI, a3);
}

- (CGPoint)currentPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_currentPoint.x;
  y = self->_currentPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setCurrentPoint:(CGPoint)a3
{
  self->_currentPoint = a3;
}

- (CGPoint)futurePoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_futurePoint.x;
  y = self->_futurePoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setFuturePoint:(CGPoint)a3
{
  self->_futurePoint = a3;
}

- (double)lastFutureDistance
{
  return self->_lastFutureDistance;
}

- (void)setLastFutureDistance:(double)a3
{
  self->_lastFutureDistance = a3;
}

- (double)lastPOIDistance
{
  return self->_lastPOIDistance;
}

- (void)setLastPOIDistance:(double)a3
{
  self->_lastPOIDistance = a3;
}

- (unint64_t)futurePOISide
{
  return self->_futurePOISide;
}

- (void)setFuturePOISide:(unint64_t)a3
{
  self->_futurePOISide = a3;
}

- (unint64_t)lastFuturePOISide
{
  return self->_lastFuturePOISide;
}

- (void)setLastFuturePOISide:(unint64_t)a3
{
  self->_lastFuturePOISide = a3;
}

- (BOOL)isStationary
{
  return self->_isStationary;
}

- (void)setIsStationary:(BOOL)a3
{
  self->_isStationary = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastFuturePOI, 0);
  objc_storeStrong((id *)&self->_futurePOI, 0);
  objc_storeStrong((id *)&self->_lastFutureLocation, 0);
  objc_storeStrong((id *)&self->_futureLocation, 0);
  objc_storeStrong((id *)&self->_lastCurrentLocation, 0);
  objc_storeStrong((id *)&self->_currentLocation, 0);
}

@end
