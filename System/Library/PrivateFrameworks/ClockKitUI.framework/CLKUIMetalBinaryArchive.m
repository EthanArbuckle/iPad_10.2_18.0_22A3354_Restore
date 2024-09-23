@implementation CLKUIMetalBinaryArchive

- (BOOL)_binaryArchivesFeatureEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)_hasBinaryArchive
{
  return self->_mtlBinaryArchive != 0;
}

- (BOOL)_shouldUseBinaryArchives
{
  _BOOL4 v3;

  v3 = -[CLKUIMetalBinaryArchive _binaryArchivesFeatureEnabled](self, "_binaryArchivesFeatureEnabled");
  if (v3)
    LOBYTE(v3) = -[CLKUIMetalBinaryArchive _hasBinaryArchive](self, "_hasBinaryArchive");
  return v3;
}

+ (id)archiveWithName:(id)a3 bundle:(id)a4 device:(id)a5
{
  id v7;
  id v8;
  id v9;
  CLKUIMetalBinaryArchive *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[CLKUIMetalBinaryArchive initWithName:bundle:device:]([CLKUIMetalBinaryArchive alloc], "initWithName:bundle:device:", v9, v8, v7);

  return v10;
}

- (CLKUIMetalBinaryArchive)initWithName:(id)a3 bundle:(id)a4 device:(id)a5
{
  id v9;
  id v10;
  id v11;
  CLKUIMetalBinaryArchive *v12;
  CLKUIMetalBinaryArchive *v13;
  uint64_t v14;
  MTLBinaryArchive *mtlBinaryArchive;
  NSObject *v16;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)CLKUIMetalBinaryArchive;
  v12 = -[CLKUIMetalBinaryArchive init](&v18, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_archiveName, a3);
    if (!-[CLKUIMetalBinaryArchive _binaryArchivesFeatureEnabled](v13, "_binaryArchivesFeatureEnabled"))
    {
      _CLKUILoggingObjectForDomain(2, (uint64_t)"CLKUILoggingDomainMetalBinaryArchives");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        -[CLKUIMetalBinaryArchive initWithName:bundle:device:].cold.2();
      goto LABEL_8;
    }
    -[CLKUIMetalBinaryArchive loadMTLBinaryArchiveNamed:inBundle:forDevice:](v13, "loadMTLBinaryArchiveNamed:inBundle:forDevice:", v9, v10, v11);
    v14 = objc_claimAutoreleasedReturnValue();
    mtlBinaryArchive = v13->_mtlBinaryArchive;
    v13->_mtlBinaryArchive = (MTLBinaryArchive *)v14;

    if (!-[CLKUIMetalBinaryArchive _hasBinaryArchive](v13, "_hasBinaryArchive"))
    {
      _CLKUILoggingObjectForDomain(2, (uint64_t)"CLKUILoggingDomainMetalBinaryArchives");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[CLKUIMetalBinaryArchive initWithName:bundle:device:].cold.1();
LABEL_8:

    }
  }

  return v13;
}

- (id)loadMTLBinaryArchiveNamed:(id)a3 inBundle:(id)a4 forDevice:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  double v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  id v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  NSObject *v32;
  __int16 v33;
  NSObject *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[CLKUIMetalBinaryArchive _binaryArchivesFeatureEnabled](self, "_binaryArchivesFeatureEnabled"))
  {
    objc_msgSend(v9, "URLForResource:withExtension:", v8, CFSTR("metallib"));
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = CACurrentMediaTime();
      v13 = (void *)objc_opt_new();
      objc_msgSend(v13, "setUrl:", v11);
      v24 = 0;
      v14 = (void *)-[NSObject newBinaryArchiveWithDescriptor:error:](v10, "newBinaryArchiveWithDescriptor:error:", v13, &v24);
      v15 = v24;
      -[CLKUIMetalBinaryArchive logElapsedTimeWithStart:category:name:usingBinaryArchive:](self, "logElapsedTimeWithStart:category:name:usingBinaryArchive:", 0, v8, 0, v12);
      if (!v14)
      {
        _CLKUILoggingObjectForDomain(2, (uint64_t)"CLKUILoggingDomainMetalBinaryArchives");
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        {
          objc_msgSend(v9, "bundleIdentifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "localizedDescription");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413570;
          v26 = v8;
          v27 = 2112;
          v28 = v8;
          v29 = 2112;
          v30 = v22;
          v31 = 2112;
          v32 = v11;
          v33 = 2112;
          v34 = v10;
          v35 = 2112;
          v36 = v23;
          _os_log_fault_impl(&dword_1CB9A4000, v16, OS_LOG_TYPE_FAULT, "[%@] Error: Found binary archive in bundle but failed to create MTLBinaryArchive; name=(%@) bundle=(%@) url="
            "(%@) device=(%@); error=%@",
            buf,
            0x3Eu);

        }
      }
      v17 = v14;

      v18 = v17;
    }
    else
    {
      _CLKUILoggingObjectForDomain(2, (uint64_t)"CLKUILoggingDomainMetalBinaryArchives");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v9, "bundleIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v26 = v8;
        v27 = 2112;
        v28 = v8;
        v29 = 2112;
        v30 = v21;
        v31 = 2112;
        v32 = v10;
        _os_log_error_impl(&dword_1CB9A4000, v17, OS_LOG_TYPE_ERROR, "[%@] Failed to find URL for (%@.metallib) in bundle (%@) for device (%@)", buf, 0x2Au);

      }
      v18 = 0;
    }

  }
  else
  {
    _CLKUILoggingObjectForDomain(2, (uint64_t)"CLKUILoggingDomainMetalBinaryArchives");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v9, "bundleIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v26 = v8;
      v27 = 2112;
      v28 = v8;
      v29 = 2112;
      v30 = v20;
      v31 = 2112;
      v32 = v10;
      _os_log_debug_impl(&dword_1CB9A4000, v11, OS_LOG_TYPE_DEBUG, "[%@] Tried to load MTLBinaryArchive named (%@) in bundle (%@) for device (%@) BUT the feature isn't enabled", buf, 0x2Au);

    }
    v18 = 0;
  }

  return v18;
}

- (id)newFunctionInLibrary:(id)a3 withDescriptor:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  double v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSString *archiveName;
  const __CFString *v15;
  void *v16;
  void *v17;
  int v18;
  NSString *v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[CLKUIMetalBinaryArchive _binaryArchivesFeatureEnabled](self, "_binaryArchivesFeatureEnabled"))
  {
    if (-[CLKUIMetalBinaryArchive _hasBinaryArchive](self, "_hasBinaryArchive"))
    {
      v26[0] = self->_mtlBinaryArchive;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
      v8 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setBinaryArchives:", v8);
    }
    else
    {
      _CLKUILoggingObjectForDomain(2, (uint64_t)"CLKUILoggingDomainMetalBinaryArchives");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        -[CLKUIMetalBinaryArchive newFunctionInLibrary:withDescriptor:].cold.1();
    }

  }
  v9 = CACurrentMediaTime();
  v10 = (void *)objc_msgSend(v6, "newFunctionWithDescriptor:error:", v7, 0);
  objc_msgSend(v7, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIMetalBinaryArchive logElapsedTimeWithStart:category:name:usingBinaryArchive:](self, "logElapsedTimeWithStart:category:name:usingBinaryArchive:", 2, v11, -[CLKUIMetalBinaryArchive _shouldUseBinaryArchives](self, "_shouldUseBinaryArchives"), v9);

  if (!v10)
  {
    _CLKUILoggingObjectForDomain(2, (uint64_t)"CLKUILoggingDomainMetalBinaryArchives");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      archiveName = self->_archiveName;
      if (-[CLKUIMetalBinaryArchive _hasBinaryArchive](self, "_hasBinaryArchive"))
        v15 = CFSTR("with");
      else
        v15 = CFSTR("without");
      objc_msgSend(v7, "name");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "label");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138413058;
      v19 = archiveName;
      v20 = 2112;
      v21 = v15;
      v22 = 2112;
      v23 = v16;
      v24 = 2112;
      v25 = v17;
      _os_log_fault_impl(&dword_1CB9A4000, v12, OS_LOG_TYPE_FAULT, "[%@] Error creating a MTLFunction %@ a MTLBinaryArchive; function=(%@) library=(%@)",
        (uint8_t *)&v18,
        0x2Au);

    }
  }

  return v10;
}

- (id)newRenderPipelineStateForDevice:(id)a3 withDescriptor:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  double v17;
  id v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSString *v23;
  void *v24;
  void *v25;
  NSString *archiveName;
  void *v27;
  void *v28;
  id v29;
  id v30;
  uint8_t buf[4];
  NSString *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  void *v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!-[CLKUIMetalBinaryArchive _binaryArchivesFeatureEnabled](self, "_binaryArchivesFeatureEnabled"))
  {
LABEL_14:
    v13 = 0;
    v10 = 0;
    goto LABEL_15;
  }
  if (!-[CLKUIMetalBinaryArchive _hasBinaryArchive](self, "_hasBinaryArchive"))
  {
    _CLKUILoggingObjectForDomain(2, (uint64_t)"CLKUILoggingDomainMetalBinaryArchives");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[CLKUIMetalBinaryArchive newRenderPipelineStateForDevice:withDescriptor:].cold.1();

    goto LABEL_14;
  }
  v41[0] = self->_mtlBinaryArchive;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBinaryArchives:", v8);

  v9 = CACurrentMediaTime();
  v30 = 0;
  v10 = (id)objc_msgSend(v6, "newRenderPipelineStateWithDescriptor:options:reflection:error:", v7, 4, 0, &v30);
  v11 = v30;
  objc_msgSend(v7, "label");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIMetalBinaryArchive logElapsedTimeWithStart:category:name:usingBinaryArchive:](self, "logElapsedTimeWithStart:category:name:usingBinaryArchive:", 1, v12, 1, v9);

  if (!v10 || (v13 = 0, v11))
  {
    _CLKUILoggingObjectForDomain(2, (uint64_t)"CLKUILoggingDomainMetalBinaryArchives");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      archiveName = self->_archiveName;
      objc_msgSend(v7, "label");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedDescription");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v32 = archiveName;
      v33 = 2112;
      v34 = v10;
      v35 = 2112;
      v36 = v27;
      v37 = 2112;
      v38 = v6;
      v39 = 2112;
      v40 = v28;
      _os_log_fault_impl(&dword_1CB9A4000, v14, OS_LOG_TYPE_FAULT, "[%@] Error creating a MTLRenderPipelineState with a MTLBinaryArchive; state=(%@) shader=(%@) device=(%@); error=%@",
        buf,
        0x34u);

    }
    v13 = v11;
  }
  if (v10 && !v13)
    goto LABEL_17;
LABEL_15:
  v16 = v10;

  v17 = CACurrentMediaTime();
  v29 = 0;
  v10 = (id)objc_msgSend(v6, "newRenderPipelineStateWithDescriptor:error:", v7, &v29);
  v18 = v29;

  objc_msgSend(v7, "label");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIMetalBinaryArchive logElapsedTimeWithStart:category:name:usingBinaryArchive:](self, "logElapsedTimeWithStart:category:name:usingBinaryArchive:", 1, v19, 0, v17);

  if (v10 && !v18)
  {
LABEL_17:
    v10 = v10;
    v18 = 0;
    v20 = v10;
    goto LABEL_21;
  }
  _CLKUILoggingObjectForDomain(2, (uint64_t)"CLKUILoggingDomainMetalBinaryArchives");
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
  {
    v23 = self->_archiveName;
    objc_msgSend(v7, "label");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedDescription");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v32 = v23;
    v33 = 2112;
    v34 = v10;
    v35 = 2112;
    v36 = v24;
    v37 = 2112;
    v38 = v6;
    v39 = 2112;
    v40 = v25;
    _os_log_fault_impl(&dword_1CB9A4000, v21, OS_LOG_TYPE_FAULT, "[%@] Error creating a MTLRenderPipelineState without a MTLBinaryArchive; state=(%@) shader=(%@) device=(%@); error=%@",
      buf,
      0x34u);

  }
  v20 = 0;
LABEL_21:

  return v20;
}

- (void)logElapsedTimeWithStart:(double)a3 category:(unint64_t)a4 name:(id)a5 usingBinaryArchive:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  double v11;
  __CFString *v12;
  __CFString *v13;
  NSObject *v14;
  NSObject *v15;
  NSString *archiveName;
  const __CFString *v17;
  const __CFString *v18;
  NSString *v19;
  const __CFString *v20;
  int v21;
  NSString *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  __CFString *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  double v30;
  __int16 v31;
  const __CFString *v32;
  uint64_t v33;

  v6 = a6;
  v33 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = (CACurrentMediaTime() - a3) * 1000.0;
  v12 = CFSTR("Binary Archive");
  if (a4 == 1)
    v12 = CFSTR("Render Pipeline");
  if (a4 == 2)
    v12 = CFSTR("Function");
  v13 = v12;
  _CLKUILoggingObjectForDomain(2, (uint64_t)"CLKUILoggingDomainMetalBinaryArchives");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    archiveName = self->_archiveName;
    if (v6)
      v17 = CFSTR("YES");
    else
      v17 = CFSTR("NO");
    if (-[CLKUIMetalBinaryArchive _hasBinaryArchive](self, "_hasBinaryArchive"))
      v18 = (const __CFString *)self->_archiveName;
    else
      v18 = CFSTR("nil");
    v21 = 138413570;
    v22 = archiveName;
    v23 = 2048;
    v24 = *(_QWORD *)&v11;
    v25 = 2112;
    v26 = v13;
    v27 = 2112;
    v28 = v10;
    v29 = 2112;
    v30 = *(double *)&v17;
    v31 = 2112;
    v32 = v18;
    _os_log_debug_impl(&dword_1CB9A4000, v14, OS_LOG_TYPE_DEBUG, "[%@] Took (%g ms) to create the (%@) named (%@); usingBinaryArchive=(%@), archive=(%@)",
      (uint8_t *)&v21,
      0x3Eu);
  }

  if (-[CLKUIMetalBinaryArchive _hasBinaryArchive](self, "_hasBinaryArchive") && v6 && v11 >= 32.0)
  {
    _CLKUILoggingObjectForDomain(2, (uint64_t)"CLKUILoggingDomainMetalBinaryArchives");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v19 = self->_archiveName;
      if (-[CLKUIMetalBinaryArchive _hasBinaryArchive](self, "_hasBinaryArchive"))
        v20 = (const __CFString *)self->_archiveName;
      else
        v20 = CFSTR("nil");
      v21 = 138413570;
      v22 = v19;
      v23 = 2048;
      v24 = 0x4040000000000000;
      v25 = 2112;
      v26 = v13;
      v27 = 2112;
      v28 = v10;
      v29 = 2048;
      v30 = v11;
      v31 = 2112;
      v32 = v20;
      _os_log_error_impl(&dword_1CB9A4000, v15, OS_LOG_TYPE_ERROR, "[%@] ERROR: Exceeded (%g ms) using a MTLBinaryArchive to create the (%@) named (%@)! totalDuration=(%g ms), archive=(%@)", (uint8_t *)&v21, 0x3Eu);
    }

  }
}

- (MTLBinaryArchive)mtlBinaryArchive
{
  return self->_mtlBinaryArchive;
}

- (void)setMtlBinaryArchive:(id)a3
{
  objc_storeStrong((id *)&self->_mtlBinaryArchive, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mtlBinaryArchive, 0);
  objc_storeStrong((id *)&self->_archiveName, 0);
}

- (void)initWithName:bundle:device:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_1CB9A4000, v0, OS_LOG_TYPE_ERROR, "[%@] Created a CLKUIMetalBinaryArchive object with name (%@) but MTLBinaryArchive failed to load", v1, 0x16u);
  OUTLINED_FUNCTION_2();
}

- (void)initWithName:bundle:device:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1CB9A4000, v0, v1, "[%@] Created a CLKUIMetalBinaryArchive object with name (%@) but the binary archive feature isn't enabled", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)newFunctionInLibrary:withDescriptor:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1CB9A4000, v0, v1, "[%@] Requesting new MTLFunction and binary archives are enabled but the archive is nil; name=(%@)",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_2();
}

- (void)newRenderPipelineStateForDevice:withDescriptor:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1CB9A4000, v0, v1, "[%@] Requesting new MTLRenderPipelineState and binary archives are enabled but the archive is nil; name=(%@)",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_2();
}

@end
