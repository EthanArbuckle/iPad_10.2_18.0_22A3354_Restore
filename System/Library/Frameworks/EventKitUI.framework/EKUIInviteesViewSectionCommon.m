@implementation EKUIInviteesViewSectionCommon

+ (id)deleteRowAction:(id)a3 forRow:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1E0DC36C8];
  objc_msgSend(v5, "titleForDeleteConfirmationButtonForRow:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __56__EKUIInviteesViewSectionCommon_deleteRowAction_forRow___block_invoke;
  v13[3] = &unk_1E601C538;
  v14 = v5;
  v15 = v6;
  v9 = v6;
  v10 = v5;
  objc_msgSend(v7, "contextualActionWithStyle:title:handler:", 1, v8, v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void __56__EKUIInviteesViewSectionCommon_deleteRowAction_forRow___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v4;
  uint64_t v5;
  void (**v6)(id, uint64_t);

  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = a4;
  objc_msgSend(v4, "commitEditingStyle:forRow:", 1, v5);
  v6[2](v6, 1);

}

+ (id)setRoleRowActionWithParticipant:(id)a3 withSetRoleBlock:(id)a4 forSections:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id *v15;
  id *v16;
  id *v17;
  id v18;
  id v19;
  id v20;
  uint64_t *v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(_QWORD *, void *, void *, void *);
  void *v30;
  void *v31;
  id v32;
  id v33;
  _QWORD v34[4];
  void *v35;
  id v36;
  id v37;

  v7 = a4;
  v8 = a5;
  objc_msgSend(a3, "participant");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "participantRole");
  EventKitUIBundle();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10 == 2)
  {
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Make Required"), &stru_1E601DFA8, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)MEMORY[0x1E0DC36C8];
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __94__EKUIInviteesViewSectionCommon_setRoleRowActionWithParticipant_withSetRoleBlock_forSections___block_invoke;
    v34[3] = &unk_1E601C560;
    v15 = &v37;
    v36 = v8;
    v37 = v7;
    v16 = &v35;
    v17 = &v36;
    v35 = v9;
    v18 = v8;
    v19 = v9;
    v20 = v7;
    v21 = v34;
  }
  else
  {
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Make Optional"), &stru_1E601DFA8, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)MEMORY[0x1E0DC36C8];
    v27 = MEMORY[0x1E0C809B0];
    v28 = 3221225472;
    v29 = __94__EKUIInviteesViewSectionCommon_setRoleRowActionWithParticipant_withSetRoleBlock_forSections___block_invoke_12;
    v30 = &unk_1E601C560;
    v15 = &v33;
    v32 = v8;
    v33 = v7;
    v16 = &v31;
    v17 = &v32;
    v31 = v9;
    v22 = v8;
    v23 = v9;
    v24 = v7;
    v21 = &v27;
  }
  objc_msgSend(v14, "contextualActionWithStyle:title:handler:", 0, v13, v21, v27, v28, v29, v30);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

void __94__EKUIInviteesViewSectionCommon_setRoleRowActionWithParticipant_withSetRoleBlock_forSections___block_invoke(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void (**v9)(id, uint64_t);
  uint64_t v10;
  NSObject *v11;
  __int16 v12[8];

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = a1[6];
  if (v10)
  {
    (*(void (**)(uint64_t, _QWORD, uint64_t, _QWORD))(v10 + 16))(v10, a1[4], 1, a1[5]);
    v9[2](v9, 1);
  }
  else
  {
    v11 = kEKUILogInviteesHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR))
    {
      v12[0] = 0;
      _os_log_impl(&dword_1AF84D000, v11, OS_LOG_TYPE_ERROR, "No 'participant set role' callback defined.  Will not toggle participant", (uint8_t *)v12, 2u);
    }
    v9[2](v9, 0);
  }

}

void __94__EKUIInviteesViewSectionCommon_setRoleRowActionWithParticipant_withSetRoleBlock_forSections___block_invoke_12(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void (**v9)(id, uint64_t);
  uint64_t v10;
  NSObject *v11;
  __int16 v12[8];

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = a1[6];
  if (v10)
  {
    (*(void (**)(uint64_t, _QWORD, uint64_t, _QWORD))(v10 + 16))(v10, a1[4], 2, a1[5]);
    v9[2](v9, 1);
  }
  else
  {
    v11 = kEKUILogInviteesHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR))
    {
      v12[0] = 0;
      _os_log_impl(&dword_1AF84D000, v11, OS_LOG_TYPE_ERROR, "No 'participant set role' callback defined.  Will not toggle participant.", (uint8_t *)v12, 2u);
    }
    v9[2](v9, 0);
  }

}

@end
