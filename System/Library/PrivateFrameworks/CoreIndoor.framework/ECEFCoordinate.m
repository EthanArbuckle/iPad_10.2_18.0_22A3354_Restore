@implementation ECEFCoordinate

+ (id)fromLatLon:(id)a3
{
  id v3;
  ECEFCoordinate *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  v3 = a3;
  v4 = objc_alloc_init(ECEFCoordinate);
  objc_msgSend_setFromLatLon_(v4, v5, (uint64_t)v3, v6, v7);

  return v4;
}

- (void)setFromLatLon:(id)a3
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
  double v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  double v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  double v43;
  id v44;

  v44 = a3;
  objc_msgSend_latitude(v44, v4, v5, v6, v7);
  v9 = cos(v8 * 0.0174532925);
  objc_msgSend_latitude(v44, v10, v11, v12, v13);
  v15 = sin(v14 * 0.0174532925);
  objc_msgSend_longitude(v44, v16, v17, v18, v19);
  v21 = cos(v20 * 0.0174532925);
  objc_msgSend_longitude(v44, v22, v23, v24, v25);
  v27 = sin(v26 * 0.0174532925);
  objc_msgSend_altitude(v44, v28, v29, v30, v31);
  v32 = 6378137.0 / sqrt(v15 * -0.00669437999 * v15 + 1.0);
  self->_x = v21 * (v9 * (v32 + v33));
  objc_msgSend_altitude(v44, v34, v35, v36, v37);
  self->_y = v27 * (v9 * (v32 + v38));
  objc_msgSend_altitude(v44, v39, v40, v41, v42);
  self->_z = v15 * (v43 + v32 * 0.99330562);

}

- (double)y
{
  return self->_y;
}

- (double)x
{
  return self->_x;
}

- (double)z
{
  return self->_z;
}

- (void)setFromX:(double)a3 y:(double)a4 z:(double)a5
{
  self->_x = a3;
  self->_y = a4;
  self->_z = a5;
}

- (point_xy<double,)toBoostEnuWithLatLonOrigin:(id)a3 andEcefOrigin:(id)a4 usingENU:(id)a5
{
  id v8;
  const char *v9;
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
  double v22;
  double v23;
  point_xy<double, boost::geometry::cs::cartesian> result;

  v8 = a5;
  objc_msgSend_setFromLatLonOrigin_andEcefOrigin_andEcefPoint_(v8, v9, (uint64_t)a3, (uint64_t)a4, (uint64_t)self);
  objc_msgSend_east(v8, v10, v11, v12, v13);
  v15 = v14;
  objc_msgSend_north(v8, v16, v17, v18, v19);
  v21 = v20;

  v22 = v15;
  v23 = v21;
  result.var0[1] = v23;
  result.var0[0] = v22;
  return result;
}

- (ECEFCoordinate)initWithX:(double)a3 y:(double)a4 z:(double)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend_setFromX_y_z_(self, a2, v5, v6, v7, a3, a4, a5);
  return self;
}

- (ECEFCoordinate)init
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (ECEFCoordinate *)objc_msgSend_initWithX_y_z_(self, a2, v2, v3, v4, NAN, NAN, NAN);
}

- (id)initFromLatLon:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v6;

  objc_msgSend_fromLatLon_(ECEFCoordinate, a2, (uint64_t)a3, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setX:(double)a3
{
  self->_x = a3;
}

- (void)setY:(double)a3
{
  self->_y = a3;
}

- (void)setZ:(double)a3
{
  self->_z = a3;
}

@end
