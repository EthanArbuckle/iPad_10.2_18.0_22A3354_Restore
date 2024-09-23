@implementation EKJunkInvitationProtocol_Shared

+ (unint64_t)junkStatusForInvitation:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;

  v3 = (void *)MEMORY[0x1E0D0C298];
  v4 = a3;
  objc_msgSend(v3, "defaultProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reputationStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend((id)objc_opt_class(), "junkStatusForInvitation:withReputationStore:", v4, v6);
  return v7;
}

+ (unint64_t)junkStatusForInvitation:(id)a3 withReputationStore:(id)a4
{
  id v5;
  id v6;
  char v7;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "supportsJunkReporting");
  +[EKLogSubsystem junk](EKLogSubsystem, "junk");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
  if ((v7 & 1) == 0)
  {
    if (v9)
      +[EKJunkInvitationProtocol_Shared junkStatusForInvitation:withReputationStore:].cold.4(v8, v10, v11, v12, v13, v14, v15, v16);

    goto LABEL_23;
  }
  if (v9)
    +[EKJunkInvitationProtocol_Shared junkStatusForInvitation:withReputationStore:].cold.3(v8, v10, v11, v12, v13, v14, v15, v16);

  objc_msgSend(v5, "sendersEmail");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v18 = (void *)MEMORY[0x1E0D0C298];
    objc_msgSend(v5, "sendersEmail");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "shouldPermitOrganizerEmailFromJunkChecks:inReputationStore:", v19, v6);
  }
  else
  {
    objc_msgSend(v5, "sendersPhoneNumber");
    v21 = objc_claimAutoreleasedReturnValue();

    if (!v21)
      goto LABEL_12;
    v22 = (void *)MEMORY[0x1E0D0C298];
    objc_msgSend(v5, "sendersPhoneNumber");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v22, "shouldPermitOrganizerPhoneNumberFromJunkChecks:inReputationStore:", v19, v6);
  }
  v21 = v20;

LABEL_12:
  +[EKLogSubsystem junk](EKLogSubsystem, "junk");
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    +[EKJunkInvitationProtocol_Shared junkStatusForInvitation:withReputationStore:].cold.2(v21, v23, v24, v25, v26, v27, v28, v29);

  if ((v21 & 1) != 0)
    goto LABEL_23;
  objc_msgSend(v5, "sendersEmail");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    objc_msgSend(v5, "eventStore");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sendersEmail");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v31, "shouldPermitOrganizerEmailFromJunkChecks:", v32);
  }
  else
  {
    objc_msgSend(v5, "sendersPhoneNumber");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v34)
      goto LABEL_20;
    objc_msgSend(v5, "eventStore");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sendersPhoneNumber");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v31, "shouldPermitOrganizerPhoneNumberFromJunkChecks:", v32);
  }
  v34 = (void *)v33;

LABEL_20:
  +[EKLogSubsystem junk](EKLogSubsystem, "junk");
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
    +[EKJunkInvitationProtocol_Shared junkStatusForInvitation:withReputationStore:].cold.1((uint64_t)v34, v35, v36, v37, v38, v39, v40, v41);

  if (!(_DWORD)v34)
  {
    v42 = 3;
    goto LABEL_24;
  }
LABEL_23:
  v42 = 2;
LABEL_24:

  return v42;
}

+ (void)junkStatusForInvitation:(uint64_t)a3 withReputationStore:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_8(&dword_1A2318000, a2, a3, "(junkStatusForInvitation) our eventstore reputation check returned that we should %@ the organizer", a5, a6, a7, a8, 2u);
}

+ (void)junkStatusForInvitation:(uint64_t)a3 withReputationStore:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_8(&dword_1A2318000, a2, a3, "(junkStatusForInvitation) our contacts reputation check returned that we should %@ the organizer", a5, a6, a7, a8, 2u);
}

+ (void)junkStatusForInvitation:(uint64_t)a3 withReputationStore:(uint64_t)a4 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1A2318000, a1, a3, "(junkStatusForInvitation) junk reporting is supported on the server", a5, a6, a7, a8, 0);
}

+ (void)junkStatusForInvitation:(uint64_t)a3 withReputationStore:(uint64_t)a4 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1A2318000, a1, a3, "(junkStatusForInvitation) junk reporting is not supported on the server", a5, a6, a7, a8, 0);
}

@end
