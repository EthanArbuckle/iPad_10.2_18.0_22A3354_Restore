@implementation CMFitnessJuniorGoals

- (CMFitnessJuniorGoals)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMFitnessJuniorGoals;
  return -[CMFitnessJuniorGoals init](&v3, sel_init);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CMFitnessJuniorGoals;
  -[CMFitnessJuniorGoals dealloc](&v2, sel_dealloc);
}

+ (BOOL)isAvailable
{
  sub_18F1F77DC();
  sub_18F1F77DC();
  return sub_18F20C9AC();
}

+ (unint64_t)recommendedMoveMinutesForLevel:(int64_t)a3 userInfo:(id)a4 error:(id *)a5
{
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  unint64_t v30;
  void *v32;
  const char *v33;
  void *v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  int v44;
  uint64_t v45;
  uint8_t buf[4];
  uint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  if ((unint64_t)a3 >= 3)
  {
    v32 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, a3, (uint64_t)a4, (uint64_t)a5);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v32, v33, (uint64_t)a2, (uint64_t)a1, (uint64_t)CFSTR("CMFitnessJuniorGoals.mm"), 40, CFSTR("CMFitnessJuniorGoalLevel must be low, medium, or high"));
    if (a4)
      goto LABEL_3;
LABEL_18:
    v34 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, a3, (uint64_t)a4, (uint64_t)a5);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v34, v35, (uint64_t)a2, (uint64_t)a1, (uint64_t)CFSTR("CMFitnessJuniorGoals.mm"), 41, CFSTR("userInfo must not be empty."));
    goto LABEL_3;
  }
  if (!a4)
    goto LABEL_18;
LABEL_3:
  objc_msgSend_age(a4, a2, a3, (uint64_t)a4, (uint64_t)a5);
  if (v14 < 5.0 || (objc_msgSend_age(a4, v10, v11, v12, v13), v15 >= 13.0))
  {
    if (qword_1EE16D6A0 != -1)
      dispatch_once(&qword_1EE16D6A0, &unk_1E29538E8);
    v16 = qword_1EE16D6A8;
    if (os_log_type_enabled((os_log_t)qword_1EE16D6A8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_age(a4, v17, v18, v19, v20);
      *(_DWORD *)buf = 134283521;
      v47 = v21;
      _os_log_impl(&dword_18F1DC000, v16, OS_LOG_TYPE_ERROR, "FitnessJuniorGoals, Unexpected age input: %{private}f yrs. Fitness junior move minute goals are designed for user age interval [5.0, 13.0) yrs.", buf, 0xCu);
    }
    if (sub_18F1FCA08(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D6A0 != -1)
        dispatch_once(&qword_1EE16D6A0, &unk_1E29538E8);
      objc_msgSend_age(a4, v36, v37, v38, v39);
      v44 = 134283521;
      v45 = v40;
      v41 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 0, "+[CMFitnessJuniorGoals recommendedMoveMinutesForLevel:userInfo:error:]", "CoreLocation: %s\n", v41);
      if (v41 != (char *)buf)
        free(v41);
    }
    if (a5)
    {
      v25 = (void *)objc_msgSend_bundleWithIdentifier_(MEMORY[0x1E0CB34D0], v22, (uint64_t)CFSTR("com.apple.coremotion"), v23, v24);
      v42 = *MEMORY[0x1E0CB2D50];
      v43 = objc_msgSend_localizedStringForKey_value_table_(v25, v26, (uint64_t)CFSTR("Unexpected age input. Fitness junior move minute goals are designed for user age interval [5.0, 13.0) yrs."), (uint64_t)&stru_1E295ADC8, 0);
      v28 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v27, (uint64_t)&v43, (uint64_t)&v42, 1);
      *a5 = (id)objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v29, (uint64_t)CFSTR("CMErrorDomain"), 107, v28);
    }
  }
  v30 = 90;
  if (a3 == 2)
    v30 = 120;
  if (a3)
    return v30;
  else
    return 60;
}

@end
