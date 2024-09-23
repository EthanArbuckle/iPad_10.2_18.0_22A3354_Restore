@implementation GEOLocation(MNExtras)

- (id)initWithCLLocation:()MNExtras useMatchInfo:
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  double v27;
  id v28;
  double v29;
  double v30;
  unsigned int v31;
  uint64_t v32;
  void *v33;
  void *v34;
  int v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  id v50[40];
  objc_super v51;
  uint8_t buf[4];
  id v53;
  uint64_t v54;
  CLLocationCoordinate2D v55;

  v54 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v51.receiver = a1;
  v51.super_class = (Class)&off_1EEEF1AB0;
  v7 = objc_msgSendSuper2(&v51, sel_init);
  if (v7)
  {
    if (v6)
    {
      objc_msgSend(v6, "rawCoordinate");
      v9 = v8;
      v11 = v10;
      if (objc_msgSend(MEMORY[0x1E0D27178], "isLocationShiftRequiredForCoordinate:"))
      {
        objc_msgSend(v6, "_navigation_rawShiftedCoordinate");
        if (CLLocationCoordinate2DIsValid(v55))
        {
          objc_msgSend(v6, "_navigation_rawShiftedCoordinate");
          if (v12 != 0.0 || (objc_msgSend(v6, "_navigation_rawShiftedCoordinate"), v13 != 0.0))
          {
            objc_msgSend(v6, "_navigation_rawShiftedCoordinate");
            v9 = v14;
            v11 = v15;
          }
        }
      }
      v16 = v11;
      v17 = v9;
      if (a4)
      {
        objc_msgSend(v6, "coordinate");
        v17 = v18;
        v16 = v19;
      }
      if (v16 >= -180.0 && v16 <= 180.0 && v17 >= -90.0 && v17 <= 90.0)
      {
        v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D27140]), "initWithCoordinate:", v17, v16);
        objc_msgSend(v7, "setLatLng:", v20);

        v21 = objc_msgSend(v6, "_navigation_gtLog");
        objc_msgSend(v7, "latLng");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setGtLog:", v21);

      }
      if (v11 >= -180.0 && v11 <= 180.0 && v9 >= -90.0 && v9 <= 90.0)
      {
        v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D27140]), "initWithCoordinate:", v9, v11);
        objc_msgSend(v7, "setRawCoordinate:", v23);

        v24 = objc_msgSend(v6, "_navigation_gtLog");
        objc_msgSend(v7, "rawCoordinate");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setGtLog:", v24);

      }
      objc_msgSend(v6, "timestamp");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "timeIntervalSinceReferenceDate");
      objc_msgSend(v7, "setTimestamp:");

      objc_msgSend(v6, "altitude");
      objc_msgSend(v7, "setAltitude:", (int)v27);
      objc_msgSend(v6, "horizontalAccuracy");
      objc_msgSend(v7, "setHorizontalAccuracy:");
      objc_msgSend(v6, "verticalAccuracy");
      objc_msgSend(v7, "setVerticalAccuracy:");
      if (a4)
      {
        objc_msgSend(v6, "course");
      }
      else
      {
        objc_msgSend(v6, "clientLocation");
        v28 = v50[35];
      }
      objc_msgSend(v7, "setCourse:", *(double *)&v28);
      objc_msgSend(v6, "clientLocation");
      objc_msgSend(v7, "setRawCourse:", *(double *)((char *)&v50[15] + 4));
      objc_msgSend(v6, "courseAccuracy");
      objc_msgSend(v7, "setCourseAccuracy:");
      objc_msgSend(v6, "speed");
      if (v29 >= 0.0)
      {
        objc_msgSend(v6, "speed");
        objc_msgSend(v7, "setSpeed:");
      }
      objc_msgSend(v6, "_navigation_speedAccuracy");
      if (v30 >= 0.0)
      {
        objc_msgSend(v6, "_navigation_speedAccuracy");
        objc_msgSend(v7, "setSpeedAccuracy:");
      }
      v31 = objc_msgSend(v6, "type") - 1;
      if (v31 <= 0xA && ((0x5EFu >> v31) & 1) != 0)
        objc_msgSend(v7, "setType:", dword_1B0BF3018[v31]);
      if (a4)
        v32 = objc_msgSend(v6, "_navigation_hasMatch");
      else
        v32 = 0;
      objc_msgSend(v7, "setIsMatchedLocation:", v32);
      objc_msgSend(v6, "matchInfo");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if (v33)
      {
        objc_msgSend(v6, "matchInfo");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setIsShifted:", objc_msgSend(v34, "isMatchShifted"));

      }
      else
      {
        objc_msgSend(v7, "setIsShifted:", 0);
      }

      v35 = objc_msgSend(v6, "referenceFrame");
      if (v35 == 1)
        v36 = 1;
      else
        v36 = 2 * (v35 == 2);
      objc_msgSend(v7, "setReferenceFrame:", v36);
      objc_msgSend(v6, "matchInfo");
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      if (v37)
      {
        objc_msgSend(v6, "matchInfo");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setFormOfWay:", objc_msgSend(v38, "matchFormOfWay"));

        objc_msgSend(v6, "matchInfo");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setRoadClass:", objc_msgSend(v39, "matchRoadClass"));

        objc_msgSend(v6, "matchInfo");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v40, "matchQuality");

        if ((unint64_t)(v41 - 1) <= 2)
          objc_msgSend(v7, "setMatchQuality:");
      }
      objc_msgSend(v6, "coarseMetaData");
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      if (v42)
      {
        v43 = (void *)MEMORY[0x1E0CB3710];
        v44 = objc_opt_class();
        objc_msgSend(v6, "coarseMetaData");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v50[0] = 0;
        objc_msgSend(v43, "unarchivedObjectOfClass:fromData:error:", v44, v45, v50);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = v50[0];

        if (v46)
        {
          objc_msgSend(v7, "setCoarseMetadata:", v46);
        }
        else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v53 = v47;
          _os_log_impl(&dword_1B0AD7000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to decode coarse location metadata: %{public}@", buf, 0xCu);
        }

      }
    }
    v48 = v7;
  }

  return v7;
}

- (uint64_t)initWithCLLocation:()MNExtras
{
  return objc_msgSend(a1, "initWithCLLocation:useMatchInfo:", a3, 1);
}

- (void)initWithCLLocation:()MNExtras course:
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_msgSend(a1, "initWithCLLocation:");
  v4 = v3;
  if (v3)
  {
    if (a2 >= 0.0)
      objc_msgSend(v3, "setCourse:", a2);
    else
      objc_msgSend(v3, "setHasCourse:", 0);
    v5 = v4;
  }

  return v4;
}

- (uint64_t)clientLocation
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  int v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t result;
  int v23;

  *(_OWORD *)(a2 + 140) = 0u;
  *(_OWORD *)(a2 + 112) = 0u;
  *(_OWORD *)(a2 + 128) = 0u;
  *(_OWORD *)(a2 + 80) = 0u;
  *(_OWORD *)(a2 + 96) = 0u;
  *(_OWORD *)(a2 + 48) = 0u;
  *(_OWORD *)(a2 + 64) = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)a2 = 0u;
  objc_msgSend(a1, "timestamp");
  *(_QWORD *)(a2 + 76) = v4;
  objc_msgSend(a1, "latLng");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lat");
  *(_QWORD *)(a2 + 4) = v6;

  objc_msgSend(a1, "latLng");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lng");
  *(_QWORD *)(a2 + 12) = v8;

  objc_msgSend(a1, "horizontalAccuracy");
  *(_QWORD *)(a2 + 20) = v9;
  *(double *)(a2 + 28) = (double)(int)objc_msgSend(a1, "altitude");
  objc_msgSend(a1, "verticalAccuracy");
  *(_QWORD *)(a2 + 36) = v10;
  objc_msgSend(a1, "speed");
  *(_QWORD *)(a2 + 44) = v11;
  objc_msgSend(a1, "speedAccuracy");
  *(_QWORD *)(a2 + 52) = v12;
  objc_msgSend(a1, "course");
  *(_QWORD *)(a2 + 60) = v13;
  objc_msgSend(a1, "courseAccuracy");
  *(_QWORD *)(a2 + 68) = v14;
  v15 = objc_msgSend(a1, "type") - 1;
  if (v15 > 2)
    v16 = 0;
  else
    v16 = dword_1B0BF3044[v15];
  *(_DWORD *)(a2 + 96) = v16;
  objc_msgSend(a1, "rawCoordinate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "lat");
  *(_QWORD *)(a2 + 100) = v18;

  objc_msgSend(a1, "rawCoordinate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "lng");
  *(_QWORD *)(a2 + 108) = v20;

  objc_msgSend(a1, "rawCourse");
  *(_QWORD *)(a2 + 116) = v21;
  *(_DWORD *)(a2 + 84) = 0;
  *(_QWORD *)(a2 + 88) = 0xBFF0000000000000;
  *(_DWORD *)a2 = 0xFFFF;
  result = objc_msgSend(a1, "referenceFrame");
  v23 = 2 * ((_DWORD)result == 2);
  if ((_DWORD)result == 1)
    v23 = 1;
  *(_DWORD *)(a2 + 132) = v23;
  return result;
}

+ (id)locationWithCLLocation:()MNExtras course:
{
  objc_class *v5;
  id v6;
  void *v7;

  v5 = (objc_class *)MEMORY[0x1E0D27168];
  v6 = a4;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithCLLocation:course:", v6, a1);

  return v7;
}

@end
