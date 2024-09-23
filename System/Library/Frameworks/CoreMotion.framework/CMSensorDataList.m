@implementation CMSensorDataList

- (CMSensorDataList)initWithIdentifier:(unint64_t)a3 andType:(int)a4
{
  uint64_t v4;
  CMSensorDataList *v6;
  CMSensorRecorderInternal *v7;
  const char *v8;
  uint64_t v9;
  id v10;
  const char *v11;
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
  objc_super v23;

  v4 = *(_QWORD *)&a4;
  v23.receiver = self;
  v23.super_class = (Class)CMSensorDataList;
  v6 = -[CMSensorDataList init](&v23, sel_init);
  if (v6)
  {
    v7 = objc_alloc_init(CMSensorRecorderInternal);
    v6->fProxy = v7;
    v6->fCurrentBlock = (CLSensorRecorderSensorMeta *)objc_msgSend_newMetaSinceID_forType_(v7, v8, a3, v4, v9);
    v10 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v6->fCachedData = (NSMutableArray *)objc_msgSend_initWithCapacity_(v10, v11, 16, v12, v13);
    v6->fDataType = v4;
    if (!v6->fCurrentBlock
      || (objc_msgSend__updateCurrentBlockProperties(v6, v14, v15, v16, v17),
          v6->fCurrentIdentifier = v6->fCurrentBlockIdentifier,
          v6->fDataBuffer = 0,
          *(_OWORD *)&v6->fRetrievedDataBufferIdentifier = xmmword_18F505D80,
          (objc_msgSend__updatePointers(v6, v18, v19, v20, v21) & 1) == 0))
    {

      return 0;
    }
  }
  return v6;
}

- (id)initFrom:(double)a3 to:(double)a4 withType:(int)a5
{
  uint64_t v5;
  CMSensorDataList *v8;
  CMSensorRecorderInternal *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSArray *fMetaArray;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t fCurrentBlockIdentifier;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  objc_super v35;

  v5 = *(_QWORD *)&a5;
  v35.receiver = self;
  v35.super_class = (Class)CMSensorDataList;
  v8 = -[CMSensorDataList init](&v35, sel_init);
  if (v8)
  {
    v9 = objc_alloc_init(CMSensorRecorderInternal);
    v8->fProxy = v9;
    v8->fMetaArray = (NSArray *)objc_msgSend_newMetaFrom_to_forType_(v9, v10, v5, v11, v12, a3, a4);
    v13 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v8->fCachedData = (NSMutableArray *)objc_msgSend_initWithCapacity_(v13, v14, 16, v15, v16);
    v8->fDataType = v5;
    fMetaArray = v8->fMetaArray;
    if (!fMetaArray
      || !objc_msgSend_count(fMetaArray, v17, v18, v19, v20)
      || (v8->fCurrentBlock = (CLSensorRecorderSensorMeta *)(id)objc_msgSend_objectAtIndexedSubscript_(v8->fMetaArray, v22, 0, v23, v24), objc_msgSend__updateCurrentBlockProperties(v8, v25, v26, v27, v28), fCurrentBlockIdentifier = v8->fCurrentBlockIdentifier, v8->fCurrentIdentifier = fCurrentBlockIdentifier, v8->fStartingIdentifier = fCurrentBlockIdentifier, v8->fDataBuffer = 0, *(_OWORD *)&v8->fRetrievedDataBufferIdentifier = xmmword_18F505D80, (objc_msgSend__updatePointers(v8, v30, v31, v32, v33) & 1) == 0))
    {

      return 0;
    }
  }
  return v8;
}

- (void)dealloc
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v7;

  objc_msgSend_teardown(self->fProxy, v3, v4, v5, v6);
  v7.receiver = self;
  v7.super_class = (Class)CMSensorDataList;
  -[CMSensorDataList dealloc](&v7, sel_dealloc);
}

- (void)_updateCurrentBlockProperties
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  self->fCurrentBlockIdentifier = objc_msgSend_identifier(self->fCurrentBlock, a2, v2, v3, v4);
  self->fCurrentBlockDataIdentifier = objc_msgSend_dataIdentifier(self->fCurrentBlock, v6, v7, v8, v9);
  objc_msgSend_startTime(self->fCurrentBlock, v10, v11, v12, v13);
  self->fCurrentBlockStartTime = v14;
  self->fCurrentBlockTimestamp = objc_msgSend_timestamp(self->fCurrentBlock, v15, v16, v17, v18);
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  unint64_t result;
  unint64_t v10;
  unint64_t fBlockOffset;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int fDataType;
  double v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  __objc2_class *v33;
  double v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  void *v69;
  const char *v70;
  __objc2_class *v71;
  id v72;
  const char *v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  CMRecordedGyroData *v78;
  const char *v79;
  void *v80;
  id v81;
  const char *v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  CMRecordedGyroData *v86;
  const char *v87;
  unint64_t v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  unint64_t v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  unsigned int v103;
  const char *v104;
  unint64_t fCurrentBlockIdentifier;
  void *v106;
  float32x4_t v107;
  uint64_t v108;
  float32x4_t v109;
  uint64_t v110;
  unsigned int v111;

  result = 0;
  a3->var1 = a4;
  a3->var2 = (unint64_t *)self;
  if (a5 && self->fCurrentBlock)
  {
    v10 = 0;
    while (1)
    {
      fBlockOffset = self->fBlockOffset;
      if (fBlockOffset + objc_msgSend_offset(self->fCurrentBlock, a2, (uint64_t)a3, (uint64_t)a4, a5) >= self->fDataBufferLength)
      {
        v97 = objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v12, v13, v14, v15);
        v98 = self->fBlockOffset;
        fCurrentBlockIdentifier = self->fCurrentBlockIdentifier;
        v106 = (void *)v97;
        v103 = objc_msgSend_offset(self->fCurrentBlock, v99, v100, v101, v102);
        objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v106, v104, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMSensorRecorder.mm"), 239, CFSTR("Unexpected ptr exceeding size of buffer, block id, %llu, block offset %llu, size, %zu"), fCurrentBlockIdentifier, v98 + v103, self->fDataBufferLength);
      }
      v111 = 0;
      fDataType = self->fDataType;
      if (fDataType == 2)
        break;
      if (fDataType != 1)
      {
        if (fDataType)
        {
          v69 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v12, v13, v14, v15);
          objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v69, v70, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMSensorRecorder.mm"), 325, CFSTR("Unexpected sensor type!"));
          goto LABEL_29;
        }
        v109 = 0uLL;
        LODWORD(v110) = 0;
        *(float *)&v17 = sub_18F4C01DC((int *)&self->fAccelUnpacker, &v111, (uint64_t)&v109);
        if (objc_msgSend_count(self->fCachedData, v18, v19, v20, v21, v17) > v10)
        {
          v25 = (void *)objc_msgSend_objectAtIndexedSubscript_(self->fCachedData, v22, v10, v23, v24);
          if (objc_msgSend_retainCount(v25, v26, v27, v28, v29) == 1)
            goto LABEL_14;
          v33 = CMRecordedAccelerometerData;
          goto LABEL_25;
        }
        v71 = CMRecordedAccelerometerData;
LABEL_21:
        v72 = [v71 alloc];
        v74 = objc_msgSend_initWithData_timestamp_walltime_identifier_(v72, v73, (uint64_t)&v109, self->fCurrentBlockTimestamp, self->fCurrentBlockIdentifier, self->fCurrentBlockStartTime);
        goto LABEL_23;
      }
      v109 = 0uLL;
      v110 = 0;
      sub_18F4C0338((int *)&self->fGyroUnpacker, &v111, &v109);
      v107 = v109;
      v108 = v110;
      if (objc_msgSend_count(self->fCachedData, v52, v53, v54, v55) > v10)
      {
        v59 = (void *)objc_msgSend_objectAtIndexedSubscript_(self->fCachedData, v56, v10, v57, v58);
        if (objc_msgSend_retainCount(v59, v60, v61, v62, v63) == 1)
        {
          v67 = (void *)objc_msgSend_objectAtIndexedSubscript_(self->fCachedData, v64, v10, v65, v66);
          objc_msgSend_resetWithData_timestamp_walltime_identifier_(v67, v68, (uint64_t)&v107, self->fCurrentBlockTimestamp, self->fCurrentBlockIdentifier, self->fCurrentBlockStartTime);
          goto LABEL_29;
        }
        v86 = [CMRecordedGyroData alloc];
        v83 = objc_msgSend_initWithData_timestamp_walltime_identifier_(v86, v87, (uint64_t)&v107, self->fCurrentBlockTimestamp, self->fCurrentBlockIdentifier, self->fCurrentBlockStartTime);
        goto LABEL_27;
      }
      v78 = [CMRecordedGyroData alloc];
      v74 = objc_msgSend_initWithData_timestamp_walltime_identifier_(v78, v79, (uint64_t)&v107, self->fCurrentBlockTimestamp, self->fCurrentBlockIdentifier, self->fCurrentBlockStartTime);
LABEL_23:
      v80 = (void *)v74;
      objc_msgSend_addObject_(self->fCachedData, v75, v74, v76, v77);
LABEL_28:

LABEL_29:
      a4[v10] = (id)objc_msgSend_objectAtIndexedSubscript_(self->fCachedData, v49, v10, v50, v51);
      v88 = self->fBlockOffset + v111;
      self->fBlockOffset = v88;
      if (v88 >= objc_msgSend_dataSize(self->fCurrentBlock, v89, v90, v91, v92))
      {
        ++self->fCurrentIdentifier;
        self->fBlockOffset = 0;
      }
      if ((objc_msgSend__updatePointers(self, v93, v94, v95, v96) & 1) == 0)
        return v10 + 1;
      if (a5 == ++v10)
        return a5;
    }
    v109 = 0uLL;
    LODWORD(v110) = 0;
    *(float32x2_t *)&v34 = sub_18F4C0480((int *)&self->fPressureUnpacker, &v111, (uint64_t)&v109);
    if (objc_msgSend_count(self->fCachedData, v35, v36, v37, v38, v34) > v10)
    {
      v42 = (void *)objc_msgSend_objectAtIndexedSubscript_(self->fCachedData, v39, v10, v40, v41);
      if (objc_msgSend_retainCount(v42, v43, v44, v45, v46) == 1)
      {
LABEL_14:
        v47 = (void *)objc_msgSend_objectAtIndexedSubscript_(self->fCachedData, v30, v10, v31, v32);
        objc_msgSend_resetWithData_timestamp_walltime_identifier_(v47, v48, (uint64_t)&v109, self->fCurrentBlockTimestamp, self->fCurrentBlockIdentifier, self->fCurrentBlockStartTime);
        goto LABEL_29;
      }
      v33 = CMRecordedPressureData;
LABEL_25:
      v81 = [v33 alloc];
      v83 = objc_msgSend_initWithData_timestamp_walltime_identifier_(v81, v82, (uint64_t)&v109, self->fCurrentBlockTimestamp, self->fCurrentBlockIdentifier, self->fCurrentBlockStartTime);
LABEL_27:
      v80 = (void *)v83;
      objc_msgSend_setObject_atIndexedSubscript_(self->fCachedData, v84, v83, v10, v85);
      goto LABEL_28;
    }
    v71 = CMRecordedPressureData;
    goto LABEL_21;
  }
  return result;
}

- (BOOL)_updatePointers
{
  CLSensorRecorderSensorMeta *fCurrentBlock;
  NSArray *fMetaArray;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  CLSensorRecorderSensorMeta *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  CLSensorRecorderSensorMeta *v23;
  const char *v24;
  OS_xpc_object *v25;
  char *bytes_ptr;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int fDataType;
  char *v32;
  BOOL result;
  NSObject *v34;
  int v35;
  char *v36;
  char *fDataBufferPtr;
  char *v38;
  void *v39;
  const char *v40;
  void *v41;
  const char *v42;
  uint8_t buf[1640];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  fCurrentBlock = self->fCurrentBlock;
  if (fCurrentBlock && self->fCurrentIdentifier == self->fCurrentBlockIdentifier)
  {
    if (self->fRetrievedDataBufferIdentifier == self->fCurrentBlockDataIdentifier)
      return 1;
  }
  else
  {
    fMetaArray = self->fMetaArray;

    if (fMetaArray)
    {
      self->fCurrentBlock = 0;
      v10 = self->fCurrentIdentifier - self->fStartingIdentifier;
      if (v10 >= objc_msgSend_count(self->fMetaArray, v6, v7, v8, v9))
      {
        result = 0;
        self->fCurrentBlock = 0;
        return result;
      }
      v14 = (CLSensorRecorderSensorMeta *)(id)objc_msgSend_objectAtIndexedSubscript_(self->fMetaArray, v11, v10, v12, v13);
    }
    else
    {
      v14 = (CLSensorRecorderSensorMeta *)objc_msgSend_newMetaByID_forType_(self->fProxy, v6, self->fCurrentIdentifier, self->fDataType, v9);
    }
    self->fCurrentBlock = v14;
    objc_msgSend__updateCurrentBlockProperties(self, v15, v16, v17, v18);
    v23 = self->fCurrentBlock;
    self->fCurrentIdentifier = self->fCurrentBlockIdentifier;
    if (!v23)
      return 0;
    if (self->fRetrievedDataBufferIdentifier == self->fCurrentBlockDataIdentifier)
    {
LABEL_15:
      fDataType = self->fDataType;
      if (fDataType == 2)
      {
        fDataBufferPtr = self->fDataBufferPtr;
        self->fPressureUnpacker.fData = &fDataBufferPtr[objc_msgSend_offset(self->fCurrentBlock, v19, v20, v21, v22)];
        self->fPressureUnpacker.fBitsLeft = 0;
        self->fPressureUnpacker.fTimestampLastDelta = 0;
        *(_QWORD *)self->fPressureUnpacker.fSampleLast = 0;
        self->fPressureUnpacker.fTimestampLast = 0;
      }
      else if (fDataType == 1)
      {
        v38 = self->fDataBufferPtr;
        self->fGyroUnpacker.fData = &v38[objc_msgSend_offset(self->fCurrentBlock, v19, v20, v21, v22)];
        self->fGyroUnpacker.fBitsLeft = 0;
        *(_OWORD *)&self->fGyroUnpacker.fTimestampLast = 0u;
        *(_OWORD *)self->fGyroUnpacker.fSampleLast = 0u;
      }
      else if (fDataType)
      {
        v39 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v19, v20, v21, v22);
        objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v39, v40, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMSensorRecorder.mm"), 400, CFSTR("Unexpected sensor type!"));
      }
      else
      {
        v32 = self->fDataBufferPtr;
        self->fAccelUnpacker.fData = &v32[objc_msgSend_offset(self->fCurrentBlock, v19, v20, v21, v22)];
        self->fAccelUnpacker.fBitsLeft = 0;
        self->fAccelUnpacker.fTimestampLastDelta = 0;
        *(_QWORD *)self->fAccelUnpacker.fSampleLast = 0;
        self->fAccelUnpacker.fTimestampLast = 0;
        self->fAccelUnpacker.fSampleLast[2] = 0;
      }
      return 1;
    }
  }

  v25 = (OS_xpc_object *)objc_msgSend_newDataByID_metaID_forType_(self->fProxy, v24, self->fCurrentBlockDataIdentifier, self->fCurrentBlockIdentifier, self->fDataType);
  self->fDataBuffer = v25;
  if (v25)
  {
    bytes_ptr = (char *)xpc_data_get_bytes_ptr(v25);
    self->fDataBufferPtr = bytes_ptr;
    self->fRetrievedDataBufferIdentifier = self->fCurrentBlockDataIdentifier;
    if (!bytes_ptr)
    {
      v41 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v27, v28, v29, v30);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v41, v42, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMSensorRecorder.mm"), 385, CFSTR("Data pointer returned should be valid"));
    }
    self->fDataBufferLength = xpc_data_get_length(self->fDataBuffer);
    self->fBlockOffset = 0;
    goto LABEL_15;
  }
  if (qword_1EE16D848 != -1)
    dispatch_once(&qword_1EE16D848, &unk_1E2945168);
  v34 = qword_1EE16D850;
  if (os_log_type_enabled((os_log_t)qword_1EE16D850, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F1DC000, v34, OS_LOG_TYPE_ERROR, "Unable to allocate buffer for sensor recorder.", buf, 2u);
  }
  v35 = sub_18F1FCA08(115, 0);
  result = 0;
  if (v35)
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D848 != -1)
      dispatch_once(&qword_1EE16D848, &unk_1E2945168);
    v36 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 0, "-[CMSensorDataList _updatePointers]", "CoreLocation: %s\n", v36);
    if (v36 != (char *)buf)
      free(v36);
    return 0;
  }
  return result;
}

- (id).cxx_construct
{
  *((_QWORD *)self + 14) = 0;
  *((_DWORD *)self + 30) = 0;
  *((_QWORD *)self + 17) = 0;
  *((_QWORD *)self + 18) = 0;
  *((_QWORD *)self + 16) = 0;
  *((_DWORD *)self + 38) = 0;
  *((_QWORD *)self + 20) = 0;
  *((_DWORD *)self + 42) = 0;
  *((_QWORD *)self + 29) = 0;
  *((_QWORD *)self + 30) = 0;
  *((_QWORD *)self + 28) = 0;
  *((_OWORD *)self + 11) = 0u;
  *((_OWORD *)self + 12) = 0u;
  *(_OWORD *)((char *)self + 204) = 0u;
  return self;
}

@end
