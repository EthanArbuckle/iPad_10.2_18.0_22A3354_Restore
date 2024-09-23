@implementation BKUILegacyOperationsHandler

- (void)advanceEnrollmentState
{
  void *v3;
  void *v4;
  double v5;
  uint64_t v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  int v21;
  double v22;
  int v23;
  void *v24;
  double v25;
  void *v26;
  int v27;
  NSObject *v28;
  id v29;
  double v30;
  double v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  int v36;
  void *v37;
  uint64_t v38;
  _BOOL4 v39;
  NSObject *v40;
  _BOOL4 v41;
  unint64_t v42;
  void *v43;
  void *v44;
  int v45;
  void *v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t buf[4];
  const __CFString *v53;
  __int16 v54;
  _BYTE v55[10];
  _DWORD v56[4];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  -[BKUIFaceIDEnrollOperationsHandler operationsDelegate](self, "operationsDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[BKUIFaceIDEnrollOperationsHandler bioKitCompletionPercentage](self, "bioKitCompletionPercentage");
  v6 = (int)(v5 * 100.0);
  -[BKUIFaceIDEnrollOperationsHandler operationsDelegate](self, "operationsDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "percentOfPillsCompleted");
  objc_msgSend(v4, "stringWithFormat:", CFSTR("BioKit: %d%%, rings: %d%%"), v6, (int)(v8 * 100.0));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setProgressString:", v9);

  -[BKUIFaceIDEnrollOperationsHandler operationsDelegate](self, "operationsDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_updateDebugLabel");

  -[BKUIFaceIDEnrollOperationsHandler operationsDelegate](self, "operationsDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "percentOfPillsCompleted");
  v13 = v12;

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  -[BKUIFaceIDEnrollOperationsHandler poseStatus](self, "poseStatus");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v49;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v49 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * v18++), "integerValue");
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
    }
    while (v16);
  }

  _BKUILoggingFacility();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    -[BKUIFaceIDEnrollOperationsHandler operationsDelegate](self, "operationsDelegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "state");
    -[BKUIFaceIDEnrollOperationsHandler bioKitCompletionPercentage](self, "bioKitCompletionPercentage");
    v23 = (int)(v22 * 100.0);
    -[BKUIFaceIDEnrollOperationsHandler operationsDelegate](self, "operationsDelegate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "percentOfPillsCompleted");
    *(_DWORD *)buf = 134218752;
    v53 = *(const __CFString **)&v13;
    v54 = 1024;
    *(_DWORD *)v55 = v21;
    *(_WORD *)&v55[4] = 1024;
    *(_DWORD *)&v55[6] = v23;
    LOWORD(v56[0]) = 1024;
    *(_DWORD *)((char *)v56 + 2) = (int)(v25 * 100.0);
    _os_log_impl(&dword_1DB281000, v19, OS_LOG_TYPE_DEFAULT, "advanceEnrollmentState evaluate next state for advancement... percentPillsCompleted:%f state:%i BioKit: %d%%, rings: %d%%", buf, 0x1Eu);

  }
  -[BKUIFaceIDEnrollOperationsHandler operationsDelegate](self, "operationsDelegate");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "state");

  if (v27 == 5 && v13 >= 1.0)
  {
    _BKUILoggingFacility();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB281000, v28, OS_LOG_TYPE_DEFAULT, "Finishing 1st phase and continuing moving to 1st scan complete...", buf, 2u);
    }

    -[BKUIFaceIDEnrollOperationsHandler operationsDelegate](self, "operationsDelegate");
    v29 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setState:animated:afterDelay:", 6, 1, 1.0);
    goto LABEL_33;
  }
  -[BKUIFaceIDEnrollOperationsHandler operationsDelegate](self, "operationsDelegate");
  v29 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v29, "state") != 7 || v13 < 1.0)
  {
LABEL_33:

    return;
  }
  -[BKUIFaceIDEnrollOperationsHandler bioKitCompletionPercentage](self, "bioKitCompletionPercentage");
  v31 = v30;

  if (v31 >= 1.0)
  {
    _BKUILoggingFacility();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      -[BKUIFaceIDEnrollOperationsHandler bioKitCompletionPercentage](self, "bioKitCompletionPercentage");
      v34 = v33;
      -[BKUIFaceIDEnrollOperationsHandler operationsDelegate](self, "operationsDelegate");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "state");
      *(_DWORD *)buf = 138412802;
      v53 = CFSTR("Legacy");
      v54 = 2048;
      *(_QWORD *)v55 = v34;
      *(_WORD *)&v55[8] = 1024;
      v56[0] = v36 == 7;
      _os_log_impl(&dword_1DB281000, v32, OS_LOG_TYPE_DEFAULT, "Finishing %@ enroll operation... %f %i", buf, 0x1Cu);

    }
    -[BKUIFaceIDEnrollOperationsHandler enrollOperation](self, "enrollOperation");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "state");

    if (v38 != 4)
    {
      v47 = 0;
      v39 = -[BKUIFaceIDEnrollOperationsHandler _completeOperationWithError:](self, "_completeOperationWithError:", &v47);
      v29 = v47;
      _BKUILoggingFacility();
      v40 = objc_claimAutoreleasedReturnValue();
      v41 = os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT);
      if (v39)
      {
        if (v41)
        {
          *(_DWORD *)buf = 138412290;
          v53 = CFSTR("Legacy");
          _os_log_impl(&dword_1DB281000, v40, OS_LOG_TYPE_DEFAULT, "%@ enroll operation marked as completed!", buf, 0xCu);
        }

        v42 = -[BKUIFaceIDEnrollOperationsHandler enrollmentConfiguration](self, "enrollmentConfiguration");
        -[BKUIFaceIDEnrollOperationsHandler operationsDelegate](self, "operationsDelegate");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = v43;
        if (!v42
          || (v45 = objc_msgSend(v43, "state"),
              v44,
              -[BKUIFaceIDEnrollOperationsHandler operationsDelegate](self, "operationsDelegate"),
              v44 = (void *)objc_claimAutoreleasedReturnValue(),
              v45 == 7))
        {
          objc_msgSend(v44, "setState:animated:afterDelay:", 8, 1, 0.5);
LABEL_32:

          goto LABEL_33;
        }
        -[BKUIFaceIDEnrollOperationsHandler operationsDelegate](self, "operationsDelegate");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "setState:animated:afterDelay:", objc_msgSend(v46, "state") + 1, 1, 0.5);
      }
      else
      {
        if (v41)
        {
          *(_DWORD *)buf = 138412546;
          v53 = CFSTR("Legacy");
          v54 = 2112;
          *(_QWORD *)v55 = v29;
          _os_log_impl(&dword_1DB281000, v40, OS_LOG_TYPE_DEFAULT, "Failed to complete %@ enroll operation: %@", buf, 0x16u);
        }

        -[BKUIFaceIDEnrollOperationsHandler operationsDelegate](self, "operationsDelegate");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to complete %@ enroll: %@"), CFSTR("Legacy"), v29);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "setStatus:", v46);
      }

      goto LABEL_32;
    }
  }
}

- (void)enrollOperation:(id)a3 finishedWithEnrollResult:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  objc_msgSend(v6, "enrolledIdentity");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
    -[BKUILegacyOperationsHandler enrollOperation:finishedWithEnrollResult:].cold.1();
  v8 = (void *)v7;
  -[BKUIFaceIDEnrollOperationsHandler operationsDelegate](self, "operationsDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "enrollOperation:finishedWithIdentity:animateImmediately:", v10, v8, 0);

  -[BKUIFaceIDEnrollOperationsHandler cleanupEnroll](self, "cleanupEnroll");
}

- (void)startEnroll
{
  -[BKUIFaceIDEnrollOperationsHandler setUserSelectedUseAccessibilityEnrollment:](self, "setUserSelectedUseAccessibilityEnrollment:", 0);
  -[BKUIFaceIDEnrollOperationsHandler startEnrollForEnrollmentType:glassesRequirement:identity:operationStartedActionBlock:](self, "startEnrollForEnrollmentType:glassesRequirement:identity:operationStartedActionBlock:", 1, 0, 0, 0);
}

+ (id)handlersForEnrollmentConfiguration:(unint64_t)a3 inBuddy:(BOOL)a4 delegate:(id)a5 credential:(id)a6 externalizedAuthContext:(id)a7
{
  _BOOL8 v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  BKUILegacyOperationsHandler *v15;

  v9 = a4;
  v10 = (void *)MEMORY[0x1E0C99DE8];
  v11 = a7;
  v12 = a6;
  v13 = a5;
  objc_msgSend(v10, "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_alloc_init(BKUILegacyOperationsHandler);
  objc_msgSend(v14, "addObject:", v15);
  -[BKUIFaceIDEnrollOperationsHandler setEnrollmentType:](v15, "setEnrollmentType:", 1);
  -[BKUIFaceIDEnrollOperationsHandler setOperationsDelegate:](v15, "setOperationsDelegate:", v13);

  -[BKUIFaceIDEnrollOperationsHandler setInbuddy:](v15, "setInbuddy:", v9);
  -[BKUIFaceIDEnrollOperationsHandler setEnrollmentConfiguration:](v15, "setEnrollmentConfiguration:", 0);
  -[BKUIFaceIDEnrollOperationsHandler setCredential:](v15, "setCredential:", v12);

  -[BKUIFaceIDEnrollOperationsHandler setExternalizedAuthContext:](v15, "setExternalizedAuthContext:", v11);
  return v14;
}

- (void)enrollOperation:finishedWithEnrollResult:.cold.1()
{
  __assert_rtn("-[BKUILegacyOperationsHandler enrollOperation:finishedWithEnrollResult:]", "BKUILegacyOperationsHandler.m", 61, "enrolledIdentity != nil");
}

@end
