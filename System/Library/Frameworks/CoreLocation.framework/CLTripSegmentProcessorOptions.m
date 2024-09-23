@implementation CLTripSegmentProcessorOptions

- (CLTripSegmentProcessorOptions)init
{
  CLTripSegmentProcessorOptions *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLTripSegmentProcessorOptions;
  result = -[CLTripSegmentProcessorOptions init](&v3, sel_init);
  if (result)
  {
    result->_shouldRecordDataInFileForReplay = 1;
    *(_DWORD *)&result->_runLinearInterpolator = 16843009;
    *(_DWORD *)&result->_createSparseDataFromOneHzData = 16842752;
    result->_timeBetweenReconstructedPointsSeconds = 1.0;
    result->_tripSegmentRecorderLoggingDirectory = (NSString *)CFSTR("/var/mobile/Library/Caches/com.apple.routined/tripSegments/");
  }
  return result;
}

- (void)setRunLinearInterpolator:(BOOL)a3
{
  self->_runLinearInterpolator = a3;
}

- (void)setRunInertialIntegrator:(BOOL)a3
{
  self->_runInertialIntegrator = a3;
}

- (void)setRunMapIntegrator:(BOOL)a3
{
  self->_runMapIntegrator = a3;
}

- (void)setUseXPCService:(BOOL)a3
{
  self->_useXPCServiceForMapQuery = a3;
}

- (void)setshouldRecordDataInFileForReplay:(BOOL)a3
{
  self->_shouldRecordDataInFileForReplay = a3;
}

- (void)setCreateSparseDataFromOneHzData:(BOOL)a3
{
  self->_createSparseDataFromOneHzData = a3;
}

- (void)setSimulatedSparseProcessing:(BOOL)a3
{
  self->_isSimulatedSparseProcessing = a3;
}

- (void)setNetworkAccessAllowed:(BOOL)a3
{
  self->_isNetworkAccessAllowed = a3;
}

- (void)setTimeBetweenReconstructedPointsSeconds:(double)a3
{
  self->_timeBetweenReconstructedPointsSeconds = a3;
}

- (void)setUseParticleMapMatcherForSnappingInMapIntegrator:(BOOL)a3
{
  self->_useParticleMapMatcherForSnappingInMapIntegrator = a3;
}

- (void)setTripSegmentRecorderLoggingDirectory:(id)a3
{
  self->_tripSegmentRecorderLoggingDirectory = (NSString *)a3;
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
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t shouldRecordDataInFileForReplay;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t SparseDataFromOneHzData;
  const char *v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t isSimulatedSparseProcessing;
  const char *v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t isNetworkAccessAllowed;
  const char *v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;

  v5 = (void *)objc_opt_class();
  v8 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  v12 = (void *)objc_msgSend_init(v8, v9, v10, v11);
  v16 = objc_msgSend_runLinearInterpolator(self, v13, v14, v15);
  objc_msgSend_setRunLinearInterpolator_(v12, v17, v16, v18);
  v22 = objc_msgSend_runInertialIntegrator(self, v19, v20, v21);
  objc_msgSend_setRunInertialIntegrator_(v12, v23, v22, v24);
  v28 = objc_msgSend_runMapIntegrator(self, v25, v26, v27);
  objc_msgSend_setRunMapIntegrator_(v12, v29, v28, v30);
  v34 = objc_msgSend_useXPCServiceForMapQuery(self, v31, v32, v33);
  objc_msgSend_setUseXPCService_(v12, v35, v34, v36);
  shouldRecordDataInFileForReplay = objc_msgSend_shouldRecordDataInFileForReplay(self, v37, v38, v39);
  objc_msgSend_setshouldRecordDataInFileForReplay_(v12, v41, shouldRecordDataInFileForReplay, v42);
  SparseDataFromOneHzData = objc_msgSend_createSparseDataFromOneHzData(self, v43, v44, v45);
  objc_msgSend_setCreateSparseDataFromOneHzData_(v12, v47, SparseDataFromOneHzData, v48);
  isSimulatedSparseProcessing = objc_msgSend_isSimulatedSparseProcessing(self, v49, v50, v51);
  objc_msgSend_setSimulatedSparseProcessing_(v12, v53, isSimulatedSparseProcessing, v54);
  isNetworkAccessAllowed = objc_msgSend_isNetworkAccessAllowed(self, v55, v56, v57);
  objc_msgSend_setNetworkAccessAllowed_(v12, v59, isNetworkAccessAllowed, v60);
  objc_msgSend_timeBetweenReconstructedPointsSeconds(self, v61, v62, v63);
  objc_msgSend_setTimeBetweenReconstructedPointsSeconds_(v12, v64, v65, v66);
  v70 = objc_msgSend_useParticleMapMatcherForSnappingInMapIntegrator(self, v67, v68, v69);
  objc_msgSend_setUseParticleMapMatcherForSnappingInMapIntegrator_(v12, v71, v70, v72);
  v76 = objc_msgSend_tripSegmentRecorderLoggingDirectory(self, v73, v74, v75);
  objc_msgSend_setTripSegmentRecorderLoggingDirectory_(v12, v77, v76, v78);
  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CLTripSegmentProcessorOptions;
  -[CLTripSegmentProcessorOptions dealloc](&v2, sel_dealloc);
}

- (id)description
{
  void *v2;
  objc_class *v3;
  NSString *v4;
  const char *v5;
  uint64_t v6;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  return (id)objc_msgSend_stringWithFormat_(v2, v5, (uint64_t)CFSTR("%@"), v6, v4);
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
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
  uint64_t shouldRecordDataInFileForReplay;
  const char *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t SparseDataFromOneHzData;
  const char *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t isSimulatedSparseProcessing;
  const char *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t isNetworkAccessAllowed;
  const char *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;

  v6 = objc_msgSend_runLinearInterpolator(self, a2, (uint64_t)a3, v3);
  objc_msgSend_encodeBool_forKey_(a3, v7, v6, (uint64_t)CFSTR("runLinearInterpolator"));
  v11 = objc_msgSend_runInertialIntegrator(self, v8, v9, v10);
  objc_msgSend_encodeBool_forKey_(a3, v12, v11, (uint64_t)CFSTR("runInertialIntegrator"));
  v16 = objc_msgSend_runMapIntegrator(self, v13, v14, v15);
  objc_msgSend_encodeBool_forKey_(a3, v17, v16, (uint64_t)CFSTR("runMapIntegrator"));
  v21 = objc_msgSend_useXPCServiceForMapQuery(self, v18, v19, v20);
  objc_msgSend_encodeBool_forKey_(a3, v22, v21, (uint64_t)CFSTR("useXPCServiceForMapQuery"));
  shouldRecordDataInFileForReplay = objc_msgSend_shouldRecordDataInFileForReplay(self, v23, v24, v25);
  objc_msgSend_encodeBool_forKey_(a3, v27, shouldRecordDataInFileForReplay, (uint64_t)CFSTR("shouldRecordDataInFileForReplay"));
  SparseDataFromOneHzData = objc_msgSend_createSparseDataFromOneHzData(self, v28, v29, v30);
  objc_msgSend_encodeBool_forKey_(a3, v32, SparseDataFromOneHzData, (uint64_t)CFSTR("createSparseDataFromOneHzData"));
  isSimulatedSparseProcessing = objc_msgSend_isSimulatedSparseProcessing(self, v33, v34, v35);
  objc_msgSend_encodeBool_forKey_(a3, v37, isSimulatedSparseProcessing, (uint64_t)CFSTR("isSimulatedSparseProcessing"));
  isNetworkAccessAllowed = objc_msgSend_isNetworkAccessAllowed(self, v38, v39, v40);
  objc_msgSend_encodeBool_forKey_(a3, v42, isNetworkAccessAllowed, (uint64_t)CFSTR("isNetworkAccessAllowed"));
  objc_msgSend_timeBetweenReconstructedPointsSeconds(self, v43, v44, v45);
  objc_msgSend_encodeDouble_forKey_(a3, v46, (uint64_t)CFSTR("timeBetweenReconstructedPointsSeconds"), v47);
  v51 = objc_msgSend_useParticleMapMatcherForSnappingInMapIntegrator(self, v48, v49, v50);
  objc_msgSend_encodeBool_forKey_(a3, v52, v51, (uint64_t)CFSTR("useParticleMapMatcherForSnappingInMapIntegrator"));
  v56 = objc_msgSend_tripSegmentRecorderLoggingDirectory(self, v53, v54, v55);
  objc_msgSend_encodeObject_forKey_(a3, v57, v56, (uint64_t)CFSTR("tripSegmentRecorderLoggingDirectory"));
}

- (CLTripSegmentProcessorOptions)initWithCoder:(id)a3
{
  CLTripSegmentProcessorOptions *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
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
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;

  v4 = objc_alloc_init(CLTripSegmentProcessorOptions);
  v7 = objc_msgSend_decodeBoolForKey_(a3, v5, (uint64_t)CFSTR("runLinearInterpolator"), v6);
  objc_msgSend_setRunLinearInterpolator_(v4, v8, v7, v9);
  v12 = objc_msgSend_decodeBoolForKey_(a3, v10, (uint64_t)CFSTR("runInertialIntegrator"), v11);
  objc_msgSend_setRunInertialIntegrator_(v4, v13, v12, v14);
  v17 = objc_msgSend_decodeBoolForKey_(a3, v15, (uint64_t)CFSTR("runMapIntegrator"), v16);
  objc_msgSend_setRunMapIntegrator_(v4, v18, v17, v19);
  v22 = objc_msgSend_decodeBoolForKey_(a3, v20, (uint64_t)CFSTR("useXPCServiceForMapQuery"), v21);
  objc_msgSend_setUseXPCService_(v4, v23, v22, v24);
  v27 = objc_msgSend_decodeBoolForKey_(a3, v25, (uint64_t)CFSTR("shouldRecordDataInFileForReplay"), v26);
  objc_msgSend_setshouldRecordDataInFileForReplay_(v4, v28, v27, v29);
  v32 = objc_msgSend_decodeBoolForKey_(a3, v30, (uint64_t)CFSTR("createSparseDataFromOneHzData"), v31);
  objc_msgSend_setCreateSparseDataFromOneHzData_(v4, v33, v32, v34);
  v37 = objc_msgSend_decodeBoolForKey_(a3, v35, (uint64_t)CFSTR("isSimulatedSparseProcessing"), v36);
  objc_msgSend_setSimulatedSparseProcessing_(v4, v38, v37, v39);
  v42 = objc_msgSend_decodeBoolForKey_(a3, v40, (uint64_t)CFSTR("isNetworkAccessAllowed"), v41);
  objc_msgSend_setNetworkAccessAllowed_(v4, v43, v42, v44);
  objc_msgSend_decodeDoubleForKey_(a3, v45, (uint64_t)CFSTR("timeBetweenReconstructedPointsSeconds"), v46);
  objc_msgSend_setTimeBetweenReconstructedPointsSeconds_(v4, v47, v48, v49);
  v52 = objc_msgSend_decodeBoolForKey_(a3, v50, (uint64_t)CFSTR("useParticleMapMatcherForSnappingInMapIntegrator"), v51);
  objc_msgSend_setUseParticleMapMatcherForSnappingInMapIntegrator_(v4, v53, v52, v54);
  v55 = objc_opt_class();
  v57 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v56, v55, (uint64_t)CFSTR("tripSegmentRecorderLoggingDirectory"));
  objc_msgSend_setTripSegmentRecorderLoggingDirectory_(v4, v58, v57, v59);
  return v4;
}

- (BOOL)runLinearInterpolator
{
  return self->_runLinearInterpolator;
}

- (BOOL)runInertialIntegrator
{
  return self->_runInertialIntegrator;
}

- (BOOL)runMapIntegrator
{
  return self->_runMapIntegrator;
}

- (BOOL)useXPCServiceForMapQuery
{
  return self->_useXPCServiceForMapQuery;
}

- (BOOL)shouldRecordDataInFileForReplay
{
  return self->_shouldRecordDataInFileForReplay;
}

- (BOOL)createSparseDataFromOneHzData
{
  return self->_createSparseDataFromOneHzData;
}

- (BOOL)isSimulatedSparseProcessing
{
  return self->_isSimulatedSparseProcessing;
}

- (BOOL)isNetworkAccessAllowed
{
  return self->_isNetworkAccessAllowed;
}

- (double)timeBetweenReconstructedPointsSeconds
{
  return self->_timeBetweenReconstructedPointsSeconds;
}

- (BOOL)useParticleMapMatcherForSnappingInMapIntegrator
{
  return self->_useParticleMapMatcherForSnappingInMapIntegrator;
}

- (NSString)tripSegmentRecorderLoggingDirectory
{
  return self->_tripSegmentRecorderLoggingDirectory;
}

@end
