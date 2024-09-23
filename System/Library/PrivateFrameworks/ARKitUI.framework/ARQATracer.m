@implementation ARQATracer

void __51__ARQATracer_ARKitAdditions___startScreenRecording__block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    _ARLogGeneral_1();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = (objc_class *)objc_opt_class();
      NSStringFromClass(v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 138543618;
      v8 = v5;
      v9 = 2048;
      v10 = v6;
      _os_log_impl(&dword_1DCC73000, v3, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not start screen recording", (uint8_t *)&v7, 0x16u);

    }
  }
}

void __50__ARQATracer_ARKitAdditions___stopScreenRecording__block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    _ARLogGeneral_1();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = (objc_class *)objc_opt_class();
      NSStringFromClass(v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 138543618;
      v8 = v5;
      v9 = 2048;
      v10 = v6;
      _os_log_impl(&dword_1DCC73000, v3, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not stop screen recording", (uint8_t *)&v7, 0x16u);

    }
  }
}

@end
