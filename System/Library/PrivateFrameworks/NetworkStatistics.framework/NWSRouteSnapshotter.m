@implementation NWSRouteSnapshotter

- (id)snapshot
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  uint64_t v10;
  NWSRouteSnapshot *v11;
  NSObject *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17[17];
  _BYTE v18[112];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v19 = 0;
  memset(v18, 0, sizeof(v18));
  memset(&v17[1], 0, 128);
  v14 = 0;
  v15 = 0;
  v16 = 1007;
  v17[0] = -[NWSSnapshotter kernelSourceRef](self, "kernelSourceRef");
  -[NWSSnapshotter snapshotSource](self, "snapshotSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "send:length:err:", &v15, 24, &v14);

  if (v4 != 24)
  {
    NStatGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    v7 = v9;
    if (v4 < 0)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[NWSRouteSnapshotter snapshot].cold.6();
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      -[NWSRouteSnapshotter snapshot].cold.7();
    }
    goto LABEL_21;
  }
  -[NWSSnapshotter snapshotSource](self, "snapshotSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "recv:length:err:", &v15, 272, &v14);

  if (v6 <= 271)
  {
    NStatGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
    if (v6 < 0)
    {
      if (v8)
        -[NWSRouteSnapshotter snapshot].cold.1();
    }
    else if (v8)
    {
      -[NWSRouteSnapshotter snapshot].cold.2();
    }
LABEL_21:

LABEL_22:
    v11 = 0;
    return v11;
  }
  if ((_DWORD)v16 != 10006)
  {
    if ((_DWORD)v16 == 2)
    {
      NStatGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        -[NWSRouteSnapshotter snapshot].cold.5(v7);
    }
    else
    {
      NStatGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[NWSRouteSnapshotter snapshot].cold.3();
    }
    goto LABEL_21;
  }
  v10 = v17[0];
  if (v10 != -[NWSSnapshotter kernelSourceRef](self, "kernelSourceRef"))
  {
    NStatGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[NWSRouteSnapshotter snapshot].cold.4(v17, self, v13);

    goto LABEL_22;
  }
  v11 = -[NWSRouteSnapshot initWithCounts:routeDescriptor:sourceIdent:seqno:]([NWSRouteSnapshot alloc], "initWithCounts:routeDescriptor:sourceIdent:seqno:", &v17[2], v18, -[NWSSnapshotter kernelSourceRef](self, "kernelSourceRef"), 0);
  return v11;
}

- (NWSRouteSnapshotter)initWithSource:(id)a3 dest:(id)a4 mask:(id)a5 ifindex:(int)a6
{
  id v10;
  id v11;
  id v12;
  NWSRouteSnapshotter *v13;
  NSObject *v14;
  NWSRouteSnapshotter *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BOOL4 v19;
  uint64_t v20;
  NSObject *v21;
  int v22;
  _BOOL4 v23;
  int v25;
  objc_super v26;
  _OWORD v27[5];
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v26.receiver = self;
  v26.super_class = (Class)NWSRouteSnapshotter;
  v13 = -[NWSRouteSnapshotter init](&v26, sel_init);
  if (!v13)
    goto LABEL_34;
  v28 = 0;
  memset(v27, 0, sizeof(v27));
  if (v11
    && (unint64_t)objc_msgSend(v11, "length") >= 0x10
    && (unint64_t)objc_msgSend(v11, "length") < 0x1D)
  {
    if (v12
      && ((unint64_t)objc_msgSend(v11, "length") < 0x10 || (unint64_t)objc_msgSend(v11, "length") >= 0x1D))
    {
      NStatGetLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[NWSRouteSnapshotter initWithSource:dest:mask:ifindex:].cold.10(v12);
      goto LABEL_7;
    }
    *(_QWORD *)&v27[0] = v27;
    *((_QWORD *)&v27[0] + 1) = 1001;
    *(_QWORD *)&v27[1] = 1;
    memset((char *)&v27[1] + 8, 0, 56);
    LODWORD(v28) = a6;
    objc_msgSend(v11, "getBytes:length:", (char *)&v27[1] + 8, 28);
    if (v12)
      objc_msgSend(v12, "getBytes:length:", (char *)&v27[3] + 4, 28);
    v25 = 0;
    v16 = objc_msgSend(v10, "send:length:err:", v27, 84, &v25);
    if (v16 != 84)
    {
      v20 = v16;
      NStatGetLog();
      v21 = objc_claimAutoreleasedReturnValue();
      v14 = v21;
      if (v20 < 0)
      {
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          -[NWSRouteSnapshotter snapshot].cold.6();
      }
      else if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        -[NWSRouteSnapshotter initWithSource:dest:mask:ifindex:].cold.9();
      }
      goto LABEL_7;
    }
    v17 = objc_msgSend(v10, "recv:length:err:", v27, 88, &v25);
    if (v17 <= 31)
    {
      v18 = v17;
      NStatGetLog();
      v14 = objc_claimAutoreleasedReturnValue();
      v19 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
      if (v18 < 0)
      {
        if (v19)
          -[NWSRouteSnapshotter initWithSource:dest:mask:ifindex:].cold.2();
      }
      else if (v19)
      {
        -[NWSRouteSnapshotter initWithSource:dest:mask:ifindex:].cold.3();
      }
      goto LABEL_7;
    }
    if (DWORD2(v27[0]) != 10001)
    {
      if (DWORD2(v27[0]) == 1)
      {
        v22 = v27[1];
        NStatGetLog();
        v14 = objc_claimAutoreleasedReturnValue();
        v23 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
        if (v22 == 2)
        {
          if (v23)
            -[NWSRouteSnapshotter initWithSource:dest:mask:ifindex:].cold.6(v14);
        }
        else if (v23)
        {
          -[NWSRouteSnapshotter initWithSource:dest:mask:ifindex:].cold.7(v14);
        }
      }
      else
      {
        NStatGetLog();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          -[NWSRouteSnapshotter initWithSource:dest:mask:ifindex:].cold.4();
      }
      goto LABEL_7;
    }
    if (*(_OWORD **)&v27[0] != v27)
    {
      NStatGetLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[NWSRouteSnapshotter initWithSource:dest:mask:ifindex:].cold.5((uint64_t *)v27, (uint64_t)v27, v14);
      goto LABEL_7;
    }
    -[NWSSnapshotter setKernelSourceRef:](v13, "setKernelSourceRef:", *(_QWORD *)&v27[1]);
    -[NWSSnapshotter setSnapshotSource:](v13, "setSnapshotSource:", v10);
LABEL_34:
    v15 = v13;
    goto LABEL_35;
  }
  NStatGetLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    -[NWSRouteSnapshotter initWithSource:dest:mask:ifindex:].cold.1(v11, v11 == 0);
LABEL_7:

  v15 = 0;
LABEL_35:

  return v15;
}

- (void)snapshot
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8(&dword_211429000, v0, v1, "sent %ld out of %lu", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithSource:(void *)a1 dest:(char)a2 mask:ifindex:.cold.1(void *a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  if ((a2 & 1) == 0)
    objc_msgSend(a1, "length");
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5(&dword_211429000, v2, v3, "dest check failed  %p %d", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_6();
}

- (void)initWithSource:dest:mask:ifindex:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_211429000, v0, v1, "recv  failed %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)initWithSource:dest:mask:ifindex:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  v3 = 32;
  OUTLINED_FUNCTION_3(&dword_211429000, v0, v1, "recv too small, received %ld, expected %lu", v2);
  OUTLINED_FUNCTION_2();
}

- (void)initWithSource:dest:mask:ifindex:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_7(&dword_211429000, v0, v1, "received wrong message type, received (%u), expected SRC_ADDED(%u)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithSource:(NSObject *)a3 dest:mask:ifindex:.cold.5(uint64_t *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = 134218240;
  v5 = v3;
  v6 = 2048;
  v7 = a2;
  OUTLINED_FUNCTION_3(&dword_211429000, a3, (uint64_t)a3, "received wrong context, received %llu expected %lu", (uint8_t *)&v4);
  OUTLINED_FUNCTION_2();
}

- (void)initWithSource:(os_log_t)log dest:mask:ifindex:.cold.6(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_211429000, log, OS_LOG_TYPE_ERROR, "received non-critical error for SRC_ADDED", v1, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)initWithSource:(NSObject *)a1 dest:mask:ifindex:.cold.7(NSObject *a1)
{
  uint8_t v2[8];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  __error();
  OUTLINED_FUNCTION_9();
  _os_log_error_impl(&dword_211429000, a1, OS_LOG_TYPE_ERROR, "received error %d for SRC_ADDED", v2, 8u);
  OUTLINED_FUNCTION_2();
}

- (void)initWithSource:dest:mask:ifindex:.cold.9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8(&dword_211429000, v0, v1, "sent %ld out of %lu", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithSource:(void *)a1 dest:mask:ifindex:.cold.10(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "length");
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5(&dword_211429000, v1, v2, "mask check failed  %p %d", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_6();
}

@end
