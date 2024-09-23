@implementation FMFLocation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_age, 0);
  objc_storeStrong((id *)&self->_distanceDescription, 0);
  objc_storeStrong((id *)&self->_shortAddressString, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_longAddress, 0);
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_placemark, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_largeAnnotationIcon, 0);
  objc_storeStrong((id *)&self->_largeOverlayIcon, 0);
  objc_storeStrong((id *)&self->_smallOverlayIcon, 0);
  objc_storeStrong((id *)&self->_smallAnnotationIcon, 0);
  objc_storeStrong((id *)&self->_overlay, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

- (BOOL)isMoreRecentThan:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;

  v4 = a3;
  v5 = v4;
  if (v4
    && (objc_msgSend(v4, "timestamp"), v6 = (void *)objc_claimAutoreleasedReturnValue(), v6, v6)
    && (-[FMFLocation timestamp](self, "timestamp"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
    -[FMFLocation timestamp](self, "timestamp");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timestamp");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "compare:", v9) != -1;

  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (void)updateLocationForCache:(id)a3
{
  FMFLocation *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[FMFLocation _updateLocation:](v4, "_updateLocation:", v5);
  objc_sync_exit(v4);

}

- (FMFLocation)initWithDictionary:(id)a3 forHandle:(id)a4 maxLocatingInterval:(double)a5 TTL:(double)a6
{
  id v10;
  id v11;
  FMFLocation *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  id v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  unint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  FMFPlacemark *v81;
  void *v83;
  FMFLocation *v84;
  FMFLocation *v85;
  char v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;

  v10 = a3;
  v11 = a4;
  v12 = (FMFLocation *)objc_alloc_init((Class)objc_opt_class());
  -[FMFLocation setHandle:](v12, "setHandle:", v11);

  -[FMFLocation setMaxLocatingInterval:](v12, "setMaxLocatingInterval:", a5);
  -[FMFLocation setTTL:](v12, "setTTL:", a6);
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("location"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v13 == (void *)v14)
  {

    goto LABEL_6;
  }
  v15 = (void *)v14;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("location"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
LABEL_6:
    -[FMFLocation setLocation:](v12, "setLocation:", 0);
    goto LABEL_61;
  }
  objc_msgSend(v16, "objectForKey:", CFSTR("timestamp"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)MEMORY[0x1E0C99D68];
  v87 = v17;
  objc_msgSend(v17, "doubleValue");
  objc_msgSend(v18, "dateWithTimeIntervalSince1970:", v19 / 1000.0);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFLocation setTimestamp:](v12, "setTimestamp:");
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("latitude"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20 == v21)
  {
    v22 = 0;
  }
  else
  {
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("latitude"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("longitude"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23 == v24)
  {
    v94 = 0;
  }
  else
  {
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("longitude"));
    v94 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("horizontalAccuracy"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25 == v26)
  {
    v27 = 0;
  }
  else
  {
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("horizontalAccuracy"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v28 = (void *)MEMORY[0x1E0CB37E8];
  v29 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("timestamp"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "doubleValue");
  objc_msgSend(v29, "dateWithTimeIntervalSince1970:", v31 / 1000.0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "timeIntervalSinceReferenceDate");
  objc_msgSend(v28, "numberWithDouble:");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "doubleValue");
  v35 = v34;
  objc_msgSend(v94, "doubleValue");
  v37 = v36;
  -[FMFLocation setLocationType:](v12, "setLocationType:", 0);
  v38 = objc_alloc(MEMORY[0x1E0C9E3B8]);
  v93 = v27;
  objc_msgSend(v27, "doubleValue");
  v40 = v39;
  v41 = (void *)MEMORY[0x1E0C99D68];
  v91 = v33;
  objc_msgSend(v33, "doubleValue");
  objc_msgSend(v41, "dateWithTimeIntervalSinceReferenceDate:");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = (void *)objc_msgSend(v38, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:course:speed:timestamp:", v42, v35, v37, 0.0, v40, 0.0, -1.0, 0.0);
  -[FMFLocation setLocation:](v12, "setLocation:", v43);

  -[FMFLocation setActivityState:](v12, "setActivityState:", 0);
  -[FMFLocation location](v12, "location");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "coordinate");
  -[FMFLocation setCoordinate:](v12, "setCoordinate:");

  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("address"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0x1E0C99000uLL;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v47 = objc_claimAutoreleasedReturnValue();
  v88 = v22;
  if (v45 == (void *)v47)
  {

    v53 = 0;
    v54 = 0;
    v49 = 0;
LABEL_20:
    v86 = 1;
    goto LABEL_21;
  }
  v48 = (void *)v47;
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("address"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v49)
  {
    v53 = 0;
    v54 = 0;
    goto LABEL_20;
  }
  objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("locality"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  if (v50 == v51)
  {
    v52 = 0;
  }
  else
  {
    objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("locality"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("stateCode"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  if (v55 == v56)
  {
    v54 = 0;
  }
  else
  {
    objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("stateCode"));
    v54 = objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("administrativeArea"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = self;
  if (v57 == v58)
  {
    v89 = 0;
  }
  else
  {
    objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("administrativeArea"));
    v89 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("formattedAddressLines"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  if (v59 == v60)
  {
    v53 = 0;
  }
  else
  {
    objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("formattedAddressLines"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v52 && v54)
  {
    v61 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "localizedStringForKey:value:table:", CFSTR("CITY_STATE_LABEL"), &stru_1EA4F34A0, 0);
    v63 = v54;
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "stringWithFormat:", v64, v52, v63);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMFLocation setShortAddressString:](v12, "setShortAddressString:", v65);

    v54 = v63;
    v46 = 0x1E0C99000;

    v86 = 0;
    self = v84;
    goto LABEL_40;
  }
  self = v84;
  if (!v52)
  {
    if (v89)
    {
      -[FMFLocation setShortAddressString:](v12, "setShortAddressString:", v89);

      goto LABEL_39;
    }
    v86 = 0;
LABEL_21:
    -[FMFLocation setShortAddressString:](v12, "setShortAddressString:", v54);
    goto LABEL_40;
  }
  -[FMFLocation setShortAddressString:](v12, "setShortAddressString:", v52);

LABEL_39:
  v86 = 0;
LABEL_40:
  v90 = (void *)v54;
  if (v53)
  {
    objc_msgSend(v53, "componentsJoinedByString:", CFSTR("\n"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMFLocation setLongAddress:](v12, "setLongAddress:", v66);

  }
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("labels"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v46 + 3640), "null");
  v68 = objc_claimAutoreleasedReturnValue();
  if (v67 == (void *)v68)
  {

    v70 = 0;
    goto LABEL_50;
  }
  v69 = (void *)v68;
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("labels"));
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v70)
  {
LABEL_50:
    v76 = v87;
    v80 = v88;
    goto LABEL_51;
  }
  if (objc_msgSend(v70, "count"))
  {
    v85 = self;
    objc_msgSend(v70, "firstObject");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("label"));
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v46 + 3640), "null");
    v73 = objc_claimAutoreleasedReturnValue();
    if (v72 == (void *)v73)
    {

      v76 = v87;
      v77 = v93;
    }
    else
    {
      v74 = (void *)v73;
      objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("label"));
      v75 = objc_claimAutoreleasedReturnValue();

      v72 = (void *)v75;
      v76 = v87;
      v77 = v93;
      if (!v72)
      {
LABEL_57:

        self = v85;
        v80 = v88;
        goto LABEL_58;
      }
      if (+[FMFLabelUtil isDefaultLabel:](FMFLabelUtil, "isDefaultLabel:", v72))
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "localizedStringForKey:value:table:", v72, &stru_1EA4F34A0, 0);
        v83 = v72;
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        -[FMFLocation setLabel:](v12, "setLabel:", v79);

        v77 = v93;
        v72 = v83;
      }
      else
      {
        -[FMFLocation setLabel:](v12, "setLabel:", v72);
      }
    }

    goto LABEL_57;
  }
  v76 = v87;
  v80 = v88;
  if (!objc_msgSend(v70, "count"))
    -[FMFLocation setLabel:](v12, "setLabel:", 0);
LABEL_51:
  v77 = v93;
LABEL_58:
  if ((v86 & 1) == 0)
  {
    v81 = -[FMFPlacemark initWithDictionary:]([FMFPlacemark alloc], "initWithDictionary:", v49);
    -[FMFLocation setPlacemark:](v12, "setPlacemark:", v81);

    v77 = v93;
  }

LABEL_61:
  return v12;
}

- (void)_updateLocation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  objc_msgSend(v4, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFLocation setLocation:](self, "setLocation:", v5);

  -[FMFLocation setLocationType:](self, "setLocationType:", objc_msgSend(v4, "locationType"));
  objc_msgSend(v4, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFLocation setLabel:](self, "setLabel:", v6);

  objc_msgSend(v4, "shortAddressString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFLocation setShortAddressString:](self, "setShortAddressString:", v7);

  objc_msgSend(v4, "longAddress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFLocation setLongAddress:](self, "setLongAddress:", v8);

  objc_msgSend(v4, "timestamp");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFLocation setTimestamp:](self, "setTimestamp:", v9);

  -[FMFLocation setLocatingInProgress:](self, "setLocatingInProgress:", objc_msgSend(v4, "isLocatingInProgress"));
  objc_msgSend(v4, "placemark");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[FMFLocation setPlacemark:](self, "setPlacemark:", v10);
}

- (FMFLocation)initWithCoder:(id)a3
{
  id v4;
  FMFLocation *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  CLLocationDegrees v19;
  double v20;
  CLLocationDegrees v21;
  CLLocationCoordinate2D v22;

  v4 = a3;
  v5 = (FMFLocation *)objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("handle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFLocation setHandle:](v5, "setHandle:", v6);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("placemark"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFLocation setPlacemark:](v5, "setPlacemark:", v7);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("locationType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFLocation setLocationType:](v5, "setLocationType:", objc_msgSend(v8, "integerValue"));

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("location"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFLocation setLocation:](v5, "setLocation:", v9);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("activityState"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFLocation setActivityState:](v5, "setActivityState:", objc_msgSend(v10, "integerValue"));

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("label"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFLocation setLabel:](v5, "setLabel:", v11);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shortAddressString"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFLocation setShortAddressString:](v5, "setShortAddressString:", v12);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("longAddress"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFLocation setLongAddress:](v5, "setLongAddress:", v13);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timestamp"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFLocation setTimestamp:](v5, "setTimestamp:", v14);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isLocatingInProgress"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFLocation setLocatingInProgress:](v5, "setLocatingInProgress:", objc_msgSend(v15, "BOOLValue"));

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("maxLocatingInterval"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "doubleValue");
  -[FMFLocation setMaxLocatingInterval:](v5, "setMaxLocatingInterval:");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TTL"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "doubleValue");
  -[FMFLocation setTTL:](v5, "setTTL:");

  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("latitude"));
  v19 = v18;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("longitude"));
  v21 = v20;

  v22 = CLLocationCoordinate2DMake(v19, v21);
  -[FMFLocation setCoordinate:](v5, "setCoordinate:", v22.latitude, v22.longitude);

  return v5;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (void)setLocatingInProgress:(BOOL)a3
{
  int v3;
  int locatingInProgress;
  id v7;

  v3 = a3;
  locatingInProgress = self->_locatingInProgress;
  if (locatingInProgress != a3 && a3)
    -[FMFLocation resetLocateInProgressTimer](self, "resetLocateInProgressTimer");
  self->_locatingInProgress = v3;
  if (locatingInProgress != v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postNotificationName:object:", CFSTR("locatingInProgressChanged"), self);

  }
}

- (void)setTimestamp:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void)setShortAddressString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (void)setPlacemark:(id)a3
{
  objc_storeStrong((id *)&self->_placemark, a3);
}

- (void)setLongAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void)setLocationType:(int64_t)a3
{
  self->_locationType = a3;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (void)setTTL:(double)a3
{
  self->_TTL = a3;
}

- (void)setMaxLocatingInterval:(double)a3
{
  self->_maxLocatingInterval = a3;
}

- (void)setHandle:(id)a3
{
  objc_storeStrong((id *)&self->_handle, a3);
}

- (void)setCoordinate:(CLLocationCoordinate2D)a3
{
  self->_coordinate = a3;
}

- (void)setActivityState:(int64_t)a3
{
  self->_activityState = a3;
}

- (void)encodeWithCoder:(id)a3
{
  FMFLocation *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  id v20;

  v20 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[FMFLocation handle](v4, "handle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", v5, CFSTR("handle"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[FMFLocation locationType](v4, "locationType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", v6, CFSTR("locationType"));

  -[FMFLocation location](v4, "location");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", v7, CFSTR("location"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[FMFLocation activityState](v4, "activityState"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", v8, CFSTR("activityState"));

  -[FMFLocation label](v4, "label");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", v9, CFSTR("label"));

  -[FMFLocation shortAddressString](v4, "shortAddressString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", v10, CFSTR("shortAddressString"));

  -[FMFLocation longAddress](v4, "longAddress");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", v11, CFSTR("longAddress"));

  -[FMFLocation timestamp](v4, "timestamp");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", v12, CFSTR("timestamp"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[FMFLocation isLocatingInProgress](v4, "isLocatingInProgress"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", v13, CFSTR("isLocatingInProgress"));

  v14 = (void *)MEMORY[0x1E0CB37E8];
  -[FMFLocation maxLocatingInterval](v4, "maxLocatingInterval");
  objc_msgSend(v14, "numberWithDouble:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", v15, CFSTR("maxLocatingInterval"));

  v16 = (void *)MEMORY[0x1E0CB37E8];
  -[FMFLocation TTL](v4, "TTL");
  objc_msgSend(v16, "numberWithDouble:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", v17, CFSTR("TTL"));

  -[FMFLocation coordinate](v4, "coordinate");
  objc_msgSend(v20, "encodeDouble:forKey:", CFSTR("latitude"));
  -[FMFLocation coordinate](v4, "coordinate");
  objc_msgSend(v20, "encodeDouble:forKey:", CFSTR("longitude"), v18);
  -[FMFLocation placemark](v4, "placemark");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", v19, CFSTR("placemark"));

  objc_sync_exit(v4);
}

- (BOOL)isLocatingInProgress
{
  return self->_locatingInProgress;
}

- (CLLocation)location
{
  return self->_location;
}

- (CLLocationCoordinate2D)coordinate
{
  double latitude;
  double longitude;
  CLLocationCoordinate2D result;

  latitude = self->_coordinate.latitude;
  longitude = self->_coordinate.longitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (double)maxLocatingInterval
{
  return self->_maxLocatingInterval;
}

- (NSString)shortAddressString
{
  return self->_shortAddressString;
}

- (FMFPlacemark)placemark
{
  return self->_placemark;
}

- (NSString)longAddress
{
  return self->_longAddress;
}

- (int64_t)locationType
{
  return self->_locationType;
}

- (NSString)label
{
  return self->_label;
}

- (BOOL)isValid
{
  uint64_t v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;

  -[FMFLocation timestamp](self, "timestamp");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    return 1;
  v4 = (void *)v3;
  -[FMFLocation TTL](self, "TTL");
  v6 = v5;

  if (v6 <= 0.0)
    return 1;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFLocation timestamp](self, "timestamp");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceDate:", v8);
  v10 = v9;

  -[FMFLocation TTL](self, "TTL");
  return v10 < v11;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (int64_t)activityState
{
  return self->_activityState;
}

- (double)TTL
{
  return self->_TTL;
}

- (void)resetLocateInProgressTimer
{
  double v3;
  double v4;
  NSObject *v5;
  void *v6;
  dispatch_time_t v7;
  _QWORD block[4];
  id v9;
  uint8_t buf[4];
  double v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  FMFLocation *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[FMFLocation maxLocatingInterval](self, "maxLocatingInterval");
  if (v3 > 0.0)
  {
    v4 = v3;
    LogCategory_Daemon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[FMFLocation handle](self, "handle");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v11 = v4;
      v12 = 2112;
      v13 = v6;
      v14 = 2112;
      v15 = self;
      _os_log_impl(&dword_1DC81B000, v5, OS_LOG_TYPE_DEFAULT, "resetLocateInProgressTimerForSeconds: %f forHandle: %@ location: %@", buf, 0x20u);

    }
    objc_initWeak((id *)buf, self);
    v7 = dispatch_time(0, (uint64_t)(v4 * 1000000000.0));
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __41__FMFLocation_resetLocateInProgressTimer__block_invoke;
    block[3] = &unk_1EA4F2A28;
    objc_copyWeak(&v9, (id *)buf);
    dispatch_after(v7, MEMORY[0x1E0C80D38], block);
    objc_destroyWeak(&v9);
    objc_destroyWeak((id *)buf);
  }
}

- (unint64_t)hash
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[FMFLocation handle](self, "handle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "serverId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[FMFLocation handle](self, "handle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "serverId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "serverId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "isEqualToString:", v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (FMFHandle)handle
{
  return self->_handle;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)conformsToProtocol:(id)a3
{
  Protocol *v4;
  void *v5;
  BOOL v6;
  objc_super v8;

  v4 = (Protocol *)a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", protocol_getName(v4));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("MKAnnotation")) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)FMFLocation;
    v6 = -[FMFLocation conformsToProtocol:](&v8, sel_conformsToProtocol_, v4);
  }

  return v6;
}

- (FMFLocation)initWithLatitude:(double)a3 longitude:(double)a4
{
  FMFLocation *v7;
  void *v8;

  v7 = (FMFLocation *)objc_alloc_init((Class)objc_opt_class());
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E3B8]), "initWithLatitude:longitude:", a3, a4);
  -[FMFLocation setLocationType:](v7, "setLocationType:", 0);
  -[FMFLocation setLocation:](v7, "setLocation:", v8);
  -[FMFLocation setActivityState:](v7, "setActivityState:", 0);
  objc_msgSend(v8, "coordinate");
  -[FMFLocation setCoordinate:](v7, "setCoordinate:");

  return v7;
}

- (FMFLocation)initWithHandle:(id)a3 locationType:(int64_t)a4 location:(id)a5 activityState:(int64_t)a6 label:(id)a7 locatingInProgress:(BOOL)a8 shortAddress:(id)a9 longAddress:(id)a10 placemark:(id)a11
{
  _BOOL8 v11;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  FMFLocation *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  id v30;

  v11 = a8;
  v30 = a11;
  v18 = a10;
  v19 = a9;
  v20 = a7;
  v21 = a5;
  v22 = a3;
  v23 = (FMFLocation *)objc_alloc_init((Class)objc_opt_class());
  -[FMFLocation setHandle:](v23, "setHandle:", v22);

  -[FMFLocation setLocationType:](v23, "setLocationType:", a4);
  -[FMFLocation setLocation:](v23, "setLocation:", v21);
  -[FMFLocation setActivityState:](v23, "setActivityState:", a6);
  -[FMFLocation setLabel:](v23, "setLabel:", v20);

  -[FMFLocation setLocatingInProgress:](v23, "setLocatingInProgress:", v11);
  -[FMFLocation setShortAddressString:](v23, "setShortAddressString:", v19);

  -[FMFLocation setLongAddress:](v23, "setLongAddress:", v18);
  objc_msgSend(v21, "timestamp");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFLocation setTimestamp:](v23, "setTimestamp:", v24);

  -[FMFLocation setMaxLocatingInterval:](v23, "setMaxLocatingInterval:", 3.40282347e38);
  -[FMFLocation setTTL:](v23, "setTTL:", 3.40282347e38);
  -[FMFLocation setDistance:](v23, "setDistance:", 3.40282347e38);
  -[FMFLocation setDistanceDescription:](v23, "setDistanceDescription:", 0);
  -[FMFLocation setAge:](v23, "setAge:", 0);
  objc_msgSend(v21, "coordinate");
  v26 = v25;
  v28 = v27;

  -[FMFLocation setCoordinate:](v23, "setCoordinate:", v26, v28);
  -[FMFLocation setPlacemark:](v23, "setPlacemark:", v30);

  return v23;
}

- (NSString)description
{
  FMFLocation *v2;
  void *v3;
  __CFString *v4;
  _BOOL4 v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  objc_class *v34;
  void *v35;
  void *v36;
  __CFString *v37;
  void *v38;
  void *v39;
  __CFString *v40;
  void *v41;
  void *v42;
  __CFString *v43;
  void *v44;
  void *v46;
  void *v47;
  void *v48;
  __CFString *v49;
  __CFString *v50;
  void *v51;
  void *v52;

  v2 = self;
  objc_sync_enter(v2);
  +[FMFLocationDateFormatter sharedInstance](FMFLocationDateFormatter, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFLocation handle](v2, "handle");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[FMFLocation locationType](v2, "locationType"))
  {
    if (-[FMFLocation locationType](v2, "locationType") == 2)
    {
      v4 = CFSTR("live");
    }
    else
    {
      v6 = -[FMFLocation locationType](v2, "locationType");
      v4 = CFSTR("shallow");
      if (v6 == 3)
        v4 = CFSTR("stewie");
    }
  }
  else
  {
    v5 = -[FMFLocation isLocatingInProgress](v2, "isLocatingInProgress");
    v4 = CFSTR("legacy");
    if (v5)
      v4 = CFSTR("legacy in progress");
  }
  v50 = v4;
  -[FMFLocation timestamp](v2, "timestamp");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v3;
  if (v7)
  {
    -[FMFLocation timestamp](v2, "timestamp");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringFromDate:", v8);
    v49 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v49 = &stru_1EA4F34A0;
  }

  v9 = (void *)0x1E0CB3000;
  v10 = (void *)MEMORY[0x1E0CB3940];
  -[FMFLocation coordinate](v2, "coordinate");
  v12 = v11;
  -[FMFLocation coordinate](v2, "coordinate");
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%01.6lf°,%01.6lf°"), v12, v13);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFLocation location](v2, "location");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "coordinate");
  v16 = v15;
  -[FMFLocation coordinate](v2, "coordinate");
  if (v16 != v17)
  {

    goto LABEL_16;
  }
  -[FMFLocation location](v2, "location");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "coordinate");
  v20 = v19;
  -[FMFLocation coordinate](v2, "coordinate");
  v22 = v21;

  if (v20 != v22)
  {
LABEL_16:
    v23 = (void *)MEMORY[0x1E0CB3940];
    -[FMFLocation coordinate](v2, "coordinate");
    v25 = v24;
    -[FMFLocation coordinate](v2, "coordinate");
    v27 = v26;
    -[FMFLocation location](v2, "location");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "coordinate");
    v30 = v29;
    -[FMFLocation location](v2, "location");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "coordinate");
    objc_msgSend(v23, "stringWithFormat:", CFSTR("%01.6lf°,%01.6lf°/%01.6lf°,%01.6lf°"), v25, v27, v30, v31);
    v32 = objc_claimAutoreleasedReturnValue();

    v52 = (void *)v32;
  }
  v33 = (void *)MEMORY[0x1E0CB3940];
  v34 = (objc_class *)objc_opt_class();
  NSStringFromClass(v34);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFLocation label](v2, "label");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v35)
  {
    v36 = (void *)MEMORY[0x1E0CB3940];
    -[FMFLocation label](v2, "label");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "stringWithFormat:", CFSTR(" - labl: '%@'"), v46);
    v37 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v37 = &stru_1EA4F34A0;
  }
  -[FMFLocation shortAddressString](v2, "shortAddressString");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    v39 = (void *)MEMORY[0x1E0CB3940];
    -[FMFLocation shortAddressString](v2, "shortAddressString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "stringWithFormat:", CFSTR(" - sadr: '%@'"), v3);
    v40 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v40 = &stru_1EA4F34A0;
  }
  -[FMFLocation longAddress](v2, "longAddress");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (v41)
  {
    v42 = (void *)MEMORY[0x1E0CB3940];
    -[FMFLocation longAddress](v2, "longAddress");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "stringWithFormat:", CFSTR(" - ladr: '%@'"), v9);
    v43 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v43 = &stru_1EA4F34A0;
  }
  objc_msgSend(v33, "stringWithFormat:", CFSTR("%@(0x%lx): %@ - %@: {%@@%@}%@%@%@"), v48, v2, v51, v50, v52, v49, v37, v40, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  if (v41)
  {

  }
  if (v38)
  {

  }
  if (v35)
  {

  }
  objc_sync_exit(v2);

  return (NSString *)v44;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = objc_alloc_init((Class)objc_opt_class());
  -[FMFLocation handle](self, "handle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHandle:", v5);

  objc_msgSend(v4, "setLocationType:", -[FMFLocation locationType](self, "locationType"));
  -[FMFLocation location](self, "location");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLocation:", v6);

  objc_msgSend(v4, "setActivityState:", -[FMFLocation activityState](self, "activityState"));
  -[FMFLocation label](self, "label");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLabel:", v7);

  -[FMFLocation shortAddressString](self, "shortAddressString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShortAddressString:", v8);

  -[FMFLocation longAddress](self, "longAddress");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLongAddress:", v9);

  -[FMFLocation timestamp](self, "timestamp");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTimestamp:", v10);

  objc_msgSend(v4, "setLocatingInProgress:", -[FMFLocation isLocatingInProgress](self, "isLocatingInProgress"));
  -[FMFLocation maxLocatingInterval](self, "maxLocatingInterval");
  objc_msgSend(v4, "setMaxLocatingInterval:");
  -[FMFLocation TTL](self, "TTL");
  objc_msgSend(v4, "setTTL:");
  -[FMFLocation placemark](self, "placemark");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPlacemark:", v11);

  objc_msgSend(v4, "location");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "coordinate");
  objc_msgSend(v4, "setCoordinate:");

  return v4;
}

- (BOOL)hasKnownLocation
{
  return 1;
}

- (BOOL)isThisDevice
{
  return 0;
}

- (NSString)shortAddress
{
  FMFLocation *v2;
  void *v3;
  void *v4;

  v2 = self;
  objc_sync_enter(v2);
  -[FMFLocation label](v2, "label");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
    -[FMFLocation label](v2, "label");
  else
    -[FMFLocation shortAddressString](v2, "shortAddressString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return (NSString *)v4;
}

- (NSString)title
{
  void *v2;
  void *v3;

  -[FMFLocation handle](self, "handle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)locationAge
{
  FMFLocation *v2;
  void *v3;
  double v4;
  int v5;
  void *v6;
  uint64_t v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;

  v2 = self;
  objc_sync_enter(v2);
  -[FMFLocation timestamp](v2, "timestamp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceNow");
  if ((int)v4 >= 0)
    v5 = (int)v4;
  else
    v5 = -(int)v4;
  if (-[FMFLocation locationType](v2, "locationType") != 3)
  {
    if (-[FMFLocation locationType](v2, "locationType") == 2)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("LOCATION_AGE_LIVE"), &stru_1EA4F34A0, 0);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    v8 = (double)v5 / 60.0;
    if (v8 <= 0.5)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("LOCATION_AGE_NOW"), &stru_1EA4F34A0, 0);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    if (v8 < 1.0)
    {
      v15 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("LOCATION_AGE_LESS_THAN_30SECONDS"), &stru_1EA4F34A0, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "localizedStringWithFormat:", v10, &unk_1EA4FBF88);
      v16 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v8 < 60.0)
      {
        v9 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("LOCATION_AGE_MINUTES"), &stru_1EA4F34A0, 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", vcvtmd_u64_f64(v8));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "localizedStringWithFormat:", v10, v11);
        v12 = objc_claimAutoreleasedReturnValue();
LABEL_20:
        v13 = (void *)v12;

        goto LABEL_21;
      }
      if (v8 >= 120.0)
      {
        v18 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("LOCATION_AGE_MORE_THAN_1HR"), &stru_1EA4F34A0, 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", vcvtmd_u64_f64(v8 / 60.0));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "localizedStringWithFormat:", v10, v11);
        v12 = objc_claimAutoreleasedReturnValue();
        goto LABEL_20;
      }
      v17 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("LOCATION_AGE_LESS_THAN_1HR"), &stru_1EA4F34A0, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "localizedStringWithFormat:", v10, &unk_1EA4FBFA0);
      v16 = objc_claimAutoreleasedReturnValue();
    }
    v13 = (void *)v16;
LABEL_21:

    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("LOCATION_AGE_STEWIE"), &stru_1EA4F34A0, CFSTR("Localizable-STEWIE"));
  v7 = objc_claimAutoreleasedReturnValue();
LABEL_13:
  v13 = (void *)v7;
LABEL_14:

  objc_sync_exit(v2);
  return v13;
}

- (id)locationShortAddressWithAge
{
  FMFLocation *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v2 = self;
  objc_sync_enter(v2);
  -[FMFLocation shortAddress](v2, "shortAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFLocation locationAge](v2, "locationAge");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length") && objc_msgSend(v4, "length"))
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("LOCATION_LABEL_WITH_AGE"), &stru_1EA4F34A0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", v7, v3, v4);
    v8 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v8;
  }

  objc_sync_exit(v2);
  return v3;
}

- (id)locationShortAddressWithAgeIncludeLocating
{
  FMFLocation *v2;
  void *v3;
  id v4;
  void *v5;
  void *v7;
  void *v8;

  v2 = self;
  objc_sync_enter(v2);
  if (-[FMFLocation isLocatingInProgress](v2, "isLocatingInProgress"))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("LOCATING"), &stru_1EA4F34A0, 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v5 = v4;
    goto LABEL_6;
  }
  -[FMFLocation locationShortAddressWithAge](v2, "locationShortAddressWithAge");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    v4 = v3;
    v3 = v4;
    goto LABEL_5;
  }
  -[FMFLocation location](v2, "location");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("ADDRESS_UNAVAILABLE"), &stru_1EA4F34A0, 0);
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("LOCATION_NOT_AVAILABLE"), &stru_1EA4F34A0, 0);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  objc_sync_exit(v2);

  return v5;
}

- (void)resetLocateInProgress:(id)a3
{
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  LogCategory_Daemon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[FMFLocation handle](self, "handle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_1DC81B000, v4, OS_LOG_TYPE_DEFAULT, "resetLocateInProgress_fired: %@", (uint8_t *)&v6, 0xCu);

  }
  -[FMFLocation setLocatingInProgress:](self, "setLocatingInProgress:", 0);
}

void __41__FMFLocation_resetLocateInProgressTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "resetLocateInProgress:", 0);

}

- (int64_t)distanceThenNameCompare:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  int64_t v16;
  double v17;
  double v18;
  void *v19;
  void *v20;

  v4 = a3;
  -[FMFLocation distance](self, "distance");
  if (v5 <= 0.0 || (objc_msgSend(v4, "distance"), v6 <= 0.0))
  {
    -[FMFLocation distance](self, "distance");
    if (v17 <= 0.0)
    {
      objc_msgSend(v4, "distance");
      if (v18 <= 0.0)
        goto LABEL_11;
LABEL_10:
      v16 = 1;
      goto LABEL_12;
    }
LABEL_8:
    v16 = -1;
    goto LABEL_12;
  }
  -[FMFLocation distance](self, "distance");
  v8 = v7;
  objc_msgSend(v4, "distance");
  if (v8 < v9)
    goto LABEL_8;
  -[FMFLocation distance](self, "distance");
  v11 = v10;
  objc_msgSend(v4, "distance");
  if (v11 > v12)
    goto LABEL_10;
  -[FMFLocation distance](self, "distance");
  v14 = v13;
  objc_msgSend(v4, "distance");
  if (v14 != v15)
  {
LABEL_11:
    -[FMFLocation handle](self, "handle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handle");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v19, "prettyNameCompare:", v20);

    goto LABEL_12;
  }
  v16 = 0;
LABEL_12:

  return v16;
}

- (void)updateLocation:(id)a3
{
  FMFLocation *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[FMFLocation _updateLocation:](v4, "_updateLocation:", v5);
  -[CLLocation coordinate](v4->_location, "coordinate");
  -[FMFLocation setCoordinate:](v4, "setCoordinate:");
  objc_sync_exit(v4);

}

- (void)updateHandle:(id)a3
{
  FMFLocation *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[FMFLocation setHandle:](v4, "setHandle:", v5);
  objc_sync_exit(v4);

}

- (FMAccuracyOverlay)overlay
{
  return self->_overlay;
}

- (void)setOverlay:(id)a3
{
  objc_storeStrong((id *)&self->_overlay, a3);
}

- (double)horizontalAccuracy
{
  return self->_horizontalAccuracy;
}

- (void)setHorizontalAccuracy:(double)a3
{
  self->_horizontalAccuracy = a3;
}

- (UIImage)smallAnnotationIcon
{
  return self->_smallAnnotationIcon;
}

- (void)setSmallAnnotationIcon:(id)a3
{
  objc_storeStrong((id *)&self->_smallAnnotationIcon, a3);
}

- (UIImage)smallOverlayIcon
{
  return self->_smallOverlayIcon;
}

- (void)setSmallOverlayIcon:(id)a3
{
  objc_storeStrong((id *)&self->_smallOverlayIcon, a3);
}

- (UIImage)largeOverlayIcon
{
  return self->_largeOverlayIcon;
}

- (void)setLargeOverlayIcon:(id)a3
{
  objc_storeStrong((id *)&self->_largeOverlayIcon, a3);
}

- (UIImage)largeAnnotationIcon
{
  return self->_largeAnnotationIcon;
}

- (void)setLargeAnnotationIcon:(id)a3
{
  objc_storeStrong((id *)&self->_largeAnnotationIcon, a3);
}

- (double)distanceFromUser
{
  return self->_distanceFromUser;
}

- (void)setDistanceFromUser:(double)a3
{
  self->_distanceFromUser = a3;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_tintColor, a3);
}

- (BOOL)isBorderEnabled
{
  return self->_isBorderEnabled;
}

- (void)setIsBorderEnabled:(BOOL)a3
{
  self->_isBorderEnabled = a3;
}

- (double)distance
{
  return self->_distance;
}

- (void)setDistance:(double)a3
{
  self->_distance = a3;
}

- (NSString)distanceDescription
{
  return self->_distanceDescription;
}

- (void)setDistanceDescription:(id)a3
{
  objc_storeStrong((id *)&self->_distanceDescription, a3);
}

- (NSString)age
{
  return self->_age;
}

- (void)setAge:(id)a3
{
  objc_storeStrong((id *)&self->_age, a3);
}

@end
