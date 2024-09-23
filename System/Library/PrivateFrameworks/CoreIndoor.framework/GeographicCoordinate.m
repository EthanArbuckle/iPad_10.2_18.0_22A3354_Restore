@implementation GeographicCoordinate

- (void)setFromLatitude:(double)a3 longitude:(double)a4 andAltitude:(double)a5
{
  self->_latitude = a3;
  self->_longitude = a4;
  self->_altitude = a5;
}

- (void)setFromECEFCoordinate:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  double v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  long double v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  double v38;
  long double v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  unsigned int v48;
  double v49;
  double v50;
  long double v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  __double2 v56;
  double v57;
  BOOL v58;
  double v59;
  id v60;

  v60 = a3;
  objc_msgSend_x(v60, v4, v5, v6, v7);
  v9 = v8;
  objc_msgSend_x(v60, v10, v11, v12, v13);
  v15 = v14;
  objc_msgSend_y(v60, v16, v17, v18, v19);
  v21 = v20;
  objc_msgSend_y(v60, v22, v23, v24, v25);
  v27 = v26;
  objc_msgSend_y(v60, v28, v29, v30, v31);
  v33 = v32;
  objc_msgSend_x(v60, v34, v35, v36, v37);
  v38 = sqrt(v21 * v27 + v9 * v15);
  self->_longitude = atan2(v33, v39) / 0.0174532925;
  v44 = v38 * 0.99330562;
  v45 = 0.0;
  v46 = 1.57079633;
  if (v38 * 0.99330562 == 0.0)
  {
    v47 = v60;
  }
  else
  {
    v48 = 0;
    v49 = 0.0;
    v50 = 0.0;
    objc_msgSend_z(v60, v40, v41, v42, v43, 0x3FF921FB54442D18);
    while (1)
    {
      v46 = atan2(v51, v44);
      v56 = __sincos_stret(v46);
      v57 = 6378137.0 / sqrt(v56.__sinval * -0.00669437999 * v56.__sinval + 1.0);
      v45 = v38 / v56.__cosval - v57;
      if (vabdd_f64(v49, v46) >= 0.000001)
      {
        v47 = v60;
        if (v48 > 8)
          goto LABEL_15;
      }
      else
      {
        v58 = vabdd_f64(v50, v45) < 0.001 || v48 >= 9;
        v47 = v60;
        if (v58)
          goto LABEL_15;
      }
      ++v48;
      v44 = v38 * (v57 / (v45 + v57) * -0.00669437999 + 1.0);
      v49 = v46;
      v50 = v38 / v56.__cosval - v57;
      if (v44 == 0.0)
        break;
      objc_msgSend_z(v47, v52, v53, v54, v55, *(_QWORD *)&v59);
    }
    v46 = v59;
  }
LABEL_15:
  self->_latitude = v46 / 0.0174532925;
  self->_altitude = v45;

}

- (double)altitude
{
  return self->_altitude;
}

- (double)longitude
{
  return self->_longitude;
}

- (double)latitude
{
  return self->_latitude;
}

- (id)initFromECEFCoordinate:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v6;

  objc_msgSend_fromECEFCoordinate_(GeographicCoordinate, a2, (uint64_t)a3, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)fromECEFCoordinate:(id)a3
{
  id v3;
  GeographicCoordinate *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  v3 = a3;
  v4 = objc_alloc_init(GeographicCoordinate);
  objc_msgSend_setFromECEFCoordinate_(v4, v5, (uint64_t)v3, v6, v7);

  return v4;
}

- (GeographicCoordinate)init
{
  GeographicCoordinate *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GeographicCoordinate;
  v2 = -[GeographicCoordinate init](&v8, sel_init);
  return (GeographicCoordinate *)objc_msgSend_initWithLatitude_longitude_andAltitude_(v2, v3, v4, v5, v6, NAN, NAN, NAN);
}

- (GeographicCoordinate)initWithLatitude:(double)a3 longitude:(double)a4 andAltitude:(double)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend_setFromLatitude_longitude_andAltitude_(self, a2, v5, v6, v7, a3, a4, a5);
  return self;
}

- (void)setLatitude:(double)a3
{
  self->_latitude = a3;
}

- (void)setLongitude:(double)a3
{
  self->_longitude = a3;
}

- (void)setAltitude:(double)a3
{
  self->_altitude = a3;
}

@end
