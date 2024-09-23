@implementation ENExposureWindow

- (ENExposureWindow)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6;
  ENExposureWindow *v7;
  int v8;
  uint64_t v9;
  NSDate *date;
  int v11;
  int v12;
  int v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSArray *scanInstances;
  ENExposureWindow *v20;
  _QWORD applier[6];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  double v29;

  v6 = a3;
  v7 = -[ENExposureWindow init](self, "init");
  if (!v7)
  {
    if (!a4)
      goto LABEL_30;
LABEL_29:
    ENErrorF(2);
    v20 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_25;
  }
  if (MEMORY[0x20BD2F7B8](v6) != MEMORY[0x24BDACFA0])
  {
    if (!a4)
      goto LABEL_30;
    goto LABEL_29;
  }
  v23 = 0;
  v8 = CUXPCDecodeUInt64RangedEx();
  if (v8 == 6)
  {
    v7->_calibrationConfidence = v23;
  }
  else if (v8 == 5)
  {
    goto LABEL_30;
  }
  v29 = 0.0;
  if (!CUXPCDecodeDouble())
    goto LABEL_30;
  if (v29 != 0.0)
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE60]), "initWithTimeIntervalSinceReferenceDate:", v29);
    date = v7->_date;
    v7->_date = (NSDate *)v9;

  }
  v23 = 0;
  v11 = CUXPCDecodeUInt64RangedEx();
  if (v11 == 6)
  {
    v7->_diagnosisReportType = v23;
  }
  else if (v11 == 5)
  {
    goto LABEL_30;
  }
  v23 = 0;
  v12 = CUXPCDecodeUInt64RangedEx();
  if (v12 == 6)
  {
    v7->_infectiousness = v23;
  }
  else if (v12 == 5)
  {
    goto LABEL_30;
  }
  v23 = 0;
  v13 = CUXPCDecodeUInt64RangedEx();
  if (v13 == 6)
  {
    v7->_variantOfConcernType = v23;
    goto LABEL_18;
  }
  if (v13 == 5)
  {
LABEL_30:
    v20 = 0;
    goto LABEL_25;
  }
LABEL_18:
  v14 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  xpc_dictionary_get_array(v6, "scanInst");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v15)
    goto LABEL_23;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy_;
  v27 = __Block_byref_object_dispose_;
  v28 = 0;
  applier[0] = MEMORY[0x24BDAC760];
  applier[1] = 3221225472;
  applier[2] = __44__ENExposureWindow_initWithXPCObject_error___block_invoke;
  applier[3] = &unk_24C38AFC8;
  applier[4] = v14;
  applier[5] = &v23;
  xpc_array_apply(v15, applier);
  v17 = (void *)v24[5];
  if (v17)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v17);
  }
  else
  {
    v18 = objc_msgSend(v14, "copy");
    scanInstances = v7->_scanInstances;
    v7->_scanInstances = (NSArray *)v18;

  }
  _Block_object_dispose(&v23, 8);

  if (v17)
    v20 = 0;
  else
LABEL_23:
    v20 = v7;

LABEL_25:
  return v20;
}

BOOL __44__ENExposureWindow_initWithXPCObject_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  ENScanInstance *v5;
  uint64_t v6;
  ENScanInstance *v7;
  _BOOL8 v8;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id obj;

  v4 = a3;
  if (MEMORY[0x20BD2F7B8]() == MEMORY[0x24BDACFA0])
  {
    v5 = [ENScanInstance alloc];
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    obj = *(id *)(v6 + 40);
    v7 = -[ENScanInstance initWithXPCObject:error:](v5, "initWithXPCObject:error:", v4, &obj);
    objc_storeStrong((id *)(v6 + 40), obj);
    v8 = v7 != 0;
    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
    }
    else
    {
      ENErrorF(12);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v15 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = v13;

    }
  }
  else
  {
    ENErrorF(15);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    v8 = 0;
  }

  return v8;
}

- (void)encodeWithXPCObject:(id)a3
{
  id v4;
  void *v5;
  NSDate *v6;
  NSDate *v7;
  double v8;
  uint64_t diagnosisReportType;
  uint64_t infectiousness;
  uint64_t variantOfConcernType;
  NSArray *v12;
  xpc_object_t v13;
  NSArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  xpc_object_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (self->_calibrationConfidence)
    xpc_dictionary_set_uint64(v4, "caliConf", self->_calibrationConfidence);
  v6 = self->_date;
  v7 = v6;
  if (v6)
  {
    -[NSDate timeIntervalSinceReferenceDate](v6, "timeIntervalSinceReferenceDate");
    if (v8 != 0.0)
      xpc_dictionary_set_double(v5, "tims", v8);
  }

  diagnosisReportType = self->_diagnosisReportType;
  if ((_DWORD)diagnosisReportType)
    xpc_dictionary_set_uint64(v5, "dRT", diagnosisReportType);
  infectiousness = self->_infectiousness;
  if ((_DWORD)infectiousness)
    xpc_dictionary_set_uint64(v5, "infect", infectiousness);
  variantOfConcernType = self->_variantOfConcernType;
  if ((_DWORD)variantOfConcernType)
    xpc_dictionary_set_uint64(v5, "vcRT", variantOfConcernType);
  v12 = self->_scanInstances;
  if (v12)
  {
    v13 = xpc_array_create(0, 0);
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v14 = self->_scanInstances;
    v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v22 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          v20 = xpc_dictionary_create(0, 0, 0);
          objc_msgSend(v19, "encodeWithXPCObject:", v20, (_QWORD)v21);
          xpc_array_set_value(v13, 0xFFFFFFFFFFFFFFFFLL, v20);

        }
        v16 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v16);
    }

    xpc_dictionary_set_value(v5, "scanInst", v13);
  }

}

- (id)description
{
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t variantOfConcernType;
  const char *v8;
  id v9;
  id v10;
  const char *v12;
  id v13;

  NSAppendPrintF_safe();
  v13 = 0;
  NSAppendPrintF_safe();
  v3 = v13;

  NSAppendPrintF_safe();
  v4 = v3;

  NSAppendPrintF_safe();
  v5 = v4;

  NSAppendPrintF_safe();
  v6 = v5;

  variantOfConcernType = (int)self->_variantOfConcernType;
  if (variantOfConcernType > 4)
    v8 = "?";
  else
    v8 = off_24C38B0C8[variantOfConcernType];
  v12 = v8;
  NSAppendPrintF_safe();
  v9 = v6;

  -[NSArray count](self->_scanInstances, "count", v12);
  NSAppendPrintF_safe();
  v10 = v9;

  return v10;
}

- (ENCalibrationConfidence)calibrationConfidence
{
  return self->_calibrationConfidence;
}

- (void)setCalibrationConfidence:(unsigned __int8)a3
{
  self->_calibrationConfidence = a3;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (ENDiagnosisReportType)diagnosisReportType
{
  return self->_diagnosisReportType;
}

- (void)setDiagnosisReportType:(unsigned int)a3
{
  self->_diagnosisReportType = a3;
}

- (ENInfectiousness)infectiousness
{
  return self->_infectiousness;
}

- (void)setInfectiousness:(unsigned int)a3
{
  self->_infectiousness = a3;
}

- (NSArray)scanInstances
{
  return self->_scanInstances;
}

- (void)setScanInstances:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (ENVariantOfConcernType)variantOfConcernType
{
  return self->_variantOfConcernType;
}

- (void)setVariantOfConcernType:(unsigned int)a3
{
  self->_variantOfConcernType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scanInstances, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end
