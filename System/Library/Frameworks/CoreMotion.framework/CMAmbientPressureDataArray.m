@implementation CMAmbientPressureDataArray

- (CMAmbientPressureDataArray)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5
{
  uint64_t v5;
  CLSensorRecorderSensorMeta *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int *v17;
  const char *v18;
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
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
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
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unsigned int v52;
  CMRecordedPressureData *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  id v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  _QWORD v77[2];
  int v78;
  int v79;
  uint64_t v80;
  int v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;

  if (objc_msgSend_length(a3, a2, (uint64_t)a3, (uint64_t)a4, v5, a5))
  {
    v8 = [CLSensorRecorderSensorMeta alloc];
    v12 = (void *)objc_msgSend_initWithDataType_(v8, v9, 0xFFFFFFFFLL, v10, v11);
    v17 = (unsigned int *)objc_msgSend_bytes(a3, v13, v14, v15, v16);
    objc_msgSend_setDataSize_(v12, v18, bswap32(*v17), v19, v20);
    v25 = objc_msgSend_bytes(a3, v21, v22, v23, v24);
    objc_msgSend_setTimestamp_(v12, v26, bswap64(*(_QWORD *)(v25 + 4)), v27, v28);
    v33 = objc_msgSend_bytes(a3, v29, v30, v31, v32);
    objc_msgSend_setStartTime_(v12, v34, v35, v36, v37, *(double *)(v33 + 12));
    v42 = objc_msgSend_bytes(a3, v38, v39, v40, v41) + 20;
    v47 = (void *)objc_msgSend_array(MEMORY[0x1E0C99DE8], v43, v44, v45, v46);
    v80 = v42;
    v81 = 0;
    v83 = 0;
    v84 = 0;
    v82 = 0;
    v79 = 0;
    if (objc_msgSend_dataSize(v12, v48, v49, v50, v51))
    {
      v52 = 0;
      do
      {
        v77[0] = 0;
        v77[1] = 0;
        v78 = 0;
        sub_18F4C0480((int *)&v80, &v79, (uint64_t)v77);
        v52 += v79;
        v53 = [CMRecordedPressureData alloc];
        v58 = objc_msgSend_timestamp(v12, v54, v55, v56, v57);
        objc_msgSend_startTime(v12, v59, v60, v61, v62);
        v64 = (void *)objc_msgSend_initWithData_timestamp_walltime_identifier_(v53, v63, (uint64_t)v77, v58, 0);
        objc_msgSend_addObject_(v47, v65, (uint64_t)v64, v66, v67);

      }
      while (v52 < objc_msgSend_dataSize(v12, v68, v69, v70, v71));
    }

    v72 = objc_alloc(MEMORY[0x1E0C99D20]);
    return (CMAmbientPressureDataArray *)objc_msgSend_initWithArray_(v72, v73, (uint64_t)v47, v74, v75);
  }
  else
  {

    return 0;
  }
}

@end
