@implementation CMTremorResult

- (CMTremorResult)initWithStartDate:(id)a3 endDate:(id)a4 percentUnknown:(float)a5 percentNone:(float)a6 percentSlight:(float)a7 percentMild:(float)a8 percentModerate:(float)a9 percentStrong:(float)a10
{
  CMTremorResult *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)CMTremorResult;
  v18 = -[CMTremorResult init](&v20, sel_init);
  if (v18)
  {
    v18->_startDate = (NSDate *)a3;
    v18->_endDate = (NSDate *)a4;
    v18->_percentUnknown = a5;
    v18->_percentNone = a6;
    v18->_percentSlight = a7;
    v18->_percentMild = a8;
    v18->_percentModerate = a9;
    v18->_percentStrong = a10;
  }
  return v18;
}

- (CMTremorResult)initWithParkinsonsResult:(const ParkinsonsResult *)a3
{
  CMTremorResult *v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CMTremorResult;
  v4 = -[CMTremorResult init](&v16, sel_init);
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0C99D68]);
    v4->_startDate = (NSDate *)objc_msgSend_initWithTimeIntervalSinceReferenceDate_(v5, v6, v7, v8, v9, a3->var0);
    v10 = objc_alloc(MEMORY[0x1E0C99D68]);
    v4->_endDate = (NSDate *)objc_msgSend_initWithTimeIntervalSinceReferenceDate_(v10, v11, v12, v13, v14, a3->var1);
    v4->_percentUnknown = a3->var2 + a3->var3;
    v4->_percentNone = a3->var4;
    v4->_percentSlight = a3->var5;
    v4->_percentMild = a3->var6;
    v4->_percentModerate = a3->var7;
    v4->_percentStrong = a3->var8;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMTremorResult;
  -[CMTremorResult dealloc](&v3, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMTremorResult)initWithCoder:(id)a3
{
  CMTremorResult *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  float v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  float v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  float v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  float v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  float v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  float v34;
  objc_super v36;

  v36.receiver = self;
  v36.super_class = (Class)CMTremorResult;
  v4 = -[CMTremorResult init](&v36, sel_init);
  if (v4)
  {
    v5 = objc_opt_class();
    v4->_startDate = (NSDate *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, (uint64_t)CFSTR("kCMMovementDisorderResultCodingKeyStartDate"), v7);
    v8 = objc_opt_class();
    v4->_endDate = (NSDate *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v9, v8, (uint64_t)CFSTR("kCMMovementDisorderResultCodingKeyEndDate"), v10);
    objc_msgSend_decodeFloatForKey_(a3, v11, (uint64_t)CFSTR("kCMMovementDisorderResultCodingKeyNoObservation"), v12, v13);
    v4->_percentUnknown = v14;
    objc_msgSend_decodeFloatForKey_(a3, v15, (uint64_t)CFSTR("kCMMovementDisorderResultCodingKeyPercTremorAbsent"), v16, v17);
    v4->_percentNone = v18;
    objc_msgSend_decodeFloatForKey_(a3, v19, (uint64_t)CFSTR("kCMMovementDisorderResultCodingKeyPercTremorSlight"), v20, v21);
    v4->_percentSlight = v22;
    objc_msgSend_decodeFloatForKey_(a3, v23, (uint64_t)CFSTR("kCMMovementDisorderResultCodingKeyPercTremorMild"), v24, v25);
    v4->_percentMild = v26;
    objc_msgSend_decodeFloatForKey_(a3, v27, (uint64_t)CFSTR("kCMMovementDisorderResultCodingKeyPercTremorModerate"), v28, v29);
    v4->_percentModerate = v30;
    objc_msgSend_decodeFloatForKey_(a3, v31, (uint64_t)CFSTR("kCMMovementDisorderResultCodingKeyPercTremorStrong"), v32, v33);
    v4->_percentStrong = v34;
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v5 = (void *)objc_opt_class();
  v9 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8);
  return (id)MEMORY[0x1E0DE7D20](v9, sel_initWithStartDate_endDate_percentUnknown_percentNone_percentSlight_percentMild_percentModerate_percentStrong_, self->_startDate, self->_endDate, v10);
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  double v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;

  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_startDate, (uint64_t)CFSTR("kCMMovementDisorderResultCodingKeyStartDate"), v3);
  objc_msgSend_encodeObject_forKey_(a3, v6, (uint64_t)self->_endDate, (uint64_t)CFSTR("kCMMovementDisorderResultCodingKeyEndDate"), v7);
  *(float *)&v8 = self->_percentUnknown;
  objc_msgSend_encodeFloat_forKey_(a3, v9, (uint64_t)CFSTR("kCMMovementDisorderResultCodingKeyNoObservation"), v10, v11, v8);
  *(float *)&v12 = self->_percentNone;
  objc_msgSend_encodeFloat_forKey_(a3, v13, (uint64_t)CFSTR("kCMMovementDisorderResultCodingKeyPercTremorAbsent"), v14, v15, v12);
  *(float *)&v16 = self->_percentSlight;
  objc_msgSend_encodeFloat_forKey_(a3, v17, (uint64_t)CFSTR("kCMMovementDisorderResultCodingKeyPercTremorSlight"), v18, v19, v16);
  *(float *)&v20 = self->_percentMild;
  objc_msgSend_encodeFloat_forKey_(a3, v21, (uint64_t)CFSTR("kCMMovementDisorderResultCodingKeyPercTremorMild"), v22, v23, v20);
  *(float *)&v24 = self->_percentModerate;
  objc_msgSend_encodeFloat_forKey_(a3, v25, (uint64_t)CFSTR("kCMMovementDisorderResultCodingKeyPercTremorModerate"), v26, v27, v24);
  *(float *)&v28 = self->_percentStrong;
  objc_msgSend_encodeFloat_forKey_(a3, v29, (uint64_t)CFSTR("kCMMovementDisorderResultCodingKeyPercTremorStrong"), v30, v31, v28);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t started;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  float v20;
  double v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  float v26;
  double v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  float v32;
  double v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  float v38;
  double v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  float v44;
  double v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  float v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  started = objc_msgSend_startDate(self, v6, v7, v8, v9);
  v15 = objc_msgSend_endDate(self, v11, v12, v13, v14);
  objc_msgSend_percentUnknown(self, v16, v17, v18, v19);
  v21 = v20;
  objc_msgSend_percentNone(self, v22, v23, v24, v25);
  v27 = v26;
  objc_msgSend_percentSlight(self, v28, v29, v30, v31);
  v33 = v32;
  objc_msgSend_percentMild(self, v34, v35, v36, v37);
  v39 = v38;
  objc_msgSend_percentModerate(self, v40, v41, v42, v43);
  v45 = v44;
  objc_msgSend_percentStrong(self, v46, v47, v48, v49);
  return (id)objc_msgSend_stringWithFormat_(v3, v51, (uint64_t)CFSTR("%@, <startDate %@, endDate %@, percentUnknown %.2f, percentNone %.2f, percentSlight %.2f, percentMild %.2f, percentModerate %.2f, percentStrong %.2f"), v52, v53, v5, started, v15, *(_QWORD *)&v21, *(_QWORD *)&v27, *(_QWORD *)&v33, *(_QWORD *)&v39, *(_QWORD *)&v45, v50);
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (float)percentUnknown
{
  return self->_percentUnknown;
}

- (float)percentNone
{
  return self->_percentNone;
}

- (float)percentSlight
{
  return self->_percentSlight;
}

- (float)percentMild
{
  return self->_percentMild;
}

- (float)percentModerate
{
  return self->_percentModerate;
}

- (float)percentStrong
{
  return self->_percentStrong;
}

@end
