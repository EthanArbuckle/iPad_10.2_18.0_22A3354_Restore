@implementation ENUCoordinate

- (void)setFromLatLonOrigin:(id)a3 andEcefOrigin:(id)a4 andEcefPoint:(id)a5
{
  id v8;
  id v9;
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
  double v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  double v44;
  double v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  double v50;
  double v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  double v56;
  double v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  double v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  long double v74;
  double v75;
  double v76;
  double v77;
  id v78;

  v78 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend_latitude(v78, v10, v11, v12, v13);
  v15 = v14;
  objc_msgSend_latitude(v78, v16, v17, v18, v19);
  v21 = v20;
  objc_msgSend_longitude(v78, v22, v23, v24, v25);
  v27 = v26;
  objc_msgSend_longitude(v78, v28, v29, v30, v31);
  v33 = v32;
  objc_msgSend_x(v9, v34, v35, v36, v37);
  v39 = v38;
  objc_msgSend_x(v8, v40, v41, v42, v43);
  v45 = v44;
  v76 = v27;
  v77 = v21;
  objc_msgSend_y(v9, v46, v47, v48, v49);
  v51 = v50;
  objc_msgSend_y(v8, v52, v53, v54, v55);
  v57 = v56;
  objc_msgSend_z(v9, v58, v59, v60, v61);
  v75 = v62;
  objc_msgSend_z(v8, v63, v64, v65, v66);
  v68 = v67;
  v69 = v51 - v57;
  v70 = v39 - v45;
  v71 = sin(v33 * 0.0174532925);
  v72 = cos(v76 * 0.0174532925);
  v73 = sin(v77 * 0.0174532925);
  v74 = cos(v15 * 0.0174532925);
  self->_east = v72 * v69 - v71 * v70;
  self->_north = -(v73 * v71) * v69 + -(v73 * v72) * v70 + v74 * (v75 - v68);
  self->_up = v74 * v71 * v69 + v74 * v72 * v70 + v73 * (v75 - v68);

}

- (double)north
{
  return self->_north;
}

- (double)east
{
  return self->_east;
}

+ (id)fromLatLonOrigin:(id)a3 andEcefOrigin:(id)a4 andEcefPoint:(id)a5
{
  id v7;
  id v8;
  id v9;
  ENUCoordinate *v10;
  const char *v11;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init(ENUCoordinate);
  objc_msgSend_setFromLatLonOrigin_andEcefOrigin_andEcefPoint_(v10, v11, (uint64_t)v7, (uint64_t)v8, (uint64_t)v9);

  return v10;
}

- (ENUCoordinate)init
{
  return (ENUCoordinate *)((uint64_t (*)(ENUCoordinate *, char *))MEMORY[0x24BEDD108])(self, sel_initWithEast_north_up_);
}

- (ENUCoordinate)initWithEast:(double)a3 north:(double)a4 up:(double)a5
{
  self->_east = a3;
  self->_north = a4;
  self->_up = a5;
  return self;
}

- (void)setEast:(double)a3
{
  self->_east = a3;
}

- (void)setNorth:(double)a3
{
  self->_north = a3;
}

- (double)up
{
  return self->_up;
}

- (void)setUp:(double)a3
{
  self->_up = a3;
}

@end
