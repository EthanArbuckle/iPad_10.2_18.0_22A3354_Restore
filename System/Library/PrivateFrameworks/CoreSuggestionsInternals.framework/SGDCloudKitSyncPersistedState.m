@implementation SGDCloudKitSyncPersistedState

void __44___SGDCloudKitSyncPersistedState_properties__block_invoke()
{
  void *v0;
  objc_class *v1;
  void *v2;
  objc_class *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_class *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *context;
  _QWORD v48[11];

  v48[9] = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1C3BD4F6C]();
  v0 = (void *)MEMORY[0x1E0D81638];
  v1 = (objc_class *)objc_opt_class();
  NSStringFromClass(v1);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_salt);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "tupleWithFirst:second:", v46, v45);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = v44;
  v2 = (void *)MEMORY[0x1E0D81638];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_saltAtomicReferenceId);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tupleWithFirst:second:", v43, v42);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v48[1] = v41;
  v4 = (void *)MEMORY[0x1E0D81638];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_saltUsesManatee);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tupleWithFirst:second:", v40, v39);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v48[2] = v38;
  v6 = (void *)MEMORY[0x1E0D81638];
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_syncToken);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tupleWithFirst:second:", v37, v36);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v48[3] = v35;
  v8 = (void *)MEMORY[0x1E0D81638];
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_hasSubscription);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "tupleWithFirst:second:", v34, v33);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v48[4] = v32;
  v10 = (void *)MEMORY[0x1E0D81638];
  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_eventsWereRemovedFromEventKit);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "tupleWithFirst:second:", v31, v30);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v48[5] = v12;
  v13 = (void *)MEMORY[0x1E0D81638];
  v14 = (objc_class *)objc_opt_class();
  NSStringFromClass(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_primaryICloudCalendarAccount);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "tupleWithFirst:second:", v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v48[6] = v17;
  v18 = (void *)MEMORY[0x1E0D81638];
  v19 = (objc_class *)objc_opt_class();
  NSStringFromClass(v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_hasDeferredSync);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "tupleWithFirst:second:", v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v48[7] = v22;
  v23 = (void *)MEMORY[0x1E0D81638];
  v24 = (objc_class *)objc_opt_class();
  NSStringFromClass(v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_hasDeferredProcessStateChanges);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "tupleWithFirst:second:", v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v48[8] = v27;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 9);
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = (void *)properties__pasExprOnceResult;
  properties__pasExprOnceResult = v28;

  objc_autoreleasePoolPop(context);
}

@end
