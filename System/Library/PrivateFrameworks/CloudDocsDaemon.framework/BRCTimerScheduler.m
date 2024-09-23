@implementation BRCTimerScheduler

- (BRCTimerScheduler)initWithAccountSession:(id)a3 timerName:(id)a4 sqlTable:(id)a5 field:(id)a6 timerHandler:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  BRCTimerScheduler *v17;
  BRCTimerScheduler *v18;
  uint64_t v19;
  id handler;
  id v22;
  objc_super v23;

  v22 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)BRCTimerScheduler;
  v17 = -[BRCTimerScheduler init](&v23, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->_isCancelled = 0;
    objc_storeStrong((id *)&v17->_session, a3);
    v18->_suspended = 1;
    objc_storeStrong((id *)&v18->_name, a4);
    objc_storeStrong((id *)&v18->_sqlTable, a5);
    objc_storeStrong((id *)&v18->_field, a6);
    v19 = MEMORY[0x1D17A6DB0](v16);
    handler = v18->_handler;
    v18->_handler = (id)v19;

  }
  return v18;
}

- (void)close
{
  if (!self->_isCancelled)
    -[BRCTimerScheduler cancel](self, "cancel");
}

- (void)resume
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: can't resume timer scheduler when already canceled: %@%@");
  OUTLINED_FUNCTION_2();
}

uint64_t __27__BRCTimerScheduler_resume__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 64))
  {
    v2 = result;
    (*(void (**)(void))(*(_QWORD *)(v1 + 56) + 16))();
    return objc_msgSend(*(id *)(v2 + 32), "reschedule");
  }
  return result;
}

void __27__BRCTimerScheduler_resume__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 16);
  *(_QWORD *)(v1 + 16) = 0;

}

uint64_t __27__BRCTimerScheduler_resume__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reschedule");
}

- (void)cancel
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: timer scheduler already canceled: %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)reschedule
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Reschedule %@%@");
  OUTLINED_FUNCTION_2();
}

- (BOOL)isCancelled
{
  return self->_isCancelled;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_field, 0);
  objc_storeStrong((id *)&self->_sqlTable, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

@end
