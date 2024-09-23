@implementation CMVO2MaxClassification

- (CMVO2MaxClassification)init
{
  id v2;
  void **v3;
  void **v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CMVO2MaxClassification;
  v2 = -[CMVO2MaxClassification init](&v6, sel_init);
  if (v2)
  {
    v3 = (void **)operator new();
    sub_18F3EDA3C(v3);
    v5 = 0;
    sub_18F449080((void ***)v2 + 1, v3);
    sub_18F449080(&v5, 0);
  }
  return (CMVO2MaxClassification *)v2;
}

- (void)queryAllClassificationsWithHandler:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _OWORD *v13;
  _OWORD *v14;
  __int128 v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  _OWORD v20[2];
  void *__p;
  _BYTE *v22;

  sub_18F3EDD8C((uint64_t *)self->fVO2MaxClassifier.__ptr_.__value_, &__p);
  v5 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v12 = (void *)objc_msgSend_initWithCapacity_(v5, v6, (v22 - (_BYTE *)__p) >> 5, v7, v8);
  v13 = __p;
  v14 = v22;
  while (v13 != v14)
  {
    v15 = v13[1];
    v20[0] = *v13;
    v20[1] = v15;
    v16 = objc_msgSend_classificationDataFromStruct_(self, v9, (uint64_t)v20, v10, v11);
    objc_msgSend_addObject_(v12, v17, v16, v18, v19);
    v13 += 2;
  }
  (*((void (**)(id, void *, _QWORD))a3 + 2))(a3, v12, 0);

  if (__p)
  {
    v22 = __p;
    operator delete(__p);
  }
}

- (void)queryClassificationForBiologicalSex:(int64_t)a3 age:(int64_t)a4 handler:(id)a5
{
  unsigned int v6;
  int v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _OWORD *v17;
  _OWORD *v18;
  __int128 v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  _OWORD v34[2];
  void *__p;
  _BYTE *v36;
  uint64_t v37;
  _QWORD v38[2];

  v6 = a4;
  v38[1] = *MEMORY[0x1E0C80C00];
  if ((a4 - 20) >= 0xB5)
  {
    v24 = objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("Age parameter is outside of supported range for VO2 Max classification"), a4, (uint64_t)a5);
    v28 = (void *)objc_msgSend_bundleWithIdentifier_(MEMORY[0x1E0CB34D0], v25, (uint64_t)CFSTR("com.apple.coremotion"), v26, v27);
    v37 = *MEMORY[0x1E0CB2D50];
    v38[0] = objc_msgSend_localizedStringForKey_value_table_(v28, v29, v24, (uint64_t)&stru_1E295ADC8, 0);
    v31 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v30, (uint64_t)v38, (uint64_t)&v37, 1);
    v33 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v32, (uint64_t)CFSTR("CMErrorDomain"), 107, v31);
    (*((void (**)(id, _QWORD, uint64_t))a5 + 2))(a5, 0, v33);
  }
  else
  {
    v8 = objc_msgSend_CLHKBiologicalSexFromBiologicalSex_(CMVO2MaxClassification, a2, a3, a4, (uint64_t)a5);
    sub_18F3EE3C8(self->fVO2MaxClassifier.__ptr_.__value_, v8, v6, (char **)&__p);
    v9 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v16 = (void *)objc_msgSend_initWithCapacity_(v9, v10, (v36 - (_BYTE *)__p) >> 5, v11, v12);
    v17 = __p;
    v18 = v36;
    while (v17 != v18)
    {
      v19 = v17[1];
      v34[0] = *v17;
      v34[1] = v19;
      v20 = objc_msgSend_classificationDataFromStruct_(self, v13, (uint64_t)v34, v14, v15);
      objc_msgSend_addObject_(v16, v21, v20, v22, v23);
      v17 += 2;
    }
    (*((void (**)(id, void *, _QWORD))a5 + 2))(a5, v16, 0);

    if (__p)
    {
      v36 = __p;
      operator delete(__p);
    }
  }
}

- (void)queryClassificationForBiologicalSex:(int64_t)a3 age:(int64_t)a4 vo2Max:(double)a5 handler:(id)a6
{
  unsigned int v7;
  unsigned int v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  _OWORD *v19;
  _OWORD *v20;
  __int128 v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  _OWORD v36[2];
  void *__p;
  _BYTE *v38;
  uint64_t v39;
  _QWORD v40[2];

  v7 = a4;
  v40[1] = *MEMORY[0x1E0C80C00];
  if ((a4 - 20) >= 0xB5)
  {
    v26 = objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("Age parameter is outside of supported range for VO2 Max classification"), a4, (uint64_t)a6, a5);
    v30 = (void *)objc_msgSend_bundleWithIdentifier_(MEMORY[0x1E0CB34D0], v27, (uint64_t)CFSTR("com.apple.coremotion"), v28, v29);
    v39 = *MEMORY[0x1E0CB2D50];
    v40[0] = objc_msgSend_localizedStringForKey_value_table_(v30, v31, v26, (uint64_t)&stru_1E295ADC8, 0);
    v33 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v32, (uint64_t)v40, (uint64_t)&v39, 1);
    v35 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v34, (uint64_t)CFSTR("CMErrorDomain"), 107, v33);
    (*((void (**)(id, _QWORD, uint64_t))a6 + 2))(a6, 0, v35);
  }
  else
  {
    v10 = objc_msgSend_CLHKBiologicalSexFromBiologicalSex_(CMVO2MaxClassification, a2, a3, a4, (uint64_t)a6);
    sub_18F3EE84C(self->fVO2MaxClassifier.__ptr_.__value_, v10, v7, (uint64_t *)&__p, a5);
    v11 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v18 = (void *)objc_msgSend_initWithCapacity_(v11, v12, (v38 - (_BYTE *)__p) >> 5, v13, v14);
    v19 = __p;
    v20 = v38;
    while (v19 != v20)
    {
      v21 = v19[1];
      v36[0] = *v19;
      v36[1] = v21;
      v22 = objc_msgSend_classificationDataFromStruct_(self, v15, (uint64_t)v36, v16, v17);
      objc_msgSend_addObject_(v18, v23, v22, v24, v25);
      v19 += 2;
    }
    (*((void (**)(id, void *, _QWORD))a6 + 2))(a6, v18, 0);

    if (__p)
    {
      v38 = __p;
      operator delete(__p);
    }
  }
}

- (id)classificationDataFromStruct:(CLVO2MaxClassificationData *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t var1;
  uint64_t var2;
  uint64_t var3;
  NSObject *v10;
  int v11;
  CMVO2MaxClassificationData *v12;
  const char *v13;
  char *v15;
  uint8_t buf[4];
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = objc_msgSend_biologicalSexFromCLHKBiologicalSex_(CMVO2MaxClassification, a2, a3->var0, v3, v4);
  var1 = a3->var1;
  var2 = a3->var2;
  var3 = a3->var3;
  if (var3 >= 4)
  {
    if (qword_1EE16D868 != -1)
      dispatch_once(&qword_1EE16D868, &unk_1E2953A68);
    v10 = qword_1EE16D870;
    if (os_log_type_enabled((os_log_t)qword_1EE16D870, OS_LOG_TYPE_FAULT))
    {
      v11 = a3->var3;
      *(_DWORD *)buf = 67174657;
      v17 = v11;
      _os_log_impl(&dword_18F1DC000, v10, OS_LOG_TYPE_FAULT, "[CMVO2MaxClassification] Unexpected classificationType: %{private}d", buf, 8u);
    }
    if (sub_18F1FCA08(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D868 != -1)
        dispatch_once(&qword_1EE16D868, &unk_1E2953A68);
      v15 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 0, "-[CMVO2MaxClassification classificationDataFromStruct:]", "CoreLocation: %s\n", v15);
      if (v15 != (char *)buf)
        free(v15);
    }
    var3 = 0;
  }
  if ((_DWORD)var2 == 200)
    var2 = 0x7FFFFFFFFFFFFFFFLL;
  v12 = [CMVO2MaxClassificationData alloc];
  return (id)objc_msgSend_initWithBiologicalSex_ageLowerBound_ageUpperBound_classificationType_vo2MaxLowerBound_vo2MaxUpperBound_(v12, v13, v6, var1, var2, var3, a3->var4, a3->var5);
}

+ (int64_t)biologicalSexFromCLHKBiologicalSex:(int)a3
{
  uint64_t v3;

  v3 = (a3 - 1);
  if (v3 < 3)
    return v3 + 1;
  else
    return 0;
}

+ (int)CLHKBiologicalSexFromBiologicalSex:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) < 3)
    return a3;
  else
    return 0;
}

- (void).cxx_destruct
{
  sub_18F449080((void ***)&self->fVO2MaxClassifier, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
