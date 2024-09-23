@implementation CPUDrainOperation

- (CPUDrainOperation)initWithMatrixLength:(id)a3 iterationDelay:(id)a4
{
  id v7;
  id v8;
  CPUDrainOperation *v9;
  CPUDrainOperation *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CPUDrainOperation;
  v9 = -[CPUDrainOperation init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_matrixLength, a3);
    objc_storeStrong((id *)&v10->_iterationDelay, a4);
  }

  return v10;
}

- (void)main
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;

  -[CPUDrainOperation thermalSGEMMEnergyObjC](self, "thermalSGEMMEnergyObjC");
  v3 = DiagnosticLogHandleForCategory(3);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    sub_1000092A0((uint64_t)self, v4, v5, v6);

}

- (void)cancel
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CPUDrainOperation;
  -[DrainOperation cancel](&v2, "cancel");
}

- (void)thermalSGEMMEnergyObjC
{
  void *v3;
  id v4;
  int v5;
  unsigned int PhysicalCPUs;
  _BOOL4 v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  int __ldb;
  unint64_t v16;
  const float *v17;
  float *__B;
  float *v19;
  float *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  float *v24;
  float *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  id v31;
  void *v32;
  float *__C;
  uint8_t buf[16];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CPUDrainOperation matrixLength](self, "matrixLength"));
  v4 = objc_msgSend(v3, "unsignedLongValue");

  v5 = detect_cpu();
  PhysicalCPUs = GetPhysicalCPUs();
  v8 = PhysicalCPUs < 3 && (unint64_t)v4 > 0x800;
  if (v5 != -1829029944 && v5 != 747742334 && v5 != 933271106)
  {
    v9 = DiagnosticLogHandleForCategory(3);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1000093C4(v10);

    printBestThermalInfo();
  }
  v11 = DiagnosticLogHandleForCategory(3);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = PhysicalCPUs;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Number of threads: %d", buf, 8u);
  }

  v13 = DiagnosticLogHandleForCategory(3);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "SGEMM Iterations = infinity.", buf, 2u);
  }

  v51 = 0;
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  *(_OWORD *)buf = 0u;
  ConstructRandom((uint64_t *)buf, 0);
  if (v8)
    __ldb = 2048;
  else
    __ldb = (int)v4;
  v16 = (__ldb * __ldb);
  v17 = (const float *)malloc_type_malloc(4 * v16, 0x100004052888210uLL);
  __B = (float *)malloc_type_malloc(4 * v16, 0x100004052888210uLL);
  v19 = (float *)malloc_type_malloc(4 * v16 * PhysicalCPUs, 0x100004052888210uLL);
  v20 = v19;
  if (v17 && __B && v19)
  {
    __C = v19;
    if (__ldb)
    {
      v21 = 0;
      if (v16 <= 1)
        v22 = 1;
      else
        v22 = (__ldb * __ldb);
      v23 = 4 * v16;
      v24 = v19;
      do
      {
        v17[v21] = (float)(UniformFloat((uint64_t *)buf) * 2.0) + -1.0;
        __B[v21] = (float)(UniformFloat((uint64_t *)buf) * 2.0) + -1.0;
        if (PhysicalCPUs)
        {
          v25 = v24;
          v26 = PhysicalCPUs;
          do
          {
            *v25 = 0.0;
            v25 = (float *)((char *)v25 + v23);
            --v26;
          }
          while (v26);
        }
        ++v21;
        ++v24;
      }
      while (v21 != v22);
    }
    if (-[DrainOperation isFinished](self, "isFinished"))
    {
      v27 = __C;
    }
    else
    {
      do
      {
        cblas_sgemm(CblasColMajor, CblasNoTrans, CblasNoTrans, __ldb, __ldb, __ldb, 1.0, v17, __ldb, __B, __ldb, 0.0, __C, __ldb);
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[CPUDrainOperation iterationDelay](self, "iterationDelay"));
        v31 = objc_msgSend(v30, "unsignedIntegerValue");

        if (v31)
        {
          v32 = (void *)objc_claimAutoreleasedReturnValue(-[CPUDrainOperation iterationDelay](self, "iterationDelay"));
          usleep(1000 * objc_msgSend(v32, "unsignedIntValue"));

        }
        -[DrainOperation waitIfPaused](self, "waitIfPaused");
      }
      while (!-[DrainOperation isFinished](self, "isFinished"));
      v27 = __C;
    }
    v20 = (float *)v17;
  }
  else
  {
    v28 = DiagnosticLogHandleForCategory(3);
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      sub_100009334(v29);

    v27 = (void *)v17;
  }
  free(v27);
  free(__B);
  free(v20);
}

- (NSNumber)matrixLength
{
  return self->_matrixLength;
}

- (void)setMatrixLength:(id)a3
{
  objc_storeStrong((id *)&self->_matrixLength, a3);
}

- (NSNumber)iterationDelay
{
  return self->_iterationDelay;
}

- (void)setIterationDelay:(id)a3
{
  objc_storeStrong((id *)&self->_iterationDelay, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iterationDelay, 0);
  objc_storeStrong((id *)&self->_matrixLength, 0);
}

@end
