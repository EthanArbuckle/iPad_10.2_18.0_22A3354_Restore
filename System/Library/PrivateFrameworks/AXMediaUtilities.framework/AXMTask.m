@implementation AXMTask

- (void)markAsComplete:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);

  v3 = a3;
  if (self->_complete)
  {
    AXMediaLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[AXMTask markAsComplete:].cold.1();

  }
  self->_complete = 1;
  -[AXMTask taskCompleteBlock](self, "taskCompleteBlock");
  v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, AXMTask *, _BOOL8))v6)[2](v6, self, v3);

}

- (BOOL)isComplete
{
  return self->_complete;
}

- (void)setComplete:(BOOL)a3
{
  self->_complete = a3;
}

- (id)taskCompleteBlock
{
  return self->_taskCompleteBlock;
}

- (void)setTaskCompleteBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_taskCompleteBlock, 0);
}

- (void)markAsComplete:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B0E3B000, v0, v1, "Task should not be complete if being marked as complete", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
