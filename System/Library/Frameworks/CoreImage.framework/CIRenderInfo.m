@implementation CIRenderInfo

- (CIRenderInfo)init
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = ci_logger_api();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    -[CIRenderInfo init].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);

  return 0;
}

- (CIRenderInfo)initWithCompletedTask:(id)a3
{
  CIRenderInfo *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CIRenderInfo;
  v4 = -[CIRenderInfo init](&v7, sel_init);
  if (v4)
  {
    v5 = objc_msgSend(a3, "internalRepresentation");
    if (v5)
      v5 = CI::Object::ref(v5);
    v4->_priv = (void *)v5;
  }
  return v4;
}

+ (CIRenderInfo)renderInfoWithCompletedTask:(id)a3
{
  return -[CIRenderInfo initWithCompletedTask:]([CIRenderInfo alloc], "initWithCompletedTask:", a3);
}

- (void)dealloc
{
  CI::Object *priv;
  objc_super v4;

  priv = (CI::Object *)self->_priv;
  if (priv)
  {
    CI::Object::unref(priv);
    self->_priv = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CIRenderInfo;
  -[CIRenderInfo dealloc](&v4, sel_dealloc);
}

- (NSTimeInterval)kernelExecutionTime
{
  return *((double *)self->_priv + 21);
}

- (NSTimeInterval)kernelCompileTime
{
  return *((double *)self->_priv + 22);
}

- (int64_t)kernelExecutionCycles
{
  return *((_QWORD *)self->_priv + 24);
}

- (NSInteger)passCount
{
  return *((_QWORD *)self->_priv + 25);
}

- (NSInteger)pixelsProcessed
{
  return *((_QWORD *)self->_priv + 26);
}

- (int64_t)pixelsOverdrawn
{
  return *((_QWORD *)self->_priv + 27);
}

- (id)description
{
  void *priv;
  void *v3;
  double v4;
  double v5;
  double v6;
  objc_super v8;

  priv = self->_priv;
  if (priv)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p> {\n  passCount: %ld \n  pixelsProcessed: %ld \n"), objc_msgSend((id)objc_opt_class(), "description"), self, *((_QWORD *)priv + 25), *((_QWORD *)priv + 26));
    v4 = *((double *)priv + 21);
    if (v4 > 0.0)
      v3 = (void *)objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("  kernelExecutionTime: %.3fms \n"), v4 * 1000.0);
    v5 = *((double *)priv + 23);
    if (v5 > 0.0)
      v3 = (void *)objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("  compileWaitTime: %.3fms \n"), v5 * 1000.0);
    v6 = *((double *)priv + 22);
    if (v6 > 0.0)
      v3 = (void *)objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("  compileTime: %.3fms \n"), v6 * 1000.0);
    return (id)objc_msgSend(v3, "stringByAppendingString:", CFSTR("}\n"));
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CIRenderInfo;
    return -[CIRenderInfo description](&v8, sel_description);
  }
}

- (id)_pdfDataRepresentation
{
  return (id)CI::RenderTask::quicklookDataForRenderInfo((CI::RenderTask *)self->_priv);
}

- (void)init
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s init is not a valid initializer for CIRenderInfo", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

@end
