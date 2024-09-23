@implementation MKMapCamera

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_mapView);
}

- (void)_mapViewStateChanged
{
  self->_needsStateUpdate = 1;
}

- (void)_updateState
{
  MKMapView **p_mapView;
  id WeakRetained;
  id *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;

  self->_needsStateUpdate = 0;
  p_mapView = &self->_mapView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);

  if (WeakRetained)
  {
    v5 = (id *)objc_loadWeakRetained((id *)p_mapView);
    v11 = v5[84];

    objc_msgSend(v11, "centerCoordinate");
    if (v7 >= -180.0 && v7 <= 180.0 && v6 >= -90.0 && v6 <= 90.0)
    {
      self->_centerCoordinate.latitude = v6;
      self->_centerCoordinate.longitude = v7;
      objc_msgSend(v11, "presentationYaw");
      if (v8 < 0.0 || v8 >= 360.0)
      {
        v8 = fmod(v8, 360.0);
        if (v8 < 0.0)
          v8 = v8 + 360.0;
      }
      self->_heading = v8;
      objc_msgSend(v11, "pitch");
      self->_pitch = v9;
      objc_msgSend(v11, "altitude");
      self->_altitude = v10;
    }

  }
}

+ (id)_cameraLookingAtMapRect:(id)a3 forViewSize:(CGSize)a4
{
  CGFloat v4;
  $FD2884BA735A6398BD92EEF91FE53E55 v6;

  v6 = a3;
  v4 = a4.width / a4.height;
  *(float *)&v4 = a4.width / a4.height;
  objc_msgSend(a1, "_cameraLookingAtGEOMapRect:aspectRatio:", &v6, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_setMapView:(id)a3
{
  objc_storeWeak((id *)&self->_mapView, a3);
}

- (BOOL)_validate
{
  double v3;
  double v4;
  BOOL v5;
  BOOL v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  -[MKMapCamera centerCoordinate](self, "centerCoordinate");
  v5 = v4 >= -180.0;
  if (v4 > 180.0)
    v5 = 0;
  if (v3 < -90.0)
    v5 = 0;
  v6 = v3 <= 90.0 && v5;
  if (!v6)
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    -[MKMapCamera centerCoordinate](self, "centerCoordinate");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%+.8f, %+.8f"), v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("Invalid camera centerCoordinate %@"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "raise");

  }
  return v6;
}

- (CLLocationCoordinate2D)centerCoordinate
{
  double latitude;
  double longitude;
  CLLocationCoordinate2D result;

  if (self->_needsStateUpdate)
    -[MKMapCamera _updateState](self, "_updateState");
  latitude = self->_centerCoordinate.latitude;
  longitude = self->_centerCoordinate.longitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (CGFloat)pitch
{
  if (self->_needsStateUpdate)
    -[MKMapCamera _updateState](self, "_updateState");
  return self->_pitch;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _BYTE *v4;

  v4 = (_BYTE *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[MKMapCamera centerCoordinate](self, "centerCoordinate");
  objc_msgSend(v4, "setCenterCoordinate:");
  -[MKMapCamera heading](self, "heading");
  objc_msgSend(v4, "setHeading:");
  -[MKMapCamera pitch](self, "pitch");
  objc_msgSend(v4, "setPitch:");
  -[MKMapCamera altitude](self, "altitude");
  objc_msgSend(v4, "setAltitude:");
  v4[56] = self->_pitchAdjustsAltitude;
  return v4;
}

- (CLLocationDirection)heading
{
  if (self->_needsStateUpdate)
    -[MKMapCamera _updateState](self, "_updateState");
  return self->_heading;
}

- (CLLocationDistance)altitude
{
  if (self->_needsStateUpdate)
    -[MKMapCamera _updateState](self, "_updateState");
  return self->_altitude;
}

- (void)_setPrecisePitch:(double)a3
{
  double v5;
  id WeakRetained;

  if (vabdd_f64(self->_pitch, a3) >= 0.00000011920929)
  {
    if (self->_pitchAdjustsAltitude)
    {
      -[MKMapCamera willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("altitude"));
      -[MKMapCamera centerCoordinateDistance](self, "centerCoordinateDistance");
      self->_altitude = cos(a3 * 0.0174532925) * v5;
      -[MKMapCamera didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("altitude"));
    }
    -[MKMapCamera willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("pitch"));
    self->_pitch = a3;
    -[MKMapCamera didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("pitch"));
    WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);
    objc_msgSend(WeakRetained, "_updateFromCamera:", self);

  }
}

+ (id)_cameraLookingAtGEOMapRect:(id *)a3 aspectRatio:(float)a4
{
  void *v5;

  VKCameraPropertiesForRect();
  objc_msgSend(a1, "camera");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCenterCoordinate:", 0.0, 0.0);
  objc_msgSend(v5, "setAltitude:", 0.0);
  return v5;
}

- (void)setAltitude:(CLLocationDistance)altitude
{
  id WeakRetained;

  self->_pitchAdjustsAltitude = 0;
  if (vabdd_f64(self->_altitude, altitude) >= 0.00000011920929)
  {
    -[MKMapCamera willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("altitude"));
    -[MKMapCamera willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("centerCoordinateDistance"));
    self->_altitude = altitude;
    -[MKMapCamera didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("altitude"));
    -[MKMapCamera didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("centerCoordinateDistance"));
    WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);
    objc_msgSend(WeakRetained, "_updateFromCamera:", self);

  }
}

- (void)setCenterCoordinate:(CLLocationCoordinate2D)centerCoordinate
{
  CLLocationDegrees longitude;
  CLLocationDegrees latitude;
  id WeakRetained;

  longitude = centerCoordinate.longitude;
  latitude = centerCoordinate.latitude;
  if (vabdd_f64(self->_centerCoordinate.latitude, centerCoordinate.latitude) >= 0.00000000999999994
    || vabdd_f64(self->_centerCoordinate.longitude, centerCoordinate.longitude) >= 0.00000000999999994)
  {
    -[MKMapCamera willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("centerCoordinate"));
    self->_centerCoordinate.latitude = latitude;
    self->_centerCoordinate.longitude = longitude;
    -[MKMapCamera didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("centerCoordinate"));
    WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);
    objc_msgSend(WeakRetained, "_updateFromCamera:", self);

  }
}

+ (MKMapCamera)camera
{
  return (MKMapCamera *)objc_alloc_init((Class)objc_opt_class());
}

- (void)setHeading:(CLLocationDirection)heading
{
  id WeakRetained;

  if (vabdd_f64(self->_heading, heading) >= 0.00000011920929)
  {
    -[MKMapCamera willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("heading"));
    self->_heading = heading;
    -[MKMapCamera didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("heading"));
    WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);
    objc_msgSend(WeakRetained, "_updateFromCamera:", self);

  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MKMapCamera)initWithCoder:(id)a3
{
  id v4;
  MKMapCamera *v5;
  CLLocationDegrees v6;
  CLLocationDegrees v7;
  double v8;
  double v9;
  double v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MKMapCamera;
  v5 = -[MKMapCamera init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("centerCoordinate.latitude"));
    v5->_centerCoordinate.latitude = v6;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("centerCoordinate.longitude"));
    v5->_centerCoordinate.longitude = v7;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("heading"));
    v5->_heading = v8;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("pitch"));
    v5->_pitch = v9;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("altitude"));
    v5->_altitude = v10;
    v5->_pitchAdjustsAltitude = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("pitchAdjustsAltitude"));
  }

  return v5;
}

- ($FD2884BA735A6398BD92EEF91FE53E55)_enclosingGEOMapRectForAspectRatio:(float)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  $FD2884BA735A6398BD92EEF91FE53E55 result;

  -[MKMapCamera centerCoordinate](self, "centerCoordinate");
  -[MKMapCamera heading](self, "heading");
  -[MKMapCamera pitch](self, "pitch");
  -[MKMapCamera altitude](self, "altitude");
  GEOMapRectEnclosingCameraProperties();
  result.var1.var1 = v7;
  result.var1.var0 = v6;
  result.var0.var1 = v5;
  result.var0.var0 = v4;
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_needsStateUpdate)
    -[MKMapCamera _updateState](self, "_updateState");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("centerCoordinate.latitude"), self->_centerCoordinate.latitude);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("centerCoordinate.longitude"), self->_centerCoordinate.longitude);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("heading"), self->_heading);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("pitch"), self->_pitch);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("altitude"), self->_altitude);
  objc_msgSend(v4, "encodeBool:forKey:", self->_pitchAdjustsAltitude, CFSTR("pitchAdjustsAltitude"));

}

+ (MKMapCamera)cameraLookingAtCenterCoordinate:(CLLocationCoordinate2D)centerCoordinate fromEyeCoordinate:(CLLocationCoordinate2D)eyeCoordinate eyeAltitude:(CLLocationDistance)eyeAltitude
{
  double longitude;
  double latitude;
  double v8;
  double v9;
  void *v10;
  long double v11;
  long double v12;
  double i;

  longitude = eyeCoordinate.longitude;
  latitude = eyeCoordinate.latitude;
  v8 = centerCoordinate.longitude;
  v9 = centerCoordinate.latitude;
  objc_msgSend((id)objc_opt_class(), "camera", *(_QWORD *)&eyeCoordinate.latitude, *(_QWORD *)&eyeCoordinate.longitude, *(_QWORD *)&centerCoordinate.latitude, *(_QWORD *)&centerCoordinate.longitude);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCenterCoordinate:", v9, v8);
  MKDirectionBetween(latitude, longitude, v9, v8);
  objc_msgSend(v10, "setHeading:");
  CLLocationCoordinate2DGetDistanceFrom();
  v12 = v11;
  if (eyeAltitude < 50.0)
    eyeAltitude = 50.0;
  for (i = atan2(v11, eyeAltitude) * 57.2957795; i > 85.0; i = atan2(v12, eyeAltitude) * 57.2957795)
    eyeAltitude = eyeAltitude + eyeAltitude;
  objc_msgSend(v10, "_setPrecisePitch:");
  objc_msgSend(v10, "setAltitude:", eyeAltitude);
  return (MKMapCamera *)v10;
}

+ (MKMapCamera)cameraLookingAtCenterCoordinate:(CLLocationCoordinate2D)centerCoordinate fromDistance:(CLLocationDistance)distance pitch:(CGFloat)pitch heading:(CLLocationDirection)heading
{
  double longitude;
  double latitude;
  void *v11;

  longitude = centerCoordinate.longitude;
  latitude = centerCoordinate.latitude;
  objc_msgSend((id)objc_opt_class(), "camera");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCenterCoordinate:", latitude, longitude);
  objc_msgSend(v11, "setHeading:", heading);
  objc_msgSend(v11, "_setPrecisePitch:", pitch);
  objc_msgSend(v11, "setAltitude:", (double)(cos(pitch * 0.0174532925) * distance));
  return (MKMapCamera *)v11;
}

+ (MKMapCamera)cameraLookingAtMapItem:(MKMapItem *)mapItem forViewSize:(CGSize)viewSize allowPitch:(BOOL)allowPitch
{
  _BOOL4 v5;
  double height;
  double width;
  MKMapItem *v9;
  void *v10;
  void *v11;
  double v12;
  CLLocationDegrees v13;
  CLLocationDegrees v14;
  CLLocationDegrees latitude;
  CLLocationDegrees longitude;
  CLLocationCoordinate2D v17;
  double v18;
  double v19;
  double v20;
  float v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  long double v28;
  void *v29;
  float v30;
  float v31;
  id v32;
  double v33;
  double v34;
  double v35;
  double v36;
  unint64_t v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  id v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  void *v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  uint64_t v66;
  double v67;
  double v68;
  void *v69;
  void *v70;
  id v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  float v77;
  uint64_t v78;
  double v79;
  float v80;
  double v81;
  float v82;
  float v83;
  double v84;
  float v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  long double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  BOOL v112;
  double v113;
  double v114;
  double v115;
  NSObject *v116;
  void *v117;
  void *v118;
  void *v119;
  double v120;
  double v121;
  double v122;
  NSObject *v123;
  void *v124;
  void *v125;
  void *v126;
  double v127;
  double v128;
  double v129;
  id v130;
  _BOOL4 v131;
  NSObject *v132;
  const __CFString *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  id v139;
  void *v140;
  void *v141;
  void *v142;
  double v143;
  double v144;
  double v145;
  NSObject *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  const char *v151;
  _BOOL4 v152;
  _BOOL4 v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  double v162;
  double v163;
  double v164;
  double v165;
  NSObject *v166;
  _BOOL4 v167;
  double v168;
  double v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  float v174;
  double v175;
  float v176;
  const __CFString *v178;
  void *v179;
  double v180;
  double v181;
  double v182;
  double v183;
  double v184;
  double v185;
  double v186;
  double v187;
  double v188;
  double v189;
  double v190;
  double v191;
  double v192;
  double v193;
  double v194;
  double v195;
  double v196;
  double v197;
  double v198;
  uint8_t buf[4];
  double v200;
  __int16 v201;
  void *v202;
  __int16 v203;
  void *v204;
  uint64_t v205;
  MKMapRect v206;
  MKMapRect v207;
  MKMapRect v208;
  MKMapRect v209;
  MKMapRect v210;

  v5 = allowPitch;
  height = viewSize.height;
  width = viewSize.width;
  v205 = *MEMORY[0x1E0C80C00];
  v9 = mapItem;
  -[MKMapItem _viewportFrame](v9, "_viewportFrame");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[MKMapItem _viewportFrame](v9, "_viewportFrame");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "latitude");
    v13 = v12;
    objc_msgSend(v11, "longitude");
    v17 = CLLocationCoordinate2DMake(v13, v14);
    longitude = v17.longitude;
    latitude = v17.latitude;
    if (!v5)
      -[MKMapItem _coordinate](v9, "_coordinate");
    v18 = MKTilePointForCoordinate(latitude, longitude, 21.0);
    v20 = v19;
    objc_msgSend(v11, "distance");
    v22 = v21;
    +[MKSystemController sharedInstance](MKSystemController, "sharedInstance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "screenSize");
    v25 = v24;
    v27 = v26;

    v28 = exp2(21.0 - v22);
    +[MKMapCamera _cameraLookingAtMapRect:forViewSize:](MKMapCamera, "_cameraLookingAtMapRect:forViewSize:", (double)(v18 - v25 / (1.0 / v28) * 0.5), (double)(v20 - v27 / (1.0 / v28) * 0.5), (double)(v25 / (1.0 / v28)), (double)(v27 / (1.0 / v28)), v25, v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "heading");
    objc_msgSend(v29, "setHeading:", v30);
    objc_msgSend(v11, "pitch");
    objc_msgSend(v29, "setPitch:", v31);
    if (width == v25 && height == v27)
    {
      v32 = v29;
LABEL_99:

      goto LABEL_100;
    }
    v56 = (void *)objc_msgSend(v29, "copy");
    objc_msgSend(v56, "setHeading:", 0.0);
    objc_msgSend(v56, "setPitch:", 0.0);
    v57 = width / height;
    *(float *)&v58 = width / height;
    objc_msgSend(v56, "enclosingMapRectForAspectRatio:", v58);
    v60 = log2(width / v59) + 21.0;
    if (v60 >= 0.0)
      v61 = v60;
    else
      v61 = 0.0;
    -[MKMapItem _coordinate](v9, "_coordinate");
    v63 = v62;
    v65 = v64;
    v66 = objc_msgSend(a1, "_sizeCategoryForViewSize:", width, height);
    switch(v66)
    {
      case 2:
        objc_msgSend(v11, "distance");
        v61 = v77;
        break;
      case 1:
        v67 = 80.0 / width + -0.300000012;
        v68 = v57 / 1.75;
        goto LABEL_29;
      case 0:
        v67 = 30.0 / width + 1.29999995;
        v68 = v57 * 0.125;
LABEL_29:
        v79 = v67 + v68;
        objc_msgSend(v11, "distance");
        v61 = v80 - v79;
        *(double *)&v78 = 40.0;
LABEL_30:
        v81 = *(double *)&v78;
        objc_msgSend(v11, "pitch");
        v194 = height;
        if (v81 < v82 && v5)
        {
          objc_msgSend(v11, "heading");
          v84 = v83;
          objc_msgSend(v11, "pitch");
          objc_msgSend(a1, "_adjustCoordinateForPitch:heading:pitch:minimumPitchRequiredForAdjustment:tolerance:", v63, v65, v84, v85, v81, 5000.0);
          v63 = v86;
          v65 = v87;
        }
        v88 = MKTilePointForCoordinate(v63, v65, 21.0);
        v90 = v89;
        v91 = 6.0;
        if (v61 > 15.0)
          v91 = 21.0 - v61;
        v92 = 1.0 / exp2(v91);
        v193 = width;
        v93 = width / v92;
        v94 = v194 / v92;
        v95 = v88 - v93 * 0.5;
        v96 = v90 - v194 / v92 * 0.5;
        if (objc_msgSend(v11, "hasViewTargetBounds"))
        {
          v189 = v65;
          objc_msgSend(v11, "minViewTargetBounds");
          v98 = v97;
          objc_msgSend(v11, "maxViewTargetBounds");
          v100 = v98 - v99;
          GEOCalculateDistance();
          v102 = sqrt(v100 * v100 + v101 * v101);
          objc_msgSend(v11, "maxViewTargetBounds");
          v104 = v103;
          if (v102 <= v103)
            v105 = v103;
          else
            v105 = v102;
          v106 = 0.699999988;
          if (v102 < v103)
            v106 = 0.5;
          MKMapRectMakeWithRadialDistance(v17.latitude, v17.longitude, v106 * (v105 * 0.5));
          if (v108 <= v93)
          {
            v65 = v189;
          }
          else
          {
            if (v107 > v94)
            {
              v109 = dbl_18B2AA090[v102 < v104];
              v93 = v93 * v109;
              v94 = v94 * v109;
            }
            v65 = v189;
          }
        }
        +[MKMapCamera _cameraLookingAtMapRect:forViewSize:](MKMapCamera, "_cameraLookingAtMapRect:forViewSize:", v95, v96, v93, v94, v193, v194);
        v32 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "heading");
        objc_msgSend(v32, "setHeading:", v174);
        objc_msgSend(v32, "setCenterCoordinate:", v63, v65);
        v175 = 0.0;
        if (v5)
        {
          objc_msgSend(v11, "pitch", 0.0);
          v175 = v176;
        }
        objc_msgSend(v32, "setPitch:", v175);

        goto LABEL_99;
    }
    *(double *)&v78 = 1.79769313e308;
    goto LABEL_30;
  }
  -[MKMapItem _coordinate](v9, "_coordinate");
  v35 = v33;
  if (v34 < -180.0 || (v36 = v34, v34 > 180.0) || v33 < -90.0 || v33 > 90.0)
  {
    +[MKMapCamera camera](MKMapCamera, "camera");
    v32 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_100;
  }
  v37 = objc_msgSend(a1, "_sizeCategoryForViewSize:", width, height);
  v38 = 0.0;
  v39 = 0.0;
  if (v37 <= 2)
  {
    v38 = dbl_18B2AA0A0[v37];
    v39 = dbl_18B2AA0B8[v37];
  }
  v185 = v38;
  v186 = MKTilePointForCoordinate(v35, v36, 21.0);
  v187 = v40;
  v184 = v39;
  v41 = 1.0 / exp2(21.0 - v39);
  -[MKMapItem placemark](v9, "placemark");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "region");
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v44 = v43;
    objc_msgSend(v44, "center");
    v46 = v45;
    v48 = v47;
    objc_msgSend(v44, "radius");
    v50 = v49;

    v51 = MKMapRectMakeWithRadialDistance(v46, v48, v50);
    v53 = v52;
    v188 = v55;
    v190 = v54;
  }
  else
  {
    v188 = 0.0;
    v190 = 0.0;
    v51 = INFINITY;
    v53 = INFINITY;
  }
  v192 = width / v41;
  v191 = height / v41;
  -[MKMapItem _geoMapItem](v9, "_geoMapItem");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "displayMapRegionOrNil");
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  if (v70)
  {
    v71 = v70;
    GEOMapRectForMapRegion();
    MKCoordinateRegionForMapRect(v206);

    GEOMapRectForCoordinateRegion();
    v76 = v75;
  }
  else
  {
    v73 = 0.0;
    v76 = INFINITY;
    v72 = INFINITY;
    v74 = 0.0;
  }
  v110 = v192 * 0.5;
  v111 = v191 * 0.5;
  v112 = v76 == INFINITY;
  if (v72 != INFINITY)
    v112 = 0;
  if (v51 == INFINITY && v53 == INFINITY)
  {
    v113 = width;
    v115 = v186;
    v114 = v187;
    if (v112)
    {
      v188 = 0.0;
      v190 = 0.0;
      v51 = INFINITY;
      v53 = INFINITY;
    }
    else
    {
      v121 = v74;
      v53 = v72;
      v122 = v73;
      MKGetMKMapCameraLog();
      v123 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v123, OS_LOG_TYPE_INFO))
      {
        v124 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%.1f, %.1f}"), *(_QWORD *)&v76, *(_QWORD *)&v53);
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%.1f, %.1f}"), *(_QWORD *)&v122, *(_QWORD *)&v121);
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v124, "stringWithFormat:", CFSTR("{%@, %@}"), v125, v126);
        v127 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());

        *(_DWORD *)buf = 138477827;
        v200 = v127;
        _os_log_impl(&dword_18B0B0000, v123, OS_LOG_TYPE_INFO, "Only display framing data is present - display:%{private}@", buf, 0xCu);

      }
      v51 = v76;
      v188 = v121;
      v190 = v122;
      v111 = v191 * 0.5;
      v115 = v186;
      v114 = v187;
    }
  }
  else if (v112)
  {
    MKGetMKMapCameraLog();
    v116 = objc_claimAutoreleasedReturnValue();
    v113 = width;
    v115 = v186;
    v114 = v187;
    if (os_log_type_enabled(v116, OS_LOG_TYPE_INFO))
    {
      v117 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%.1f, %.1f}"), *(_QWORD *)&v51, *(_QWORD *)&v53);
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%.1f, %.1f}"), *(_QWORD *)&v190, *(_QWORD *)&v188);
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v117, "stringWithFormat:", CFSTR("{%@, %@}"), v118, v119);
      v120 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());

      *(_DWORD *)buf = 138477827;
      v200 = v120;
      _os_log_impl(&dword_18B0B0000, v116, OS_LOG_TYPE_INFO, "Only placemark framing data is present - placemark:%{private}@", buf, 0xCu);

    }
    v111 = v191 * 0.5;
  }
  else
  {
    v181 = v74;
    v182 = v72;
    v183 = v73;
    v180 = v53;
    v197 = 0.0;
    v198 = 0.0;
    v195 = 0.0;
    v196 = 0.0;
    v207.origin.x = v51;
    v207.origin.y = v53;
    v128 = v188;
    v129 = v190;
    v207.size.width = v190;
    v207.size.height = v188;
    MKCoordinateRegionForMapRect(v207);
    __61__MKMapCamera_cameraLookingAtMapItem_forViewSize_allowPitch___block_invoke(&v198, &v197);
    v130 = v70;
    GEOMapRectForMapRegion();
    MKCoordinateRegionForMapRect(v208);

    __61__MKMapCamera_cameraLookingAtMapItem_forViewSize_allowPitch___block_invoke(&v196, &v195);
    v131 = v195 < v197 || v196 < v198;
    MKGetMKMapCameraLog();
    v132 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v132, OS_LOG_TYPE_INFO))
    {
      *(double *)&v133 = COERCE_DOUBLE(CFSTR("placemark"));
      if (v131)
        *(double *)&v133 = COERCE_DOUBLE(CFSTR("display"));
      v178 = v133;
      v134 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%.1f, %.1f}"), *(_QWORD *)&v76, *(_QWORD *)&v182);
      v179 = v43;
      v135 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%.1f, %.1f}"), *(_QWORD *)&v183, *(_QWORD *)&v181);
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v134, "stringWithFormat:", CFSTR("{%@, %@}"), v135, v136);
      v137 = (void *)objc_claimAutoreleasedReturnValue();

      v138 = (void *)MEMORY[0x1E0CB3940];
      v139 = v137;
      objc_msgSend(v138, "stringWithFormat:", CFSTR("{%.1f, %.1f}"), *(_QWORD *)&v51, *(_QWORD *)&v180);
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%.1f, %.1f}"), *(_QWORD *)&v190, *(_QWORD *)&v188);
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v138, "stringWithFormat:", CFSTR("{%@, %@}"), v140, v141);
      v142 = (void *)objc_claimAutoreleasedReturnValue();

      *(_DWORD *)buf = 138543875;
      v200 = *(double *)&v178;
      v201 = 2113;
      v202 = v137;
      v203 = 2113;
      v204 = v142;
      _os_log_impl(&dword_18B0B0000, v132, OS_LOG_TYPE_INFO, "Will prefer %{public}@ framing data - display:%{private}@ placemark:%{private}@", buf, 0x20u);

      v43 = v179;
    }

    if (v131)
      v51 = v76;
    v143 = v180;
    if (v131)
      v143 = v182;
    v111 = v191 * 0.5;
    if (v131)
    {
      v129 = v183;
      v128 = v181;
    }
    v188 = v128;
    v190 = v129;
    v113 = width;
    v115 = v186;
    v114 = v187;
    v110 = v192 * 0.5;
    v53 = v143;
  }
  v144 = v115 - v110;
  v145 = v114 - v111;
  if (v51 == INFINITY && v53 == INFINITY)
  {
    MKGetMKMapCameraLog();
    v146 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v146, OS_LOG_TYPE_INFO))
    {
      v147 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%.1f, %.1f}"), *(_QWORD *)&v144, *(_QWORD *)&v145);
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%.1f, %.1f}"), *(_QWORD *)&v192, *(_QWORD *)&v191);
      v149 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v147, "stringWithFormat:", CFSTR("{%@, %@}"), v148, v149);
      v150 = (void *)objc_claimAutoreleasedReturnValue();

      *(_DWORD *)buf = 134349315;
      v200 = v184;
      v201 = 2113;
      v202 = v150;
      v151 = "No framing data is present - zoomLevel:%{public}f zoom:%{private}@";
LABEL_80:
      _os_log_impl(&dword_18B0B0000, v146, OS_LOG_TYPE_INFO, v151, buf, 0x16u);

    }
  }
  else
  {
    v209.origin.x = v144;
    v209.origin.y = v114 - v111;
    v209.size.height = v191;
    v209.size.width = v192;
    v210.origin.x = v51;
    v210.origin.y = v53;
    v210.size.height = v188;
    v210.size.width = v190;
    v152 = MKMapRectContainsRect(v209, v210);
    MKGetMKMapCameraLog();
    v146 = objc_claimAutoreleasedReturnValue();
    v153 = os_log_type_enabled(v146, OS_LOG_TYPE_INFO);
    if (!v152)
    {
      if (v153)
      {
        v157 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%.1f, %.1f}"), *(_QWORD *)&v144, *(_QWORD *)&v145);
        v158 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%.1f, %.1f}"), *(_QWORD *)&v192, *(_QWORD *)&v191);
        v159 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v157, "stringWithFormat:", CFSTR("{%@, %@}"), v158, v159);
        v160 = (void *)objc_claimAutoreleasedReturnValue();

        *(_DWORD *)buf = 134349315;
        v200 = v184;
        v201 = 2113;
        v202 = v160;
        _os_log_impl(&dword_18B0B0000, v146, OS_LOG_TYPE_INFO, "Framing data rect is too large to fit in zoom level rect - zoomLevel:%{public}f zoom:%{private}@", buf, 0x16u);

      }
      v144 = v51;
      v145 = v53;
      v191 = v188;
      v192 = v190;
      goto LABEL_85;
    }
    if (v153)
    {
      v154 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%.1f, %.1f}"), *(_QWORD *)&v144, *(_QWORD *)&v145);
      v155 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%.1f, %.1f}"), *(_QWORD *)&v192, *(_QWORD *)&v191);
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v154, "stringWithFormat:", CFSTR("{%@, %@}"), v155, v156);
      v150 = (void *)objc_claimAutoreleasedReturnValue();

      *(_DWORD *)buf = 134349315;
      v200 = v184;
      v201 = 2113;
      v202 = v150;
      v151 = "Framing data rect fits within zoom level rect - zoomLevel:%{public}f zoom:%{private}@";
      goto LABEL_80;
    }
  }

LABEL_85:
  objc_msgSend(a1, "_cameraLookingAtMapRect:forViewSize:", v144, v145, v192, v191, v113, height);
  v32 = (id)objc_claimAutoreleasedReturnValue();
  if (v185 > 0.0)
  {
    objc_msgSend(a1, "_cameraLookingAtMapRect:forViewSize:", v115 - v113 / 0.14358737 * 0.5, v114 - height / 0.14358737 * 0.5, v113 / 0.14358737, height / 0.14358737, v113, height);
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "centerCoordinateDistance");
    v163 = v162;
    objc_msgSend(v161, "centerCoordinateDistance");
    v165 = v164;
    MKGetMKMapCameraLog();
    v166 = objc_claimAutoreleasedReturnValue();
    v167 = os_log_type_enabled(v166, OS_LOG_TYPE_INFO);
    if (v163 <= v165)
    {
      if (v167)
      {
        objc_msgSend(v32, "centerCoordinateDistance");
        v172 = v171;
        objc_msgSend(v161, "centerCoordinateDistance");
        *(_DWORD *)buf = 134349568;
        v200 = v185;
        v201 = 2050;
        v202 = v172;
        v203 = 2050;
        v204 = v173;
        _os_log_impl(&dword_18B0B0000, v166, OS_LOG_TYPE_INFO, "Pitching the camera %{public}f degrees - camera:%{public}f max:%{public}f", buf, 0x20u);
      }

      objc_msgSend(v32, "setPitch:", v185);
    }
    else
    {
      if (v167)
      {
        objc_msgSend(v32, "centerCoordinateDistance");
        v169 = v168;
        objc_msgSend(v161, "centerCoordinateDistance");
        *(_DWORD *)buf = 134349312;
        v200 = v169;
        v201 = 2050;
        v202 = v170;
        _os_log_impl(&dword_18B0B0000, v166, OS_LOG_TYPE_INFO, "Not pitching the camera - camera:%{public}f max:%{public}f", buf, 0x16u);
      }

    }
  }

LABEL_100:
  return (MKMapCamera *)v32;
}

uint64_t __61__MKMapCamera_cameraLookingAtMapItem_forViewSize_allowPitch___block_invoke(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  CLLocationCoordinate2D v7;
  CLLocationCoordinate2D v8;

  v8.latitude = 0.0;
  v8.longitude = 0.0;
  v7.latitude = 0.0;
  v7.longitude = 0.0;
  MKCoordinatesForRegion(&v8, &v7);
  GEOCalculateDistance();
  *a2 = v4;
  result = GEOCalculateDistance();
  *a1 = v6;
  return result;
}

+ (CLLocationCoordinate2D)_adjustCoordinateForPitch:(CLLocationCoordinate2D)a3 heading:(double)a4 pitch:(double)a5 minimumPitchRequiredForAdjustment:(double)a6 tolerance:(double)a7
{
  double longitude;
  double latitude;
  double v9;
  __double2 v10;
  double v11;
  double v12;
  CLLocationCoordinate2D v13;
  CLLocationCoordinate2D result;

  longitude = a3.longitude;
  latitude = a3.latitude;
  v9 = a5 / a6 / -a7;
  v10 = __sincos_stret((360.0 - a4) * 3.14159265 / 180.0);
  v13 = CLLocationCoordinate2DMake(latitude - v9 * v10.__cosval, longitude + v9 * v10.__sinval);
  v12 = v13.longitude;
  v11 = v13.latitude;
  result.longitude = v12;
  result.latitude = v11;
  return result;
}

+ (unint64_t)_sizeCategoryForViewSize:(CGSize)a3
{
  if (a3.width < 200.0)
    return 0;
  if (a3.width > 428.0)
    return 2;
  if (a3.width >= a3.height)
    return 1;
  if (a3.width <= 300.0)
    return 1;
  return 2;
}

+ (id)_cameraLookingAtScene:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  v3 = a3;
  objc_msgSend(v3, "_mapItem");
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v4, "_geoMapItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_storefrontPresentationInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v3, "_wantsCloseUpView");
  if ((v4 & 1) != 0)
  {
    objc_msgSend(v6, "closeUpView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v6, "standOffView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = v8;
    }
    else
    {
      objc_msgSend(v6, "closeUpView");
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = v10;

  }
  VKCameraPropertiesForStoreFrontView();
  objc_msgSend((id)objc_opt_class(), "camera");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCenterCoordinate:", 0.0, 0.0);
  objc_msgSend(v11, "setAltitude:", 0.0);
  objc_msgSend(v11, "setHeading:", 0.0);
  objc_msgSend(v11, "setPitch:", 0.0);

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  double *v5;
  BOOL v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (double *)v4;
    v6 = self->_centerCoordinate.latitude == v5[1]
      && self->_centerCoordinate.longitude == v5[2]
      && self->_heading == v5[3]
      && self->_pitch == v5[4]
      && self->_altitude == v5[5];

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_mapView
{
  return objc_loadWeakRetained((id *)&self->_mapView);
}

- (CLLocationDistance)centerCoordinateDistance
{
  double altitude;

  if (self->_needsStateUpdate)
    -[MKMapCamera _updateState](self, "_updateState");
  altitude = self->_altitude;
  return altitude / cos(self->_pitch * 0.0174532925);
}

- (void)setCenterCoordinateDistance:(CLLocationDistance)centerCoordinateDistance
{
  long double v4;
  id WeakRetained;

  self->_pitchAdjustsAltitude = 1;
  v4 = cos(self->_pitch * 0.0174532925) * centerCoordinateDistance;
  if (vabdd_f64(self->_altitude, v4) >= 0.00000011920929)
  {
    -[MKMapCamera willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("altitude"));
    -[MKMapCamera willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("centerCoordinateDistance"));
    self->_altitude = v4;
    -[MKMapCamera didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("altitude"));
    -[MKMapCamera didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("centerCoordinateDistance"));
    WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);
    objc_msgSend(WeakRetained, "_updateFromCamera:", self);

  }
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%+.8f, %+.8f"), *(_QWORD *)&self->_centerCoordinate.latitude, *(_QWORD *)&self->_centerCoordinate.longitude);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p centerCoordinate:%@ altitude:%.0fm heading:%.0f˚ pitch:%.0f˚>"), v5, self, v6, *(_QWORD *)&self->_altitude, *(_QWORD *)&self->_heading, *(_QWORD *)&self->_pitch);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (double)_precisePitch
{
  return self->_pitch;
}

@end
