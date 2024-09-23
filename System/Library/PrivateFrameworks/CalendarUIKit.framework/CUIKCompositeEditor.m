@implementation CUIKCompositeEditor

- (CUIKCompositeEditor)initWithEditors:(id)a3
{
  id v5;
  CUIKCompositeEditor *v6;
  CUIKCompositeEditor *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CUIKCompositeEditor;
  v6 = -[CUIKCompositeEditor init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_editors, a3);

  return v7;
}

- (BOOL)saveNewEvents:(id)a3 commit:(BOOL)a4 error:(id *)a5
{
  id v8;
  char v9;
  _QWORD v11[6];
  BOOL v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v8 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__6;
  v21 = __Block_byref_object_dispose__6;
  v22 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 1;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __50__CUIKCompositeEditor_saveNewEvents_commit_error___block_invoke;
  v11[3] = &unk_1E6EB69F0;
  v12 = a4;
  v11[4] = &v17;
  v11[5] = &v13;
  -[CUIKCompositeEditor dispatchEvents:block:](self, "dispatchEvents:block:", v8, v11);
  if (a5)
    *a5 = objc_retainAutorelease((id)v18[5]);
  v9 = *((_BYTE *)v14 + 24);
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);

  return v9;
}

void __50__CUIKCompositeEditor_saveNewEvents_commit_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;
  char v8;
  id obj;

  v6 = *(unsigned __int8 *)(a1 + 48);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  obj = *(id *)(v7 + 40);
  v8 = objc_msgSend(a2, "saveNewEvents:commit:error:", a3, v6, &obj);
  objc_storeStrong((id *)(v7 + 40), obj);
  if ((v8 & 1) == 0)
  {
    *a4 = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
}

- (void)saveChangesToEvents:(id)a3 span:(int64_t)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__CUIKCompositeEditor_saveChangesToEvents_span___block_invoke;
  v4[3] = &__block_descriptor_40_e44_v32__0___CUIKEditorExtended__8__NSSet_16_B24l;
  v4[4] = a4;
  -[CUIKCompositeEditor dispatchEvents:block:](self, "dispatchEvents:block:", a3, v4);
}

uint64_t __48__CUIKCompositeEditor_saveChangesToEvents_span___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "saveChangesToEvents:span:", a3, *(_QWORD *)(a1 + 32));
}

- (BOOL)saveEvent:(id)a3 span:(int64_t)a4 error:(id *)a5
{
  id v8;
  id v9;
  char v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t *v15;
  int64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v8 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__6;
  v25 = __Block_byref_object_dispose__6;
  v26 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 1;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __44__CUIKCompositeEditor_saveEvent_span_error___block_invoke;
  v12[3] = &unk_1E6EB6A38;
  v14 = &v17;
  v9 = v8;
  v15 = &v21;
  v16 = a4;
  v13 = v9;
  -[CUIKCompositeEditor dispatchEvent:block:](self, "dispatchEvent:block:", v9, v12);
  if (a5)
    *a5 = objc_retainAutorelease((id)v22[5]);
  v10 = *((_BYTE *)v18 + 24);

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);

  return v10;
}

void __44__CUIKCompositeEditor_saveEvent_span_error___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  id obj;

  v3 = a1[4];
  v4 = a1[7];
  v5 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v5 + 40);
  v6 = objc_msgSend(a2, "saveEvent:span:error:", v3, v4, &obj);
  objc_storeStrong((id *)(v5 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = v6;
}

- (BOOL)commitEventForOOPModificationRecording:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  char v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v6 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__6;
  v22 = __Block_byref_object_dispose__6;
  v23 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 1;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __68__CUIKCompositeEditor_commitEventForOOPModificationRecording_error___block_invoke;
  v10[3] = &unk_1E6EB6A60;
  v12 = &v14;
  v7 = v6;
  v11 = v7;
  v13 = &v18;
  -[CUIKCompositeEditor dispatchEvent:block:](self, "dispatchEvent:block:", v7, v10);
  if (a4)
    *a4 = objc_retainAutorelease((id)v19[5]);
  v8 = *((_BYTE *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);

  return v8;
}

void __68__CUIKCompositeEditor_commitEventForOOPModificationRecording_error___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;
  id obj;

  v3 = a1[4];
  v4 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v4 + 40);
  v5 = objc_msgSend(a2, "commitEventForOOPModificationRecording:error:", v3, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = v5;
}

- (BOOL)saveEventForOOPModificationRecording:(id)a3 span:(int64_t)a4 error:(id *)a5
{
  id v8;
  id v9;
  char v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t *v15;
  int64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v8 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__6;
  v25 = __Block_byref_object_dispose__6;
  v26 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 1;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __71__CUIKCompositeEditor_saveEventForOOPModificationRecording_span_error___block_invoke;
  v12[3] = &unk_1E6EB6A38;
  v14 = &v17;
  v9 = v8;
  v15 = &v21;
  v16 = a4;
  v13 = v9;
  -[CUIKCompositeEditor dispatchEvent:block:](self, "dispatchEvent:block:", v9, v12);
  if (a5)
    *a5 = objc_retainAutorelease((id)v22[5]);
  v10 = *((_BYTE *)v18 + 24);

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);

  return v10;
}

void __71__CUIKCompositeEditor_saveEventForOOPModificationRecording_span_error___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  id obj;

  v3 = a1[4];
  v4 = a1[7];
  v5 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v5 + 40);
  v6 = objc_msgSend(a2, "saveEventForOOPModificationRecording:span:error:", v3, v4, &obj);
  objc_storeStrong((id *)(v5 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = v6;
}

- (void)saveChangesToEvents:(id)a3 impliedCommitDecision:(BOOL)a4
{
  _QWORD v4[4];
  BOOL v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __65__CUIKCompositeEditor_saveChangesToEvents_impliedCommitDecision___block_invoke;
  v4[3] = &__block_descriptor_33_e44_v32__0___CUIKEditorExtended__8__NSSet_16_B24l;
  v5 = a4;
  -[CUIKCompositeEditor dispatchEvents:block:](self, "dispatchEvents:block:", a3, v4);
}

uint64_t __65__CUIKCompositeEditor_saveChangesToEvents_impliedCommitDecision___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "saveChangesToEvents:impliedCommitDecision:", a3, *(unsigned __int8 *)(a1 + 32));
}

- (void)deleteEvents:(id)a3
{
  -[CUIKCompositeEditor dispatchEvents:block:](self, "dispatchEvents:block:", a3, &__block_literal_global_8);
}

uint64_t __36__CUIKCompositeEditor_deleteEvents___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "deleteEvents:");
}

- (BOOL)deleteEvent:(id)a3 span:(int64_t)a4 error:(id *)a5
{
  id v8;
  id v9;
  char v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t *v15;
  int64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v8 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__6;
  v25 = __Block_byref_object_dispose__6;
  v26 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 1;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __46__CUIKCompositeEditor_deleteEvent_span_error___block_invoke;
  v12[3] = &unk_1E6EB6A38;
  v14 = &v17;
  v9 = v8;
  v15 = &v21;
  v16 = a4;
  v13 = v9;
  -[CUIKCompositeEditor dispatchEvent:block:](self, "dispatchEvent:block:", v9, v12);
  if (a5)
    *a5 = objc_retainAutorelease((id)v22[5]);
  v10 = *((_BYTE *)v18 + 24);

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);

  return v10;
}

void __46__CUIKCompositeEditor_deleteEvent_span_error___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  id obj;

  v3 = a1[4];
  v4 = a1[7];
  v5 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v5 + 40);
  v6 = objc_msgSend(a2, "deleteEvent:span:error:", v3, v4, &obj);
  objc_storeStrong((id *)(v5 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = v6;
}

- (void)deleteEvents:(id)a3 span:(int64_t)a4 result:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  void (**v12)(_QWORD);
  int v13;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  uint64_t *v17;
  _QWORD *v18;
  _QWORD *v19;
  int64_t v20;
  _QWORD aBlock[4];
  id v22;
  _QWORD *v23;
  _QWORD *v24;
  _QWORD v25[5];
  id v26;
  _QWORD v27[3];
  char v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  int v36;

  v8 = a3;
  v9 = a5;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 1;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  v28 = 1;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy__6;
  v25[4] = __Block_byref_object_dispose__6;
  v26 = 0;
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__CUIKCompositeEditor_deleteEvents_span_result___block_invoke;
  aBlock[3] = &unk_1E6EB6AC8;
  v11 = v9;
  v22 = v11;
  v23 = v27;
  v24 = v25;
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __48__CUIKCompositeEditor_deleteEvents_span_result___block_invoke_2;
  v14[3] = &unk_1E6EB6B18;
  v19 = v25;
  v20 = a4;
  v16 = &v33;
  v17 = &v29;
  v18 = v27;
  v12 = _Block_copy(aBlock);
  v15 = v12;
  -[CUIKCompositeEditor dispatchEvents:block:](self, "dispatchEvents:block:", v8, v14);
  v13 = *((_DWORD *)v34 + 6) - 1;
  *((_DWORD *)v34 + 6) = v13;
  if (*((_DWORD *)v30 + 6) == v13)
    v12[2](v12);

  _Block_object_dispose(v25, 8);
  _Block_object_dispose(v27, 8);
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);

}

uint64_t __48__CUIKCompositeEditor_deleteEvents_span_result___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = a1[4];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
  return result;
}

void __48__CUIKCompositeEditor_deleteEvents_span_result___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;

  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__CUIKCompositeEditor_deleteEvents_span_result___block_invoke_3;
  v8[3] = &unk_1E6EB6AF0;
  v10 = *(_OWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 72);
  v7 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v11 = *(_QWORD *)(a1 + 64);
  v12 = v6;
  v9 = v7;
  objc_msgSend(a2, "deleteEvents:span:result:", a3, v5, v8);

}

void __48__CUIKCompositeEditor_deleteEvents_span_result___block_invoke_3(_QWORD *a1, char a2, void *a3)
{
  id v6;

  v6 = a3;
  ++*(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
  if ((a2 & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
    objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), a3);
  }
  if (*(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24) == *(_DWORD *)(*(_QWORD *)(a1[8] + 8) + 24))
    (*(void (**)(void))(a1[4] + 16))();

}

- (void)deleteEvents:(id)a3 span:(int64_t)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __41__CUIKCompositeEditor_deleteEvents_span___block_invoke;
  v4[3] = &__block_descriptor_40_e44_v32__0___CUIKEditorExtended__8__NSSet_16_B24l;
  v4[4] = a4;
  -[CUIKCompositeEditor dispatchEvents:block:](self, "dispatchEvents:block:", a3, v4);
}

uint64_t __41__CUIKCompositeEditor_deleteEvents_span___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "deleteEvents:span:", a3, *(_QWORD *)(a1 + 32));
}

- (void)deleteCalendar:(id)a3 forEntityType:(unint64_t)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  unint64_t v10;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__CUIKCompositeEditor_deleteCalendar_forEntityType___block_invoke;
  v8[3] = &unk_1E6EB6B40;
  v9 = v6;
  v10 = a4;
  v7 = v6;
  -[CUIKCompositeEditor dispatchCalendar:block:](self, "dispatchCalendar:block:", v7, v8);

}

uint64_t __52__CUIKCompositeEditor_deleteCalendar_forEntityType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "deleteCalendar:forEntityType:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (BOOL)saveCalendar:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  char v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v6 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__6;
  v22 = __Block_byref_object_dispose__6;
  v23 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 1;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __42__CUIKCompositeEditor_saveCalendar_error___block_invoke;
  v10[3] = &unk_1E6EB6A60;
  v12 = &v14;
  v7 = v6;
  v11 = v7;
  v13 = &v18;
  -[CUIKCompositeEditor dispatchCalendar:block:](self, "dispatchCalendar:block:", v7, v10);
  if (a4)
    *a4 = objc_retainAutorelease((id)v19[5]);
  v8 = *((_BYTE *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);

  return v8;
}

void __42__CUIKCompositeEditor_saveCalendar_error___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;
  id obj;

  v3 = a1[4];
  v4 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v4 + 40);
  v5 = objc_msgSend(a2, "saveCalendar:error:", v3, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = v5;
}

- (void)saveCalendars:(id)a3
{
  -[CUIKCompositeEditor dispatchCalendars:block:](self, "dispatchCalendars:block:", a3, &__block_literal_global_6);
}

uint64_t __37__CUIKCompositeEditor_saveCalendars___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "saveCalendars:");
}

- (void)deleteCalendars:(id)a3
{
  -[CUIKCompositeEditor dispatchCalendars:block:](self, "dispatchCalendars:block:", a3, &__block_literal_global_7);
}

uint64_t __39__CUIKCompositeEditor_deleteCalendars___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "deleteCalendars:");
}

- (void)saveNewSources:(id)a3 commit:(BOOL)a4
{
  _QWORD v4[4];
  BOOL v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45__CUIKCompositeEditor_saveNewSources_commit___block_invoke;
  v4[3] = &__block_descriptor_33_e44_v32__0___CUIKEditorExtended__8__NSSet_16_B24l;
  v5 = a4;
  -[CUIKCompositeEditor dispatchSources:block:](self, "dispatchSources:block:", a3, v4);
}

uint64_t __45__CUIKCompositeEditor_saveNewSources_commit___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "saveNewSources:commit:", a3, *(unsigned __int8 *)(a1 + 32));
}

- (void)saveChangesToSources:(id)a3
{
  -[CUIKCompositeEditor dispatchSources:block:](self, "dispatchSources:block:", a3, &__block_literal_global_8_0);
}

uint64_t __44__CUIKCompositeEditor_saveChangesToSources___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "saveChangesToSources:");
}

- (void)deleteSources:(id)a3
{
  -[CUIKCompositeEditor dispatchSources:block:](self, "dispatchSources:block:", a3, &__block_literal_global_9_1);
}

uint64_t __37__CUIKCompositeEditor_deleteSources___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "deleteSources:");
}

- (BOOL)eventUsesEditor:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_editors;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "eventUsesEditor:", v4, (_QWORD)v10) & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)calendarUsesEditor:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_editors;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "calendarUsesEditor:", v4, (_QWORD)v10) & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)sourceUsesEditor:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_editors;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "sourceUsesEditor:", v4, (_QWORD)v10) & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)dispatchEvents:(id)a3 block:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  NSDictionary *options;
  id v27;
  BOOL v28;
  id v29;
  id obj;
  id v31;
  uint64_t v32;
  _QWORD v34[5];
  id v35;
  id v36;
  uint64_t *v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  char v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v29 = a4;
  v31 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
  if (v6)
  {
    v32 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v52 != v32)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * i);
        v47 = 0u;
        v48 = 0u;
        v49 = 0u;
        v50 = 0u;
        v9 = self->_editors;
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v47, v56, 16, v29);
        if (v10)
        {
          v11 = 0;
          v12 = *(_QWORD *)v48;
          while (2)
          {
            v13 = 0;
            v14 = v11 + v10;
            do
            {
              if (*(_QWORD *)v48 != v12)
                objc_enumerationMutation(v9);
              if (objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * v13), "eventUsesEditor:", v8))
              {
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11 + v13);
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "objectForKeyedSubscript:", v15);
                v16 = (id)objc_claimAutoreleasedReturnValue();

                if (!v16)
                {
                  v16 = objc_alloc_init(MEMORY[0x1E0C99E20]);
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11 + v13);
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v31, "setObject:forKeyedSubscript:", v16, v17);

                }
                objc_msgSend(v16, "addObject:", v8);

                goto LABEL_18;
              }
              ++v13;
            }
            while (v10 != v13);
            v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
            v11 = v14;
            if (v10)
              continue;
            break;
          }
        }
LABEL_18:

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
    }
    while (v6);
  }

  v43 = 0;
  v44 = &v43;
  v45 = 0x2020000000;
  v46 = 0;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v18 = v31;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v39, v55, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v40;
LABEL_22:
    v21 = 0;
    while (1)
    {
      if (*(_QWORD *)v40 != v20)
        objc_enumerationMutation(v18);
      v22 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v21);
      v23 = objc_msgSend(v22, "unsignedIntegerValue", v29);
      objc_msgSend(v18, "objectForKeyedSubscript:", v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray objectAtIndexedSubscript:](self->_editors, "objectAtIndexedSubscript:", v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      options = self->_options;
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __44__CUIKCompositeEditor_dispatchEvents_block___block_invoke;
      v34[3] = &unk_1E6EB6BA8;
      v36 = v29;
      v34[4] = self;
      v38 = v23;
      v27 = v24;
      v35 = v27;
      v37 = &v43;
      objc_msgSend(v25, "performWithOptions:block:", options, v34);

      v28 = *((_BYTE *)v44 + 24) == 0;
      if (!v28)
        break;
      if (v19 == ++v21)
      {
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v39, v55, 16);
        if (v19)
          goto LABEL_22;
        break;
      }
    }
  }

  _Block_object_dispose(&v43, 8);
}

void __44__CUIKCompositeEditor_dispatchEvents_block___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  id v3;

  v2 = a1[6];
  objc_msgSend(*(id *)(a1[4] + 8), "objectAtIndexedSubscript:", a1[8]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD, uint64_t))(v2 + 16))(v2, v3, a1[5], *(_QWORD *)(a1[7] + 8) + 24);

}

- (void)dispatchEvent:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSDictionary *options;
  _QWORD v15[5];
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = self->_editors;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v13, "eventUsesEditor:", v6))
        {
          options = self->_options;
          v15[0] = MEMORY[0x1E0C809B0];
          v15[1] = 3221225472;
          v15[2] = __43__CUIKCompositeEditor_dispatchEvent_block___block_invoke;
          v15[3] = &unk_1E6EB6BD0;
          v15[4] = v13;
          v16 = v7;
          objc_msgSend(v13, "performWithOptions:block:", options, v15);

          goto LABEL_11;
        }
      }
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_11:

}

uint64_t __43__CUIKCompositeEditor_dispatchEvent_block___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)dispatchCalendars:(id)a3 block:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  NSDictionary *options;
  id v27;
  BOOL v28;
  id v29;
  id obj;
  id v31;
  uint64_t v32;
  _QWORD v34[5];
  id v35;
  id v36;
  uint64_t *v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  char v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v29 = a4;
  v31 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
  if (v6)
  {
    v32 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v52 != v32)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * i);
        v47 = 0u;
        v48 = 0u;
        v49 = 0u;
        v50 = 0u;
        v9 = self->_editors;
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v47, v56, 16, v29);
        if (v10)
        {
          v11 = 0;
          v12 = *(_QWORD *)v48;
          while (2)
          {
            v13 = 0;
            v14 = v11 + v10;
            do
            {
              if (*(_QWORD *)v48 != v12)
                objc_enumerationMutation(v9);
              if (objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * v13), "calendarUsesEditor:", v8))
              {
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11 + v13);
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "objectForKeyedSubscript:", v15);
                v16 = (id)objc_claimAutoreleasedReturnValue();

                if (!v16)
                {
                  v16 = objc_alloc_init(MEMORY[0x1E0C99E20]);
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11 + v13);
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v31, "setObject:forKeyedSubscript:", v16, v17);

                }
                objc_msgSend(v16, "addObject:", v8);

                goto LABEL_18;
              }
              ++v13;
            }
            while (v10 != v13);
            v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
            v11 = v14;
            if (v10)
              continue;
            break;
          }
        }
LABEL_18:

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
    }
    while (v6);
  }

  v43 = 0;
  v44 = &v43;
  v45 = 0x2020000000;
  v46 = 0;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v18 = v31;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v39, v55, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v40;
LABEL_22:
    v21 = 0;
    while (1)
    {
      if (*(_QWORD *)v40 != v20)
        objc_enumerationMutation(v18);
      v22 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v21);
      v23 = objc_msgSend(v22, "unsignedIntegerValue", v29);
      objc_msgSend(v18, "objectForKeyedSubscript:", v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray objectAtIndexedSubscript:](self->_editors, "objectAtIndexedSubscript:", v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      options = self->_options;
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __47__CUIKCompositeEditor_dispatchCalendars_block___block_invoke;
      v34[3] = &unk_1E6EB6BA8;
      v36 = v29;
      v34[4] = self;
      v38 = v23;
      v27 = v24;
      v35 = v27;
      v37 = &v43;
      objc_msgSend(v25, "performWithOptions:block:", options, v34);

      v28 = *((_BYTE *)v44 + 24) == 0;
      if (!v28)
        break;
      if (v19 == ++v21)
      {
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v39, v55, 16);
        if (v19)
          goto LABEL_22;
        break;
      }
    }
  }

  _Block_object_dispose(&v43, 8);
}

void __47__CUIKCompositeEditor_dispatchCalendars_block___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  id v3;

  v2 = a1[6];
  objc_msgSend(*(id *)(a1[4] + 8), "objectAtIndexedSubscript:", a1[8]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD, uint64_t))(v2 + 16))(v2, v3, a1[5], *(_QWORD *)(a1[7] + 8) + 24);

}

- (void)dispatchCalendar:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSDictionary *options;
  _QWORD v15[5];
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = self->_editors;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v13, "calendarUsesEditor:", v6))
        {
          options = self->_options;
          v15[0] = MEMORY[0x1E0C809B0];
          v15[1] = 3221225472;
          v15[2] = __46__CUIKCompositeEditor_dispatchCalendar_block___block_invoke;
          v15[3] = &unk_1E6EB6BD0;
          v15[4] = v13;
          v16 = v7;
          objc_msgSend(v13, "performWithOptions:block:", options, v15);

          goto LABEL_11;
        }
      }
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_11:

}

uint64_t __46__CUIKCompositeEditor_dispatchCalendar_block___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)dispatchSources:(id)a3 block:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  NSDictionary *options;
  id v27;
  BOOL v28;
  id v29;
  id obj;
  id v31;
  uint64_t v32;
  _QWORD v34[5];
  id v35;
  id v36;
  uint64_t *v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  char v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v29 = a4;
  v31 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
  if (v6)
  {
    v32 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v52 != v32)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * i);
        v47 = 0u;
        v48 = 0u;
        v49 = 0u;
        v50 = 0u;
        v9 = self->_editors;
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v47, v56, 16, v29);
        if (v10)
        {
          v11 = 0;
          v12 = *(_QWORD *)v48;
          while (2)
          {
            v13 = 0;
            v14 = v11 + v10;
            do
            {
              if (*(_QWORD *)v48 != v12)
                objc_enumerationMutation(v9);
              if (objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * v13), "sourceUsesEditor:", v8))
              {
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11 + v13);
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "objectForKeyedSubscript:", v15);
                v16 = (id)objc_claimAutoreleasedReturnValue();

                if (!v16)
                {
                  v16 = objc_alloc_init(MEMORY[0x1E0C99E20]);
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11 + v13);
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v31, "setObject:forKeyedSubscript:", v16, v17);

                }
                objc_msgSend(v16, "addObject:", v8);

                goto LABEL_18;
              }
              ++v13;
            }
            while (v10 != v13);
            v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
            v11 = v14;
            if (v10)
              continue;
            break;
          }
        }
LABEL_18:

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
    }
    while (v6);
  }

  v43 = 0;
  v44 = &v43;
  v45 = 0x2020000000;
  v46 = 0;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v18 = v31;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v39, v55, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v40;
LABEL_22:
    v21 = 0;
    while (1)
    {
      if (*(_QWORD *)v40 != v20)
        objc_enumerationMutation(v18);
      v22 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v21);
      v23 = objc_msgSend(v22, "unsignedIntegerValue", v29);
      objc_msgSend(v18, "objectForKeyedSubscript:", v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray objectAtIndexedSubscript:](self->_editors, "objectAtIndexedSubscript:", v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      options = self->_options;
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __45__CUIKCompositeEditor_dispatchSources_block___block_invoke;
      v34[3] = &unk_1E6EB6BA8;
      v36 = v29;
      v34[4] = self;
      v38 = v23;
      v27 = v24;
      v35 = v27;
      v37 = &v43;
      objc_msgSend(v25, "performWithOptions:block:", options, v34);

      v28 = *((_BYTE *)v44 + 24) == 0;
      if (!v28)
        break;
      if (v19 == ++v21)
      {
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v39, v55, 16);
        if (v19)
          goto LABEL_22;
        break;
      }
    }
  }

  _Block_object_dispose(&v43, 8);
}

void __45__CUIKCompositeEditor_dispatchSources_block___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  id v3;

  v2 = a1[6];
  objc_msgSend(*(id *)(a1[4] + 8), "objectAtIndexedSubscript:", a1[8]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD, uint64_t))(v2 + 16))(v2, v3, a1[5], *(_QWORD *)(a1[7] + 8) + 24);

}

- (void)performWithOptions:(id)a3 block:(id)a4
{
  NSDictionary *v6;
  NSDictionary *v7;
  NSDictionary *options;
  void (**v9)(_QWORD);
  NSDictionary *v10;
  NSDictionary *v11;

  v6 = (NSDictionary *)a3;
  v7 = self->_options;
  options = self->_options;
  self->_options = v6;
  v11 = v6;
  v9 = (void (**)(_QWORD))a4;

  v9[2](v9);
  v10 = self->_options;
  self->_options = v7;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_editors, 0);
}

@end
