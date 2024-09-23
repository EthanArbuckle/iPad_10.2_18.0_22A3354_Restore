@implementation CMHistoricalMobilitySamples

- (CMHistoricalMobilitySamples)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMHistoricalMobilitySamples;
  return -[CMHistoricalMobilitySamples init](&v3, sel_init);
}

- (void)dealloc
{
  NSArray *walkingBoutMobility;
  NSArray *strideCalEntries;
  NSArray *predictedDistanceBouts;
  NSArray *predictedDistanceBoutsMobilityCalibration;
  NSArray *gaitMetrics;
  objc_super v8;

  walkingBoutMobility = self->_walkingBoutMobility;
  if (walkingBoutMobility)

  strideCalEntries = self->_strideCalEntries;
  if (strideCalEntries)

  predictedDistanceBouts = self->_predictedDistanceBouts;
  if (predictedDistanceBouts)

  predictedDistanceBoutsMobilityCalibration = self->_predictedDistanceBoutsMobilityCalibration;
  if (predictedDistanceBoutsMobilityCalibration)

  gaitMetrics = self->_gaitMetrics;
  if (gaitMetrics)

  v8.receiver = self;
  v8.super_class = (Class)CMHistoricalMobilitySamples;
  -[CMHistoricalMobilitySamples dealloc](&v8, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
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

  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_walkingBoutMobility, (uint64_t)CFSTR("kCMHistoricalMobilitySamplesCodingKeyWalkingBoutMobility"), v3);
  objc_msgSend_encodeObject_forKey_(a3, v6, (uint64_t)self->_strideCalEntries, (uint64_t)CFSTR("kCMHistoricalMobilitySamplesCodingKeyStrideCalEntries"), v7);
  objc_msgSend_encodeObject_forKey_(a3, v8, (uint64_t)self->_predictedDistanceBouts, (uint64_t)CFSTR("kCMHistoricalMobilitySamplesCodingKeyPredictedDistanceBouts"), v9);
  objc_msgSend_encodeObject_forKey_(a3, v10, (uint64_t)self->_predictedDistanceBoutsMobilityCalibration, (uint64_t)CFSTR("kCMHistoricalMobilitySamplesCodingKeyPredictedDistanceBoutsMobilityCalibration"), v11);
  objc_msgSend_encodeObject_forKey_(a3, v12, (uint64_t)self->_gaitMetrics, (uint64_t)CFSTR("kCMHistoricalMobilitySamplesCodingKeyGaitMetrics"), v13);
}

- (CMHistoricalMobilitySamples)initWithCoder:(id)a3
{
  CMHistoricalMobilitySamples *v4;
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
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)CMHistoricalMobilitySamples;
  v4 = -[CMHistoricalMobilitySamples init](&v21, sel_init);
  if (v4)
  {
    v5 = objc_opt_class();
    v4->_walkingBoutMobility = (NSArray *)(id)objc_msgSend_decodeArrayOfObjectsOfClass_forKey_(a3, v6, v5, (uint64_t)CFSTR("kCMHistoricalMobilitySamplesCodingKeyWalkingBoutMobility"), v7);
    v8 = objc_opt_class();
    v4->_strideCalEntries = (NSArray *)(id)objc_msgSend_decodeArrayOfObjectsOfClass_forKey_(a3, v9, v8, (uint64_t)CFSTR("kCMHistoricalMobilitySamplesCodingKeyStrideCalEntries"), v10);
    v11 = objc_opt_class();
    v4->_predictedDistanceBoutsMobilityCalibration = (NSArray *)(id)objc_msgSend_decodeArrayOfObjectsOfClass_forKey_(a3, v12, v11, (uint64_t)CFSTR("kCMHistoricalMobilitySamplesCodingKeyPredictedDistanceBoutsMobilityCalibration"), v13);
    v14 = objc_opt_class();
    v4->_predictedDistanceBouts = (NSArray *)(id)objc_msgSend_decodeArrayOfObjectsOfClass_forKey_(a3, v15, v14, (uint64_t)CFSTR("kCMHistoricalMobilitySamplesCodingKeyPredictedDistanceBouts"), v16);
    v17 = objc_opt_class();
    v4->_gaitMetrics = (NSArray *)(id)objc_msgSend_decodeArrayOfObjectsOfClass_forKey_(a3, v18, v17, (uint64_t)CFSTR("kCMHistoricalMobilitySamplesCodingKeyGaitMetrics"), v19);
  }
  return v4;
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
  _QWORD *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
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

  v5 = (void *)objc_opt_class();
  v9 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8);
  v14 = (_QWORD *)objc_msgSend_init(v9, v10, v11, v12, v13);
  v14[1] = objc_msgSend_copy(self->_walkingBoutMobility, v15, v16, v17, v18);
  v14[2] = objc_msgSend_copy(self->_strideCalEntries, v19, v20, v21, v22);
  v14[4] = objc_msgSend_copy(self->_predictedDistanceBouts, v23, v24, v25, v26);
  v14[3] = objc_msgSend_copy(self->_predictedDistanceBoutsMobilityCalibration, v27, v28, v29, v30);
  v14[5] = objc_msgSend_copy(self->_gaitMetrics, v31, v32, v33, v34);
  return v14;
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
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
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
  const char *v31;
  uint64_t v32;
  uint64_t v33;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v10 = objc_msgSend_walkingBoutMobility(self, v6, v7, v8, v9);
  v15 = objc_msgSend_strideCalEntries(self, v11, v12, v13, v14);
  v20 = objc_msgSend_predictedDistanceBouts(self, v16, v17, v18, v19);
  v25 = objc_msgSend_predictedDistanceBoutsMobilityCalibration(self, v21, v22, v23, v24);
  v30 = objc_msgSend_gaitMetrics(self, v26, v27, v28, v29);
  return (NSString *)objc_msgSend_stringWithFormat_(v3, v31, (uint64_t)CFSTR("%@, <walkingBoutMobility, %@, strideCalEntries, %@, predictedDistanceBouts, %@, predictedDistanceBoutsMobilityCalibration, %@, gaitMetrics, %@>"), v32, v33, v5, v10, v15, v20, v25, v30);
}

- (BOOL)isEqual:(id)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v9 = (void *)objc_msgSend_walkingBoutMobility(self, v5, v6, v7, v8);
  v14 = objc_msgSend_walkingBoutMobility(a3, v10, v11, v12, v13);
  if (!objc_msgSend_isEqualToArray_(v9, v15, v14, v16, v17))
    return 0;
  v22 = (void *)objc_msgSend_strideCalEntries(self, v18, v19, v20, v21);
  v27 = objc_msgSend_strideCalEntries(a3, v23, v24, v25, v26);
  if (!objc_msgSend_isEqualToArray_(v22, v28, v27, v29, v30))
    return 0;
  v35 = (void *)objc_msgSend_predictedDistanceBouts(self, v31, v32, v33, v34);
  v40 = objc_msgSend_predictedDistanceBouts(a3, v36, v37, v38, v39);
  if (!objc_msgSend_isEqualToArray_(v35, v41, v40, v42, v43))
    return 0;
  v48 = (void *)objc_msgSend_predictedDistanceBoutsMobilityCalibration(self, v44, v45, v46, v47);
  v53 = objc_msgSend_predictedDistanceBoutsMobilityCalibration(a3, v49, v50, v51, v52);
  if (!objc_msgSend_isEqualToArray_(v48, v54, v53, v55, v56))
    return 0;
  v61 = (void *)objc_msgSend_gaitMetrics(self, v57, v58, v59, v60);
  v66 = objc_msgSend_gaitMetrics(a3, v62, v63, v64, v65);
  return objc_msgSend_isEqualToArray_(v61, v67, v66, v68, v69);
}

- (NSArray)walkingBoutMobility
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setWalkingBoutMobility:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSArray)strideCalEntries
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setStrideCalEntries:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSArray)predictedDistanceBoutsMobilityCalibration
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPredictedDistanceBoutsMobilityCalibration:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSArray)predictedDistanceBouts
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPredictedDistanceBouts:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSArray)gaitMetrics
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setGaitMetrics:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (id)binarySampleRepresentation
{
  void *v2;
  NSObject *v3;
  objc_class *v4;
  NSString *v5;
  objc_class *v7;
  NSString *v8;
  char *v9;
  uint64_t v10;
  int v11;
  NSString *v12;
  __int16 v13;
  uint64_t v14;
  uint8_t buf[4];
  NSString *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  v2 = (void *)objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E0CB36F8], a2, (uint64_t)self, 1, (uint64_t)&v10);
  if (v10)
  {
    if (qword_1EE16D938 != -1)
      dispatch_once(&qword_1EE16D938, &unk_1E29540E8);
    v3 = qword_1EE16D940;
    if (os_log_type_enabled((os_log_t)qword_1EE16D940, OS_LOG_TYPE_ERROR))
    {
      v4 = (objc_class *)objc_opt_class();
      v5 = NSStringFromClass(v4);
      *(_DWORD *)buf = 138543618;
      v16 = v5;
      v17 = 2114;
      v18 = v10;
      _os_log_impl(&dword_18F1DC000, v3, OS_LOG_TYPE_ERROR, "Failed to archive %{public}@ object: %{public}@", buf, 0x16u);
    }
    if (sub_18F1FCA08(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D938 != -1)
        dispatch_once(&qword_1EE16D938, &unk_1E29540E8);
      v7 = (objc_class *)objc_opt_class();
      v8 = NSStringFromClass(v7);
      v11 = 138543618;
      v12 = v8;
      v13 = 2114;
      v14 = v10;
      v9 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 0, "-[CMHistoricalMobilitySamples(SensorKit) binarySampleRepresentation]", "CoreLocation: %s\n", v9);
      if (v9 != (char *)buf)
        free(v9);
    }
  }
  return v2;
}

- (CMHistoricalMobilitySamples)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5
{
  uint64_t v5;
  void *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  NSObject *v12;
  objc_class *v13;
  NSString *v14;
  void *v16;
  objc_class *v17;
  NSString *v18;
  char *v19;
  uint64_t v20;
  objc_super v21;
  int v22;
  NSString *v23;
  __int16 v24;
  uint64_t v25;
  uint8_t buf[4];
  NSString *v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend_length(a3, a2, (uint64_t)a3, (uint64_t)a4, v5, a5))
  {
LABEL_9:

    return 0;
  }
  v21.receiver = self;
  v21.super_class = (Class)CMHistoricalMobilitySamples;
  self = -[CMHistoricalMobilitySamples init](&v21, sel_init);
  if (self)
  {
    v20 = 0;
    v8 = (void *)MEMORY[0x1E0CB3710];
    v9 = objc_opt_class();
    v11 = objc_msgSend_unarchivedObjectOfClass_fromData_error_(v8, v10, v9, (uint64_t)a3, (uint64_t)&v20);
    if (v20)
    {
      if (qword_1EE16D938 != -1)
        dispatch_once(&qword_1EE16D938, &unk_1E29540E8);
      v12 = qword_1EE16D940;
      if (os_log_type_enabled((os_log_t)qword_1EE16D940, OS_LOG_TYPE_ERROR))
      {
        v13 = (objc_class *)objc_opt_class();
        v14 = NSStringFromClass(v13);
        *(_DWORD *)buf = 138543618;
        v27 = v14;
        v28 = 2114;
        v29 = v20;
        _os_log_impl(&dword_18F1DC000, v12, OS_LOG_TYPE_ERROR, "Failed to unarchive %{public}@: %{public}@", buf, 0x16u);
      }
      if (sub_18F1FCA08(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1EE16D938 != -1)
          dispatch_once(&qword_1EE16D938, &unk_1E29540E8);
        v17 = (objc_class *)objc_opt_class();
        v18 = NSStringFromClass(v17);
        v22 = 138543618;
        v23 = v18;
        v24 = 2114;
        v25 = v20;
        v19 = (char *)_os_log_send_and_compose_impl();
        sub_18F419700("Generic", 1, 0, 0, "-[CMHistoricalMobilitySamples(SensorKit) initWithBinarySampleRepresentation:metadata:timestamp:]", "CoreLocation: %s\n", v19);
        if (v19 != (char *)buf)
          free(v19);
      }
      goto LABEL_9;
    }
    v16 = (void *)v11;
    if (v11)
    {

      return (CMHistoricalMobilitySamples *)v16;
    }
  }
  return self;
}

- (id)sr_dictionaryRepresentation
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  const char *v93;
  uint64_t v95;
  uint64_t v96;
  void (*v97)(uint64_t, void *);
  void *v98;
  uint64_t v99;
  _QWORD v100[5];
  _QWORD v101[6];

  v101[5] = *MEMORY[0x1E0C80C00];
  v100[0] = CFSTR("walkingBoutMobility");
  v6 = (void *)objc_msgSend_walkingBoutMobility(self, a2, v2, v3, v4);
  v7 = (void *)MEMORY[0x1E0C99DE8];
  v12 = objc_msgSend_count(v6, v8, v9, v10, v11);
  v16 = objc_msgSend_arrayWithCapacity_(v7, v13, v12, v14, v15);
  v17 = MEMORY[0x1E0C809B0];
  v95 = MEMORY[0x1E0C809B0];
  v96 = 3221225472;
  v97 = sub_18F49B0B4;
  v98 = &unk_1E2958D80;
  v99 = v16;
  objc_msgSend_enumerateObjectsUsingBlock_(v6, v18, (uint64_t)&v95, v19, v20);
  v101[0] = v16;
  v100[1] = CFSTR("strideCalEntries");
  v25 = (void *)objc_msgSend_strideCalEntries(self, v21, v22, v23, v24);
  v26 = (void *)MEMORY[0x1E0C99DE8];
  v31 = objc_msgSend_count(v25, v27, v28, v29, v30);
  v35 = objc_msgSend_arrayWithCapacity_(v26, v32, v31, v33, v34);
  v95 = v17;
  v96 = 3221225472;
  v97 = sub_18F49B0B4;
  v98 = &unk_1E2958D80;
  v99 = v35;
  objc_msgSend_enumerateObjectsUsingBlock_(v25, v36, (uint64_t)&v95, v37, v38);
  v101[1] = v35;
  v100[2] = CFSTR("predictedDistanceBoutsMobilityCalibration");
  v43 = (void *)objc_msgSend_predictedDistanceBoutsMobilityCalibration(self, v39, v40, v41, v42);
  v44 = (void *)MEMORY[0x1E0C99DE8];
  v49 = objc_msgSend_count(v43, v45, v46, v47, v48);
  v53 = objc_msgSend_arrayWithCapacity_(v44, v50, v49, v51, v52);
  v95 = v17;
  v96 = 3221225472;
  v97 = sub_18F49B0B4;
  v98 = &unk_1E2958D80;
  v99 = v53;
  objc_msgSend_enumerateObjectsUsingBlock_(v43, v54, (uint64_t)&v95, v55, v56);
  v101[2] = v53;
  v100[3] = CFSTR("predictedDistanceBouts");
  v61 = (void *)objc_msgSend_predictedDistanceBouts(self, v57, v58, v59, v60);
  v62 = (void *)MEMORY[0x1E0C99DE8];
  v67 = objc_msgSend_count(v61, v63, v64, v65, v66);
  v71 = objc_msgSend_arrayWithCapacity_(v62, v68, v67, v69, v70);
  v95 = v17;
  v96 = 3221225472;
  v97 = sub_18F49B0B4;
  v98 = &unk_1E2958D80;
  v99 = v71;
  objc_msgSend_enumerateObjectsUsingBlock_(v61, v72, (uint64_t)&v95, v73, v74);
  v101[3] = v71;
  v100[4] = CFSTR("gaitMetrics");
  v79 = (void *)objc_msgSend_gaitMetrics(self, v75, v76, v77, v78);
  v80 = (void *)MEMORY[0x1E0C99DE8];
  v85 = objc_msgSend_count(v79, v81, v82, v83, v84);
  v89 = objc_msgSend_arrayWithCapacity_(v80, v86, v85, v87, v88);
  v95 = v17;
  v96 = 3221225472;
  v97 = sub_18F49B0B4;
  v98 = &unk_1E2958D80;
  v99 = v89;
  objc_msgSend_enumerateObjectsUsingBlock_(v79, v90, (uint64_t)&v95, v91, v92);
  v101[4] = v89;
  return (id)objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v93, (uint64_t)v101, (uint64_t)v100, 5);
}

@end
