@implementation CLTripSegmentInputData

- (CLTripSegmentInputData)initWithTripSegmentID:(id)a3 isFinalPart:(BOOL)a4 modeOfTransport:(int64_t)a5 tripLocations:(id)a6
{
  CLTripSegmentInputData *v10;
  NSUUID *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CLTripSegmentInputData;
  v10 = -[CLTripSegmentInputData init](&v13, sel_init);
  if (v10)
  {
    v11 = (NSUUID *)a3;
    v10->_isFinalPart = a4;
    v10->_tripSegmentID = v11;
    v10->_modeOfTransport = a5;
    v10->_tripLocations = (NSArray *)a6;
  }
  return v10;
}

- (CLTripSegmentInputData)initWithTripSegmentID:(id)a3 isFinalPart:(BOOL)a4 modeOfTransport:(int64_t)a5 tripLocations:(id)a6 startTripLocation:(id)a7 stopTripLocation:(id)a8 inertialData:(id)a9
{
  CLTripSegmentInputData *v15;
  NSUUID *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)CLTripSegmentInputData;
  v15 = -[CLTripSegmentInputData init](&v18, sel_init);
  if (v15)
  {
    v16 = (NSUUID *)a3;
    v15->_isFinalPart = a4;
    v15->_tripSegmentID = v16;
    v15->_modeOfTransport = a5;
    v15->_tripLocations = (NSArray *)a6;
    v15->_startTripLocation = (CLTripSegmentLocation *)a7;
    v15->_stopTripLocation = (CLTripSegmentLocation *)a8;
    v15->_inertialData = (NSArray *)a9;
    v15->_inertialOdometryData = 0;
  }
  return v15;
}

- (CLTripSegmentInputData)initWithTripSegmentID:(id)a3 isFinalPart:(BOOL)a4 modeOfTransport:(int64_t)a5 tripLocations:(id)a6 startTripLocation:(id)a7 stopTripLocation:(id)a8 inertialOdometryData:(id)a9
{
  CLTripSegmentInputData *v15;
  NSUUID *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)CLTripSegmentInputData;
  v15 = -[CLTripSegmentInputData init](&v18, sel_init);
  if (v15)
  {
    v16 = (NSUUID *)a3;
    v15->_isFinalPart = a4;
    v15->_tripSegmentID = v16;
    v15->_modeOfTransport = a5;
    v15->_tripLocations = (NSArray *)a6;
    v15->_startTripLocation = (CLTripSegmentLocation *)a7;
    v15->_stopTripLocation = (CLTripSegmentLocation *)a8;
    v15->_inertialData = 0;
    v15->_inertialOdometryData = (NSArray *)a9;
  }
  return v15;
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
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t started;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  _QWORD *isFinalPart_modeOfTransport_tripLocations_startTripLocation_stopTripLocation_inertialOdometryData;
  const char *v39;
  uint64_t v40;
  uint64_t v41;

  v5 = (void *)objc_opt_class();
  v8 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  v12 = objc_msgSend_tripSegmentID(self, v9, v10, v11);
  isFinalPart = objc_msgSend_isFinalPart(self, v13, v14, v15);
  v20 = objc_msgSend_modeOfTransport(self, v17, v18, v19);
  v24 = objc_msgSend_tripLocations(self, v21, v22, v23);
  started = objc_msgSend_startTripLocation(self, v25, v26, v27);
  v32 = objc_msgSend_stopTripLocation(self, v29, v30, v31);
  v36 = objc_msgSend_inertialOdometryData(self, v33, v34, v35);
  isFinalPart_modeOfTransport_tripLocations_startTripLocation_stopTripLocation_inertialOdometryData = (_QWORD *)objc_msgSend_initWithTripSegmentID_isFinalPart_modeOfTransport_tripLocations_startTripLocation_stopTripLocation_inertialOdometryData_(v8, v37, v12, isFinalPart, v20, v24, started, v32, v36);
  isFinalPart_modeOfTransport_tripLocations_startTripLocation_stopTripLocation_inertialOdometryData[4] = (id)objc_msgSend_inertialData(self, v39, v40, v41);
  return isFinalPart_modeOfTransport_tripLocations_startTripLocation_stopTripLocation_inertialOdometryData;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLTripSegmentInputData;
  -[CLTripSegmentInputData dealloc](&v3, sel_dealloc);
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
  uint64_t v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t started;
  const char *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;

  v6 = objc_msgSend_tripSegmentID(self, a2, (uint64_t)a3, v3);
  objc_msgSend_encodeObject_forKey_(a3, v7, v6, (uint64_t)CFSTR("tripSegmentID"));
  isFinalPart = objc_msgSend_isFinalPart(self, v8, v9, v10);
  objc_msgSend_encodeBool_forKey_(a3, v12, isFinalPart, (uint64_t)CFSTR("isFinalPart"));
  v16 = objc_msgSend_modeOfTransport(self, v13, v14, v15);
  objc_msgSend_encodeInteger_forKey_(a3, v17, v16, (uint64_t)CFSTR("modeOfTransport"));
  v21 = objc_msgSend_inertialData(self, v18, v19, v20);
  objc_msgSend_encodeObject_forKey_(a3, v22, v21, (uint64_t)CFSTR("inertialData"));
  v26 = objc_msgSend_tripLocations(self, v23, v24, v25);
  objc_msgSend_encodeObject_forKey_(a3, v27, v26, (uint64_t)CFSTR("tripLocations"));
  started = objc_msgSend_startTripLocation(self, v28, v29, v30);
  objc_msgSend_encodeObject_forKey_(a3, v32, started, (uint64_t)CFSTR("tripStartLocation"));
  v36 = objc_msgSend_stopTripLocation(self, v33, v34, v35);
  objc_msgSend_encodeObject_forKey_(a3, v37, v36, (uint64_t)CFSTR("tripStopLocation"));
  v41 = objc_msgSend_inertialOdometryData(self, v38, v39, v40);
  objc_msgSend_encodeObject_forKey_(a3, v42, v41, (uint64_t)CFSTR("inertialOdometryData"));
}

- (CLTripSegmentInputData)initWithCoder:(id)a3
{
  CLTripSegmentInputData *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  objc_super v37;

  v37.receiver = self;
  v37.super_class = (Class)CLTripSegmentInputData;
  v4 = -[CLTripSegmentInputData init](&v37, sel_init);
  if (v4)
  {
    v5 = objc_opt_class();
    v4->_tripSegmentID = (NSUUID *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, (uint64_t)CFSTR("tripSegmentID"));
    v4->_isFinalPart = objc_msgSend_decodeBoolForKey_(a3, v7, (uint64_t)CFSTR("isFinalPart"), v8);
    v4->_modeOfTransport = objc_msgSend_decodeIntegerForKey_(a3, v9, (uint64_t)CFSTR("modeOfTransport"), v10);
    v11 = (void *)MEMORY[0x1E0C99E60];
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v16 = objc_msgSend_setWithObjects_(v11, v14, v12, v15, v13, 0);
    v4->_tripLocations = (NSArray *)(id)objc_msgSend_decodeObjectOfClasses_forKey_(a3, v17, v16, (uint64_t)CFSTR("tripLocations"));
    v18 = objc_opt_class();
    v4->_startTripLocation = (CLTripSegmentLocation *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v19, v18, (uint64_t)CFSTR("tripStartLocation"));
    v20 = objc_opt_class();
    v4->_stopTripLocation = (CLTripSegmentLocation *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v21, v20, (uint64_t)CFSTR("tripStopLocation"));
    v22 = (void *)MEMORY[0x1E0C99E60];
    v23 = objc_opt_class();
    v24 = objc_opt_class();
    v27 = objc_msgSend_setWithObjects_(v22, v25, v23, v26, v24, 0);
    v4->_inertialData = (NSArray *)(id)objc_msgSend_decodeObjectOfClasses_forKey_(a3, v28, v27, (uint64_t)CFSTR("inertialData"));
    v29 = (void *)MEMORY[0x1E0C99E60];
    v30 = objc_opt_class();
    v31 = objc_opt_class();
    v34 = objc_msgSend_setWithObjects_(v29, v32, v30, v33, v31, 0);
    v4->_inertialOdometryData = (NSArray *)(id)objc_msgSend_decodeObjectOfClasses_forKey_(a3, v35, v34, (uint64_t)CFSTR("inertialOdometryData"));
  }
  return v4;
}

- (BOOL)isAutomotiveModeOfTransport
{
  return self->_modeOfTransport == 1;
}

- (BOOL)isPedestrianModeOfTransport
{
  return self->_modeOfTransport == 2;
}

- (BOOL)isCyclingModeOfTransport
{
  return self->_modeOfTransport == 3;
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

- (NSArray)inertialData
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (NSArray)tripLocations
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (CLTripSegmentLocation)startTripLocation
{
  return (CLTripSegmentLocation *)objc_getProperty(self, a2, 48, 1);
}

- (CLTripSegmentLocation)stopTripLocation
{
  return (CLTripSegmentLocation *)objc_getProperty(self, a2, 56, 1);
}

- (NSArray)inertialOdometryData
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

@end
