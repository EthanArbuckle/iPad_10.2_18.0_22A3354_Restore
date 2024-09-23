@implementation _ANEInputBuffersReady

+ (id)new
{
  return 0;
}

- (_ANEInputBuffersReady)init
{

  return 0;
}

- (id)initInputsProcedureIndex:(unsigned int)a3 inputBufferInfoIndex:(id)a4 inputFreeValue:(id)a5 executionDelay:(unint64_t)a6
{
  id v11;
  id v12;
  _ANEInputBuffersReady *v13;
  _ANEInputBuffersReady *v14;
  objc_super v16;

  v11 = a4;
  v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)_ANEInputBuffersReady;
  v13 = -[_ANEInputBuffersReady init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_procedureIndex = a3;
    objc_storeStrong((id *)&v13->_inputBufferInfoIndex, a4);
    objc_storeStrong((id *)&v14->_inputFreeValue, a5);
    v14->_executionDelay = a6;
  }

  return v14;
}

+ (id)inputBuffersWithProcedureIndex:(unsigned int)a3 inputBufferInfoIndex:(id)a4 inputFreeValue:(id)a5 executionDelay:(unint64_t)a6
{
  uint64_t v8;
  id v10;
  id v11;
  void *v12;

  v8 = *(_QWORD *)&a3;
  v10 = a5;
  v11 = a4;
  v12 = (void *)objc_msgSend(objc_alloc((Class)a1), "initInputsProcedureIndex:inputBufferInfoIndex:inputFreeValue:executionDelay:", v8, v11, v10, a6);

  return v12;
}

- (BOOL)validate
{
  void *v4;
  unint64_t v5;
  NSObject *v6;
  void *v7;
  unint64_t v8;

  -[_ANEInputBuffersReady inputBufferInfoIndex](self, "inputBufferInfoIndex");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5 >= 0x100)
  {
    +[_ANELog common](_ANELog, "common");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[_ANEInputBuffersReady validate].cold.1(a2, self);
LABEL_7:

    return 0;
  }
  -[_ANEInputBuffersReady inputFreeValue](self, "inputFreeValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 >= 0x100)
  {
    +[_ANELog common](_ANELog, "common");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[_ANEInputBuffersReady validate].cold.2(a2, self);
    goto LABEL_7;
  }
  return 1;
}

- (unsigned)procedureIndex
{
  return self->_procedureIndex;
}

- (NSArray)inputBufferInfoIndex
{
  return self->_inputBufferInfoIndex;
}

- (NSArray)inputFreeValue
{
  return self->_inputFreeValue;
}

- (unint64_t)executionDelay
{
  return self->_executionDelay;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputFreeValue, 0);
  objc_storeStrong((id *)&self->_inputBufferInfoIndex, 0);
}

- (void)validate
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  NSStringFromSelector(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "inputFreeValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_0_5(&dword_1D3352000, v5, v6, "%@: inputFreeValue[%lu] count is greater than kANEMaxBuffers=%d", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2_3();
}

@end
