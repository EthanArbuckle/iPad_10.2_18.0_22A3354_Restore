@implementation CMCalorieUtils

+ (BOOL)isAvailable
{
  sub_18F1F77DC();
  return sub_18F20C9AC();
}

+ (CLBodyMetrics)CLBodyMetricsFromCMCalorieUserInfo:(SEL)a3 error:(id)a4
{
  uint64_t v5;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  double v38;
  double v39;
  double v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  CLBodyMetrics *result;

  *(_OWORD *)&retstr->var0 = xmmword_18F509F50;
  *(_OWORD *)&retstr->var4 = unk_18F509F60;
  *(_OWORD *)&retstr->var8 = xmmword_18F509F70;
  *(_OWORD *)&retstr->var11 = *(__int128 *)((char *)&xmmword_18F509F70 + 12);
  if (objc_msgSend_gender(a4, a3, (uint64_t)a4, (uint64_t)a5, v5) && objc_msgSend_gender(a4, v9, v10, v11, v12) != 1)
  {
    if (!a5)
    {
      objc_msgSend_height(a4, v9, v10, v11, v12);
      if (v23 > 0.0)
        goto LABEL_7;
      goto LABEL_11;
    }
    *a5 = (id)objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v9, (uint64_t)CFSTR("CMErrorDomain"), 107, 0);
  }
  else
  {
    retstr->var0 = objc_msgSend_gender(a4, v9, v10, v11, v12);
  }
  objc_msgSend_height(a4, v13, v14, v15, v16);
  if (v21 > 0.0)
  {
LABEL_7:
    objc_msgSend_height(a4, v17, v18, v19, v20);
    *(float *)&v22 = v22;
    retstr->var15 = 1;
    retstr->var2 = *(float *)&v22;
    goto LABEL_11;
  }
  if (a5)
    *a5 = (id)objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v17, (uint64_t)CFSTR("CMErrorDomain"), 107, 0);
LABEL_11:
  objc_msgSend_weight(a4, v17, v18, v19, v20);
  if (v28 <= 0.0)
  {
    if (!a5)
    {
      objc_msgSend_age(a4, v24, v25, v26, v27);
      if (v40 <= 0.0)
        goto LABEL_20;
      goto LABEL_16;
    }
    *a5 = (id)objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v24, (uint64_t)CFSTR("CMErrorDomain"), 107, 0);
  }
  else
  {
    objc_msgSend_weight(a4, v24, v25, v26, v27);
    *(float *)&v33 = v33;
    retstr->var16 = 1;
    retstr->var3 = *(float *)&v33;
  }
  objc_msgSend_age(a4, v29, v30, v31, v32);
  if (v38 > 0.0)
  {
LABEL_16:
    objc_msgSend_age(a4, v34, v35, v36, v37);
    *(float *)&v39 = v39;
    retstr->var14 = 1;
    retstr->var5 = *(float *)&v39;
    goto LABEL_20;
  }
  if (a5)
    *a5 = (id)objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v34, (uint64_t)CFSTR("CMErrorDomain"), 107, 0);
LABEL_20:
  if (objc_msgSend_condition(a4, v34, v35, v36, v37) < 0 || objc_msgSend_condition(a4, v41, v42, v43, v44) > 6)
  {
    if (a5)
      *a5 = (id)objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v41, (uint64_t)CFSTR("CMErrorDomain"), 107, 0);
  }
  else
  {
    retstr->var10 = objc_msgSend_condition(a4, v41, v42, v43, v44);
  }
  result = (CLBodyMetrics *)objc_msgSend_betaBlockerUse(a4, v41, v42, v43, v44);
  if ((_DWORD)result)
    retstr->var12 = 1;
  return result;
}

+ (id)lookupCalorieDataForCMWorkoutType:(int64_t)a3 duration:(double)a4 userInfo:(id)a5 error:(id *)a6
{
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  int v17;
  float v18;
  float v19;
  float v20;
  double v21;
  CMCalorieData *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  id v27;
  char *v28;
  void *v31;
  const char *v32;
  char *v33;
  uint8_t buf[4];
  double v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  if (!a5)
  {
    v31 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, a3, 0, (uint64_t)a6);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v31, v32, (uint64_t)a2, (uint64_t)a1, (uint64_t)CFSTR("CMCalorieUtils.mm"), 75, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("userInfo"));
  }
  if (a4 <= 0.0)
  {
    if (a6)
      *a6 = (id)objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], a2, (uint64_t)CFSTR("CMErrorDomain"), 107, 0);
    if (qword_1ECEDEE98 != -1)
      dispatch_once(&qword_1ECEDEE98, &unk_1E2954528);
    v14 = off_1ECEDEE90;
    if (os_log_type_enabled((os_log_t)off_1ECEDEE90, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v35 = a4;
      _os_log_impl(&dword_18F1DC000, v14, OS_LOG_TYPE_ERROR, "Workout calorie lookup, duration must be positive, %f", buf, 0xCu);
    }
    if (!sub_18F1FCA08(115, 0))
      return 0;
    bzero(buf, 0x65CuLL);
    if (qword_1ECEDEE98 == -1)
      goto LABEL_31;
    goto LABEL_33;
  }
  objc_msgSend_CLBodyMetricsFromCMCalorieUserInfo_error_(CMCalorieUtils, a2, (uint64_t)a5, (uint64_t)a6, (uint64_t)a6);
  if (*a6)
  {
    if (qword_1ECEDEE98 != -1)
      dispatch_once(&qword_1ECEDEE98, &unk_1E2954528);
    v13 = off_1ECEDEE90;
    if (os_log_type_enabled((os_log_t)off_1ECEDEE90, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v35 = *(double *)&a5;
      _os_log_impl(&dword_18F1DC000, v13, OS_LOG_TYPE_ERROR, "Workout calorie lookup, invalid userInfo, %@", buf, 0xCu);
    }
    if (!sub_18F1FCA08(115, 0))
      return 0;
    bzero(buf, 0x65CuLL);
    if (qword_1ECEDEE98 == -1)
    {
LABEL_31:
      v33 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 0, "+[CMCalorieUtils lookupCalorieDataForCMWorkoutType:duration:userInfo:error:]", "CoreLocation: %s\n", v33);
      if (v33 != (char *)buf)
        free(v33);
      return 0;
    }
LABEL_33:
    dispatch_once(&qword_1ECEDEE98, &unk_1E2954528);
    goto LABEL_31;
  }
  v17 = objc_msgSend_CLMotionActivityTypeFromCMWorkoutType_(CMWorkout, v10, a3, v11, v12);
  v18 = sub_18F46E308(v17);
  sub_18F494BDC();
  v20 = v19;
  v21 = (float)(v19 * 0.0) * a4 / 3600.0;
  v22 = [CMCalorieData alloc];
  v15 = (id)objc_msgSend_initWithWorkoutType_duration_mets_basalMets_totalCalories_basalCalories_(v22, v23, a3, v24, v25, a4, v18, v20, (float)(v18 * 0.0) * a4 / 3600.0, v21);
  if (qword_1ECEDEE98 != -1)
    dispatch_once(&qword_1ECEDEE98, &unk_1E2954528);
  v26 = off_1ECEDEE90;
  if (os_log_type_enabled((os_log_t)off_1ECEDEE90, OS_LOG_TYPE_DEFAULT))
  {
    v27 = *a6;
    *(_DWORD *)buf = 138412802;
    v35 = *(double *)&v15;
    v36 = 2112;
    v37 = a5;
    v38 = 2112;
    v39 = v27;
    _os_log_impl(&dword_18F1DC000, v26, OS_LOG_TYPE_DEFAULT, "Workout calorie lookup, %@, %@, %@", buf, 0x20u);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1ECEDEE98 != -1)
      dispatch_once(&qword_1ECEDEE98, &unk_1E2954528);
    v28 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "+[CMCalorieUtils lookupCalorieDataForCMWorkoutType:duration:userInfo:error:]", "CoreLocation: %s\n", v28);
    if (v28 != (char *)buf)
      free(v28);
  }
  return v15;
}

+ (id)lookupCalorieDataForCMWorkoutType:(int64_t)a3 duration:(double)a4 error:(id *)a5
{
  CMCalorieUserInfo *v7;
  const char *v8;
  id v9;

  v7 = [CMCalorieUserInfo alloc];
  v9 = (id)objc_msgSend_initWithAge_gender_height_weight_condition_betaBlockerUse_(v7, v8, 0, 0, 0, 30.0, 1.70000005, 68.0299988);
  return (id)MEMORY[0x1E0DE7D20](CMCalorieUtils, sel_lookupCalorieDataForCMWorkoutType_duration_userInfo_error_, a3, v9, a5);
}

@end
