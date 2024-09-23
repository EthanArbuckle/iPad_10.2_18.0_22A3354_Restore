@implementation CHPowerLogging

+ (void)logModelLoaded:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("model");
  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], a2, a3, v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = CFSTR("loadType");
  v11[0] = v6;
  v11[1] = &unk_1E7829660;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v7, (uint64_t)v11, (uint64_t)v10, 2, v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  if (qword_1EF5684E0 != -1)
    dispatch_once(&qword_1EF5684E0, &unk_1E77F1B70);
  PPSSendTelemetry();

}

+ (void)logModelUnloaded:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("model");
  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], a2, a3, v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = CFSTR("loadType");
  v11[0] = v6;
  v11[1] = &unk_1E7829678;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v7, (uint64_t)v11, (uint64_t)v10, 2, v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  if (qword_1EF5684E0 != -1)
    dispatch_once(&qword_1EF5684E0, &unk_1E77F1B70);
  PPSSendTelemetry();

}

+ (void)logModelInference:(unint64_t)a3 startTimestamp:(double)a4 endTimestamp:(double)a5 data:(id)a6
{
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  id v42;

  v9 = qword_1EF5684F0;
  v15 = a6;
  if (v9 != -1)
    dispatch_once(&qword_1EF5684F0, &unk_1E77F6AB0);
  v42 = (id)objc_msgSend_mutableCopy(v15, v10, v11, v12, v13, v14);

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v16, a3, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v42, v21, (uint64_t)v20, (uint64_t)CFSTR("model"), v22, v23);

  objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v24, v25, v26, v27, v28, a4);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v42, v30, (uint64_t)v29, (uint64_t)CFSTR("startTimestamp"), v31, v32);

  objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v33, v34, v35, v36, v37, a5);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v42, v39, (uint64_t)v38, (uint64_t)CFSTR("endTimestamp"), v40, v41);

  PPSSendTelemetry();
}

@end
