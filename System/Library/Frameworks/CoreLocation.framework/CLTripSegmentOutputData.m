@implementation CLTripSegmentOutputData

- (CLTripSegmentOutputData)initWithTripSegmentID:(id)a3 isFinalPart:(BOOL)a4 startDate:(id)a5 endDate:(id)a6 duration:(double)a7 modeOfTransport:(int64_t)a8 distance:(double)a9 distanceUnc:(double)a10 tripLocations:(id)a11
{
  CLTripSegmentOutputData *v20;
  NSUUID *v21;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)CLTripSegmentOutputData;
  v20 = -[CLTripSegmentOutputData init](&v23, sel_init);
  if (v20)
  {
    v21 = (NSUUID *)a3;
    v20->_isFinalPart = a4;
    v20->_tripSegmentID = v21;
    v20->_modeOfTransport = a8;
    v20->_startDate = (NSDate *)a5;
    v20->_endDate = (NSDate *)a6;
    v20->_duration_s = a7;
    v20->_distance_m = a9;
    v20->_distanceUnc_m = a10;
    v20->_tripLocations = (NSArray *)a11;
  }
  return v20;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t isFinalPart;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t started;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  double v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  double v37;
  double v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  double v42;
  double v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;

  v5 = (void *)objc_opt_class();
  v8 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  v12 = objc_msgSend_tripSegmentID(self, v9, v10, v11);
  isFinalPart = objc_msgSend_isFinalPart(self, v13, v14, v15);
  started = objc_msgSend_startDate(self, v17, v18, v19);
  v24 = objc_msgSend_endDate(self, v21, v22, v23);
  objc_msgSend_duration_s(self, v25, v26, v27);
  v29 = v28;
  v33 = objc_msgSend_modeOfTransport(self, v30, v31, v32);
  objc_msgSend_distance_m(self, v34, v35, v36);
  v38 = v37;
  objc_msgSend_distanceUnc_m(self, v39, v40, v41);
  v43 = v42;
  v47 = objc_msgSend_tripLocations(self, v44, v45, v46);
  return (id)objc_msgSend_initWithTripSegmentID_isFinalPart_startDate_endDate_duration_modeOfTransport_distance_distanceUnc_tripLocations_(v8, v48, v12, isFinalPart, started, v24, v33, v47, v29, v38, v43);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLTripSegmentOutputData;
  -[CLTripSegmentOutputData dealloc](&v3, sel_dealloc);
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t isFinalPart;
  const char *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t started;
  const char *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;

  v6 = objc_msgSend_tripSegmentID(self, a2, (uint64_t)a3, v3);
  objc_msgSend_encodeObject_forKey_(a3, v7, v6, (uint64_t)CFSTR("tripSegmentID"));
  isFinalPart = objc_msgSend_isFinalPart(self, v8, v9, v10);
  objc_msgSend_encodeBool_forKey_(a3, v12, isFinalPart, (uint64_t)CFSTR("isFinalPart"));
  v16 = objc_msgSend_modeOfTransport(self, v13, v14, v15);
  objc_msgSend_encodeInteger_forKey_(a3, v17, v16, (uint64_t)CFSTR("modeOfTransport"));
  started = objc_msgSend_startDate(self, v18, v19, v20);
  objc_msgSend_encodeObject_forKey_(a3, v22, started, (uint64_t)CFSTR("startDate"));
  v26 = objc_msgSend_endDate(self, v23, v24, v25);
  objc_msgSend_encodeObject_forKey_(a3, v27, v26, (uint64_t)CFSTR("endDate"));
  objc_msgSend_duration_s(self, v28, v29, v30);
  objc_msgSend_encodeDouble_forKey_(a3, v31, (uint64_t)CFSTR("duration"), v32);
  objc_msgSend_distance_m(self, v33, v34, v35);
  objc_msgSend_encodeDouble_forKey_(a3, v36, (uint64_t)CFSTR("distance"), v37);
  objc_msgSend_distanceUnc_m(self, v38, v39, v40);
  objc_msgSend_encodeDouble_forKey_(a3, v41, (uint64_t)CFSTR("distanceUnc"), v42);
  v46 = objc_msgSend_tripLocations(self, v43, v44, v45);
  objc_msgSend_encodeObject_forKey_(a3, v47, v46, (uint64_t)CFSTR("tripLocations"));
}

- (CLTripSegmentOutputData)initWithCoder:(id)a3
{
  CLTripSegmentOutputData *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  double v19;
  double v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  double v26;
  double v27;
  const char *v28;
  uint64_t v29;
  double v30;
  double v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  const char *v40;

  v4 = [CLTripSegmentOutputData alloc];
  v5 = objc_opt_class();
  v7 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, (uint64_t)CFSTR("tripSegmentID"));
  v10 = objc_msgSend_decodeBoolForKey_(a3, v8, (uint64_t)CFSTR("isFinalPart"), v9);
  v11 = objc_opt_class();
  v13 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v12, v11, (uint64_t)CFSTR("startDate"));
  v14 = objc_opt_class();
  v16 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v15, v14, (uint64_t)CFSTR("endDate"));
  objc_msgSend_decodeDoubleForKey_(a3, v17, (uint64_t)CFSTR("duration"), v18);
  v20 = v19;
  v23 = objc_msgSend_decodeIntegerForKey_(a3, v21, (uint64_t)CFSTR("modeOfTransport"), v22);
  objc_msgSend_decodeDoubleForKey_(a3, v24, (uint64_t)CFSTR("distance"), v25);
  v27 = v26;
  objc_msgSend_decodeDoubleForKey_(a3, v28, (uint64_t)CFSTR("distanceUnc"), v29);
  v31 = v30;
  v32 = (void *)MEMORY[0x1E0C99E60];
  v33 = objc_opt_class();
  v34 = objc_opt_class();
  v37 = objc_msgSend_setWithObjects_(v32, v35, v33, v36, v34, 0);
  v39 = objc_msgSend_decodeObjectOfClasses_forKey_(a3, v38, v37, (uint64_t)CFSTR("tripLocations"));
  return (CLTripSegmentOutputData *)objc_msgSend_initWithTripSegmentID_isFinalPart_startDate_endDate_duration_modeOfTransport_distance_distanceUnc_tripLocations_(v4, v40, v7, v10, v13, v16, v23, v39, v20, v27, v31);
}

- (NSUUID)tripSegmentID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (int64_t)modeOfTransport
{
  return self->_modeOfTransport;
}

- (BOOL)isFinalPart
{
  return self->_isFinalPart;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (double)duration_s
{
  return self->_duration_s;
}

- (void)setDuration_s:(double)a3
{
  self->_duration_s = a3;
}

- (double)distance_m
{
  return self->_distance_m;
}

- (void)setDistance_m:(double)a3
{
  self->_distance_m = a3;
}

- (double)distanceUnc_m
{
  return self->_distanceUnc_m;
}

- (void)setDistanceUnc_m:(double)a3
{
  self->_distanceUnc_m = a3;
}

- (NSArray)tripLocations
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

@end
