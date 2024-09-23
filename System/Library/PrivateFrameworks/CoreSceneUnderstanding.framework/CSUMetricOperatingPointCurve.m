@implementation CSUMetricOperatingPointCurve

- (CSUMetricOperatingPointCurve)initWithOperatingPointsData:(id)a3 metricPattern:(int)a4 error:(id *)a5
{
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CSUMetricOperatingPointCurve *v13;
  uint64_t v14;
  NSData *operatingPoints;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  CSUMetricOperatingPointCurve *v33;
  unint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  int metricPattern;
  uint64_t v41;
  unint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v48;
  objc_super v49;

  v8 = a3;
  v49.receiver = self;
  v49.super_class = (Class)CSUMetricOperatingPointCurve;
  v13 = -[CSUMetricOperatingPointCurve init](&v49, sel_init);
  if (!v13)
  {
    if (a5)
    {
      objc_msgSend_errorWithCode_message_(CSUError, v9, 4, (uint64_t)CFSTR("Failed to allocate memory"), v12);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
      v33 = 0;
      *a5 = v32;
      goto LABEL_19;
    }
LABEL_18:
    v33 = 0;
    goto LABEL_19;
  }
  v14 = objc_msgSend_copy(v8, v9, v10, v11, v12);
  operatingPoints = v13->_operatingPoints;
  v13->_operatingPoints = (NSData *)v14;

  v13->_metricPattern = a4;
  if ((objc_msgSend_length(v13->_operatingPoints, v16, v17, v18, v19) & 3) != 0)
  {
    if (a5)
    {
      v24 = (void *)MEMORY[0x24BDD17C8];
      v25 = objc_msgSend_length(v13->_operatingPoints, v20, v21, v22, v23);
      objc_msgSend_stringWithFormat_(v24, v26, (uint64_t)CFSTR("Invalid byte buffer length %lu for metric-operating curve initialization from operating points"), v27, v28, v25);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithCode_message_(CSUError, v30, 6, (uint64_t)v29, v31);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_18;
  }
  v34 = objc_msgSend_length(v13->_operatingPoints, v20, v21, v22, v23);
  v39 = v34;
  metricPattern = v13->_metricPattern;
  if (!metricPattern)
  {
    v41 = 9;
    v42 = v34 >> 2;
    if (v34 >> 2 != 9)
    {
LABEL_11:
      if (a5)
      {
        objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v35, (uint64_t)CFSTR("Invalid number %lu of operating points for metric-operating point curve with %lu expected points"), v37, v38, v42, v41);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorWithCode_message_(CSUError, v44, 6, (uint64_t)v43, v45);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

      }
      goto LABEL_18;
    }
    goto LABEL_14;
  }
  if (metricPattern != 1)
  {
    if (a5)
    {
      objc_msgSend_errorWithCode_message_(CSUError, v35, 2, (uint64_t)CFSTR("Unhandled metric pattern in initialization of metric-operating point curve"), v38);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    goto LABEL_18;
  }
  v41 = 3;
  v42 = v34 >> 2;
  if (v34 >> 2 != 3)
    goto LABEL_11;
LABEL_14:
  v46 = objc_msgSend_bytes(v13->_operatingPoints, v35, v36, v37, v38);
  v13->_nanCount = 0;
  if (v39 >= 4)
  {
    v48 = 4 * v42;
    do
    {
      v46 += 4;
      v48 -= 4;
    }
    while (v48);
  }
  v33 = v13;
LABEL_19:

  return v33;
}

- (int64_t)count
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return ((unint64_t)objc_msgSend_length(self->_operatingPoints, a2, v2, v3, v4) >> 2) - self->_nanCount;
}

- (void)enumerateUsingBlock:(id)a3
{
  void (**v4)(id, _BYTE *, float, float);
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  float *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  int metricPattern;
  float *v17;
  float v18;
  BOOL v19;
  int *v20;
  float v21;
  BOOL v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  char v28;

  v4 = (void (**)(id, _BYTE *, float, float))a3;
  v9 = (float *)objc_msgSend_bytes(self->_operatingPoints, v5, v6, v7, v8);
  objc_msgSend_length(self->_operatingPoints, v10, v11, v12, v13);
  metricPattern = self->_metricPattern;
  if (metricPattern)
  {
    if (metricPattern == 1)
    {
      v28 = 0;
      v17 = (float *)&dword_23A0A3AD4;
      do
      {
        v18 = *v9++;
        v4[2](v4, &v28, *v17++, v18);
        if (v28)
          v19 = 1;
        else
          v19 = v17 == (float *)&xmmword_23A0A3AE0;
      }
      while (!v19);
    }
    else
    {
      objc_msgSend_errorWithCode_message_(CSUError, v14, 2, (uint64_t)CFSTR("Unhandled metric pattern"), v15);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_logInternalError_(CSUError, v24, (uint64_t)v23, v25, v26);

    }
  }
  else
  {
    v27 = 0;
    v20 = &dword_23A0A3AB0;
    do
    {
      v21 = *v9++;
      v4[2](v4, &v27, *(float *)v20++, v21);
      if (v27)
        v22 = 1;
      else
        v22 = v20 == &dword_23A0A3AD4;
    }
    while (!v22);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operatingPoints, 0);
}

@end
