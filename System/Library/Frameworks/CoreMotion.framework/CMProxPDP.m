@implementation CMProxPDP

- (CMProxPDP)initWithTimestamp:(double)a3 intensity:(float)a4 intensityCalDelta:(float)a5 intensityBaselineDelta:(float)a6 ambient:(float)a7 pocketProbability:(float)a8 baselineConfidence:(float)a9 rxNtcC:(float)a10 scanFlags:(BOOL)a11 pocketFlag:(BOOL)a12
{
  _BOOL8 v12;
  _BOOL8 v13;
  CMProxPDP *v22;
  id v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  double v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  double v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  double v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  double v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  double v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  double v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  id v64;
  double v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  id v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  id v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  objc_super v79;

  v12 = a12;
  v13 = a11;
  v79.receiver = self;
  v79.super_class = (Class)CMProxPDP;
  v22 = -[CMProxPDP init](&v79, sel_init);
  if (v22)
  {
    v23 = objc_alloc(MEMORY[0x1E0CB37E8]);
    v22->fTimestamp = (NSNumber *)objc_msgSend_initWithDouble_(v23, v24, v25, v26, v27, a3);
    v28 = objc_alloc(MEMORY[0x1E0CB37E8]);
    *(float *)&v29 = a4;
    v22->fIntensity = (NSNumber *)objc_msgSend_initWithFloat_(v28, v30, v31, v32, v33, v29);
    v34 = objc_alloc(MEMORY[0x1E0CB37E8]);
    *(float *)&v35 = a5;
    v22->fIntensityCalDelta = (NSNumber *)objc_msgSend_initWithFloat_(v34, v36, v37, v38, v39, v35);
    v40 = objc_alloc(MEMORY[0x1E0CB37E8]);
    *(float *)&v41 = a6;
    v22->fIntensityBaselineDelta = (NSNumber *)objc_msgSend_initWithFloat_(v40, v42, v43, v44, v45, v41);
    v46 = objc_alloc(MEMORY[0x1E0CB37E8]);
    *(float *)&v47 = a7;
    v22->fAmbient = (NSNumber *)objc_msgSend_initWithFloat_(v46, v48, v49, v50, v51, v47);
    v52 = objc_alloc(MEMORY[0x1E0CB37E8]);
    *(float *)&v53 = a8;
    v22->fPocketProbability = (NSNumber *)objc_msgSend_initWithFloat_(v52, v54, v55, v56, v57, v53);
    v58 = objc_alloc(MEMORY[0x1E0CB37E8]);
    *(float *)&v59 = a9;
    v22->fBaselineConfidence = (NSNumber *)objc_msgSend_initWithFloat_(v58, v60, v61, v62, v63, v59);
    v64 = objc_alloc(MEMORY[0x1E0CB37E8]);
    *(float *)&v65 = a10;
    v22->fRxNtcC = (NSNumber *)objc_msgSend_initWithFloat_(v64, v66, v67, v68, v69, v65);
    v70 = objc_alloc(MEMORY[0x1E0CB37E8]);
    v22->fScanFlags = (NSNumber *)objc_msgSend_initWithBool_(v70, v71, v13, v72, v73);
    v74 = objc_alloc(MEMORY[0x1E0CB37E8]);
    v22->fPocketFlag = (NSNumber *)objc_msgSend_initWithBool_(v74, v75, v12, v76, v77);
  }
  return v22;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMProxPDP)initWithCoder:(id)a3
{
  CMProxPDP *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
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
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  objc_super v36;

  v36.receiver = self;
  v36.super_class = (Class)CMProxPDP;
  v4 = -[CMProxPDP init](&v36, sel_init);
  if (v4)
  {
    v5 = objc_opt_class();
    v4->fTimestamp = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, (uint64_t)CFSTR("kCMProxPDPTimestamp"), v7);
    v8 = objc_opt_class();
    v4->fIntensity = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v9, v8, (uint64_t)CFSTR("kCMProxPDPIntensity"), v10);
    v11 = objc_opt_class();
    v4->fIntensityCalDelta = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v12, v11, (uint64_t)CFSTR("kCMProxPDPIntensityCalDelta"), v13);
    v14 = objc_opt_class();
    v4->fIntensityBaselineDelta = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v15, v14, (uint64_t)CFSTR("kCMProxPDPIntensityBaselineDelta"), v16);
    v17 = objc_opt_class();
    v4->fAmbient = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v18, v17, (uint64_t)CFSTR("kCMProxPDPAmbient"), v19);
    v20 = objc_opt_class();
    v4->fPocketProbability = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v21, v20, (uint64_t)CFSTR("kCMProxPDPPocketProbability"), v22);
    v23 = objc_opt_class();
    v4->fBaselineConfidence = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v24, v23, (uint64_t)CFSTR("kCMProxPDPBaselineConfidence"), v25);
    v26 = objc_opt_class();
    v4->fRxNtcC = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v27, v26, (uint64_t)CFSTR("kCMProxPDPRxNtcC"), v28);
    v29 = objc_opt_class();
    v4->fScanFlags = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v30, v29, (uint64_t)CFSTR("kCMProxPDPScanFlags"), v31);
    v32 = objc_opt_class();
    v4->fPocketFlag = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v33, v32, (uint64_t)CFSTR("kCMProxPDPPocketFlag"), v34);
  }
  return v4;
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
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;

  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->fTimestamp, (uint64_t)CFSTR("kCMProxPDPTimestamp"), v3);
  objc_msgSend_encodeObject_forKey_(a3, v6, (uint64_t)self->fIntensity, (uint64_t)CFSTR("kCMProxPDPIntensity"), v7);
  objc_msgSend_encodeObject_forKey_(a3, v8, (uint64_t)self->fIntensityCalDelta, (uint64_t)CFSTR("kCMProxPDPIntensityCalDelta"), v9);
  objc_msgSend_encodeObject_forKey_(a3, v10, (uint64_t)self->fIntensityBaselineDelta, (uint64_t)CFSTR("kCMProxPDPIntensityBaselineDelta"), v11);
  objc_msgSend_encodeObject_forKey_(a3, v12, (uint64_t)self->fAmbient, (uint64_t)CFSTR("kCMProxPDPAmbient"), v13);
  objc_msgSend_encodeObject_forKey_(a3, v14, (uint64_t)self->fPocketProbability, (uint64_t)CFSTR("kCMProxPDPPocketProbability"), v15);
  objc_msgSend_encodeObject_forKey_(a3, v16, (uint64_t)self->fBaselineConfidence, (uint64_t)CFSTR("kCMProxPDPBaselineConfidence"), v17);
  objc_msgSend_encodeObject_forKey_(a3, v18, (uint64_t)self->fRxNtcC, (uint64_t)CFSTR("kCMProxPDPRxNtcC"), v19);
  objc_msgSend_encodeObject_forKey_(a3, v20, (uint64_t)self->fScanFlags, (uint64_t)CFSTR("kCMProxPDPScanFlags"), v21);
  objc_msgSend_encodeObject_forKey_(a3, v22, (uint64_t)self->fPocketFlag, (uint64_t)CFSTR("kCMProxPDPPocketFlag"), v23);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;

  v5 = (void *)objc_opt_class();
  v9 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8);
  v18 = (_QWORD *)objc_msgSend_init(v9, v10, v11, v12, v13);
  if (v18)
  {
    v18[1] = objc_msgSend_copy(self->fTimestamp, v14, v15, v16, v17);
    v18[2] = objc_msgSend_copy(self->fIntensity, v19, v20, v21, v22);
    v18[3] = objc_msgSend_copy(self->fIntensityCalDelta, v23, v24, v25, v26);
    v18[4] = objc_msgSend_copy(self->fIntensityBaselineDelta, v27, v28, v29, v30);
    v18[5] = objc_msgSend_copy(self->fAmbient, v31, v32, v33, v34);
    v18[6] = objc_msgSend_copy(self->fPocketProbability, v35, v36, v37, v38);
    v18[7] = objc_msgSend_copy(self->fBaselineConfidence, v39, v40, v41, v42);
    v18[8] = objc_msgSend_copy(self->fRxNtcC, v43, v44, v45, v46);
    v18[9] = objc_msgSend_copy(self->fScanFlags, v47, v48, v49, v50);
    v18[10] = objc_msgSend_copy(self->fPocketFlag, v51, v52, v53, v54);
  }
  return v18;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMProxPDP;
  -[CMProxPDP dealloc](&v3, sel_dealloc);
}

- (NSNumber)timestamp
{
  return self->fTimestamp;
}

- (NSNumber)intensity
{
  return self->fIntensity;
}

- (NSNumber)intensityCalDelta
{
  return self->fIntensityCalDelta;
}

- (NSNumber)intensityBaselineDelta
{
  return self->fIntensityBaselineDelta;
}

- (NSNumber)ambient
{
  return self->fAmbient;
}

- (NSNumber)pocketProbability
{
  return self->fPocketProbability;
}

- (NSNumber)baselineConfidence
{
  return self->fBaselineConfidence;
}

- (NSNumber)rxNtcC
{
  return self->fRxNtcC;
}

- (NSNumber)scanFlags
{
  return self->fScanFlags;
}

- (NSNumber)pocketFlag
{
  return self->fPocketFlag;
}

- (id)description
{
  objc_class *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  NSString *v58;
  void *v59;

  v59 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  v58 = NSStringFromClass(v3);
  v8 = objc_msgSend_timestamp(self, v4, v5, v6, v7);
  v13 = objc_msgSend_intensity(self, v9, v10, v11, v12);
  v18 = objc_msgSend_intensityCalDelta(self, v14, v15, v16, v17);
  v23 = objc_msgSend_intensityBaselineDelta(self, v19, v20, v21, v22);
  v28 = objc_msgSend_ambient(self, v24, v25, v26, v27);
  v33 = objc_msgSend_pocketProbability(self, v29, v30, v31, v32);
  v38 = objc_msgSend_baselineConfidence(self, v34, v35, v36, v37);
  v43 = objc_msgSend_rxNtcC(self, v39, v40, v41, v42);
  v48 = objc_msgSend_scanFlags(self, v44, v45, v46, v47);
  v53 = objc_msgSend_pocketFlag(self, v49, v50, v51, v52);
  return (id)objc_msgSend_stringWithFormat_(v59, v54, (uint64_t)CFSTR("%@, <timestamp %@, intensity %@, intensityCalDelta %@, intensityBaselineDelta %@, ambient %@, pocketProbability %@, baselineConfidence %@, rxNtcC %@, scanFlags %@, pocketFlag %@>"), v55, v56, v58, v8, v13, v18, v23, v28, v33, v38, v43, v48, v53);
}

@end
