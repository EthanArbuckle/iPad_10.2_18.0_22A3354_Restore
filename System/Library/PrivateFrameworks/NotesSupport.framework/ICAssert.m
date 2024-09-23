@implementation ICAssert

+ (void)handleFailedAssertWithCondition:(const char *)a3 functionName:(const char *)a4 simulateCrash:(BOOL)a5 showAlert:(BOOL)a6 alertMessage:(id)a7 format:(id)a8
{
  _BOOL4 v9;
  _BOOL4 v10;
  id v13;
  objc_class *v14;
  id v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  const char *v26;
  const char *v27;
  _BOOL4 v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  BOOL v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  BOOL v47;
  uint8_t buf[4];
  const char *v49;
  __int16 v50;
  const char *v51;
  __int16 v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;

  v9 = a6;
  v10 = a5;
  v54 = *MEMORY[0x1E0C80C00];
  v13 = a7;
  v14 = (objc_class *)MEMORY[0x1E0CB3940];
  v15 = a8;
  v16 = (void *)objc_msgSend([v14 alloc], "initWithFormat:arguments:", v15, &v55);

  v17 = os_log_create("com.apple.notes", "Assert");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v49 = a3;
    v50 = 2080;
    v51 = a4;
    v52 = 2112;
    v53 = v16;
    _os_log_error_impl(&dword_1DDAA5000, v17, OS_LOG_TYPE_ERROR, "Failed assertion (%s) in %s: %@", buf, 0x20u);
  }

  if (v10)
  {
    v18 = os_log_create("com.apple.notes", "SimulatedCrash");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:alertMessage:format:].cold.1((uint64_t)v16, v18, v19, v20, v21, v22, v23, v24);

  }
  if (v9)
  {
    v47 = v10;
    v25 = v13;
    v26 = a4;
    v27 = a3;
    v28 = +[ICUtilities isInternalInstall](ICUtilities, "isInternalInstall");
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "bundleIdentifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    ICNotesAppBundleIdentifier();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "isEqualToString:", v31);

    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "environment");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("SuppressAssertionAlerts"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (objc_msgSend(v35, "BOOLValue") & 1) != 0
       || +[ICDeviceSupport isRunningUnitTests](ICDeviceSupport, "isRunningUnitTests");

    v13 = v25;
    if ((v28 & v32) == 1 && !v36)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Notes TTR: %@"), v16);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed assertion (%s) in %s:\n%@"), v27, v26, v16);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("I got this alert right after I...\n\n%@"), v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v47)
      {
        v40 = os_log_create("com.apple.notes", "SimulatedCrash");
        if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
          +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:alertMessage:format:].cold.1((uint64_t)v16, v40, v41, v42, v43, v44, v45, v46);

      }
      +[ICRadarUtilities promptUserToFileBugWithAlertMessage:bugTitle:bugDescription:](ICRadarUtilities, "promptUserToFileBugWithAlertMessage:bugTitle:bugDescription:", v13, v37, v39);

    }
  }

}

+ (void)handleFailedAssertWithCondition:(const char *)a3 functionName:(const char *)a4 simulateCrash:(BOOL)a5 showAlert:(BOOL)a6 format:(id)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  objc_class *v12;
  id v13;
  void *v14;
  uint64_t v15;

  v7 = a6;
  v8 = a5;
  v12 = (objc_class *)MEMORY[0x1E0CB3940];
  v13 = a7;
  v14 = (void *)objc_msgSend([v12 alloc], "initWithFormat:arguments:", v13, &v15);

  objc_msgSend(a1, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:alertMessage:format:", a3, a4, v8, v7, CFSTR("You encountered a serious bug in Notes. Will you please file a Radar?"), CFSTR("%@"), v14);
}

+ (void)handleFailedAssertWithCondition:(uint64_t)a3 functionName:(uint64_t)a4 simulateCrash:(uint64_t)a5 showAlert:(uint64_t)a6 alertMessage:(uint64_t)a7 format:(uint64_t)a8 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1DDAA5000, a2, a3, "%@", a5, a6, a7, a8, 2u);
}

@end
