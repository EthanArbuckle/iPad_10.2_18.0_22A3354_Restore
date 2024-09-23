@implementation CMVehicleConnection

+ (id)mostRecentVehicleConnection
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  BOOL v28;
  CMVehicleConnectionData *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  double v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  double v44;
  std::__shared_weak_count *v45;
  unint64_t *v46;
  unint64_t v47;
  uint64_t v49;
  std::__shared_weak_count *v50;
  uint64_t v51;
  std::__shared_weak_count *v52;

  sub_18F3C5D28("kCLConnectionMessageVehicleConnectionMostRecent", &v51);
  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v10 = objc_msgSend_setWithObjects_(v2, v6, v3, v7, v8, v4, v5, 0);
  v49 = v51;
  v50 = v52;
  if (v52)
  {
    p_shared_owners = (unint64_t *)&v52->__shared_owners_;
    do
      v13 = __ldxr(p_shared_owners);
    while (__stxr(v13 + 1, p_shared_owners));
  }
  v14 = objc_msgSend_sendMessage_withReplyClassesSync_(CMMotionUtils, v9, (uint64_t)&v49, v10, v11);
  v18 = (id)v14;
  v19 = v50;
  if (!v50)
    goto LABEL_8;
  v20 = (unint64_t *)&v50->__shared_owners_;
  do
    v21 = __ldaxr(v20);
  while (__stlxr(v21 - 1, v20));
  if (!v21)
  {
    ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
    std::__shared_weak_count::__release_weak(v19);
    if (v18)
      goto LABEL_9;
  }
  else
  {
LABEL_8:
    if (v14)
    {
LABEL_9:
      v22 = (void *)objc_msgSend_objectForKeyedSubscript_(v18, v15, (uint64_t)CFSTR("CMVehicleConnectionStartTime"), v16, v17);
      v26 = objc_msgSend_objectForKeyedSubscript_(v18, v23, (uint64_t)CFSTR("CMVehicleConnectionEndTime"), v24, v25);
      v27 = (void *)v26;
      if (v22)
        v28 = v26 == 0;
      else
        v28 = 1;
      if (v28)
      {
        v18 = 0;
      }
      else
      {
        v29 = [CMVehicleConnectionData alloc];
        objc_msgSend_doubleValue(v22, v30, v31, v32, v33);
        v35 = v34;
        objc_msgSend_doubleValue(v27, v36, v37, v38, v39);
        v18 = (id)objc_msgSend_initWithStartDate_endDate_(v29, v40, v41, v42, v43, v35, v44);
      }
    }
  }
  v45 = v52;
  if (v52)
  {
    v46 = (unint64_t *)&v52->__shared_owners_;
    do
      v47 = __ldaxr(v46);
    while (__stlxr(v47 - 1, v46));
    if (!v47)
    {
      ((void (*)(std::__shared_weak_count *))v45->__on_zero_shared)(v45);
      std::__shared_weak_count::__release_weak(v45);
    }
  }
  return v18;
}

@end
