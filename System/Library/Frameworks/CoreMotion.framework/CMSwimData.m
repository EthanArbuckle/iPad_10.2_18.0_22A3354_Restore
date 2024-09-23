@implementation CMSwimData

- (void)convertToSwimEntry:(CLSwimEntry *)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  uuid_t src;
  uuid_t uu;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  memset(uu, 0, sizeof(uu));
  memset(src, 0, sizeof(src));
  uuid_clear(uu);
  uuid_clear(src);
  objc_msgSend_getUUIDBytes_(self->fSourceId, v5, (uint64_t)uu, v6, v7);
  objc_msgSend_getUUIDBytes_(self->fSessionId, v8, (uint64_t)src, v9, v10);
  a3->var0 = self->fRecordId;
  uuid_copy(a3->var2, uu);
  uuid_copy(a3->var1, src);
  objc_msgSend_timeIntervalSinceReferenceDate(self->fStartDate, v11, v12, v13, v14);
  a3->var3 = v15;
  objc_msgSend_timeIntervalSinceReferenceDate(self->fEndDate, v16, v17, v18, v19);
  a3->var4 = v20;
  a3->var12 = self->fStrokeCount;
  a3->var7 = self->fDistance;
  objc_msgSend_timeIntervalSinceReferenceDate(self->fDistanceTimestamp, v21, v22, v23, v24);
  a3->var8 = v25;
  a3->var6 = self->fAvgPace;
  a3->var13 = self->fLapCount;
  a3->var11 = self->fStrokeType;
  a3->var16 = self->fSegment;
  a3->var18 = self->fSWOLF;
  a3->var19 = self->fSegmentSWOLF;
}

- (CMSwimData)initWithRecordId:(unint64_t)a3 sourceId:(id)a4 sessionId:(id)a5 startDate:(id)a6 endDate:(id)a7 strokeCount:(unint64_t)a8 distance:(double)a9 distanceTimestamp:(id)a10 avgPace:(double)a11 lapCount:(unint64_t)a12 strokeType:(int64_t)a13 segment:(unint64_t)a14 SWOLF:(double)a15 segmentSWOLF:(double)a16
{
  CMSwimData *v28;
  CMSwimData *v29;
  void *v31;
  const char *v32;
  objc_super v33;

  if (!a4 || !a5 || !a6 || !a7 || a13 >= 7)
  {
    v31 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, a3, (uint64_t)a4, (uint64_t)a5);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v31, v32, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMSwimData.mm"), 88, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sourceId && sessionId && startDate && endDate && strokeType < kCMSwimStrokeTypeMax"));
  }
  v33.receiver = self;
  v33.super_class = (Class)CMSwimData;
  v28 = -[CMSwimData init](&v33, sel_init);
  v29 = v28;
  if (v28)
  {
    v28->fRecordId = a3;
    v28->fSourceId = (NSUUID *)a4;
    v29->fSessionId = (NSUUID *)a5;
    v29->fStartDate = (NSDate *)a6;
    v29->fEndDate = (NSDate *)a7;
    v29->fStrokeCount = a8;
    v29->fDistance = a9;
    v29->fDistanceTimestamp = (NSDate *)a10;
    v29->fAvgPace = a11;
    v29->fLapCount = a12;
    v29->fStrokeType = a13;
    v29->fSegment = a14;
    v29->fSWOLF = a15;
    v29->fSegmentSWOLF = a16;
  }
  return v29;
}

- (CMSwimData)initWithSessionId:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  CMSwimData *v7;
  CMSwimData *v8;
  void *v11;
  const char *v12;
  objc_super v13;

  if (!a3)
  {
    v11 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, v3, v4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v11, v12, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMSwimData.mm"), 110, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sessionId"));
  }
  v13.receiver = self;
  v13.super_class = (Class)CMSwimData;
  v7 = -[CMSwimData init](&v13, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->fRecordId = 0;
    v7->fSourceId = 0;
    v7->fSessionId = (NSUUID *)a3;
    *(_OWORD *)&v8->fStartDate = 0u;
    *(_OWORD *)&v8->fStrokeCount = 0u;
    *(_OWORD *)&v8->fDistanceTimestamp = 0u;
    v8->fLapCount = 0;
    v8->fStrokeType = 7;
    v8->fSWOLF = 0.0;
    v8->fSegmentSWOLF = 0.0;
    v8->fSegment = 0;
  }
  return v8;
}

- (CMSwimData)initWithSwimEntry:(const CLSwimEntry *)a3
{
  CMSwimData *v4;
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
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int64_t var11;
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)CMSwimData;
  v4 = -[CMSwimData init](&v32, sel_init);
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0CB3A28]);
    v9 = objc_msgSend_initWithUUIDBytes_(v5, v6, (uint64_t)a3->var2, v7, v8);
    v10 = objc_alloc(MEMORY[0x1E0CB3A28]);
    v14 = objc_msgSend_initWithUUIDBytes_(v10, v11, (uint64_t)a3->var1, v12, v13);
    v4->fRecordId = a3->var0;
    v4->fSourceId = (NSUUID *)v9;
    v4->fSessionId = (NSUUID *)v14;
    v15 = objc_alloc(MEMORY[0x1E0C99D68]);
    v4->fStartDate = (NSDate *)objc_msgSend_initWithTimeIntervalSinceReferenceDate_(v15, v16, v17, v18, v19, a3->var3);
    v20 = objc_alloc(MEMORY[0x1E0C99D68]);
    v4->fEndDate = (NSDate *)objc_msgSend_initWithTimeIntervalSinceReferenceDate_(v20, v21, v22, v23, v24, a3->var4);
    v4->fStrokeCount = a3->var12;
    v4->fDistance = a3->var7;
    v25 = objc_alloc(MEMORY[0x1E0C99D68]);
    v4->fDistanceTimestamp = (NSDate *)objc_msgSend_initWithTimeIntervalSinceReferenceDate_(v25, v26, v27, v28, v29, a3->var8);
    v4->fAvgPace = a3->var6;
    var11 = a3->var11;
    v4->fLapCount = a3->var13;
    v4->fStrokeType = var11;
    v4->fSegment = a3->var16;
    v4->fSWOLF = a3->var18;
    v4->fSegmentSWOLF = a3->var19;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMSwimData;
  -[CMSwimData dealloc](&v3, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMSwimData)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  CMSwimData *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  double v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  double v50;
  objc_super v52;

  v52.receiver = self;
  v52.super_class = (Class)CMSwimData;
  v7 = -[CMSwimData init](&v52, sel_init);
  if (v7)
  {
    v7->fRecordId = objc_msgSend_decodeIntegerForKey_(a3, v4, (uint64_t)CFSTR("kCMSwimDataCodingKeyRecordId"), v5, v6);
    v8 = objc_opt_class();
    v7->fSourceId = (NSUUID *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v9, v8, (uint64_t)CFSTR("kCMSwimDataCodingKeySourceId"), v10);
    v11 = objc_opt_class();
    v7->fSessionId = (NSUUID *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v12, v11, (uint64_t)CFSTR("kCMSwimDataCodingKeySessionId"), v13);
    v14 = objc_opt_class();
    v7->fStartDate = (NSDate *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v15, v14, (uint64_t)CFSTR("kCMSwimDataCodingKeyStartDate"), v16);
    v17 = objc_opt_class();
    v7->fEndDate = (NSDate *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v18, v17, (uint64_t)CFSTR("kCMSwimDataCodingKeyEndDate"), v19);
    v7->fStrokeCount = objc_msgSend_decodeIntegerForKey_(a3, v20, (uint64_t)CFSTR("kCMSwimDataCodingKeyStrokeCount"), v21, v22);
    objc_msgSend_decodeDoubleForKey_(a3, v23, (uint64_t)CFSTR("kCMSwimDataCodingKeyDistance"), v24, v25);
    v7->fDistance = v26;
    v27 = objc_opt_class();
    v7->fDistanceTimestamp = (NSDate *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v28, v27, (uint64_t)CFSTR("kCMSwimDataCodingKeyDistanceTimestamp"), v29);
    objc_msgSend_decodeDoubleForKey_(a3, v30, (uint64_t)CFSTR("kCMSwimDataCodingKeyAvgPace"), v31, v32);
    v7->fAvgPace = v33;
    v7->fLapCount = objc_msgSend_decodeIntegerForKey_(a3, v34, (uint64_t)CFSTR("kCMSwimDataCodingKeyLapCount"), v35, v36);
    v7->fStrokeType = objc_msgSend_decodeIntegerForKey_(a3, v37, (uint64_t)CFSTR("kCMSwimDataCodingKeyStrokeType"), v38, v39);
    v7->fSegment = objc_msgSend_decodeIntegerForKey_(a3, v40, (uint64_t)CFSTR("kCMSwimDataCodingKeySegmentCount"), v41, v42);
    objc_msgSend_decodeDoubleForKey_(a3, v43, (uint64_t)CFSTR("kCMSwimDataCodingKeySWOLF"), v44, v45);
    v7->fSWOLF = v46;
    objc_msgSend_decodeDoubleForKey_(a3, v47, (uint64_t)CFSTR("kCMSwimDataCodingKeySegmentSWOLF"), v48, v49);
    v7->fSegmentSWOLF = v50;
  }
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;

  v5 = (void *)objc_opt_class();
  v9 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8);
  return (id)objc_msgSend_initWithRecordId_sourceId_sessionId_startDate_endDate_strokeCount_distance_distanceTimestamp_avgPace_lapCount_strokeType_segment_SWOLF_segmentSWOLF_(v9, v10, self->fRecordId, (uint64_t)self->fSourceId, (uint64_t)self->fSessionId, self->fStartDate, self->fEndDate, self->fStrokeCount, self->fDistance, self->fAvgPace, self->fSWOLF, self->fSegmentSWOLF, self->fDistanceTimestamp, self->fLapCount, self->fStrokeType, self->fSegment);
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;

  objc_msgSend_encodeInteger_forKey_(a3, a2, self->fRecordId, (uint64_t)CFSTR("kCMSwimDataCodingKeyRecordId"), v3);
  objc_msgSend_encodeObject_forKey_(a3, v6, (uint64_t)self->fSourceId, (uint64_t)CFSTR("kCMSwimDataCodingKeySourceId"), v7);
  objc_msgSend_encodeObject_forKey_(a3, v8, (uint64_t)self->fSessionId, (uint64_t)CFSTR("kCMSwimDataCodingKeySessionId"), v9);
  objc_msgSend_encodeObject_forKey_(a3, v10, (uint64_t)self->fStartDate, (uint64_t)CFSTR("kCMSwimDataCodingKeyStartDate"), v11);
  objc_msgSend_encodeObject_forKey_(a3, v12, (uint64_t)self->fEndDate, (uint64_t)CFSTR("kCMSwimDataCodingKeyEndDate"), v13);
  objc_msgSend_encodeInteger_forKey_(a3, v14, self->fStrokeCount, (uint64_t)CFSTR("kCMSwimDataCodingKeyStrokeCount"), v15);
  objc_msgSend_encodeDouble_forKey_(a3, v16, (uint64_t)CFSTR("kCMSwimDataCodingKeyDistance"), v17, v18, self->fDistance);
  objc_msgSend_encodeObject_forKey_(a3, v19, (uint64_t)self->fDistanceTimestamp, (uint64_t)CFSTR("kCMSwimDataCodingKeyDistanceTimestamp"), v20);
  objc_msgSend_encodeDouble_forKey_(a3, v21, (uint64_t)CFSTR("kCMSwimDataCodingKeyAvgPace"), v22, v23, self->fAvgPace);
  objc_msgSend_encodeInteger_forKey_(a3, v24, self->fLapCount, (uint64_t)CFSTR("kCMSwimDataCodingKeyLapCount"), v25);
  objc_msgSend_encodeInteger_forKey_(a3, v26, self->fStrokeType, (uint64_t)CFSTR("kCMSwimDataCodingKeyStrokeType"), v27);
  objc_msgSend_encodeInteger_forKey_(a3, v28, self->fSegment, (uint64_t)CFSTR("kCMSwimDataCodingKeySegmentCount"), v29);
  objc_msgSend_encodeDouble_forKey_(a3, v30, (uint64_t)CFSTR("kCMSwimDataCodingKeySWOLF"), v31, v32, self->fSWOLF);
  objc_msgSend_encodeDouble_forKey_(a3, v33, (uint64_t)CFSTR("kCMSwimDataCodingKeySegmentSWOLF"), v34, v35, self->fSegmentSWOLF);
}

- (unint64_t)recordId
{
  return self->fRecordId;
}

- (NSUUID)sourceId
{
  return self->fSourceId;
}

- (NSUUID)sessionId
{
  return self->fSessionId;
}

- (NSDate)startDate
{
  return self->fStartDate;
}

- (NSDate)endDate
{
  return self->fEndDate;
}

- (unint64_t)strokeCount
{
  return self->fStrokeCount;
}

- (double)distance
{
  return self->fDistance;
}

- (NSDate)distanceTimestamp
{
  return self->fDistanceTimestamp;
}

- (double)avgPace
{
  return self->fAvgPace;
}

- (unint64_t)lapCount
{
  return self->fLapCount;
}

- (int64_t)strokeType
{
  return self->fStrokeType;
}

- (unint64_t)segment
{
  return self->fSegment;
}

- (double)SWOLF
{
  return self->fSWOLF;
}

- (BOOL)isSWOLFValid
{
  return self->fSWOLF != 0.0;
}

- (double)segmentSWOLF
{
  return self->fSegmentSWOLF;
}

- (BOOL)isSegmentSWOLFValid
{
  return self->fSegmentSWOLF != 0.0;
}

+ (id)strokeTypeName:(int64_t)a3
{
  if ((unint64_t)a3 > 7)
    return 0;
  else
    return off_1E2959490[a3];
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t started;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v76;

  v76 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v9 = objc_msgSend_sessionId(self, v5, v6, v7, v8);
  started = objc_msgSend_startDate(self, v10, v11, v12, v13);
  v19 = objc_msgSend_endDate(self, v15, v16, v17, v18);
  v24 = objc_msgSend_strokeCount(self, v20, v21, v22, v23);
  objc_msgSend_distance(self, v25, v26, v27, v28);
  v30 = v29;
  v35 = objc_msgSend_distanceTimestamp(self, v31, v32, v33, v34);
  objc_msgSend_avgPace(self, v36, v37, v38, v39);
  v41 = v40;
  v46 = objc_msgSend_lapCount(self, v42, v43, v44, v45);
  v51 = objc_msgSend_strokeType(self, v47, v48, v49, v50);
  v55 = objc_msgSend_strokeTypeName_(CMSwimData, v52, v51, v53, v54);
  v60 = objc_msgSend_segment(self, v56, v57, v58, v59);
  objc_msgSend_SWOLF(self, v61, v62, v63, v64);
  v66 = v65;
  objc_msgSend_segmentSWOLF(self, v67, v68, v69, v70);
  return (id)objc_msgSend_stringWithFormat_(v76, v71, (uint64_t)CFSTR("%@, <sessionId %@, startDate %@, endDate %@, strokeCount %lu, distance %.2f, distanceTimestamp, %@, avgPace %.2f, lapCount %lu, strokeType %@, segment %lu>, SWOLF %.2f, segmentSWOLF %.2f"), v72, v73, v4, v9, started, v19, v24, v30, v35, v41, v46, v55, v60, v66, v74);
}

+ (unint64_t)maxSwimDataEntries
{
  return 1000;
}

@end
