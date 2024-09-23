@implementation CIRenderTask

- (CIRenderTask)init
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
    -[CIRenderTask init].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);

  return 0;
}

- (CIRenderTask)initWithInternalTask:(void *)a3
{
  CIRenderTask *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CIRenderTask;
  v4 = -[CIRenderTask init](&v6, sel_init);
  if (v4)
    v4->_priv = (void *)CI::Object::ref((uint64_t)a3);
  return v4;
}

+ (CIRenderTask)rendertaskWithInternalTask:(void *)a3
{
  return (CIRenderTask *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithInternalTask:", a3);
}

- (void)internalRepresentation
{
  return self->_priv;
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
  v4.super_class = (Class)CIRenderTask;
  -[CIRenderTask dealloc](&v4, sel_dealloc);
}

- (CIRenderInfo)waitUntilCompletedAndReturnError:(NSError *)error
{
  _QWORD *priv;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  CFTypeRef v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  priv = self->_priv;
  if (priv[16])
  {
    if (error)
      *error = (NSError *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CIRenderTaskWaitUntilCompleted"), 1, &unk_1E2F1D620);
    v5 = ci_logger_api();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[CIRenderTask waitUntilCompletedAndReturnError:].cold.2(v5, v6, v7, v8, v9, v10, v11, v12);
    return 0;
  }
  v14 = (*(uint64_t (**)(_QWORD, SEL))(*(_QWORD *)priv[3] + 272))(priv[3], a2);
  v15 = CI::RenderTask::waitUntilCompleted((uint64_t)priv, v14);
  if (v15)
  {
    v16 = (void *)v15;
    if (error)
    {
      v17 = *MEMORY[0x1E0CB3388];
      v20[0] = CFSTR("CINonLocalizedDescriptionKey");
      v20[1] = v17;
      v21[0] = CFSTR("Unexpected error in the backing renderer.");
      v21[1] = v15;
      *error = (NSError *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CIRenderTaskWaitUntilCompleted"), 1, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2));
    }
    v18 = ci_logger_api();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[CIRenderTask waitUntilCompletedAndReturnError:].cold.1(v16);

    return 0;
  }
  return +[CIRenderInfo renderInfoWithCompletedTask:](CIRenderInfo, "renderInfoWithCompletedTask:", self);
}

- (id)_pdfDataRepresentation
{
  return (id)CI::RenderTask::quicklookDataForRenderTask((CI::RenderTask *)self->_priv);
}

- (void)init
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s init is not a valid initializer for CIRenderTask", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)waitUntilCompletedAndReturnError:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "description");
  OUTLINED_FUNCTION_1(&dword_1921E4000, v1, v2, "%{public}s Unexpected error in the backing renderer: %{public}@.", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)waitUntilCompletedAndReturnError:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s Unexpected error in the backing renderer.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

@end
