@implementation VCMediaStreamRateAdaptation

- (VCMediaStreamRateAdaptation)initWithDelegate:(id)a3 params:(const tagVCMediaStreamRateAdaptationParams *)a4
{
  VCMediaStreamRateAdaptation *v5;
  __int128 v6;
  opaqueRTCReporting *var2;
  AVCRateController *v8;
  id var0;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  id v14;
  objc_super v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)VCMediaStreamRateAdaptation;
  v5 = -[VCMediaStreamRateAdaptation init](&v15, sel_init);
  if (v5)
  {
    FigCFWeakReferenceStore();
    v5->_mode = a4->var3;
    *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v11 = v6;
    v12 = v6;
    v13 = v6;
    var0 = a4->var0;
    LOWORD(v11) = 256;
    var2 = a4->var2;
    *((_QWORD *)&v11 + 1) = 0;
    *(_QWORD *)&v12 = var2;
    BYTE8(v12) = 1;
    *(_QWORD *)&v13 = 0;
    BYTE8(v13) = 0;
    v14 = -[VCRateControllerManager getRateControllerSharingGroupWithConnection:usePolicy:](+[VCRateControllerManager sharedInstance](VCRateControllerManager, "sharedInstance"), "getRateControllerSharingGroupWithConnection:usePolicy:", a4->var9, +[VCMediaStreamRateAdaptation resolvePolicyForCurrentConnection:](VCMediaStreamRateAdaptation, "resolvePolicyForCurrentConnection:", a4->var9));
    v8 = -[AVCRateController initWithDelegate:params:]([AVCRateController alloc], "initWithDelegate:params:", v5, &var0);
    v5->_vcrcRateController = v8;
    if (v8)
    {
      -[VCMediaStreamRateAdaptation configureRateControllerWithConfig:](v5, "configureRateControllerWithConfig:", &a4->var4);
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaStreamRateAdaptation initWithDelegate:params:].cold.1();
      }

      return 0;
    }
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  FigCFWeakReferenceStore();

  v3.receiver = self;
  v3.super_class = (Class)VCMediaStreamRateAdaptation;
  -[VCMediaStreamRateAdaptation dealloc](&v3, sel_dealloc);
}

+ (unsigned)resolvePolicyForCurrentConnection:(id)a3
{
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

- (void)configureRateControllerWithConfig:(const tagVCMediaStreamRateAdaptationConfig *)a3
{
  unint64_t v3;
  unint64_t v4;
  int mode;
  int *p_mode;
  unsigned int var1;
  unsigned int var3;
  AVCRateController *vcrcRateController;
  int *v11;
  unsigned int var2;
  BOOL v13;
  int v14;
  uint64_t v15;
  NSObject *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  _DWORD *v22;
  uint64_t v23;
  _DWORD v24[3];
  uint64_t v25;
  unsigned int v26;
  char v27;
  _BYTE v28[7];
  uint64_t v29;
  int v30;
  int v31;
  unsigned int v32;
  unsigned int v33;
  double v34;
  double v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  p_mode = &self->_mode;
  mode = self->_mode;
  if (mode == 3)
  {
    var2 = a3->var1.var0.var2;
    v13 = a3->var1.var0.var3 == 2;
    memset(v28, 170, sizeof(v28));
    if (v13)
      v14 = 9;
    else
      v14 = 8;
    vcrcRateController = self->_vcrcRateController;
    v24[1] = 0;
    v24[2] = 0;
    v24[0] = v14;
    v25 = *(_QWORD *)&a3->var1.var0.var0;
    v26 = var2;
    v27 = 0;
    v29 = 0;
    v30 = v13 << 13;
    v31 = -1431655766;
    v11 = v24;
    goto LABEL_8;
  }
  if (mode == 1)
  {
    var1 = a3->var1.var0.var1;
    var3 = a3->var1.var0.var3;
    LODWORD(v3) = a3->var1.var0.var0;
    LODWORD(v4) = a3->var1.var0.var2;
    bzero(v24, 0x3D0uLL);
    v32 = var1;
    v33 = var3;
    v34 = (double)v3;
    v35 = (double)v4;
    vcrcRateController = self->_vcrcRateController;
    v17 = 10;
    v18 = 0;
    v20 = 0;
    v19 = 0;
    v21 = 0;
    v22 = v24;
    v23 = 0;
    v11 = &v17;
LABEL_8:
    -[AVCRateController configure:](vcrcRateController, "configure:", v11);
    return;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v15 = VRTraceErrorLogLevelToCSTR();
    v16 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCMediaStreamRateAdaptation configureRateControllerWithConfig:].cold.1(v15, p_mode, v16);
  }
}

- (BOOL)start
{
  VCMediaStreamRateAdaptationDelegate *v3;

  v3 = (VCMediaStreamRateAdaptationDelegate *)MEMORY[0x1DF086F1C](&self->_delegateWeak, a2);
  self->_delegate = v3;
  if (v3)
    return -[AVCRateController start](self->_vcrcRateController, "start");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCMediaStreamRateAdaptation start].cold.1();
  }
  return 0;
}

- (BOOL)stop
{
  VCMediaStreamRateAdaptationDelegate *delegate;

  delegate = self->_delegate;
  if (delegate)
  {
    CFRelease(delegate);
    self->_delegate = 0;
  }
  return -[AVCRateController stop](self->_vcrcRateController, "stop");
}

- (BOOL)updateRateControlWithNetworkNotification:(tagVCNWConnectionNotification *)a3
{
  -[VCNWConnectionCongestionDetector processNWConnectionNotification:](-[AVCRateController nwConnectionCongestionDetector](self->_vcrcRateController, "nwConnectionCongestionDetector"), "processNWConnectionNotification:", a3);
  return 1;
}

- (void)rateController:(id)a3 targetBitrateDidChange:(unsigned int)a4 rateChangeCounter:(unsigned int)a5
{
  if (self->_vcrcRateController == a3)
    -[VCMediaStreamRateAdaptationDelegate rateAdaptation:targetBitrateDidChange:rateChangeCounter:](self->_delegate, "rateAdaptation:targetBitrateDidChange:rateChangeCounter:", self, *(_QWORD *)&a4, *(_QWORD *)&a5);
}

- (AVCRateController)vcrcRateController
{
  return self->_vcrcRateController;
}

- (void)initWithDelegate:params:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Cannot create rate controller!", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)configureRateControllerWithConfig:(os_log_t)log .cold.1(uint64_t a1, int *a2, os_log_t log)
{
  int v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = *a2;
  v4 = 136315906;
  v5 = a1;
  v6 = 2080;
  v7 = "-[VCMediaStreamRateAdaptation configureRateControllerWithConfig:]";
  v8 = 1024;
  v9 = 100;
  v10 = 1024;
  v11 = v3;
  _os_log_error_impl(&dword_1D8A54000, log, OS_LOG_TYPE_ERROR, " [%s] %s:%d mode=%d is not supported yet", (uint8_t *)&v4, 0x22u);
  OUTLINED_FUNCTION_3();
}

- (void)start
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Cannot load and retain delegate successfully!", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

@end
