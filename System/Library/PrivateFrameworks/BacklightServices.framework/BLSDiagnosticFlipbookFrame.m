@implementation BLSDiagnosticFlipbookFrame

+ (id)createWithFrame:(id)a3
{
  id v4;
  void *v5;

  if (a3)
  {
    v4 = a3;
    v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithFrame:", v4);

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (BLSDiagnosticFlipbookFrame)initWithFrame:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  int v8;
  int v9;
  int v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  BLSDiagnosticFlipbookFrame *v25;

  v4 = a3;
  v5 = objc_msgSend(v4, "presentationTime");
  v6 = objc_msgSend(v4, "frameId");
  objc_msgSend(v4, "apl");
  v8 = v7;
  objc_msgSend(v4, "aplDimming");
  v10 = v9;
  v11 = objc_msgSend(v4, "memoryUsage");
  objc_msgSend(v4, "rawSurfaceFrame");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v20 = objc_msgSend(v4, "isInverted");
  objc_msgSend(v4, "bls_specifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bls_uuid");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v23) = v8;
  LODWORD(v24) = v10;
  v25 = -[BLSDiagnosticFlipbookFrame initWithPresentationTime:frameId:apl:aplDimming:memoryUsage:rawSurfaceFrameRect:inverted:specifier:uuid:](self, "initWithPresentationTime:frameId:apl:aplDimming:memoryUsage:rawSurfaceFrameRect:inverted:specifier:uuid:", v5, v6, v11, v20, v21, v22, v23, v24, v13, v15, v17, v19);

  return v25;
}

- (BLSDiagnosticFlipbookFrame)initWithPresentationTime:(unint64_t)a3 frameId:(unint64_t)a4 apl:(float)a5 aplDimming:(float)a6 memoryUsage:(unint64_t)a7 rawSurfaceFrameRect:(CGRect)a8 inverted:(BOOL)a9 specifier:(id)a10 uuid:(id)a11
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v23;
  id v24;
  BLSDiagnosticFlipbookFrame *v25;
  BLSDiagnosticFlipbookFrame *v26;
  uint64_t v27;
  BLSDiagnosticPresentationDateSpecifier *specifier;
  NSUUID *v29;
  NSUUID *uuid;
  objc_super v32;

  height = a8.size.height;
  width = a8.size.width;
  y = a8.origin.y;
  x = a8.origin.x;
  v23 = a10;
  v24 = a11;
  v32.receiver = self;
  v32.super_class = (Class)BLSDiagnosticFlipbookFrame;
  v25 = -[BLSDiagnosticFlipbookFrame init](&v32, sel_init);
  v26 = v25;
  if (v25)
  {
    v25->_presentationTime = a3;
    v25->_frameId = a4;
    v25->_apl = a5;
    v25->_aplDimming = a6;
    v25->_memoryUsage = a7;
    v25->_rawSurfaceFrame.origin.x = x;
    v25->_rawSurfaceFrame.origin.y = y;
    v25->_rawSurfaceFrame.size.width = width;
    v25->_rawSurfaceFrame.size.height = height;
    v25->_inverted = a9;
    +[BLSDiagnosticPresentationDateSpecifier createWithSpecifier:](BLSDiagnosticPresentationDateSpecifier, "createWithSpecifier:", v23);
    v27 = objc_claimAutoreleasedReturnValue();
    specifier = v26->_specifier;
    v26->_specifier = (BLSDiagnosticPresentationDateSpecifier *)v27;

    if (v24)
    {
      v29 = (NSUUID *)v24;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v29 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    }
    uuid = v26->_uuid;
    v26->_uuid = v29;

  }
  return v26;
}

- (BLSPresentationDateSpecifying)bls_specifier
{
  return (BLSPresentationDateSpecifying *)self->_specifier;
}

- (__IOSurface)surface
{
  void *v3;
  __IOSurface *v4;

  -[BLSDiagnosticFlipbookFrame surfaceProvider](self, "surfaceProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (__IOSurface *)objc_msgSend(v3, "surfaceForFrame:", self);

  return v4;
}

- (__IOSurface)rawSurface
{
  void *v3;
  __IOSurface *v4;

  -[BLSDiagnosticFlipbookFrame surfaceProvider](self, "surfaceProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (__IOSurface *)objc_msgSend(v3, "rawSurfaceForFrame:", self);

  return v4;
}

- (id)bls_loggingString
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  float v12;
  id v13;
  float v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BLSLoggingStringForMachTime(-[BLSDiagnosticFlipbookFrame presentationTime](self, "presentationTime"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v4, CFSTR("presentationTime"));

  v5 = (id)objc_msgSend(v3, "appendUInt64:withName:", -[BLSDiagnosticFlipbookFrame frameId](self, "frameId"), CFSTR("frameId"));
  -[BLSDiagnosticFlipbookFrame bls_specifier](self, "bls_specifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bls_loggingString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v3, "appendObject:withName:", v7, CFSTR("specifier"));

  +[BLSMemoryByteCountFormatter sharedFormatter](BLSMemoryByteCountFormatter, "sharedFormatter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringFromByteCount:", -[BLSDiagnosticFlipbookFrame memoryUsage](self, "memoryUsage"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v3, "appendObject:withName:", v10, CFSTR("memoryUsage"));

  -[BLSDiagnosticFlipbookFrame apl](self, "apl");
  v13 = (id)objc_msgSend(v3, "appendFloat:withName:decimalPrecision:", CFSTR("apl"), 3, v12);
  -[BLSDiagnosticFlipbookFrame aplDimming](self, "aplDimming");
  v15 = (id)objc_msgSend(v3, "appendFloat:withName:decimalPrecision:", CFSTR("dimming"), 3, v14);
  -[BLSDiagnosticFlipbookFrame rawSurfaceFrame](self, "rawSurfaceFrame");
  v16 = (id)objc_msgSend(v3, "appendRect:withName:", CFSTR("rawSurfaceFrame"));
  v17 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[BLSDiagnosticFlipbookFrame isInverted](self, "isInverted"), CFSTR("inverted"), 1);
  -[BLSDiagnosticFlipbookFrame uuid](self, "uuid");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "UUIDString");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (id)objc_msgSend(v3, "appendObject:withName:", v19, CFSTR("uuid"));

  objc_msgSend(v3, "build");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)bls_shortLoggingString
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  float v11;
  id v12;
  float v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendUInt64:withName:", -[BLSDiagnosticFlipbookFrame frameId](self, "frameId"), CFSTR("frameId"));
  -[BLSDiagnosticFlipbookFrame bls_specifier](self, "bls_specifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[BLSDiagnosticFlipbookFrame bls_specifier](self, "bls_specifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bls_shortLoggingString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:withName:", v7, &stru_1E621CBD8);

  }
  else
  {
    BLSShortLoggingStringForMachTime(-[BLSDiagnosticFlipbookFrame presentationTime](self, "presentationTime"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:withName:", v6, &stru_1E621CBD8);
  }

  +[BLSMemoryByteCountFormatter sharedFormatter](BLSMemoryByteCountFormatter, "sharedFormatter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringFromByteCount:", -[BLSDiagnosticFlipbookFrame memoryUsage](self, "memoryUsage"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v3, "appendObject:withName:", v9, CFSTR("memoryUsage"));

  -[BLSDiagnosticFlipbookFrame apl](self, "apl");
  v12 = (id)objc_msgSend(v3, "appendFloat:withName:decimalPrecision:", CFSTR("apl"), 3, v11);
  -[BLSDiagnosticFlipbookFrame aplDimming](self, "aplDimming");
  v14 = (id)objc_msgSend(v3, "appendFloat:withName:decimalPrecision:", CFSTR("dimming"), 3, v13);
  -[BLSDiagnosticFlipbookFrame rawSurfaceFrame](self, "rawSurfaceFrame");
  v15 = (id)objc_msgSend(v3, "appendRect:withName:", CFSTR("rawSurfaceFrame"));
  v16 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[BLSDiagnosticFlipbookFrame isInverted](self, "isInverted"), CFSTR("inverted"), 1);
  -[BLSDiagnosticFlipbookFrame uuid](self, "uuid");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "UUIDString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (id)objc_msgSend(v3, "appendObject:withName:", v18, CFSTR("uuid"));

  objc_msgSend(v3, "build");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  unint64_t v13;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendInt64:", -[BLSDiagnosticFlipbookFrame presentationTime](self, "presentationTime"));
  v5 = (id)objc_msgSend(v3, "appendInt64:", -[BLSDiagnosticFlipbookFrame frameId](self, "frameId"));
  -[BLSDiagnosticFlipbookFrame bls_specifier](self, "bls_specifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendUnsignedInteger:", objc_msgSend(v6, "hash"));

  v8 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[BLSDiagnosticFlipbookFrame memoryUsage](self, "memoryUsage"));
  -[BLSDiagnosticFlipbookFrame rawSurfaceFrame](self, "rawSurfaceFrame");
  v9 = (id)objc_msgSend(v3, "appendCGRect:");
  -[BLSDiagnosticFlipbookFrame apl](self, "apl");
  v10 = (id)objc_msgSend(v3, "appendFloat:");
  -[BLSDiagnosticFlipbookFrame aplDimming](self, "aplDimming");
  v11 = (id)objc_msgSend(v3, "appendFloat:");
  v12 = (id)objc_msgSend(v3, "appendBool:", -[BLSDiagnosticFlipbookFrame isInverted](self, "isInverted"));
  v13 = objc_msgSend(v3, "hash");

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  unint64_t v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  unint64_t v16;
  id v17;
  id v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  id v27;
  id v28;
  int v29;
  id v30;
  double v31;
  id v32;
  int v33;
  id v34;
  double v35;
  id v36;
  _BOOL8 v37;
  id v38;
  id v39;
  uint64_t v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t);
  void *v44;
  id v45;
  _QWORD v46[4];
  id v47;
  _QWORD v48[4];
  id v49;
  _QWORD v50[4];
  id v51;
  _QWORD v52[4];
  id v53;
  _QWORD v54[4];
  id v55;
  _QWORD v56[4];
  id v57;
  _QWORD v58[4];
  id v59;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[BLSDiagnosticFlipbookFrame presentationTime](self, "presentationTime");
  v7 = MEMORY[0x1E0C809B0];
  v58[0] = MEMORY[0x1E0C809B0];
  v58[1] = 3221225472;
  v58[2] = __38__BLSDiagnosticFlipbookFrame_isEqual___block_invoke;
  v58[3] = &unk_1E621A830;
  v8 = v4;
  v59 = v8;
  v9 = (id)objc_msgSend(v5, "appendInt64:counterpart:", v6, v58);
  v10 = -[BLSDiagnosticFlipbookFrame frameId](self, "frameId");
  v56[0] = v7;
  v56[1] = 3221225472;
  v56[2] = __38__BLSDiagnosticFlipbookFrame_isEqual___block_invoke_2;
  v56[3] = &unk_1E621A830;
  v11 = v8;
  v57 = v11;
  v12 = (id)objc_msgSend(v5, "appendInt64:counterpart:", v10, v56);
  -[BLSDiagnosticFlipbookFrame bls_specifier](self, "bls_specifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v54[0] = v7;
  v54[1] = 3221225472;
  v54[2] = __38__BLSDiagnosticFlipbookFrame_isEqual___block_invoke_3;
  v54[3] = &unk_1E621AD18;
  v14 = v11;
  v55 = v14;
  v15 = (id)objc_msgSend(v5, "appendObject:counterpart:", v13, v54);

  v16 = -[BLSDiagnosticFlipbookFrame memoryUsage](self, "memoryUsage");
  v52[0] = v7;
  v52[1] = 3221225472;
  v52[2] = __38__BLSDiagnosticFlipbookFrame_isEqual___block_invoke_4;
  v52[3] = &unk_1E621AD40;
  v17 = v14;
  v53 = v17;
  v18 = (id)objc_msgSend(v5, "appendUnsignedInteger:counterpart:", v16, v52);
  -[BLSDiagnosticFlipbookFrame rawSurfaceFrame](self, "rawSurfaceFrame");
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v50[0] = v7;
  v50[1] = 3221225472;
  v50[2] = __38__BLSDiagnosticFlipbookFrame_isEqual___block_invoke_5;
  v50[3] = &unk_1E621AD68;
  v27 = v17;
  v51 = v27;
  v28 = (id)objc_msgSend(v5, "appendCGRect:counterpart:", v50, v20, v22, v24, v26);
  -[BLSDiagnosticFlipbookFrame apl](self, "apl");
  LODWORD(v20) = v29;
  v48[0] = v7;
  v48[1] = 3221225472;
  v48[2] = __38__BLSDiagnosticFlipbookFrame_isEqual___block_invoke_6;
  v48[3] = &unk_1E621AD90;
  v30 = v27;
  v49 = v30;
  LODWORD(v31) = LODWORD(v20);
  v32 = (id)objc_msgSend(v5, "appendFloat:counterpart:", v48, v31);
  -[BLSDiagnosticFlipbookFrame aplDimming](self, "aplDimming");
  LODWORD(v20) = v33;
  v46[0] = v7;
  v46[1] = 3221225472;
  v46[2] = __38__BLSDiagnosticFlipbookFrame_isEqual___block_invoke_7;
  v46[3] = &unk_1E621AD90;
  v34 = v30;
  v47 = v34;
  LODWORD(v35) = LODWORD(v20);
  v36 = (id)objc_msgSend(v5, "appendFloat:counterpart:", v46, v35);
  v37 = -[BLSDiagnosticFlipbookFrame isInverted](self, "isInverted");
  v41 = v7;
  v42 = 3221225472;
  v43 = __38__BLSDiagnosticFlipbookFrame_isEqual___block_invoke_8;
  v44 = &unk_1E621ACF0;
  v45 = v34;
  v38 = v34;
  v39 = (id)objc_msgSend(v5, "appendBool:counterpart:", v37, &v41);
  LOBYTE(v34) = objc_msgSend(v5, "isEqual", v41, v42, v43, v44);

  return (char)v34;
}

uint64_t __38__BLSDiagnosticFlipbookFrame_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentationTime");
}

uint64_t __38__BLSDiagnosticFlipbookFrame_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "frameId");
}

uint64_t __38__BLSDiagnosticFlipbookFrame_isEqual___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "bls_specifier");
}

uint64_t __38__BLSDiagnosticFlipbookFrame_isEqual___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "memoryUsage");
}

uint64_t __38__BLSDiagnosticFlipbookFrame_isEqual___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "rawSurfaceFrame");
}

uint64_t __38__BLSDiagnosticFlipbookFrame_isEqual___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "apl");
}

uint64_t __38__BLSDiagnosticFlipbookFrame_isEqual___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "aplDimming");
}

uint64_t __38__BLSDiagnosticFlipbookFrame_isEqual___block_invoke_8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "isInverted");
}

- (BLSDiagnosticFlipbookFrame)initWithXPCDictionary:(id)a3
{
  id v4;
  uint64_t uint64;
  uint64_t v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  _BOOL8 v18;
  void *v19;
  BLSDiagnosticPresentationDateSpecifier *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  NSObject *v26;
  BLSDiagnosticFlipbookFrame *v27;

  v4 = a3;
  uint64 = xpc_dictionary_get_uint64(v4, (const char *)objc_msgSend(CFSTR("presentationTime"), "UTF8String"));
  v6 = xpc_dictionary_get_uint64(v4, (const char *)objc_msgSend(CFSTR("frameId"), "UTF8String"));
  v7 = xpc_dictionary_get_double(v4, (const char *)objc_msgSend(CFSTR("apl"), "UTF8String"));
  v8 = xpc_dictionary_get_double(v4, (const char *)objc_msgSend(CFSTR("dimming"), "UTF8String"));
  v9 = xpc_dictionary_get_uint64(v4, (const char *)objc_msgSend(CFSTR("memoryUsage"), "UTF8String"));
  objc_msgSend(CFSTR("rawSurfaceFrame"), "UTF8String");
  BSDeserializeCGRectFromXPCDictionaryWithKey();
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v18 = xpc_dictionary_get_BOOL(v4, (const char *)objc_msgSend(CFSTR("inverted"), "UTF8String"));
  xpc_dictionary_get_dictionary(v4, (const char *)objc_msgSend(CFSTR("specifier"), "UTF8String"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = -[BLSDiagnosticPresentationDateSpecifier initWithXPCDictionary:]([BLSDiagnosticPresentationDateSpecifier alloc], "initWithXPCDictionary:", v19);
  }
  else
  {
    bls_diagnostics_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      -[BLSDiagnosticFlipbookFrame initWithXPCDictionary:].cold.2();

    v20 = 0;
  }
  xpc_dictionary_get_value(v4, (const char *)objc_msgSend(CFSTR("uuid"), "UTF8String"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", xpc_uuid_get_bytes(v22));
  }
  else
  {
    bls_diagnostics_log();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
      -[BLSDiagnosticFlipbookFrame initWithXPCDictionary:].cold.1();

    v23 = 0;
  }
  *(float *)&v25 = v8;
  *(float *)&v24 = v7;
  v27 = -[BLSDiagnosticFlipbookFrame initWithPresentationTime:frameId:apl:aplDimming:memoryUsage:rawSurfaceFrameRect:inverted:specifier:uuid:](self, "initWithPresentationTime:frameId:apl:aplDimming:memoryUsage:rawSurfaceFrameRect:inverted:specifier:uuid:", uint64, v6, v9, v18, v20, v23, v24, v25, v11, v13, v15, v17);

  return v27;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v4;
  const char *v5;
  xpc_object_t v6;
  const char *v7;
  xpc_object_t v8;
  unsigned __int8 uuid[8];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  xpc_dictionary_set_uint64(v4, (const char *)objc_msgSend(CFSTR("presentationTime"), "UTF8String"), self->_presentationTime);
  xpc_dictionary_set_uint64(v4, (const char *)objc_msgSend(CFSTR("frameId"), "UTF8String"), self->_frameId);
  xpc_dictionary_set_double(v4, (const char *)objc_msgSend(CFSTR("apl"), "UTF8String"), self->_apl);
  xpc_dictionary_set_double(v4, (const char *)objc_msgSend(CFSTR("dimming"), "UTF8String"), self->_aplDimming);
  xpc_dictionary_set_uint64(v4, (const char *)objc_msgSend(CFSTR("memoryUsage"), "UTF8String"), self->_memoryUsage);
  objc_msgSend(CFSTR("rawSurfaceFrame"), "UTF8String");
  BSSerializeCGRectToXPCDictionaryWithKey();
  xpc_dictionary_set_BOOL(v4, (const char *)objc_msgSend(CFSTR("inverted"), "UTF8String"), self->_inverted);
  v5 = (const char *)objc_msgSend(CFSTR("specifier"), "UTF8String");
  v6 = xpc_dictionary_create(0, 0, 0);
  -[BLSDiagnosticPresentationDateSpecifier encodeWithXPCDictionary:](self->_specifier, "encodeWithXPCDictionary:", v6);
  xpc_dictionary_set_value(v4, v5, v6);
  v7 = (const char *)objc_msgSend(CFSTR("uuid"), "UTF8String");
  *(_QWORD *)uuid = 0;
  v10 = 0;
  -[NSUUID getUUIDBytes:](self->_uuid, "getUUIDBytes:", uuid);
  v8 = xpc_uuid_create(uuid);
  xpc_dictionary_set_value(v4, v7, v8);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BLSDiagnosticFlipbookFrame)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  int v8;
  int v9;
  int v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  BLSDiagnosticFlipbookFrame *v26;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("presentationTime"));
  v6 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("frameId"));
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("apl"));
  v8 = v7;
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("dimming"));
  v10 = v9;
  v11 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("memoryUsage"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rawSurfaceFrame"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bs_CGRectValue");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v21 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("inverted"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("specifier"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uuid"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v24) = v8;
  LODWORD(v25) = v10;
  v26 = -[BLSDiagnosticFlipbookFrame initWithPresentationTime:frameId:apl:aplDimming:memoryUsage:rawSurfaceFrameRect:inverted:specifier:uuid:](self, "initWithPresentationTime:frameId:apl:aplDimming:memoryUsage:rawSurfaceFrameRect:inverted:specifier:uuid:", v5, v6, v11, v21, v22, v23, v24, v25, v14, v16, v18, v20);

  return v26;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t presentationTime;
  double v5;
  double v6;
  void *v7;
  id v8;

  presentationTime = self->_presentationTime;
  v8 = a3;
  objc_msgSend(v8, "encodeInt64:forKey:", presentationTime, CFSTR("presentationTime"));
  objc_msgSend(v8, "encodeInt64:forKey:", self->_frameId, CFSTR("frameId"));
  *(float *)&v5 = self->_apl;
  objc_msgSend(v8, "encodeFloat:forKey:", CFSTR("apl"), v5);
  *(float *)&v6 = self->_aplDimming;
  objc_msgSend(v8, "encodeFloat:forKey:", CFSTR("dimming"), v6);
  objc_msgSend(v8, "encodeInteger:forKey:", self->_memoryUsage, CFSTR("memoryUsage"));
  objc_msgSend(MEMORY[0x1E0CB3B18], "bs_valueWithCGRect:", self->_rawSurfaceFrame.origin.x, self->_rawSurfaceFrame.origin.y, self->_rawSurfaceFrame.size.width, self->_rawSurfaceFrame.size.height);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("rawSurfaceFrame"));

  objc_msgSend(v8, "encodeBool:forKey:", self->_inverted, CFSTR("inverted"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_specifier, CFSTR("specifier"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_uuid, CFSTR("uuid"));

}

- (unint64_t)presentationTime
{
  return self->_presentationTime;
}

- (unint64_t)frameId
{
  return self->_frameId;
}

- (float)apl
{
  return self->_apl;
}

- (float)aplDimming
{
  return self->_aplDimming;
}

- (unint64_t)memoryUsage
{
  return self->_memoryUsage;
}

- (CGRect)rawSurfaceFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_rawSurfaceFrame.origin.x;
  y = self->_rawSurfaceFrame.origin.y;
  width = self->_rawSurfaceFrame.size.width;
  height = self->_rawSurfaceFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)isInverted
{
  return self->_inverted;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (BLSDiagnosticFlipbookFrameSurfaceProvider)surfaceProvider
{
  return (BLSDiagnosticFlipbookFrameSurfaceProvider *)objc_loadWeakRetained((id *)&self->_surfaceProvider);
}

- (void)setSurfaceProvider:(id)a3
{
  objc_storeWeak((id *)&self->_surfaceProvider, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_surfaceProvider);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_specifier, 0);
}

- (void)initWithXPCDictionary:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_6(&dword_1B0C75000, v0, v1, "uuid missing from encoding: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)initWithXPCDictionary:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_6(&dword_1B0C75000, v0, v1, "specifier missing from encoding: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

@end
