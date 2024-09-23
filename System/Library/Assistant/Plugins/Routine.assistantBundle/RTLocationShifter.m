@implementation RTLocationShifter

- (RTLocationShifter)init
{
  RTLocationShifter *v2;
  uint64_t v3;
  GEOLocationShifter *geoLocationShifter;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RTLocationShifter;
  v2 = -[RTLocationShifter init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    geoLocationShifter = v2->_geoLocationShifter;
    v2->_geoLocationShifter = (GEOLocationShifter *)v3;

  }
  return v2;
}

- (void)shiftLocation:(id)a3 handler:(id)a4
{
  id v6;
  void (**v7)(id, id, _QWORD);
  NSObject *v8;
  double v9;
  CLLocationDegrees v10;
  CLLocationDegrees v11;
  CLLocationCoordinate2D v12;
  double v13;
  double v14;
  _QWORD v15[4];
  id v16;
  void (**v17)(id, id, _QWORD);
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, id, _QWORD))a4;
  if (v7)
  {
    if (objc_msgSend(v6, "referenceFrame") == 2)
    {
      v7[2](v7, v6, 0);
    }
    else
    {
      objc_msgSend(v6, "latitude");
      v10 = v9;
      objc_msgSend(v6, "longitude");
      v12 = CLLocationCoordinate2DMake(v10, v11);
      objc_msgSend(v6, "horizontalUncertainty");
      v14 = v13;
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = sub_22793E158;
      v15[3] = &unk_24F00BF40;
      v16 = v6;
      v17 = v7;
      -[RTLocationShifter shiftCoordinate:accuracy:handler:](self, "shiftCoordinate:accuracy:handler:", v15, v12.latitude, v12.longitude, v14);

    }
  }
  else
  {
    sub_22793DEC4(qword_255903508);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[RTLocationShifter shiftLocation:handler:]";
      v20 = 1024;
      v21 = 38;
      _os_log_error_impl(&dword_22793B000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
}

- (id)shiftedLocation:(id)a3 allowNetwork:(BOOL)a4 error:(id *)a5
{
  id v8;
  id v9;
  double v10;
  CLLocationDegrees v11;
  CLLocationDegrees v12;
  CLLocationCoordinate2D v13;
  dispatch_semaphore_t v14;
  double v15;
  double v16;
  NSObject *v17;
  dispatch_time_t v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  GEOLocationShifter *geoLocationShifter;
  double v28;
  id v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  NSObject *v37;
  id v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void (*v47)(uint64_t, void *, double, double, double);
  void *v48;
  NSObject *v49;
  double *v50;
  double *v51;
  __int128 *v52;
  double v53;
  double *v54;
  uint64_t v55;
  uint64_t v56;
  double v57;
  double *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint8_t buf[4];
  void *v64;
  uint64_t v65;
  const __CFString *v66;
  __int128 v67;
  uint64_t v68;
  uint64_t (*v69)(uint64_t, uint64_t);
  void (*v70)(uint64_t);
  id v71;
  uint64_t v72;
  _QWORD v73[2];

  v73[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  if (objc_msgSend(v8, "referenceFrame") == 2)
  {
    v9 = v8;
  }
  else if (a4)
  {
    objc_msgSend(v8, "latitude");
    v11 = v10;
    objc_msgSend(v8, "longitude");
    v13 = CLLocationCoordinate2DMake(v11, v12);
    v57 = 0.0;
    *(double *)&v58 = COERCE_DOUBLE(&v57);
    v59 = 0x3010000000;
    v61 = 0;
    v62 = 0;
    v60 = &unk_22793F37B;
    v53 = 0.0;
    v54 = &v53;
    v55 = 0x2020000000;
    v56 = 0;
    *(_QWORD *)&v67 = 0;
    *((_QWORD *)&v67 + 1) = &v67;
    v68 = 0x3032000000;
    v69 = sub_22793E75C;
    v70 = sub_22793E76C;
    v71 = 0;
    v14 = dispatch_semaphore_create(0);
    objc_msgSend(v8, "horizontalUncertainty");
    v16 = v15;
    v45 = MEMORY[0x24BDAC760];
    v46 = 3221225472;
    v47 = sub_22793E774;
    v48 = &unk_24F00BF68;
    v50 = &v57;
    v51 = &v53;
    v52 = &v67;
    v17 = v14;
    v49 = v17;
    -[RTLocationShifter shiftCoordinate:accuracy:handler:](self, "shiftCoordinate:accuracy:handler:", &v45, v13.latitude, v13.longitude, v16);
    v18 = dispatch_time(0, 300000000000);
    if (dispatch_semaphore_wait(v17, v18))
    {
      v19 = (void *)MEMORY[0x24BDD1540];
      v65 = *MEMORY[0x24BDD0FC8];
      v66 = CFSTR("Timed-out attempting to shift coordinate");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v66, &v65, 1, v45, v46, v47, v48);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "errorWithDomain:code:userInfo:", *MEMORY[0x24BE27EE8], 0, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      sub_22793DEC4(qword_255903508);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v21, "localizedDescription");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v64 = v44;
        _os_log_error_impl(&dword_22793B000, v22, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
      if (a5)
        *a5 = objc_retainAutorelease(v21);
      v9 = v8;

    }
    else
    {
      if (a5)
        *a5 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v67 + 1) + 40));
      if (*(_QWORD *)(*((_QWORD *)&v67 + 1) + 40))
      {
        v9 = v8;
      }
      else
      {
        v38 = objc_alloc(MEMORY[0x24BE27EB0]);
        v39 = v58[4];
        v40 = v58[5];
        v41 = v54[3];
        objc_msgSend(v8, "date", v45, v46, v47, v48);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (id)objc_msgSend(v38, "initWithLatitude:longitude:horizontalUncertainty:date:referenceFrame:", v42, 2, v39, v40, v41);

      }
    }

    _Block_object_dispose(&v67, 8);
    _Block_object_dispose(&v53, 8);
    _Block_object_dispose(&v57, 8);
  }
  else
  {
    v57 = 0.0;
    *(double *)&v58 = 0.0;
    v53 = 0.0;
    objc_msgSend(v8, "latitude");
    v24 = v23;
    objc_msgSend(v8, "longitude");
    v26 = v25;
    geoLocationShifter = self->_geoLocationShifter;
    objc_msgSend(v8, "horizontalUncertainty");
    if ((-[GEOLocationShifter shiftCoordinate:accuracy:shiftedCoordinate:shiftedAccuracy:](geoLocationShifter, "shiftCoordinate:accuracy:shiftedCoordinate:shiftedAccuracy:", &v57, &v53, v24, v26, v28) & 1) != 0)
    {
      v29 = objc_alloc(MEMORY[0x24BE27EB0]);
      v30 = v57;
      v31 = *(double *)&v58;
      v32 = v53;
      objc_msgSend(v8, "date");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (id)objc_msgSend(v29, "initWithLatitude:longitude:horizontalUncertainty:date:referenceFrame:", v33, 2, v30, v31, v32);
    }
    else
    {
      v35 = (void *)MEMORY[0x24BDD1540];
      v72 = *MEMORY[0x24BDD0FC8];
      v73[0] = CFSTR("Unable to shift without network allowed");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v73, &v72, 1);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "errorWithDomain:code:userInfo:", *MEMORY[0x24BE27EE8], 0, v36);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      sub_22793DEC4(qword_255903508);
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        LODWORD(v67) = 138412290;
        *(_QWORD *)((char *)&v67 + 4) = v33;
        _os_log_error_impl(&dword_22793B000, v37, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v67, 0xCu);
      }

      if (a5)
        *a5 = objc_retainAutorelease(v33);
      v34 = v8;
    }
    v9 = v34;

  }
  return v9;
}

- (void)shiftCoordinate:(CLLocationCoordinate2D)a3 accuracy:(double)a4 handler:(id)a5
{
  double longitude;
  double latitude;
  void (**v9)(id, _QWORD, double, double, double);
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  GEOLocationShifter *geoLocationShifter;
  void *v15;
  NSObject *v16;
  _QWORD v17[4];
  NSObject *v18;
  double v19;
  double v20;
  double v21;
  _QWORD v22[4];
  NSObject *v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  longitude = a3.longitude;
  latitude = a3.latitude;
  v28 = *MEMORY[0x24BDAC8D0];
  v9 = (void (**)(id, _QWORD, double, double, double))a5;
  if (v9)
  {
    if ((objc_msgSend(MEMORY[0x24BE3CC28], "isLocationShiftRequiredForCoordinate:", latitude, longitude) & 1) == 0)
      v9[2](v9, 0, latitude, longitude, a4);
    v10 = MEMORY[0x24BDAC760];
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = sub_22793E9E0;
    v22[3] = &unk_24F00BF90;
    v11 = v9;
    v23 = v11;
    v12 = (void *)MEMORY[0x22E2A04E8](v22);
    v17[0] = v10;
    v17[1] = 3221225472;
    v17[2] = sub_22793EA1C;
    v17[3] = &unk_24F00BFB8;
    v18 = v11;
    v19 = latitude;
    v20 = longitude;
    v21 = a4;
    v13 = (void *)MEMORY[0x22E2A04E8](v17);
    geoLocationShifter = self->_geoLocationShifter;
    dispatch_get_global_queue(0, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOLocationShifter shiftCoordinate:accuracy:withCompletionHandler:mustGoToNetworkCallback:errorHandler:callbackQueue:](geoLocationShifter, "shiftCoordinate:accuracy:withCompletionHandler:mustGoToNetworkCallback:errorHandler:callbackQueue:", v12, 0, v13, v15, latitude, longitude, a4);

    v16 = v23;
  }
  else
  {
    sub_22793DEC4(qword_255903508);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v25 = "-[RTLocationShifter shiftCoordinate:accuracy:handler:]";
      v26 = 1024;
      v27 = 144;
      _os_log_error_impl(&dword_22793B000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }

}

+ (BOOL)isLocationShiftRequiredForCoordinate:(CLLocationCoordinate2D)a3
{
  return objc_msgSend(MEMORY[0x24BE3CC28], "isLocationShiftRequiredForCoordinate:", a3.latitude, a3.longitude);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geoLocationShifter, 0);
}

@end
