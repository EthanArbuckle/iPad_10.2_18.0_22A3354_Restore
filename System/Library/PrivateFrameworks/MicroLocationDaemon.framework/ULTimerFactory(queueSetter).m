@implementation ULTimerFactory(queueSetter)

+ (void)setPrimaryQueue:()queueSetter .cold.1()
{
  void *v0;
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  NSObject *v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  NSObject *v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  boost::exception_detail::clone_base *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint8_t v26;

  _CLLogObjectForCategory_MicroLocation_Default();
  v1 = objc_claimAutoreleasedReturnValue();
  if (OUTLINED_FUNCTION_5(v1))
  {
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_3(&dword_2419D9000, v2, v3, "{\"msg%{public}.0s\":\"#ULTimerFactory, Trying to set a global queue while a different global queue is already set\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v4, v5, v6, v7, v22, v23, v24, v25, v26);
  }

  _CLLogObjectForCategory_MicroLocation_Default();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v8))
  {
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_1(&dword_2419D9000, v9, v10, v11, "#ULTimerFactory, Trying to set a global queue while a different global queue is already set", "{\"msg%{public}.0s\":\"#ULTimerFactory, Trying to set a global queue while a different global queue is already set\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v12, v13, v22, v23, v24, v25, v26);
  }

  _CLLogObjectForCategory_MicroLocation_Default();
  v14 = objc_claimAutoreleasedReturnValue();
  if (OUTLINED_FUNCTION_4(v14))
  {
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_2(&dword_2419D9000, v15, v16, "{\"msg%{public}.0s\":\"#ULTimerFactory, Trying to set a global queue while a different global queue is already set\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v17, v18, v19, v20, v22, v23, v24, v25, v26);
  }

  v21 = (boost::exception_detail::clone_base *)abort_report_np();
  boost::exception_detail::clone_base::~clone_base(v21);
}

@end
