@implementation CLSubmersionStateMachine

- (CLSubmersionStateMachine)initWithType:(int64_t)a3
{
  CLSubmersionStateMachine *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  CLSubmersionStateMachine *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CLSubmersionStateMachine;
  v4 = -[CLSubmersionStateMachine init](&v11, sel_init);
  v9 = v4;
  if (v4)
  {
    v4->_type = a3;
    objc_msgSend_initializeThresholds(v4, v5, v6, v7, v8);
  }
  return v9;
}

- (void)initializeThresholds
{
  double v3;
  int v4;
  NSObject *v5;
  NSObject *v6;
  int64_t type;
  double maxDepth;
  float v9;
  float v10;
  float v11;
  char *v12;
  char *v13;
  uint8_t buf[4];
  float v15;
  __int16 v16;
  double v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = 6.0;
  if (self->_type != 1)
    goto LABEL_9;
  self->_maxDepth = 40.0;
  v4 = MGGetSInt32Answer();
  if (qword_1EE16D488[0] != -1)
    dispatch_once(qword_1EE16D488, &unk_1E2953608);
  v5 = qword_1EE16D480;
  if (os_log_type_enabled((os_log_t)qword_1EE16D480, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v15 = *(float *)&v4;
    _os_log_impl(&dword_18F1DC000, v5, OS_LOG_TYPE_DEFAULT, "Max depth from gestalt, %d", buf, 8u);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D488[0] != -1)
      dispatch_once(qword_1EE16D488, &unk_1E2953608);
    v13 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CLSubmersionStateMachine initializeThresholds]", "CoreLocation: %s\n", v13);
    if (v13 != (char *)buf)
      free(v13);
  }
  if (v4 >= 1)
  {
    v3 = (double)v4;
LABEL_9:
    self->_maxDepth = v3;
  }
  if (qword_1EE16D488[0] != -1)
    dispatch_once(qword_1EE16D488, &unk_1E2953608);
  v6 = qword_1EE16D480;
  if (os_log_type_enabled((os_log_t)qword_1EE16D480, OS_LOG_TYPE_DEFAULT))
  {
    type = self->_type;
    maxDepth = self->_maxDepth;
    *(_DWORD *)buf = 67109376;
    v15 = *(float *)&type;
    v16 = 2048;
    v17 = maxDepth;
    _os_log_impl(&dword_18F1DC000, v6, OS_LOG_TYPE_DEFAULT, "initializing submersion thresholds,type,%d,maxdepth,%f", buf, 0x12u);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D488[0] != -1)
      dispatch_once(qword_1EE16D488, &unk_1E2953608);
    v12 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CLSubmersionStateMachine initializeThresholds]", "CoreLocation: %s\n", v12);
    if (v12 != (char *)buf)
      free(v12);
  }
  sub_18F3F2DE4((uint64_t)buf, (uint64_t)"DeepDepthMeters", 1.0);
  self->_deepThreshold = v15;
  v9 = self->_maxDepth * 0.875;
  sub_18F3F2DE4((uint64_t)buf, (uint64_t)"NearDepthLimitMeters", v9);
  self->_nearDepthLimitThreshold = v15;
  v10 = self->_maxDepth;
  sub_18F3F2DE4((uint64_t)buf, (uint64_t)"PastMaxDepthMeters", v10);
  self->_pastMaxDepthThreshold = v15;
  v11 = self->_maxDepth * 1.1;
  sub_18F3F2DE4((uint64_t)buf, (uint64_t)"SensorErrorDepthMeters", v11);
  self->_sensorErrorThreshold = v15;
}

- (void)setType:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  self->_type = a3;
  objc_msgSend_initializeThresholds(self, a2, a3, v3, v4);
}

- (int64_t)getType
{
  return self->_type;
}

- (int64_t)stateFromDepth:(id)a3 forceSubmersion:(BOOL)a4
{
  uint64_t v4;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  double v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  double v42;
  double v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint8_t buf[4];
  uint64_t v54;
  __int16 v55;
  uint64_t v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_state(a3, a2, (uint64_t)a3, a4, v4) > 199 || a4)
  {
    objc_msgSend_depth(a3, v8, v9, v10, v11);
    if (v32 <= self->_sensorErrorThreshold)
    {
      objc_msgSend_depth(a3, v28, v29, v30, v31);
      if (v37 <= self->_pastMaxDepthThreshold)
      {
        objc_msgSend_depth(a3, v33, v34, v35, v36);
        if (v42 <= self->_nearDepthLimitThreshold)
        {
          objc_msgSend_depth(a3, v38, v39, v40, v41);
          if (v43 <= self->_deepThreshold)
            return 200;
          else
            return 300;
        }
        else
        {
          return 400;
        }
      }
      else
      {
        return 500;
      }
    }
    else
    {
      return 600;
    }
  }
  else
  {
    if (qword_1EE16D488[0] != -1)
      dispatch_once(qword_1EE16D488, &unk_1E2953608);
    v12 = qword_1EE16D480;
    if (os_log_type_enabled((os_log_t)qword_1EE16D480, OS_LOG_TYPE_DEBUG))
    {
      v17 = objc_msgSend_state(a3, v13, v14, v15, v16);
      objc_msgSend_depth(a3, v18, v19, v20, v21);
      *(_DWORD *)buf = 134218240;
      v54 = v17;
      v55 = 2048;
      v56 = v22;
      _os_log_impl(&dword_18F1DC000, v12, OS_LOG_TYPE_DEBUG, "not updating client state because not submerged,state,%ld,depth,%f", buf, 0x16u);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D488[0] != -1)
        dispatch_once(qword_1EE16D488, &unk_1E2953608);
      objc_msgSend_state(a3, v44, v45, v46, v47);
      objc_msgSend_depth(a3, v48, v49, v50, v51);
      v52 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CLSubmersionStateMachine stateFromDepth:forceSubmersion:]", "CoreLocation: %s\n", v52);
      if (v52 != (char *)buf)
        free(v52);
    }
    return objc_msgSend_state(a3, v23, v24, v25, v26);
  }
}

- (double)deepThreshold
{
  return self->_deepThreshold;
}

- (double)nearDepthLimitThreshold
{
  return self->_nearDepthLimitThreshold;
}

- (double)pastMaxDepthThreshold
{
  return self->_pastMaxDepthThreshold;
}

- (double)sensorErrorThreshold
{
  return self->_sensorErrorThreshold;
}

- (int64_t)type
{
  return self->_type;
}

@end
