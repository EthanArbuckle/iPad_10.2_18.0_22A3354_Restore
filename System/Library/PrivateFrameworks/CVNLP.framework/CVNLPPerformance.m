@implementation CVNLPPerformance

- (CVNLPPerformance)initWithOptions:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  CVNLPPerformance *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSMutableDictionary *results;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CVNLPPerformance;
  v7 = -[CVNLPPerformance init](&v19, sel_init);
  if (v7)
  {
    objc_msgSend_objectForKeyedSubscript_(v4, v5, (uint64_t)CVNLPCaptionTrackPerformance, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend_BOOLValue(v8, v9, v10, v11);
    v7->_computePerf = v12;
    if (v12)
    {
      objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v13, v14, v15);
      v16 = objc_claimAutoreleasedReturnValue();
      results = v7->_results;
      v7->_results = (NSMutableDictionary *)v16;

    }
  }

  return v7;
}

- (void)run:(id)a3 block:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  CVNLPPerformanceResult *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  float64x2_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  if ((objc_msgSend_computePerf(self, v8, v9, v10) & 1) != 0)
  {
    pc_session_create();
    objc_msgSend_processInfo(MEMORY[0x1E0CB3898], v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_processIdentifier(v14, v15, v16, v17);
    pc_session_set_procpid();

    pc_session_add_metric();
    pc_session_add_metric();
    pc_session_add_metric();
    pc_session_add_metric();
    pc_session_add_metric();
    pc_session_begin();
    objc_msgSend_date(MEMORY[0x1E0C99D68], v18, v19, v20);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      v7[2](v7);
    objc_msgSend_date(MEMORY[0x1E0C99D68], v21, v22, v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_timeIntervalSinceDate_(v25, v26, (uint64_t)v24, v27);
    v29 = v28;

    pc_session_end();
    v30 = [CVNLPPerformanceResult alloc];
    v33 = objc_msgSend_initWithName_(v30, v31, (uint64_t)v6, v32);
    pc_session_get_value();
    pc_session_get_value();
    pc_session_get_value();
    pc_session_get_value();
    pc_session_get_value();
    pc_session_get_value();
    pc_session_destroy();
    v34 = (float64x2_t)vdupq_n_s64(0x3F50000000000000uLL);
    *(float64x2_t *)(v33 + 8) = vmulq_f64(*(float64x2_t *)(v33 + 8), v34);
    *(float64x2_t *)(v33 + 24) = vmulq_f64(*(float64x2_t *)(v33 + 24), v34);
    *(double *)(v33 + 40) = *(double *)(v33 + 40) * 0.000001;
    *(_QWORD *)(v33 + 56) = v29;
    objc_msgSend_results(self, v35, v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v38, v39, (uint64_t)v6, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v41)
    {
      objc_msgSend_array(MEMORY[0x1E0C99DE8], v42, v43, v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_results(self, v46, v47, v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v49, v50, (uint64_t)v45, (uint64_t)v6);

    }
    objc_msgSend_results(self, v42, v43, v44);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v51, v52, (uint64_t)v6, v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dict((void *)v33, v55, v56, v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v54, v59, (uint64_t)v58, v60);

  }
  else if (v7)
  {
    v7[2](v7);
  }

}

- (BOOL)computePerf
{
  return self->_computePerf;
}

- (NSMutableDictionary)results
{
  return self->_results;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_results, 0);
}

@end
