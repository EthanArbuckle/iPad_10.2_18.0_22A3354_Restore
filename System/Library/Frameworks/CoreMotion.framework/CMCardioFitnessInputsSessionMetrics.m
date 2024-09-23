@implementation CMCardioFitnessInputsSessionMetrics

- (CMCardioFitnessInputsSessionMetrics)initWithRecordId:(unint64_t)a3 startDate:(id)a4 sessionId:(id)a5 meanMaxMets:(double)a6 prior:(double)a7 hardwareType:(unsigned int)a8 betaBlockerUse:(BOOL)a9 algorithmVersion:(int64_t)a10
{
  CMCardioFitnessInputsSessionMetrics *v18;
  CMCardioFitnessInputsSessionMetrics *v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)CMCardioFitnessInputsSessionMetrics;
  v18 = -[CMCardioFitnessInputsSessionMetrics init](&v21, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->fRecordId = a3;
    v18->fStartDate = (NSDate *)a4;
    v19->fSessionId = (NSUUID *)a5;
    v19->fMeanMaxMets = a6;
    v19->fPrior = a7;
    v19->fHardwareType = a8;
    v19->fBetaBlockerUse = a9;
    v19->fAlgorithmVersion = a10;
  }
  return v19;
}

- (CMCardioFitnessInputsSessionMetrics)initWithSample:(VO2MaxSessionAttributes *)a3
{
  CMCardioFitnessInputsSessionMetrics *v4;
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
  v16.super_class = (Class)CMCardioFitnessInputsSessionMetrics;
  v4 = -[CMCardioFitnessInputsSessionMetrics init](&v16, sel_init);
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0CB3A28]);
    v9 = objc_msgSend_initWithUUIDBytes_(v5, v6, (uint64_t)a3->var2, v7, v8);
    v4->fRecordId = a3->var0;
    v10 = objc_alloc(MEMORY[0x1E0C99D68]);
    v4->fStartDate = (NSDate *)objc_msgSend_initWithTimeIntervalSinceReferenceDate_(v10, v11, v12, v13, v14, a3->var1);
    v4->fSessionId = (NSUUID *)v9;
    v4->fMeanMaxMets = a3->var3;
    v4->fPrior = a3->var4;
    v4->fHardwareType = a3->var5;
    v4->fBetaBlockerUse = a3->var6;
    v4->fAlgorithmVersion = a3->var7;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMCardioFitnessInputsSessionMetrics;
  -[CMCardioFitnessInputsSessionMetrics dealloc](&v3, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMCardioFitnessInputsSessionMetrics)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  CMCardioFitnessInputsSessionMetrics *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  objc_super v42;

  v42.receiver = self;
  v42.super_class = (Class)CMCardioFitnessInputsSessionMetrics;
  v7 = -[CMCardioFitnessInputsSessionMetrics init](&v42, sel_init);
  if (v7)
  {
    v7->fRecordId = objc_msgSend_decodeIntegerForKey_(a3, v4, (uint64_t)CFSTR("kCMCardioFitnessInputsSessionMetricsCodingKeyRecordId"), v5, v6);
    v8 = objc_opt_class();
    v11 = (void *)objc_msgSend_decodeObjectOfClass_forKey_(a3, v9, v8, (uint64_t)CFSTR("kCMCardioFitnessInputsSessionMetricsCodingKeyStartDate"), v10);
    v7->fStartDate = (NSDate *)objc_msgSend_copy(v11, v12, v13, v14, v15);
    v16 = objc_opt_class();
    v19 = (void *)objc_msgSend_decodeObjectOfClass_forKey_(a3, v17, v16, (uint64_t)CFSTR("kCMCardioFitnessInputsSessionMetricsCodingKeySessionId"), v18);
    v7->fSessionId = (NSUUID *)objc_msgSend_copy(v19, v20, v21, v22, v23);
    objc_msgSend_decodeDoubleForKey_(a3, v24, (uint64_t)CFSTR("kCMCardioFitnessInputsSessionMetricsCodingKeyMeanMaxMets"), v25, v26);
    v7->fMeanMaxMets = v27;
    objc_msgSend_decodeDoubleForKey_(a3, v28, (uint64_t)CFSTR("kCMCardioFitnessInputsSessionMetricsCodingKeyPrior"), v29, v30);
    v7->fPrior = v31;
    v7->fHardwareType = objc_msgSend_decodeIntegerForKey_(a3, v32, (uint64_t)CFSTR("kCMCardioFitnessInputsSessionMetricsCodingKeyHardwareType"), v33, v34);
    v7->fBetaBlockerUse = objc_msgSend_decodeBoolForKey_(a3, v35, (uint64_t)CFSTR("kCMCardioFitnessInputsSessionMetricsCodingKeyBetaBlockerUse"), v36, v37);
    v7->fAlgorithmVersion = objc_msgSend_decodeIntegerForKey_(a3, v38, (uint64_t)CFSTR("kCMCardioFitnessInputsSessionMetricsCodingKeyAlgorithmVersion"), v39, v40);
  }
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3;
  uint64_t v4;
  NSDate *fStartDate;
  unint64_t fRecordId;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  _OWORD v22[5];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  fRecordId = self->fRecordId;
  fStartDate = self->fStartDate;
  *(_QWORD *)&v23 = fRecordId;
  objc_msgSend_timeIntervalSinceReferenceDate(fStartDate, a2, (uint64_t)a3, v3, v4);
  *((_QWORD *)&v23 + 1) = v9;
  v24 = 0uLL;
  v25 = *(_OWORD *)&self->fMeanMaxMets;
  LODWORD(v26) = self->fHardwareType;
  BYTE4(v26) = self->fBetaBlockerUse;
  DWORD2(v26) = self->fAlgorithmVersion;
  v27 = 0uLL;
  objc_msgSend_getUUIDBytes_(self->fSessionId, v10, (uint64_t)&v24, v11, v12);
  v13 = (void *)objc_opt_class();
  v17 = (void *)objc_msgSend_allocWithZone_(v13, v14, (uint64_t)a3, v15, v16);
  v22[2] = v25;
  v22[3] = v26;
  v22[4] = v27;
  v22[0] = v23;
  v22[1] = v24;
  return (id)objc_msgSend_initWithSample_(v17, v18, (uint64_t)v22, v19, v20);
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
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;

  objc_msgSend_encodeInteger_forKey_(a3, a2, self->fRecordId, (uint64_t)CFSTR("kCMCardioFitnessInputsSessionMetricsCodingKeyRecordId"), v3);
  objc_msgSend_encodeObject_forKey_(a3, v6, (uint64_t)self->fStartDate, (uint64_t)CFSTR("kCMCardioFitnessInputsSessionMetricsCodingKeyStartDate"), v7);
  objc_msgSend_encodeObject_forKey_(a3, v8, (uint64_t)self->fSessionId, (uint64_t)CFSTR("kCMCardioFitnessInputsSessionMetricsCodingKeySessionId"), v9);
  objc_msgSend_encodeDouble_forKey_(a3, v10, (uint64_t)CFSTR("kCMCardioFitnessInputsSessionMetricsCodingKeyMeanMaxMets"), v11, v12, self->fMeanMaxMets);
  objc_msgSend_encodeDouble_forKey_(a3, v13, (uint64_t)CFSTR("kCMCardioFitnessInputsSessionMetricsCodingKeyPrior"), v14, v15, self->fPrior);
  objc_msgSend_encodeInteger_forKey_(a3, v16, self->fHardwareType, (uint64_t)CFSTR("kCMCardioFitnessInputsSessionMetricsCodingKeyHardwareType"), v17);
  objc_msgSend_encodeBool_forKey_(a3, v18, self->fBetaBlockerUse, (uint64_t)CFSTR("kCMCardioFitnessInputsSessionMetricsCodingKeyBetaBlockerUse"), v19);
  objc_msgSend_encodeInteger_forKey_(a3, v20, self->fAlgorithmVersion, (uint64_t)CFSTR("kCMCardioFitnessInputsSessionMetricsCodingKeyAlgorithmVersion"), v21);
}

- (BOOL)isEqual:(id)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *started;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  int isEqual;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  double v45;
  double v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  double v55;
  double v56;
  double v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  double v66;
  int v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  int v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_13;
  v9 = objc_msgSend_recordId(self, v5, v6, v7, v8);
  if (v9 != objc_msgSend_recordId(a3, v10, v11, v12, v13))
    goto LABEL_13;
  if (!objc_msgSend_startDate(self, v14, v15, v16, v17) && !objc_msgSend_startDate(a3, v18, v19, v20, v21)
    || (started = (void *)objc_msgSend_startDate(self, v18, v19, v20, v21),
        v27 = objc_msgSend_startDate(a3, v23, v24, v25, v26),
        (isEqual = objc_msgSend_isEqualToDate_(started, v28, v27, v29, v30)) != 0))
  {
    if (!objc_msgSend_sessionId(self, v18, v19, v20, v21) && !objc_msgSend_sessionId(a3, v32, v33, v34, v35)
      || (v36 = (void *)objc_msgSend_sessionId(self, v32, v33, v34, v35),
          v41 = objc_msgSend_sessionId(a3, v37, v38, v39, v40),
          (isEqual = objc_msgSend_isEqual_(v36, v42, v41, v43, v44)) != 0))
    {
      objc_msgSend_meanMaxMets(self, v32, v33, v34, v35);
      v46 = v45;
      objc_msgSend_meanMaxMets(a3, v47, v48, v49, v50);
      if (v46 != v55
        || (objc_msgSend_prior(self, v51, v52, v53, v54),
            v57 = v56,
            objc_msgSend_prior(a3, v58, v59, v60, v61),
            v57 != v66)
        || (v67 = objc_msgSend_hardwareType(self, v62, v63, v64, v65),
            v67 != objc_msgSend_hardwareType(a3, v68, v69, v70, v71))
        || (v76 = objc_msgSend_betaBlockerUse(self, v72, v73, v74, v75),
            v76 != objc_msgSend_betaBlockerUse(a3, v77, v78, v79, v80)))
      {
LABEL_13:
        LOBYTE(isEqual) = 0;
        return isEqual;
      }
      v85 = objc_msgSend_algorithmVersion(self, v81, v82, v83, v84);
      LOBYTE(isEqual) = v85 == objc_msgSend_algorithmVersion(a3, v86, v87, v88, v89);
    }
  }
  return isEqual;
}

- (unint64_t)recordId
{
  return self->fRecordId;
}

- (NSDate)startDate
{
  return self->fStartDate;
}

- (NSUUID)sessionId
{
  return self->fSessionId;
}

- (double)meanMaxMets
{
  return self->fMeanMaxMets;
}

- (double)prior
{
  return self->fPrior;
}

- (unsigned)hardwareType
{
  return self->fHardwareType;
}

- (BOOL)betaBlockerUse
{
  return self->fBetaBlockerUse;
}

- (int64_t)algorithmVersion
{
  return self->fAlgorithmVersion;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t started;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unsigned int v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v10 = objc_msgSend_recordId(self, v6, v7, v8, v9);
  started = objc_msgSend_startDate(self, v11, v12, v13, v14);
  v20 = (void *)objc_msgSend_sessionId(self, v16, v17, v18, v19);
  v25 = objc_msgSend_UUIDString(v20, v21, v22, v23, v24);
  objc_msgSend_meanMaxMets(self, v26, v27, v28, v29);
  v31 = v30;
  objc_msgSend_prior(self, v32, v33, v34, v35);
  v37 = v36;
  v42 = objc_msgSend_hardwareType(self, v38, v39, v40, v41);
  v47 = objc_msgSend_betaBlockerUse(self, v43, v44, v45, v46);
  v52 = objc_msgSend_algorithmVersion(self, v48, v49, v50, v51);
  return (NSString *)objc_msgSend_stringWithFormat_(v3, v53, (uint64_t)CFSTR("%@, <recordId, %lu, startDate, %@, sessionId, %@, meanMaxMets, %f, prior, %f, hardwareType, %d, betaBlockerUse, %d, algorithmVersion, %ld>"), v54, v55, v5, v10, started, v25, v31, v37, v42, v47, v52);
}

+ (VO2MaxSessionAttributes)inputFromPreparedStatement:(SEL)a3
{
  VO2MaxSessionAttributes *v5;
  double v6;
  const unsigned __int8 *v7;

  v5 = retstr;
  retstr->var0 = sqlite3_column_int(a4, 0);
  v6 = sqlite3_column_double(a4, 1);
  *(_QWORD *)v5->var2 = 0;
  v5 = (VO2MaxSessionAttributes *)((char *)v5 + 16);
  *(double *)&v5[-1].var9 = v6;
  v5->var1 = 0.0;
  *(double *)v5->var2 = sqlite3_column_double(a4, 3);
  *(double *)&v5->var2[8] = sqlite3_column_double(a4, 4);
  LODWORD(v5->var3) = sqlite3_column_int(a4, 5);
  BYTE4(v5->var3) = sqlite3_column_int(a4, 6) != 0;
  LODWORD(v5->var4) = sqlite3_column_int(a4, 7);
  *(_QWORD *)&v5->var5 = 0;
  *(_QWORD *)&v5->var7 = 0;
  v7 = sqlite3_column_text(a4, 2);
  return (VO2MaxSessionAttributes *)uuid_parse((const char *)v7, (unsigned __int8 *)v5);
}

- (id)binarySampleRepresentation
{
  void *v3;
  const char *v4;
  id v5;

  v3 = (void *)MEMORY[0x194001B4C](self, a2);
  v5 = (id)objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E0CB36F8], v4, (uint64_t)self, 1, 0);
  objc_autoreleasePoolPop(v3);
  return v5;
}

- (CMCardioFitnessInputsSessionMetrics)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5
{
  uint64_t v5;
  CMCardioFitnessInputsSessionMetrics *v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  objc_super v15;

  if (objc_msgSend_length(a3, a2, (uint64_t)a3, (uint64_t)a4, v5, a5))
  {
    v15.receiver = self;
    v15.super_class = (Class)CMCardioFitnessInputsSessionMetrics;
    v8 = -[CMCardioFitnessInputsSessionMetrics init](&v15, sel_init);
    if (v8)
    {
      v9 = (void *)MEMORY[0x1E0CB3710];
      v10 = objc_opt_class();
      v12 = objc_msgSend_unarchivedObjectOfClass_fromData_error_(v9, v11, v10, (uint64_t)a3, 0);
      if (v12)
      {
        v13 = (void *)v12;

        return (CMCardioFitnessInputsSessionMetrics *)v13;
      }
    }
  }
  else
  {

    return 0;
  }
  return v8;
}

- (id)sr_dictionaryRepresentation
{
  return (id)MEMORY[0x1E0C9AA70];
}

@end
