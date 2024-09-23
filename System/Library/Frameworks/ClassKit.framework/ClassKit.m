id CLSClientInterface()
{
  void *v0;
  const char *v1;

  v0 = (void *)objc_opt_new();
  objc_msgSend_setProtocol_(v0, v1, (uint64_t)&unk_1EFE41D68);
  return v0;
}

uint64_t CurrentProcessNameMatches(void *a1)
{
  void *v1;
  id v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t isEqualToString;

  v1 = (void *)MEMORY[0x1E0CB34D0];
  v2 = a1;
  objc_msgSend_mainBundle(v1, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_executablePath(v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_lastPathComponent(v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v11, v12, (uint64_t)v2);

  return isEqualToString;
}

id CLSCurrentPersonaUniqueIdentifier(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;

  objc_msgSend_sharedManager(MEMORY[0x1E0DC5EE8], a2, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_currentPersona(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_userPersonaUniqueString(v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id CLSObjectsClasses()
{
  if (qword_1ED0FB540 != -1)
    dispatch_once(&qword_1ED0FB540, &unk_1E9749D30);
  return (id)qword_1ED0FB538;
}

id CLSSurveyClasses()
{
  if (qword_1ED0FB4F0 != -1)
    dispatch_once(&qword_1ED0FB4F0, &unk_1E97498D0);
  return (id)qword_1ED0FB4E8;
}

id CLSSearchClasses()
{
  if (qword_1ED0FB520 != -1)
    dispatch_once(&qword_1ED0FB520, &unk_1E974A748);
  return (id)qword_1ED0FB518;
}

id CLSRosterClasses()
{
  if (qword_1ED0FB500 != -1)
    dispatch_once(&qword_1ED0FB500, &unk_1E974A708);
  return (id)qword_1ED0FB4F8;
}

id CLSProgressClasses()
{
  if (qword_1ED0FB490 != -1)
    dispatch_once(&qword_1ED0FB490, &unk_1E9749A10);
  return (id)qword_1ED0FB488;
}

id CLSHandoutClasses()
{
  if (qword_1ED0FB4B0 != -1)
    dispatch_once(&qword_1ED0FB4B0, &unk_1E9749830);
  return (id)qword_1ED0FB4A8;
}

id CLSCollaborationStateClasses()
{
  if (qword_1ED0FB4E0 != -1)
    dispatch_once(&qword_1ED0FB4E0, &unk_1E9749870);
  return (id)qword_1ED0FB4D8;
}

void CLSInitLog()
{
  if (qword_1ED0FB9A0 != -1)
    dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
}

uint64_t ic()
{
  uint64_t result;

  do
    result = __ldaxr((unsigned int *)&unk_1ED0FB978);
  while (__stlxr(result + 1, (unsigned int *)&unk_1ED0FB978));
  return result;
}

id CLSSaveResponseInterface()
{
  if (qword_1ED0FB670 != -1)
    dispatch_once(&qword_1ED0FB670, &unk_1E974A9A0);
  return (id)qword_1ED0FB668;
}

id CLSReportClasses()
{
  if (qword_1ED0FB4D0 != -1)
    dispatch_once(&qword_1ED0FB4D0, &unk_1E97498B0);
  return (id)qword_1ED0FB4C8;
}

id CLSQueryInterface()
{
  if (qword_1ED0FB660 != -1)
    dispatch_once(&qword_1ED0FB660, &unk_1E974A980);
  return (id)qword_1ED0FB658;
}

id CLSOnboardingClasses()
{
  if (qword_1ED0FB530 != -1)
    dispatch_once(&qword_1ED0FB530, &unk_1E9749D10);
  return (id)qword_1ED0FB528;
}

id CLSExtensionPropertiesForConnection(void *a1, const char *a2, uint64_t a3)
{
  void *v3;
  void *v4;

  if (a1)
  {
    objc_msgSend__xpcConnection(a1, a2, a3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)launch_copy_extension_properties();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

id CLSEndpointServerInterface()
{
  if (qword_1ED0FB560 != -1)
    dispatch_once(&qword_1ED0FB560, &unk_1E974A788);
  return (id)qword_1ED0FB558;
}

id CLSDispatchQueueName(void *a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  id v6;
  objc_class *v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v3 = (objc_class *)MEMORY[0x1E0CB3940];
  v4 = a2;
  v5 = a1;
  v6 = [v3 alloc];
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v8;
  if (v4)
    v11 = objc_msgSend_initWithFormat_(v6, v9, (uint64_t)CFSTR("%@.%@%@%@.%p"), CFSTR("com.apple.ClassKit"), v8, CFSTR("."), v4, v5);
  else
    v11 = objc_msgSend_initWithFormat_(v6, v9, (uint64_t)CFSTR("%@.%@%@%@.%p"), CFSTR("com.apple.ClassKit"), v8, &stru_1E974C8A0, &stru_1E974C8A0, v5);
  v12 = (void *)v11;

  return v12;
}

id CLSDashboardClasses()
{
  if (qword_1ED0FB510 != -1)
    dispatch_once(&qword_1ED0FB510, &unk_1E974A728);
  return (id)qword_1ED0FB508;
}

id CLSAssetUploadProgressNotifiableInterface()
{
  if (qword_1ED0FB680 != -1)
    dispatch_once(&qword_1ED0FB680, &unk_1E974A9C0);
  return (id)qword_1ED0FB678;
}

id CLSAssetDownloadProgressNotifiableInterface()
{
  if (qword_1ED0FB690 != -1)
    dispatch_once(&qword_1ED0FB690, &unk_1E974A9E0);
  return (id)qword_1ED0FB688;
}

id CLSArchivedHandoutClasses()
{
  if (qword_1ED0FB4C0 != -1)
    dispatch_once(&qword_1ED0FB4C0, &unk_1E974A6E8);
  return (id)qword_1ED0FB4B8;
}

void sub_1D4055D30(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  CLSChildParentRelation *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  CLSParentChildRelation *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  objc_super v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v20.receiver = *(id *)(a1 + 32);
  v20.super_class = (Class)&OBJC_METACLASS___CLSArchivedSurvey;
  objc_msgSendSuper2(&v20, sel_relations);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED0FB350;
  qword_1ED0FB350 = v2;

  v4 = [CLSChildParentRelation alloc];
  v5 = *(_QWORD *)(a1 + 32);
  v6 = objc_opt_class();
  v8 = (void *)objc_msgSend_initWithChildEntity_parentEntity_faultable_(v4, v7, v5, v6, 1);
  v9 = [CLSParentChildRelation alloc];
  v10 = *(_QWORD *)(a1 + 32);
  v11 = objc_opt_class();
  v13 = (void *)objc_msgSend_initWithParentEntity_childEntity_faultable_(v9, v12, v10, v11, 1);
  v14 = (void *)qword_1ED0FB350;
  v21[0] = v8;
  v21[1] = v13;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v15, (uint64_t)v21, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setByAddingObjectsFromArray_(v14, v17, (uint64_t)v16);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)qword_1ED0FB350;
  qword_1ED0FB350 = v18;

}

void sub_1D4055EF4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  CLSChildParentRelation *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  CLSChildParentRelation *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  CLSChildParentRelation *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  void *v18;
  CLSChildParentRelation *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  void *v23;
  CLSChildParentRelation *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  void *v28;
  CLSChildParentRelation *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  void *v33;
  void *v34;
  const char *v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  objc_super v40;
  _QWORD v41[7];

  v41[6] = *MEMORY[0x1E0C80C00];
  v40.receiver = *(id *)(a1 + 32);
  v40.super_class = (Class)&OBJC_METACLASS___CLSAsset;
  objc_msgSendSuper2(&v40, sel_relations);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED0FB360;
  qword_1ED0FB360 = v2;

  v4 = [CLSChildParentRelation alloc];
  v5 = *(_QWORD *)(a1 + 32);
  v6 = objc_opt_class();
  v8 = (void *)objc_msgSend_initWithChildEntity_parentEntity_faultable_(v4, v7, v5, v6, 1);
  v9 = [CLSChildParentRelation alloc];
  v10 = *(_QWORD *)(a1 + 32);
  v11 = objc_opt_class();
  v13 = (void *)objc_msgSend_initWithChildEntity_parentEntity_faultable_(v9, v12, v10, v11, 1);
  v14 = [CLSChildParentRelation alloc];
  v15 = *(_QWORD *)(a1 + 32);
  v16 = objc_opt_class();
  v18 = (void *)objc_msgSend_initWithChildEntity_parentEntity_faultable_(v14, v17, v15, v16, 1);
  v19 = [CLSChildParentRelation alloc];
  v20 = *(_QWORD *)(a1 + 32);
  v21 = objc_opt_class();
  v23 = (void *)objc_msgSend_initWithChildEntity_parentEntity_faultable_(v19, v22, v20, v21, 1);
  v24 = [CLSChildParentRelation alloc];
  v25 = *(_QWORD *)(a1 + 32);
  v26 = objc_opt_class();
  v28 = (void *)objc_msgSend_initWithChildEntity_parentEntity_faultable_(v24, v27, v25, v26, 1);
  v29 = [CLSChildParentRelation alloc];
  v30 = *(_QWORD *)(a1 + 32);
  v31 = objc_opt_class();
  v33 = (void *)objc_msgSend_initWithChildEntity_parentEntity_faultable_(v29, v32, v30, v31, 1);
  v34 = (void *)qword_1ED0FB360;
  v41[0] = v8;
  v41[1] = v13;
  v41[2] = v18;
  v41[3] = v23;
  v41[4] = v28;
  v41[5] = v33;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v35, (uint64_t)v41, 6);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setByAddingObjectsFromArray_(v34, v37, (uint64_t)v36);
  v38 = objc_claimAutoreleasedReturnValue();
  v39 = (void *)qword_1ED0FB360;
  qword_1ED0FB360 = v38;

}

void sub_1D40561AC(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  CLSChildParentRelation *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  CLSChildParentRelation *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  CLSChildParentRelation *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  void *v18;
  CLSChildParentRelation *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  void *v23;
  void *v24;
  const char *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  objc_super v30;
  _QWORD v31[5];

  v31[4] = *MEMORY[0x1E0C80C00];
  v30.receiver = *(id *)(a1 + 32);
  v30.super_class = (Class)&OBJC_METACLASS___CLSArchivedAsset;
  objc_msgSendSuper2(&v30, sel_relations);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED0FB370;
  qword_1ED0FB370 = v2;

  v4 = [CLSChildParentRelation alloc];
  v5 = *(_QWORD *)(a1 + 32);
  v6 = objc_opt_class();
  v8 = (void *)objc_msgSend_initWithChildEntity_parentEntity_faultable_(v4, v7, v5, v6, 1);
  v9 = [CLSChildParentRelation alloc];
  v10 = *(_QWORD *)(a1 + 32);
  v11 = objc_opt_class();
  v13 = (void *)objc_msgSend_initWithChildEntity_parentEntity_faultable_(v9, v12, v10, v11, 1);
  v14 = [CLSChildParentRelation alloc];
  v15 = *(_QWORD *)(a1 + 32);
  v16 = objc_opt_class();
  v18 = (void *)objc_msgSend_initWithChildEntity_parentEntity_faultable_(v14, v17, v15, v16, 1);
  v19 = [CLSChildParentRelation alloc];
  v20 = *(_QWORD *)(a1 + 32);
  v21 = objc_opt_class();
  v23 = (void *)objc_msgSend_initWithChildEntity_parentEntity_faultable_(v19, v22, v20, v21, 1);
  v24 = (void *)qword_1ED0FB370;
  v31[0] = v8;
  v31[1] = v13;
  v31[2] = v18;
  v31[3] = v23;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v25, (uint64_t)v31, 4);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setByAddingObjectsFromArray_(v24, v27, (uint64_t)v26);
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = (void *)qword_1ED0FB370;
  qword_1ED0FB370 = v28;

}

void sub_1D40563E8(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  CLSChildParentRelation *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  objc_super v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v15.receiver = *(id *)(a1 + 32);
  v15.super_class = (Class)&OBJC_METACLASS___CLSOpenResponseAnswerFormat;
  objc_msgSendSuper2(&v15, sel_relations);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED0FB380;
  qword_1ED0FB380 = v2;

  v4 = [CLSChildParentRelation alloc];
  v5 = *(_QWORD *)(a1 + 32);
  v6 = objc_opt_class();
  v8 = (void *)objc_msgSend_initWithChildEntity_parentEntity_faultable_(v4, v7, v5, v6, 1);
  v9 = (void *)qword_1ED0FB380;
  v16[0] = v8;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v10, (uint64_t)v16, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setByAddingObjectsFromArray_(v9, v12, (uint64_t)v11);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)qword_1ED0FB380;
  qword_1ED0FB380 = v13;

}

void sub_1D4058CB0(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  CLSChildParentRelation *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  objc_super v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v15.receiver = *(id *)(a1 + 32);
  v15.super_class = (Class)&OBJC_METACLASS___CLSContextNavigationNode;
  objc_msgSendSuper2(&v15, sel_relations);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED0FB390;
  qword_1ED0FB390 = v2;

  v4 = [CLSChildParentRelation alloc];
  v5 = *(_QWORD *)(a1 + 32);
  v6 = objc_opt_class();
  v8 = (void *)objc_msgSend_initWithChildEntity_parentEntity_faultable_(v4, v7, v5, v6, 1);
  v9 = (void *)qword_1ED0FB390;
  v16[0] = v8;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v10, (uint64_t)v16, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setByAddingObjectsFromArray_(v9, v12, (uint64_t)v11);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)qword_1ED0FB390;
  qword_1ED0FB390 = v13;

}

BOOL sub_1D40594D4(uint64_t a1, void *a2)
{
  id v2;
  const char *v3;
  uint64_t v4;
  _BOOL8 v5;

  v2 = a2;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && !objc_msgSend_markedForDeletion(v2, v3, v4);

  return v5;
}

__CFString *NSStringFromSource(unint64_t a1, const char *a2)
{
  if (a1 < 5)
    return off_1E9749D90[a1];
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("Unknown class source: '%ld'"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *NSStringFromOriginatingSource(uint64_t a1, const char *a2)
{
  __CFString *v2;

  if (!a1)
    return CFSTR("Unknown");
  if (a1 == 1)
  {
    v2 = CFSTR("Schoolwork");
  }
  else
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("Unknown class originating source: '%ld'"), a1);
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

uint64_t CLSSourceFromString(void *a1)
{
  id v1;
  const char *v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  const char *v8;
  uint64_t v10;
  const char *v11;
  id v12;

  v1 = a1;
  v3 = v1;
  if (!v1)
    goto LABEL_13;
  if ((objc_msgSend_isEqualToString_(v1, v2, (uint64_t)CFSTR("Unknown")) & 1) == 0)
  {
    if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("SIS")) & 1) != 0)
    {
      v5 = 1;
      goto LABEL_12;
    }
    if ((objc_msgSend_isEqualToString_(v3, v6, (uint64_t)CFSTR("SFTP")) & 1) != 0)
    {
      v5 = 2;
      goto LABEL_12;
    }
    if ((objc_msgSend_isEqualToString_(v3, v7, (uint64_t)CFSTR("Manual")) & 1) != 0)
    {
      v5 = 3;
      goto LABEL_12;
    }
    if ((objc_msgSend_isEqualToString_(v3, v8, (uint64_t)CFSTR("SCIM")) & 1) != 0)
    {
      v5 = 4;
      goto LABEL_12;
    }
LABEL_13:
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v2, (uint64_t)CFSTR("Unknown class source string: '%@'"), v3);
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E0C99DA0], v11, *MEMORY[0x1E0C99778], v10, 0);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v12);
  }
  v5 = 0;
LABEL_12:

  return v5;
}

uint64_t CLSOriginatingSourceFromString(void *a1)
{
  id v1;
  const char *v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v7;
  const char *v8;
  id v9;

  v1 = a1;
  v3 = v1;
  if (!v1)
    goto LABEL_7;
  if ((objc_msgSend_isEqualToString_(v1, v2, (uint64_t)CFSTR("Unknown")) & 1) == 0)
  {
    if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("Schoolwork")) & 1) != 0)
    {
      v5 = 1;
      goto LABEL_6;
    }
LABEL_7:
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v2, (uint64_t)CFSTR("Unknown class originating source string: '%@'"), v3);
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E0C99DA0], v8, *MEMORY[0x1E0C99778], v7, 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v9);
  }
  v5 = 0;
LABEL_6:

  return v5;
}

id sub_1D406111C()
{
  if (qword_1EFE35FD8 != -1)
    dispatch_once(&qword_1EFE35FD8, &unk_1E9749910);
  return (id)qword_1EFE35FE0;
}

void sub_1D406115C(uint64_t a1)
{
  id WeakRetained;
  id v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD);
  NSObject *v13;
  id v14;
  uint8_t buf[16];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v14 = WeakRetained;
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v3 = *(id *)(a1 + 32);
    v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v16, v20, 16);
    if (v5)
    {
      v8 = v5;
      v9 = *(_QWORD *)v17;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v3);
          v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v10);
          objc_msgSend_onDownloadProgress(v11, v6, v7);
          v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            if (qword_1ED0FB9A0 != -1)
              dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
            v13 = CLSLogAsset;
            if (os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D4054000, v13, OS_LOG_TYPE_DEFAULT, "notifying download progress", buf, 2u);
            }
            ((void (**)(_QWORD, void *))v12)[2](v12, v11);
          }

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v6, (uint64_t)&v16, v20, 16);
      }
      while (v8);
    }

    WeakRetained = v14;
  }

}

void sub_1D40613D4(uint64_t a1)
{
  id WeakRetained;
  id v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD);
  NSObject *v13;
  id v14;
  uint8_t buf[16];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v14 = WeakRetained;
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v3 = *(id *)(a1 + 32);
    v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v16, v20, 16);
    if (v5)
    {
      v8 = v5;
      v9 = *(_QWORD *)v17;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v3);
          v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v10);
          objc_msgSend_onDownloadComplete(v11, v6, v7);
          v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            if (qword_1ED0FB9A0 != -1)
              dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
            v13 = CLSLogAsset;
            if (os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D4054000, v13, OS_LOG_TYPE_DEFAULT, "notifying download complete", buf, 2u);
            }
            ((void (**)(_QWORD, void *))v12)[2](v12, v11);
          }

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v6, (uint64_t)&v16, v20, 16);
      }
      while (v8);
    }

    WeakRetained = v14;
  }

}

void sub_1D4061C38(uint64_t a1, const char *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E0CB35C8], a2, 100, CFSTR("Unhandled asset type urlSuitableForOpeningWithCompletion."));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v2 + 16))(v2, 0, v3);

}

void sub_1D40620D8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  qos_class_t v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  _QWORD block[4];
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (qword_1ED0FB9A0 != -1)
    dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
  v7 = (void *)CLSLogAsset;
  if (os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(void **)(a1 + 32);
    v9 = v7;
    objc_msgSend_objectID(v8, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v23 = v12;
    v24 = 2160;
    v25 = 1752392040;
    v26 = 2112;
    v27 = v5;
    v28 = 2114;
    v29 = v6;
    _os_log_impl(&dword_1D4054000, v9, OS_LOG_TYPE_DEFAULT, "done looking up url for iCloudDrive asset: %@; url: %{mask.hash}@; error: %{public}@",
      buf,
      0x2Au);

  }
  v13 = qos_class_self();
  dispatch_get_global_queue(v13, 0);
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D40622A8;
  block[3] = &unk_1E9749E10;
  v15 = *(id *)(a1 + 40);
  v20 = v6;
  v21 = v15;
  v19 = v5;
  v16 = v6;
  v17 = v5;
  dispatch_async(v14, block);

}

uint64_t sub_1D40622A8(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void sub_1D40622BC(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  qos_class_t v22;
  NSObject *v23;
  const char *v24;
  id obj;
  _QWORD block[4];
  id v27;
  id v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t v34[128];
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  id v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (qword_1ED0FB9A0 != -1)
    dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
  v7 = (void *)CLSLogAsset;
  if (os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(void **)(a1 + 32);
    v11 = v7;
    objc_msgSend_objectID(v10, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v36 = v14;
    v37 = 2160;
    v38 = 1752392040;
    v39 = 2112;
    v40 = v5;
    v41 = 2114;
    v42 = v6;
    _os_log_impl(&dword_1D4054000, v11, OS_LOG_TYPE_DEFAULT, "done looking up url for iCloudDrive asset: %@; url: %{mask.hash}@; error: %{public}@",
      buf,
      0x2Au);

  }
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  objc_msgSend_pendingURLCompletions(*(void **)(a1 + 32), v8, v9);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v15, (uint64_t)&v30, v34, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v31;
    v19 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v31 != v18)
          objc_enumerationMutation(obj);
        v21 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
        v22 = qos_class_self();
        dispatch_get_global_queue(v22, 0);
        v23 = objc_claimAutoreleasedReturnValue();
        block[0] = v19;
        block[1] = 3221225472;
        block[2] = sub_1D4062524;
        block[3] = &unk_1E9749E10;
        v29 = v21;
        v27 = v5;
        v28 = v6;
        dispatch_async(v23, block);

      }
      v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v24, (uint64_t)&v30, v34, 16);
    }
    while (v17);
  }

}

uint64_t sub_1D4062524(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void sub_1D4062538(uint64_t a1, void *a2, void *a3)
{
  const char *v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  const char *v10;
  char isEqualToString;
  const char *v12;
  void *v13;
  const char *v14;
  void (*v15)(void);
  const char *v16;
  const char *v17;
  id v18;

  v18 = a2;
  v7 = a3;
  v8 = v18;
  atomic_store(0, (unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 281));
  if (!v8)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v15 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
LABEL_6:
    v15();
    goto LABEL_7;
  }
  objc_msgSend_pathExtension(v18, v5, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v9, v10, (uint64_t)CFSTR("stub"));

  if ((isEqualToString & 1) == 0)
  {
    objc_msgSend_setURL_(*(void **)(a1 + 32), v12, (uint64_t)v18);
    objc_msgSend_setDownloaded_(*(void **)(a1 + 32), v16, 1);
    objc_msgSend_clientRemote_downloadCompleted_error_(*(void **)(a1 + 32), v17, 1, 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v15 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    goto LABEL_6;
  }
  objc_msgSend_cls_createErrorWithCode_format_(MEMORY[0x1E0CB35C8], (const char *)v18, 343, CFSTR("URL: %@"), v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_cls_log_(v13, v14, CLSLogAsset);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

LABEL_7:
}

void sub_1D4062F3C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  qos_class_t v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (qword_1ED0FB9A0 != -1)
    dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
  v7 = CLSLogAsset;
  if (os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138413058;
    v19 = v8;
    v20 = 2160;
    v21 = 1752392040;
    v22 = 2112;
    v23 = v5;
    v24 = 2114;
    v25 = v6;
    _os_log_impl(&dword_1D4054000, v7, OS_LOG_TYPE_DEFAULT, "done downloading url for CloudKit asset: %@; url: %{mask.hash}@; error: %{public}@",
      buf,
      0x2Au);
  }
  v9 = qos_class_self();
  dispatch_get_global_queue(v9, 0);
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D40630E4;
  block[3] = &unk_1E9749E10;
  v11 = *(id *)(a1 + 40);
  v16 = v6;
  v17 = v11;
  v15 = v5;
  v12 = v6;
  v13 = v5;
  dispatch_async(v10, block);

}

uint64_t sub_1D40630E4(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void sub_1D40630F8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  qos_class_t v18;
  NSObject *v19;
  const char *v20;
  id obj;
  _QWORD block[4];
  id v23;
  id v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (qword_1ED0FB9A0 != -1)
    dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
  v7 = CLSLogAsset;
  if (os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138413058;
    v32 = v10;
    v33 = 2160;
    v34 = 1752392040;
    v35 = 2112;
    v36 = v5;
    v37 = 2114;
    v38 = v6;
    _os_log_impl(&dword_1D4054000, v7, OS_LOG_TYPE_DEFAULT, "done downloading url for CloudKit asset: %@; url: %{mask.hash}@; error: %{public}@",
      buf,
      0x2Au);
  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend_pendingURLCompletions(*(void **)(a1 + 32), v8, v9);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v11, (uint64_t)&v26, v30, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v27;
    v15 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v27 != v14)
          objc_enumerationMutation(obj);
        v17 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
        v18 = qos_class_self();
        dispatch_get_global_queue(v18, 0);
        v19 = objc_claimAutoreleasedReturnValue();
        block[0] = v15;
        block[1] = 3221225472;
        block[2] = sub_1D4063340;
        block[3] = &unk_1E9749E10;
        v25 = v17;
        v23 = v5;
        v24 = v6;
        dispatch_async(v19, block);

      }
      v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v20, (uint64_t)&v26, v30, 16);
    }
    while (v13);
  }

}

uint64_t sub_1D4063340(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void sub_1D4063354(uint64_t a1, void *a2, void *a3)
{
  const char *v5;
  id v6;
  const char *v7;
  id v8;

  v8 = a2;
  v6 = a3;
  atomic_store(0, (unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 281));
  if (v8)
  {
    objc_msgSend_setDownloaded_(*(void **)(a1 + 32), v5, 1);
    objc_msgSend_setURL_(*(void **)(a1 + 32), v7, (uint64_t)v8);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void sub_1D40634EC(uint64_t a1, const char *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E0CB35C8], a2, 344, CFSTR("Thumbnail is not available for this asset."));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v2 + 16))(v2, 0, v3);

}

void sub_1D4063938(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  qos_class_t v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (qword_1ED0FB9A0 != -1)
    dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
  v7 = CLSLogAsset;
  if (os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138413058;
    v19 = v8;
    v20 = 2160;
    v21 = 1752392040;
    v22 = 2112;
    v23 = v5;
    v24 = 2114;
    v25 = v6;
    _os_log_impl(&dword_1D4054000, v7, OS_LOG_TYPE_DEFAULT, "done downloading thumbnailURL for CloudKit asset: %@; url: %{mask.hash}@; error: %{public}@",
      buf,
      0x2Au);
  }
  v9 = qos_class_self();
  dispatch_get_global_queue(v9, 0);
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D4063AE0;
  block[3] = &unk_1E9749E10;
  v11 = *(id *)(a1 + 40);
  v16 = v6;
  v17 = v11;
  v15 = v5;
  v12 = v6;
  v13 = v5;
  dispatch_async(v10, block);

}

uint64_t sub_1D4063AE0(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void sub_1D4063AF4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  qos_class_t v18;
  NSObject *v19;
  const char *v20;
  id obj;
  _QWORD block[4];
  id v23;
  id v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (qword_1ED0FB9A0 != -1)
    dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
  v7 = CLSLogAsset;
  if (os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138413058;
    v32 = v10;
    v33 = 2160;
    v34 = 1752392040;
    v35 = 2112;
    v36 = v5;
    v37 = 2114;
    v38 = v6;
    _os_log_impl(&dword_1D4054000, v7, OS_LOG_TYPE_DEFAULT, "done downloading thumbnailURL for CloudKit asset: %@; url: %{mask.hash}@; error: %{public}@",
      buf,
      0x2Au);
  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend_pendingThumbnailURLCompletions(*(void **)(a1 + 32), v8, v9);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v11, (uint64_t)&v26, v30, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v27;
    v15 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v27 != v14)
          objc_enumerationMutation(obj);
        v17 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
        v18 = qos_class_self();
        dispatch_get_global_queue(v18, 0);
        v19 = objc_claimAutoreleasedReturnValue();
        block[0] = v15;
        block[1] = 3221225472;
        block[2] = sub_1D4063D3C;
        block[3] = &unk_1E9749E10;
        v25 = v17;
        v23 = v5;
        v24 = v6;
        dispatch_async(v19, block);

      }
      v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v20, (uint64_t)&v26, v30, 16);
    }
    while (v13);
  }

}

uint64_t sub_1D4063D3C(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void sub_1D4063D50(uint64_t a1, void *a2, void *a3)
{
  id v5;
  const char *v6;
  id v7;
  id v8;
  id v9;

  v9 = a2;
  v5 = a3;
  v7 = v9;
  v8 = v5;
  atomic_store(0, (unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 280));
  if (v7)
    objc_msgSend_setThumbnailURL_(*(void **)(a1 + 32), v6, (uint64_t)v9);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void sub_1D40641D4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  qos_class_t v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (qword_1ED0FB9A0 != -1)
    dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
  v7 = CLSLogAsset;
  if (os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138413058;
    v19 = v8;
    v20 = 2160;
    v21 = 1752392040;
    v22 = 2112;
    v23 = v5;
    v24 = 2114;
    v25 = v6;
    _os_log_impl(&dword_1D4054000, v7, OS_LOG_TYPE_DEFAULT, "done getting streaming CloudKit asset url, url for asset: %@; url: %{mask.hash}@; error: %{public}@",
      buf,
      0x2Au);
  }
  v9 = qos_class_self();
  dispatch_get_global_queue(v9, 0);
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D406437C;
  block[3] = &unk_1E9749E10;
  v11 = *(id *)(a1 + 40);
  v16 = v6;
  v17 = v11;
  v15 = v5;
  v12 = v6;
  v13 = v5;
  dispatch_async(v10, block);

}

uint64_t sub_1D406437C(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void sub_1D4064390(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  qos_class_t v18;
  NSObject *v19;
  const char *v20;
  id obj;
  _QWORD block[4];
  id v23;
  id v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (qword_1ED0FB9A0 != -1)
    dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
  v7 = CLSLogAsset;
  if (os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138413058;
    v32 = v10;
    v33 = 2160;
    v34 = 1752392040;
    v35 = 2112;
    v36 = v5;
    v37 = 2114;
    v38 = v6;
    _os_log_impl(&dword_1D4054000, v7, OS_LOG_TYPE_DEFAULT, "done getting streaming CloudKit asset url, url for asset: %@; url: %{mask.hash}@; error: %{public}@",
      buf,
      0x2Au);
  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend_pendingStreamingURLCompletions(*(void **)(a1 + 32), v8, v9);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v11, (uint64_t)&v26, v30, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v27;
    v15 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v27 != v14)
          objc_enumerationMutation(obj);
        v17 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
        v18 = qos_class_self();
        dispatch_get_global_queue(v18, 0);
        v19 = objc_claimAutoreleasedReturnValue();
        block[0] = v15;
        block[1] = 3221225472;
        block[2] = sub_1D40645D8;
        block[3] = &unk_1E9749E10;
        v25 = v17;
        v23 = v5;
        v24 = v6;
        dispatch_async(v19, block);

      }
      v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v20, (uint64_t)&v26, v30, 16);
    }
    while (v13);
  }

}

uint64_t sub_1D40645D8(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void sub_1D40645EC(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  const char *v7;
  id v8;
  const char *v9;
  id v10;

  v10 = a2;
  v8 = a4;
  atomic_store(0, (unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 282));
  if (v10)
  {
    objc_msgSend_setUrlExpirationDate_(*(void **)(a1 + 32), v7, a3);
    objc_msgSend_setURL_(*(void **)(a1 + 32), v9, (uint64_t)v10);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void sub_1D4064CDC()
{
  NSObject *v0;
  qos_class_t v1;
  dispatch_queue_t v2;
  void *v3;
  NSObject *attr;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = qos_class_self();
  dispatch_queue_attr_make_with_qos_class(v0, v1, 0);
  attr = objc_claimAutoreleasedReturnValue();

  v2 = dispatch_queue_create("com.apple.ClassKit.CLSAsset.fileDownloadProgress", attr);
  v3 = (void *)qword_1EFE35FE0;
  qword_1EFE35FE0 = (uint64_t)v2;

}

void sub_1D4067AE4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D4067BE8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1D40680FC(uint64_t a1, const char *a2)
{
  return objc_msgSend_addObject_(*(void **)(a1 + 32), a2, (uint64_t)a2);
}

void sub_1D40681F8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1D40682AC(uint64_t a1, const char *a2)
{
  return objc_msgSend_addObject_(*(void **)(a1 + 32), a2, (uint64_t)a2);
}

void sub_1D406835C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1D406840C(uint64_t a1, const char *a2)
{
  return objc_msgSend_addObject_(*(void **)(a1 + 32), a2, (uint64_t)a2);
}

void sub_1D40684BC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1D40687B0()
{
  return 1;
}

void sub_1D4068D4C(uint64_t a1)
{
  id v1;
  const char *v2;
  uint64_t v3;
  void *v4;

  v1 = objc_alloc(*(Class *)(a1 + 32));
  v3 = objc_msgSend_initWithEndpoint_(v1, v2, 0);
  v4 = (void *)qword_1ED0FB3A0;
  qword_1ED0FB3A0 = v3;

}

void sub_1D4068DEC(uint64_t a1, const char *a2)
{
  uint64_t v2;
  void *v3;
  _QWORD v4[3];
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("restoreCurrentDefaults");
  v4[1] = CFSTR("enableVerboseLogging");
  v5[0] = CFSTR("Restore current defaults");
  v5[1] = CFSTR("Enable verbose logging");
  v4[2] = CFSTR("enableResponseStreaming");
  v5[2] = CFSTR("Enable streamed response processing");
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], a2, (uint64_t)v5, v4, 3);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED0FB3B0;
  qword_1ED0FB3B0 = v2;

}

uint64_t sub_1D4069170(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_1D406922C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_1D40692FC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_1D40693D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D40693E8(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (qword_1ED0FB9A0 != -1)
    dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
  v3 = CLSLogDefault;
  if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_error_impl(&dword_1D4054000, v3, OS_LOG_TYPE_ERROR, "syncUtilityServer connection failed with error: %{public}@", (uint8_t *)&v4, 0xCu);
  }

}

uint64_t sub_1D40694BC(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result;

  result = objc_msgSend_BOOLValue(a2, (const char *)a2, a3);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void sub_1D4069530()
{
  NSObject *v0;
  NSObject *v1;
  dispatch_queue_t v2;
  void *v3;
  NSObject *attr;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_USER_INITIATED, 0);
  attr = objc_claimAutoreleasedReturnValue();

  dispatch_get_global_queue(25, 0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = dispatch_queue_create_with_target_V2("com.apple.ClassKit.userDefaults", attr, v1);
  v3 = (void *)qword_1ED0FB3C0;
  qword_1ED0FB3C0 = (uint64_t)v2;

}

void sub_1D4069630(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  CLSParentChildRelation *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  objc_super v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v15.receiver = *(id *)(a1 + 32);
  v15.super_class = (Class)&OBJC_METACLASS___CLSCollection;
  objc_msgSendSuper2(&v15, sel_relations);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED0FB3D0;
  qword_1ED0FB3D0 = v2;

  v4 = [CLSParentChildRelation alloc];
  v5 = *(_QWORD *)(a1 + 32);
  v6 = objc_opt_class();
  v8 = (void *)objc_msgSend_initWithParentEntity_childEntity_faultable_(v4, v7, v5, v6, 1);
  v9 = (void *)qword_1ED0FB3D0;
  v16[0] = v8;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v10, (uint64_t)v16, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setByAddingObjectsFromArray_(v9, v12, (uint64_t)v11);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)qword_1ED0FB3D0;
  qword_1ED0FB3D0 = v13;

}

uint64_t sub_1D4069A30(uint64_t a1, void *a2, _BYTE *a3)
{
  id v4;
  char isKindOfClass;

  v4 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    *a3 = 1;
  return isKindOfClass & 1;
}

uint64_t sub_1D4069F44(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1D4069F54(uint64_t a1)
{

}

void sub_1D4069F5C(_QWORD *a1, const char *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend_objectForKeyedSubscript_(*(void **)(a1[4] + 8), a2, a1[5]);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[6] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void sub_1D406A050(uint64_t a1)
{
  id WeakRetained;
  void (**v3)(_QWORD, _QWORD);
  _QWORD v4[4];
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = sub_1D406A0E4;
    v4[3] = &unk_1E974A060;
    v5 = *(id *)(a1 + 32);
    v3 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D82575D0](v4);
    ((void (**)(_QWORD, id))v3)[2](v3, WeakRetained);

  }
}

void sub_1D406A0E4(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  id v10;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend_objectID(v3, v5, v6);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 32);
  v8 = (void *)v4[1];

  objc_msgSend_setObject_forKeyedSubscript_(v8, v9, v7, v10);
}

void sub_1D406A1F8(uint64_t a1)
{
  NSObject *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  clsNotificationQueue();
  v2 = objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = sub_1D406A28C;
  v3[3] = &unk_1E974A088;
  v5 = *(id *)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  dispatch_async(v2, v3);

}

uint64_t sub_1D406A28C(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void sub_1D406A2E8()
{
  NSObject *v0;
  NSObject *v1;
  dispatch_queue_t v2;
  void *v3;
  NSObject *attr;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_USER_INITIATED, 0);
  attr = objc_claimAutoreleasedReturnValue();

  dispatch_get_global_queue(25, 0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = dispatch_queue_create_with_target_V2("com.apple.ClassKit.save.response", attr, v1);
  v3 = (void *)qword_1ED0FB3E0;
  qword_1ED0FB3E0 = (uint64_t)v2;

}

void sub_1D406A3E8(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  CLSChildParentRelation *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  objc_super v12;

  v12.receiver = *(id *)(a1 + 32);
  v12.super_class = (Class)&OBJC_METACLASS___CLSRange;
  objc_msgSendSuper2(&v12, sel_relations);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED0FB3F0;
  qword_1ED0FB3F0 = v2;

  v4 = [CLSChildParentRelation alloc];
  v5 = *(_QWORD *)(a1 + 32);
  v6 = objc_opt_class();
  v8 = (void *)objc_msgSend_initWithChildEntity_parentEntity_faultable_(v4, v7, v5, v6, 1);
  objc_msgSend_setByAddingObject_((void *)qword_1ED0FB3F0, v9, (uint64_t)v8);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)qword_1ED0FB3F0;
  qword_1ED0FB3F0 = v10;

}

void sub_1D406A4E0(uint64_t a1, const char *a2)
{
  uint64_t v2;
  void *v3;

  objc_msgSend_interfaceWithProtocol_(MEMORY[0x1E0CB3B50], a2, (uint64_t)&unk_1EFE3A750);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED0FB408;
  qword_1ED0FB408 = v2;

}

void sub_1D406A554(uint64_t a1, const char *a2)
{
  uint64_t v2;
  void *v3;

  objc_msgSend_interfaceWithProtocol_(MEMORY[0x1E0CB3B50], a2, (uint64_t)&unk_1EFE3C698);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED0FB418;
  qword_1ED0FB418 = v2;

}

void sub_1D406A5FC(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  CLSChildParentRelation *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  CLSParentChildRelation *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  CLSParentChildRelation *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  void *v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  objc_super v25;
  _QWORD v26[4];

  v26[3] = *MEMORY[0x1E0C80C00];
  v25.receiver = *(id *)(a1 + 32);
  v25.super_class = (Class)&OBJC_METACLASS___CLSArchivedHandoutAttachment;
  objc_msgSendSuper2(&v25, sel_relations);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED0FB420;
  qword_1ED0FB420 = v2;

  v4 = [CLSChildParentRelation alloc];
  v5 = *(_QWORD *)(a1 + 32);
  v6 = objc_opt_class();
  v8 = (void *)objc_msgSend_initWithChildEntity_parentEntity_faultable_(v4, v7, v5, v6, 1);
  v9 = [CLSParentChildRelation alloc];
  v10 = *(_QWORD *)(a1 + 32);
  v11 = objc_opt_class();
  v13 = (void *)objc_msgSend_initWithParentEntity_childEntity_faultable_(v9, v12, v10, v11, 1);
  v14 = [CLSParentChildRelation alloc];
  v15 = *(_QWORD *)(a1 + 32);
  v16 = objc_opt_class();
  v18 = (void *)objc_msgSend_initWithParentEntity_childEntity_faultable_(v14, v17, v15, v16, 1);
  v19 = (void *)qword_1ED0FB420;
  v26[0] = v8;
  v26[1] = v13;
  v26[2] = v18;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v20, (uint64_t)v26, 3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setByAddingObjectsFromArray_(v19, v22, (uint64_t)v21);
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = (void *)qword_1ED0FB420;
  qword_1ED0FB420 = v23;

}

__CFString *NSStringFromAuthorizationStatus(unint64_t a1, const char *a2)
{
  if (a1 < 3)
    return off_1E974A228[a1];
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("Unknown authorization status: '%ld'"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

uint64_t CLSAuthorizationStatusFromString(void *a1)
{
  id v1;
  const char *v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v8;
  const char *v9;
  id v10;

  v1 = a1;
  v3 = v1;
  if (!v1)
    goto LABEL_9;
  if ((objc_msgSend_isEqualToString_(v1, v2, (uint64_t)CFSTR("NotDetermined")) & 1) == 0)
  {
    if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("Denied")) & 1) != 0)
    {
      v5 = 2;
      goto LABEL_8;
    }
    if ((objc_msgSend_isEqualToString_(v3, v6, (uint64_t)CFSTR("Authorized")) & 1) != 0)
    {
      v5 = 1;
      goto LABEL_8;
    }
LABEL_9:
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v2, (uint64_t)CFSTR("Unknown authorization status string: %@"), v3);
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E0C99DA0], v9, *MEMORY[0x1E0C99778], v8, 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v10);
  }
  v5 = 0;
LABEL_8:

  return v5;
}

__CFString *NSStringFromShareType(unsigned int a1, const char *a2)
{
  if (a1 < 3)
    return off_1E974A240[a1];
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("Unknown share type: '%ld'"), (int)a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

uint64_t CLSShareTypeFromString(void *a1)
{
  id v1;
  const char *v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v8;
  const char *v9;
  id v10;

  v1 = a1;
  v3 = v1;
  if (!v1)
    goto LABEL_9;
  if ((objc_msgSend_isEqualToString_(v1, v2, (uint64_t)CFSTR("Copy")) & 1) == 0)
  {
    if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("OneToOne")) & 1) != 0)
    {
      v5 = 1;
      goto LABEL_8;
    }
    if ((objc_msgSend_isEqualToString_(v3, v6, (uint64_t)CFSTR("OneToMany")) & 1) != 0)
    {
      v5 = 2;
      goto LABEL_8;
    }
LABEL_9:
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v2, (uint64_t)CFSTR("Unknown share type string: '%@'"), v3);
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E0C99DA0], v9, *MEMORY[0x1E0C99778], v8, 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v10);
  }
  v5 = 0;
LABEL_8:

  return v5;
}

__CFString *NSStringFromPermissionType(int a1, const char *a2)
{
  __CFString *v2;

  if (a1 == 1)
    return CFSTR("ViewOnly");
  if (a1)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("Unknown permission type: '%ld'"), a1);
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = CFSTR("CanMakeChanges");
  }
  return v2;
}

uint64_t CLSPermissionTypeFromString(void *a1)
{
  id v1;
  const char *v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v7;
  const char *v8;
  id v9;

  v1 = a1;
  v3 = v1;
  if (!v1)
    goto LABEL_7;
  if ((objc_msgSend_isEqualToString_(v1, v2, (uint64_t)CFSTR("ViewOnly")) & 1) == 0)
  {
    if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("CanMakeChanges")) & 1) != 0)
    {
      v5 = 0;
      goto LABEL_6;
    }
LABEL_7:
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v2, (uint64_t)CFSTR("Unknown permission type string: '%@'"), v3);
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E0C99DA0], v8, *MEMORY[0x1E0C99778], v7, 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v9);
  }
  v5 = 1;
LABEL_6:

  return v5;
}

id CLSUbiquitousContainerID(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v3;
  const char *v4;
  void *v5;

  objc_msgSend_mainBundle(MEMORY[0x1E0CB34D0], a2, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForInfoDictionaryKey_(v3, v4, (uint64_t)CFSTR("NSClassKitUbiquitousContainer"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

__CFString *NSStringFromCLSASMPrivilegeType(int a1, const char *a2)
{
  if ((a1 - 1) < 5)
    return off_1E974A258[a1 - 1];
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("Unknown privilege type: '%ld'"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *NSStringFromInsightEventType(uint64_t a1, const char *a2)
{
  __CFString *v3;
  __CFString *result;

  v3 = CFSTR("Unknown");
  switch(a1)
  {
    case 0:
LABEL_4:
      result = v3;
      break;
    case 1:
      result = CFSTR("AssignHandout");
      break;
    case 2:
      result = CFSTR("UpdateHandout");
      break;
    case 3:
      result = CFSTR("TryAgain");
      break;
    case 4:
      result = CFSTR("ReviewAttachment");
      break;
    case 5:
      result = CFSTR("CancelTryAgain");
      break;
    case 6:
      result = CFSTR("CancelReviewAttachment");
      break;
    case 7:
      result = CFSTR("DeleteHandout");
      break;
    case 8:
      result = CFSTR("MarkHandoutDone");
      break;
    default:
      switch(a1)
      {
        case 201:
          result = CFSTR("Score");
          break;
        case 202:
          result = CFSTR("TimeSpent");
          break;
        case 203:
          result = CFSTR("Binary");
          break;
        case 204:
          result = CFSTR("Quantity");
          break;
        case 205:
          result = CFSTR("Range");
          break;
        case 206:
          result = CFSTR("ActivityStarted");
          break;
        default:
          switch(a1)
          {
            case 'e':
              v3 = CFSTR("OpenHandout");
              goto LABEL_4;
            case 'f':
              result = CFSTR("OpenAttachment");
              break;
            case 'g':
              result = CFSTR("MarkDone");
              break;
            case 'h':
              result = CFSTR("MarkDoneLate");
              break;
            case 'i':
              result = CFSTR("MarkNotDone");
              break;
            default:
              objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("Unknown event type: '%ld'"), a1);
              v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
              goto LABEL_4;
          }
          break;
      }
      break;
  }
  return result;
}

uint64_t CLSInsightEventTypeFromString(void *a1)
{
  id v1;
  const char *v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  const char *v13;
  const char *v14;
  const char *v15;
  const char *v16;
  const char *v17;
  const char *v18;
  uint64_t v20;
  const char *v21;
  id v22;

  v1 = a1;
  v3 = v1;
  if (!v1)
    goto LABEL_33;
  if ((objc_msgSend_isEqualToString_(v1, v2, (uint64_t)CFSTR("AssignHandout")) & 1) == 0)
  {
    if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("TryAgain")) & 1) != 0)
    {
      v5 = 3;
      goto LABEL_32;
    }
    if ((objc_msgSend_isEqualToString_(v3, v6, (uint64_t)CFSTR("ReviewAttachment")) & 1) != 0)
    {
      v5 = 4;
      goto LABEL_32;
    }
    if ((objc_msgSend_isEqualToString_(v3, v7, (uint64_t)CFSTR("OpenHandout")) & 1) != 0)
    {
      v5 = 101;
      goto LABEL_32;
    }
    if ((objc_msgSend_isEqualToString_(v3, v8, (uint64_t)CFSTR("OpenAttachment")) & 1) != 0)
    {
      v5 = 102;
      goto LABEL_32;
    }
    if ((objc_msgSend_isEqualToString_(v3, v9, (uint64_t)CFSTR("MarkDone")) & 1) != 0)
    {
      v5 = 103;
      goto LABEL_32;
    }
    if ((objc_msgSend_isEqualToString_(v3, v10, (uint64_t)CFSTR("MarkNotDone")) & 1) != 0)
    {
      v5 = 105;
      goto LABEL_32;
    }
    if ((objc_msgSend_isEqualToString_(v3, v11, (uint64_t)CFSTR("MarkDoneLate")) & 1) != 0)
    {
      v5 = 104;
      goto LABEL_32;
    }
    if ((objc_msgSend_isEqualToString_(v3, v12, (uint64_t)CFSTR("Score")) & 1) != 0)
    {
      v5 = 201;
      goto LABEL_32;
    }
    if ((objc_msgSend_isEqualToString_(v3, v13, (uint64_t)CFSTR("TimeSpent")) & 1) != 0)
    {
      v5 = 202;
      goto LABEL_32;
    }
    if ((objc_msgSend_isEqualToString_(v3, v14, (uint64_t)CFSTR("Binary")) & 1) != 0)
    {
      v5 = 203;
      goto LABEL_32;
    }
    if ((objc_msgSend_isEqualToString_(v3, v15, (uint64_t)CFSTR("Quantity")) & 1) != 0)
    {
      v5 = 204;
      goto LABEL_32;
    }
    if ((objc_msgSend_isEqualToString_(v3, v16, (uint64_t)CFSTR("Range")) & 1) != 0)
    {
      v5 = 205;
      goto LABEL_32;
    }
    if ((objc_msgSend_isEqualToString_(v3, v17, (uint64_t)CFSTR("ActivityStarted")) & 1) != 0)
    {
      v5 = 206;
      goto LABEL_32;
    }
    if ((objc_msgSend_isEqualToString_(v3, v18, (uint64_t)CFSTR("Unknown")) & 1) != 0)
    {
      v5 = 0;
      goto LABEL_32;
    }
LABEL_33:
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v2, (uint64_t)CFSTR("Unknown event type string: '%@'"), v3);
    v20 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E0C99DA0], v21, *MEMORY[0x1E0C99778], v20, 0);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v22);
  }
  v5 = 1;
LABEL_32:

  return v5;
}

__CFString *NSStringFromDevMode(unsigned int a1, const char *a2)
{
  if (a1 < 3)
    return off_1E974A280[a1];
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("Unknown dev mode type: '%ld'"), (int)a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

uint64_t CLSDevModeFromString(void *a1)
{
  id v1;
  const char *v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v8;
  const char *v9;
  id v10;

  v1 = a1;
  v3 = v1;
  if (!v1)
    goto LABEL_9;
  if ((objc_msgSend_isEqualToString_(v1, v2, (uint64_t)CFSTR("teacher")) & 1) == 0)
  {
    if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("student")) & 1) != 0)
    {
      v5 = 1;
      goto LABEL_8;
    }
    if ((objc_msgSend_isEqualToString_(v3, v6, (uint64_t)CFSTR("off")) & 1) != 0)
    {
      v5 = 0;
      goto LABEL_8;
    }
LABEL_9:
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v2, (uint64_t)CFSTR("Unknown dev mode type string: '%@'"), v3);
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E0C99DA0], v9, *MEMORY[0x1E0C99778], v8, 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v10);
  }
  v5 = 2;
LABEL_8:

  return v5;
}

uint64_t CLSDevModeFromInteger(uint64_t a1)
{
  if (a1 == 2)
    return 2;
  else
    return a1 == 1;
}

__CFString *NSStringFromBootstrapMode(unsigned int a1, const char *a2)
{
  if (a1 < 3)
    return off_1E974A298[a1];
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("Unknown bootstrap mode type: '%ld'"), (int)a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

uint64_t CLSBootstrapModeFromString(void *a1)
{
  id v1;
  const char *v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v8;
  const char *v9;
  id v10;

  v1 = a1;
  v3 = v1;
  if (!v1)
    goto LABEL_9;
  if ((objc_msgSend_isEqualToString_(v1, v2, (uint64_t)CFSTR("production")) & 1) == 0)
  {
    if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("QA")) & 1) != 0)
    {
      v5 = 1;
      goto LABEL_8;
    }
    if ((objc_msgSend_isEqualToString_(v3, v6, (uint64_t)CFSTR("custom")) & 1) != 0)
    {
      v5 = 2;
      goto LABEL_8;
    }
LABEL_9:
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v2, (uint64_t)CFSTR("Unknown bootstrap mode type string: '%@'"), v3);
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E0C99DA0], v9, *MEMORY[0x1E0C99778], v8, 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v10);
  }
  v5 = 0;
LABEL_8:

  return v5;
}

__CFString *NSStringFromClassKitCatalogEnvironment(uint64_t a1, const char *a2)
{
  __CFString *v2;

  if (!a1)
    return CFSTR("production");
  if (a1 == 1)
  {
    v2 = CFSTR("development");
  }
  else
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("Unknown ClassKit Catalog Environment: '%ld'"), a1);
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

uint64_t CLSClassKitCatalogEnvironmentFromString(void *a1)
{
  id v1;
  const char *v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v7;
  const char *v8;
  id v9;

  v1 = a1;
  v3 = v1;
  if (!v1)
    goto LABEL_7;
  if ((objc_msgSend_isEqualToString_(v1, v2, (uint64_t)CFSTR("production")) & 1) == 0)
  {
    if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("development")) & 1) != 0)
    {
      v5 = 1;
      goto LABEL_6;
    }
LABEL_7:
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v2, (uint64_t)CFSTR("Unknown ClassKit Catalog Environment string: '%@'"), v3);
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E0C99DA0], v8, *MEMORY[0x1E0C99778], v7, 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v9);
  }
  v5 = 0;
LABEL_6:

  return v5;
}

BOOL CLSClassKitCatalogEnvironmentInteger(uint64_t a1)
{
  return a1 == 1;
}

__CFString *NSStringFromCLSAuthenticationState(unsigned int a1, const char *a2)
{
  if (a1 < 3)
    return off_1E974A2B0[a1];
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("Unknown CLSAuthenticationState: '%ld'"), (int)a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

uint64_t CLSAuthenticationStateInteger(uint64_t a1)
{
  if (a1 == 2)
    return 2;
  else
    return a1 == 1;
}

__CFString *NSStringFromCollectionItemType(unint64_t a1, const char *a2)
{
  if (a1 < 6)
    return off_1E974A2C8[a1];
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("Unknown collection item type: '%ld'"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

uint64_t CLSCollectionItemTypeFromString(void *a1)
{
  id v1;
  const char *v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  uint64_t v11;
  const char *v12;
  id v13;

  v1 = a1;
  v3 = v1;
  if (!v1)
    goto LABEL_15;
  if ((objc_msgSend_isEqualToString_(v1, v2, (uint64_t)CFSTR("Unknown")) & 1) == 0)
  {
    if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("Handout")) & 1) != 0)
    {
      v5 = 1;
      goto LABEL_14;
    }
    if ((objc_msgSend_isEqualToString_(v3, v6, (uint64_t)CFSTR("Archive")) & 1) != 0)
    {
      v5 = 2;
      goto LABEL_14;
    }
    if ((objc_msgSend_isEqualToString_(v3, v7, (uint64_t)CFSTR("Attachment")) & 1) != 0)
    {
      v5 = 3;
      goto LABEL_14;
    }
    if ((objc_msgSend_isEqualToString_(v3, v8, (uint64_t)CFSTR("Context")) & 1) != 0)
    {
      v5 = 4;
      goto LABEL_14;
    }
    if ((objc_msgSend_isEqualToString_(v3, v9, (uint64_t)CFSTR("Question")) & 1) != 0)
    {
      v5 = 5;
      goto LABEL_14;
    }
LABEL_15:
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v2, (uint64_t)CFSTR("Unknown collection item type string: '%@'"), v3);
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E0C99DA0], v12, *MEMORY[0x1E0C99778], v11, 0);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v13);
  }
  v5 = 0;
LABEL_14:

  return v5;
}

uint64_t sub_1D406C66C(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  if (a3)
    return objc_msgSend_setObject_forKey_(a1, a2, a3);
  else
    return objc_msgSend_removeObjectForKey_(a1, a2, a4);
}

id sub_1D406CFA8(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D406D01C;
  block[3] = &unk_1E9749D50;
  block[4] = a1;
  if (qword_1ED0FB438 != -1)
    dispatch_once(&qword_1ED0FB438, block);
  return (id)qword_1ED0FB430;
}

void sub_1D406D01C(uint64_t a1)
{
  const char *v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  void *v6;
  id v7;
  const char *v8;
  uint64_t inited;
  void *v10;
  id v11;

  NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_firstObject(v11, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingPathComponent_(v4, v5, (uint64_t)CFSTR(".ClassKit"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc(*(Class *)(a1 + 32));
  inited = objc_msgSend_initFileURLWithPath_(v7, v8, (uint64_t)v6);
  v10 = (void *)qword_1ED0FB430;
  qword_1ED0FB430 = inited;

}

id sub_1D406D0B0(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D406D124;
  block[3] = &unk_1E9749D50;
  block[4] = a1;
  if (qword_1ED0FB448 != -1)
    dispatch_once(&qword_1ED0FB448, block);
  return (id)qword_1ED0FB440;
}

void sub_1D406D124(uint64_t a1, const char *a2, uint64_t a3)
{
  const char *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend_cls_libraryURL(*(void **)(a1 + 32), a2, a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_URLByAppendingPathComponent_isDirectory_(v6, v3, (uint64_t)CFSTR(".config"), 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)qword_1ED0FB440;
  qword_1ED0FB440 = v4;

}

id sub_1D406D178(void *a1, const char *a2, uint64_t a3)
{
  const char *v4;
  NSObject *v5;
  uint8_t v7[16];

  if (objc_msgSend_isMainThread(MEMORY[0x1E0CB3978], a2, a3))
  {
    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v5 = CLSLogDefault;
    if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_error_impl(&dword_1D4054000, v5, OS_LOG_TYPE_ERROR, "ERROR: +[NSURL cls_ubiquitousContainerURL] should not be accessed from the main thread. Please update your implementation to access this property from a secondary thread as soon as possible. This will become a hard error (assert) in the future.", v7, 2u);
    }
  }
  objc_msgSend_cls_ubiquitousContainerURL_Imp_(a1, v4, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

void sub_1D406D22C(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v4 = a3;
  dispatch_get_global_queue(33, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1D406D2C8;
  v7[3] = &unk_1E974A300;
  v8 = v4;
  v9 = a1;
  v6 = v4;
  dispatch_async(v5, v7);

}

void sub_1D406D2C8(uint64_t a1, const char *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  v3 = *(void **)(a1 + 40);
  v6 = 0;
  objc_msgSend_cls_ubiquitousContainerURL_Imp_(v3, a2, (uint64_t)&v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v6;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t sub_1D406D334(void *a1, const char *a2)
{
  return objc_msgSend_cls_documentsURLAndReturnError_(a1, a2, 0);
}

id sub_1D406D33C(void *a1, const char *a2, _QWORD *a3)
{
  void *v4;
  const char *v5;
  void *v6;
  void *v7;
  const char *v8;
  void *v9;
  id v10;
  void *v11;
  id v13;

  objc_msgSend_cls_ubiquitousContainerURL_Imp_(a1, a2, (uint64_t)a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  if (v4)
  {
    objc_msgSend_URLByAppendingPathComponent_isDirectory_(v4, v5, (uint64_t)CFSTR("Documents"), 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    objc_msgSend_cls_createDirectoryIfNeeded_(v7, v8, (uint64_t)&v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_retainAutorelease(v13);
    v11 = v10;
    if (a3)
      *a3 = v10;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

uint64_t sub_1D406D3E0(uint64_t a1)
{
  return MEMORY[0x1E0DE7D20](a1, sel_cls_draftsURLAndReturnError_, 0);
}

id sub_1D406D3E8(void *a1, const char *a2, _QWORD *a3)
{
  void *v4;
  const char *v5;
  void *v6;
  void *v7;
  const char *v8;
  void *v9;
  id v10;
  void *v11;
  id v13;

  objc_msgSend_cls_documentsURLAndReturnError_(a1, a2, (uint64_t)a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  if (v4)
  {
    objc_msgSend_URLByAppendingPathComponent_isDirectory_(v4, v5, (uint64_t)CFSTR(".Drafts"), 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    objc_msgSend_cls_createDirectoryIfNeeded_(v7, v8, (uint64_t)&v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_retainAutorelease(v13);
    v11 = v10;
    if (a3)
      *a3 = v10;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

__CFString *sub_1D406D48C(void *a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  const char *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  const char *v14;
  size_t v15;
  size_t v16;
  const char *v17;
  uint64_t v18;
  __CFString *v19;
  const char *v21;
  void *v22;
  size_t v23;
  const char *v24;

  v4 = a3;
  v5 = objc_retainAutorelease(a1);
  v8 = (const char *)objc_msgSend_fileSystemRepresentation(v5, v6, v7);
  if (!*v8)
    goto LABEL_8;
  v9 = v8;
  v10 = objc_retainAutorelease(v4);
  v13 = (const char *)objc_msgSend_fileSystemRepresentation(v10, v11, v12);
  if (!v13)
    goto LABEL_8;
  v14 = v13;
  v15 = strlen(v13);
  if (!v15)
    goto LABEL_8;
  v16 = v14[v15 - 1] == 47 ? v15 - 1 : v15;
  if (strncmp(v9, v14, v16))
    goto LABEL_8;
  if (v9[v16] == 47)
  {
    if (v9[v16 + 1])
    {
      v21 = &v9[v16 + 1];
      objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v17, v18);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = strlen(v21);
      objc_msgSend_stringWithFileSystemRepresentation_length_(v22, v24, (uint64_t)v21, v23);
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();

      goto LABEL_9;
    }
LABEL_15:
    v19 = &stru_1E974C8A0;
    goto LABEL_9;
  }
  if (!v9[v16])
    goto LABEL_15;
LABEL_8:
  v19 = 0;
LABEL_9:

  return v19;
}

uint64_t sub_1D406D58C(uint64_t a1, const char *a2)
{
  void *v3;
  const char *v4;
  void *v5;
  uint64_t isParentOfURL;

  objc_msgSend_cls_ubiquitousContainerURL_Imp_(MEMORY[0x1E0C99E98], a2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  if (v3)
    isParentOfURL = objc_msgSend_cls_isParentOfURL_(v3, v4, a1);
  else
    isParentOfURL = 0;

  return isParentOfURL;
}

uint64_t sub_1D406D5E4(void *a1, const char *a2, uint64_t a3)
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  const char *v10;
  void *v11;
  const char *v12;
  id v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t isEqualToString;
  NSObject *v25;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  _QWORD v32[4];

  v32[3] = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend_cls_isUbiquitous(a1, a2, a3))
    return 0;
  v5 = *MEMORY[0x1E0C99B38];
  v6 = *MEMORY[0x1E0C99B40];
  v32[0] = *MEMORY[0x1E0C99B38];
  v32[1] = v6;
  v7 = *MEMORY[0x1E0C99B00];
  v32[2] = *MEMORY[0x1E0C99B00];
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v4, (uint64_t)v32, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_cls_removeCachedResourceValueForKeys_(a1, v9, (uint64_t)v8);
  v27 = 0;
  objc_msgSend_resourceValuesForKeys_error_(a1, v10, (uint64_t)v8, &v27);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v27;
  if (v11)
  {
    objc_msgSend_objectForKeyedSubscript_(v11, v12, v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v11, v15, v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v11, v17, v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_BOOLValue(v14, v19, v20) && (objc_msgSend_BOOLValue(v16, v21, v22) & 1) == 0)
      isEqualToString = objc_msgSend_isEqualToString_((void *)*MEMORY[0x1E0C99AF0], v23, (uint64_t)v18);
    else
      isEqualToString = 0;

  }
  else
  {
    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v25 = CLSLogDefault;
    if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v29 = a1;
      v30 = 2112;
      v31 = v13;
      _os_log_error_impl(&dword_1D4054000, v25, OS_LOG_TYPE_ERROR, "Unable to get upload status for URL: '%@'. Error: %@", buf, 0x16u);
    }
    isEqualToString = 0;
  }

  return isEqualToString;
}

BOOL sub_1D406D7FC(void *a1)
{
  id v1;
  const char *v2;
  uint64_t v3;
  const char *v4;
  int v6;
  stat v8;

  v1 = objc_retainAutorelease(a1);
  v4 = (const char *)objc_msgSend_fileSystemRepresentation(v1, v2, v3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                       0,
                       0);
  if (stat(v4, &v8))
    return 0;
  v6 = v8.st_mode & 0xF000;
  return v6 == 0x8000 || v6 == 0x4000;
}

uint64_t sub_1D406D860(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  unint64_t v11;

  v11 = 0;
  v3 = (void *)MEMORY[0x1E0CB3620];
  v4 = a3;
  objc_msgSend_defaultManager(v3, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a1) = objc_msgSend_getRelationship_ofDirectoryAtURL_toItemAtURL_error_(v7, v8, (uint64_t)&v11, a1, v4, 0);

  if (v11 < 2)
    a1 = a1;
  else
    a1 = 0;

  return a1;
}

id sub_1D406D8E0(void *a1, const char *a2, _QWORD *a3)
{
  const char *v5;
  uint64_t v6;
  void *v8;
  const char *v9;
  char v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_cls_fileExists(a1, a2, (uint64_t)a3))
    return a1;
  objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v10 = objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(v8, v9, (uint64_t)a1, 1, 0, &v19);
  v11 = objc_retainAutorelease(v19);
  v12 = v11;
  if (a3)
    *a3 = v11;
  if ((v10 & 1) != 0)
  {
    v13 = a1;
  }
  else
  {
    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v14 = (void *)CLSLogConnection;
    if (os_log_type_enabled((os_log_t)CLSLogConnection, OS_LOG_TYPE_ERROR))
    {
      v15 = v14;
      objc_msgSend_path(a1, v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v21 = v18;
      v22 = 2112;
      v23 = v12;
      _os_log_error_impl(&dword_1D4054000, v15, OS_LOG_TYPE_ERROR, "Failed to create directory at path '%@'. Error: %@", buf, 0x16u);

    }
    v13 = 0;
  }

  return v13;
}

void sub_1D406DA68(void *a1, uint64_t a2, void *a3)
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v11, v15, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v4);
        objc_msgSend_removeCachedResourceValueForKey_(a1, v7, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v11, v15, 16);
    }
    while (v8);
  }

}

uint64_t sub_1D406DB54(void *a1, const char *a2, uint64_t a3)
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend_absoluteString(a1, a2, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend__cls_stableHash(v3, v4, v5);

  return v6;
}

id sub_1D406DB88(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  id v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  id v15;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v3 = (uint64_t *)a3;
  v22 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v19 = 0;
    v3 = &v19;
  }
  objc_msgSend_shared(CLSDataStore, a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_cachedCurrentUser(v4, v5, v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9 || (objc_msgSend_currentUser(v4, v7, v8), (v9 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend_schoolworkUbiquitousContainerURL(v9, v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_schoolworkUbiquitousContainerError(v9, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      if (qword_1ED0FB9A0 != -1)
        dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
      v14 = CLSLogDefault;
      if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v21 = v13;
        _os_log_error_impl(&dword_1D4054000, v14, OS_LOG_TYPE_ERROR, "Failed to find Ubiquitous container. Error: %@", buf, 0xCu);
      }
    }
    v15 = objc_retainAutorelease(v13);
    *v3 = (uint64_t)v15;

  }
  else
  {
    objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E0CB35C8], v7, 324, CFSTR("No valid user found"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v18 = CLSLogDefault;
    if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v17;
      _os_log_error_impl(&dword_1D4054000, v18, OS_LOG_TYPE_ERROR, "Failed to find Ubiquitous container. Error: %@", buf, 0xCu);
    }
    v9 = objc_retainAutorelease(v17);
    v10 = 0;
    *v3 = (uint64_t)v9;
  }

  return v10;
}

void sub_1D406DD9C(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  void (**v20)(_QWORD, _QWORD, _QWORD);
  const char *v21;
  uint64_t v22;
  id v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  NSObject *v29;
  id v30;
  const char *v31;
  id v32;
  const char *v33;
  const char *v34;
  void *v35;
  id v36;
  const char *v37;
  void *v38;
  const char *v39;
  void *v40;
  const char *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  const char *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  NSObject *v49;
  NSObject *v50;
  NSObject *v51;
  void (**v52)(_QWORD, _QWORD, _QWORD, _QWORD);
  id v53;
  void *v54;
  id v55;
  id v56;
  _QWORD v57[4];
  void (**v58)(_QWORD, _QWORD, _QWORD);
  _QWORD v59[4];
  id v60;
  _QWORD v61[4];
  id v62;
  uint64_t *v63;
  _BYTE *v64;
  id v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  char v69;
  _QWORD v70[4];
  id v71;
  uint64_t v72;
  uint8_t buf[4];
  uint64_t v74;
  __int16 v75;
  id v76;
  __int16 v77;
  void *v78;
  _BYTE v79[24];
  uint64_t (*v80)(uint64_t, uint64_t);
  void (*v81)(uint64_t);
  id v82;
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v55 = a4;
  v15 = a5;
  v16 = a6;
  v56 = a7;
  v17 = a8;
  v18 = MEMORY[0x1E0C809B0];
  v70[0] = MEMORY[0x1E0C809B0];
  v70[1] = 3221225472;
  v70[2] = sub_1D406E584;
  v70[3] = &unk_1E974A328;
  v72 = a1;
  v19 = v17;
  v71 = v19;
  v20 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1D82575D0](v70);
  if (objc_msgSend_length(v15, v21, v22))
  {
    v66 = 0;
    v67 = &v66;
    v68 = 0x2020000000;
    v69 = 0;
    *(_QWORD *)v79 = 0;
    *(_QWORD *)&v79[8] = v79;
    *(_QWORD *)&v79[16] = 0x3032000000;
    v80 = sub_1D406E740;
    v81 = sub_1D406E750;
    v82 = 0;
    v54 = (void *)objc_opt_new();
    v65 = 0;
    v61[0] = v18;
    v61[1] = 3221225472;
    v61[2] = sub_1D406E758;
    v61[3] = &unk_1E974A350;
    v63 = &v66;
    v23 = v15;
    v62 = v23;
    v64 = v79;
    objc_msgSend_coordinateReadingItemAtURL_options_error_byAccessor_(v54, v24, (uint64_t)v14, 4, &v65, v61);
    v53 = v65;
    if (v53 || !*((_BYTE *)v67 + 24))
    {
      v59[0] = v18;
      v59[1] = 3221225472;
      v59[2] = sub_1D406E9F8;
      v59[3] = &unk_1E974A3A0;
      v60 = v55;
      v52 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x1D82575D0](v59);
      if (!objc_msgSend_length(v16, v25, v26))
      {
        if (qword_1ED0FB9A0 != -1)
          dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
        v29 = CLSLogAsset;
        if (os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
        }
        v30 = (id)*MEMORY[0x1E0C94730];

        v16 = v30;
      }
      if (objc_msgSend_length(v56, v27, v28))
      {
        v32 = objc_alloc(MEMORY[0x1E0C95098]);
        v35 = (void *)objc_msgSend_initWithZoneName_ownerName_(v32, v33, (uint64_t)v56, v16);
        if (v35)
        {
          v36 = objc_alloc(MEMORY[0x1E0C95070]);
          objc_msgSend_stringByAppendingString_(CFSTR("documentContent/"), v37, (uint64_t)v23);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = (void *)objc_msgSend_initWithRecordName_zoneID_(v36, v39, (uint64_t)v38, v35);

          if (v40)
          {
            if (qword_1ED0FB9A0 != -1)
              dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
            v42 = CLSLogAsset;
            if (os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D4054000, v42, OS_LOG_TYPE_DEFAULT, "Perform a lookup using CKRecordID", buf, 2u);
            }
            v57[0] = v18;
            v57[1] = 3221225472;
            v57[2] = sub_1D406EE8C;
            v57[3] = &unk_1E974A3C8;
            v58 = v20;
            ((void (**)(_QWORD, void *, uint64_t, _QWORD *))v52)[2](v52, v40, 1, v57);
            v43 = v58;
          }
          else
          {
            objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E0CB35C8], v41, 325, CFSTR("Failed to create recordID"));
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            if (qword_1ED0FB9A0 != -1)
              dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
            v51 = CLSLogAsset;
            if (os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 141558530;
              v74 = 1752392040;
              v75 = 2112;
              v76 = v14;
              v77 = 2114;
              v78 = v43;
              _os_log_error_impl(&dword_1D4054000, v51, OS_LOG_TYPE_ERROR, "Failed to create recordID for asset url: %{mask.hash}@, error:%{public}@", buf, 0x20u);
            }
            ((void (**)(_QWORD, _QWORD, void *))v20)[2](v20, 0, v43);
          }

        }
        else
        {
          objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E0CB35C8], v34, 325, CFSTR("Failed to create zoneID"));
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          if (qword_1ED0FB9A0 != -1)
            dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
          v50 = CLSLogAsset;
          if (os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 141558530;
            v74 = 1752392040;
            v75 = 2112;
            v76 = v14;
            v77 = 2114;
            v78 = v40;
            _os_log_error_impl(&dword_1D4054000, v50, OS_LOG_TYPE_ERROR, "Failed to create ZoneID for asset url: %{mask.hash}@, error:%{public}@", buf, 0x20u);
          }
          ((void (**)(_QWORD, _QWORD, void *))v20)[2](v20, 0, v40);
        }

      }
      else
      {
        objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E0CB35C8], v31, 307, CFSTR("Zone name for the asset must be a non-empty string"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        if (qword_1ED0FB9A0 != -1)
          dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
        v49 = CLSLogAsset;
        if (os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 141558530;
          v74 = 1752392040;
          v75 = 2112;
          v76 = v14;
          v77 = 2114;
          v78 = v35;
          _os_log_error_impl(&dword_1D4054000, v49, OS_LOG_TYPE_ERROR, "Could not create recordID for asset url: %{mask.hash}@, error:%{public}@", buf, 0x20u);
        }
        ((void (**)(_QWORD, _QWORD, void *))v20)[2](v20, 0, v35);
      }

    }
    else
    {
      v20[2](v20, *(_QWORD *)(*(_QWORD *)&v79[8] + 40), 0);
    }

    _Block_object_dispose(v79, 8);
    _Block_object_dispose(&v66, 8);

  }
  else
  {
    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v44 = (void *)CLSLogAsset;
    if (os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_DEFAULT))
    {
      v45 = v44;
      objc_msgSend_path(v14, v46, v47);
      v48 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v79 = 138412802;
      *(_QWORD *)&v79[4] = a1;
      *(_WORD *)&v79[12] = 2160;
      *(_QWORD *)&v79[14] = 1752392040;
      *(_WORD *)&v79[22] = 2112;
      v80 = v48;
      _os_log_impl(&dword_1D4054000, v45, OS_LOG_TYPE_DEFAULT, "No item ID for asset: %@, returning url for file at expected path '%{mask.hash}@'", v79, 0x20u);

    }
    ((void (**)(_QWORD, id, _QWORD))v20)[2](v20, v14, 0);
  }

}

void sub_1D406E540(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  uint64_t v33;

  _Block_object_dispose((const void *)(v33 - 176), 8);
  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

void sub_1D406E584(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  qos_class_t v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (qword_1ED0FB9A0 != -1)
    dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
  v7 = CLSLogAsset;
  if (os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138413058;
    v19 = v8;
    v20 = 2160;
    v21 = 1752392040;
    v22 = 2112;
    v23 = v5;
    v24 = 2114;
    v25 = v6;
    _os_log_impl(&dword_1D4054000, v7, OS_LOG_TYPE_DEFAULT, "Done looking up url for asset: %@; url: %{mask.hash}@; error: %{public}@",
      buf,
      0x2Au);
  }
  v9 = qos_class_self();
  dispatch_get_global_queue(v9, 0);
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D406E72C;
  block[3] = &unk_1E9749E10;
  v11 = *(id *)(a1 + 32);
  v16 = v6;
  v17 = v11;
  v15 = v5;
  v12 = v6;
  v13 = v5;
  dispatch_async(v10, block);

}

uint64_t sub_1D406E72C(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t sub_1D406E740(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1D406E750(uint64_t a1)
{

}

void sub_1D406E758(uint64_t *a1, void *a2)
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  char isEqualToString;
  void *v12;
  _BOOL4 v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = objc_msgSend_cls_fileExists(v4, v5, v6);
  if (*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
  {
    objc_msgSend_br_itemID(v4, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToString = objc_msgSend_isEqualToString_(v9, v10, a1[4]);
    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v12 = (void *)CLSLogAsset;
    v13 = os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_DEFAULT);
    if ((isEqualToString & 1) != 0)
    {
      if (v13)
      {
        v14 = v12;
        objc_msgSend_path(v4, v15, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 138412290;
        v29 = (uint64_t)v17;
        _os_log_impl(&dword_1D4054000, v14, OS_LOG_TYPE_DEFAULT, "File exists in mobile documents for asset: %@", (uint8_t *)&v28, 0xCu);

      }
      objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a2);
    }
    else
    {
      if (v13)
      {
        v23 = v12;
        objc_msgSend_path(v4, v24, v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = a1[4];
        v28 = 141558786;
        v29 = 1752392040;
        v30 = 2112;
        v31 = v26;
        v32 = 2112;
        v33 = v9;
        v34 = 2112;
        v35 = v27;
        _os_log_impl(&dword_1D4054000, v23, OS_LOG_TYPE_DEFAULT, "Mismatched itemID for file: %{mask.hash}@, found: %@, expected: %@", (uint8_t *)&v28, 0x2Au);

      }
      *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 0;
    }

  }
  else
  {
    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v18 = (void *)CLSLogAsset;
    if (os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_DEFAULT))
    {
      v19 = v18;
      objc_msgSend_path(v4, v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 141558274;
      v29 = 1752392040;
      v30 = 2112;
      v31 = v22;

    }
  }

}

void sub_1D406E9F8(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  objc_class *v8;
  id v9;
  id v10;
  const char *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  const char *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *, void *);
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  char v28;

  v7 = a4;
  v8 = (objc_class *)MEMORY[0x1E0D10EE8];
  v9 = a2;
  v10 = [v8 alloc];
  v12 = (void *)objc_msgSend_initWithRecordID_fileURL_withServerLookup_(v10, v11, (uint64_t)v9, *(_QWORD *)(a1 + 32), a3);

  sub_1D406EB24();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x1E0C809B0];
  v22 = 3221225472;
  v23 = sub_1D406EB64;
  v24 = &unk_1E974A378;
  v26 = v7;
  v27 = 0x4034000000000000;
  v28 = a3;
  v25 = v12;
  v14 = v7;
  v15 = v12;
  v16 = (void *)MEMORY[0x1D82575D0](&v21);
  v17 = CLSCurrentNSQualityOfService();
  objc_msgSend_setQualityOfService_(v15, v18, v17, v21, v22, v23, v24);
  objc_msgSend_setCopyDocumentURLCompletionBlock_(v15, v19, (uint64_t)v16);
  objc_msgSend_performOperation_onOperationQueue_withTimeOut_((void *)qword_1ED0FB450, v20, (uint64_t)v15, v13, 20.0);

}

id sub_1D406EB24()
{
  if (qword_1ED0FB460 != -1)
    dispatch_once(&qword_1ED0FB460, &unk_1E974A518);
  return (id)qword_1ED0FB458;
}

void sub_1D406EB64(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  void *v18;
  const char *v19;
  const char *v20;
  qos_class_t v21;
  NSObject *v22;
  id v23;
  id v24;
  id v25;
  const char *v26;
  _QWORD block[4];
  id v28;
  id v29;
  id v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (qword_1ED0FB9A0 != -1)
    dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
  v7 = CLSLogAsset;
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_ERROR))
    {
      v26 = *(const char **)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v32 = v26;
      v33 = 2112;
      v34 = v6;
      _os_log_error_impl(&dword_1D4054000, v7, OS_LOG_TYPE_ERROR, "Failed to complete operation: %@, error: %@", buf, 0x16u);
    }
    objc_msgSend_removeOperation_((void *)qword_1ED0FB450, v8, *(_QWORD *)(a1 + 32));
    if (objc_msgSend_code(v6, v9, v10) == 3072)
    {
      v12 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v11, (uint64_t)CFSTR("Operation was cancelled because it took more than %f seconds"), *(_QWORD *)(a1 + 48));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_cls_createErrorWithCode_underlyingError_description_(v12, v14, 320, v6, v13);
      v15 = objc_claimAutoreleasedReturnValue();

      v6 = (id)v15;
    }
    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v16 = CLSLogAsset;
    if (os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_ERROR))
    {
      v17 = "Remote";
      v18 = *(void **)(a1 + 32);
      if (!*(_BYTE *)(a1 + 56))
        v17 = "Local";
      *(_DWORD *)buf = 136315650;
      v32 = v17;
      v33 = 2112;
      v34 = v18;
      v35 = 2114;
      v36 = v6;
      _os_log_error_impl(&dword_1D4054000, v16, OS_LOG_TYPE_ERROR, "%s asset lookup operation [%@] failed with error: %{public}@", buf, 0x20u);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_DEFAULT))
    {
      v20 = *(const char **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v32 = v20;
      _os_log_impl(&dword_1D4054000, v7, OS_LOG_TYPE_DEFAULT, "Completed operation: %@", buf, 0xCu);
    }
    objc_msgSend_removeOperation_((void *)qword_1ED0FB450, v19, *(_QWORD *)(a1 + 32));
    v6 = 0;
  }
  v21 = qos_class_self();
  dispatch_get_global_queue(v21, 0);
  v22 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D406EE78;
  block[3] = &unk_1E9749E10;
  v23 = *(id *)(a1 + 40);
  v29 = v6;
  v30 = v23;
  v28 = v5;
  v24 = v6;
  v25 = v5;
  dispatch_async(v22, block);

}

uint64_t sub_1D406EE78(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void sub_1D406EE8C(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5;
  unint64_t v6;
  NSObject *v7;
  uint8_t v8[16];

  v5 = a2;
  v6 = a3;
  if (!(v5 | v6))
  {
    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v7 = CLSLogAsset;
    if (os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_error_impl(&dword_1D4054000, v7, OS_LOG_TYPE_ERROR, "Lookup using BRShareCopyDocumentURLForRecordID return url == nil but did not return an error!", v8, 2u);
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void sub_1D406EF60(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8)
{
  id v14;
  id v15;
  const char *v16;
  _QWORD v17[4];
  id v18;
  void *v19;

  v14 = a8;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = sub_1D406F018;
  v17[3] = &unk_1E974A328;
  v18 = v14;
  v19 = a1;
  v15 = v14;
  objc_msgSend_cls_urlSuitableForOpeningForExpectedURL_containerURL_itemID_ownerName_zoneName_completion_(a1, v16, a3, a4, a5, a6, a7, v17);

}

void sub_1D406F018(uint64_t a1, void *a2, void *a3)
{
  id v5;
  const char *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v5 = a2;
  v7 = a3;
  if (v5)
  {
    v8 = *(void **)(a1 + 40);
    v13 = 0;
    v9 = objc_msgSend_cls_deleteFileAtURL_error_(v8, v6, (uint64_t)v5, &v13);
    v10 = v13;
    v11 = *(_QWORD *)(a1 + 32);
    if (v11)
      (*(void (**)(uint64_t, uint64_t, id))(v11 + 16))(v11, v9, v10);

  }
  else
  {
    v12 = *(_QWORD *)(a1 + 32);
    if (v12)
      (*(void (**)(uint64_t, _QWORD, id))(v12 + 16))(v12, 0, v7);
  }

}

BOOL sub_1D406F0C8(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v5;
  void *v6;
  const char *v7;
  const char *v8;
  _BOOL8 v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v5 = a3;
  v6 = (void *)objc_opt_new();
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_1D406E740;
  v16 = sub_1D406E750;
  v17 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1D406F22C;
  v11[3] = &unk_1E974A3F0;
  v11[4] = &v18;
  v11[5] = &v12;
  objc_msgSend_coordinateWritingItemAtURL_options_error_byAccessor_(v6, v7, (uint64_t)v5, 1, a4, v11);
  if (*((_BYTE *)v19 + 24))
  {
    v9 = 1;
  }
  else if (v13[5])
  {
    objc_msgSend_cls_assignError_fromError_(MEMORY[0x1E0CB35C8], v8, a4);
    v9 = *((_BYTE *)v19 + 24) != 0;
  }
  else
  {
    v9 = 0;
  }
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  return v9;
}

void sub_1D406F208(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1D406F22C(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  char v9;
  id v10;
  uint64_t v11;
  const char *v12;
  id obj;
  id v14;

  v3 = (void *)MEMORY[0x1E0CB3620];
  v4 = a2;
  objc_msgSend_defaultManager(v3, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v9 = objc_msgSend_removeItemAtURL_error_(v7, v8, (uint64_t)v4, &v14);

  v10 = v14;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v9;

  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v11 + 40);
  objc_msgSend_cls_assignError_fromError_(MEMORY[0x1E0CB35C8], v12, (uint64_t)&obj, v10);
  objc_storeStrong((id *)(v11 + 40), obj);

}

void sub_1D406F2E0(void *a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  const char *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint64_t v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = CLSCurrentNSQualityOfService();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_1D406F3B0;
  v16[3] = &unk_1E974A490;
  v16[4] = a1;
  v17 = v8;
  v19 = v10;
  v20 = v11;
  v18 = v9;
  v12 = v9;
  v13 = v8;
  v14 = v10;
  objc_msgSend_cls_checkForCKShareWithCompletion_(a1, v15, (uint64_t)v16);

}

void sub_1D406F3B0(uint64_t a1, int a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  void (*v15)(void);
  void *v16;
  id v17;
  NSObject *v18;
  const char *v19;
  id v20;
  void *v21;
  NSObject *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  NSObject *v27;
  id v28;
  const char *v29;
  void *v30;
  id v31;
  const char *v32;
  void *v33;
  const char *v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  id v38;
  const char *v39;
  id v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  const char *v44;
  const char *v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  id v49;
  _QWORD v50[4];
  id v51;
  uint64_t v52;
  id v53;
  id v54;
  id v55;
  uint64_t v56;
  _QWORD v57[4];
  id v58;
  uint64_t v59;
  void *v60;
  uint8_t buf[4];
  uint64_t v62;
  __int16 v63;
  void *v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v14 = v11;
  if (v11 && objc_msgSend_code(v11, v12, v13) != 20)
  {
    v15 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
    goto LABEL_16;
  }
  if (a2)
  {
    v15 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
LABEL_16:
    v15();
    goto LABEL_21;
  }
  v59 = 0;
  BRSharingCreateShareForItemAtURL();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  if (qword_1ED0FB9A0 != -1)
    dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
  v18 = CLSLogAsset;
  if (v16)
  {
    if (os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_DEFAULT))
    {
      v48 = v16;
      v20 = v17;
      v21 = *(void **)(a1 + 32);
      v22 = v18;
      objc_msgSend_path(v21, v23, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 141558274;
      v62 = 1752392040;
      v63 = 2112;
      v64 = v25;
      _os_log_impl(&dword_1D4054000, v22, OS_LOG_TYPE_DEFAULT, "About to fetch users and add them to share for asset at '%{mask.hash}@'", buf, 0x16u);

      v17 = v20;
      v16 = v48;

    }
    objc_msgSend_containerWithIdentifier_(MEMORY[0x1E0C94C28], v19, (uint64_t)CFSTR("com.apple.clouddocs"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v17;
    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v27 = CLSLogAsset;
    if (os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D4054000, v27, OS_LOG_TYPE_DEFAULT, "About to fetch ORG admin user as a participant", buf, 2u);
    }
    v28 = objc_alloc(MEMORY[0x1E0C95218]);
    v30 = (void *)objc_msgSend_initWithUserRecordID_(v28, v29, *(_QWORD *)(a1 + 40));
    v31 = objc_alloc(MEMORY[0x1E0C94E50]);
    v60 = v30;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v32, (uint64_t)&v60, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void *)objc_msgSend_initWithUserIdentityLookupInfos_(v31, v34, (uint64_t)v33);

    objc_msgSend_setQualityOfService_(v35, v36, *(_QWORD *)(a1 + 64));
    v37 = MEMORY[0x1E0C809B0];
    v57[0] = MEMORY[0x1E0C809B0];
    v57[1] = 3221225472;
    v57[2] = sub_1D406F7F8;
    v57[3] = &unk_1E974A418;
    v38 = v16;
    v58 = v38;
    objc_msgSend_setPerShareParticipantCompletionBlock_(v35, v39, (uint64_t)v57);
    v50[0] = v37;
    v50[1] = 3221225472;
    v50[2] = sub_1D406F970;
    v50[3] = &unk_1E974A468;
    v55 = *(id *)(a1 + 56);
    v40 = v14;
    v41 = *(_QWORD *)(a1 + 32);
    v51 = v40;
    v52 = v41;
    v53 = *(id *)(a1 + 48);
    v42 = v38;
    v43 = *(_QWORD *)(a1 + 64);
    v54 = v42;
    v56 = v43;
    objc_msgSend_setFetchShareParticipantsCompletionBlock_(v35, v44, (uint64_t)v50);
    objc_msgSend_addOperation_(v26, v45, (uint64_t)v35);

    v17 = v49;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v62 = (uint64_t)v17;
      _os_log_error_impl(&dword_1D4054000, v18, OS_LOG_TYPE_ERROR, "Failed to create the share with error: %{public}@", buf, 0xCu);
    }
    v47 = *(_QWORD *)(a1 + 56);
    objc_msgSend_cls_createErrorWithCode_errorObject_description_(MEMORY[0x1E0CB35C8], v46, 316, v17, CFSTR("Failed to create the share"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, void *))(v47 + 16))(v47, 0, 0, 0, v26);
  }

LABEL_21:
}

void sub_1D406F7F8(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  const char *v13;
  const char *v14;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = (void *)MEMORY[0x1D82573E4]();
  if (qword_1ED0FB9A0 != -1)
    dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
  v11 = CLSLogAsset;
  if (v8)
  {
    if (os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_1D4054000, v11, OS_LOG_TYPE_DEFAULT, "About to add ORG admin user to the share as a participant with admin role and RW permission", (uint8_t *)&v15, 2u);
    }
    objc_msgSend_setRole_(v8, v12, 2);
    objc_msgSend_setPermission_(v8, v13, 3);
    objc_msgSend_addParticipant_(*(void **)(a1 + 32), v14, (uint64_t)v8);
  }
  else if (os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_ERROR))
  {
    v15 = 138543362;
    v16 = v9;
    _os_log_error_impl(&dword_1D4054000, v11, OS_LOG_TYPE_ERROR, "[perShareParticipantCompletionBlock] Failed to fetch ORG admin user as a participant; error: %{public}@",
      (uint8_t *)&v15,
      0xCu);
  }
  objc_autoreleasePoolPop(v10);

}

void sub_1D406F970(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  const char *v17;
  const char *v18;
  id v19;
  id v20;
  const char *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, void *, void *);
  void *v27;
  id v28;
  id v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (qword_1ED0FB9A0 != -1)
    dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
  v4 = CLSLogAsset;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v31 = (uint64_t)v3;
      _os_log_error_impl(&dword_1D4054000, v4, OS_LOG_TYPE_ERROR, "Failed to fetch ORG admin user as a participant. Error: %@", buf, 0xCu);
    }
    v6 = *(_QWORD *)(a1 + 64);
    objc_msgSend_cls_createErrorWithCode_errorObject_description_(MEMORY[0x1E0CB35C8], v5, 316, *(_QWORD *)(a1 + 32), CFSTR("Failed to fetch and add users to the share"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, void *))(v6 + 16))(v6, 0, 0, 0, v7);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(void **)(a1 + 40);
      v11 = v4;
      objc_msgSend_path(v10, v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 141558274;
      v31 = 1752392040;
      v32 = 2112;
      v33 = v14;
      _os_log_impl(&dword_1D4054000, v11, OS_LOG_TYPE_DEFAULT, "About up save CKShare for asset at '%{mask.hash}@'", buf, 0x16u);

    }
    objc_msgSend_recordName(*(void **)(a1 + 48), v8, v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_alloc(MEMORY[0x1E0D10F08]);
    v7 = (void *)objc_msgSend_initWithShare_fileURL_(v16, v17, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
    objc_msgSend_setQualityOfService_(v7, v18, *(_QWORD *)(a1 + 72));
    v24 = MEMORY[0x1E0C809B0];
    v25 = 3221225472;
    v26 = sub_1D406FBC4;
    v27 = &unk_1E974A440;
    v19 = *(id *)(a1 + 64);
    v28 = v15;
    v29 = v19;
    v20 = v15;
    objc_msgSend_setShareSaveCompletionBlock_(v7, v21, (uint64_t)&v24);
    sub_1D406EB24();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addOperation_(v22, v23, (uint64_t)v7, v24, v25, v26, v27);

  }
}

void sub_1D406FBC4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  id v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (qword_1ED0FB9A0 != -1)
    dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
  v7 = CLSLogAsset;
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v7;
      objc_msgSend_description(v5, v11, v12);
      v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v19 = 136315138;
      v20 = objc_msgSend_UTF8String(v13, v14, v15);
      _os_log_impl(&dword_1D4054000, v10, OS_LOG_TYPE_DEFAULT, "Saved share '%s'", (uint8_t *)&v19, 0xCu);

    }
    objc_msgSend_recordID(v5, v8, v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(_QWORD, uint64_t, _QWORD, void *, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 3, *(_QWORD *)(a1 + 32), v16, 0);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_ERROR))
    {
      v19 = 138543362;
      v20 = (uint64_t)v6;
      _os_log_error_impl(&dword_1D4054000, v7, OS_LOG_TYPE_ERROR, "Could not save share; error: %{public}@",
        (uint8_t *)&v19,
        0xCu);
    }
    v18 = *(_QWORD *)(a1 + 40);
    objc_msgSend_cls_createErrorWithCode_errorObject_description_(MEMORY[0x1E0CB35C8], v17, 316, v6, CFSTR("Could not save the share"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, _QWORD, _QWORD, void *))(v18 + 16))(v18, 1, 0, 0, v16);
  }

}

void sub_1D406FD98(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  const char *v6;
  void *v7;
  uint64_t v8;
  const char *v9;
  id v10;
  const char *v11;
  void *v12;
  const char *v13;
  _QWORD v14[4];
  id v15;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0D10EF0]);
  v7 = (void *)objc_msgSend_initWithURL_(v5, v6, a1);
  v8 = CLSCurrentNSQualityOfService();
  objc_msgSend_setQualityOfService_(v7, v9, v8);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_1D406FE60;
  v14[3] = &unk_1E974A4B8;
  v15 = v4;
  v10 = v4;
  objc_msgSend_setRootShareCopyCompletionBlock_(v7, v11, (uint64_t)v14);
  sub_1D406EB24();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addOperation_(v12, v13, (uint64_t)v7);

}

void sub_1D406FE60(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  id v27;
  const char *v28;
  uint64_t v29;
  NSObject *v30;
  const char *v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  id v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v12 = v9;
  if (!v7)
  {
    v27 = v9;
    v24 = v27;
    if (v27 && objc_msgSend_code(v27, v28, v29) != 20)
    {
      if (qword_1ED0FB9A0 != -1)
        dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
      v30 = CLSLogAsset;
      if (os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v38 = v24;
        _os_log_error_impl(&dword_1D4054000, v30, OS_LOG_TYPE_ERROR, "BRShareCopyOperation failed with error: %{public}@", buf, 0xCu);
      }
      objc_msgSend_cls_createErrorWithCode_errorObject_description_(MEMORY[0x1E0CB35C8], v31, 316, v24, CFSTR("BRShareCopyOperation failed"));
      v32 = objc_claimAutoreleasedReturnValue();

      v24 = (id)v32;
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    goto LABEL_23;
  }
  objc_msgSend_recordID(v7, v10, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    objc_msgSend_participants(v7, v13, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v33, v39, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v34;
LABEL_5:
      v22 = 0;
      while (1)
      {
        if (*(_QWORD *)v34 != v21)
          objc_enumerationMutation(v16);
        v23 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v22);
        if ((objc_msgSend_isOrgAdminUser(v23, v18, v19) & 1) != 0)
          break;
        if (v20 == ++v22)
        {
          v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v18, (uint64_t)&v33, v39, 16);
          if (v20)
            goto LABEL_5;
          goto LABEL_11;
        }
      }
      v24 = v23;

      if (v24)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend_performSelector_(v24, v13, (uint64_t)sel_inviterID);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (v26)
          {
            (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
            goto LABEL_14;
          }
        }
      }
      goto LABEL_13;
    }
LABEL_11:

  }
  v24 = 0;
LABEL_13:
  v25 = *(_QWORD *)(a1 + 32);
  objc_msgSend_cls_createErrorWithCode_format_(MEMORY[0x1E0CB35C8], v13, 329, CFSTR("Found an invalid CKShare for asset - ownerName: %@, recordID: %@"), 0, v15);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, void *))(v25 + 16))(v25, 0, 0, 0, v26);
LABEL_14:

LABEL_23:
}

void sub_1D40701E0(void *a1, uint64_t a2, void *a3)
{
  void (**v4)(id, void *);
  const char *v5;
  uint64_t v6;
  int started;
  const char *v8;
  uint64_t v9;

  v4 = a3;
  started = objc_msgSend_startAccessingSecurityScopedResource(a1, v5, v6);
  v4[2](v4, a1);

  if (started)
    objc_msgSend_stopAccessingSecurityScopedResource(a1, v8, v9);
}

id sub_1D4070244(void *a1)
{
  id v1;
  const char *v2;
  uint64_t v3;
  const char *v4;
  char *v5;
  size_t v6;
  const char *v7;
  void *v8;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend_fileSystemRepresentation(v1, v2, v3);
  v4 = (const char *)sandbox_extension_issue_file();
  if (v4)
  {
    v5 = (char *)v4;
    v6 = strlen(v4);
    objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v7, (uint64_t)v5, v6 + 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    free(v5);
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

id sub_1D40702C8(void *a1, uint64_t a2, __int128 *a3)
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  char *v8;
  size_t v9;
  const char *v10;
  void *v11;
  __int128 v13;
  __int128 v14;

  v4 = objc_retainAutorelease(a1);
  objc_msgSend_fileSystemRepresentation(v4, v5, v6);
  v13 = *a3;
  v14 = a3[1];
  v7 = (const char *)sandbox_extension_issue_file_to_process();
  if (!v7)
    return 0;
  v8 = (char *)v7;
  v9 = strlen(v7);
  objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v10, (uint64_t)v8, v9 + 1, v13, v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  free(v8);
  return v11;
}

void sub_1D4070364()
{
  JUMPOUT(0x1D82571ECLL);
}

uint64_t sub_1D407036C(uint64_t a1, const char *a2, uint64_t a3, _QWORD *a4)
{
  int v4;
  void *v6;
  uint64_t v7;
  const char *v8;
  const char *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  const char *v23;
  void *v24;
  id v25;
  const char *v26;
  void *v27;
  const char *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  id v40;
  void *v43;
  id obj;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  id v53;
  uint64_t v54;
  _BYTE v55[128];
  _QWORD v56[3];

  v4 = a3;
  v56[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], a2, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0C99AC0];
  v56[0] = *MEMORY[0x1E0C99AC0];
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v8, (uint64_t)v56, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v11 = 4;
  else
    v11 = 5;
  v43 = v6;
  objc_msgSend_enumeratorAtURL_includingPropertiesForKeys_options_errorHandler_(v6, v9, a1, v10, v11, &unk_1E97499D0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_opt_new();
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  obj = v12;
  v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v14, (uint64_t)&v46, v55, 16);
  if (v15)
  {
    v17 = v15;
    v18 = 0;
    v19 = *(_QWORD *)v47;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v47 != v19)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v20);
        v54 = v7;
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v16, (uint64_t)&v54, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = 0;
        objc_msgSend_resourceValuesForKeys_error_(v21, v23, (uint64_t)v22, &v45);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v45;

        if (v25)
        {
          if (qword_1ED0FB9A0 != -1)
            dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
          v27 = (void *)CLSLogDefault;
          if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR))
          {
            v33 = v27;
            objc_msgSend_path(v21, v34, v35);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v51 = v36;
            v52 = 2112;
            v53 = v25;
            _os_log_error_impl(&dword_1D4054000, v33, OS_LOG_TYPE_ERROR, "Error occurred when getting file size of: '%@', error: '%@", buf, 0x16u);

          }
          objc_msgSend_addObject_(v13, v28, (uint64_t)v25);
        }
        else
        {
          objc_msgSend_objectForKeyedSubscript_(v24, v26, v7);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend_integerValue(v29, v30, v31);

          v18 += v32;
        }

        ++v20;
      }
      while (v17 != v20);
      v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v16, (uint64_t)&v46, v55, 16);
    }
    while (v17);
  }
  else
  {
    v18 = 0;
  }

  if (objc_msgSend_count(v13, v37, v38))
  {
    objc_msgSend_cls_createErrorWithCode_successfulObjects_underlyingErrors_description_(MEMORY[0x1E0CB35C8], v39, 9, MEMORY[0x1E0C9AA60], v13, CFSTR("Failed to delete some items"));
    v40 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    if (a4)
      *a4 = v40;

  }
  else if (a4)
  {
    *a4 = 0;
  }

  return v18;
}

uint64_t sub_1D40706AC(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  if (qword_1ED0FB9A0 != -1)
    dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
  v6 = (void *)CLSLogDefault;
  if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR))
  {
    v8 = v6;
    objc_msgSend_path(v4, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412546;
    v13 = v11;
    v14 = 2112;
    v15 = v5;
    _os_log_error_impl(&dword_1D4054000, v8, OS_LOG_TYPE_ERROR, "Error occurred when getting file size of: '%@', error: '%@", (uint8_t *)&v12, 0x16u);

  }
  return 1;
}

id sub_1D40707C8(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  void *v6;
  const char *v7;
  void *v8;
  void *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  char v18;
  const char *v19;
  uint64_t v20;
  id v21;
  void *v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  void *v27;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _QWORD v35[3];

  v35[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = *MEMORY[0x1E0C99AC0];
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v5, (uint64_t)v35, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_enumeratorAtURL_includingPropertiesForKeys_options_errorHandler_(v4, v7, a1, v6, 1, &unk_1E974A4F8);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_opt_new();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v10 = v8;
  v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v30, v34, 16);
  if (v12)
  {
    v14 = v12;
    v15 = *(_QWORD *)v31;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v31 != v15)
          objc_enumerationMutation(v10);
        v17 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v16);
        v29 = 0;
        v18 = objc_msgSend_removeItemAtURL_error_(v4, v13, (uint64_t)v17, &v29);
        v21 = v29;
        if ((v18 & 1) == 0)
        {
          objc_msgSend_path(v17, v19, v20);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          NSLog(CFSTR("Failed to remove item at url: '%@', error:'%@'"), v22, v21);

          if (v21)
            objc_msgSend_addObject_(v9, v23, (uint64_t)v21);
        }

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v30, v34, 16);
    }
    while (v14);
  }

  if (objc_msgSend_count(v9, v24, v25))
  {
    objc_msgSend_cls_createErrorWithCode_successfulObjects_underlyingErrors_description_(MEMORY[0x1E0CB35C8], v26, 9, MEMORY[0x1E0C9AA60], v9, CFSTR("Failed to delete some items"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

uint64_t sub_1D40709E8(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  if (qword_1ED0FB9A0 != -1)
    dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
  v6 = (void *)CLSLogDefault;
  if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR))
  {
    v8 = v6;
    objc_msgSend_path(v4, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412546;
    v13 = v11;
    v14 = 2112;
    v15 = v5;
    _os_log_error_impl(&dword_1D4054000, v8, OS_LOG_TYPE_ERROR, "Error occurred when enumerating: '%@', error: '%@", (uint8_t *)&v12, 0x16u);

  }
  return 1;
}

void sub_1D4070B04()
{
  uint64_t v0;
  void *v1;
  const char *v2;
  uint64_t v3;
  const char *v4;
  CLSNSOperationsManager *v5;
  void *v6;

  v0 = objc_opt_new();
  v1 = (void *)qword_1ED0FB458;
  qword_1ED0FB458 = v0;

  objc_msgSend_setName_((void *)qword_1ED0FB458, v2, (uint64_t)CFSTR("CLSNSOperationsManagerQueue"));
  v3 = CLSCurrentNSQualityOfService();
  objc_msgSend_setQualityOfService_((void *)qword_1ED0FB458, v4, v3);
  v5 = objc_alloc_init(CLSNSOperationsManager);
  v6 = (void *)qword_1ED0FB450;
  qword_1ED0FB450 = (uint64_t)v5;

}

void sub_1D40726C4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  CLSChildParentRelation *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  objc_super v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v15.receiver = *(id *)(a1 + 32);
  v15.super_class = (Class)&OBJC_METACLASS___CLSSchedule;
  objc_msgSendSuper2(&v15, sel_relations);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED0FB468;
  qword_1ED0FB468 = v2;

  v4 = [CLSChildParentRelation alloc];
  v5 = *(_QWORD *)(a1 + 32);
  v6 = objc_opt_class();
  v8 = (void *)objc_msgSend_initWithChildEntity_parentEntity_faultable_(v4, v7, v5, v6, 1);
  v9 = (void *)qword_1ED0FB468;
  v16[0] = v8;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v10, (uint64_t)v16, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setByAddingObjectsFromArray_(v9, v12, (uint64_t)v11);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)qword_1ED0FB468;
  qword_1ED0FB468 = v13;

}

uint64_t CLSCurrentNSQualityOfService()
{
  qos_class_t v0;

  v0 = qos_class_self();
  if ((int)v0 > 20)
  {
    switch(v0)
    {
      case QOS_CLASS_DEFAULT:
        return -1;
      case QOS_CLASS_USER_INTERACTIVE:
        return 33;
      case QOS_CLASS_USER_INITIATED:
        return 25;
      default:
        return 17;
    }
  }
  else
  {
    if (v0 != QOS_CLASS_BACKGROUND)
      return 17;
    return 9;
  }
}

void sub_1D4072EE8(uint64_t a1, const char *a2, uint64_t a3)
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  int isCancelled;
  const char *v28;
  void *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  int v39;
  const char *v40;
  _BYTE v41[12];
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  const char *v47;
  __int16 v48;
  const char *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  objc_msgSend_lock(*(void **)(a1 + 32), a2, a3);
  v4 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  if (qword_1ED0FB9A0 != -1)
    dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
  v5 = (void *)CLSLogDefault;
  if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 48);
    v8 = v5;
    *(_DWORD *)v41 = 134218240;
    *(_QWORD *)&v41[4] = v7;
    v42 = 2048;
    v43 = objc_msgSend_count(v4, v9, v10);
    _os_log_impl(&dword_1D4054000, v8, OS_LOG_TYPE_DEFAULT, "CLSNSOperationsManager: Checking after %f seconds timeout. [Pending count: %lu].", v41, 0x16u);

  }
  if (objc_msgSend_containsObject_(v4, v6, *(_QWORD *)(a1 + 40)))
  {
    objc_msgSend_cancel(*(void **)(a1 + 40), v11, v12);
    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v13 = (void *)CLSLogDefault;
    if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR))
    {
      v16 = *(void **)(a1 + 40);
      v17 = *(_QWORD *)(a1 + 48);
      v18 = v13;
      if (objc_msgSend_isExecuting(v16, v19, v20))
        v23 = "YES";
      else
        v23 = "NO";
      if (objc_msgSend_isFinished(*(void **)(a1 + 40), v21, v22))
        v26 = "YES";
      else
        v26 = "NO";
      isCancelled = objc_msgSend_isCancelled(*(void **)(a1 + 40), v24, v25);
      *(_DWORD *)v41 = 134219010;
      if (isCancelled)
        v28 = "YES";
      else
        v28 = "NO";
      *(_QWORD *)&v41[4] = v17;
      v42 = 2112;
      v43 = (uint64_t)v16;
      v44 = 2080;
      v45 = v23;
      v46 = 2080;
      v47 = v26;
      v48 = 2080;
      v49 = v28;
      _os_log_error_impl(&dword_1D4054000, v18, OS_LOG_TYPE_ERROR, "CLSNSOperationsManager: Cancelled operation because it did not finish in %f seconds. Operation: %@ [executing: %s, finished: %s, cancelled: %s]", v41, 0x34u);
LABEL_32:

    }
  }
  else
  {
    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v29 = (void *)CLSLogDefault;
    if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      v30 = *(void **)(a1 + 40);
      v18 = v29;
      if (objc_msgSend_isExecuting(v30, v31, v32))
        v35 = "YES";
      else
        v35 = "NO";
      if (objc_msgSend_isFinished(*(void **)(a1 + 40), v33, v34))
        v38 = "YES";
      else
        v38 = "NO";
      v39 = objc_msgSend_isCancelled(*(void **)(a1 + 40), v36, v37);
      *(_DWORD *)v41 = 138413058;
      if (v39)
        v40 = "YES";
      else
        v40 = "NO";
      *(_QWORD *)&v41[4] = v30;
      v42 = 2080;
      v43 = (uint64_t)v35;
      v44 = 2080;
      v45 = v38;
      v46 = 2080;
      v47 = v40;
      _os_log_impl(&dword_1D4054000, v18, OS_LOG_TYPE_DEFAULT, "CLSNSOperationsManager: Operation not pending. Operation: %@ [executing: %s, finished: %s, cancelled: %s]", v41, 0x2Au);
      goto LABEL_32;
    }
  }
  objc_msgSend_unlock(*(void **)(a1 + 32), v14, v15, *(_QWORD *)v41);

}

void sub_1D4073CF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1D4073D0C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1D4073D1C(uint64_t a1)
{

}

void sub_1D4073D24(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  _QWORD v12[5];
  _QWORD v13[4];
  id v14;

  objc_msgSend_dataStore(*(void **)(a1 + 32), a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_1D4073E04;
  v13[3] = &unk_1E974A630;
  v14 = v4;
  v7 = v4;
  objc_msgSend_enumerate_(v6, v8, (uint64_t)v13);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = 0;

  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = sub_1D4073E64;
  v12[3] = &unk_1E974A658;
  v12[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend_pruneDeletedObjectsWithCompletion_(v7, v11, (uint64_t)v12);

}

void sub_1D4073E04(uint64_t a1, void *a2)
{
  const char *v3;
  id v4;
  id v5;

  v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = (id)objc_msgSend_addObject_(*(void **)(a1 + 32), v3, (uint64_t)v5);

}

uint64_t sub_1D4073E64(uint64_t a1, const char *a2)
{
  return objc_msgSend__notifyOfCompletionWithError_(*(void **)(a1 + 32), a2, 0);
}

uint64_t sub_1D407428C(uint64_t a1, const char *a2)
{
  objc_msgSend_setExecuting_(*(void **)(a1 + 32), a2, 0);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void sub_1D4074480(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  CLSChildParentRelation *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  CLSRelation *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  objc_super v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v20.receiver = *(id *)(a1 + 32);
  v20.super_class = (Class)&OBJC_METACLASS___CLSHandoutRecipient;
  objc_msgSendSuper2(&v20, sel_relations);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED0FB478;
  qword_1ED0FB478 = v2;

  v4 = [CLSChildParentRelation alloc];
  v5 = *(_QWORD *)(a1 + 32);
  v6 = objc_opt_class();
  v8 = (void *)objc_msgSend_initWithChildEntity_parentEntity_faultable_(v4, v7, v5, v6, 1);
  v9 = [CLSRelation alloc];
  v10 = *(_QWORD *)(a1 + 32);
  v11 = objc_opt_class();
  v13 = (void *)objc_msgSend_initWithFromEntity_toEntity_onFromKey_toKey_faultable_(v9, v12, v10, v11, CFSTR("classID"), CFSTR("objectID"), 1);
  v14 = (void *)qword_1ED0FB478;
  v21[0] = v8;
  v21[1] = v13;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v15, (uint64_t)v21, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setByAddingObjectsFromArray_(v14, v17, (uint64_t)v16);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)qword_1ED0FB478;
  qword_1ED0FB478 = v18;

}

void sub_1D4077374()
{
  void *v0;
  const char *v1;
  void *v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  v15 = objc_opt_class();
  v16 = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v1, (uint64_t)&v6, 11);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v0, v3, (uint64_t)v2, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)qword_1ED0FB488;
  qword_1ED0FB488 = v4;

}

id CLSContextClasses()
{
  if (qword_1ED0FB4A0 != -1)
    dispatch_once(&qword_1ED0FB4A0, &unk_1E974A6C8);
  return (id)qword_1ED0FB498;
}

void sub_1D40774F8()
{
  void *v0;
  const char *v1;
  void *v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v1, (uint64_t)&v6, 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v0, v3, (uint64_t)v2, v6, v7);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)qword_1ED0FB498;
  qword_1ED0FB498 = v4;

}

void sub_1D40775BC()
{
  void *v0;
  const char *v1;
  void *v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[9];

  v6[8] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v6[0] = objc_opt_class();
  v6[1] = objc_opt_class();
  v6[2] = objc_opt_class();
  v6[3] = objc_opt_class();
  v6[4] = objc_opt_class();
  v6[5] = objc_opt_class();
  v6[6] = objc_opt_class();
  v6[7] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v1, (uint64_t)v6, 8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v0, v3, (uint64_t)v2);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)qword_1ED0FB4A8;
  qword_1ED0FB4A8 = v4;

}

void sub_1D40776D0()
{
  void *v0;
  const char *v1;
  void *v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  v15 = objc_opt_class();
  v16 = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v1, (uint64_t)&v6, 11);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v0, v3, (uint64_t)v2, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)qword_1ED0FB4B8;
  qword_1ED0FB4B8 = v4;

}

void sub_1D4077814()
{
  void *v0;
  const char *v1;
  void *v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v1, (uint64_t)&v6, 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v0, v3, (uint64_t)v2, v6, v7);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)qword_1ED0FB4C8;
  qword_1ED0FB4C8 = v4;

}

void sub_1D40778D8()
{
  void *v0;
  const char *v1;
  void *v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v1, (uint64_t)&v6, 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v0, v3, (uint64_t)v2, v6, v7);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)qword_1ED0FB4D8;
  qword_1ED0FB4D8 = v4;

}

void sub_1D407799C()
{
  void *v0;
  const char *v1;
  void *v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[9];

  v6[8] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v6[0] = objc_opt_class();
  v6[1] = objc_opt_class();
  v6[2] = objc_opt_class();
  v6[3] = objc_opt_class();
  v6[4] = objc_opt_class();
  v6[5] = objc_opt_class();
  v6[6] = objc_opt_class();
  v6[7] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v1, (uint64_t)v6, 8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v0, v3, (uint64_t)v2);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)qword_1ED0FB4E8;
  qword_1ED0FB4E8 = v4;

}

void sub_1D4077AB0()
{
  void *v0;
  const char *v1;
  void *v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v1, (uint64_t)&v6, 5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v0, v3, (uint64_t)v2, v6, v7, v8, v9);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)qword_1ED0FB4F8;
  qword_1ED0FB4F8 = v4;

}

void sub_1D4077B94()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v16 = (void *)MEMORY[0x1E0C99E60];
  CLSHandoutClasses();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  CLSRosterClasses();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  CLSReportClasses();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  CLSSearchClasses();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CLSCollaborationStateClasses();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CLSArchivedHandoutClasses();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CLSOnboardingClasses();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99E60];
  v17[0] = objc_opt_class();
  v17[1] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v8, (uint64_t)v17, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v7, v10, (uint64_t)v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  CLSSurveyClasses();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithUnionOfSets_(v16, v13, (uint64_t)v0, v1, v2, v3, v4, v5, v6, v11, v12, 0);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)qword_1ED0FB508;
  qword_1ED0FB508 = v14;

}

void sub_1D4077D1C()
{
  void *v0;
  const char *v1;
  void *v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v1, (uint64_t)&v6, 7);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v0, v3, (uint64_t)v2, v6, v7, v8, v9, v10, v11);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)qword_1ED0FB518;
  qword_1ED0FB518 = v4;

}

void sub_1D4077E20()
{
  void *v0;
  const char *v1;
  void *v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v1, (uint64_t)&v6, 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v0, v3, (uint64_t)v2, v6, v7);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)qword_1ED0FB528;
  qword_1ED0FB528 = v4;

}

void sub_1D4077EE4()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  const char *v4;
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  CLSProgressClasses();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  CLSHandoutClasses();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E60];
  v11[0] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v4, (uint64_t)v11, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v3, v6, (uint64_t)v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithUnionOfSets_(v0, v8, (uint64_t)v1, v2, v7, 0);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)qword_1ED0FB538;
  qword_1ED0FB538 = v9;

}

id CLSQueriableWithoutValidUserClasses()
{
  if (qword_1ED0FB550 != -1)
    dispatch_once(&qword_1ED0FB550, &unk_1E974A768);
  return (id)qword_1ED0FB548;
}

void sub_1D407801C()
{
  void *v0;
  void *v1;
  void *v2;
  const char *v3;
  void *v4;
  const char *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  CLSOnboardingClasses();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x1E0C99E60];
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v3, (uint64_t)&v10, 5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v2, v5, (uint64_t)v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithUnionOfSets_(v0, v7, (uint64_t)v1, v6, 0, v10, v11, v12, v13);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)qword_1ED0FB548;
  qword_1ED0FB548 = v8;

}

void sub_1D4078138()
{
  const char *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  CLSServerInterfaceConfigurator *v4;

  v4 = objc_alloc_init(CLSServerInterfaceConfigurator);
  objc_msgSend_configureServerInterface(v4, v0, v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED0FB558;
  qword_1ED0FB558 = v2;

}

void sub_1D40785C8(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  CLSChildParentRelation *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  CLSParentChildRelation *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  CLSParentChildRelation *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  void *v18;
  CLSParentChildRelation *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  void *v23;
  CLSParentChildRelation *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  void *v28;
  void *v29;
  const char *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  objc_super v35;
  _QWORD v36[6];

  v36[5] = *MEMORY[0x1E0C80C00];
  v35.receiver = *(id *)(a1 + 32);
  v35.super_class = (Class)&OBJC_METACLASS___CLSHandoutAttachment;
  objc_msgSendSuper2(&v35, sel_relations);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED0FB568;
  qword_1ED0FB568 = v2;

  v4 = [CLSChildParentRelation alloc];
  v5 = *(_QWORD *)(a1 + 32);
  v6 = objc_opt_class();
  v8 = (void *)objc_msgSend_initWithChildEntity_parentEntity_faultable_(v4, v7, v5, v6, 1);
  v9 = [CLSParentChildRelation alloc];
  v10 = *(_QWORD *)(a1 + 32);
  v11 = objc_opt_class();
  v13 = (void *)objc_msgSend_initWithParentEntity_childEntity_faultable_(v9, v12, v10, v11, 1);
  v14 = [CLSParentChildRelation alloc];
  v15 = *(_QWORD *)(a1 + 32);
  v16 = objc_opt_class();
  v18 = (void *)objc_msgSend_initWithParentEntity_childEntity_faultable_(v14, v17, v15, v16, 1);
  v19 = [CLSParentChildRelation alloc];
  v20 = *(_QWORD *)(a1 + 32);
  v21 = objc_opt_class();
  v23 = (void *)objc_msgSend_initWithParentEntity_childEntity_faultable_(v19, v22, v20, v21, 0);
  v24 = [CLSParentChildRelation alloc];
  v25 = *(_QWORD *)(a1 + 32);
  v26 = objc_opt_class();
  v28 = (void *)objc_msgSend_initWithParentEntity_childEntity_faultable_(v24, v27, v25, v26, 1);
  v29 = (void *)qword_1ED0FB568;
  v36[0] = v8;
  v36[1] = v13;
  v36[2] = v18;
  v36[3] = v23;
  v36[4] = v28;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v30, (uint64_t)v36, 5);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setByAddingObjectsFromArray_(v29, v32, (uint64_t)v31);
  v33 = objc_claimAutoreleasedReturnValue();
  v34 = (void *)qword_1ED0FB568;
  qword_1ED0FB568 = v33;

}

__CFString *sub_1D4078D30(unint64_t a1)
{
  if (a1 > 4)
    return 0;
  else
    return off_1E974A7B8[a1];
}

void sub_1D4078EDC(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  CLSChildParentRelation *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  objc_super v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v15.receiver = *(id *)(a1 + 32);
  v15.super_class = (Class)&OBJC_METACLASS___CLSCollectionItem;
  objc_msgSendSuper2(&v15, sel_relations);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED0FB578;
  qword_1ED0FB578 = v2;

  v4 = [CLSChildParentRelation alloc];
  v5 = *(_QWORD *)(a1 + 32);
  v6 = objc_opt_class();
  v8 = (void *)objc_msgSend_initWithChildEntity_parentEntity_faultable_(v4, v7, v5, v6, 1);
  v9 = (void *)qword_1ED0FB578;
  v16[0] = v8;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v10, (uint64_t)v16, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setByAddingObjectsFromArray_(v9, v12, (uint64_t)v11);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)qword_1ED0FB578;
  qword_1ED0FB578 = v13;

}

void sub_1D407905C(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  CLSChildParentRelation *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  CLSParentChildRelation *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  CLSParentChildRelation *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  void *v18;
  CLSParentChildRelation *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  void *v23;
  CLSParentChildRelation *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  void *v28;
  void *v29;
  const char *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  objc_super v35;
  _QWORD v36[6];

  v36[5] = *MEMORY[0x1E0C80C00];
  v35.receiver = *(id *)(a1 + 32);
  v35.super_class = (Class)&OBJC_METACLASS___CLSArchivedQuestionStep;
  objc_msgSendSuper2(&v35, sel_relations);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED0FB588;
  qword_1ED0FB588 = v2;

  v4 = [CLSChildParentRelation alloc];
  v5 = *(_QWORD *)(a1 + 32);
  v6 = objc_opt_class();
  v8 = (void *)objc_msgSend_initWithChildEntity_parentEntity_faultable_(v4, v7, v5, v6, 1);
  v9 = [CLSParentChildRelation alloc];
  v10 = *(_QWORD *)(a1 + 32);
  v11 = objc_opt_class();
  v13 = (void *)objc_msgSend_initWithParentEntity_childEntity_faultable_(v9, v12, v10, v11, 1);
  v14 = [CLSParentChildRelation alloc];
  v15 = *(_QWORD *)(a1 + 32);
  v16 = objc_opt_class();
  v18 = (void *)objc_msgSend_initWithParentEntity_childEntity_faultable_(v14, v17, v15, v16, 1);
  v19 = [CLSParentChildRelation alloc];
  v20 = *(_QWORD *)(a1 + 32);
  v21 = objc_opt_class();
  v23 = (void *)objc_msgSend_initWithParentEntity_childEntity_faultable_(v19, v22, v20, v21, 1);
  v24 = [CLSParentChildRelation alloc];
  v25 = *(_QWORD *)(a1 + 32);
  v26 = objc_opt_class();
  v28 = (void *)objc_msgSend_initWithParentEntity_childEntity_faultable_(v24, v27, v25, v26, 1);
  v29 = (void *)qword_1ED0FB588;
  v36[0] = v8;
  v36[1] = v13;
  v36[2] = v18;
  v36[3] = v23;
  v36[4] = v28;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v30, (uint64_t)v36, 5);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setByAddingObjectsFromArray_(v29, v32, (uint64_t)v31);
  v33 = objc_claimAutoreleasedReturnValue();
  v34 = (void *)qword_1ED0FB588;
  qword_1ED0FB588 = v33;

}

void sub_1D40792D8(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  CLSChildParentRelation *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  CLSParentChildRelation *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  objc_super v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v20.receiver = *(id *)(a1 + 32);
  v20.super_class = (Class)&OBJC_METACLASS___CLSSurvey;
  objc_msgSendSuper2(&v20, sel_relations);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED0FB598;
  qword_1ED0FB598 = v2;

  v4 = [CLSChildParentRelation alloc];
  v5 = *(_QWORD *)(a1 + 32);
  v6 = objc_opt_class();
  v8 = (void *)objc_msgSend_initWithChildEntity_parentEntity_faultable_(v4, v7, v5, v6, 1);
  v9 = [CLSParentChildRelation alloc];
  v10 = *(_QWORD *)(a1 + 32);
  v11 = objc_opt_class();
  v13 = (void *)objc_msgSend_initWithParentEntity_childEntity_faultable_(v9, v12, v10, v11, 1);
  v14 = (void *)qword_1ED0FB598;
  v21[0] = v8;
  v21[1] = v13;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v15, (uint64_t)v21, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setByAddingObjectsFromArray_(v14, v17, (uint64_t)v16);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)qword_1ED0FB598;
  qword_1ED0FB598 = v18;

}

void sub_1D407949C(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  CLSChildParentRelation *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  objc_super v12;

  v12.receiver = *(id *)(a1 + 32);
  v12.super_class = (Class)&OBJC_METACLASS___CLSActivityItem;
  objc_msgSendSuper2(&v12, sel_relations);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED0FB5A8;
  qword_1ED0FB5A8 = v2;

  v4 = [CLSChildParentRelation alloc];
  v5 = *(_QWORD *)(a1 + 32);
  v6 = objc_opt_class();
  v8 = (void *)objc_msgSend_initWithChildEntity_parentEntity_faultable_(v4, v7, v5, v6, 1);
  objc_msgSend_setByAddingObject_((void *)qword_1ED0FB5A8, v9, (uint64_t)v8);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)qword_1ED0FB5A8;
  qword_1ED0FB5A8 = v10;

}

BOOL sub_1D4079554(void *a1, const char *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;
  _BOOL8 v11;

  objc_msgSend_activityType(a1, a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isEqualToString_(v4, v5, (uint64_t)CFSTR("com.apple.ClassKit.Context")))
  {
    objc_msgSend_userInfo(a1, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v8, v9, (uint64_t)CFSTR("CLSUserActivityItemIdentifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10 != 0;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

id sub_1D40795DC(void *a1, const char *a2, uint64_t a3)
{
  void *v3;
  const char *v4;
  void *v5;

  objc_msgSend_userInfo(a1, a2, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v3, v4, (uint64_t)CFSTR("CLSUserActivityItemIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void sub_1D4079EE8(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  CLSChildParentRelation *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  objc_super v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v15.receiver = *(id *)(a1 + 32);
  v15.super_class = (Class)&OBJC_METACLASS___CLSBlob;
  objc_msgSendSuper2(&v15, sel_relations);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED0FB5B8;
  qword_1ED0FB5B8 = v2;

  v4 = [CLSChildParentRelation alloc];
  v5 = *(_QWORD *)(a1 + 32);
  v6 = objc_opt_class();
  v8 = (void *)objc_msgSend_initWithChildEntity_parentEntity_faultable_(v4, v7, v5, v6, 1);
  v9 = (void *)qword_1ED0FB5B8;
  v16[0] = v8;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v10, (uint64_t)v16, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setByAddingObjectsFromArray_(v9, v12, (uint64_t)v11);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)qword_1ED0FB5B8;
  qword_1ED0FB5B8 = v13;

}

id sub_1D407A318(void *a1, const char *a2)
{
  void *v2;
  const char *v3;
  void *v4;

  objc_msgSend_dataUsingEncoding_(a1, a2, 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_hashData_lastHash_(CLSUtil, v3, (uint64_t)v2, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t sub_1D407A364(void *a1, const char *a2, uint64_t a3)
{
  const char *v4;
  uint64_t v5;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  BOOL v16;

  if ((unint64_t)objc_msgSend_length(a1, a2, a3) <= 0x60)
    return objc_msgSend_hash(a1, v4, v5);
  v7 = objc_msgSend_length(a1, v4, v5);
  if (v7 < 1)
    return 0;
  v9 = v7;
  v10 = 0;
  v11 = 0;
  do
  {
    if (v9 >= 96)
    {
      v12 = 96;
      objc_msgSend_substringWithRange_(a1, v8, v11, 96);
    }
    else
    {
      v12 = v9;
      objc_msgSend_substringWithRange_(a1, v8, v11, v9);
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10 ^= objc_msgSend_hash(v13, v14, v15);

    v11 += v12;
    v16 = v9 <= v12;
    v9 -= v12;
  }
  while (!v16);
  return v10;
}

BOOL sub_1D407A424(void *a1, const char *a2, uint64_t a3)
{
  return objc_msgSend_rangeOfCharacterFromSet_(a1, a2, a3) != 0x7FFFFFFFFFFFFFFFLL;
}

id sub_1D407A444()
{
  if (qword_1ED0FB5D0 != -1)
    dispatch_once(&qword_1ED0FB5D0, &unk_1E9749A30);
  return (id)qword_1ED0FB5C8;
}

void sub_1D407A484(uint64_t a1, const char *a2)
{
  uint64_t v2;
  void *v3;

  objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E0CB3500], a2, (uint64_t)CFSTR(" -'’"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED0FB5C8;
  qword_1ED0FB5C8 = v2;

}

id sub_1D407A4B8(void *a1)
{
  void *v2;
  const char *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  const char *v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;

  v2 = (void *)objc_opt_new();
  if ((objc_msgSend_containsString_(a1, v3, (uint64_t)CFSTR("@")) & 1) == 0)
  {
    objc_msgSend_cls_TokenSeparators(MEMORY[0x1E0CB3940], v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_componentsSeparatedByCharactersInSet_(a1, v7, (uint64_t)v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObjectsFromArray_(v2, v9, (uint64_t)v8);

    objc_msgSend_objectsPassingTest_(v2, v10, (uint64_t)&unk_1E974A800);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_intersectSet_(v2, v12, (uint64_t)v11);

  }
  objc_msgSend_addObject_(v2, v4, (uint64_t)a1);
  objc_msgSend_allObjects(v2, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

uint64_t sub_1D407A588(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;

  v2 = (void *)MEMORY[0x1E0CB3500];
  v3 = a2;
  objc_msgSend_alphanumericCharacterSet(v2, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend__cls_containsCharacterInSet_(v3, v7, (uint64_t)v6);

  return v8;
}

void sub_1D407A658(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  CLSChildParentRelation *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  CLSParentChildRelation *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  objc_super v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v20.receiver = *(id *)(a1 + 32);
  v20.super_class = (Class)&OBJC_METACLASS___CLSArchivedMultipleChoiceAnswerFormat;
  objc_msgSendSuper2(&v20, sel_relations);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED0FB5D8;
  qword_1ED0FB5D8 = v2;

  v4 = [CLSChildParentRelation alloc];
  v5 = *(_QWORD *)(a1 + 32);
  v6 = objc_opt_class();
  v8 = (void *)objc_msgSend_initWithChildEntity_parentEntity_faultable_(v4, v7, v5, v6, 1);
  v9 = [CLSParentChildRelation alloc];
  v10 = *(_QWORD *)(a1 + 32);
  v11 = objc_opt_class();
  v13 = (void *)objc_msgSend_initWithParentEntity_childEntity_faultable_(v9, v12, v10, v11, 1);
  v14 = (void *)qword_1ED0FB5D8;
  v21[0] = v8;
  v21[1] = v13;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v15, (uint64_t)v21, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setByAddingObjectsFromArray_(v14, v17, (uint64_t)v16);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)qword_1ED0FB5D8;
  qword_1ED0FB5D8 = v18;

}

__CFString *NSStringFromSurveyType(uint64_t a1, const char *a2)
{
  __CFString *v2;

  if (a1 == 1)
  {
    v2 = CFSTR("ExitTicket");
  }
  else
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("Unknown survey type: '%ld'"), a1);
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

uint64_t CLSSurveyTypeFromString(void *a1)
{
  id v1;
  const char *v2;
  void *v3;
  uint64_t v5;
  const char *v6;
  id v7;

  v1 = a1;
  v3 = v1;
  if (!v1 || !objc_msgSend_isEqualToString_(v1, v2, (uint64_t)CFSTR("ExitTicket")))
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v2, (uint64_t)CFSTR("Unknown survey type: '%@'"), v3);
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E0C99DA0], v6, *MEMORY[0x1E0C99778], v5, 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v7);
  }

  return 1;
}

void sub_1D407CDF4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  CLSChildParentRelation *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  CLSChildParentRelation *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  CLSParentChildRelation *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  void *v18;
  CLSParentChildRelation *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  void *v23;
  CLSParentChildRelation *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  void *v28;
  CLSParentChildRelation *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  void *v33;
  CLSParentChildRelation *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  void *v38;
  void *v39;
  const char *v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  objc_super v45;
  _QWORD v46[8];

  v46[7] = *MEMORY[0x1E0C80C00];
  v45.receiver = *(id *)(a1 + 32);
  v45.super_class = (Class)&OBJC_METACLASS___CLSActivity;
  objc_msgSendSuper2(&v45, sel_relations);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED0FB5E8;
  qword_1ED0FB5E8 = v2;

  v4 = [CLSChildParentRelation alloc];
  v5 = *(_QWORD *)(a1 + 32);
  v6 = objc_opt_class();
  v8 = (void *)objc_msgSend_initWithChildEntity_parentEntity_faultable_(v4, v7, v5, v6, 1);
  v9 = [CLSChildParentRelation alloc];
  v10 = *(_QWORD *)(a1 + 32);
  v11 = objc_opt_class();
  v13 = (void *)objc_msgSend_initWithChildEntity_parentEntity_faultable_(v9, v12, v10, v11, 1);
  v14 = [CLSParentChildRelation alloc];
  v15 = *(_QWORD *)(a1 + 32);
  v16 = objc_opt_class();
  v18 = (void *)objc_msgSend_initWithParentEntity_childEntity_faultable_(v14, v17, v15, v16, 1);
  v19 = [CLSParentChildRelation alloc];
  v20 = *(_QWORD *)(a1 + 32);
  v21 = objc_opt_class();
  v23 = (void *)objc_msgSend_initWithParentEntity_childEntity_faultable_(v19, v22, v20, v21, 1);
  v24 = [CLSParentChildRelation alloc];
  v25 = *(_QWORD *)(a1 + 32);
  v26 = objc_opt_class();
  v28 = (void *)objc_msgSend_initWithParentEntity_childEntity_faultable_(v24, v27, v25, v26, 1);
  v29 = [CLSParentChildRelation alloc];
  v30 = *(_QWORD *)(a1 + 32);
  v31 = objc_opt_class();
  v33 = (void *)objc_msgSend_initWithParentEntity_childEntity_faultable_(v29, v32, v30, v31, 1);
  v34 = [CLSParentChildRelation alloc];
  v35 = *(_QWORD *)(a1 + 32);
  v36 = objc_opt_class();
  v38 = (void *)objc_msgSend_initWithParentEntity_childEntity_faultable_(v34, v37, v35, v36, 1);
  v39 = (void *)qword_1ED0FB5E8;
  v46[0] = v8;
  v46[1] = v13;
  v46[2] = v18;
  v46[3] = v23;
  v46[4] = v28;
  v46[5] = v33;
  v46[6] = v38;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v40, (uint64_t)v46, 7);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setByAddingObjectsFromArray_(v39, v42, (uint64_t)v41);
  v43 = objc_claimAutoreleasedReturnValue();
  v44 = (void *)qword_1ED0FB5E8;
  qword_1ED0FB5E8 = v43;

}

__CFString *NSStringFromCLSMultipleChoiceType(uint64_t a1, const char *a2)
{
  __CFString *v3;
  __CFString *result;

  v3 = CFSTR("Custom");
  switch(a1)
  {
    case 0:
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("Unknown multiple choice type: '%ld'"), 0);
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    case 2:
      result = CFSTR("SmileyFace");
      break;
    case 3:
      result = CFSTR("Star");
      break;
    case 4:
      result = CFSTR("ThumbsUpDown");
      break;
    default:
LABEL_3:
      result = v3;
      break;
  }
  return result;
}

uint64_t CLSMultipleChoiceTypeFromString(void *a1)
{
  id v1;
  const char *v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  uint64_t v9;
  const char *v10;
  id v11;

  v1 = a1;
  v3 = v1;
  if (!v1)
    goto LABEL_11;
  if ((objc_msgSend_isEqualToString_(v1, v2, (uint64_t)CFSTR("Custom")) & 1) == 0)
  {
    if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("SmileyFace")) & 1) != 0)
    {
      v5 = 2;
      goto LABEL_10;
    }
    if ((objc_msgSend_isEqualToString_(v3, v6, (uint64_t)CFSTR("Star")) & 1) != 0)
    {
      v5 = 3;
      goto LABEL_10;
    }
    if ((objc_msgSend_isEqualToString_(v3, v7, (uint64_t)CFSTR("ThumbsUpDown")) & 1) != 0)
    {
      v5 = 4;
      goto LABEL_10;
    }
LABEL_11:
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v2, (uint64_t)CFSTR("Unknown multiple choice type: '%@'"), v3);
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E0C99DA0], v10, *MEMORY[0x1E0C99778], v9, 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v11);
  }
  v5 = 1;
LABEL_10:

  return v5;
}

void sub_1D407E508(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  CLSChildParentRelation *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  CLSParentChildRelation *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  CLSParentChildRelation *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  void *v18;
  CLSParentChildRelation *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  void *v23;
  CLSParentChildRelation *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  void *v28;
  CLSParentChildRelation *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  void *v33;
  void *v34;
  const char *v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  objc_super v40;
  _QWORD v41[7];

  v41[6] = *MEMORY[0x1E0C80C00];
  v40.receiver = *(id *)(a1 + 32);
  v40.super_class = (Class)&OBJC_METACLASS___CLSQuestionStep;
  objc_msgSendSuper2(&v40, sel_relations);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED0FB5F8;
  qword_1ED0FB5F8 = v2;

  v4 = [CLSChildParentRelation alloc];
  v5 = *(_QWORD *)(a1 + 32);
  v6 = objc_opt_class();
  v8 = (void *)objc_msgSend_initWithChildEntity_parentEntity_faultable_(v4, v7, v5, v6, 1);
  v9 = [CLSParentChildRelation alloc];
  v10 = *(_QWORD *)(a1 + 32);
  v11 = objc_opt_class();
  v13 = (void *)objc_msgSend_initWithParentEntity_childEntity_faultable_(v9, v12, v10, v11, 1);
  v14 = [CLSParentChildRelation alloc];
  v15 = *(_QWORD *)(a1 + 32);
  v16 = objc_opt_class();
  v18 = (void *)objc_msgSend_initWithParentEntity_childEntity_faultable_(v14, v17, v15, v16, 1);
  v19 = [CLSParentChildRelation alloc];
  v20 = *(_QWORD *)(a1 + 32);
  v21 = objc_opt_class();
  v23 = (void *)objc_msgSend_initWithParentEntity_childEntity_faultable_(v19, v22, v20, v21, 1);
  v24 = [CLSParentChildRelation alloc];
  v25 = *(_QWORD *)(a1 + 32);
  v26 = objc_opt_class();
  v28 = (void *)objc_msgSend_initWithParentEntity_childEntity_faultable_(v24, v27, v25, v26, 1);
  v29 = [CLSParentChildRelation alloc];
  v30 = *(_QWORD *)(a1 + 32);
  v31 = objc_opt_class();
  v33 = (void *)objc_msgSend_initWithParentEntity_childEntity_faultable_(v29, v32, v30, v31, 1);
  v34 = (void *)qword_1ED0FB5F8;
  v41[0] = v8;
  v41[1] = v13;
  v41[2] = v18;
  v41[3] = v23;
  v41[4] = v28;
  v41[5] = v33;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v35, (uint64_t)v41, 6);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setByAddingObjectsFromArray_(v34, v37, (uint64_t)v36);
  v38 = objc_claimAutoreleasedReturnValue();
  v39 = (void *)qword_1ED0FB5F8;
  qword_1ED0FB5F8 = v38;

}

id sub_1D407E750(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  void *v11;
  id v12;
  const char *v13;
  void *v14;

  v7 = a4;
  v8 = a5;
  if (v7 | v8)
  {
    v9 = (void *)objc_opt_new();
    v11 = v9;
    if (v7)
      objc_msgSend_setObject_forKeyedSubscript_(v9, v10, v7, CFSTR("CLSErrorObjectKey"));
    if (v8)
      objc_msgSend_setObject_forKeyedSubscript_(v11, v10, v8, *MEMORY[0x1E0CB2D50]);
  }
  else
  {
    v11 = 0;
  }
  v12 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v14 = (void *)objc_msgSend_initWithDomain_code_userInfo_(v12, v13, (uint64_t)CFSTR("com.apple.ClassKit"), a3, v11);

  return v14;
}

id sub_1D407E818(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  unint64_t v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  void *v11;
  const char *v12;
  id v13;
  const char *v14;
  void *v15;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  if (v7 | v8)
  {
    v10 = (void *)objc_opt_new();
    if (v7)
    {
      v17[0] = v7;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v9, (uint64_t)v17, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v10, v12, (uint64_t)v11, CFSTR("CLSErrorUnderlyingErrorsKey"));

    }
    if (v8)
      objc_msgSend_setObject_forKeyedSubscript_(v10, v9, v8, *MEMORY[0x1E0CB2D50]);
  }
  else
  {
    v10 = 0;
  }
  v13 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v15 = (void *)objc_msgSend_initWithDomain_code_userInfo_(v13, v14, (uint64_t)CFSTR("com.apple.ClassKit"), a3, v10);

  return v15;
}

id sub_1D407E940(void *a1, uint64_t a2, uint64_t a3, void *a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  objc_class *v12;
  id v13;
  id v14;
  id v15;
  const char *v16;
  void *v17;
  const char *v18;
  void *v19;

  v12 = (objc_class *)MEMORY[0x1E0CB3940];
  v13 = a5;
  v14 = a4;
  v15 = [v12 alloc];
  v17 = (void *)objc_msgSend_initWithFormat_arguments_(v15, v16, (uint64_t)v13, &a9);

  objc_msgSend_cls_createErrorWithCode_errorObject_description_(a1, v18, a3, v14, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

uint64_t sub_1D407E9E0(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend_cls_createErrorWithCode_errorObject_description_(a1, a2, a3, 0, a4);
}

id sub_1D407E9EC(void *a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  objc_class *v11;
  id v12;
  id v13;
  const char *v14;
  void *v15;
  const char *v16;
  void *v17;

  v11 = (objc_class *)MEMORY[0x1E0CB3940];
  v12 = a4;
  v13 = [v11 alloc];
  v15 = (void *)objc_msgSend_initWithFormat_arguments_(v13, v14, (uint64_t)v12, &a9);

  objc_msgSend_cls_createErrorWithCode_errorObject_description_(a1, v16, a3, 0, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

id sub_1D407EA74(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5, void *a6)
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  id v20;
  const char *v21;
  void *v22;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v12 = v11;
  if (v9 || v10 || v11)
  {
    v13 = (void *)objc_opt_new();
    if (v9)
    {
      v16 = (void *)objc_msgSend_copy(v9, v14, v15);
      objc_msgSend_setObject_forKeyedSubscript_(v13, v17, (uint64_t)v16, CFSTR("CLSErrorSuccessfulObjectsKey"));

    }
    if (v10)
    {
      v18 = (void *)objc_msgSend_copy(v10, v14, v15);
      objc_msgSend_setObject_forKeyedSubscript_(v13, v19, (uint64_t)v18, CFSTR("CLSErrorUnderlyingErrorsKey"));

    }
    if (v12)
      objc_msgSend_setObject_forKeyedSubscript_(v13, v14, (uint64_t)v12, *MEMORY[0x1E0CB2D50]);
  }
  else
  {
    v13 = 0;
  }
  v20 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v22 = (void *)objc_msgSend_initWithDomain_code_userInfo_(v20, v21, (uint64_t)CFSTR("com.apple.ClassKit"), a3, v13);

  return v22;
}

BOOL sub_1D407EB94(void *a1, const char *a2, _QWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a3)
  {
    objc_msgSend_cls_createErrorWithCode_errorObject_description_(a1, a2, a4, a5, a6);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return a3 != 0;
}

uint64_t sub_1D407EBD8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  objc_class *v13;
  id v14;
  id v15;
  id v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;

  v13 = (objc_class *)MEMORY[0x1E0CB3940];
  v14 = a6;
  v15 = a5;
  v16 = [v13 alloc];
  v18 = (void *)objc_msgSend_initWithFormat_arguments_(v16, v17, (uint64_t)v14, &a9);

  v20 = objc_msgSend_cls_assignError_code_errorObject_description_(a1, v19, a3, a4, v15, v18);
  return v20;
}

uint64_t sub_1D407EC7C(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend_cls_assignError_code_errorObject_description_(a1, a2, a3, a4, 0, a5);
}

uint64_t sub_1D407EC88(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  objc_class *v12;
  id v13;
  id v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;

  v12 = (objc_class *)MEMORY[0x1E0CB3940];
  v13 = a5;
  v14 = [v12 alloc];
  v16 = (void *)objc_msgSend_initWithFormat_arguments_(v14, v15, (uint64_t)v13, &a9);

  v18 = objc_msgSend_cls_assignError_code_errorObject_description_(a1, v17, a3, a4, 0, v16);
  return v18;
}

BOOL sub_1D407ED1C(uint64_t a1, uint64_t a2, _QWORD *a3, void *a4)
{
  id v5;
  void *v6;
  NSObject *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = v5;
  if (v5)
  {
    if (a3)
    {
      *a3 = objc_retainAutorelease(v5);
    }
    else
    {
      if (qword_1ED0FB9A0 != -1)
        dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
      v7 = CLSLogDefault;
      if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR))
      {
        v9 = 138543362;
        v10 = v6;
        _os_log_error_impl(&dword_1D4054000, v7, OS_LOG_TYPE_ERROR, "Dropping error because caller did not provide an errorOut pointer: %{public}@", (uint8_t *)&v9, 0xCu);
      }
    }
  }

  return v6 == 0;
}

uint64_t sub_1D407EE18(void *a1, const char *a2, uint64_t a3)
{
  int v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t isRetryable;
  void *v10;
  const char *v11;
  void *v12;

  v3 = a3;
  if (!objc_msgSend_cls_isClassKitError(a1, a2, a3))
    return 1;
  v7 = objc_msgSend_code(a1, v5, v6);
  isRetryable = 0;
  if ((unint64_t)(v7 - 305) < 2 || v7 == 103)
    return isRetryable;
  if (!v3)
    return 1;
  objc_msgSend_cls_underlyingErrorWithDomain_(a1, v8, (uint64_t)CFSTR("com.apple.ClassKit"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10;
  if (v10 == a1)
    isRetryable = 1;
  else
    isRetryable = objc_msgSend_cls_isRetryable_(v10, v11, 0);

  return isRetryable;
}

uint64_t sub_1D407EEB8(void *a1, const char *a2, uint64_t a3)
{
  void *v3;
  const char *v4;
  uint64_t isEqualToString;

  objc_msgSend_domain(a1, a2, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("com.apple.ClassKit"));

  return isEqualToString;
}

id sub_1D407EEF8(void *a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const char *v12;
  char isEqualToString;
  void *v14;
  const char *v15;
  uint64_t v16;
  char v17;
  void *v18;
  const char *v19;
  void *v20;
  char v21;
  id v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  const char *v30;
  uint64_t v31;
  id v32;
  void *v33;
  const char *v34;
  char v35;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = a1;
  v8 = v5;
  if (v5)
  {
    v9 = *MEMORY[0x1E0CB3388];
    v10 = v5;
    do
    {
      objc_msgSend_domain(v10, v6, v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToString = objc_msgSend_isEqualToString_(v11, v12, (uint64_t)v4);

      if ((isEqualToString & 1) != 0)
        break;
      objc_msgSend_userInfo(v10, v6, v7);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v14, v15, v9);
      v16 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v16;
    }
    while (v16);
    v17 = isEqualToString ^ 1;
  }
  else
  {
    v10 = 0;
    v17 = 1;
  }
  objc_msgSend_userInfo(v8, v6, v7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v18, v19, (uint64_t)CFSTR("CLSErrorUnderlyingErrorsKey"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = v17 ^ 1;
  if (v10 == v8)
    v21 = 0;
  if ((v21 & 1) == 0 && v20)
  {
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v22 = v20;
    v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v23, (uint64_t)&v37, v41, 16);
    if (v24)
    {
      v26 = v24;
      v27 = *(_QWORD *)v38;
      while (2)
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v38 != v27)
            objc_enumerationMutation(v22);
          objc_msgSend_cls_underlyingErrorWithDomain_(*(void **)(*((_QWORD *)&v37 + 1) + 8 * i), v25, (uint64_t)v4, (_QWORD)v37);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = v29;
          if (v29)
          {
            objc_msgSend_domain(v29, v30, v31);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = objc_msgSend_isEqualToString_(v33, v34, (uint64_t)v4);

            if ((v35 & 1) != 0)
            {

              goto LABEL_23;
            }
          }

        }
        v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v25, (uint64_t)&v37, v41, 16);
        if (v26)
          continue;
        break;
      }
    }

  }
  v32 = v10;
LABEL_23:

  return v32;
}

void sub_1D407F110(uint64_t a1, uint64_t a2, void *a3)
{
  NSObject *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (qword_1ED0FB9A0 != -1)
    dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = 138543362;
    v6 = a1;
    _os_log_error_impl(&dword_1D4054000, v4, OS_LOG_TYPE_ERROR, "Error: %{public}@", (uint8_t *)&v5, 0xCu);
  }

}

void sub_1D407F1DC(uint64_t a1, uint64_t a2, void *a3)
{
  NSObject *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (qword_1ED0FB9A0 != -1)
    dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = a1;
    _os_log_impl(&dword_1D4054000, v4, OS_LOG_TYPE_DEFAULT, "Warning: %{public}@", (uint8_t *)&v5, 0xCu);
  }

}

void sub_1D407F2A4(uint64_t a1, uint64_t a2, void *a3)
{
  NSObject *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (qword_1ED0FB9A0 != -1)
    dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = 138543362;
    v6 = a1;
    _os_log_impl(&dword_1D4054000, v4, OS_LOG_TYPE_INFO, "Info: %{public}@", (uint8_t *)&v5, 0xCu);
  }

}

void sub_1D407F36C(uint64_t a1, uint64_t a2, void *a3)
{
  NSObject *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (qword_1ED0FB9A0 != -1)
    dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = 138543362;
    v6 = a1;
    _os_log_debug_impl(&dword_1D4054000, v4, OS_LOG_TYPE_DEBUG, "Debug: %{public}@", (uint8_t *)&v5, 0xCu);
  }

}

void sub_1D407F438(uint64_t a1, uint64_t a2, void *a3)
{
  NSObject *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (qword_1ED0FB9A0 != -1)
    dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = a1;
    _os_log_impl(&dword_1D4054000, v4, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@", (uint8_t *)&v5, 0xCu);
  }

}

void sub_1D407FB98(uint64_t a1, const char *a2)
{
  uint64_t v2;
  void *v3;

  objc_msgSend_interfaceWithProtocol_(MEMORY[0x1E0CB3B50], a2, (uint64_t)&unk_1EFE3A750);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED0FB610;
  qword_1ED0FB610 = v2;

}

void sub_1D407FC0C(uint64_t a1, const char *a2)
{
  uint64_t v2;
  void *v3;

  objc_msgSend_interfaceWithProtocol_(MEMORY[0x1E0CB3B50], a2, (uint64_t)&unk_1EFE3C698);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED0FB620;
  qword_1ED0FB620 = v2;

}

void sub_1D407FDD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 40);
  if (a2)
  {
    (*(void (**)(_QWORD, _QWORD, uint64_t))(v3 + 16))(*(_QWORD *)(a1 + 40), 0, a2);
  }
  else
  {
    objc_msgSend_identifierPath(*(void **)(a1 + 32), 0, a3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, _QWORD))(v3 + 16))(v3, v4, 0);

  }
}

void sub_1D4080188(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a10);
  va_start(va, a10);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1D40801BC(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1D40801CC(uint64_t a1)
{

}

void sub_1D40801D8(_QWORD *a1, void *a2, void *a3)
{
  void *v3;
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  const char *v22;
  int isEqualToArray;
  id v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  if (v7)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a3);
    goto LABEL_23;
  }
  v24 = v6;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v6;
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v26, v30, 16);
  if (!v9)
    goto LABEL_22;
  v12 = v9;
  v13 = *(_QWORD *)v27;
  while (2)
  {
    for (i = 0; i != v12; ++i)
    {
      if (*(_QWORD *)v27 != v13)
        objc_enumerationMutation(obj);
      v15 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
      v16 = a1[4];
      if (!v16)
      {
        objc_msgSend_identifierPath(*(void **)(*((_QWORD *)&v26 + 1) + 8 * i), v10, v11);
        v17 = objc_claimAutoreleasedReturnValue();
        if (!v17)
          goto LABEL_21;
        v3 = (void *)v17;
        if (!a1[4])
          goto LABEL_16;
      }
      objc_msgSend_identifierPath(v15, v10, v11);
      v18 = objc_claimAutoreleasedReturnValue();
      if (!v18)
      {
        if (v16)
          continue;
LABEL_16:

        continue;
      }
      v19 = (void *)v18;
      v20 = (void *)a1[4];
      objc_msgSend_identifierPath(v15, v10, v11);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToArray = objc_msgSend_isEqualToArray_(v20, v22, (uint64_t)v21);

      if (v16)
      {
        if (isEqualToArray)
          goto LABEL_21;
      }
      else
      {

        if ((isEqualToArray & 1) != 0)
        {
LABEL_21:
          objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), v15);
          goto LABEL_22;
        }
      }
    }
    v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v26, v30, 16);
    if (v12)
      continue;
    break;
  }
LABEL_22:

  v7 = 0;
  v6 = v24;
LABEL_23:
  (*(void (**)(void))(a1[5] + 16))();

}

__CFString *NSStringFromFavoriteType(int a1, const char *a2)
{
  __CFString *v2;

  if (!a1)
    return CFSTR("Context");
  if (a1 == 1)
  {
    v2 = CFSTR("URL");
  }
  else
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("Unknown favorite type: '%ld'"), a1);
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

uint64_t CLSFavoriteTypeFromString(void *a1)
{
  id v1;
  const char *v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v7;
  const char *v8;
  id v9;

  v1 = a1;
  v3 = v1;
  if (!v1)
    goto LABEL_7;
  if ((objc_msgSend_isEqualToString_(v1, v2, (uint64_t)CFSTR("Context")) & 1) == 0)
  {
    if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("URL")) & 1) != 0)
    {
      v5 = 1;
      goto LABEL_6;
    }
LABEL_7:
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v2, (uint64_t)CFSTR("Unknown favorite type string: '%@'"), v3);
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E0C99DA0], v8, *MEMORY[0x1E0C99778], v7, 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v9);
  }
  v5 = 0;
LABEL_6:

  return v5;
}

void sub_1D4081614(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_1ED0FB630;
  qword_1ED0FB630 = (uint64_t)v1;

}

void sub_1D4081910(uint64_t a1)
{
  NSMapTable *v1;
  void *v2;
  const char *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v1 = (NSMapTable *)*(id *)(*(_QWORD *)(a1 + 32) + 16);
  NSAllMapTableKeys(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v4 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2, v3, (uint64_t)&v34, v38, 16);
  if (v4)
  {
    v7 = v4;
    v8 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v35 != v8)
          objc_enumerationMutation(v2);
        v10 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend_objectForKey_(v1, v5, v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v11;
        if (v11)
        {
          v17 = objc_msgSend_count(v11, v12, v13);
          if (v17 - 1 >= 0)
          {
            do
            {
              objc_msgSend_objectAtIndexedSubscript_(v14, v15, --v17);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_observer(v18, v19, v20);
              v21 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v21)
                objc_msgSend_removeObjectAtIndex_(v14, v22, v17);

            }
            while (v17 > 0);
          }
          if (!objc_msgSend_count(v14, v15, v16))
          {
            objc_msgSend_removeObjectForKey_(*(void **)(*(_QWORD *)(a1 + 32) + 16), v23, v10);
            objc_msgSend_unregisterFromDarwinNotification_(*(void **)(a1 + 32), v24, v10);
          }
        }

      }
      v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2, v5, (uint64_t)&v34, v38, 16);
    }
    while (v7);
  }
  v25 = objc_msgSend_copy(*(void **)(*(_QWORD *)(a1 + 32) + 24), v5, v6);
  v26 = *(_QWORD *)(a1 + 32);
  v27 = *(void **)(v26 + 24);
  *(_QWORD *)(v26 + 24) = v25;

  v30 = objc_msgSend_copy(*(void **)(*(_QWORD *)(a1 + 32) + 40), v28, v29);
  v31 = *(_QWORD *)(a1 + 32);
  v32 = *(void **)(v31 + 40);
  *(_QWORD *)(v31 + 40) = v30;

}

void sub_1D4081C2C(uint64_t a1, const char *a2)
{
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  int v11;
  id v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  qos_class_t v16;
  NSObject *v17;
  uint32_t v18;
  const char *v19;
  void *v20;
  void *v21;
  const char *v22;
  NSObject *v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  _BOOL4 v27;
  CLSDeallocNotifier *v28;
  const char *v29;
  void *v30;
  CLSDarwinNotification *v31;
  const char *v32;
  void *v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  const char *v38;
  void *v39;
  void *v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  _QWORD v49[5];
  _QWORD handler[4];
  id v51;
  id v52;
  id location;
  int out_token;
  uint8_t buf[4];
  uint64_t v56;
  __int16 v57;
  uint32_t v58;
  __int16 v59;
  int v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  objc_msgSend_objectForKey_(*(void **)(*(_QWORD *)(a1 + 32) + 16), a2, *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = (void *)objc_opt_new();
    objc_msgSend_setObject_forKey_(*(void **)(*(_QWORD *)(a1 + 32) + 16), v6, (uint64_t)v5, *(_QWORD *)(a1 + 40));
  }
  out_token = -1;
  if (objc_msgSend_count(v5, v3, v4))
  {
    objc_msgSend_objectForKey_(*(void **)(*(_QWORD *)(a1 + 32) + 32), v7, *(_QWORD *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend_intValue(v8, v9, v10);
    out_token = v11;

  }
  else
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    v12 = objc_retainAutorelease(*(id *)(a1 + 40));
    v15 = (const char *)objc_msgSend_UTF8String(v12, v13, v14);
    v16 = qos_class_self();
    dispatch_get_global_queue(v16, 0);
    v17 = objc_claimAutoreleasedReturnValue();
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = sub_1D40820C4;
    handler[3] = &unk_1E974A898;
    objc_copyWeak(&v52, &location);
    v51 = *(id *)(a1 + 40);
    v18 = notify_register_dispatch(v15, &out_token, v17, handler);

    if (v18 || !notify_is_valid_token(out_token))
    {
      if (qword_1ED0FB9A0 != -1)
        dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
      v25 = CLSLogNotifications;
      if (os_log_type_enabled((os_log_t)CLSLogNotifications, OS_LOG_TYPE_ERROR))
      {
        v48 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412802;
        v56 = v48;
        v57 = 1024;
        v58 = v18;
        v59 = 1024;
        v60 = out_token;
        _os_log_error_impl(&dword_1D4054000, v25, OS_LOG_TYPE_ERROR, "Failed to register for darwin notification '%@', status: %d, token: %d", buf, 0x18u);
      }
      out_token = -1;
    }
    else if (out_token != -1)
    {
      v20 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
      objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v19, out_token);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_(v20, v22, (uint64_t)v21, *(_QWORD *)(a1 + 40));

      if (qword_1ED0FB9A0 != -1)
        dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
      v23 = CLSLogNotifications;
      if (os_log_type_enabled((os_log_t)CLSLogNotifications, OS_LOG_TYPE_DEFAULT))
      {
        v24 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        v56 = v24;
      }
    }

    objc_destroyWeak(&v52);
    objc_destroyWeak(&location);
    v11 = out_token;
  }
  if (v11 != -1)
  {
    objc_getAssociatedObject(*(id *)(a1 + 48), CFSTR("CLSDeallocNotifier"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26 == 0;

    if (v27)
    {
      v28 = [CLSDeallocNotifier alloc];
      v49[0] = MEMORY[0x1E0C809B0];
      v49[1] = 3221225472;
      v49[2] = sub_1D40821C0;
      v49[3] = &unk_1E974A658;
      v49[4] = *(_QWORD *)(a1 + 32);
      v30 = (void *)objc_msgSend_initWithDeallocCallbackBlock_(v28, v29, (uint64_t)v49);
      objc_setAssociatedObject(*(id *)(a1 + 48), CFSTR("CLSDeallocNotifier"), v30, (void *)1);

    }
    v31 = [CLSDarwinNotification alloc];
    v33 = (void *)objc_msgSend_initWithObserver_name_block_(v31, v32, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
    objc_msgSend_addObject_(v5, v34, (uint64_t)v33);
    objc_msgSend_objectForKey_(*(void **)(*(_QWORD *)(a1 + 32) + 24), v35, *(_QWORD *)(a1 + 48));
    v36 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v36;
    if (!v36)
    {
      v5 = (void *)objc_opt_new();
      objc_msgSend_setObject_forKey_(*(void **)(*(_QWORD *)(a1 + 32) + 24), v38, (uint64_t)v5, *(_QWORD *)(a1 + 48));
    }
    objc_msgSend_addObject_(v5, v37, (uint64_t)v33);
    v39 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
    v40 = *(void **)(a1 + 48);
    v41 = (void *)MEMORY[0x1E0CB37E8];
    v44 = objc_msgSend_hash(v40, v42, v43);
    objc_msgSend_numberWithUnsignedInteger_(v41, v45, v44);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v39, v47, (uint64_t)v40, v46);

  }
}

void sub_1D4082088(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D40820C4(uint64_t a1)
{
  id WeakRetained;
  const char *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend_postLocalNotificationName_(WeakRetained, v3, *(_QWORD *)(a1 + 32));
  }
  else
  {
    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v5 = CLSLogNotifications;
    if (os_log_type_enabled((os_log_t)CLSLogNotifications, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 138412290;
      v8 = v6;
      _os_log_error_impl(&dword_1D4054000, v5, OS_LOG_TYPE_ERROR, "CLSDarwinNotificationCenter instance was released after registering to receive darwin notificaion '%@'", (uint8_t *)&v7, 0xCu);
    }
  }

}

uint64_t sub_1D40821C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1E0DE7D20](*(_QWORD *)(a1 + 32), sel_handleObserverRemoval, a3);
}

void sub_1D4082248(uint64_t a1)
{
  id v2;
  const char *v3;
  uint64_t v4;
  const char *v5;
  uint32_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint32_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = objc_retainAutorelease(*(id *)(a1 + 32));
  v5 = (const char *)objc_msgSend_UTF8String(v2, v3, v4);
  v6 = notify_post(v5);
  if (qword_1ED0FB9A0 != -1)
    dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
  v7 = CLSLogNotifications;
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)CLSLogNotifications, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v10 = 138412546;
      v11 = v8;
      v12 = 1024;
      v13 = v6;
      _os_log_error_impl(&dword_1D4054000, v7, OS_LOG_TYPE_ERROR, "Failed to post darwin notification '%@', status: %d", (uint8_t *)&v10, 0x12u);
    }
  }
  else if (os_log_type_enabled((os_log_t)CLSLogNotifications, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = 138412290;
    v11 = v9;
    _os_log_impl(&dword_1D4054000, v7, OS_LOG_TYPE_DEFAULT, "Posted darwin notification '%@'", (uint8_t *)&v10, 0xCu);
  }
}

void sub_1D4082414(uint64_t a1, const char *a2)
{
  void *v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  const char *v14;
  qos_class_t v15;
  NSObject *v16;
  _QWORD block[5];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend_objectForKey_(*(void **)(*(_QWORD *)(a1 + 32) + 16), a2, *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v18, v22, 16);
  if (v5)
  {
    v8 = v5;
    v9 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v3);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        v12 = *(void **)(a1 + 40);
        objc_msgSend_name(v11, v6, v7);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v12) = objc_msgSend_isEqualToString_(v12, v14, (uint64_t)v13);

        if ((_DWORD)v12)
        {
          v15 = qos_class_self();
          dispatch_get_global_queue(v15, 0);
          v16 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = sub_1D408259C;
          block[3] = &unk_1E974A658;
          block[4] = v11;
          dispatch_async(v16, block);

        }
      }
      v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v6, (uint64_t)&v18, v22, 16);
    }
    while (v8);
  }

}

void sub_1D408259C(uint64_t a1, const char *a2, uint64_t a3)
{
  void (**v4)(id, _QWORD);

  objc_msgSend_block(*(void **)(a1 + 32), a2, a3);
  v4 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
  v4[2](v4, *(_QWORD *)(a1 + 32));

}

void sub_1D40826A8(uint64_t a1, const char *a2)
{
  void *v3;
  void *v4;
  const char *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  const char *v22;
  const char *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  int isEqualToString;
  const char *v38;
  const char *v39;
  const char *v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  const char *v62;
  const char *v63;
  void *v64;
  id obj;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], a2, *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v3, v5, (uint64_t)v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
  {
    objc_msgSend_objectForKey_(*(void **)(*(_QWORD *)(a1 + 32) + 16), v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v9;
    if (v9)
    {
      v13 = objc_msgSend_count(v9, v10, v11);
      if (v13 - 1 >= 0)
      {
        v16 = v13;
        do
        {
          objc_msgSend_objectAtIndexedSubscript_(v12, v14, --v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_observer(v17, v18, v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (v20 == v6)
            objc_msgSend_removeObjectAtIndex_(v12, v21, v16);

        }
        while (v16 > 0);
      }
      if (!objc_msgSend_count(v12, v14, v15))
      {
        objc_msgSend_removeObjectForKey_(*(void **)(*(_QWORD *)(a1 + 32) + 16), v22, *(_QWORD *)(a1 + 40));
        objc_msgSend_unregisterFromDarwinNotification_(*(void **)(a1 + 32), v23, *(_QWORD *)(a1 + 40));
      }
      if (v6)
      {
        objc_msgSend_objectForKey_(*(void **)(*(_QWORD *)(a1 + 32) + 24), v22, (uint64_t)v6);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v24;
        if (v24)
        {
          v28 = objc_msgSend_count(v24, v25, v26);
          if (v28 - 1 >= 0)
          {
            v31 = v28;
            do
            {
              objc_msgSend_objectAtIndexedSubscript_(v27, v29, --v31);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_name(v32, v33, v34);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              isEqualToString = objc_msgSend_isEqualToString_(v35, v36, *(_QWORD *)(a1 + 40));

              if (isEqualToString)
                objc_msgSend_removeObjectAtIndex_(v27, v38, v31);

            }
            while (v31 > 0);
          }
          if (!objc_msgSend_count(v27, v29, v30))
            objc_msgSend_removeObjectForKey_(*(void **)(*(_QWORD *)(a1 + 32) + 24), v39, (uint64_t)v6);
        }

      }
    }
LABEL_37:

    goto LABEL_38;
  }
  if (v6)
  {
    objc_msgSend_objectForKey_(*(void **)(*(_QWORD *)(a1 + 32) + 24), v7, (uint64_t)v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend_removeObjectForKey_(*(void **)(*(_QWORD *)(a1 + 32) + 24), v40, (uint64_t)v6);
      v68 = 0u;
      v69 = 0u;
      v66 = 0u;
      v67 = 0u;
      v64 = v12;
      obj = v12;
      v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v41, (uint64_t)&v66, v70, 16);
      if (v42)
      {
        v45 = v42;
        v46 = *(_QWORD *)v67;
        do
        {
          v47 = 0;
          do
          {
            if (*(_QWORD *)v67 != v46)
              objc_enumerationMutation(obj);
            objc_msgSend_name(*(void **)(*((_QWORD *)&v66 + 1) + 8 * v47), v43, v44, v64);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKey_(*(void **)(*(_QWORD *)(a1 + 32) + 16), v49, (uint64_t)v48);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            v53 = v50;
            if (v50)
            {
              v56 = objc_msgSend_count(v50, v51, v52);
              if (v56 - 1 >= 0)
              {
                do
                {
                  objc_msgSend_objectAtIndexedSubscript_(v53, v54, --v56);
                  v57 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_observer(v57, v58, v59);
                  v60 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v60 == v6)
                    objc_msgSend_removeObjectAtIndex_(v53, v61, v56);

                }
                while (v56 > 0);
              }
              if (!objc_msgSend_count(v53, v54, v55))
              {
                objc_msgSend_removeObjectForKey_(*(void **)(*(_QWORD *)(a1 + 32) + 16), v62, (uint64_t)v48);
                objc_msgSend_unregisterFromDarwinNotification_(*(void **)(a1 + 32), v63, (uint64_t)v48);
              }
            }

            ++v47;
          }
          while (v47 != v45);
          v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v43, (uint64_t)&v66, v70, 16);
        }
        while (v45);
      }

      v12 = v64;
    }
    goto LABEL_37;
  }
LABEL_38:

}

uint64_t sub_1D4083344(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  const char *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  objc_msgSend_objectID(a2, (const char *)a2, (uint64_t)a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  v8 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    if (v8 && objc_msgSend_isEqualToString_(v5, v6, v8))
      goto LABEL_4;
LABEL_6:
    v9 = 0;
    goto LABEL_7;
  }
  if (v8)
    goto LABEL_6;
LABEL_4:
  v9 = 1;
  *a3 = 1;
LABEL_7:

  return v9;
}

void sub_1D4083BDC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D4083BF0(uint64_t a1, void *a2, void *a3)
{
  id v5;
  const char *v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  char v19;
  id v20;
  NSObject *v21;
  CLSContextProviderService *v22;
  const char *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  NSObject *v28;
  id WeakRetained;
  const char *v30;
  uint64_t v31;
  NSObject *v32;
  id v33;
  uint64_t v34;
  _QWORD v35[4];
  id v36;
  uint64_t v37;
  _QWORD block[5];
  id v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  id v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v7 = a3;
  if (v7)
  {
    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v8 = (void *)CLSLogDefault;
    if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR))
    {
      v9 = v8;
      NSStringFromSelector(sel_beginMatchingExtensionsWithAttributes_completion_);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v46 = v10;
      v47 = 2114;
      v48 = v7;
      _os_log_error_impl(&dword_1D4054000, v9, OS_LOG_TYPE_ERROR, "error in %@, error: %{public}@", buf, 0x16u);

    }
  }
  else
  {
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v41, v49, 16);
    if (v11)
    {
      v14 = v11;
      v15 = *(_QWORD *)v42;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v42 != v15)
            objc_enumerationMutation(v5);
          v17 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v16);
          if ((objc_msgSend_optedIn(v17, v12, v13) & 1) == 0)
          {
            v40 = 0;
            v19 = objc_msgSend_attemptOptIn_(v17, v18, (uint64_t)&v40);
            v20 = v40;
            if ((v19 & 1) == 0)
            {
              if (qword_1ED0FB9A0 != -1)
                dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
              v21 = CLSLogDefault;
              if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543618;
                v46 = v17;
                v47 = 2114;
                v48 = v20;
                _os_log_error_impl(&dword_1D4054000, v21, OS_LOG_TYPE_ERROR, "Extension '%{public}@' was not opted in. Attempt to opt-in failed with error: %{public}@", buf, 0x16u);
              }
            }

          }
          v22 = [CLSContextProviderService alloc];
          v24 = (void *)objc_msgSend_initWithExtension_(v22, v23, (uint64_t)v17);
          v25 = v24;
          if (v24)
          {
            v26 = *(_QWORD *)(a1 + 32);
            v27 = *(NSObject **)(v26 + 24);
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = sub_1D4084014;
            block[3] = &unk_1E974A8E8;
            block[4] = v26;
            v39 = v24;
            dispatch_barrier_async(v27, block);

          }
          else
          {
            if (qword_1ED0FB9A0 != -1)
              dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
            v28 = CLSLogDefault;
            if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v46 = v17;
              _os_log_error_impl(&dword_1D4054000, v28, OS_LOG_TYPE_ERROR, "CLSContextProviderService was nil for extension: %@", buf, 0xCu);
            }
          }

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v12, (uint64_t)&v41, v49, 16);
      }
      while (v14);
    }
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
    if (objc_msgSend_count(v5, v30, v31) && WeakRetained)
    {
      dispatch_get_global_queue(25, 0);
      v32 = objc_claimAutoreleasedReturnValue();
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = sub_1D4084020;
      v35[3] = &unk_1E974A8E8;
      v33 = WeakRetained;
      v34 = *(_QWORD *)(a1 + 32);
      v36 = v33;
      v37 = v34;
      dispatch_async(v32, v35);

    }
    v7 = 0;
  }

}

uint64_t sub_1D4084014(uint64_t a1, const char *a2)
{
  return objc_msgSend_addObject_(*(void **)(*(_QWORD *)(a1 + 32) + 40), a2, *(_QWORD *)(a1 + 40));
}

uint64_t sub_1D4084020(uint64_t a1)
{
  return MEMORY[0x1E0DE7D20](*(_QWORD *)(a1 + 32), sel_serviceFinderDidUpdateServices_, *(_QWORD *)(a1 + 40));
}

void sub_1D40840C0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1D40840D4(uint64_t a1, const char *a2, uint64_t a3)
{
  return objc_msgSend_removeAllObjects(*(void **)(*(_QWORD *)(a1 + 32) + 40), a2, a3);
}

uint64_t sub_1D4084194(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1D40841A4(uint64_t a1)
{

}

void sub_1D40841AC(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v4 = objc_msgSend_copy(*(void **)(*(_QWORD *)(a1 + 32) + 40), a2, a3);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void sub_1D40842A8(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  CLSChildParentRelation *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  CLSParentChildRelation *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  objc_super v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v20.receiver = *(id *)(a1 + 32);
  v20.super_class = (Class)&OBJC_METACLASS___CLSSurveyAnswerItem;
  objc_msgSendSuper2(&v20, sel_relations);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED0FB638;
  qword_1ED0FB638 = v2;

  v4 = [CLSChildParentRelation alloc];
  v5 = *(_QWORD *)(a1 + 32);
  v6 = objc_opt_class();
  v8 = (void *)objc_msgSend_initWithChildEntity_parentEntity_faultable_(v4, v7, v5, v6, 1);
  v9 = [CLSParentChildRelation alloc];
  v10 = *(_QWORD *)(a1 + 32);
  v11 = objc_opt_class();
  v13 = (void *)objc_msgSend_initWithParentEntity_childEntity_faultable_(v9, v12, v10, v11, 1);
  v14 = (void *)qword_1ED0FB638;
  v21[0] = v8;
  v21[1] = v13;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v15, (uint64_t)v21, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setByAddingObjectsFromArray_(v14, v17, (uint64_t)v16);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)qword_1ED0FB638;
  qword_1ED0FB638 = v18;

}

id CLSClientRemoteObjectInterface()
{
  if (qword_1ED0FB650 != -1)
    dispatch_once(&qword_1ED0FB650, &unk_1E9749A70);
  return (id)qword_1ED0FB648;
}

void sub_1D4084438()
{
  uint64_t v0;
  void *v1;
  const char *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v0 = objc_opt_new();
  v1 = (void *)qword_1ED0FB648;
  qword_1ED0FB648 = v0;

  objc_msgSend_setProtocol_((void *)qword_1ED0FB648, v2, (uint64_t)&unk_1EFE3A328);
  v3 = (void *)MEMORY[0x1E0C99E60];
  CLSObjectsClasses();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CLSDashboardClasses();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E60];
  v14[0] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v7, (uint64_t)v14, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v6, v9, (uint64_t)v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithUnionOfSets_(v3, v11, (uint64_t)v4, v5, v10, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_((void *)qword_1ED0FB648, v13, (uint64_t)v12, sel_clientRemote_deliverObject_, 0, 0);
}

void sub_1D408456C()
{
  uint64_t v0;
  void *v1;
  const char *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v0 = objc_opt_new();
  v1 = (void *)qword_1ED0FB658;
  qword_1ED0FB658 = v0;

  objc_msgSend_setProtocol_((void *)qword_1ED0FB658, v2, (uint64_t)&unk_1EFE3B498);
  v3 = (void *)MEMORY[0x1E0C99E60];
  CLSObjectsClasses();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CLSDashboardClasses();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CLSSearchClasses();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99E60];
  v15[0] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v8, (uint64_t)v15, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v7, v10, (uint64_t)v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithUnionOfSets_(v3, v12, (uint64_t)v4, v5, v6, v11, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_((void *)qword_1ED0FB658, v14, (uint64_t)v13, sel_clientRemote_deliverObject_, 0, 0);
}

void sub_1D40846B8()
{
  uint64_t v0;
  void *v1;
  const char *v2;
  void *v3;
  void *v4;
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  void *v13;
  void *v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v0 = objc_opt_new();
  v1 = (void *)qword_1ED0FB668;
  qword_1ED0FB668 = v0;

  objc_msgSend_setProtocol_((void *)qword_1ED0FB668, v2, (uint64_t)&unk_1EFE3A3A0);
  v3 = (void *)MEMORY[0x1E0C99E60];
  CLSObjectsClasses();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0C99E60];
  v19[0] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v6, (uint64_t)v19, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v5, v8, (uint64_t)v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithUnionOfSets_(v3, v10, (uint64_t)v4, v9, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_((void *)qword_1ED0FB668, v12, (uint64_t)v11, sel_clientRemote_saveDone_, 0, 0);
  v13 = (void *)qword_1ED0FB668;
  v14 = (void *)MEMORY[0x1E0C99E60];
  CLSObjectsClasses();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithUnionOfSets_(v14, v16, (uint64_t)v15, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v13, v18, (uint64_t)v17, sel_clientRemote_deliverObject_, 0, 0);

}

void sub_1D408482C()
{
  uint64_t v0;
  void *v1;
  const char *v2;
  void *v3;
  const char *v4;
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  uint64_t v16;
  const char *v17;
  void *v18;
  uint64_t v19;
  const char *v20;
  void *v21;
  uint64_t v22;
  const char *v23;
  void *v24;
  uint64_t v25;
  const char *v26;
  void *v27;
  uint64_t v28;
  const char *v29;
  void *v30;
  uint64_t v31;
  const char *v32;
  const char *v33;
  _QWORD v34[3];

  v34[2] = *MEMORY[0x1E0C80C00];
  v0 = objc_opt_new();
  v1 = (void *)qword_1ED0FB678;
  qword_1ED0FB678 = v0;

  objc_msgSend_setProtocol_((void *)qword_1ED0FB678, v2, (uint64_t)&unk_1EFE43C40);
  v3 = (void *)MEMORY[0x1E0C99E60];
  v34[0] = objc_opt_class();
  v34[1] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v4, (uint64_t)v34, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v3, v6, (uint64_t)v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_((void *)qword_1ED0FB678, v8, (uint64_t)v7, sel_clientRemote_uploadProgressFraction_error_, 1, 0);
  v9 = (void *)qword_1ED0FB678;
  v10 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v9, v11, v10, sel_clientRemote_uploadCompleted_url_thumbnailURL_relativePathWithinContainer_ubiquitousContainerName_brItemID_brOwnerName_brZoneName_brShareName_fractionUploaded_isTemporary_isStaged_error_, 1, 0);
  v12 = (void *)qword_1ED0FB678;
  v13 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v12, v14, v13, sel_clientRemote_uploadCompleted_url_thumbnailURL_relativePathWithinContainer_ubiquitousContainerName_brItemID_brOwnerName_brZoneName_brShareName_fractionUploaded_isTemporary_isStaged_error_, 2, 0);
  v15 = (void *)qword_1ED0FB678;
  v16 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v15, v17, v16, sel_clientRemote_uploadCompleted_url_thumbnailURL_relativePathWithinContainer_ubiquitousContainerName_brItemID_brOwnerName_brZoneName_brShareName_fractionUploaded_isTemporary_isStaged_error_, 3, 0);
  v18 = (void *)qword_1ED0FB678;
  v19 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v18, v20, v19, sel_clientRemote_uploadCompleted_url_thumbnailURL_relativePathWithinContainer_ubiquitousContainerName_brItemID_brOwnerName_brZoneName_brShareName_fractionUploaded_isTemporary_isStaged_error_, 4, 0);
  v21 = (void *)qword_1ED0FB678;
  v22 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v21, v23, v22, sel_clientRemote_uploadCompleted_url_thumbnailURL_relativePathWithinContainer_ubiquitousContainerName_brItemID_brOwnerName_brZoneName_brShareName_fractionUploaded_isTemporary_isStaged_error_, 5, 0);
  v24 = (void *)qword_1ED0FB678;
  v25 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v24, v26, v25, sel_clientRemote_uploadCompleted_url_thumbnailURL_relativePathWithinContainer_ubiquitousContainerName_brItemID_brOwnerName_brZoneName_brShareName_fractionUploaded_isTemporary_isStaged_error_, 6, 0);
  v27 = (void *)qword_1ED0FB678;
  v28 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v27, v29, v28, sel_clientRemote_uploadCompleted_url_thumbnailURL_relativePathWithinContainer_ubiquitousContainerName_brItemID_brOwnerName_brZoneName_brShareName_fractionUploaded_isTemporary_isStaged_error_, 7, 0);
  v30 = (void *)qword_1ED0FB678;
  v31 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v30, v32, v31, sel_clientRemote_uploadCompleted_url_thumbnailURL_relativePathWithinContainer_ubiquitousContainerName_brItemID_brOwnerName_brZoneName_brShareName_fractionUploaded_isTemporary_isStaged_error_, 8, 0);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_((void *)qword_1ED0FB678, v33, (uint64_t)v7, sel_clientRemote_uploadCompleted_url_thumbnailURL_relativePathWithinContainer_ubiquitousContainerName_brItemID_brOwnerName_brZoneName_brShareName_fractionUploaded_isTemporary_isStaged_error_, 12, 0);

}

void sub_1D4084A78()
{
  uint64_t v0;
  void *v1;
  const char *v2;
  void *v3;
  const char *v4;
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  const char *v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v0 = objc_opt_new();
  v1 = (void *)qword_1ED0FB688;
  qword_1ED0FB688 = v0;

  objc_msgSend_setProtocol_((void *)qword_1ED0FB688, v2, (uint64_t)&unk_1EFE38A98);
  v3 = (void *)MEMORY[0x1E0C99E60];
  v10[0] = objc_opt_class();
  v10[1] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v4, (uint64_t)v10, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v3, v6, (uint64_t)v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_((void *)qword_1ED0FB688, v8, (uint64_t)v7, sel_clientRemote_downloadProgressFraction_error_, 1, 0);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_((void *)qword_1ED0FB688, v9, (uint64_t)v7, sel_clientRemote_downloadCompleted_error_, 1, 0);

}

__CFString *NSStringFromCLSAnswerType(uint64_t a1, const char *a2)
{
  if ((unint64_t)(a1 - 1) < 3)
    return off_1E974AA00[a1 - 1];
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("Unknown answer type: '%ld'"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

uint64_t CLSAnswerTypeFromString(void *a1)
{
  id v1;
  const char *v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v8;
  const char *v9;
  id v10;

  v1 = a1;
  v3 = v1;
  if (!v1)
    goto LABEL_9;
  if ((objc_msgSend_isEqualToString_(v1, v2, (uint64_t)CFSTR("SliderAnswer")) & 1) == 0)
  {
    if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("OpenResponseAnswer")) & 1) != 0)
    {
      v5 = 3;
      goto LABEL_8;
    }
    if ((objc_msgSend_isEqualToString_(v3, v6, (uint64_t)CFSTR("MultipleChoiceAnswer")) & 1) != 0)
    {
      v5 = 2;
      goto LABEL_8;
    }
LABEL_9:
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v2, (uint64_t)CFSTR("Unknown answer type: '%@'"), v3);
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E0C99DA0], v9, *MEMORY[0x1E0C99778], v8, 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v10);
  }
  v5 = 1;
LABEL_8:

  return v5;
}

const __CFString *NSStringFromCLSAnswerState(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("Draft");
  if (a1 == 2)
    v1 = CFSTR("Published");
  if (a1)
    return v1;
  else
    return CFSTR("Unknown");
}

uint64_t CLSAnswerStateFromString(void *a1)
{
  id v1;
  const char *v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v7;
  const char *v8;
  id v9;

  v1 = a1;
  v3 = v1;
  if (!v1)
    goto LABEL_7;
  if ((objc_msgSend_isEqualToString_(v1, v2, (uint64_t)CFSTR("Draft")) & 1) == 0)
  {
    if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("Published")) & 1) != 0)
    {
      v5 = 2;
      goto LABEL_6;
    }
LABEL_7:
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v2, (uint64_t)CFSTR("Unknown answer state: '%@'"), v3);
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E0C99DA0], v8, *MEMORY[0x1E0C99778], v7, 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v9);
  }
  v5 = 1;
LABEL_6:

  return v5;
}

const __CFString *NSStringFromCLSAnswerAction(unint64_t a1)
{
  if (a1 > 3)
    return CFSTR("Added");
  else
    return off_1E974AA18[a1];
}

uint64_t CLSAnswerActionFromString(void *a1)
{
  id v1;
  const char *v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  uint64_t v9;
  const char *v10;
  id v11;

  v1 = a1;
  v3 = v1;
  if (!v1)
    goto LABEL_11;
  if ((objc_msgSend_isEqualToString_(v1, v2, (uint64_t)CFSTR("Added")) & 1) == 0)
  {
    if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("Changed")) & 1) != 0)
    {
      v5 = 2;
      goto LABEL_10;
    }
    if ((objc_msgSend_isEqualToString_(v3, v6, (uint64_t)CFSTR("Deleted")) & 1) != 0)
    {
      v5 = 3;
      goto LABEL_10;
    }
    if ((objc_msgSend_isEqualToString_(v3, v7, (uint64_t)CFSTR("None")) & 1) != 0)
    {
      v5 = 0;
      goto LABEL_10;
    }
LABEL_11:
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v2, (uint64_t)CFSTR("Unknown answer action: '%@'"), v3);
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E0C99DA0], v10, *MEMORY[0x1E0C99778], v9, 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v11);
  }
  v5 = 1;
LABEL_10:

  return v5;
}

void sub_1D4089BB8(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  CLSParentChildRelation *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  objc_super v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v15.receiver = *(id *)(a1 + 32);
  v15.super_class = (Class)&OBJC_METACLASS___CLSClass;
  objc_msgSendSuper2(&v15, sel_relations);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED0FB698;
  qword_1ED0FB698 = v2;

  v4 = [CLSParentChildRelation alloc];
  v5 = *(_QWORD *)(a1 + 32);
  v6 = objc_opt_class();
  v8 = (void *)objc_msgSend_initWithParentEntity_childEntity_faultable_(v4, v7, v5, v6, 1);
  v9 = (void *)qword_1ED0FB698;
  v16[0] = v8;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v10, (uint64_t)v16, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setByAddingObjectsFromArray_(v9, v12, (uint64_t)v11);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)qword_1ED0FB698;
  qword_1ED0FB698 = v13;

}

id sub_1D4089CC4(void *a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  const char *v15;
  void *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v6 = v4;
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v22, v26, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v23;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v11);
        v13 = objc_opt_class();
        objc_msgSend_objectForKey_ofClass_(a1, v14, v12, v13, (_QWORD)v22);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
          objc_msgSend_setObject_forKey_(v5, v15, (uint64_t)v16, v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v17, (uint64_t)&v22, v26, 16);
    }
    while (v9);
  }

  v20 = (void *)objc_msgSend_copy(v5, v18, v19);
  return v20;
}

void sub_1D408A438(uint64_t a1, const char *a2)
{
  void *v2;
  void *v3;
  id v4;
  const char *v5;
  void *v6;
  char v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v11 = 0;
  objc_msgSend_entitlementsForCurrentTaskWithError_(v2, a2, (uint64_t)&v11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v11;
  v6 = v4;
  if (v3)
  {
    v10 = v4;
    v7 = objc_msgSend_BOOLValueForEntitlement_error_(v3, v5, (uint64_t)CFSTR("com.apple.private.ClassKit.dashboard"), &v10);
    v8 = v10;

    v6 = v8;
  }
  else
  {
    v7 = 0;
  }
  byte_1ED0FB6A8 = v7;
  if (v6)
  {
    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v9 = CLSLogDefault;
    if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v13 = v6;
      _os_log_error_impl(&dword_1D4054000, v9, OS_LOG_TYPE_ERROR, "Error looking up entitlements: %{public}@", buf, 0xCu);
    }
  }

}

void sub_1D408A5F0(uint64_t a1, const char *a2)
{
  void *v2;
  void *v3;
  id v4;
  const char *v5;
  void *v6;
  char v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v11 = 0;
  objc_msgSend_entitlementsForCurrentTaskWithError_(v2, a2, (uint64_t)&v11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v11;
  v6 = v4;
  if (v3)
  {
    v10 = v4;
    v7 = objc_msgSend_BOOLValueForEntitlement_error_(v3, v5, (uint64_t)CFSTR("com.apple.private.ClassKit.internal"), &v10);
    v8 = v10;

    v6 = v8;
  }
  else
  {
    v7 = 0;
  }
  byte_1ED0FB6A9 = v7;
  if (v6)
  {
    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v9 = CLSLogDefault;
    if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v13 = v6;
      _os_log_error_impl(&dword_1D4054000, v9, OS_LOG_TYPE_ERROR, "Error looking up entitlements: %{public}@", buf, 0xCu);
    }
    byte_1ED0FB6A9 = 0;
  }

}

void sub_1D408A7AC(uint64_t a1, const char *a2)
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  id v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  char v11;
  NSObject *v12;
  char v13;
  id v14;
  const char *v15;
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  v18 = 0;
  objc_msgSend_entitlementsForCurrentTaskWithError_(v3, a2, (uint64_t)&v18);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v18;
  if (v4)
  {
    if ((objc_msgSend_isInternalProcess(*(void **)(a1 + 32), v5, v6) & 1) != 0
      || (objc_msgSend_isPrivateSearchEnabledProcess(CLSEntitlements, v8, v9) & 1) != 0)
    {
      v11 = 1;
    }
    else
    {
      v17 = v7;
      v13 = objc_msgSend_BOOLValueForEntitlement_error_(v4, v10, (uint64_t)CFSTR("com.apple.private.contacts"), &v17);
      v14 = v17;

      if ((v13 & 1) != 0)
      {
        v11 = 1;
        v7 = v14;
      }
      else
      {
        v16 = v14;
        v11 = objc_msgSend_BOOLValueForEntitlement_error_(v4, v15, (uint64_t)CFSTR("com.apple.private.contactsui"), &v16);
        v7 = v16;

      }
    }
    byte_1ED0FB6AA = v11;
  }
  if (v7)
  {
    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v12 = CLSLogDefault;
    if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v20 = v7;
      _os_log_error_impl(&dword_1D4054000, v12, OS_LOG_TYPE_ERROR, "Error looking up entitlements: %{public}@", buf, 0xCu);
    }
  }

}

void sub_1D408A9BC(uint64_t a1, const char *a2)
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  id v7;
  const char *v8;
  char v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  v13 = 0;
  objc_msgSend_entitlementsForCurrentTaskWithError_(v3, a2, (uint64_t)&v13);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v13;
  if (v4)
  {
    if ((objc_msgSend_isInternalProcess(*(void **)(a1 + 32), v5, v6) & 1) != 0)
    {
      v9 = 1;
    }
    else
    {
      v12 = v7;
      v9 = objc_msgSend_BOOLValueForEntitlement_error_(v4, v8, (uint64_t)CFSTR("com.apple.private.ClassKit.search"), &v12);
      v10 = v12;

      v7 = v10;
    }
    byte_1ED0FB6AB = v9;
  }
  if (v7)
  {
    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v11 = CLSLogDefault;
    if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v15 = v7;
      _os_log_error_impl(&dword_1D4054000, v11, OS_LOG_TYPE_ERROR, "Error looking up entitlements: %{public}@", buf, 0xCu);
    }
  }

}

void sub_1D408CADC()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)qword_1ED0FB6D0;
  qword_1ED0FB6D0 = v0;

}

void sub_1D408CB7C(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  CLSChildParentRelation *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  objc_super v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v15.receiver = *(id *)(a1 + 32);
  v15.super_class = (Class)&OBJC_METACLASS___CLSArchivedOpenResponseAnswerFormat;
  objc_msgSendSuper2(&v15, sel_relations);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED0FB6E0;
  qword_1ED0FB6E0 = v2;

  v4 = [CLSChildParentRelation alloc];
  v5 = *(_QWORD *)(a1 + 32);
  v6 = objc_opt_class();
  v8 = (void *)objc_msgSend_initWithChildEntity_parentEntity_faultable_(v4, v7, v5, v6, 1);
  v9 = (void *)qword_1ED0FB6E0;
  v16[0] = v8;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v10, (uint64_t)v16, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setByAddingObjectsFromArray_(v9, v12, (uint64_t)v11);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)qword_1ED0FB6E0;
  qword_1ED0FB6E0 = v13;

}

void sub_1D408CCFC(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  CLSParentChildRelation *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  objc_super v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v15.receiver = *(id *)(a1 + 32);
  v15.super_class = (Class)&OBJC_METACLASS___CLSGroup;
  objc_msgSendSuper2(&v15, sel_relations);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED0FB6F0;
  qword_1ED0FB6F0 = v2;

  v4 = [CLSParentChildRelation alloc];
  v5 = *(_QWORD *)(a1 + 32);
  v6 = objc_opt_class();
  v8 = (void *)objc_msgSend_initWithParentEntity_childEntity_faultable_(v4, v7, v5, v6, 1);
  v9 = (void *)qword_1ED0FB6F0;
  v16[0] = v8;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v10, (uint64_t)v16, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setByAddingObjectsFromArray_(v9, v12, (uint64_t)v11);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)qword_1ED0FB6F0;
  qword_1ED0FB6F0 = v13;

}

void sub_1D408CE7C(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  CLSChildParentRelation *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  objc_super v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v15.receiver = *(id *)(a1 + 32);
  v15.super_class = (Class)&OBJC_METACLASS___CLSSliderAnswerFormat;
  objc_msgSendSuper2(&v15, sel_relations);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED0FB700;
  qword_1ED0FB700 = v2;

  v4 = [CLSChildParentRelation alloc];
  v5 = *(_QWORD *)(a1 + 32);
  v6 = objc_opt_class();
  v8 = (void *)objc_msgSend_initWithChildEntity_parentEntity_faultable_(v4, v7, v5, v6, 1);
  v9 = (void *)qword_1ED0FB700;
  v16[0] = v8;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v10, (uint64_t)v16, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setByAddingObjectsFromArray_(v9, v12, (uint64_t)v11);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)qword_1ED0FB700;
  qword_1ED0FB700 = v13;

}

__CFString *NSStringFromCLSSurveyStepType(uint64_t a1, const char *a2)
{
  __CFString *v2;

  if (a1)
  {
    v2 = CFSTR("Question");
  }
  else
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("Unknown survey step type: '%ld'"), 0);
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

uint64_t CLSSurveyStepTypeFromString(void *a1)
{
  id v1;
  const char *v2;
  void *v3;
  uint64_t v5;
  const char *v6;
  id v7;

  v1 = a1;
  v3 = v1;
  if (!v1 || !objc_msgSend_isEqualToString_(v1, v2, (uint64_t)CFSTR("Question")))
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v2, (uint64_t)CFSTR("Unknown survey step type: '%@'"), v3);
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E0C99DA0], v6, *MEMORY[0x1E0C99778], v5, 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v7);
  }

  return 1;
}

void sub_1D408D3EC(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v3;
  void *v4;

  v3 = objc_msgSend_newDatastore(*(void **)(a1 + 32), a2, a3);
  v4 = (void *)qword_1ED0FB718;
  qword_1ED0FB718 = v3;

}

void sub_1D408D474(uint64_t a1, const char *a2)
{
  void *v2;
  const char *v3;
  uint64_t v4;
  id v5;
  NSObject *v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint8_t v12[8];
  id v13;

  v13 = 0;
  objc_msgSend_entitlementsForCurrentTaskWithError_(CLSEntitlements, a2, (uint64_t)&v13);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v13;
  if (v5)
  {
    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v6 = CLSLogDefault;
    if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1D4054000, v6, OS_LOG_TYPE_INFO, "failed to read entitlements.", v12, 2u);
    }
  }
  objc_msgSend_applicationBundleIdentifier(v2, v3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7;
  if (v7)
  {
    LODWORD(v7) = objc_msgSend_isEqualToString_(v7, v8, (uint64_t)CFSTR("com.apple.ClassKit.pdtool"));
    if ((_DWORD)v7)
      LOBYTE(v7) = objc_msgSend_isInternal(v2, v10, v11);
  }
  byte_1ED0FB710 = (char)v7;

}

void sub_1D408DAE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D408DB18(uint64_t a1)
{
  id WeakRetained;
  const char *v2;
  uint64_t v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend__connectionInterupted(WeakRetained, v2, v3);
    WeakRetained = v4;
  }

}

void sub_1D408DB48(uint64_t a1)
{
  id WeakRetained;
  const char *v2;
  uint64_t v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend__connectionConnected(WeakRetained, v2, v3);
    WeakRetained = v4;
  }

}

void sub_1D408DC54(uint64_t a1, const char *a2)
{
  void *v2;
  const char *v3;
  uint64_t v4;
  id v5;
  NSObject *v6;
  uint8_t v7[8];
  id v8;

  v8 = 0;
  objc_msgSend_entitlementsForCurrentTaskWithError_(CLSEntitlements, a2, (uint64_t)&v8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;
  if (v5)
  {
    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v6 = CLSLogDefault;
    if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1D4054000, v6, OS_LOG_TYPE_INFO, "failed to read entitlements.", v7, 2u);
    }
  }
  byte_1ED0FB711 = objc_msgSend_isDashboardAPIEnabled(v2, v3, v4);

}

void sub_1D408DD6C(uint64_t a1, const char *a2)
{
  void *v2;
  const char *v3;
  uint64_t v4;
  id v5;
  NSObject *v6;
  uint8_t v7[8];
  id v8;

  v8 = 0;
  objc_msgSend_entitlementsForCurrentTaskWithError_(CLSEntitlements, a2, (uint64_t)&v8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;
  if (v5)
  {
    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v6 = CLSLogDefault;
    if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1D4054000, v6, OS_LOG_TYPE_INFO, "failed to read entitlements.", v7, 2u);
    }
  }
  byte_1ED0FB712 = objc_msgSend_isPrivateSearchAPIEnabled(v2, v3, v4);

}

void sub_1D408DE84(uint64_t a1, const char *a2)
{
  void *v2;
  const char *v3;
  uint64_t v4;
  id v5;
  NSObject *v6;
  uint8_t v7[8];
  id v8;

  v8 = 0;
  objc_msgSend_entitlementsForCurrentTaskWithError_(CLSEntitlements, a2, (uint64_t)&v8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;
  if (v5)
  {
    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v6 = CLSLogDefault;
    if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1D4054000, v6, OS_LOG_TYPE_INFO, "failed to read entitlements.", v7, 2u);
    }
  }
  byte_1ED0FB713 = objc_msgSend_isSearchAPIEnabled(v2, v3, v4);

}

void sub_1D408E01C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D408E040(uint64_t a1)
{
  id WeakRetained;
  const char *v2;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  uint8_t v8[16];
  uint8_t buf[16];
  uint8_t v10[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend_setCachedCurrentUser_(WeakRetained, v2, 0);
    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v4 = CLSLogDefault;
    if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D4054000, v4, OS_LOG_TYPE_DEFAULT, "Received notification 'CLSAccountChangedDarwinNotificationName'", buf, 2u);
      if (qword_1ED0FB9A0 != -1)
        dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    }
    v5 = CLSLogDefault;
    if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1D4054000, v5, OS_LOG_TYPE_DEFAULT, "Refreshing CLSCurrentUser", v8, 2u);
    }
    objc_msgSend_currentUserWithCompletion_(v3, v6, (uint64_t)&unk_1E974AB38);
  }
  else
  {
    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v7 = CLSLogDefault;
    if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1D4054000, v7, OS_LOG_TYPE_DEFAULT, "CLSDataStore object was released during _registerForAccountChangedDarwinNotification", v10, 2u);
    }
  }

}

void sub_1D408E1D4(uint64_t a1, void *a2, void *a3)
{
  id v4;
  const char *v5;
  id v6;
  void *v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  NSObject *v15;
  int v16;
  id v17;
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v6 = a3;
  if (v4)
  {
    v18 = CFSTR("CLSCurrentUserInfoKey");
    v19[0] = v4;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v5, (uint64_t)v19, &v18, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  if (qword_1ED0FB9A0 != -1)
    dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
  v8 = CLSLogDefault;
  if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v16) = 0;
    _os_log_impl(&dword_1D4054000, v8, OS_LOG_TYPE_DEFAULT, "Posting notification 'CLSCurrentUserDidChangeNotificationName'", (uint8_t *)&v16, 2u);
  }
  objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_postNotificationName_object_userInfo_(v11, v12, (uint64_t)CFSTR("CLSCurrentUserDidChangeNotificationName"), 0, v7);

  if (v6 && objc_msgSend_code(v6, v13, v14) != 4099)
  {
    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v15 = CLSLogDefault;
    if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_INFO))
    {
      v16 = 138543362;
      v17 = v6;
      _os_log_impl(&dword_1D4054000, v15, OS_LOG_TYPE_INFO, "Failed to get currentUserWithCompletion, error: %{public}@", (uint8_t *)&v16, 0xCu);
    }
  }

}

void sub_1D408E670(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  const char *v4;
  uint64_t v5;
  void (**v6)(id, _QWORD, id);

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend_completion(v2, v4, v5);
  v6 = (void (**)(id, _QWORD, id))objc_claimAutoreleasedReturnValue();
  v6[2](v6, 0, v3);

}

uint64_t sub_1D408E998(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void sub_1D408E9C8(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  const char *v4;
  uint64_t v5;
  void (**v6)(id, _QWORD, id);

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend_completion(v2, v4, v5);
  v6 = (void (**)(id, _QWORD, id))objc_claimAutoreleasedReturnValue();
  v6[2](v6, 0, v3);

}

uint64_t sub_1D408EAA8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_1D408EB48(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_1D408EC04(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id sub_1D408EEFC(uint64_t a1, const char *a2)
{
  return (id)objc_msgSend_addObject_(*(void **)(a1 + 32), a2, (uint64_t)a2);
}

uint64_t sub_1D408EFEC(uint64_t a1, void *a2)
{
  return objc_msgSend_cls_debug_(a2, (const char *)a2, CLSLogDefault);
}

uint64_t sub_1D408F000(uint64_t a1, const char *a2, uint64_t a3)
{
  if (!a2 || a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return objc_msgSend_mergeWithObject_(*(void **)(a1 + 32), a2, (uint64_t)a2);
}

void sub_1D408F1D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1D408F1F4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1D408F204(uint64_t a1)
{

}

void sub_1D408F20C(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void sub_1D408F514(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D408F52C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v7 = CLSLogDatabase;
    if (os_log_type_enabled((os_log_t)CLSLogDatabase, OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v11 = 138543618;
      v12 = v10;
      v13 = 2114;
      v14 = v6;
      _os_log_error_impl(&dword_1D4054000, v7, OS_LOG_TYPE_ERROR, "Failed to fetch contexts for objectIDs '%{public}@' with error: %{public}@", (uint8_t *)&v11, 0x16u);
    }
  }
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v5;

}

void sub_1D408F73C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D408F754(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void sub_1D408F818(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v6 = (void *)CLSLogDatabase;
    if (os_log_type_enabled((os_log_t)CLSLogDatabase, OS_LOG_TYPE_ERROR))
    {
      v7 = *(void **)(a1 + 32);
      v8 = v6;
      objc_msgSend_objectID(v7, v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v11;
      v14 = 2114;
      v15 = v5;
      _os_log_error_impl(&dword_1D4054000, v8, OS_LOG_TYPE_ERROR, "Failed to delete thumbnail blob for CLSContext.objectID '%{public}@' with error: %{public}@", (uint8_t *)&v12, 0x16u);

    }
  }

}

void sub_1D408FA10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D408FA28(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void sub_1D408FAD0(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v6 = CLSLogDatabase;
    if (os_log_type_enabled((os_log_t)CLSLogDatabase, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138543618;
      v9 = v7;
      v10 = 2114;
      v11 = v5;
      _os_log_error_impl(&dword_1D4054000, v6, OS_LOG_TYPE_ERROR, "Failed to delete progress reporting capabilities for CLSContext.objectID '%{public}@' with error: %{public}@", (uint8_t *)&v8, 0x16u);
    }
  }

}

void sub_1D408FC64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D408FC7C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  const char *v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend_unsignedIntegerValue(a2, v6, v7);
  if (v5)
  {
    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v8 = CLSLogDatabase;
    if (os_log_type_enabled((os_log_t)CLSLogDatabase, OS_LOG_TYPE_ERROR))
    {
      v9 = 138543362;
      v10 = v5;
      _os_log_error_impl(&dword_1D4054000, v8, OS_LOG_TYPE_ERROR, "Failed to get server sync status. Error: %{public}@", (uint8_t *)&v9, 0xCu);
    }
  }

}

void sub_1D408FEE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D408FF18(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  const char *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  const char *v12;
  void *v13;
  const char *v14;
  const char *v15;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  const char *v20;
  void *v21;
  const char *v22;
  const char *v23;
  void *v24;
  const char *v25;
  int v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v7 = a3;
  if (v7)
  {
    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v8 = CLSLogDatabase;
    if (os_log_type_enabled((os_log_t)CLSLogDatabase, OS_LOG_TYPE_ERROR))
    {
      v26 = 138543362;
      v27 = v7;
      _os_log_error_impl(&dword_1D4054000, v8, OS_LOG_TYPE_ERROR, "Failed to get server internal status.  Error: %{public}@", (uint8_t *)&v26, 0xCu);
    }
    objc_storeStrong((id *)(*(_QWORD *)(a1[4] + 8) + 40), a3);
  }
  else
  {
    v9 = a1[6];
    if ((v9 & 1) != 0)
    {
      objc_msgSend_objectForKeyedSubscript_(v5, v6, (uint64_t)CFSTR("initialRosterSyncDate"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(*(void **)(*(_QWORD *)(a1[5] + 8) + 40), v11, (uint64_t)v10, CFSTR("initialRosterSyncDate"));

      objc_msgSend_objectForKeyedSubscript_(v5, v12, (uint64_t)CFSTR("latestRosterSyncDate"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(*(void **)(*(_QWORD *)(a1[5] + 8) + 40), v14, (uint64_t)v13, CFSTR("latestRosterSyncDate"));

      objc_msgSend_objectForKeyedSubscript_(v5, v15, (uint64_t)CFSTR("latestRosterSyncFailureDate"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(*(void **)(*(_QWORD *)(a1[5] + 8) + 40), v17, (uint64_t)v16, CFSTR("latestRosterSyncFailureDate"));

      v9 = a1[6];
    }
    if ((v9 & 2) != 0)
    {
      objc_msgSend_objectForKeyedSubscript_(v5, v6, (uint64_t)CFSTR("initialHandoutSyncDate"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(*(void **)(*(_QWORD *)(a1[5] + 8) + 40), v19, (uint64_t)v18, CFSTR("initialHandoutSyncDate"));

      objc_msgSend_objectForKeyedSubscript_(v5, v20, (uint64_t)CFSTR("latestHandoutSyncDate"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(*(void **)(*(_QWORD *)(a1[5] + 8) + 40), v22, (uint64_t)v21, CFSTR("latestHandoutSyncDate"));

      objc_msgSend_objectForKeyedSubscript_(v5, v23, (uint64_t)CFSTR("latestHandoutSyncFailureDate"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(*(void **)(*(_QWORD *)(a1[5] + 8) + 40), v25, (uint64_t)v24, CFSTR("latestHandoutSyncFailureDate"));

    }
  }

}

void sub_1D4090474(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D40904A8(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  _BYTE *WeakRetained;
  const char *v8;
  uint64_t v9;
  _BYTE *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  NSObject *v14;
  _DWORD v15[2];
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (qword_1ED0FB9A0 != -1)
    dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
  v6 = CLSLogDefault;
  if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_DEBUG))
  {
    v15[0] = 67109378;
    v15[1] = a2;
    v16 = 2112;
    v17 = v5;
    _os_log_debug_impl(&dword_1D4054000, v6, OS_LOG_TYPE_DEBUG, "CLSDataStore completeAllAssignedActivitiesMatching complete: %d, error: %@", (uint8_t *)v15, 0x12u);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v10 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend_lock(WeakRetained, v8, v9);
    v10[56] = 0;
    objc_msgSend_unlock(v10, v11, v12);
    objc_msgSend_saveWithCompletion_(v10, v13, (uint64_t)&unk_1E974AD40);
  }
  else
  {
    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v14 = CLSLogDefault;
    if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15[0]) = 0;
      _os_log_impl(&dword_1D4054000, v14, OS_LOG_TYPE_DEFAULT, "CLSDataStore object was released during fetchAndCompleteAllAssignedActivitiesForContextPath:withCompletion.", (uint8_t *)v15, 2u);
    }
  }

}

uint64_t sub_1D4090790(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_1D4090968(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  void *v5;
  const char *v6;
  CLSActivity *v7;
  uint64_t v8;
  const char *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  if (!a2 || a3)
  {
    v7 = [CLSActivity alloc];
    v8 = objc_opt_class();
    v10 = (id)objc_msgSend__initWithTargetClass_(v7, v9, v8);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend_objectID(a2, (const char *)a2, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_1D4090A5C;
    v11[3] = &unk_1E974AD90;
    v12 = *(id *)(a1 + 40);
    objc_msgSend_fetchAssignedItemFor_completion_(v4, v6, (uint64_t)v5, v11);

  }
}

void sub_1D4090A5C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  const char *v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  CLSActivity *v12;
  uint64_t v13;
  const char *v14;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v8 = a3;
  if (v8)
  {
    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v9 = CLSLogDefault;
    if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_DEBUG))
    {
      v15 = 138412290;
      v16 = v8;
      _os_log_debug_impl(&dword_1D4054000, v9, OS_LOG_TYPE_DEBUG, "CLSDataStore fetchAssignedItemFor error: %@", (uint8_t *)&v15, 0xCu);
      if (v5)
        goto LABEL_6;
LABEL_8:
      v12 = [CLSActivity alloc];
      v13 = objc_opt_class();
      v11 = (void *)objc_msgSend__initWithTargetClass_(v12, v14, v13);
      (*(void (**)(_QWORD, void *, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v11, 0);
      goto LABEL_9;
    }
  }
  if (!v5)
    goto LABEL_8;
LABEL_6:
  v10 = *(_QWORD *)(a1 + 32);
  objc_msgSend_currentActivity(v5, v6, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id))(v10 + 16))(v10, v11, v8);
LABEL_9:

}

void sub_1D4090D88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_1D4090DAC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_1D4090DC0(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  const char *v7;
  id WeakRetained;
  CLSFaultProcessor *v9;
  const char *v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  uint64_t *v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  _QWORD v31[5];
  id v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    if (WeakRetained)
    {
      v31[0] = 0;
      v31[1] = v31;
      v31[2] = 0x3032000000;
      v31[3] = sub_1D408F1F4;
      v31[4] = sub_1D408F204;
      v32 = 0;
      v25 = 0;
      v26 = &v25;
      v27 = 0x3032000000;
      v28 = sub_1D408F1F4;
      v29 = sub_1D408F204;
      v9 = [CLSFaultProcessor alloc];
      v30 = (id)objc_msgSend_initWithDelegate_(v9, v10, (uint64_t)WeakRetained);
      v11 = (void *)v26[5];
      v33[0] = v5;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v12, (uint64_t)v33, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_faultObjects_(v11, v14, (uint64_t)v13);

      v15 = (void *)v26[5];
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = sub_1D4091030;
      v19[3] = &unk_1E974AE08;
      v23 = &v25;
      v19[4] = WeakRetained;
      v20 = v5;
      v24 = v31;
      v21 = v6;
      v22 = *(id *)(a1 + 32);
      objc_msgSend_completionNotify_(v15, v16, (uint64_t)v19);

      _Block_object_dispose(&v25, 8);
      _Block_object_dispose(v31, 8);

    }
    else
    {
      objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E0CB35C8], v7, 100, CFSTR("CLSDataStore object was released during remote_fetchHandoutAttachmentForDocumentURL:withCompletion."));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_cls_log_(v17, v18, CLSLogDefault);
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

    }
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void sub_1D4090FFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D4091030(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  uint64_t v12;

  v2 = *(_QWORD *)(a1[8] + 8);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[2] = sub_1D40910E0;
  v10[3] = &unk_1E974ADE0;
  v3 = (void *)a1[5];
  v10[4] = a1[4];
  v4 = *(void **)(v2 + 40);
  v10[1] = 3221225472;
  v5 = v3;
  v6 = a1[9];
  v11 = v5;
  v12 = v6;
  objc_msgSend_enumerate_(v4, v7, (uint64_t)v10);
  v8 = *(_QWORD *)(a1[8] + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = 0;

  (*(void (**)(void))(a1[7] + 16))();
}

void sub_1D40910E0(uint64_t a1, const char *a2)
{
  void *v2;
  char isKindOfClass;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  int isEqualToString;
  id obj;

  objc_msgSend_addObject_(*(void **)(a1 + 32), a2, (uint64_t)a2);
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v6 = obj;
  if ((isKindOfClass & 1) == 0)
    goto LABEL_16;
  objc_msgSend_objectID(obj, (const char *)obj, v5);
  v7 = objc_claimAutoreleasedReturnValue();
  v9 = obj;
  v10 = (void *)v7;
  if (!v7)
  {
    objc_msgSend_objectID(*(void **)(a1 + 40), (const char *)obj, v8);
    v11 = objc_claimAutoreleasedReturnValue();
    v9 = obj;
    v2 = (void *)v11;
    if (!v11)
      goto LABEL_14;
  }
  objc_msgSend_objectID(v9, (const char *)v9, v8);
  v12 = objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
LABEL_10:
    if (v10)

    else
    goto LABEL_15;
  }
  v15 = (void *)v12;
  objc_msgSend_objectID(*(void **)(a1 + 40), v13, v14);
  v16 = objc_claimAutoreleasedReturnValue();
  if (!v16)
  {

    goto LABEL_10;
  }
  v19 = (void *)v16;
  objc_msgSend_objectID(obj, v17, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectID(*(void **)(a1 + 40), v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v20, v24, (uint64_t)v23);

  if (v10)
  {

    v6 = obj;
    if (!isEqualToString)
      goto LABEL_16;
    goto LABEL_14;
  }

  v6 = obj;
  if ((isEqualToString & 1) != 0)
  {
LABEL_14:
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), obj);
LABEL_15:
    v6 = obj;
  }
LABEL_16:

}

void sub_1D4091350(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D4091364(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  if (*(_QWORD *)(a1 + 32))
  {
    clsNotificationQueue();
    v4 = objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = sub_1D4091410;
    v5[3] = &unk_1E974A088;
    v7 = *(id *)(a1 + 32);
    v6 = v3;
    dispatch_async(v4, v5);

  }
}

uint64_t sub_1D4091410(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void sub_1D4091420(uint64_t a1)
{
  _QWORD *WeakRetained;
  const char *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  _QWORD *v16;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v16 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend_lock(WeakRetained, v3, v4);
    v5 = (void *)v16[6];
    v6 = (void *)MEMORY[0x1D82575D0](*(_QWORD *)(a1 + 40));
    objc_msgSend_addObject_(v5, v7, (uint64_t)v6);

    objc_msgSend_unlock(v16, v8, v9);
    objc_msgSend__generatePartialTimeIntervalsForRunningActivities(v16, v10, v11);
    objc_msgSend__save(v16, v12, v13);
  }
  else
  {
    objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E0CB35C8], v3, 100, CFSTR("CLSDataStore object was released during saveWithCompletion:completion."));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_cls_log_(v14, v15, CLSLogDefault);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

void sub_1D40916E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D409170C(uint64_t a1)
{
  _BYTE *WeakRetained;
  const char *v3;
  uint64_t v4;
  _BYTE *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  NSObject *v10;
  uint8_t v11[16];

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend_lock(WeakRetained, v3, v4);
    v5[56] = 0;
    objc_msgSend_unlock(v5, v6, v7);
    objc_msgSend__save(v5, v8, v9);
  }
  else
  {
    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v10 = CLSLogDefault;
    if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1D4054000, v10, OS_LOG_TYPE_DEFAULT, "CLSDataStore object was released during _save.", v11, 2u);
    }
  }

}

void sub_1D4091918(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1D409193C(uint64_t a1, void *a2, uint64_t a3)
{
  id *WeakRetained;
  const char *v7;
  uint64_t v8;
  id *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  id v14;

  v14 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
    v9 = WeakRetained;
    if (WeakRetained)
    {
      objc_msgSend_lock(WeakRetained, v7, v8);
      objc_storeStrong(v9 + 8, a2);
      objc_msgSend_unlock(v9, v10, v11);
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
    else
    {
      objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E0CB35C8], v7, 100, CFSTR("CLSDataStore object was released during refreshAuthTreeWithCompletion:."));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_cls_log_(v12, v13, CLSLogDefault);
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

    }
  }

}

void sub_1D4091AFC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1D4091B20(uint64_t a1, void *a2, uint64_t a3)
{
  id *WeakRetained;
  const char *v7;
  uint64_t v8;
  id *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  id v14;

  v14 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
    v9 = WeakRetained;
    if (WeakRetained)
    {
      objc_msgSend_lock(WeakRetained, v7, v8);
      objc_storeStrong(v9 + 9, a2);
      objc_msgSend_unlock(v9, v10, v11);
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
    else
    {
      objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E0CB35C8], v7, 100, CFSTR("CLSDataStore object was released during refreshAuthTreeForAttachment:withCompletion:."));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_cls_log_(v12, v13, CLSLogDefault);
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

    }
  }

}

void sub_1D4091CD8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1D4091CF4(uint64_t a1, uint64_t a2)
{
  const char *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    if (WeakRetained)
    {
      v5 = (void *)objc_opt_new();
      CLSProgressClasses();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 0u;
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      v7 = *(id *)(a1 + 32);
      v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v30, v34, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v31;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v31 != v11)
              objc_enumerationMutation(v7);
            v13 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
            v14 = objc_opt_class();
            if (objc_msgSend_containsObject_(v6, v15, v14, (_QWORD)v30)
              && !objc_msgSend_isDeleted(v13, v16, v17)
              && objc_msgSend_effectiveAuthorizationStatus(v13, v16, v18) == 2)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                objc_msgSend_lock(v13, v19, v20);
                objc_msgSend_setModified_(v13, v21, 0);
                objc_msgSend_unlock(v13, v22, v23);
              }
            }
            else
            {
              objc_msgSend_addObject_(v5, v16, (uint64_t)v13);
            }
          }
          v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v19, (uint64_t)&v30, v34, 16);
        }
        while (v10);
      }

      v26 = objc_msgSend_count(v5, v24, v25);
      v28 = *(_QWORD *)(a1 + 40);
      if (v26)
        objc_msgSend__saveObjects_completion_(WeakRetained, v27, (uint64_t)v5, v28);
      else
        (*(void (**)(_QWORD, _QWORD))(v28 + 16))(*(_QWORD *)(a1 + 40), 0);

    }
    else
    {
      objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E0CB35C8], v3, 100, CFSTR("CLSDataStore object was released during saveObjects:completion:."));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_cls_log_(v5, v29, CLSLogDefault);
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }

  }
}

void sub_1D40922A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a37, 8);
  objc_destroyWeak(location);
  _Unwind_Resume(a1);
}

void sub_1D40922FC(uint64_t a1, uint64_t a2)
{
  objc_moveWeak((id *)(a1 + 40), (id *)(a2 + 40));
}

void sub_1D4092308(uint64_t a1)
{
  objc_destroyWeak((id *)(a1 + 40));
}

void sub_1D4092310(uint64_t a1, void *a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  id *WeakRetained;
  const char *v35;
  uint64_t v36;
  id *v37;
  id v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t j;
  void *v45;
  void *v46;
  uint64_t v47;
  const char *v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  int v52;
  const char *v53;
  uint64_t v54;
  int v55;
  const char *v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  int v60;
  const char *v61;
  const char *v62;
  uint64_t v63;
  const char *v64;
  const char *v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  const char *v70;
  const char *v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  id *v80;
  id v81;
  id v82;
  id obj;
  uint64_t v84;
  void *v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  _BYTE v94[128];
  _BYTE v95[128];
  uint64_t v96;

  v96 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v85 = (void *)objc_opt_new();
  if (v3)
  {
    v6 = a1;
    objc_msgSend_userInfo(v3, v4, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v7, v8, (uint64_t)CFSTR("CLSErrorUnderlyingErrorsKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v92 = 0u;
    v93 = 0u;
    v90 = 0u;
    v91 = 0u;
    v10 = v9;
    v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v90, v95, 16);
    if (v12)
    {
      v15 = v12;
      v16 = *(_QWORD *)v91;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v91 != v16)
            objc_enumerationMutation(v10);
          objc_msgSend_userInfo(*(void **)(*((_QWORD *)&v90 + 1) + 8 * i), v13, v14);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v18, v19, (uint64_t)CFSTR("CLSErrorObjectKey"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectID(v20, v21, v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (v23)
            objc_msgSend_addObject_(v85, v24, (uint64_t)v23);

        }
        v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v90, v95, 16);
      }
      while (v15);
    }

    objc_msgSend_userInfo(v3, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v27, v28, (uint64_t)CFSTR("CLSErrorObjectKey"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectID(v29, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
      objc_msgSend_addObject_(v85, v33, (uint64_t)v32);

    a1 = v6;
  }
  WeakRetained = (id *)objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  v37 = WeakRetained;
  if (WeakRetained)
  {
    v81 = v3;
    objc_msgSend_lock(WeakRetained, v35, v36);
    v82 = v37[2];
    v80 = v37;
    v38 = v37[3];
    v86 = 0u;
    v87 = 0u;
    v88 = 0u;
    v89 = 0u;
    obj = *(id *)(a1 + 32);
    v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v39, (uint64_t)&v86, v94, 16);
    if (v40)
    {
      v43 = v40;
      v84 = *(_QWORD *)v87;
      do
      {
        for (j = 0; j != v43; ++j)
        {
          if (*(_QWORD *)v87 != v84)
            objc_enumerationMutation(obj);
          v45 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * j);
          objc_msgSend_objectID(v45, v41, v42, v80);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = a1;
          objc_msgSend_objectForKeyedSubscript_(*(void **)(a1 + 40), v48, (uint64_t)v46);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = objc_msgSend_intValue(v49, v50, v51);

          v55 = objc_msgSend_generation(v45, v53, v54);
          objc_msgSend_objectForKeyedSubscript_(v38, v56, (uint64_t)v46);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v60 = objc_msgSend_intValue(v57, v58, v59);

          if (v60 == v52)
            objc_msgSend_removeObjectForKey_(v38, v61, (uint64_t)v46);
          if (objc_msgSend_containsObject_(v85, v61, (uint64_t)v46))
          {
            objc_msgSend_removeObjectForKey_(v38, v62, (uint64_t)v46);
          }
          else
          {
            if (objc_msgSend_isDeleted(v45, v62, v63))
              objc_msgSend_removeObjectForKey_(v82, v64, (uint64_t)v46);
            objc_msgSend_savedObjectWithObjectID_(*(void **)(*(_QWORD *)(*(_QWORD *)(v47 + 64) + 8) + 40), v64, (uint64_t)v46);
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            if (v67)
            {
              objc_msgSend_mergeWithObject_(v45, v65, (uint64_t)v67);
              objc_msgSend_didSaveObject(v45, v68, v69);
            }
            if (v52 == v55)
            {
              objc_msgSend_lock(v45, v65, v66);
              objc_msgSend_setModified_(v45, v70, 0);
              objc_msgSend_unlock(v45, v71, v72);
            }

          }
          a1 = v47;

        }
        v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v41, (uint64_t)&v86, v94, 16);
      }
      while (v43);
    }

    v37 = v80;
    objc_msgSend_unlock(v80, v73, v74);
    v3 = v81;
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v75 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v76 = *(void **)(v75 + 40);
    *(_QWORD *)(v75 + 40) = 0;

    v77 = v82;
  }
  else
  {
    objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E0CB35C8], v35, 100, CFSTR("CLSDataStore object was released during _saveObjects:completion:."));
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_cls_log_(v77, v78, CLSLogDefault);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v79 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v38 = *(id *)(v79 + 40);
    *(_QWORD *)(v79 + 40) = 0;
  }

}

uint64_t sub_1D4092D18(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

uint64_t sub_1D4092E50(uint64_t a1, void *a2)
{
  id v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  char v6;

  v2 = a2;
  objc_msgSend_parentObjectID(v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    v6 = objc_opt_isKindOfClass() | (v5 == 0);
  }

  return v6 & 1;
}

void sub_1D4092EEC(uint64_t a1, void *a2)
{
  const char *v3;
  uint64_t v4;
  const char *v5;
  id v6;

  v6 = a2;
  if (objc_msgSend_isModified(v6, v3, v4))
    objc_msgSend_addObject_(*(void **)(a1 + 32), v5, (uint64_t)v6);

}

uint64_t sub_1D4093638(uint64_t a1, const char *a2)
{
  return objc_msgSend_addObject_(*(void **)(a1 + 32), a2, (uint64_t)a2);
}

uint64_t sub_1D4093D58(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_1D4094150(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24)
{
  _Block_object_dispose(&a24, 8);
  objc_destroyWeak(location);
  _Unwind_Resume(a1);
}

void sub_1D4094178(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  dispatch_get_global_queue(25, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D4094248;
  block[3] = &unk_1E9749E10;
  v8 = *(id *)(a1 + 32);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t sub_1D4094248(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t sub_1D409425C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_1D4094270(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  const char *v7;
  id WeakRetained;
  CLSFaultProcessor *v9;
  const char *v10;
  const char *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40));
  if (WeakRetained)
  {
    v29 = 0;
    v30 = &v29;
    v31 = 0x3032000000;
    v32 = sub_1D408F1F4;
    v33 = sub_1D408F204;
    v9 = [CLSFaultProcessor alloc];
    v34 = (id)objc_msgSend_initWithDelegate_(v9, v10, (uint64_t)WeakRetained);
    objc_msgSend_faultObjects_((void *)v30[5], v11, (uint64_t)v5);
    v12 = (void *)v30[5];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = sub_1D4094474;
    v19[3] = &unk_1E974B010;
    v28 = &v29;
    v19[4] = WeakRetained;
    v20 = *(id *)(a1 + 32);
    v21 = *(id *)(a1 + 40);
    v22 = *(id *)(a1 + 48);
    v13 = v5;
    v14 = *(_QWORD *)(a1 + 56);
    v15 = *(void **)(a1 + 64);
    v23 = v13;
    v24 = v14;
    v25 = v15;
    v27 = *(id *)(a1 + 80);
    v26 = *(id *)(a1 + 72);
    objc_msgSend_completionNotify_(v12, v16, (uint64_t)v19);

    _Block_object_dispose(&v29, 8);
  }
  else
  {
    objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E0CB35C8], v7, 100, CFSTR("CLSDataStore object was released during remote_contextsMatchingIdentifierPath:parentContextID:completion:."));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_cls_log_(v17, v18, CLSLogDefault);
    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();

  }
}

void sub_1D409445C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1D4094474(uint64_t a1, const char *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  const char *v16;
  void *v17;
  id v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  void *v22;
  id v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  char v35;
  const char *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  id v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  void *v64;
  id v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  void *v76;
  const char *v77;
  const char *v78;
  const char *v79;
  const char *v80;
  const char *v81;
  void *v82;
  void *v83;
  const char *v84;
  void *v85;
  id v86;
  id obj;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  _QWORD v91[4];
  id v92;
  id v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  _QWORD v106[5];
  _BYTE v107[128];
  _BYTE v108[128];
  _BYTE v109[128];
  uint64_t v110;

  v110 = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40);
  v106[0] = MEMORY[0x1E0C809B0];
  v106[1] = 3221225472;
  v106[2] = sub_1D40949D4;
  v106[3] = &unk_1E974A630;
  v106[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend_enumerate_(v3, a2, (uint64_t)v106);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

  objc_msgSend_lock(*(void **)(a1 + 32), v6, v7);
  v8 = *(id *)(a1 + 40);
  v102 = 0u;
  v103 = 0u;
  v104 = 0u;
  v105 = 0u;
  v9 = *(id *)(a1 + 48);
  v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v102, v109, 16);
  if (v11)
  {
    v13 = v11;
    v14 = *(_QWORD *)v103;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v103 != v14)
          objc_enumerationMutation(v9);
        objc_msgSend_childContextWithIdentifier_(v8, v12, *(_QWORD *)(*((_QWORD *)&v102 + 1) + 8 * i));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          objc_msgSend_addObject_(*(void **)(a1 + 56), v16, (uint64_t)v17);
          v18 = v17;

          v8 = v18;
        }

      }
      v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v102, v109, 16);
    }
    while (v13);
  }

  objc_msgSend_unlock(*(void **)(a1 + 32), v19, v20);
  objc_msgSend_valueForKey_(*(void **)(a1 + 56), v21, (uint64_t)CFSTR("objectID"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = 0u;
  v99 = 0u;
  v100 = 0u;
  v101 = 0u;
  v23 = *(id *)(a1 + 64);
  v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v98, v108, 16);
  if (v25)
  {
    v27 = v25;
    v28 = *(_QWORD *)v99;
    do
    {
      for (j = 0; j != v27; ++j)
      {
        if (*(_QWORD *)v99 != v28)
          objc_enumerationMutation(v23);
        objc_msgSend_addObject_(*(void **)(a1 + 72), v26, *(_QWORD *)(*((_QWORD *)&v98 + 1) + 8 * j));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectID(v30, v31, v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend_containsObject_(v22, v34, (uint64_t)v33);

        if ((v35 & 1) == 0)
          objc_msgSend_addObject_(*(void **)(a1 + 56), v36, (uint64_t)v30);

      }
      v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v26, (uint64_t)&v98, v108, 16);
    }
    while (v27);
  }

  v39 = objc_msgSend_count(*(void **)(a1 + 56), v37, v38);
  if (v39 != objc_msgSend_count(*(void **)(a1 + 80), v40, v41)
    && *(_QWORD *)(a1 + 88)
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    if (objc_msgSend_count(*(void **)(a1 + 56), v42, v43))
    {
      objc_msgSend_lastObject(*(void **)(a1 + 56), v44, v45);
      v46 = (id)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend_count(*(void **)(a1 + 56), v47, v48);
      objc_msgSend_subarrayWithRange_(*(void **)(a1 + 80), v50, 0, v49);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v86 = (id)objc_msgSend_mutableCopy(v51, v52, v53);

    }
    else
    {
      v46 = *(id *)(a1 + 40);
      v86 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    }
    v56 = objc_msgSend_count(*(void **)(a1 + 56), v54, v55);
    v59 = objc_msgSend_count(*(void **)(a1 + 80), v57, v58);
    v62 = objc_msgSend_count(*(void **)(a1 + 56), v60, v61);
    objc_msgSend_subarrayWithRange_(*(void **)(a1 + 80), v63, v56, v59 - v62);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = (void *)objc_opt_new();
    v94 = 0u;
    v95 = 0u;
    v96 = 0u;
    v97 = 0u;
    v65 = v64;
    v89 = objc_msgSend_countByEnumeratingWithState_objects_count_(v65, v66, (uint64_t)&v94, v107, 16);
    if (v89)
    {
      obj = v65;
      v88 = *(_QWORD *)v95;
      while (2)
      {
        v67 = 0;
        v68 = v46;
        do
        {
          if (*(_QWORD *)v95 != v88)
            objc_enumerationMutation(obj);
          v69 = *(_QWORD *)(*((_QWORD *)&v94 + 1) + 8 * v67);
          v70 = (void *)MEMORY[0x1D82573E4]();
          v71 = *(void **)(a1 + 88);
          v74 = (void *)objc_msgSend_copy(v86, v72, v73);
          objc_msgSend_createContextForIdentifier_parentContext_parentIdentifierPath_(v71, v75, v69, v68, v74);
          v76 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v76)
          {
            (*(void (**)(void))(*(_QWORD *)(a1 + 96) + 16))();
            objc_autoreleasePoolPop(v70);
            v65 = obj;
            v85 = obj;
            v83 = v90;
            goto LABEL_37;
          }
          objc_msgSend_addObject_(v90, v77, (uint64_t)v76);
          objc_msgSend_addChildContext_(v68, v78, (uint64_t)v76);
          v46 = v76;

          objc_msgSend_addObject_(v86, v79, v69);
          objc_msgSend_addObject_(*(void **)(a1 + 56), v80, (uint64_t)v46);

          objc_autoreleasePoolPop(v70);
          ++v67;
          v68 = v46;
        }
        while (v89 != v67);
        v65 = obj;
        v89 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v81, (uint64_t)&v94, v107, 16);
        if (v89)
          continue;
        break;
      }
    }

    v82 = *(void **)(a1 + 32);
    v91[0] = MEMORY[0x1E0C809B0];
    v91[1] = 3221225472;
    v91[2] = sub_1D40949F8;
    v91[3] = &unk_1E974A848;
    v93 = *(id *)(a1 + 96);
    v92 = *(id *)(a1 + 56);
    v83 = v90;
    objc_msgSend_saveObjects_completion_(v82, v84, (uint64_t)v90, v91);

    v85 = v93;
    v68 = v46;
LABEL_37:

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 96) + 16))();
  }

}

id sub_1D40949D4(uint64_t a1, const char *a2)
{
  return (id)objc_msgSend_addObject_(*(void **)(a1 + 32), a2, (uint64_t)a2);
}

void sub_1D40949F8(uint64_t a1, void *a2)
{
  id v3;
  const char *v4;
  id v5;

  v3 = a2;
  v5 = v3;
  if (v3)
    objc_msgSend_cls_log_(v3, v4, CLSLogDefault);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void sub_1D4094CB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D4094CD0(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  const char *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend_isActive(v9, v7, v8))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }

}

uint64_t sub_1D409538C(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (!a3)
    return MEMORY[0x1E0DE7D20](*(_QWORD *)(result + 32), sel_presentTransparencyMessageForHandoutAssignedItemInfo_, a2);
  return result;
}

uint64_t sub_1D40953A0(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (!a3)
    return MEMORY[0x1E0DE7D20](*(_QWORD *)(result + 32), sel_presentTransparencyMessageInfo_, a2);
  return result;
}

id sub_1D4095624()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)qword_1ED0FB748;
  v7 = qword_1ED0FB748;
  if (!qword_1ED0FB748)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = sub_1D409D288;
    v3[3] = &unk_1E974B540;
    v3[4] = &v4;
    sub_1D409D288((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1D40956C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D40956DC(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (qword_1ED0FB9A0 != -1)
    dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
  v3 = CLSLogDefault;
  if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_error_impl(&dword_1D4054000, v3, OS_LOG_TYPE_ERROR, "Failed connect to data server, error: %@", (uint8_t *)&v4, 0xCu);
  }

}

void sub_1D4095A1C(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (qword_1ED0FB9A0 != -1)
    dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
  v3 = CLSLogDefault;
  if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_error_impl(&dword_1D4054000, v3, OS_LOG_TYPE_ERROR, "Failed connect to data server, error: %@", (uint8_t *)&v4, 0xCu);
  }

}

uint64_t sub_1D4095B7C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_1D4095C38(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_1D4095CD8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_1D4096124(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D409613C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v7 = CLSLogDefault;
    if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR))
    {
      v10 = 138412290;
      v11 = v6;
      _os_log_error_impl(&dword_1D4054000, v7, OS_LOG_TYPE_ERROR, "Failed to get currentUser, error: %@", (uint8_t *)&v10, 0xCu);
    }
  }
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v5;

}

uint64_t sub_1D409643C(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

uint64_t sub_1D4096450(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_1D4096594(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1D40965B0(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id WeakRetained;
  const char *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  const char *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v8 = WeakRetained;
    if (WeakRetained)
    {
      objc_msgSend_setCachedCurrentUser_(WeakRetained, v7, (uint64_t)v5);
      if (qword_1ED0FB9A0 != -1)
        dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
      v9 = CLSLogDefault;
      if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_INFO))
      {
        v12 = 138412290;
        v13 = v5;
        _os_log_impl(&dword_1D4054000, v9, OS_LOG_TYPE_INFO, "CurrentUser: %@;", (uint8_t *)&v12, 0xCu);
      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
    else
    {
      objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E0CB35C8], v7, 100, CFSTR("CLSDataStore object was released during remote_currentUserWithCompletion:completion:."));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_cls_log_(v10, v11, CLSLogDefault);
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

    }
  }

}

uint64_t sub_1D409684C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_1D4096868(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_1D4096A5C(uint64_t a1, void *a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v6 = v3;
  if (v3)
  {
    if (objc_msgSend_code(v3, v4, v5) != 4099)
    {
      if (qword_1ED0FB9A0 != -1)
        dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
      v7 = CLSLogConnection;
      if (os_log_type_enabled((os_log_t)CLSLogConnection, OS_LOG_TYPE_INFO))
      {
        v8 = *(_QWORD *)(a1 + 32);
        v14 = 138412546;
        v15 = v8;
        v16 = 2114;
        v17 = v6;
        v9 = "Failed to register observer %@; %{public}@";
        v10 = v7;
        v11 = 22;
LABEL_11:
        _os_log_impl(&dword_1D4054000, v10, OS_LOG_TYPE_INFO, v9, (uint8_t *)&v14, v11);
      }
    }
  }
  else
  {
    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v12 = CLSLogNotifications;
    if (os_log_type_enabled((os_log_t)CLSLogNotifications, OS_LOG_TYPE_INFO))
    {
      v13 = *(_QWORD *)(a1 + 32);
      v14 = 138412290;
      v15 = v13;
      v9 = "Successfully registered observer: %@";
      v10 = v12;
      v11 = 12;
      goto LABEL_11;
    }
  }

}

void sub_1D4096E40(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (qword_1ED0FB9A0 != -1)
    dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
  v4 = CLSLogConnection;
  if (os_log_type_enabled((os_log_t)CLSLogConnection, OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138412546;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_impl(&dword_1D4054000, v4, OS_LOG_TYPE_INFO, "Failed to deregister observer: %@; %{public}@",
      (uint8_t *)&v6,
      0x16u);
  }

}

void sub_1D4096F2C(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (qword_1ED0FB9A0 != -1)
    dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
  v2 = CLSLogNotifications;
  if (os_log_type_enabled((os_log_t)CLSLogNotifications, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_1D4054000, v2, OS_LOG_TYPE_INFO, "Successfully deregistered observer: %@", (uint8_t *)&v4, 0xCu);
  }
}

void sub_1D409714C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  id *v8;
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  objc_destroyWeak(v8);
  _Unwind_Resume(a1);
}

uint64_t sub_1D409716C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_1D4097178(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  const char *v5;
  uint64_t v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  const char *v21;
  void *v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  NSObject *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[8];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend_lock(WeakRetained, v5, v6);
    objc_msgSend_date(MEMORY[0x1E0C99D68], v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)*((_QWORD *)v7 + 11);
    *((_QWORD *)v7 + 11) = v10;

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v12 = v3;
    v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v27, v32, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v28;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v28 != v16)
            objc_enumerationMutation(v12);
          v18 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v17);
          v19 = (void *)MEMORY[0x1D82573E4](v14);
          objc_msgSend_vertexWithVertexID_(*((void **)v7 + 17), v20, v18, (_QWORD)v27);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (v22)
            objc_msgSend_removeSubtreeStartingAtVertex_(*((void **)v7 + 17), v21, (uint64_t)v22);

          objc_autoreleasePoolPop(v19);
          ++v17;
        }
        while (v15 != v17);
        v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v23, (uint64_t)&v27, v32, 16);
        v15 = v14;
      }
      while (v14);
    }

    objc_msgSend_unlock(v7, v24, v25);
  }
  else
  {
    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v26 = CLSLogDefault;
    if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D4054000, v26, OS_LOG_TYPE_DEFAULT, "CLSDataStore object was released during remote_fetchDeletedObjectIDsNewerThanDate:completion:.", buf, 2u);
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t sub_1D4097400(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_1D40974A0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_1D409755C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_1D409760C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_1D40976D0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_1D409778C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_1D4097848(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_1D4097904(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_1D40979D4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_1D4097A90(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_1D4097B40(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(result + 16))(result, 0, 2, a2);
  return result;
}

void sub_1D4097FFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  id *v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  objc_destroyWeak(v9);
  _Unwind_Resume(a1);
}

void sub_1D4098024(uint64_t a1)
{
  _BYTE *WeakRetained;
  const char *v3;
  uint64_t v4;
  _BYTE *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  const char *v10;
  void *v11;
  const char *v12;
  __int128 v13;
  _QWORD v14[4];
  __int128 v15;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend_lock(WeakRetained, v3, v4);
    v5[56] = 1;
    objc_msgSend_unlock(v5, v6, v7);
    v8 = *(_QWORD *)(a1 + 32);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = sub_1D4098130;
    v14[3] = &unk_1E974B1E0;
    v13 = *(_OWORD *)(a1 + 40);
    v9 = (id)v13;
    v15 = v13;
    objc_msgSend__validateAndCreateHandoutAssignedItemFor_completion_(v5, v10, v8, v14);

  }
  else
  {
    objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E0CB35C8], v3, 100, CFSTR("CLSDataStore object was released during refreshAuthTreeForAttachment:withCompletion:."));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_cls_log_(v11, v12, CLSLogDefault);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

void sub_1D4098130(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _BYTE *WeakRetained;
  const char *v8;
  uint64_t v9;
  _BYTE *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  CLSFaultProcessor *v15;
  const char *v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  void *v21;
  id v22;
  const char *v23;
  void *v24;
  const char *v25;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  v10 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend_lock(WeakRetained, v8, v9);
    v10[56] = 0;
    objc_msgSend_unlock(v10, v11, v12);
    if (v5)
    {
      objc_msgSend_addObject_(v10, v13, (uint64_t)v5);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 0;
      v32 = &v31;
      v33 = 0x3032000000;
      v34 = sub_1D408F1F4;
      v35 = sub_1D408F204;
      v15 = [CLSFaultProcessor alloc];
      v36 = (id)objc_msgSend_initWithDelegate_(v15, v16, (uint64_t)v10);
      v17 = (void *)v32[5];
      v37[0] = v14;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v18, (uint64_t)v37, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_faultObjects_(v17, v20, (uint64_t)v19);

      v21 = (void *)v32[5];
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = sub_1D409839C;
      v26[3] = &unk_1E974B1B8;
      v30 = &v31;
      v26[4] = v10;
      v22 = v14;
      v27 = v22;
      v29 = *(id *)(a1 + 32);
      v28 = v6;
      objc_msgSend_completionNotify_(v21, v23, (uint64_t)v26);

      _Block_object_dispose(&v31, 8);
    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
  }
  else
  {
    objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E0CB35C8], v8, 100, CFSTR("CLSDataStore object was released during _validateAndCreateHandoutAssignedItemFor:completion:."));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_cls_log_(v24, v25, CLSLogDefault);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

void sub_1D409837C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D409839C(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  uint64_t v16;
  id v17;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v12 = MEMORY[0x1E0C809B0];
  v14 = sub_1D409845C;
  v15 = &unk_1E974B190;
  v3 = *(void **)(a1 + 40);
  v16 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v2 + 40);
  v13 = 3221225472;
  v17 = v3;
  objc_msgSend_enumerate_(v4, v5, (uint64_t)&v12);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = 0;

  v10 = objc_msgSend_effectiveAuthorizationStatus(*(void **)(a1 + 40), v8, v9, v12, v13, v14, v15, v16);
  v11 = 0;
  if (v10 != 2)
    v11 = *(_QWORD *)(a1 + 40);
  (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), v11, *(_QWORD *)(a1 + 48));

}

void sub_1D409845C(uint64_t a1, void *a2)
{
  const char *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  char v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  int isEqualToString;
  const char *v14;
  id v15;

  v15 = a2;
  objc_msgSend_addObject_(*(void **)(a1 + 32), v3, (uint64_t)v15);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    v7 = objc_opt_isKindOfClass() ^ 1;
  }
  else
  {
    v7 = 1;
  }
  objc_msgSend_currentActivityID(*(void **)(a1 + 40), v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectID(v15, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v8, v12, (uint64_t)v11);

  if ((v7 & 1) == 0 && isEqualToString)
    objc_msgSend_addChild_changedPropertyName_(*(void **)(a1 + 40), v14, (uint64_t)v4, CFSTR("_currentActivity"));

}

uint64_t sub_1D40986A0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_1D4098A04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose(&a43, 8);
  _Unwind_Resume(a1);
}

void sub_1D4098A44(uint64_t a1, char a2, void *a3)
{
  id v6;
  id v7;

  v7 = a3;
  v6 = *(id *)(a1 + 32);
  objc_sync_enter(v6);
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) && (a2 & 1) == 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a3);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
  objc_sync_exit(v6);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void sub_1D4098AE4(uint64_t a1, char a2, void *a3)
{
  const char *v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6 && (a2 & 1) == 0)
  {
    objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E0CB35C8], v5, 313, CFSTR("Internal failure."));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v7 = CLSLogDefault;
    if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412290;
      v9 = v6;
      _os_log_error_impl(&dword_1D4054000, v7, OS_LOG_TYPE_ERROR, "Failed in 'publishHandout:completion:', but no error was set. Setting the error to: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t sub_1D4098C04(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_1D4098DB4(uint64_t a1, char a2, void *a3)
{
  const char *v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6 && (a2 & 1) == 0)
  {
    objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E0CB35C8], v5, 100, CFSTR("Internal failure."));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v7 = CLSLogDefault;
    if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412290;
      v9 = v6;
      _os_log_error_impl(&dword_1D4054000, v7, OS_LOG_TYPE_ERROR, "Failed in 'repairHandoutAttachments:completion:', but no error was set. Setting the error to: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t sub_1D4098ED4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_1D4098EE8(uint64_t a1, const char *a2)
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t sub_1D4099020(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_1D40991B4(_QWORD *a1, void *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const char *v9;
  id v10;

  if (a3)
  {
    (*(void (**)(void))(a1[5] + 16))();
  }
  else
  {
    objc_msgSend_person(a2, (const char *)a2, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v4;
    if (v4)
    {
      v7 = (void *)a1[4];
      objc_msgSend_objectID(v4, v5, v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_classesForPersonID_role_completion_(v7, v9, (uint64_t)v8, a1[6], a1[5]);

    }
    else
    {
      (*(void (**)(void))(a1[5] + 16))();
    }

  }
}

void sub_1D40993A0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1D40993BC(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  void *v7;
  const char *v8;
  void *v9;
  id v10;
  const char *v11;
  id WeakRetained;
  id v13;
  const char *v14;
  const char *v15;
  void *v16;
  const char *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;

  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else if ((objc_msgSend_isInstructor(a2, (const char *)a2, 0) & 1) != 0 || (*(_BYTE *)(a1 + 56) & 2) != 0)
  {
    v5 = objc_opt_class();
    objc_msgSend_predicateForObjectsWithParentObjectID_andRole_(CLSQuery, v6, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    objc_msgSend_queryWithObjectType_predicate_error_(CLSQuery, v8, v5, v7, &v21);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v21;

    if (v10)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
      if (WeakRetained)
      {
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = sub_1D40995A8;
        v19[3] = &unk_1E974B310;
        v13 = *(id *)(a1 + 40);
        v19[4] = WeakRetained;
        v20 = v13;
        objc_msgSend_setCompletion_(v9, v14, (uint64_t)v19);
        objc_msgSend_executeQuery_(WeakRetained, v15, (uint64_t)v9);
        v16 = v20;
      }
      else
      {
        objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E0CB35C8], v11, 100, CFSTR("CLSDataStore object was released during currentUserWithCompletion: (within personsInClassWithClassID:role:completion:)"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_cls_log_(v16, v17, CLSLogDefault);
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      }

    }
  }
  else
  {
    v4 = *(_QWORD *)(a1 + 40);
    v18 = (id)objc_opt_new();
    (*(void (**)(uint64_t, id, _QWORD))(v4 + 16))(v4, v18, 0);

  }
}

void sub_1D40995A8(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  void *v19;
  const char *v20;
  void *v21;
  id v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v6 = (void *)objc_opt_new();
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v7 = v5;
    v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v27, v31, 16);
    if (v9)
    {
      v12 = v9;
      v13 = *(_QWORD *)v28;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v28 != v13)
            objc_enumerationMutation(v7);
          objc_msgSend_personID(*(void **)(*((_QWORD *)&v27 + 1) + 8 * v14), v10, v11);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v6, v16, (uint64_t)v15);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v27, v31, 16);
      }
      while (v12);
    }

    v17 = objc_opt_class();
    objc_msgSend_predicateForObjectsWithObjectIDs_(CLSQuery, v18, (uint64_t)v6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    objc_msgSend_queryWithObjectType_predicate_error_(CLSQuery, v20, v17, v19, &v26);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v26;

    v24 = *(_QWORD *)(a1 + 40);
    if (v22)
    {
      (*(void (**)(_QWORD, _QWORD, id))(v24 + 16))(*(_QWORD *)(a1 + 40), 0, v22);
    }
    else
    {
      objc_msgSend_setCompletion_(v21, v23, v24);
      objc_msgSend_executeQuery_(*(void **)(a1 + 32), v25, (uint64_t)v21);
    }

  }
}

void sub_1D409992C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_1D4099954(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  const char *v6;
  id WeakRetained;
  void *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  void *v21;
  const char *v22;
  void *v23;
  id v24;
  const char *v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t);
  void *v31;
  id v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    if (WeakRetained)
    {
      v8 = (void *)objc_opt_new();
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v9 = v5;
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v34, v38, 16);
      if (v11)
      {
        v14 = v11;
        v15 = *(_QWORD *)v35;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v35 != v15)
              objc_enumerationMutation(v9);
            objc_msgSend_parentObjectID(*(void **)(*((_QWORD *)&v34 + 1) + 8 * i), v12, v13);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_addObject_(v8, v18, (uint64_t)v17);

          }
          v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v34, v38, 16);
        }
        while (v14);
      }

      v19 = objc_opt_class();
      objc_msgSend_predicateForObjectsWithObjectIDs_(CLSQuery, v20, (uint64_t)v8);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 0;
      objc_msgSend_queryWithObjectType_predicate_error_(CLSQuery, v22, v19, v21, &v33);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v33;

      if (v24)
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      }
      else
      {
        v28 = MEMORY[0x1E0C809B0];
        v29 = 3221225472;
        v30 = sub_1D4099BD8;
        v31 = &unk_1E974AFE8;
        v32 = *(id *)(a1 + 32);
        objc_msgSend_setCompletion_(v23, v26, (uint64_t)&v28);
        objc_msgSend_executeQuery_(WeakRetained, v27, (uint64_t)v23, v28, v29, v30, v31);

      }
    }
    else
    {
      objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E0CB35C8], v6, 100, CFSTR("CLSDataStore object was released during currentUserWithCompletion: (within classesForPersonID:role:completion:)"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_cls_log_(v8, v25, CLSLogDefault);
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }

  }
}

uint64_t sub_1D4099BD8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_1D4099E60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D4099E7C(uint64_t a1, char a2, void *a3)
{
  const char *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  const char *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (v7 || (a2 & 1) != 0)
    goto LABEL_6;
  objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E0CB35C8], v5, 100, CFSTR("Internal failure."));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (qword_1ED0FB9A0 != -1)
    dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
  v8 = CLSLogDefault;
  if (!os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR))
  {
LABEL_6:
    if ((a2 & 1) != 0)
      goto LABEL_9;
  }
  else
  {
    v10 = 138412290;
    v11 = v7;
    _os_log_error_impl(&dword_1D4054000, v8, OS_LOG_TYPE_ERROR, "Failed in 'saveClass:completion:', but no error was set. Setting the error to: %@", (uint8_t *)&v10, 0xCu);
    if ((a2 & 1) != 0)
      goto LABEL_9;
  }
  if (objc_msgSend_isDeleted(*(void **)(a1 + 32), v5, v6))
    objc_msgSend_setDeleted_(*(void **)(a1 + 32), v9, 0);
LABEL_9:
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t sub_1D4099FBC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_1D4099FD0(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  id v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  const char *v23;
  id v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  NSObject *v45;
  const char *v46;
  NSObject *v47;
  uint64_t v48;
  const char *v49;
  const char *v50;
  const char *v51;
  uint64_t v52;
  id v53;
  void *v54;
  uint8_t buf[16];
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v54 = (void *)objc_opt_new();
    v6 = (void *)objc_opt_new();
    v7 = objc_alloc(MEMORY[0x1E0C99E08]);
    v10 = objc_msgSend_count(v5, v8, v9);
    v12 = (void *)objc_msgSend_initWithCapacity_(v7, v11, v10);
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v53 = v5;
    v13 = v5;
    v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v60, v65, 16);
    if (v15)
    {
      v18 = v15;
      v19 = *(_QWORD *)v61;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v61 != v19)
            objc_enumerationMutation(v13);
          v21 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
          objc_msgSend_objectID(v21, v16, v17);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKey_(v12, v23, (uint64_t)v21, v22);

        }
        v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v60, v65, 16);
      }
      while (v18);
    }

    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v52 = a1;
    v24 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v25, (uint64_t)&v56, v64, 16);
    if (v26)
    {
      v29 = v26;
      v30 = *(_QWORD *)v57;
      do
      {
        v31 = 0;
        do
        {
          if (*(_QWORD *)v57 != v30)
            objc_enumerationMutation(v24);
          v32 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v31);
          if (objc_msgSend_markedForDeletion(v32, v27, v28))
          {
            objc_msgSend_addObject_(v6, v33, (uint64_t)v32);
          }
          else
          {
            objc_msgSend_objectID(v32, v33, v34);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKey_(v12, v36, (uint64_t)v35);
            v37 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v37
              || (objc_msgSend_markedForDeletion(v37, v38, v39) & 1) != 0
              || (v42 = objc_msgSend_roles(v37, v40, v41), v42 == objc_msgSend_roles(v32, v43, v44)))
            {
              if (qword_1ED0FB9A0 != -1)
                dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
              v45 = CLSLogClasses;
              if (os_log_type_enabled((os_log_t)CLSLogClasses, OS_LOG_TYPE_DEBUG))
              {
                *(_WORD *)buf = 0;
                _os_log_debug_impl(&dword_1D4054000, v45, OS_LOG_TYPE_DEBUG, "This CLSClassMember is not in our DB but they are in the edited list so they must be new additions.", buf, 2u);
              }
              objc_msgSend_addObject_(v54, v46, (uint64_t)v32);
            }
            else
            {
              if (qword_1ED0FB9A0 != -1)
                dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
              v47 = CLSLogClasses;
              if (os_log_type_enabled((os_log_t)CLSLogClasses, OS_LOG_TYPE_DEBUG))
              {
                *(_WORD *)buf = 0;
                _os_log_debug_impl(&dword_1D4054000, v47, OS_LOG_TYPE_DEBUG, "There's a CLSClassMember for this person already in the DB", buf, 2u);
              }
            }

          }
          ++v31;
        }
        while (v29 != v31);
        v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v27, (uint64_t)&v56, v64, 16);
        v29 = v48;
      }
      while (v48);
    }

    objc_msgSend_makeObjectsPerformSelector_(v54, v49, (uint64_t)sel_willSaveObject);
    objc_msgSend_makeObjectsPerformSelector_(v6, v50, (uint64_t)sel_willSaveObject);
    objc_msgSend_remote_publishClass_membersToInsert_membersToDelete_completion_(*(void **)(v52 + 32), v51, *(_QWORD *)(v52 + 40), v54, v6, *(_QWORD *)(v52 + 56));

    v5 = v53;
  }

}

void sub_1D409A4B4(uint64_t a1, char a2, void *a3)
{
  const char *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  const char *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (v7 || (a2 & 1) != 0)
    goto LABEL_6;
  objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E0CB35C8], v5, 100, CFSTR("Internal failure."));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (qword_1ED0FB9A0 != -1)
    dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
  v8 = CLSLogDefault;
  if (!os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR))
  {
LABEL_6:
    if ((a2 & 1) != 0)
      goto LABEL_9;
  }
  else
  {
    v10 = 138412290;
    v11 = v7;
    _os_log_error_impl(&dword_1D4054000, v8, OS_LOG_TYPE_ERROR, "Failed in 'removeClass:completion:', but no error was set. Setting the error to: %@", (uint8_t *)&v10, 0xCu);
    if ((a2 & 1) != 0)
      goto LABEL_9;
  }
  if (objc_msgSend_isDeleted(*(void **)(a1 + 32), v5, v6))
    objc_msgSend_setDeleted_(*(void **)(a1 + 32), v9, 0);
LABEL_9:
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t sub_1D409A5F4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_1D409A728(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1D409A74C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

uint64_t sub_1D409A8BC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_1D409AB44(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_1D409AB58(uint64_t a1, void *a2, void *a3)
{
  id v5;
  const char *v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  const char *v18;
  NSObject *v19;
  const char *v20;
  void *v21;
  uint8_t v22[16];
  uint8_t buf[16];

  v5 = a2;
  v8 = a3;
  if (v8)
  {
    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v9 = CLSLogDefault;
    if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D4054000, v9, OS_LOG_TYPE_ERROR, "error fetching handout assignment item for app based assignment", buf, 2u);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    objc_msgSend_objectID(v5, v6, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      if (objc_msgSend_effectiveAuthorizationStatus(v5, v10, v11) == 2)
      {
        objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E0CB35C8], v13, 323, CFSTR("handout assignment item authorization denied"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

      }
      v16 = *(void **)(a1 + 32);
      objc_msgSend_objectID(v5, v13, v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_remote_startAppActivity_bundleID_activityType_completion_(v16, v18, (uint64_t)v17, *(_QWORD *)(a1 + 40), *(int *)(a1 + 56), *(_QWORD *)(a1 + 48));

    }
    else
    {
      if (qword_1ED0FB9A0 != -1)
        dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
      v19 = CLSLogDefault;
      if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v22 = 0;
        _os_log_debug_impl(&dword_1D4054000, v19, OS_LOG_TYPE_DEBUG, "handout assignment item ID is nil", v22, 2u);
      }
      objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E0CB35C8], v20, 100, CFSTR("handout assignment item ID is nil"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

    }
  }

}

uint64_t sub_1D409AED0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_1D409AFD8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_1D409B078(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id sub_1D409B144()
{
  if (qword_1ED0FB758 != -1)
    dispatch_once(&qword_1ED0FB758, &unk_1E974B578);
  return (id)qword_1ED0FB760;
}

void sub_1D409B184(uint64_t a1, const char *a2, uint64_t a3)
{
  const char *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  void *v9;
  const __CFString *v10;
  id v11;

  if ((objc_msgSend_isSearchAPIEnabled(*(void **)(a1 + 32), a2, a3) & 1) == 0
    && (objc_msgSend_isDashboardAPIEnabled(*(void **)(a1 + 32), v4, v5) & 1) == 0)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = CFSTR("Use of Search API is not allowed.");
LABEL_10:
    objc_msgSend_cls_createErrorWithCode_description_(v9, v4, 4, v10);
    goto LABEL_12;
  }
  v6 = *(void **)(a1 + 40);
  if (!v6)
  {
LABEL_7:
    MEMORY[0x1E0DE7D20](*(_QWORD *)(a1 + 32), sel_canSearchRostersWithCompletion_, *(_QWORD *)(a1 + 48));
    return;
  }
  if (objc_msgSend_requiresDashboardEntitlement(v6, v4, v5)
    && (objc_msgSend_isPrivateSearchAPIEnabled(CLSDataStore, v4, v7) & 1) == 0)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = CFSTR("Use of Search private API is not allowed.");
    goto LABEL_10;
  }
  if (objc_msgSend_options(*(void **)(a1 + 40), v4, v7))
    goto LABEL_7;
  objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E0CB35C8], v8, 2, CFSTR("Invalid search options."));
LABEL_12:
  v11 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void sub_1D409B47C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;
  uint64_t v19;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Block_object_dispose((const void *)(v19 - 176), 8);
  _Block_object_dispose((const void *)(v19 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1D409B4B0(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void (*v13)(void);
  void *v14;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  id v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  const char *v33;
  char v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  void *context;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t v49[128];
  uint8_t buf[4];
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend_lock(*(void **)(a1 + 32), v7, v8);
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (!*(_BYTE *)(v11 + 24))
  {
    objc_msgSend_unlock(*(void **)(a1 + 32), v9, v10);
    goto LABEL_21;
  }
  *(_BYTE *)(v11 + 24) = 0;
  objc_msgSend_unlock(*(void **)(a1 + 32), v9, v10);
  if (v6)
  {
    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v12 = CLSLogSearch;
    if (os_log_type_enabled((os_log_t)CLSLogSearch, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v51 = v6;
      _os_log_debug_impl(&dword_1D4054000, v12, OS_LOG_TYPE_DEBUG, "failed to find entities matching error: %@", buf, 0xCu);
    }
    v13 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    goto LABEL_8;
  }
  if (!v5)
  {
    v13 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
LABEL_8:
    v13();
    goto LABEL_21;
  }
  v14 = (void *)objc_opt_new();
  v15 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v18 = objc_msgSend_count(v5, v16, v17);
  v20 = (void *)objc_msgSend_initWithCapacity_(v15, v19, v18);
  context = (void *)MEMORY[0x1D82573E4]();
  v44 = v5;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v23 = (id)objc_msgSend_copy(v5, v21, v22);
  v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v45, v49, 16);
  if (v25)
  {
    v28 = v25;
    v29 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v46 != v29)
          objc_enumerationMutation(v23);
        v31 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
        objc_msgSend_objectID(v31, v26, v27);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend_containsObject_(v14, v33, (uint64_t)v32);

        if ((v34 & 1) == 0)
        {
          objc_msgSend_addObject_(v20, v26, (uint64_t)v31);
          objc_msgSend_objectID(v31, v35, v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v14, v38, (uint64_t)v37);

        }
      }
      v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v26, (uint64_t)&v45, v49, 16);
    }
    while (v28);
  }

  objc_autoreleasePoolPop(context);
  v39 = *(_QWORD *)(a1 + 40);
  v42 = (void *)objc_msgSend_copy(v20, v40, v41);
  (*(void (**)(uint64_t, void *, _QWORD))(v39 + 16))(v39, v42, 0);

  v6 = 0;
  v5 = v44;
LABEL_21:

}

void sub_1D409B788(_QWORD *a1, const char *a2)
{
  const char *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  if (*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
  {
    objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E0CB35C8], a2, 100, CFSTR("CLSDataStore objectsMatching:completion: timed out"));
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_cls_log_(v12, v3, CLSLogSearch);
    v6 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
    if (v6
      && (objc_msgSend_results(v6, v4, v5), v7 = (void *)objc_claimAutoreleasedReturnValue(), v7, v7))
    {
      v10 = a1[4];
      objc_msgSend_results(*(void **)(*(_QWORD *)(a1[6] + 8) + 40), v8, v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, _QWORD))(v10 + 16))(v10, v11, 0);

    }
    else
    {
      (*(void (**)(void))(a1[4] + 16))();
    }

  }
}

void sub_1D409B874(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  const char *v6;
  uint64_t v7;
  id WeakRetained;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  const char *v15;
  void *v16;
  const char *v17;
  void *v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  int v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    if (WeakRetained)
    {
      if (objc_msgSend_BOOLValue(v5, v6, v7))
      {
        if (qword_1ED0FB9A0 != -1)
          dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
        v9 = (void *)CLSLogSearch;
        if (os_log_type_enabled((os_log_t)CLSLogSearch, OS_LOG_TYPE_DEBUG))
        {
          v18 = *(void **)(a1 + 32);
          v19 = v9;
          objc_msgSend_dictionaryRepresentation(v18, v20, v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = 138412290;
          v24 = v22;
          _os_log_debug_impl(&dword_1D4054000, v19, OS_LOG_TYPE_DEBUG, "Query for objects matching: %@", (uint8_t *)&v23, 0xCu);

        }
        objc_msgSend_queryWithSearchSpecification_(CLSQuery, v10, *(_QWORD *)(a1 + 32));
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v13 = *(void **)(v12 + 40);
        *(_QWORD *)(v12 + 40) = v11;

        objc_msgSend_setCompletion_(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v14, *(_QWORD *)(a1 + 40));
        objc_msgSend_executeQuery_(WeakRetained, v15, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
      }
      else
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      }
    }
    else
    {
      objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E0CB35C8], v6, 100, CFSTR("CLSDataStore object was released during shouldPerformSearchAPIOperation: (within objectsMatching:completion:)"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_cls_info_(v16, v17, CLSLogSearch);
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

    }
  }

}

uint64_t sub_1D409BC98(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_1D409BD80(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_1D409BF80(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_1D409C304(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_1D409C458(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  CLSAdminRequestor *v5;
  const char *v6;
  id v7;

  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend_firstObject(a2, (const char *)a2, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      v5 = [CLSAdminRequestor alloc];
      v4 = objc_msgSend_initWithEmail_(v5, v6, *(_QWORD *)(a1 + 32));
    }
    v7 = (id)v4;
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

void sub_1D409C690(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
  id *v17;
  uint64_t v18;

  objc_destroyWeak(v17);
  _Block_object_dispose(&a17, 8);
  objc_destroyWeak((id *)(v18 - 80));
  _Unwind_Resume(a1);
}

void sub_1D409C6C4(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  const char *v6;
  id WeakRetained;
  void *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  void *v25;
  const char *v26;
  void *v27;
  id v28;
  const char *v29;
  void (*v30)(void);
  id v31;
  uint64_t v32;
  const char *v33;
  const char *v34;
  _QWORD v35[4];
  id v36;
  uint64_t v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    if (WeakRetained)
    {
      objc_msgSend_addObjectsFromArray_(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v6, (uint64_t)v5);
      v8 = (void *)objc_opt_new();
      v39 = 0u;
      v40 = 0u;
      v41 = 0u;
      v42 = 0u;
      v9 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v39, v43, 16);
      if (v11)
      {
        v14 = v11;
        v15 = *(_QWORD *)v40;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v40 != v15)
              objc_enumerationMutation(v9);
            v17 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
            objc_msgSend_personID(v17, v12, v13);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            if (v18)
            {
              objc_msgSend_personID(v17, v12, v13);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_addObject_(v8, v20, (uint64_t)v19);

            }
          }
          v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v39, v43, 16);
        }
        while (v14);
      }

      if (objc_msgSend_count(v8, v21, v22))
      {
        v23 = objc_opt_class();
        objc_msgSend_predicateForObjectsWithObjectIDs_(CLSDataObserver, v24, (uint64_t)v8);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = 0;
        objc_msgSend_queryWithObjectType_predicate_error_(CLSQuery, v26, v23, v25, &v38);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v38;

        if (v28)
        {
          (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
        }
        else
        {
          v35[0] = MEMORY[0x1E0C809B0];
          v35[1] = 3221225472;
          v35[2] = sub_1D409C9B0;
          v35[3] = &unk_1E974B4C8;
          v31 = *(id *)(a1 + 32);
          v32 = *(_QWORD *)(a1 + 40);
          v36 = v31;
          v37 = v32;
          objc_msgSend_setCompletion_(v27, v33, (uint64_t)v35);
          objc_msgSend_executeQuery_(WeakRetained, v34, (uint64_t)v27);

        }
        goto LABEL_21;
      }
      v30 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    }
    else
    {
      objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E0CB35C8], v6, 100, CFSTR("CLSDataStore object was released during query execution: (within childrenOfAdminRequestID:completion:)"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_cls_log_(v8, v29, CLSLogDefault);
      v30 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    }
    v30();
LABEL_21:

    goto LABEL_22;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
LABEL_22:

}

uint64_t sub_1D409C9B0(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t (*v4)(void);

  if (a3)
  {
    v4 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    objc_msgSend_addObjectsFromArray_(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2, (uint64_t)a2);
    v4 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  return v4();
}

uint64_t sub_1D409CAB0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_1D409CB6C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_1D409CC78(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_1D409CF54(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_1D409CF68(_QWORD *a1, uint64_t a2, void *a3)
{
  id v4;
  const char *v5;
  id v6;
  void *v7;
  char v8;
  const char *v9;
  void *v10;
  void *v11;
  id v12;
  void (*v13)(void);
  void *v14;
  const char *v15;
  char v16;
  const char *v17;
  uint64_t v18;
  id v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  const char *v23;
  char v24;
  NSObject *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  uint8_t buf[4];
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v6 = v4;
LABEL_6:
    (*(void (**)(void))(a1[6] + 16))();
    goto LABEL_7;
  }
  v7 = (void *)a1[4];
  v29 = 0;
  v8 = objc_msgSend_seekToOffset_error_(v7, v5, 0, &v29);
  v6 = v29;
  if ((v8 & 1) == 0)
    goto LABEL_6;
  v10 = (void *)a1[4];
  v28 = 0;
  objc_msgSend_readDataToEndOfFileAndReturnError_(v10, v9, (uint64_t)&v28);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v28;

  v13 = *(void (**)(void))(a1[6] + 16);
  if (v12)
  {
    v13();
    v6 = v12;
  }
  else
  {
    v13();
    v14 = (void *)a1[4];
    v27 = 0;
    v16 = objc_msgSend_closeAndReturnError_(v14, v15, (uint64_t)&v27);
    v19 = v27;
    if ((v16 & 1) == 0)
    {
      if (qword_1ED0FB9A0 != -1)
        dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
      v20 = CLSLogDefault;
      if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v31 = v19;
        _os_log_error_impl(&dword_1D4054000, v20, OS_LOG_TYPE_ERROR, "Error closing file: %@", buf, 0xCu);
      }
    }
    objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v17, v18);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = a1[5];
    v26 = v19;
    v24 = objc_msgSend_removeItemAtURL_error_(v21, v23, v22, &v26);
    v6 = v26;

    if ((v24 & 1) == 0)
    {
      if (qword_1ED0FB9A0 != -1)
        dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
      v25 = CLSLogDefault;
      if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v31 = v6;
        _os_log_error_impl(&dword_1D4054000, v25, OS_LOG_TYPE_ERROR, "Error removing file: %@", buf, 0xCu);
      }
    }
  }

LABEL_7:
}

uint64_t sub_1D409D274(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

Class sub_1D409D288(uint64_t a1)
{
  Class result;
  void *v3;

  if (!qword_1ED0FB750)
  {
    qword_1ED0FB750 = _sl_dlopen();
    if (!qword_1ED0FB750)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("CLSNotificationBannerDisplayManager");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)abort_report_np();
    free(v3);
  }
  qword_1ED0FB748 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1D409D38C()
{
  NSObject *v0;
  qos_class_t v1;
  dispatch_queue_t v2;
  void *v3;
  NSObject *attr;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = qos_class_self();
  dispatch_queue_attr_make_with_qos_class(v0, v1, 0);
  attr = objc_claimAutoreleasedReturnValue();

  v2 = dispatch_queue_create("com.apple.ClassKit.CLSDataStore.searchAPI", attr);
  v3 = (void *)qword_1ED0FB760;
  qword_1ED0FB760 = (uint64_t)v2;

}

id sub_1D409D404(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v6;
  id v7;
  const char *v8;
  id v9;
  const char *v10;
  void *v11;
  const char *v12;

  if (a3)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = a4;
    objc_msgSend_setWithObject_(v6, v8, a3);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_cls_secureUnarchiveObjectOfClasses_withData_(a1, v10, (uint64_t)v9, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = a4;
    objc_msgSend_cls_secureUnarchiveObjectOfClasses_withData_(a1, v12, 0, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

id sub_1D409D49C(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  id v9;
  const char *v10;
  void *v11;
  id v12;
  const char *v13;
  void *v14;
  void *v15;
  id v17;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend_length(v6, v7, v8))
  {
    v9 = objc_alloc(MEMORY[0x1E0CB3710]);
    v17 = 0;
    v11 = (void *)objc_msgSend_initForReadingFromData_error_(v9, v10, (uint64_t)v6, &v17);
    v12 = v17;
    v14 = v12;
    if (v12)
    {
      objc_msgSend_cls_debug_(v12, v13, CLSLogDefault);
      v15 = 0;
    }
    else
    {
      objc_msgSend_decodeObjectOfClasses_forKey_(v11, v13, (uint64_t)v5, *MEMORY[0x1E0CB2CD0]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

void sub_1D409DA58(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  CLSParentChildRelation *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  CLSParentChildRelation *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  objc_super v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v20.receiver = *(id *)(a1 + 32);
  v20.super_class = (Class)&OBJC_METACLASS___CLSArchivedHandout;
  objc_msgSendSuper2(&v20, sel_relations);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED0FB768;
  qword_1ED0FB768 = v2;

  v4 = [CLSParentChildRelation alloc];
  v5 = *(_QWORD *)(a1 + 32);
  v6 = objc_opt_class();
  v8 = (void *)objc_msgSend_initWithParentEntity_childEntity_faultable_(v4, v7, v5, v6, 1);
  v9 = [CLSParentChildRelation alloc];
  v10 = *(_QWORD *)(a1 + 32);
  v11 = objc_opt_class();
  v13 = (void *)objc_msgSend_initWithParentEntity_childEntity_faultable_(v9, v12, v10, v11, 1);
  v14 = (void *)qword_1ED0FB768;
  v21[0] = v8;
  v21[1] = v13;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v15, (uint64_t)v21, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setByAddingObjectsFromArray_(v14, v17, (uint64_t)v16);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)qword_1ED0FB768;
  qword_1ED0FB768 = v18;

}

void sub_1D409DC18(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  CLSChildParentRelation *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  objc_super v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v15.receiver = *(id *)(a1 + 32);
  v15.super_class = (Class)&OBJC_METACLASS___CLSArchivedSliderAnswerFormat;
  objc_msgSendSuper2(&v15, sel_relations);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED0FB778;
  qword_1ED0FB778 = v2;

  v4 = [CLSChildParentRelation alloc];
  v5 = *(_QWORD *)(a1 + 32);
  v6 = objc_opt_class();
  v8 = (void *)objc_msgSend_initWithChildEntity_parentEntity_faultable_(v4, v7, v5, v6, 1);
  v9 = (void *)qword_1ED0FB778;
  v16[0] = v8;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v10, (uint64_t)v16, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setByAddingObjectsFromArray_(v9, v12, (uint64_t)v11);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)qword_1ED0FB778;
  qword_1ED0FB778 = v13;

}

void sub_1D409DD98(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  CLSChildParentRelation *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  objc_super v12;

  v12.receiver = *(id *)(a1 + 32);
  v12.super_class = (Class)&OBJC_METACLASS___CLSTimeInterval;
  objc_msgSendSuper2(&v12, sel_relations);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED0FB788;
  qword_1ED0FB788 = v2;

  v4 = [CLSChildParentRelation alloc];
  v5 = *(_QWORD *)(a1 + 32);
  v6 = objc_opt_class();
  v8 = (void *)objc_msgSend_initWithChildEntity_parentEntity_faultable_(v4, v7, v5, v6, 1);
  objc_msgSend_setByAddingObject_((void *)qword_1ED0FB788, v9, (uint64_t)v8);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)qword_1ED0FB788;
  qword_1ED0FB788 = v10;

}

void sub_1D409DEC4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  CLSChildParentRelation *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  objc_super v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v15.receiver = *(id *)(a1 + 32);
  v15.super_class = (Class)&OBJC_METACLASS___CLSProgressReportingCapability;
  objc_msgSendSuper2(&v15, sel_relations);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED0FB798;
  qword_1ED0FB798 = v2;

  v4 = [CLSChildParentRelation alloc];
  v5 = *(_QWORD *)(a1 + 32);
  v6 = objc_opt_class();
  v8 = (void *)objc_msgSend_initWithChildEntity_parentEntity_faultable_(v4, v7, v5, v6, 1);
  v9 = (void *)qword_1ED0FB798;
  v16[0] = v8;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v10, (uint64_t)v16, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setByAddingObjectsFromArray_(v9, v12, (uint64_t)v11);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)qword_1ED0FB798;
  qword_1ED0FB798 = v13;

}

void sub_1D409E044(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  CLSChildParentRelation *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  CLSChildParentRelation *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  CLSParentChildRelation *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  void *v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  objc_super v25;
  _QWORD v26[4];

  v26[3] = *MEMORY[0x1E0C80C00];
  v25.receiver = *(id *)(a1 + 32);
  v25.super_class = (Class)&OBJC_METACLASS___CLSCollaborationState;
  objc_msgSendSuper2(&v25, sel_relations);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED0FB7A8;
  qword_1ED0FB7A8 = v2;

  v4 = [CLSChildParentRelation alloc];
  v5 = *(_QWORD *)(a1 + 32);
  v6 = objc_opt_class();
  v8 = (void *)objc_msgSend_initWithChildEntity_parentEntity_faultable_(v4, v7, v5, v6, 1);
  v9 = [CLSChildParentRelation alloc];
  v10 = *(_QWORD *)(a1 + 32);
  v11 = objc_opt_class();
  v13 = (void *)objc_msgSend_initWithChildEntity_parentEntity_faultable_(v9, v12, v10, v11, 1);
  v14 = [CLSParentChildRelation alloc];
  v15 = *(_QWORD *)(a1 + 32);
  v16 = objc_opt_class();
  v18 = (void *)objc_msgSend_initWithParentEntity_childEntity_faultable_(v14, v17, v15, v16, 1);
  v19 = (void *)qword_1ED0FB7A8;
  v26[0] = v8;
  v26[1] = v13;
  v26[2] = v18;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v20, (uint64_t)v26, 3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setByAddingObjectsFromArray_(v19, v22, (uint64_t)v21);
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = (void *)qword_1ED0FB7A8;
  qword_1ED0FB7A8 = v23;

}

uint64_t sub_1D409EA0C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_1D409EA20(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    objc_msgSend_url(a2, (const char *)a2, a3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, _QWORD))(v3 + 16))(v3, v4, 0);

  }
  else
  {
    (*(void (**)(_QWORD))(v3 + 16))(*(_QWORD *)(a1 + 32));
  }
}

uint64_t sub_1D409EB70(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_1D409EB84(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    objc_msgSend_url(a2, (const char *)a2, a3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, _QWORD))(v3 + 16))(v3, v4, 0);

  }
  else
  {
    (*(void (**)(_QWORD))(v3 + 16))(*(_QWORD *)(a1 + 32));
  }
}

uint64_t sub_1D409ECD0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_1D409ECE4(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    objc_msgSend_url(a2, (const char *)a2, a3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, _QWORD))(v3 + 16))(v3, v4, 0);

  }
  else
  {
    (*(void (**)(_QWORD))(v3 + 16))(*(_QWORD *)(a1 + 32));
  }
}

uint64_t sub_1D409EE34(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_1D409EE4C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_1D409EF3C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_1D409EF50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a3 == 0);
}

uint64_t sub_1D409F00C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_1D409F11C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D409F134(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (qword_1ED0FB9A0 != -1)
    dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
  v3 = CLSLogDefault;
  if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_error_impl(&dword_1D4054000, v3, OS_LOG_TYPE_ERROR, "syncUtilityServer connection failed with error: %{public}@", (uint8_t *)&v4, 0xCu);
  }

}

uint64_t sub_1D409F208(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1D409F218(uint64_t a1)
{

}

void sub_1D409F220(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

__CFString *NSStringFromCLSSliderAnswerFormatType(uint64_t a1, const char *a2)
{
  __CFString *v2;

  if (a1)
  {
    v2 = CFSTR("Continuous");
  }
  else
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("Unknown slider type: '%ld'"), 0);
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

uint64_t CLSSliderAnswerFormatTypeFromString(void *a1)
{
  id v1;
  const char *v2;
  void *v3;
  uint64_t v5;
  const char *v6;
  id v7;

  v1 = a1;
  v3 = v1;
  if (!v1 || !objc_msgSend_isEqualToString_(v1, v2, (uint64_t)CFSTR("Continuous")))
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v2, (uint64_t)CFSTR("Unknown slider type: '%@'"), v3);
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E0C99DA0], v6, *MEMORY[0x1E0C99778], v5, 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v7);
  }

  return 1;
}

void sub_1D40A10AC(uint64_t a1)
{
  id *v2;
  _QWORD *WeakRetained;
  const char *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  void *v27;
  const char *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  void *v37;
  const char *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  NSObject *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  _QWORD v58[5];
  id v59;
  _QWORD v60[4];
  id v61;
  _QWORD v62[4];
  id v63;
  id v64;
  id v65;
  _QWORD block[5];
  id v67;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    if (WeakRetained[3])
    {
      dispatch_get_global_queue(25, 0);
      v6 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = sub_1D40A1508;
      block[3] = &unk_1E974B628;
      block[4] = v5;
      v67 = *(id *)(a1 + 32);
      dispatch_async(v6, block);

    }
    else
    {
      v7 = (void *)WeakRetained[2];
      v65 = 0;
      objc_msgSend_beginExtensionRequestWithOptions_inputItems_error_(v7, v4, 1, 0, &v65);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v65;
      if (v11)
      {
        dispatch_get_global_queue(25, 0);
        v12 = objc_claimAutoreleasedReturnValue();
        v62[0] = MEMORY[0x1E0C809B0];
        v62[1] = 3221225472;
        v62[2] = sub_1D40A1530;
        v62[3] = &unk_1E974A088;
        v64 = *(id *)(a1 + 32);
        v63 = v11;
        dispatch_async(v12, v62);

        v13 = v64;
      }
      else
      {
        v55 = v8;
        v14 = objc_msgSend_copy(v8, v9, v10);
        v15 = (void *)*((_QWORD *)v5 + 3);
        *((_QWORD *)v5 + 3) = v14;

        objc_msgSend__extensionContextForUUID_(*((void **)v5 + 2), v16, *((_QWORD *)v5 + 3));
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = (void *)*((_QWORD *)v5 + 4);
        *((_QWORD *)v5 + 4) = v17;

        objc_msgSend__auxiliaryConnection(*((void **)v5 + 4), v19, v20);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_remoteObjectInterface(v57, v21, v22);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (void *)MEMORY[0x1E0C99E60];
        v24 = objc_opt_class();
        v25 = objc_opt_class();
        objc_msgSend_setWithObjects_(v23, v26, v24, v25, 0);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v56, v28, (uint64_t)v27, sel_getMainAppContextPathWithCompletion_, 0, 1);

        v29 = (void *)MEMORY[0x1E0C99E60];
        v30 = objc_opt_class();
        v31 = objc_opt_class();
        v32 = objc_opt_class();
        v33 = objc_opt_class();
        v34 = objc_opt_class();
        v35 = objc_opt_class();
        objc_msgSend_setWithObjects_(v29, v36, v30, v31, v32, v33, v34, v35, 0);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v56, v38, (uint64_t)v37, sel_getMainAppContextPathWithCompletion_, 1, 1);

        v39 = (void *)MEMORY[0x1E0C99E60];
        v40 = objc_opt_class();
        v41 = objc_opt_class();
        v42 = objc_opt_class();
        v43 = objc_opt_class();
        v44 = objc_opt_class();
        v45 = objc_opt_class();
        v54 = v41;
        v13 = v57;
        objc_msgSend_setWithObjects_(v39, v46, v40, v54, v42, v43, v44, v45, 0);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v56, v48, (uint64_t)v47, sel_updateDescendantsOfContextPath_completion_, 0, 1);

        v49 = MEMORY[0x1E0C809B0];
        v60[0] = MEMORY[0x1E0C809B0];
        v60[1] = 3221225472;
        v60[2] = sub_1D40A1540;
        v60[3] = &unk_1E974B650;
        objc_copyWeak(&v61, v2);
        objc_msgSend_remoteObjectProxyWithErrorHandler_(v57, v50, (uint64_t)v60);
        v51 = objc_claimAutoreleasedReturnValue();
        v52 = (void *)*((_QWORD *)v5 + 5);
        *((_QWORD *)v5 + 5) = v51;

        dispatch_get_global_queue(25, 0);
        v53 = objc_claimAutoreleasedReturnValue();
        v58[0] = v49;
        v58[1] = 3221225472;
        v58[2] = sub_1D40A1650;
        v58[3] = &unk_1E974B628;
        v58[4] = v5;
        v59 = *(id *)(a1 + 32);
        dispatch_async(v53, v58);

        objc_destroyWeak(&v61);
        v11 = 0;
        v8 = v55;
      }

    }
  }

}

void sub_1D40A14F4(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1D40A1508(uint64_t a1)
{
  unsigned int *v1;
  unsigned int v2;

  v1 = (unsigned int *)(*(_QWORD *)(a1 + 32) + 56);
  do
    v2 = __ldaxr(v1);
  while (__stlxr(v2 + 1, v1));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t sub_1D40A1530(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void sub_1D40A1540(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v5 = CLSLogDefault;
    if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR))
    {
      v6 = WeakRetained[8];
      v7 = WeakRetained[9];
      v8 = 138412802;
      v9 = v6;
      v10 = 2112;
      v11 = v7;
      v12 = 2114;
      v13 = v3;
      _os_log_error_impl(&dword_1D4054000, v5, OS_LOG_TYPE_ERROR, "Failed to get the remote extension context for extension: '%@' in '%@', error: %{public}@\n", (uint8_t *)&v8, 0x20u);
    }
  }

}

uint64_t sub_1D40A1650(uint64_t a1)
{
  unsigned int *v1;
  unsigned int v2;

  v1 = (unsigned int *)(*(_QWORD *)(a1 + 32) + 56);
  do
    v2 = __ldaxr(v1);
  while (__stlxr(v2 + 1, v1));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void sub_1D40A1708(uint64_t a1)
{
  char *WeakRetained;
  unsigned int *v2;
  unsigned int v3;
  void *v5;
  void *v6;
  void *v7;
  char *v8;

  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (*((_QWORD *)WeakRetained + 3))
    {
      v2 = (unsigned int *)(WeakRetained + 56);
      do
        v3 = __ldaxr(v2);
      while (__stlxr(v3 - 1, v2));
      if (!atomic_load(v2))
      {
        v8 = WeakRetained;
        objc_msgSend_cancelExtensionRequestWithIdentifier_(*((void **)WeakRetained + 2), v8, *((_QWORD *)v8 + 3));
        v5 = (void *)*((_QWORD *)v8 + 3);
        *((_QWORD *)v8 + 3) = 0;

        v6 = (void *)*((_QWORD *)v8 + 4);
        *((_QWORD *)v8 + 4) = 0;

        v7 = (void *)*((_QWORD *)v8 + 5);
        *((_QWORD *)v8 + 5) = 0;

        WeakRetained = v8;
      }
    }
  }

}

void sub_1D40A185C(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  const char *v5;
  id v6;
  NSObject *v7;
  const char *v8;
  void *v9;
  NSObject *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  uint8_t buf[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*((_QWORD *)WeakRetained + 3))
    {
      v4 = (void *)*((_QWORD *)WeakRetained + 5);
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = sub_1D40A1A10;
      v12[3] = &unk_1E974AFE8;
      v13 = *(id *)(a1 + 32);
      objc_msgSend_getMainAppContextPathWithCompletion_(v4, v5, (uint64_t)v12);
      v6 = v13;
    }
    else
    {
      if (qword_1ED0FB9A0 != -1)
        dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
      v7 = CLSLogDefault;
      if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D4054000, v7, OS_LOG_TYPE_ERROR, "Not connected to context provider service.", buf, 2u);
      }
      objc_msgSend_cls_createErrorWithCode_format_(MEMORY[0x1E0CB35C8], v8, 102, CFSTR("Not connected to context provider service."));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      dispatch_get_global_queue(25, 0);
      v10 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = sub_1D40A19FC;
      block[3] = &unk_1E974A088;
      v11 = *(id *)(a1 + 32);
      v15 = v9;
      v16 = v11;
      v6 = v9;
      dispatch_async(v10, block);

    }
  }

}

uint64_t sub_1D40A19FC(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void sub_1D40A1A10(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  dispatch_get_global_queue(25, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D40A1AE0;
  block[3] = &unk_1E9749E10;
  v8 = *(id *)(a1 + 32);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t sub_1D40A1AE0(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void sub_1D40A1BCC(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  const char *v6;
  id v7;
  NSObject *v8;
  const char *v9;
  void *v10;
  NSObject *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  uint8_t buf[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*((_QWORD *)WeakRetained + 3))
    {
      v4 = (void *)*((_QWORD *)WeakRetained + 5);
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = sub_1D40A1D80;
      v13[3] = &unk_1E9749F88;
      v5 = *(_QWORD *)(a1 + 32);
      v14 = *(id *)(a1 + 40);
      objc_msgSend_updateDescendantsOfContextPath_completion_(v4, v6, v5, v13);
      v7 = v14;
    }
    else
    {
      if (qword_1ED0FB9A0 != -1)
        dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
      v8 = CLSLogDefault;
      if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D4054000, v8, OS_LOG_TYPE_ERROR, "Not connected to context provider service.", buf, 2u);
      }
      objc_msgSend_cls_createErrorWithCode_format_(MEMORY[0x1E0CB35C8], v9, 102, CFSTR("Not connected to context provider service."));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      dispatch_get_global_queue(25, 0);
      v11 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = sub_1D40A1D70;
      block[3] = &unk_1E974A088;
      v12 = *(id *)(a1 + 40);
      v16 = v10;
      v17 = v12;
      v7 = v10;
      dispatch_async(v11, block);

    }
  }

}

uint64_t sub_1D40A1D70(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void sub_1D40A1D80(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  dispatch_get_global_queue(25, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1D40A1E2C;
  v7[3] = &unk_1E974A088;
  v5 = *(id *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t sub_1D40A1E2C(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

__CFString *NSStringFromHandoutAttachmentType(unsigned int a1, const char *a2)
{
  if (a1 < 7)
    return off_1E974B6C0[a1];
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("Unknown handout attachment type: '%ld'"), (int)a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *NSStringFromHandoutAttachmentCompletionStatus(unsigned int a1, const char *a2)
{
  if (a1 < 5)
    return off_1E974B6F8[a1];
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("Unknown handout attachment completion status: '%ld'"), (int)a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

uint64_t sub_1D40A4490(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t CLSHandoutAttachmentTypeFromString(void *a1)
{
  id v1;
  const char *v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  uint64_t v12;
  const char *v13;
  id v14;

  v1 = a1;
  v3 = v1;
  if (!v1)
    goto LABEL_17;
  if ((objc_msgSend_isEqualToString_(v1, v2, (uint64_t)CFSTR("URL")) & 1) == 0)
  {
    if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("Context")) & 1) != 0)
    {
      v5 = 1;
      goto LABEL_16;
    }
    if ((objc_msgSend_isEqualToString_(v3, v6, (uint64_t)CFSTR("Asset")) & 1) != 0)
    {
      v5 = 2;
      goto LABEL_16;
    }
    if ((objc_msgSend_isEqualToString_(v3, v7, (uint64_t)CFSTR("App")) & 1) != 0)
    {
      v5 = 3;
      goto LABEL_16;
    }
    if ((objc_msgSend_isEqualToString_(v3, v8, (uint64_t)CFSTR("HandInRequest")) & 1) != 0)
    {
      v5 = 4;
      goto LABEL_16;
    }
    if ((objc_msgSend_isEqualToString_(v3, v9, (uint64_t)CFSTR("Survey")) & 1) != 0)
    {
      v5 = 5;
      goto LABEL_16;
    }
    if ((objc_msgSend_isEqualToString_(v3, v10, (uint64_t)CFSTR("Assessment")) & 1) != 0)
    {
      v5 = 6;
      goto LABEL_16;
    }
LABEL_17:
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v2, (uint64_t)CFSTR("Unknown handout attachment type: '%@'"), v3);
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E0C99DA0], v13, *MEMORY[0x1E0C99778], v12, 0);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v14);
  }
  v5 = 0;
LABEL_16:

  return v5;
}

uint64_t CLSHandoutAttachmentCompletionStatusFromString(void *a1)
{
  id v1;
  const char *v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  const char *v8;
  uint64_t v10;
  const char *v11;
  id v12;

  v1 = a1;
  v3 = v1;
  if (!v1)
    goto LABEL_13;
  if ((objc_msgSend_isEqualToString_(v1, v2, (uint64_t)CFSTR("Incomplete")) & 1) == 0)
  {
    if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("Complete")) & 1) != 0)
    {
      v5 = 3;
      goto LABEL_12;
    }
    if ((objc_msgSend_isEqualToString_(v3, v6, (uint64_t)CFSTR("MarkedForCompletion")) & 1) != 0)
    {
      v5 = 1;
      goto LABEL_12;
    }
    if ((objc_msgSend_isEqualToString_(v3, v7, (uint64_t)CFSTR("MarkedForIncompletion")) & 1) != 0)
    {
      v5 = 2;
      goto LABEL_12;
    }
    if ((objc_msgSend_isEqualToString_(v3, v8, (uint64_t)CFSTR("Returned")) & 1) != 0)
    {
      v5 = 4;
      goto LABEL_12;
    }
LABEL_13:
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v2, (uint64_t)CFSTR("Unknown handout attachment completion status string: '%@'"), v3);
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E0C99DA0], v11, *MEMORY[0x1E0C99778], v10, 0);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v12);
  }
  v5 = 0;
LABEL_12:

  return v5;
}

void sub_1D40A4840()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  const char *v3;
  uint64_t v4;
  void *v5;

  v0 = objc_alloc(MEMORY[0x1E0C99E60]);
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v4 = objc_msgSend_initWithObjects_(v0, v3, v1, v2, 0);
  v5 = (void *)qword_1ED0FB7C0;
  qword_1ED0FB7C0 = v4;

}

uint64_t sub_1D40A4B48(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1E0DE7D20](a2, sel__faultObjectsBatch_, *(_QWORD *)(a1 + 32));
}

void sub_1D40A4FD4(uint64_t a1, uint64_t a2)
{
  dispatch_group_notify(*(dispatch_group_t *)(a2 + 24), *(dispatch_queue_t *)(a2 + 16), *(dispatch_block_t *)(a1 + 32));
}

uint64_t sub_1D40A50A8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_1D40A570C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id location)
{
  id *v28;

  objc_destroyWeak(v28);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D40A5748(uint64_t a1)
{

}

void sub_1D40A5990(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D40A5DFC(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    WeakRetained = v3;
  }

}

uint64_t sub_1D40A5EC0(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1E0DE7D20](a2, sel__faultObjectsBatch_, *(_QWORD *)(a1 + 32));
}

void sub_1D40A5F64()
{
  NSObject *v0;
  NSObject *v1;
  dispatch_queue_t v2;
  void *v3;
  NSObject *attr;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_USER_INITIATED, 0);
  attr = objc_claimAutoreleasedReturnValue();

  dispatch_get_global_queue(25, 0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = dispatch_queue_create_with_target_V2("com.apple.ClassKit.faults", attr, v1);
  v3 = (void *)qword_1ED0FB7C8;
  qword_1ED0FB7C8 = (uint64_t)v2;

}

void sub_1D40A6EE4(uint64_t a1)
{
  id v1;
  const char *v2;
  uint64_t v3;
  void *v4;

  v1 = objc_alloc(*(Class *)(a1 + 32));
  v3 = objc_msgSend_initWithEndpoint_(v1, v2, 0);
  v4 = (void *)qword_1ED0FB7D8;
  qword_1ED0FB7D8 = v3;

}

uint64_t sub_1D40A71E4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_1D40A72F0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_1D40A7304(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D40A73A4;
  block[3] = &unk_1E974B848;
  v12 = a2;
  v10 = v5;
  v11 = v6;
  v8 = v5;
  dispatch_async(v7, block);

}

uint64_t sub_1D40A73A4(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  uint64_t v6;

  objc_msgSend_shared(CLSDataStore, a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_reset(v4, v5, v6);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t sub_1D40A74F0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_1D40A7504(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D40A75A4;
  block[3] = &unk_1E974B848;
  v12 = a2;
  v10 = v5;
  v11 = v6;
  v8 = v5;
  dispatch_async(v7, block);

}

uint64_t sub_1D40A75A4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

uint64_t sub_1D40A76B0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_1D40A76C4(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D40A7764;
  block[3] = &unk_1E974B848;
  v12 = a2;
  v10 = v5;
  v11 = v6;
  v8 = v5;
  dispatch_async(v7, block);

}

uint64_t sub_1D40A7764(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  uint64_t v6;

  objc_msgSend_shared(CLSDataStore, a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_reset(v4, v5, v6);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t sub_1D40A78A0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_1D40A78B4(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D40A7954;
  block[3] = &unk_1E974B848;
  v12 = a2;
  v10 = v5;
  v11 = v6;
  v8 = v5;
  dispatch_sync(v7, block);

}

uint64_t sub_1D40A7954(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  uint64_t v6;

  objc_msgSend_shared(CLSDataStore, a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_reset(v4, v5, v6);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t sub_1D40A7A24(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_1D40A7AC4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_1D40A7C6C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_1D40A7D0C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_1D40A7DBC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_1D40A7E64(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_1D40A7EFC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_1D40A7F9C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_1D40A803C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_1D40A80DC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_1D40A8198(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_1D40A8238(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_1D40A82D8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_1D40A83E4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_1D40A83F8(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D40A8498;
  block[3] = &unk_1E974B848;
  v12 = a2;
  v10 = v5;
  v11 = v6;
  v8 = v5;
  dispatch_async(v7, block);

}

uint64_t sub_1D40A8498(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  uint64_t v6;

  objc_msgSend_shared(CLSDataStore, a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_reset(v4, v5, v6);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t sub_1D40A85D0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_1D40A85E4(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D40A8684;
  block[3] = &unk_1E974B848;
  v12 = a2;
  v10 = v5;
  v11 = v6;
  v8 = v5;
  dispatch_async(v7, block);

}

uint64_t sub_1D40A8684(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  uint64_t v6;

  objc_msgSend_shared(CLSDataStore, a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_reset(v4, v5, v6);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t sub_1D40A87BC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_1D40A87D0(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D40A8870;
  block[3] = &unk_1E974B848;
  v12 = a2;
  v10 = v5;
  v11 = v6;
  v8 = v5;
  dispatch_async(v7, block);

}

uint64_t sub_1D40A8870(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  uint64_t v6;

  objc_msgSend_shared(CLSDataStore, a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_reset(v4, v5, v6);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t sub_1D40A89A8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_1D40A89BC(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D40A8A5C;
  block[3] = &unk_1E974B848;
  v12 = a2;
  v10 = v5;
  v11 = v6;
  v8 = v5;
  dispatch_async(v7, block);

}

uint64_t sub_1D40A8A5C(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  uint64_t v6;

  objc_msgSend_shared(CLSDataStore, a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_reset(v4, v5, v6);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t sub_1D40A8B48(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_1D40A8C04(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_1D40A8CC0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_1D40A8D90(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_1D40A8E4C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_1D40A8EEC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_1D40A8F8C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_1D40A903C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_1D40A90DC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_1D40A91A4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_1D40A91F4()
{
  NSObject *v0;
  NSObject *v1;
  dispatch_queue_t v2;
  void *v3;
  NSObject *attr;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_USER_INITIATED, 0);
  attr = objc_claimAutoreleasedReturnValue();

  dispatch_get_global_queue(25, 0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = dispatch_queue_create_with_target_V2("com.apple.ClassKit.utilityService", attr, v1);
  v3 = (void *)qword_1ED0FB7E8;
  qword_1ED0FB7E8 = (uint64_t)v2;

}

void sub_1D40A9304(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  CLSChildParentRelation *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  objc_super v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v15.receiver = *(id *)(a1 + 32);
  v15.super_class = (Class)&OBJC_METACLASS___CLSClassMember;
  objc_msgSendSuper2(&v15, sel_relations);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED0FB7F8;
  qword_1ED0FB7F8 = v2;

  v4 = [CLSChildParentRelation alloc];
  v5 = *(_QWORD *)(a1 + 32);
  v6 = objc_opt_class();
  v8 = (void *)objc_msgSend_initWithChildEntity_parentEntity_faultable_(v4, v7, v5, v6, 1);
  v9 = (void *)qword_1ED0FB7F8;
  v16[0] = v8;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v10, (uint64_t)v16, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setByAddingObjectsFromArray_(v9, v12, (uint64_t)v11);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)qword_1ED0FB7F8;
  qword_1ED0FB7F8 = v13;

}

unint64_t surveyQuestionTypeFromAnswerFormatType(unint64_t result)
{
  if (result >= 5)
    return 1;
  return result;
}

uint64_t sub_1D40A9C00(uint64_t a1, void *a2, _BYTE *a3)
{
  id v4;
  char isKindOfClass;

  v4 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    *a3 = 1;
  return isKindOfClass & 1;
}

__CFString *NSStringFromSurveyQuestionType(uint64_t a1, const char *a2)
{
  if ((unint64_t)(a1 - 1) < 4)
    return off_1E974B928[a1 - 1];
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("Unknown question type: '%ld'"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

uint64_t SurveyQuestionTypeFromString(void *a1)
{
  id v1;
  const char *v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  uint64_t v9;
  const char *v10;
  id v11;

  v1 = a1;
  v3 = v1;
  if (!v1)
    goto LABEL_11;
  if ((objc_msgSend_isEqualToString_(v1, v2, (uint64_t)CFSTR("Slider")) & 1) == 0)
  {
    if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("OpenResponse")) & 1) != 0)
    {
      v5 = 3;
      goto LABEL_10;
    }
    if ((objc_msgSend_isEqualToString_(v3, v6, (uint64_t)CFSTR("MultipleChoice")) & 1) != 0)
    {
      v5 = 2;
      goto LABEL_10;
    }
    if ((objc_msgSend_isEqualToString_(v3, v7, (uint64_t)CFSTR("Rating")) & 1) != 0)
    {
      v5 = 4;
      goto LABEL_10;
    }
LABEL_11:
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v2, (uint64_t)CFSTR("Unknown question type: '%@'"), v3);
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E0C99DA0], v10, *MEMORY[0x1E0C99778], v9, 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v11);
  }
  v5 = 1;
LABEL_10:

  return v5;
}

void sub_1D40AAB20(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  CLSChildParentRelation *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  CLSParentChildRelation *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  objc_super v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v20.receiver = *(id *)(a1 + 32);
  v20.super_class = (Class)&OBJC_METACLASS___CLSMultipleChoiceAnswerItem;
  objc_msgSendSuper2(&v20, sel_relations);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED0FB808;
  qword_1ED0FB808 = v2;

  v4 = [CLSChildParentRelation alloc];
  v5 = *(_QWORD *)(a1 + 32);
  v6 = objc_opt_class();
  v8 = (void *)objc_msgSend_initWithChildEntity_parentEntity_faultable_(v4, v7, v5, v6, 1);
  v9 = [CLSParentChildRelation alloc];
  v10 = *(_QWORD *)(a1 + 32);
  v11 = objc_opt_class();
  v13 = (void *)objc_msgSend_initWithParentEntity_childEntity_faultable_(v9, v12, v10, v11, 1);
  v14 = (void *)qword_1ED0FB808;
  v21[0] = v8;
  v21[1] = v13;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v15, (uint64_t)v21, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setByAddingObjectsFromArray_(v14, v17, (uint64_t)v16);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)qword_1ED0FB808;
  qword_1ED0FB808 = v18;

}

void sub_1D40AB770(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1D40AB798(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1D40AB7A8(uint64_t a1)
{

}

void sub_1D40AB7B4(_QWORD *a1, void *a2, void *a3)
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  CGImage *v10;
  CGImage *v11;
  NSObject *v12;
  const char *v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a3);
  v7 = a2;
  v10 = (CGImage *)objc_msgSend_CGImage(v7, v8, v9);

  v11 = CGImageRetain(v10);
  if (qword_1ED0FB9A0 != -1)
    dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
  v12 = CLSLogDefault;
  if (v11)
  {
    if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1D4054000, v12, OS_LOG_TYPE_DEBUG, "JPEGDataForThumbnailForFileAtURL retrieved a thumbnail using QLThumbnailGenerationRequest", buf, 2u);
    }
    v14 = (void *)a1[7];
    v19 = v6;
    objc_msgSend_JPEGDataFromCGImage_error_(v14, v13, (uint64_t)v11, &v19);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v19;

    v17 = *(_QWORD *)(a1[6] + 8);
    v18 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v15;

    CGImageRelease(v11);
    v6 = v16;
  }
  else if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v6;
    _os_log_error_impl(&dword_1D4054000, v12, OS_LOG_TYPE_ERROR, "JPEGDataForThumbnailForFileAtURL failed to retrieve a thumbnail using QLThumbnailGenerationRequest. Error: '%@'", buf, 0xCu);
  }
  (*(void (**)(void))(a1[4] + 16))();

}

void sub_1D40ABA7C(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  CLSChildParentRelation *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  CLSParentChildRelation *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  objc_super v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v20.receiver = *(id *)(a1 + 32);
  v20.super_class = (Class)&OBJC_METACLASS___CLSHandoutAssignedItem;
  objc_msgSendSuper2(&v20, sel_relations);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED0FB818;
  qword_1ED0FB818 = v2;

  v4 = [CLSChildParentRelation alloc];
  v5 = *(_QWORD *)(a1 + 32);
  v6 = objc_opt_class();
  v8 = (void *)objc_msgSend_initWithChildEntity_parentEntity_faultable_(v4, v7, v5, v6, 0);
  v9 = [CLSParentChildRelation alloc];
  v10 = *(_QWORD *)(a1 + 32);
  v11 = objc_opt_class();
  v13 = (void *)objc_msgSend_initWithParentEntity_childEntity_faultable_(v9, v12, v10, v11, 1);
  v14 = (void *)qword_1ED0FB818;
  v21[0] = v8;
  v21[1] = v13;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v15, (uint64_t)v21, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setByAddingObjectsFromArray_(v14, v17, (uint64_t)v16);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)qword_1ED0FB818;
  qword_1ED0FB818 = v18;

}

BOOL sub_1D40ABBCC(void *a1, const char *a2, uint64_t a3)
{
  void *v3;
  void *v4;
  _BOOL8 v5;

  CLSExtensionPropertiesForConnection(a1, a2, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x1E0C83AE8]) != 0;
  else
    v5 = 0;

  return v5;
}

__CFString *sub_1D40ABC20(void *a1, const char *a2, uint64_t a3)
{
  __SecTask *v3;
  __SecTask *v4;
  __CFString *v5;
  NSObject *v6;
  NSObject *v7;
  CFErrorRef error;
  audit_token_t token;
  uint8_t buf[4];
  CFErrorRef v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend_auditToken(a1, a2, a3);
  v3 = SecTaskCreateWithAuditToken(0, &token);
  if (v3)
  {
    v4 = v3;
    error = 0;
    v5 = (__CFString *)SecTaskCopySigningIdentifier(v3, &error);
    if (error)
    {
      if (qword_1ED0FB9A0 != -1)
        dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
      v6 = CLSLogDefault;
      if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v12 = error;
        _os_log_error_impl(&dword_1D4054000, v6, OS_LOG_TYPE_ERROR, "Unable to get signing identifier from connection: %{public}@", buf, 0xCu);
      }
      CFRelease(error);
    }
    CFRelease(v4);
  }
  else
  {
    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v7 = CLSLogDefault;
    if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D4054000, v7, OS_LOG_TYPE_ERROR, "Unable to retrieve remote task for signing identifier lookup", buf, 2u);
    }
    v5 = 0;
  }
  return v5;
}

__CFString *NSStringFromBinaryValueType(unint64_t a1)
{
  if (a1 > 3)
    return 0;
  else
    return off_1E974B970[a1];
}

uint64_t CLSBinaryValueTypeFromString(void *a1)
{
  const char *v1;
  id v2;
  const char *v3;
  uint64_t v4;
  const char *v5;
  const char *v6;
  uint64_t v8;
  const char *v9;
  id v10;

  v2 = a1;
  if (!v2)
    goto LABEL_11;
  if ((objc_msgSend_isEqualToString_(CFSTR("TrueFalse"), v1, (uint64_t)v2) & 1) == 0)
  {
    if ((objc_msgSend_isEqualToString_(CFSTR("PassFail"), v3, (uint64_t)v2) & 1) != 0)
    {
      v4 = 1;
      goto LABEL_10;
    }
    if ((objc_msgSend_isEqualToString_(CFSTR("YesNo"), v5, (uint64_t)v2) & 1) != 0)
    {
      v4 = 2;
      goto LABEL_10;
    }
    if ((objc_msgSend_isEqualToString_(CFSTR("CorrectIncorrect"), v6, (uint64_t)v2) & 1) != 0)
    {
      v4 = 3;
      goto LABEL_10;
    }
LABEL_11:
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v1, (uint64_t)CFSTR("Unknown binary value type: '%@'"), v2);
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E0C99DA0], v9, *MEMORY[0x1E0C99778], v8, 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v10);
  }
  v4 = 0;
LABEL_10:

  return v4;
}

uint64_t sub_1D40AD33C()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  byte_1ED0FB828 = result;
  return result;
}

uint64_t sub_1D40AD3A0()
{
  uint64_t result;

  result = csr_check();
  byte_1EFE35E50 = (_DWORD)result != 0;
  return result;
}

uint64_t sub_1D40AD590()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3570]);
  v1 = (void *)qword_1ED0FB838;
  qword_1ED0FB838 = (uint64_t)v0;

  return MEMORY[0x1E0DE7D20](qword_1ED0FB838, sel_setUnitsStyle_, 1);
}

uint64_t sub_1D40AD60C()
{
  id v0;
  void *v1;
  const char *v2;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)qword_1ED0FB848;
  qword_1ED0FB848 = (uint64_t)v0;

  objc_msgSend_setDateStyle_((void *)qword_1ED0FB848, v2, 2);
  return MEMORY[0x1E0DE7D20](qword_1ED0FB848, sel_setTimeStyle_, 1);
}

id clsNotificationQueue()
{
  if (qword_1ED0FB860 != -1)
    dispatch_once(&qword_1ED0FB860, &unk_1E974BA60);
  return (id)qword_1ED0FB858;
}

uint64_t sub_1D40AE080(uint64_t a1)
{
  return MEMORY[0x1E0DE7D20](CLSUtil, sel_postNotification_, *(_QWORD *)(a1 + 32));
}

void sub_1D40AE2A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1D40AE2D0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1D40AE2E0(uint64_t a1)
{

}

void sub_1D40AE2EC(_QWORD *a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a2);
  if (v7)
  {
    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v8 = CLSLogDefault;
    if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR))
    {
      v9 = 138412290;
      v10 = v7;
      _os_log_error_impl(&dword_1D4054000, v8, OS_LOG_TYPE_ERROR, "Failed to get user defaults configuration dictionary with error: %@", (uint8_t *)&v9, 0xCu);
    }
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a3);
  }
  (*(void (**)(void))(a1[4] + 16))();

}

BOOL CLSXPCDictionaryUpdateWithDictionary(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  _BOOL8 v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  v6 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  if (v3 && v4)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_1D40AE650;
    v8[3] = &unk_1E974BA40;
    v9 = v3;
    v10 = &v11;
    xpc_dictionary_apply(v5, v8);

    v6 = *((_BYTE *)v12 + 24) != 0;
  }
  _Block_object_dispose(&v11, 8);

  return v6;
}

void sub_1D40AE638(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1D40AE650(uint64_t a1, const char *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 32), a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6 || !xpc_equal(v6, v5))
  {
    xpc_dictionary_set_value(*(xpc_object_t *)(a1 + 32), a2, v5);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }

  return 1;
}

id CLSExtensionPropertiesForCurrentTask()
{
  getpid();
  return (id)launch_copy_extension_properties_for_pid();
}

void *CLSIsAppExtensionWithProperties(void *result)
{
  if (result)
    return (void *)(xpc_dictionary_get_string(result, (const char *)*MEMORY[0x1E0C83AE8]) != 0);
  return result;
}

BOOL CLSIsCurrentTaskAppExtension()
{
  void *v0;
  void *v1;
  _BOOL8 v2;

  getpid();
  v0 = (void *)launch_copy_extension_properties_for_pid();
  v1 = v0;
  if (v0)
    v2 = xpc_dictionary_get_string(v0, (const char *)*MEMORY[0x1E0C83AE8]) != 0;
  else
    v2 = 0;

  return v2;
}

void sub_1D40AE76C()
{
  NSObject *v0;
  NSObject *v1;
  dispatch_queue_t v2;
  void *v3;
  NSObject *attr;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_USER_INITIATED, 0);
  attr = objc_claimAutoreleasedReturnValue();

  dispatch_get_global_queue(25, 0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = dispatch_queue_create_with_target_V2("com.apple.ClassKit.notifications", attr, v1);
  v3 = (void *)qword_1ED0FB858;
  qword_1ED0FB858 = (uint64_t)v2;

}

uint64_t CLSExecutableLinkedOnOrAfter_iOS13_2_macOS_10_15_1()
{
  if (qword_1ED0FB868 != -1)
    dispatch_once(&qword_1ED0FB868, &unk_1E974BA80);
  return byte_1ED0FB829;
}

uint64_t sub_1D40AE838()
{
  uint64_t result;

  result = dyld_program_sdk_at_least();
  byte_1ED0FB829 = result;
  return result;
}

uint64_t CLSExecutableLinkedOnOrAfter_iOS13_2()
{
  if (qword_1ED0FB868 != -1)
    dispatch_once(&qword_1ED0FB868, &unk_1E974BA80);
  return byte_1ED0FB829;
}

uint64_t CLSExecutableLinkedOnOrAfter_iOS14_0_macOS_10_16()
{
  if (qword_1ED0FB870 != -1)
    dispatch_once(&qword_1ED0FB870, &unk_1E974BAA0);
  return byte_1ED0FB82A;
}

uint64_t sub_1D40AE8DC()
{
  uint64_t result;

  result = dyld_program_sdk_at_least();
  byte_1ED0FB82A = result;
  return result;
}

uint64_t CLSExecutableLinkedOnOrAfter_iOS14_0()
{
  if (qword_1ED0FB870 != -1)
    dispatch_once(&qword_1ED0FB870, &unk_1E974BAA0);
  return byte_1ED0FB82A;
}

uint64_t CLSExecutableLinkedOnOrAfter_iOS14_2_macOS_10_16()
{
  if (qword_1ED0FB878 != -1)
    dispatch_once(&qword_1ED0FB878, &unk_1E974BAC0);
  return byte_1ED0FB82B;
}

uint64_t sub_1D40AE980()
{
  uint64_t result;

  result = dyld_program_sdk_at_least();
  byte_1ED0FB82B = result;
  return result;
}

uint64_t CLSExecutableLinkedOnOrAfter_iOS17_5_macOS_14_5()
{
  if (qword_1ED0FB880 != -1)
    dispatch_once(&qword_1ED0FB880, &unk_1E974BAE0);
  return byte_1ED0FB82C;
}

uint64_t sub_1D40AE9E4()
{
  uint64_t result;

  result = dyld_program_sdk_at_least();
  byte_1ED0FB82C = result;
  return result;
}

uint64_t CLSExecutableLinkedOnOrAfter_iOS14_2()
{
  if (qword_1ED0FB878 != -1)
    dispatch_once(&qword_1ED0FB878, &unk_1E974BAC0);
  return byte_1ED0FB82B;
}

uint64_t CLSExecutableLinkedOnOrAfter_iOS15_1_macOS_12_0()
{
  if (qword_1ED0FB888 != -1)
    dispatch_once(&qword_1ED0FB888, &unk_1E974BB00);
  return byte_1ED0FB82D;
}

uint64_t sub_1D40AEA88()
{
  uint64_t result;

  result = dyld_program_sdk_at_least();
  byte_1ED0FB82D = result;
  return result;
}

uint64_t CLSExecutableLinkedOnOrAfter_iOS16_2_macOS_13_1()
{
  if (qword_1ED0FB890 != -1)
    dispatch_once(&qword_1ED0FB890, &unk_1E974BB20);
  return byte_1ED0FB82E;
}

uint64_t sub_1D40AEAEC()
{
  uint64_t result;

  result = dyld_program_sdk_at_least();
  byte_1ED0FB82E = result;
  return result;
}

uint64_t CurrentProcessBundleIdentiferMatches(void *a1)
{
  void *v1;
  id v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t isEqualToString;

  v1 = (void *)MEMORY[0x1E0CB34D0];
  v2 = a1;
  objc_msgSend_mainBundle(v1, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bundleIdentifier(v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v8, v9, (uint64_t)v2);

  return isEqualToString;
}

uint64_t sub_1D40AEB78(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  objc_msgSend_cls_assignError_code_format_(MEMORY[0x1E0CB35C8], a2, a4, 2, CFSTR("Unsupported predicate: %@"), a1);
  return 0;
}

id sub_1D40AEBB8(void *a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  id v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  const char *v32;
  void *v33;
  const char *v34;
  const char *v35;
  void *v36;
  uint64_t v37;
  const char *v38;
  void *v39;
  const char *v40;
  id v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v50;
  void *v51;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if ((unint64_t)objc_msgSend_compoundPredicateType(a1, v7, v8) >= 3)
  {
    v36 = (void *)MEMORY[0x1E0CB35C8];
    v37 = objc_msgSend_compoundPredicateType(a1, v9, v10);
    objc_msgSend_cls_assignError_code_format_(v36, v38, a4, 2, CFSTR("Unsupported compound predicate type: %ld"), v37);
    v39 = 0;
  }
  else
  {
    v11 = objc_alloc(MEMORY[0x1E0C99DE8]);
    objc_msgSend_subpredicates(a1, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend_count(v14, v15, v16);
    v19 = (void *)objc_msgSend_initWithCapacity_(v11, v18, v17);

    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v51 = a1;
    objc_msgSend_subpredicates(a1, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v23, (uint64_t)&v53, v57, 16);
    if (v24)
    {
      v25 = v24;
      v50 = a4;
      v26 = 0;
      v27 = *(_QWORD *)v54;
      while (2)
      {
        v28 = 0;
        v29 = v26;
        do
        {
          if (*(_QWORD *)v54 != v27)
            objc_enumerationMutation(v22);
          v30 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v28);
          v31 = (void *)MEMORY[0x1D82573E4]();
          v52 = v29;
          objc_msgSend_cls_normalizedPredicate_error_(v30, v32, (uint64_t)v6, &v52);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = v52;

          if (!v33)
          {
            objc_autoreleasePoolPop(v31);

            objc_msgSend_cls_assignError_fromError_(MEMORY[0x1E0CB35C8], v40, v50, v26);
            v39 = 0;
            goto LABEL_15;
          }
          objc_msgSend_addObject_(v19, v34, (uint64_t)v33);

          objc_autoreleasePoolPop(v31);
          ++v28;
          v29 = v26;
        }
        while (v25 != v28);
        v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v35, (uint64_t)&v53, v57, 16);
        if (v25)
          continue;
        break;
      }
    }
    else
    {
      v26 = 0;
    }

    v41 = objc_alloc(MEMORY[0x1E0CB3528]);
    v44 = objc_msgSend_compoundPredicateType(v51, v42, v43);
    v47 = (void *)objc_msgSend_copy(v19, v45, v46);
    v39 = (void *)objc_msgSend_initWithType_subpredicates_(v41, v48, v44, v47);

LABEL_15:
  }

  return v39;
}

id sub_1D40AEE20(uint64_t a1, const char *a2)
{
  void *v2;
  const char *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("dateCreated");
  v6[1] = CFSTR("dateLastModified");
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], a2, (uint64_t)v6, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v3, (uint64_t)v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id sub_1D40AEEC0(void *a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  id v12;
  id v13;
  id v14;
  id v15;
  const char *v16;
  uint64_t v17;
  unint64_t v18;
  const char *v19;
  id v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  const char *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  void *v38;
  const char *v39;
  void *v41;
  id v42;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v18 = objc_msgSend_predicateOperatorType(a1, v16, v17);
  if (v13 && v18 <= 5 && (objc_msgSend_containsObject_(v14, v19, (uint64_t)v13) & 1) != 0)
  {
    v20 = v12;
    objc_msgSend_keyPath(v20, v21, v22);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25 && objc_msgSend_containsObject_(v14, v23, (uint64_t)v25))
    {
      objc_msgSend_normalizeKeyPath_forValue_(v15, v23, (uint64_t)v25, 0);
      v26 = objc_claimAutoreleasedReturnValue();
      if (v26)
      {
        v28 = (void *)v26;
        if ((objc_msgSend_isEqualToString_(v25, v27, v26) & 1) == 0)
        {
          objc_msgSend_expressionForKeyPath_(MEMORY[0x1E0CB35D0], v29, (uint64_t)v28);
          v30 = objc_claimAutoreleasedReturnValue();

          v20 = (id)v30;
        }
        v20 = v20;

        v31 = v20;
        goto LABEL_13;
      }
    }
    else
    {
      v32 = (void *)objc_msgSend_mutableCopy(v14, v23, v24);
      objc_msgSend_removeObject_(v32, v33, (uint64_t)v13);
      v41 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend_description(v32, v34, v35);
      v42 = v20;
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v36, v37, (uint64_t)CFSTR("\n"), &stru_1E974C8A0);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_cls_assignError_code_format_(v41, v39, a7, 2, CFSTR("Expected constant value or in '%@' on the right side of comparison expression: %@"), v38, a1);

      v20 = v42;
    }
    v31 = 0;
LABEL_13:

    goto LABEL_14;
  }
  objc_msgSend_cls_assignError_code_format_(MEMORY[0x1E0CB35C8], v19, a7, 2, CFSTR("Expected constant value on the right side of comparison expression: %@"), a1);
  v31 = 0;
LABEL_14:

  return v31;
}

id sub_1D40AF0C8(void *a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  void *v16;
  const char *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  const char *v22;
  uint64_t v23;
  unint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  void *v33;
  const char *v34;
  void *v35;
  const char *v36;
  const char *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  const char *v45;
  uint64_t v46;
  id v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  _OWORD v56[4];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend_leftExpression(a1, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_expressionType(v9, v10, v11);
  objc_msgSend_keyPath(v9, v13, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12 || v12 == 3)
  {
    objc_msgSend_normalizeKeyPath_forValue_(v6, v15, (uint64_t)v16, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      if (!v16 || (objc_msgSend_isEqualToString_(v16, v17, (uint64_t)v18) & 1) == 0)
      {
        objc_msgSend_expressionForKeyPath_(MEMORY[0x1E0CB35D0], v17, (uint64_t)v18);
        v20 = objc_claimAutoreleasedReturnValue();

        v9 = (void *)v20;
      }
      v21 = objc_msgSend_predicateOperatorType(a1, v17, v19);
      if (v21 <= 0xA && (v24 = v21, ((1 << v21) & 0x5BF) != 0))
      {
        objc_msgSend_rightExpression(a1, v22, v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend_expressionType(v25, v26, v27);
        if (v28 != 3)
        {
          if (v28)
            goto LABEL_26;
          objc_msgSend_constantValue(v25, v29, v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v31)
            goto LABEL_26;
          v33 = v31;
          if (v24 == 10 && (objc_msgSend_conformsToProtocol_(v31, v32, (uint64_t)&unk_1EFE44ED0) & 1) == 0)
          {
            objc_msgSend_cls_assignError_code_format_(MEMORY[0x1E0CB35C8], v32, a4, 2, CFSTR("Expected value conforming to NSFastEnumeration protocol on the right side of comparison expression: %@"), a1);
          }
          else if ((objc_msgSend_conformsToProtocol_(v33, v32, (uint64_t)&unk_1EFE37988) & 1) != 0)
          {
            objc_msgSend_normalizedValue_forKeyPath_(v6, v34, (uint64_t)v33, v18);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend_conformsToProtocol_(v35, v36, (uint64_t)&unk_1EFE38BF8))
            {
              if ((objc_msgSend_isEqual_(v33, v37, (uint64_t)v35) & 1) == 0)
              {
                objc_msgSend_expressionForConstantValue_(MEMORY[0x1E0CB35D0], v38, (uint64_t)v35);
                v39 = objc_claimAutoreleasedReturnValue();

                v25 = (void *)v39;
              }

              goto LABEL_25;
            }
            objc_msgSend_cls_assignError_code_format_(MEMORY[0x1E0CB35C8], v37, a4, 2, CFSTR("Expected value conforming to NSCopying protocol on the right side of comparison expression: %@"), a1);

          }
          else
          {
            objc_msgSend_cls_assignError_code_format_(MEMORY[0x1E0CB35C8], v34, a4, 2, CFSTR("Expected value conforming to NSSecureCoding protocol on the right side of comparison expression: %@"), a1);
          }

          v40 = 0;
          goto LABEL_27;
        }
        v41 = (void *)objc_opt_class();
        objc_msgSend_cls_allowedRightKeyPathArrays(v41, v42, v43);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        memset(v56, 0, sizeof(v56));
        if (!objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v44, (uint64_t)v56, v57, 16))
        {
LABEL_25:

          goto LABEL_26;
        }
        objc_msgSend_cls_validatedRightKeyPathExpression_leftKeyPath_forAllowedKeyPaths_normalizer_error_(a1, v45, (uint64_t)v25, v16, **((_QWORD **)&v56[0] + 1), v6, a4);
        v46 = objc_claimAutoreleasedReturnValue();

        v25 = (void *)v46;
        if (v46)
        {
LABEL_26:
          v47 = objc_alloc(MEMORY[0x1E0CB3518]);
          v50 = objc_msgSend_comparisonPredicateModifier(a1, v48, v49);
          v53 = objc_msgSend_options(a1, v51, v52);
          v40 = (void *)objc_msgSend_initWithLeftExpression_rightExpression_modifier_type_options_(v47, v54, (uint64_t)v9, v25, v50, v24, v53);
LABEL_27:

          goto LABEL_28;
        }
      }
      else
      {
        objc_msgSend_cls_assignError_code_format_(MEMORY[0x1E0CB35C8], v22, a4, 2, CFSTR("Unsupported operator type in comparison expression: %@"), a1);
      }
    }
    else
    {
    }
    v40 = 0;
LABEL_28:

    goto LABEL_29;
  }
  objc_msgSend_cls_assignError_code_format_(MEMORY[0x1E0CB35C8], v15, a4, 2, CFSTR("Expected an expression or a constant value on the left side of comparison expression: %@"), a1);
  v40 = 0;
LABEL_29:

  return v40;
}

id sub_1D40B0930(void *a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  const char *v6;
  void *v7;
  const char *v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1D40B09D4;
  v11[3] = &unk_1E974BB68;
  v12 = v4;
  v5 = v4;
  objc_msgSend_indexesOfObjectsPassingTest_(a1, v6, (uint64_t)v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectsAtIndexes_(a1, v8, (uint64_t)v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t sub_1D40B09D4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id sub_1D40B09E0(void *a1, uint64_t a2, void *a3)
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend_count(a1, v5, v6))
  {
    objc_msgSend_setWithArray_(MEMORY[0x1E0C99E20], v7, (uint64_t)a1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_arrayWithArray_(MEMORY[0x1E0C99DE8], v10, (uint64_t)a1);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v12 = v4;
    v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v21, v25, 16);
    if (v14)
    {
      v16 = v14;
      v17 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v22 != v17)
            objc_enumerationMutation(v12);
          v19 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
          if ((objc_msgSend_containsObject_(v9, v15, v19, (_QWORD)v21) & 1) == 0)
            objc_msgSend_addObject_(v11, v15, v19);
        }
        v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v21, v25, 16);
      }
      while (v16);
    }

  }
  else if (objc_msgSend_count(v4, v7, v8))
  {
    v11 = v4;
  }
  else
  {
    v11 = (id)MEMORY[0x1E0C9AA60];
  }

  return v11;
}

__CFString *NSStringFromOpenResponseType(uint64_t a1, const char *a2)
{
  __CFString *v2;

  if (a1)
  {
    if (a1 != 1)
      return CFSTR("LongForm");
    v2 = CFSTR("ShortForm");
  }
  else
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("Unknown handout attachment type: '%ld'"), 0);
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

uint64_t CLSOpenResponseTypeFromString(void *a1)
{
  id v1;
  const char *v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v7;
  const char *v8;
  id v9;

  v1 = a1;
  v3 = v1;
  if (!v1)
    goto LABEL_7;
  if ((objc_msgSend_isEqualToString_(v1, v2, (uint64_t)CFSTR("LongForm")) & 1) == 0)
  {
    if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("ShortForm")) & 1) != 0)
    {
      v5 = 1;
      goto LABEL_6;
    }
LABEL_7:
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v2, (uint64_t)CFSTR("Unknown open response type: '%@'"), v3);
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E0C99DA0], v8, *MEMORY[0x1E0C99778], v7, 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v9);
  }
  v5 = 2;
LABEL_6:

  return v5;
}

uint64_t sub_1D40B4290()
{
  return objc_opt_isKindOfClass() & 1;
}

void sub_1D40B4378(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D40B438C(uint64_t a1, void *a2)
{
  const char *v3;
  id v4;

  v4 = a2;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))())
    objc_msgSend_addObject_(*(void **)(a1 + 32), v3, (uint64_t)v4);

}

void sub_1D40B4790(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D40B5278(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1D40B5298(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *a3;
  return result;
}

uint64_t sub_1D40B5644()
{
  id v0;
  void *v1;
  const char *v2;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)qword_1ED0FB898;
  qword_1ED0FB898 = (uint64_t)v0;

  objc_msgSend_setDateStyle_((void *)qword_1ED0FB898, v2, 1);
  return MEMORY[0x1E0DE7D20](qword_1ED0FB898, sel_setTimeStyle_, 1);
}

__CFString *NSStringFromHandoutPublishingState(unint64_t a1, const char *a2)
{
  if (a1 < 8)
    return off_1E974BBF8[a1];
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("Unknown handout publishing state: '%ld'"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

uint64_t sub_1D40B62D4(uint64_t a1, void *a2, _BYTE *a3)
{
  id v4;
  char isKindOfClass;

  v4 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    *a3 = 1;
  return isKindOfClass & 1;
}

__CFString *NSStringFromHandoutType(uint64_t a1, const char *a2)
{
  __CFString *v2;

  if (a1 == 1)
    return CFSTR("private");
  if (a1 == 2)
  {
    v2 = CFSTR("public");
  }
  else
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("Unknown handout type: '%ld'"), a1);
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

__CFString *NSStringFromHandoutState(unint64_t a1, const char *a2)
{
  if (a1 < 4)
    return off_1E974BC38[a1];
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("Unknown handout state: '%ld'"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *NSStringFromHandoutSubstate(uint64_t a1, const char *a2)
{
  __CFString *v2;

  switch(a1)
  {
    case 0:
      return CFSTR("None");
    case 256:
      return CFSTR("AssetsSyncingError");
    case 1:
      v2 = CFSTR("AssetsSyncing");
      break;
    default:
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("Unknown handout substate: '%ld'"), a1);
      v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
  }
  return v2;
}

uint64_t CLSHandoutStateFromString(void *a1)
{
  id v1;
  const char *v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  uint64_t v9;
  const char *v10;
  id v11;

  v1 = a1;
  v3 = v1;
  if (!v1)
    goto LABEL_11;
  if ((objc_msgSend_isEqualToString_(v1, v2, (uint64_t)CFSTR("Draft")) & 1) == 0)
  {
    if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("Published")) & 1) != 0)
    {
      v5 = 1;
      goto LABEL_10;
    }
    if ((objc_msgSend_isEqualToString_(v3, v6, (uint64_t)CFSTR("LocalDraft")) & 1) != 0)
    {
      v5 = 2;
      goto LABEL_10;
    }
    if ((objc_msgSend_isEqualToString_(v3, v7, (uint64_t)CFSTR("ReadyForPublication")) & 1) != 0)
    {
      v5 = 3;
      goto LABEL_10;
    }
LABEL_11:
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v2, (uint64_t)CFSTR("Unknown handout state string: '%@'"), v3);
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E0C99DA0], v10, *MEMORY[0x1E0C99778], v9, 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v11);
  }
  v5 = 0;
LABEL_10:

  return v5;
}

uint64_t CLSHandoutSubstateFromString(void *a1)
{
  id v1;
  const char *v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v8;
  const char *v9;
  id v10;

  v1 = a1;
  v3 = v1;
  if (!v1)
    goto LABEL_9;
  if ((objc_msgSend_isEqualToString_(v1, v2, (uint64_t)CFSTR("None")) & 1) == 0)
  {
    if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("AssetsSyncing")) & 1) != 0)
    {
      v5 = 1;
      goto LABEL_8;
    }
    if ((objc_msgSend_isEqualToString_(v3, v6, (uint64_t)CFSTR("AssetsSyncingError")) & 1) != 0)
    {
      v5 = 256;
      goto LABEL_8;
    }
LABEL_9:
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v2, (uint64_t)CFSTR("Unknown handout substate string: '%@'"), v3);
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E0C99DA0], v9, *MEMORY[0x1E0C99778], v8, 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v10);
  }
  v5 = 0;
LABEL_8:

  return v5;
}

uint64_t CLSHandoutPublishingStateFromString(void *a1)
{
  id v1;
  const char *v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  uint64_t v12;
  const char *v13;
  id v14;

  v1 = a1;
  v3 = v1;
  if (!v1)
    goto LABEL_17;
  if ((objc_msgSend_isEqualToString_(v1, v2, (uint64_t)CFSTR("Pending")) & 1) == 0)
  {
    if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("Published")) & 1) != 0)
    {
      v5 = 2;
      goto LABEL_16;
    }
    if ((objc_msgSend_isEqualToString_(v3, v6, (uint64_t)CFSTR("Publishing")) & 1) != 0)
    {
      v5 = 1;
      goto LABEL_16;
    }
    if ((objc_msgSend_isEqualToString_(v3, v7, (uint64_t)CFSTR("Updating")) & 1) != 0)
    {
      v5 = 3;
      goto LABEL_16;
    }
    if ((objc_msgSend_isEqualToString_(v3, v8, (uint64_t)CFSTR("Error")) & 1) != 0)
    {
      v5 = 4;
      goto LABEL_16;
    }
    if ((objc_msgSend_isEqualToString_(v3, v9, (uint64_t)CFSTR("Scheduling")) & 1) != 0)
    {
      v5 = 6;
      goto LABEL_16;
    }
    if ((objc_msgSend_isEqualToString_(v3, v10, (uint64_t)CFSTR("Scheduled")) & 1) != 0)
    {
      v5 = 7;
      goto LABEL_16;
    }
LABEL_17:
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v2, (uint64_t)CFSTR("Unknown handout publishing state string: '%@'"), v3);
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E0C99DA0], v13, *MEMORY[0x1E0C99778], v12, 0);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v14);
  }
  v5 = 0;
LABEL_16:

  return v5;
}

void sub_1D40B7228(uint64_t a1, const char *a2, uint64_t a3, char *a4, _QWORD *a5)
{
  _QWORD *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  void *v23;
  id v24;
  const char *v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  id v31;
  id v32;
  id v33;
  char v34;
  void *v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  void *v44;
  id v45;
  NSObject *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  id v56;
  const char *v57;
  uint64_t v58;
  NSObject *v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  const char *v63;
  const char *v64;
  const char *v65;
  uint64_t v66;
  id v67;
  uint64_t v68;
  void *v70;
  _QWORD *v71;
  _QWORD *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  id obj;
  id v77;
  id v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  id v83;
  id v84;
  uint8_t v85[128];
  uint8_t buf[4];
  id v87;
  uint64_t v88;

  v6 = (_QWORD *)a3;
  v88 = *MEMORY[0x1E0C80C00];
  objc_msgSend_defaultStore(MEMORY[0x1E0C8F2B8], a2, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_aa_primaryAppleAccount(v7, v8, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = v7;
  v71 = v6;
  v72 = a5;
  if (!v12)
  {
    v35 = 0;
    v23 = 0;
    goto LABEL_21;
  }
  v84 = 0;
  objc_msgSend_credentialForAccount_error_(v7, v10, (uint64_t)v12, &v84);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v84;
  if (!v14)
    goto LABEL_6;
  if (qword_1ED0FB9A0 != -1)
    dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
  v15 = CLSLogDefault;
  if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v87 = v14;
    _os_log_error_impl(&dword_1D4054000, v15, OS_LOG_TYPE_ERROR, "Failed to get credential for primary account. Error: = %{public}@;",
      buf,
      0xCu);
    if (!v13)
      goto LABEL_17;
  }
  else
  {
LABEL_6:
    if (!v13)
      goto LABEL_17;
  }
  if (sub_1D40B78D4(v12))
  {
    objc_msgSend_aa_altDSID(v12, v16, v17);
    v18 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_sharedInstance(MEMORY[0x1E0D00100], v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = v14;
    v74 = (void *)v18;
    objc_msgSend_authKitAccountWithAltDSID_error_(v21, v22, v18, &v83);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v83;

    if (!v24)
      goto LABEL_12;
    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v27 = CLSLogDefault;
    if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v87 = v24;
      _os_log_error_impl(&dword_1D4054000, v27, OS_LOG_TYPE_ERROR, "Failed to get equivalentAuthKitAccount for primary account. Error: = %{public}@;",
        buf,
        0xCu);
      if (v23)
      {
LABEL_13:
        objc_msgSend_sharedInstance(MEMORY[0x1E0D00100], v25, v26);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend_managedOrganizationTypeForAccount_(v28, v29, (uint64_t)v23);

        if (v30 == 1)
        {
          v31 = v12;

          v32 = 0;
          v33 = 0;
          v34 = 0;
          goto LABEL_57;
        }
      }
    }
    else
    {
LABEL_12:
      if (v23)
        goto LABEL_13;
    }
    v14 = v24;
    v36 = v74;
    goto LABEL_20;
  }
LABEL_17:
  v23 = 0;
  v36 = 0;
LABEL_20:

  v35 = v36;
  v7 = v73;
LABEL_21:
  v70 = v12;
  objc_msgSend_aa_dataSeparatedAccounts(v7, v10, v11);
  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  v82 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v37, (uint64_t)&v79, v85, 16);
  if (v38)
  {
    v39 = v38;
    v32 = 0;
    v40 = *(_QWORD *)v80;
LABEL_23:
    v41 = 0;
    v75 = v39;
    while (1)
    {
      v42 = v32;
      if (*(_QWORD *)v80 != v40)
        objc_enumerationMutation(obj);
      v32 = *(id *)(*((_QWORD *)&v79 + 1) + 8 * v41);

      v78 = 0;
      objc_msgSend_credentialForAccount_error_(v7, v43, (uint64_t)v32, &v78);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = v78;
      if (!v45)
        goto LABEL_30;
      if (qword_1ED0FB9A0 != -1)
        dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
      v46 = CLSLogDefault;
      if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v87 = v45;
        _os_log_error_impl(&dword_1D4054000, v46, OS_LOG_TYPE_ERROR, "Failed to get credential for data-separated account. Error: = %{public}@;",
          buf,
          0xCu);
        if (!v44)
        {
LABEL_43:
          v56 = v45;
          goto LABEL_44;
        }
      }
      else
      {
LABEL_30:
        if (!v44)
          goto LABEL_43;
      }
      if (!sub_1D40B78D4(v32))
        goto LABEL_43;
      v49 = v40;
      objc_msgSend_aa_altDSID(v32, v47, v48);
      v50 = objc_claimAutoreleasedReturnValue();

      v35 = (void *)v50;
      objc_msgSend_sharedInstance(MEMORY[0x1E0D00100], v51, v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = v45;
      objc_msgSend_authKitAccountWithAltDSID_error_(v53, v54, (uint64_t)v35, &v77);
      v55 = objc_claimAutoreleasedReturnValue();
      v56 = v77;

      if (v56)
      {
        if (qword_1ED0FB9A0 != -1)
          dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
        v59 = CLSLogDefault;
        if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v87 = v56;
          _os_log_error_impl(&dword_1D4054000, v59, OS_LOG_TYPE_ERROR, "Failed to get equivalentAuthKitAccount for data-separated account. Error: = %{public}@;",
            buf,
            0xCu);
        }
      }
      v23 = (void *)v55;
      if (v55)
      {
        objc_msgSend_sharedInstance(MEMORY[0x1E0D00100], v57, v58);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = objc_msgSend_managedOrganizationTypeForAccount_(v60, v61, v55);

        if (v62 == 1)
        {
          v74 = v35;
          v32 = v32;
          objc_msgSend_objectForKeyedSubscript_(v32, v64, *MEMORY[0x1E0C8EFC8]);
          v33 = (id)objc_claimAutoreleasedReturnValue();

          v34 = 1;
          if (!v32)
            goto LABEL_51;
          v31 = v32;
          v12 = v70;
          v6 = v71;
          a5 = v72;
LABEL_57:
          v67 = objc_retainAutorelease(v31);
          *v6 = v67;
          if (a4)
            *a4 = v34;
          if (a5)
          {
            if ((v34 & 1) == 0)
            {
              CLSPersonalPersonaUniqueIdentifier();
              v68 = objc_claimAutoreleasedReturnValue();

              v33 = (id)v68;
            }
            v33 = objc_retainAutorelease(v33);
            *a5 = v33;
          }
          goto LABEL_64;
        }
        v40 = v49;
        v7 = v73;
      }
      else
      {
        v7 = v73;
        v40 = v49;
      }
      v39 = v75;
LABEL_44:

      if (v39 == ++v41)
      {
        v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v63, (uint64_t)&v79, v85, 16);
        if (v39)
          goto LABEL_23;
        goto LABEL_50;
      }
    }
  }
  v32 = 0;
LABEL_50:

  v34 = 0;
  v33 = 0;
  v74 = v35;
LABEL_51:
  v12 = v70;
  v6 = v71;
  a5 = v72;
  if (v70 && sub_1D40B78D4(v70))
  {
    v31 = v70;
    goto LABEL_57;
  }
  if (v32 && sub_1D40B78D4(v32))
  {
    v32 = v32;
    objc_msgSend_objectForKeyedSubscript_(v32, v65, *MEMORY[0x1E0C8EFC8]);
    v66 = objc_claimAutoreleasedReturnValue();

    v34 = 1;
    v33 = (id)v66;
    v31 = v32;
    goto LABEL_57;
  }
  v67 = 0;
  *v71 = 0;
LABEL_64:

}

uint64_t sub_1D40B78D4(void *a1)
{
  id v1;
  const char *v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t isPrimaryEmailVerified;

  v1 = a1;
  objc_msgSend_length((void *)*MEMORY[0x1E0CFAAE8], v2, v3);
  if (objc_msgSend_aa_isManagedAppleID(v1, v4, v5))
    isPrimaryEmailVerified = objc_msgSend_aa_isPrimaryEmailVerified(v1, v6, v7);
  else
    isPrimaryEmailVerified = 0;

  return isPrimaryEmailVerified;
}

BOOL sub_1D40B792C(void *a1, const char *a2)
{
  uint64_t v3;

  v3 = 0;
  objc_msgSend_cls_getEligibleAccount_isDataSeparated_personaUniqueIdentifier_(a1, a2, (uint64_t)&v3, 0, 0);
  return v3 != 0;
}

void sub_1D40B79D8(uint64_t a1)
{
  id v1;
  const char *v2;
  uint64_t v3;
  void *v4;

  v1 = objc_alloc(*(Class *)(a1 + 32));
  v3 = objc_msgSend_initWithEndpoint_(v1, v2, 0);
  v4 = (void *)qword_1ED0FB8A8;
  qword_1ED0FB8A8 = v3;

}

void sub_1D40B7D3C(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_1D40B7D70(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  const char *v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (qword_1ED0FB9A0 != -1)
    dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
  v5 = (void *)CLSLogNotifications;
  if (WeakRetained)
  {
    if (os_log_type_enabled((os_log_t)CLSLogNotifications, OS_LOG_TYPE_INFO))
    {
      v8 = v5;
      objc_msgSend_name(v3, v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412290;
      v17 = v11;
      _os_log_impl(&dword_1D4054000, v8, OS_LOG_TYPE_INFO, "Received darwin notification '%@'", (uint8_t *)&v16, 0xCu);

    }
    objc_msgSend_connect(WeakRetained, v6, v7);
  }
  else if (os_log_type_enabled((os_log_t)CLSLogNotifications, OS_LOG_TYPE_ERROR))
  {
    v12 = v5;
    objc_msgSend_name(v3, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138412290;
    v17 = v15;
    _os_log_error_impl(&dword_1D4054000, v12, OS_LOG_TYPE_ERROR, "CLSEndpointConnection instance was released after adding observer for darwin notification '%@'", (uint8_t *)&v16, 0xCu);

  }
}

void sub_1D40B7EF0(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  const char *v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (qword_1ED0FB9A0 != -1)
    dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
  v5 = (void *)CLSLogNotifications;
  if (WeakRetained)
  {
    if (os_log_type_enabled((os_log_t)CLSLogNotifications, OS_LOG_TYPE_INFO))
    {
      v8 = v5;
      objc_msgSend_name(v3, v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412290;
      v17 = v11;
      _os_log_impl(&dword_1D4054000, v8, OS_LOG_TYPE_INFO, "Received darwin notification '%@'", (uint8_t *)&v16, 0xCu);

    }
    objc_msgSend_devModeChanged(WeakRetained, v6, v7);
  }
  else if (os_log_type_enabled((os_log_t)CLSLogNotifications, OS_LOG_TYPE_ERROR))
  {
    v12 = v5;
    objc_msgSend_name(v3, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138412290;
    v17 = v15;
    _os_log_error_impl(&dword_1D4054000, v12, OS_LOG_TYPE_ERROR, "CLSEndpointConnection instance was released after adding observer for darwin notification '%@'", (uint8_t *)&v16, 0xCu);

  }
}

void sub_1D40B840C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location,id a23)
{
  id *v23;
  id *v24;
  id *v25;
  id *v26;

  objc_destroyWeak(v26);
  objc_destroyWeak(v25);
  objc_destroyWeak(v24);
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a23);
  _Unwind_Resume(a1);
}

void sub_1D40B8468(uint64_t a1)
{
  id v2;
  const char *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend_connectionInterrupted_(WeakRetained, v3, (uint64_t)v2);

}

void sub_1D40B84B8(uint64_t a1)
{
  id v2;
  const char *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend_connectionBorked_(WeakRetained, v3, (uint64_t)v2);

}

void sub_1D40B8508(uint64_t a1, char a2, void *a3)
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v7 = v4;
  if ((a2 & 1) == 0 && objc_msgSend_code(v4, v5, v6) != 4099)
  {
    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v8 = CLSLogDefault;
    if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_INFO))
    {
      v9 = 138543362;
      v10 = v7;
      _os_log_impl(&dword_1D4054000, v8, OS_LOG_TYPE_INFO, "failed to override identifier: %{public}@", (uint8_t *)&v9, 0xCu);
    }
  }

}

void sub_1D40B87B0(uint64_t a1, const char *a2)
{
  void *v2;
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint8_t v9[8];
  id v10;

  v10 = 0;
  objc_msgSend_entitlementsForCurrentTaskWithError_(CLSEntitlements, a2, (uint64_t)&v10);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v10;
  objc_msgSend_classKitEnvironment(v2, v4, v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)qword_1ED0FB8B8;
  qword_1ED0FB8B8 = v6;

  if (v3)
  {
    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v8 = CLSLogDefault;
    if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1D4054000, v8, OS_LOG_TYPE_INFO, "failed to read ClassKit environment.", v9, 2u);
    }
  }

}

void sub_1D40B8B00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D40B8B18(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (qword_1ED0FB9A0 != -1)
    dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
  v4 = CLSLogConnection;
  if (os_log_type_enabled((os_log_t)CLSLogConnection, OS_LOG_TYPE_ERROR))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_error_impl(&dword_1D4054000, v4, OS_LOG_TYPE_ERROR, "Failed to establish XPC connection: %@", (uint8_t *)&v6, 0xCu);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

uint64_t sub_1D40B8C0C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1D40B8C1C(uint64_t a1)
{

}

void sub_1D40B8C24(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void sub_1D40B8DC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D40B8DE0(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (qword_1ED0FB9A0 != -1)
    dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
  v4 = CLSLogConnection;
  if (os_log_type_enabled((os_log_t)CLSLogConnection, OS_LOG_TYPE_ERROR))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_error_impl(&dword_1D4054000, v4, OS_LOG_TYPE_ERROR, "Failed to establish XPC connection: %@", (uint8_t *)&v6, 0xCu);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void sub_1D40B8ED4(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t sub_1D40B8FB8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_1D40B917C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_1D40B9190(uint64_t a1, uint64_t a2, void *a3)
{
  NSObject *v4;
  id v5;

  v5 = a3;
  clsNotificationQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v4, &unk_1E974BCC8);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_1D40B91FC(uint64_t a1, const char *a2, uint64_t a3)
{
  const char *v3;
  id v4;

  objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], a2, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_postNotificationName_object_(v4, v3, (uint64_t)CFSTR("CLSSignificantBackingStoreChangeNotification"), 0);

}

uint64_t sub_1D40B92E8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_1D40B93A4(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (qword_1ED0FB9A0 != -1)
    dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
  v3 = CLSLogConnection;
  if (os_log_type_enabled((os_log_t)CLSLogConnection, OS_LOG_TYPE_ERROR))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_error_impl(&dword_1D4054000, v3, OS_LOG_TYPE_ERROR, "Error getting server instance: %{public}@", (uint8_t *)&v4, 0xCu);
  }

}

void sub_1D40B958C(uint64_t a1, const char *a2, uint64_t a3)
{
  const char *v3;
  id v4;

  objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], a2, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_postNotificationName_object_(v4, v3, (uint64_t)CFSTR("CLSSignificantBackingStoreChangeNotification"), 0);

}

uint64_t sub_1D40BB240(uint64_t a1, const char *a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend__isObjectActivityItem_withIdentifier_(*(void **)(a1 + 32), a2, (uint64_t)a2, *(_QWORD *)(a1 + 40));
  if ((_DWORD)result)
    *a3 = 1;
  return result;
}

uint64_t sub_1D40BB2F4(uint64_t a1, void *a2)
{
  id v3;
  const char *v4;
  uint64_t v5;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = objc_msgSend__isObjectPrimaryItem_(*(void **)(a1 + 32), v4, (uint64_t)v3) ^ 1;
  else
    v5 = 0;

  return v5;
}

uint64_t sub_1D40BB354(uint64_t a1, void *a2, void *a3)
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;

  v4 = a3;
  objc_msgSend_dateCreated(a2, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dateCreated(v4, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend_compare_(v7, v11, (uint64_t)v10);
  return v12;
}

uint64_t sub_1D40BB778(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t sub_1D40BB8FC(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  const char *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  objc_msgSend_objectID(a2, (const char *)a2, (uint64_t)a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  v8 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    if (v8 && objc_msgSend_isEqualToString_(v5, v6, v8))
      goto LABEL_4;
LABEL_6:
    v9 = 0;
    goto LABEL_7;
  }
  if (v8)
    goto LABEL_6;
LABEL_4:
  v9 = 1;
  *a3 = 1;
LABEL_7:

  return v9;
}

uint64_t sub_1D40BD100(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t isEqualToString;

  v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    objc_msgSend_identifier(v6, v7, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11 && !*(_QWORD *)(a1 + 32))
      goto LABEL_7;
    objc_msgSend_identifier(v6, v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v12;
    if (!v12 || !*(_QWORD *)(a1 + 32))
    {

      isEqualToString = 0;
      goto LABEL_10;
    }
    objc_msgSend_identifier(v6, v13, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToString = objc_msgSend_isEqualToString_(v16, v17, *(_QWORD *)(a1 + 32));

    if ((_DWORD)isEqualToString)
    {
LABEL_7:
      isEqualToString = 1;
      *a3 = 1;
    }
LABEL_10:

    goto LABEL_11;
  }
  isEqualToString = 0;
LABEL_11:

  return isEqualToString;
}

void sub_1D40BD2EC(uint64_t a1, void *a2, void *a3)
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;

  v16 = a2;
  v5 = a3;
  v8 = objc_msgSend_count(*(void **)(a1 + 32), v6, v7);
  v11 = objc_msgSend_count(v16, v9, v10);
  v14 = *(_QWORD *)(a1 + 40);
  if (v8 == v11)
  {
    objc_msgSend_lastObject(v16, v12, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, id))(v14 + 16))(v14, v15, v5);

  }
  else
  {
    (*(void (**)(uint64_t, _QWORD, id))(v14 + 16))(v14, 0, v5);
  }

}

uint64_t sub_1D40BDFE4(uint64_t a1, void *a2)
{
  void *v2;
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  char isEqualToString;
  uint64_t v25;

  v4 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_16;
  v5 = v4;
  objc_msgSend_parentObjectID(v5, v6, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10
    || (objc_msgSend_objectID(*(void **)(a1 + 32), v8, v9), (v2 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend_parentObjectID(v5, v8, v9);
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v14 = (void *)v11;
      objc_msgSend_objectID(*(void **)(a1 + 32), v12, v13);
      v15 = objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        v18 = (void *)v15;
        objc_msgSend_parentObjectID(v5, v16, v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectID(*(void **)(a1 + 32), v20, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        isEqualToString = objc_msgSend_isEqualToString_(v19, v23, (uint64_t)v22);

        if (v10)
        else

        if ((isEqualToString & 1) != 0)
          goto LABEL_15;
LABEL_16:
        v25 = 0;
        goto LABEL_17;
      }

    }
    if (!v10)

    goto LABEL_16;
  }

LABEL_15:
  v25 = 1;
LABEL_17:

  return v25;
}

uint64_t sub_1D40BE124(uint64_t a1, void *a2, void *a3)
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;

  v4 = a2;
  objc_msgSend_dateLastModified(a3, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dateLastModified(v4, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend_compare_(v7, v11, (uint64_t)v10);
  return v12;
}

void sub_1D40BE3CC()
{
  CLSProgressReportingCapability *v0;
  const char *v1;
  uint64_t v2;
  void *v3;

  v0 = [CLSProgressReportingCapability alloc];
  v2 = objc_msgSend_initWithKind_details_(v0, v1, 0, 0);
  v3 = (void *)qword_1ED0FB308;
  qword_1ED0FB308 = v2;

}

uint64_t sub_1D40BE480(uint64_t a1, void *a2)
{
  void *v2;
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  char isEqualToString;
  uint64_t v25;

  v4 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_16;
  v5 = v4;
  objc_msgSend_parentObjectID(v5, v6, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10
    || (objc_msgSend_objectID(*(void **)(a1 + 32), v8, v9), (v2 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend_parentObjectID(v5, v8, v9);
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v14 = (void *)v11;
      objc_msgSend_objectID(*(void **)(a1 + 32), v12, v13);
      v15 = objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        v18 = (void *)v15;
        objc_msgSend_parentObjectID(v5, v16, v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectID(*(void **)(a1 + 32), v20, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        isEqualToString = objc_msgSend_isEqualToString_(v19, v23, (uint64_t)v22);

        if (v10)
        else

        if ((isEqualToString & 1) != 0)
          goto LABEL_15;
LABEL_16:
        v25 = 0;
        goto LABEL_17;
      }

    }
    if (!v10)

    goto LABEL_16;
  }

LABEL_15:
  v25 = 1;
LABEL_17:

  return v25;
}

uint64_t sub_1D40BE7EC(uint64_t a1, const char *a2, uint64_t a3)
{
  return objc_msgSend_addChild_(*(void **)(a1 + 32), a2, a3);
}

uint64_t sub_1D40BE9B8(uint64_t a1, void *a2)
{
  void *v2;
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t isEqualToString;

  v4 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_parentObjectID(v4, v5, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      objc_msgSend_objectID(*(void **)(a1 + 32), v7, v8);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v2)
      {
        isEqualToString = 1;
LABEL_13:

        goto LABEL_14;
      }
    }
    objc_msgSend_parentObjectID(v4, v7, v8);
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v13 = (void *)v10;
      objc_msgSend_objectID(*(void **)(a1 + 32), v11, v12);
      v14 = objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        v17 = (void *)v14;
        objc_msgSend_parentObjectID(v4, v15, v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectID(*(void **)(a1 + 32), v19, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        isEqualToString = objc_msgSend_isEqualToString_(v18, v22, (uint64_t)v21);

        if (!v9)
          goto LABEL_13;
LABEL_14:

        goto LABEL_15;
      }

    }
    isEqualToString = 0;
    if (!v9)
      goto LABEL_13;
    goto LABEL_14;
  }
  isEqualToString = 0;
LABEL_15:

  return isEqualToString;
}

void sub_1D40BED0C(uint64_t a1, void *a2, uint64_t a3)
{
  const char *v4;
  id v5;

  objc_msgSend_childObjectID(a2, (const char *)a2, a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(*(void **)(a1 + 32), v4, (uint64_t)v5);

}

void sub_1D40BF814()
{
  void *v0;
  const char *v1;
  void *v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v6[0] = objc_opt_class();
  v6[1] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v1, (uint64_t)v6, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v0, v3, (uint64_t)v2);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)qword_1ED0FB318;
  qword_1ED0FB318 = v4;

}

void sub_1D40BF904(uint64_t a1, const char *a2)
{
  void *v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[9];

  v7[8] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v7[0] = CFSTR("Math");
  v7[1] = CFSTR("Science");
  v7[2] = CFSTR("LiteracyAndWriting");
  v7[3] = CFSTR("ComputerScienceAndEngineering");
  v7[4] = CFSTR("WorldLanguage");
  v7[5] = CFSTR("SocialScience");
  v7[6] = CFSTR("ArtsAndMusic");
  v7[7] = CFSTR("HealthAndFitness");
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], a2, (uint64_t)v7, 8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v2, v4, (uint64_t)v3);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)qword_1ED0FB328;
  qword_1ED0FB328 = v5;

}

void sub_1D40BFA28(uint64_t a1, const char *a2)
{
  uint64_t v2;
  void *v3;

  objc_msgSend_setWithArray_(MEMORY[0x1E0C99E60], a2, (uint64_t)&unk_1E97674C0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED0FB338;
  qword_1ED0FB338 = v2;

}

__CFString *DefaultNameFromContextType(unint64_t a1)
{
  void *v1;
  void *v2;
  __CFString *v3;

  sub_1D40C02F0(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v3 = v1;
  else
    v3 = CFSTR("None");

  return v3;
}

uint64_t sub_1D40C0124(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, _QWORD, _QWORD))(a2 + 16))(a2, *(_QWORD *)(a1 + 32), 0);
  return 0;
}

__CFString *sub_1D40C02F0(unint64_t a1)
{
  if (a1 > 0x11)
    return 0;
  else
    return off_1E974C038[a1];
}

uint64_t CLSContextTypeFromDefaultName_0(void *a1)
{
  const char *v1;
  id v2;
  const char *v3;
  uint64_t v4;
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  const char *v13;
  const char *v14;
  const char *v15;
  const char *v16;
  const char *v17;
  const char *v18;
  const char *v19;
  const char *v20;
  const char *v21;

  v2 = a1;
  if (v2 && (objc_msgSend_isEqualToString_(CFSTR("None"), v1, (uint64_t)v2) & 1) == 0)
  {
    if ((objc_msgSend_isEqualToString_(CFSTR("App"), v3, (uint64_t)v2) & 1) != 0)
    {
      v4 = 1;
      goto LABEL_4;
    }
    if ((objc_msgSend_isEqualToString_(CFSTR("Chapter"), v6, (uint64_t)v2) & 1) != 0)
    {
      v4 = 2;
      goto LABEL_4;
    }
    if ((objc_msgSend_isEqualToString_(CFSTR("Section"), v7, (uint64_t)v2) & 1) != 0)
    {
      v4 = 3;
      goto LABEL_4;
    }
    if ((objc_msgSend_isEqualToString_(CFSTR("Level"), v8, (uint64_t)v2) & 1) != 0)
    {
      v4 = 4;
      goto LABEL_4;
    }
    if ((objc_msgSend_isEqualToString_(CFSTR("Page"), v9, (uint64_t)v2) & 1) != 0)
    {
      v4 = 5;
      goto LABEL_4;
    }
    if ((objc_msgSend_isEqualToString_(CFSTR("Task"), v10, (uint64_t)v2) & 1) != 0)
    {
      v4 = 6;
      goto LABEL_4;
    }
    if ((objc_msgSend_isEqualToString_(CFSTR("Challenge"), v11, (uint64_t)v2) & 1) != 0)
    {
      v4 = 7;
      goto LABEL_4;
    }
    if ((objc_msgSend_isEqualToString_(CFSTR("Quiz"), v12, (uint64_t)v2) & 1) != 0)
    {
      v4 = 8;
      goto LABEL_4;
    }
    if ((objc_msgSend_isEqualToString_(CFSTR("Exercise"), v13, (uint64_t)v2) & 1) != 0)
    {
      v4 = 9;
      goto LABEL_4;
    }
    if ((objc_msgSend_isEqualToString_(CFSTR("Lesson"), v14, (uint64_t)v2) & 1) != 0)
    {
      v4 = 10;
      goto LABEL_4;
    }
    if ((objc_msgSend_isEqualToString_(CFSTR("Book"), v15, (uint64_t)v2) & 1) != 0)
    {
      v4 = 11;
      goto LABEL_4;
    }
    if ((objc_msgSend_isEqualToString_(CFSTR("Game"), v16, (uint64_t)v2) & 1) != 0)
    {
      v4 = 12;
      goto LABEL_4;
    }
    if ((objc_msgSend_isEqualToString_(CFSTR("Document"), v17, (uint64_t)v2) & 1) != 0)
    {
      v4 = 13;
      goto LABEL_4;
    }
    if ((objc_msgSend_isEqualToString_(CFSTR("Audio"), v18, (uint64_t)v2) & 1) != 0)
    {
      v4 = 14;
      goto LABEL_4;
    }
    if ((objc_msgSend_isEqualToString_(CFSTR("Video"), v19, (uint64_t)v2) & 1) != 0)
    {
      v4 = 15;
      goto LABEL_4;
    }
    if ((objc_msgSend_isEqualToString_(CFSTR("Course"), v20, (uint64_t)v2) & 1) != 0)
    {
      v4 = 16;
      goto LABEL_4;
    }
    if ((objc_msgSend_isEqualToString_(CFSTR("Custom"), v21, (uint64_t)v2) & 1) != 0)
    {
      v4 = 17;
      goto LABEL_4;
    }
  }
  v4 = 0;
LABEL_4:

  return v4;
}

__CFString *CLSLocalizedNameFromContextType(uint64_t a1)
{
  __CFString *v1;
  void *v2;
  uint64_t v3;
  const char *v4;
  void *v5;
  const char *v6;
  __CFString *v7;

  if ((unint64_t)(a1 - 1) > 0x10)
  {
    v7 = &stru_1E974C8A0;
  }
  else
  {
    v1 = off_1E974C0C8[a1 - 1];
    v2 = (void *)MEMORY[0x1E0CB34D0];
    v3 = objc_opt_class();
    objc_msgSend_bundleForClass_(v2, v4, v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_localizedStringForKey_value_table_(v5, v6, (uint64_t)v1, &stru_1E974C8A0, CFSTR("ClassKit"));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

void sub_1D40C0638(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  CLSChildParentRelation *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  CLSParentChildRelation *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  CLSParentChildRelation *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  void *v18;
  CLSParentChildRelation *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  void *v23;
  CLSParentChildRelation *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  void *v28;
  void *v29;
  const char *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  objc_super v35;
  _QWORD v36[6];

  v36[5] = *MEMORY[0x1E0C80C00];
  v35.receiver = *(id *)(a1 + 32);
  v35.super_class = (Class)&OBJC_METACLASS___CLSContext;
  objc_msgSendSuper2(&v35, sel_relations);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED0FB8C8;
  qword_1ED0FB8C8 = v2;

  v4 = [CLSChildParentRelation alloc];
  v5 = *(_QWORD *)(a1 + 32);
  v6 = objc_opt_class();
  v8 = (void *)objc_msgSend_initWithChildEntity_parentEntity_faultable_(v4, v7, v5, v6, 1);
  v9 = [CLSParentChildRelation alloc];
  v10 = *(_QWORD *)(a1 + 32);
  v11 = objc_opt_class();
  v13 = (void *)objc_msgSend_initWithFromEntity_toEntity_onFromKey_toKey_faultable_(v9, v12, v10, v11, CFSTR("_currentActivityID"), CFSTR("objectID"), 1);
  v14 = [CLSParentChildRelation alloc];
  v15 = *(_QWORD *)(a1 + 32);
  v16 = objc_opt_class();
  v18 = (void *)objc_msgSend_initWithParentEntity_childEntity_faultable_(v14, v17, v15, v16, 1);
  v19 = [CLSParentChildRelation alloc];
  v20 = *(_QWORD *)(a1 + 32);
  v21 = objc_opt_class();
  v23 = (void *)objc_msgSend_initWithParentEntity_childEntity_faultable_(v19, v22, v20, v21, 1);
  v24 = [CLSParentChildRelation alloc];
  v25 = *(_QWORD *)(a1 + 32);
  v26 = objc_opt_class();
  v28 = (void *)objc_msgSend_initWithParentEntity_childEntity_faultable_(v24, v27, v25, v26, 1);
  v29 = (void *)qword_1ED0FB8C8;
  v36[0] = v8;
  v36[1] = v13;
  v36[2] = v18;
  v36[3] = v23;
  v36[4] = v28;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v30, (uint64_t)v36, 5);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setByAddingObjectsFromArray_(v29, v32, (uint64_t)v31);
  v33 = objc_claimAutoreleasedReturnValue();
  v34 = (void *)qword_1ED0FB8C8;
  qword_1ED0FB8C8 = v33;

}

void sub_1D40C19EC()
{
  CLSSettingsVisibilityController *v0;
  void *v1;

  v0 = objc_alloc_init(CLSSettingsVisibilityController);
  v1 = (void *)qword_1ED0FB8D8;
  qword_1ED0FB8D8 = (uint64_t)v0;

}

void sub_1D40C1BB4(uint64_t a1, const char *a2, uint64_t a3)
{
  const char *v3;
  id v4;

  objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], a2, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_postNotificationName_object_(v4, v3, (uint64_t)CFSTR("CLSSettingsVisibilityDidChangeNotification"), 0);

}

void sub_1D40C1C90(uint64_t a1, const char *a2, uint64_t a3)
{
  const char *v3;
  id v4;

  objc_msgSend_shared(CLSDataStore, a2, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_currentUserWithCompletion_(v4, v3, (uint64_t)&unk_1E974C198);

}

void sub_1D40C1CCC(uint64_t a1, void *a2)
{
  id v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  const char *v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v5 = v2;
  if (v2)
  {
    v9 = CFSTR("CLSCurrentUserInfoKey");
    v10[0] = v2;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v3, (uint64_t)v10, &v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_postNotificationName_object_userInfo_(v7, v8, (uint64_t)CFSTR("CLSCurrentUserDidChangeNotificationName"), 0, v6);

}

__CFString *NSStringFromSearchOptions(uint64_t a1)
{
  char v1;
  __CFString *v2;
  const char *v3;
  uint64_t v4;
  __CFString *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;

  if (!a1)
  {
    v5 = CFSTR("none");
    return v5;
  }
  v1 = a1;
  v2 = (__CFString *)objc_opt_new();
  v5 = v2;
  if ((v1 & 1) != 0)
  {
    objc_msgSend_appendString_(v2, v3, (uint64_t)CFSTR("persons"));
    if ((v1 & 2) == 0)
    {
LABEL_4:
      if ((v1 & 4) == 0)
        goto LABEL_5;
      goto LABEL_13;
    }
  }
  else if ((v1 & 2) == 0)
  {
    goto LABEL_4;
  }
  if (objc_msgSend_length(v5, v3, v4))
    objc_msgSend_appendString_(v5, v6, (uint64_t)CFSTR(","));
  objc_msgSend_appendString_(v5, v6, (uint64_t)CFSTR("classes"));
  if ((v1 & 4) == 0)
  {
LABEL_5:
    if ((v1 & 8) == 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_13:
  if (objc_msgSend_length(v5, v3, v4))
    objc_msgSend_appendString_(v5, v7, (uint64_t)CFSTR(","));
  objc_msgSend_appendString_(v5, v7, (uint64_t)CFSTR("locations"));
  if ((v1 & 8) == 0)
  {
LABEL_6:
    if ((v1 & 0x10) == 0)
      return v5;
    goto LABEL_19;
  }
LABEL_16:
  if (objc_msgSend_length(v5, v3, v4))
    objc_msgSend_appendString_(v5, v8, (uint64_t)CFSTR(","));
  objc_msgSend_appendString_(v5, v8, (uint64_t)CFSTR("organizations"));
  if ((v1 & 0x10) != 0)
  {
LABEL_19:
    if (objc_msgSend_length(v5, v3, v4))
      objc_msgSend_appendString_(v5, v9, (uint64_t)CFSTR(","));
    objc_msgSend_appendString_(v5, v9, (uint64_t)CFSTR("groups"));
  }
  return v5;
}

__CFString *NSStringFromSearchBehaviors(uint64_t a1)
{
  char v1;
  __CFString *v2;
  const char *v3;
  uint64_t v4;
  __CFString *v5;
  const char *v6;

  if (a1)
  {
    v1 = a1;
    v2 = (__CFString *)objc_opt_new();
    v5 = v2;
    if ((v1 & 1) != 0)
      objc_msgSend_appendString_(v2, v3, (uint64_t)CFSTR("local"));
    if ((v1 & 2) != 0)
    {
      if (objc_msgSend_length(v5, v3, v4))
        objc_msgSend_appendString_(v5, v6, (uint64_t)CFSTR(","));
      objc_msgSend_appendString_(v5, v6, (uint64_t)CFSTR("server"));
    }
  }
  else
  {
    v5 = CFSTR("none");
  }
  return v5;
}

__CFString *NSStringFromNSStringCompareOptions(uint64_t a1)
{
  __int16 v1;
  id v2;
  const char *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  __CFString *v9;

  if (!a1)
  {
    v9 = CFSTR("none");
    return v9;
  }
  v1 = a1;
  v2 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v4 = v2;
  if ((v1 & 1) != 0)
  {
    objc_msgSend_appendString_(v2, v3, (uint64_t)CFSTR("case-insensitive,"));
    if ((v1 & 2) == 0)
    {
LABEL_4:
      if ((v1 & 4) == 0)
        goto LABEL_5;
      goto LABEL_17;
    }
  }
  else if ((v1 & 2) == 0)
  {
    goto LABEL_4;
  }
  objc_msgSend_appendString_(v4, v3, (uint64_t)CFSTR("literal,"));
  if ((v1 & 4) == 0)
  {
LABEL_5:
    if ((v1 & 8) == 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  objc_msgSend_appendString_(v4, v3, (uint64_t)CFSTR("backwards,"));
  if ((v1 & 8) == 0)
  {
LABEL_6:
    if ((v1 & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  objc_msgSend_appendString_(v4, v3, (uint64_t)CFSTR("anchored,"));
  if ((v1 & 0x40) == 0)
  {
LABEL_7:
    if ((v1 & 0x80) == 0)
      goto LABEL_8;
LABEL_20:
    objc_msgSend_appendString_(v4, v3, (uint64_t)CFSTR("diacritic-insensitive,"));
    if ((v1 & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_19:
  objc_msgSend_appendString_(v4, v3, (uint64_t)CFSTR("numeric,"));
  if ((v1 & 0x80) != 0)
    goto LABEL_20;
LABEL_8:
  if ((v1 & 0x100) != 0)
LABEL_9:
    objc_msgSend_appendString_(v4, v3, (uint64_t)CFSTR("width-insensitive"));
LABEL_10:
  if (objc_msgSend_hasSuffix_(v4, v3, (uint64_t)CFSTR(",")))
  {
    v7 = objc_msgSend_length(v4, v5, v6);
    objc_msgSend_deleteCharactersInRange_(v4, v8, v7 - 1, 1);
  }
  objc_msgSend_stringWithString_(MEMORY[0x1E0CB3940], v5, (uint64_t)v4);
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id sub_1D40C3A30(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  void *v16;
  const char *v17;

  v3 = a2;
  v4 = (void *)objc_opt_new();
  if ((objc_msgSend_compareOptions(*(void **)(a1 + 32), v5, v6) & 8) != 0)
  {
    objc_msgSend_appendString_(v4, v7, (uint64_t)CFSTR("(%K BEGINSWITH %@ || %K LIKE %@)"));
    if ((objc_msgSend_includeUnsearchablePersons(*(void **)(a1 + 32), v12, v13) & 1) == 0)
      objc_msgSend_appendString_(v4, v14, (uint64_t)CFSTR(" && isSearchable == 1"));
    v15 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend_newlineAnchoredPredicateValueForToken_(CLSSearchSpecification, v14, (uint64_t)v3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_predicateWithFormat_(v15, v17, (uint64_t)v4, CFSTR("searchText"), v3, CFSTR("searchText"), v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend_appendString_(v4, v7, (uint64_t)CFSTR("(%K LIKE %@)"));
    if ((objc_msgSend_includeUnsearchablePersons(*(void **)(a1 + 32), v8, v9) & 1) == 0)
      objc_msgSend_appendString_(v4, v10, (uint64_t)CFSTR(" && isSearchable == 1"));
    objc_msgSend_predicateWithFormat_(MEMORY[0x1E0CB3880], v10, (uint64_t)v4, CFSTR("searchText"), v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

id sub_1D40C3C24(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  void *v17;
  void *v18;
  const char *v19;

  v3 = a2;
  v4 = (void *)objc_opt_new();
  if ((objc_msgSend_compareOptions(*(void **)(a1 + 32), v5, v6) & 8) != 0)
  {
    objc_msgSend_appendString_(v4, v7, (uint64_t)CFSTR("(%K BEGINSWITH %@ || %K LIKE %@)"));
    objc_msgSend_appendString_(v4, v13, (uint64_t)CFSTR(" && %K IN %@"));
    if ((objc_msgSend_includeUnsearchablePersons(*(void **)(a1 + 32), v14, v15) & 1) == 0)
      objc_msgSend_appendString_(v4, v16, (uint64_t)CFSTR(" && isSearchable == 1"));
    v17 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend_newlineAnchoredPredicateValueForToken_(CLSSearchSpecification, v16, (uint64_t)v3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_predicateWithFormat_(v17, v19, (uint64_t)v4, CFSTR("searchText"), v3, CFSTR("searchText"), v18, CFSTR("objectID"), *(_QWORD *)(a1 + 40));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend_appendString_(v4, v7, (uint64_t)CFSTR("(%K LIKE %@)"));
    objc_msgSend_appendString_(v4, v8, (uint64_t)CFSTR(" && %K IN %@"));
    if ((objc_msgSend_includeUnsearchablePersons(*(void **)(a1 + 32), v9, v10) & 1) == 0)
      objc_msgSend_appendString_(v4, v11, (uint64_t)CFSTR(" && isSearchable == 1"));
    objc_msgSend_predicateWithFormat_(MEMORY[0x1E0CB3880], v11, (uint64_t)v4, CFSTR("searchText"), v3, CFSTR("objectID"), *(_QWORD *)(a1 + 40));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

id sub_1D40C3F1C(uint64_t a1, void *a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  char v6;
  const char *v7;
  void *v8;
  void *v9;
  void *v10;
  const char *v11;

  v3 = a2;
  v6 = objc_msgSend_compareOptions(*(void **)(a1 + 32), v4, v5);
  v8 = (void *)MEMORY[0x1E0CB3880];
  if ((v6 & 8) != 0)
  {
    objc_msgSend_newlineAnchoredPredicateValueForToken_(CLSSearchSpecification, v7, (uint64_t)v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_predicateWithFormat_(v8, v11, (uint64_t)CFSTR("(%K BEGINSWITH %@ || %K LIKE %@)"), CFSTR("searchText"), v3, CFSTR("searchText"), v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend_predicateWithFormat_(MEMORY[0x1E0CB3880], v7, (uint64_t)CFSTR("(%K LIKE %@)"), CFSTR("searchText"), v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

id sub_1D40C4058(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  const char *v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;

  v3 = a2;
  v4 = (void *)objc_opt_new();
  if ((objc_msgSend_compareOptions(*(void **)(a1 + 32), v5, v6) & 8) != 0)
  {
    objc_msgSend_appendString_(v4, v7, (uint64_t)CFSTR("(%K BEGINSWITH %@ || %K LIKE %@)"));
    objc_msgSend_appendString_(v4, v11, (uint64_t)CFSTR(" && %K IN %@"));
    v12 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend_newlineAnchoredPredicateValueForToken_(CLSSearchSpecification, v13, (uint64_t)v3);
    v14 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_predicateWithFormat_(v12, v15, (uint64_t)v4, CFSTR("searchText"), v3, CFSTR("searchText"), v14, CFSTR("locationID"), *(_QWORD *)(a1 + 40));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = (id)v14;
  }
  else
  {
    objc_msgSend_appendString_(v4, v7, (uint64_t)CFSTR("(%K LIKE %@)"));
    objc_msgSend_appendString_(v4, v8, (uint64_t)CFSTR(" && %K IN %@"));
    objc_msgSend_predicateWithFormat_(MEMORY[0x1E0CB3880], v9, (uint64_t)v4, CFSTR("searchText"), v3, CFSTR("locationID"), *(_QWORD *)(a1 + 40));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

void sub_1D40C6BF0(uint64_t a1, const char *a2)
{
  void *v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[10];

  v7[9] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v7[0] = CFSTR("dateCreated");
  v7[1] = CFSTR("dateLastModified");
  v7[2] = CFSTR("identifier");
  v7[3] = CFSTR("title");
  v7[4] = CFSTR("universalLinkURL");
  v7[5] = CFSTR("topic");
  v7[6] = CFSTR("currentActivityID");
  v7[7] = CFSTR("parent");
  v7[8] = CFSTR("objectID");
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], a2, (uint64_t)v7, 9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v2, v4, (uint64_t)v3);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)qword_1ED0FB8E8;
  qword_1ED0FB8E8 = v5;

}

void sub_1D40C6CF8(uint64_t a1, const char *a2)
{
  void *v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[8];

  v7[7] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v7[0] = CFSTR("parentObjectID");
  v7[1] = CFSTR("isSearchable");
  v7[2] = CFSTR("searchText");
  v7[3] = CFSTR("appleID");
  v7[4] = CFSTR("familyName");
  v7[5] = CFSTR("givenName");
  v7[6] = CFSTR("className");
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], a2, (uint64_t)v7, 7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v2, v4, (uint64_t)v3);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)qword_1ED0FB8F8;
  qword_1ED0FB8F8 = v5;

}

void sub_1D40C6DE0(uint64_t a1, const char *a2)
{
  void *v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[51];

  v7[50] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("parentObjectID");
  v7[1] = CFSTR("type");
  v7[2] = CFSTR("score");
  v7[3] = CFSTR("startTime");
  v7[4] = CFSTR("length");
  v7[5] = CFSTR("appIdentifier");
  v7[6] = CFSTR("dueDate");
  v7[7] = CFSTR("dateOfPublication");
  v7[8] = CFSTR("reviewed");
  v7[9] = CFSTR("state");
  v7[10] = CFSTR("publishingState");
  v7[11] = CFSTR("personID");
  v7[12] = CFSTR("iCloudUserID");
  v7[13] = CFSTR("emailAddress");
  v7[14] = CFSTR("personNumber");
  v7[15] = CFSTR("person");
  v7[16] = CFSTR("roles");
  v7[17] = CFSTR("locked");
  v7[18] = CFSTR("isSearchable");
  v7[19] = CFSTR("searchText");
  v7[20] = CFSTR("locationID");
  v7[21] = CFSTR("tempObjectID");
  v7[22] = CFSTR("handoutID");
  v7[23] = CFSTR("classID");
  v7[24] = CFSTR("brItemID");
  v7[25] = CFSTR("brZoneName");
  v7[26] = CFSTR("brOwnerName");
  v7[27] = CFSTR("studentID");
  v7[28] = CFSTR("granularity");
  v7[29] = CFSTR("completed");
  v7[30] = CFSTR("surveyID");
  v7[31] = CFSTR("ownerPersonID");
  v7[32] = CFSTR("domain");
  v7[33] = CFSTR("assignable");
  v7[34] = CFSTR("ageMin");
  v7[35] = CFSTR("ageMax");
  v7[36] = CFSTR("timeMin");
  v7[37] = CFSTR("timeMax");
  v7[38] = CFSTR("dateExpires");
  v7[39] = CFSTR("displayed");
  v2 = (void *)MEMORY[0x1E0C99E60];
  v7[40] = CFSTR("alertType");
  v7[41] = CFSTR("displayRoles");
  v7[42] = CFSTR("devModeURL");
  v7[43] = CFSTR("schoolworkSyncStatus");
  v7[44] = CFSTR("surveyUpdateStatus");
  v7[45] = CFSTR("questionID");
  v7[46] = CFSTR("responderPersonID");
  v7[47] = CFSTR("email");
  v7[48] = CFSTR("requestorID");
  v7[49] = CFSTR("organizationID");
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], a2, (uint64_t)v7, 50);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v2, v4, (uint64_t)v3);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)qword_1ED0FB908;
  qword_1ED0FB908 = v5;

}

void sub_1D40C7094(uint64_t a1, const char *a2)
{
  uint64_t v2;
  void *v3;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("parent");
  v4[1] = CFSTR("person");
  v5[0] = CFSTR("parentObjectID");
  v5[1] = CFSTR("personID");
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], a2, (uint64_t)v5, v4, 2);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED0FB918;
  qword_1ED0FB918 = v2;

}

id sub_1D40C8318()
{
  if (qword_1EFE35FF0 != -1)
    dispatch_once(&qword_1EFE35FF0, &unk_1E974C4A0);
  return (id)qword_1EFE35FF8;
}

void sub_1D40C8358(uint64_t a1)
{
  id WeakRetained;
  id v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD);
  NSObject *v13;
  id v14;
  uint8_t buf[16];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v14 = WeakRetained;
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v3 = *(id *)(a1 + 32);
    v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v16, v20, 16);
    if (v5)
    {
      v8 = v5;
      v9 = *(_QWORD *)v17;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v3);
          v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v10);
          objc_msgSend_onUploadProgress(v11, v6, v7);
          v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            if (qword_1ED0FB9A0 != -1)
              dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
            v13 = CLSLogAsset;
            if (os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D4054000, v13, OS_LOG_TYPE_DEFAULT, "notifying upload progress", buf, 2u);
            }
            ((void (**)(_QWORD, void *))v12)[2](v12, v11);
          }

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v6, (uint64_t)&v16, v20, 16);
      }
      while (v8);
    }

    WeakRetained = v14;
  }

}

void sub_1D40C85D0(uint64_t a1)
{
  id WeakRetained;
  id v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD);
  NSObject *v13;
  id v14;
  uint8_t buf[16];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v14 = WeakRetained;
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v3 = *(id *)(a1 + 32);
    v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v16, v20, 16);
    if (v5)
    {
      v8 = v5;
      v9 = *(_QWORD *)v17;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v3);
          v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v10);
          objc_msgSend_onUploadComplete(v11, v6, v7);
          v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            if (qword_1ED0FB9A0 != -1)
              dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
            v13 = CLSLogAsset;
            if (os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D4054000, v13, OS_LOG_TYPE_DEFAULT, "notifying upload complete", buf, 2u);
            }
            ((void (**)(_QWORD, void *))v12)[2](v12, v11);
          }

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v6, (uint64_t)&v16, v20, 16);
      }
      while (v8);
    }

    WeakRetained = v14;
  }

}

uint64_t sub_1D40C8948(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

uint64_t sub_1D40C8B28(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void sub_1D40C8BF0(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 344))
  {
    objc_msgSend_shared(CLSDataStore, a2, a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_uploadAsset_(v4, v5, *(_QWORD *)(a1 + 32));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 352);
    *(_QWORD *)(v7 + 352) = v6;

    v9 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v9 + 352))
    {
      if (qword_1ED0FB9A0 != -1)
        dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
      v10 = CLSLogAsset;
      if (os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_ERROR))
      {
        v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 352);
        v12 = 138412290;
        v13 = v11;
        _os_log_error_impl(&dword_1D4054000, v10, OS_LOG_TYPE_ERROR, "Upload request failed with error: %@", (uint8_t *)&v12, 0xCu);
      }
    }
    else
    {
      *(_BYTE *)(v9 + 344) = 1;
    }

  }
}

void sub_1D40C8F58(uint64_t a1)
{
  id WeakRetained;
  const char *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  NSObject *v12;
  dispatch_block_t v13;
  id v14;
  const char *v15;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  _QWORD *v21;
  _BYTE *v22;
  _QWORD v23[3];
  char v24;
  _BYTE buf[24];
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend_URL(WeakRetained, v3, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_path(v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v10 = CLSLogAsset;
    if (os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 + 32) + 336);
      *(_DWORD *)buf = 141558530;
      *(_QWORD *)&buf[4] = 1752392040;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v9;
      *(_WORD *)&buf[22] = 2048;
      v26 = v11;
      _os_log_impl(&dword_1D4054000, v10, OS_LOG_TYPE_DEFAULT, "Completed upload of asset at '%{mask.hash}@' [reported upload progress as: %f]", buf, 0x20u);
      if (qword_1ED0FB9A0 != -1)
        dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    }
    v12 = CLSLogAsset;
    if (os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 141558274;
      *(_QWORD *)&buf[4] = 1752392040;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v9;
      _os_log_impl(&dword_1D4054000, v12, OS_LOG_TYPE_DEFAULT, "About to create a CKShare (if needed) for asset at '%{mask.hash}@'", buf, 0x16u);
    }
    v23[0] = 0;
    v23[1] = v23;
    v23[2] = 0x2020000000;
    v24 = 0;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v26 = sub_1D40C92E4;
    v27 = sub_1D40C92F4;
    v28 = 0;
    v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &unk_1E9749C70);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = sub_1D40C9300;
    v19[3] = &unk_1E974C410;
    v21 = v23;
    v22 = buf;
    v14 = v13;
    v20 = v14;
    objc_msgSend_createShareIfNeeded_Imp_(v5, v15, (uint64_t)v19);
    dispatch_block_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

    _Block_object_dispose(buf, 8);
    _Block_object_dispose(v23, 8);
  }
  else
  {
    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v16 = CLSLogAsset;
    if (os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D4054000, v16, OS_LOG_TYPE_ERROR, "CLSAsset object was released when executing createShareIfNeeded", buf, 2u);
    }
    v18 = *(_QWORD *)(a1 + 40);
    objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E0CB35C8], v17, 316, CFSTR("CLSAsset object was released when executing createShareIfNeeded"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v18 + 16))(v18, 0, v9);
  }

}

void sub_1D40C92B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1D40C92E4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1D40C92F4(uint64_t a1)
{

}

void sub_1D40C9300(_QWORD *a1, char a2, id obj)
{
  id v5;

  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), obj);
  v5 = obj;
  (*(void (**)(void))(a1[4] + 16))();

}

void sub_1D40C94A4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1D40C94C8(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id WeakRetained;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  const char *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  NSObject *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  NSObject *v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  int v51;
  void *v52;
  __int16 v53;
  id v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if ((a2 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    v15 = WeakRetained;
    if (WeakRetained)
    {
      objc_msgSend_lock(WeakRetained, v13, v14);
      objc_msgSend_setBrOwnerName_(v15, v16, (uint64_t)v9);
      objc_msgSend_recordName(v10, v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setBrShareName_(v15, v20, (uint64_t)v19);

      objc_msgSend_recordName(v10, v21, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_pathComponents(v23, v24, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_lastObject(v26, v27, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setBrItemID_(v15, v30, (uint64_t)v29);

      objc_msgSend_zoneID(v10, v31, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_zoneName(v33, v34, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setBrZoneName_(v15, v37, (uint64_t)v36);

      objc_msgSend_setModified_(v15, v38, 1);
      objc_msgSend_unlock(v15, v39, v40);
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
    else
    {
      if (qword_1ED0FB9A0 != -1)
        dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
      v42 = CLSLogAsset;
      if (os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v51) = 0;
        _os_log_error_impl(&dword_1D4054000, v42, OS_LOG_TYPE_ERROR, "CLSAsset object was released when setting up CKShare", (uint8_t *)&v51, 2u);
      }
      v44 = *(_QWORD *)(a1 + 40);
      objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E0CB35C8], v43, 316, CFSTR("CLSAsset object was released when setting up CKShare"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v44 + 16))(v44, 0, v45);

    }
  }
  else
  {
    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v41 = (void *)CLSLogAsset;
    if (os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_ERROR))
    {
      v46 = *(void **)(a1 + 32);
      v47 = v41;
      objc_msgSend_path(v46, v48, v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = 138543618;
      v52 = v50;
      v53 = 2112;
      v54 = v11;
      _os_log_error_impl(&dword_1D4054000, v47, OS_LOG_TYPE_ERROR, "CKShare not created for %{public}@, error: %@", (uint8_t *)&v51, 0x16u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void sub_1D40C9888(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1D40C98A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  id WeakRetained;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  uint8_t v12[16];

  v6 = a5;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v8 = CLSLogAsset;
    if (os_log_type_enabled((os_log_t)CLSLogAsset, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_error_impl(&dword_1D4054000, v8, OS_LOG_TYPE_ERROR, "CLSAsset object was released when checking for CKShare", v12, 2u);
    }
    v10 = *(_QWORD *)(a1 + 32);
    objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E0CB35C8], v9, 316, CFSTR("CLSAsset object was released when checking for CKShare"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v10 + 16))(v10, 0, v11);

  }
}

void sub_1D40C9B48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1D40C9B70(_QWORD *a1, char a2, id obj)
{
  id v5;

  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), obj);
  v5 = obj;
  (*(void (**)(void))(a1[4] + 16))();

}

void sub_1D40CA108()
{
  NSObject *v0;
  qos_class_t v1;
  dispatch_queue_t v2;
  void *v3;
  NSObject *attr;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = qos_class_self();
  dispatch_queue_attr_make_with_qos_class(v0, v1, 0);
  attr = objc_claimAutoreleasedReturnValue();

  v2 = dispatch_queue_create("com.apple.ClassKit.CLSAsset.fileUploadProgress", attr);
  v3 = (void *)qword_1EFE35FF8;
  qword_1EFE35FF8 = (uint64_t)v2;

}

void sub_1D40CA180()
{
  NSObject *v0;
  qos_class_t v1;
  dispatch_queue_t v2;
  void *v3;
  NSObject *attr;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = qos_class_self();
  dispatch_queue_attr_make_with_qos_class(v0, v1, 0);
  attr = objc_claimAutoreleasedReturnValue();

  v2 = dispatch_queue_create("com.apple.ClassKit.CLSAsset.fileUploadRequest", attr);
  v3 = (void *)qword_1EFE36008;
  qword_1EFE36008 = (uint64_t)v2;

}

void sub_1D40CA1F8()
{
  NSObject *v0;
  qos_class_t v1;
  dispatch_queue_t v2;
  void *v3;
  NSObject *attr;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = qos_class_self();
  dispatch_queue_attr_make_with_qos_class(v0, v1, 0);
  attr = objc_claimAutoreleasedReturnValue();

  v2 = dispatch_queue_create("com.apple.ClassKit.CLSAsset.fileSharing", attr);
  v3 = (void *)qword_1EFE36018;
  qword_1EFE36018 = (uint64_t)v2;

}

id sub_1D40CA270(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9;
  id v10;
  void *v11;
  id v12;
  const char *v13;
  void *v14;
  void *v15;
  id *v16;
  id v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  id *v22;

  v9 = a3;
  v10 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v11 = (void *)MEMORY[0x1D82573E4]();
  v22 = (id *)&a9;
  v12 = v9;
  v14 = v12;
  if (v12)
  {
    v15 = v12;
    do
    {
      objc_msgSend_unionSet_(v10, v13, (uint64_t)v15);
      v16 = v22++;
      v17 = *v16;

      v15 = v17;
    }
    while (v17);
  }
  objc_autoreleasePoolPop(v11);
  v20 = (void *)objc_msgSend_copy(v10, v18, v19);

  return v20;
}

void sub_1D40CB26C(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  CLSChildParentRelation *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  CLSParentChildRelation *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  objc_super v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v20.receiver = *(id *)(a1 + 32);
  v20.super_class = (Class)&OBJC_METACLASS___CLSMultipleChoiceAnswerFormat;
  objc_msgSendSuper2(&v20, sel_relations);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED0FB928;
  qword_1ED0FB928 = v2;

  v4 = [CLSChildParentRelation alloc];
  v5 = *(_QWORD *)(a1 + 32);
  v6 = objc_opt_class();
  v8 = (void *)objc_msgSend_initWithChildEntity_parentEntity_faultable_(v4, v7, v5, v6, 1);
  v9 = [CLSParentChildRelation alloc];
  v10 = *(_QWORD *)(a1 + 32);
  v11 = objc_opt_class();
  v13 = (void *)objc_msgSend_initWithParentEntity_childEntity_faultable_(v9, v12, v10, v11, 1);
  v14 = (void *)qword_1ED0FB928;
  v21[0] = v8;
  v21[1] = v13;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v15, (uint64_t)v21, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setByAddingObjectsFromArray_(v14, v17, (uint64_t)v16);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)qword_1ED0FB928;
  qword_1ED0FB928 = v18;

}

void sub_1D40CC3CC(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  CLSChildParentRelation *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  CLSParentChildRelation *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  objc_super v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v20.receiver = *(id *)(a1 + 32);
  v20.super_class = (Class)&OBJC_METACLASS___CLSArchivedMultipleChoiceAnswerItem;
  objc_msgSendSuper2(&v20, sel_relations);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED0FB938;
  qword_1ED0FB938 = v2;

  v4 = [CLSChildParentRelation alloc];
  v5 = *(_QWORD *)(a1 + 32);
  v6 = objc_opt_class();
  v8 = (void *)objc_msgSend_initWithChildEntity_parentEntity_faultable_(v4, v7, v5, v6, 1);
  v9 = [CLSParentChildRelation alloc];
  v10 = *(_QWORD *)(a1 + 32);
  v11 = objc_opt_class();
  v13 = (void *)objc_msgSend_initWithParentEntity_childEntity_faultable_(v9, v12, v10, v11, 1);
  v14 = (void *)qword_1ED0FB938;
  v21[0] = v8;
  v21[1] = v13;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v15, (uint64_t)v21, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setByAddingObjectsFromArray_(v14, v17, (uint64_t)v16);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)qword_1ED0FB938;
  qword_1ED0FB938 = v18;

}

__CFString *NSStringFromCollectionType(unint64_t a1, const char *a2)
{
  if (a1 < 6)
    return *(&off_1E974C500 + a1);
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("Unknown collection type: '%ld'"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

uint64_t CLSCollectionTypeFromString(void *a1)
{
  id v1;
  const char *v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  uint64_t v11;
  const char *v12;
  id v13;

  v1 = a1;
  v3 = v1;
  if (!v1)
    goto LABEL_15;
  if ((objc_msgSend_isEqualToString_(v1, v2, (uint64_t)CFSTR("Unknown")) & 1) == 0)
  {
    if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("Custom")) & 1) != 0)
    {
      v5 = 1;
      goto LABEL_14;
    }
    if ((objc_msgSend_isEqualToString_(v3, v6, (uint64_t)CFSTR("Archived")) & 1) != 0)
    {
      v5 = 2;
      goto LABEL_14;
    }
    if ((objc_msgSend_isEqualToString_(v3, v7, (uint64_t)CFSTR("Tag")) & 1) != 0)
    {
      v5 = 3;
      goto LABEL_14;
    }
    if ((objc_msgSend_isEqualToString_(v3, v8, (uint64_t)CFSTR("Import")) & 1) != 0)
    {
      v5 = 4;
      goto LABEL_14;
    }
    if ((objc_msgSend_isEqualToString_(v3, v9, (uint64_t)CFSTR("Returned")) & 1) != 0)
    {
      v5 = 5;
      goto LABEL_14;
    }
LABEL_15:
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v2, (uint64_t)CFSTR("Unknown collection type string: '%@'"), v3);
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E0C99DA0], v12, *MEMORY[0x1E0C99778], v11, 0);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v13);
  }
  v5 = 0;
LABEL_14:

  return v5;
}

void sub_1D40CE9C8(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  CLSParentChildRelation *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  CLSParentChildRelation *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  CLSParentChildRelation *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  void *v18;
  CLSParentChildRelation *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  void *v23;
  CLSParentChildRelation *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  void *v28;
  void *v29;
  const char *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  objc_super v35;
  _QWORD v36[6];

  v36[5] = *MEMORY[0x1E0C80C00];
  v35.receiver = *(id *)(a1 + 32);
  v35.super_class = (Class)&OBJC_METACLASS___CLSHandout;
  objc_msgSendSuper2(&v35, sel_relations);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED0FB948;
  qword_1ED0FB948 = v2;

  v4 = [CLSParentChildRelation alloc];
  v5 = *(_QWORD *)(a1 + 32);
  v6 = objc_opt_class();
  v8 = (void *)objc_msgSend_initWithParentEntity_childEntity_faultable_(v4, v7, v5, v6, 1);
  v9 = [CLSParentChildRelation alloc];
  v10 = *(_QWORD *)(a1 + 32);
  v11 = objc_opt_class();
  v13 = (void *)objc_msgSend_initWithParentEntity_childEntity_faultable_(v9, v12, v10, v11, 1);
  v14 = [CLSParentChildRelation alloc];
  v15 = *(_QWORD *)(a1 + 32);
  v16 = objc_opt_class();
  v18 = (void *)objc_msgSend_initWithParentEntity_childEntity_faultable_(v14, v17, v15, v16, 1);
  v19 = [CLSParentChildRelation alloc];
  v20 = *(_QWORD *)(a1 + 32);
  v21 = objc_opt_class();
  v23 = (void *)objc_msgSend_initWithParentEntity_childEntity_faultable_(v19, v22, v20, v21, 1);
  v24 = [CLSParentChildRelation alloc];
  v25 = *(_QWORD *)(a1 + 32);
  v26 = objc_opt_class();
  v28 = (void *)objc_msgSend_initWithParentEntity_childEntity_faultable_(v24, v27, v25, v26, 1);
  v29 = (void *)qword_1ED0FB948;
  v36[0] = v8;
  v36[1] = v13;
  v36[2] = v18;
  v36[3] = v23;
  v36[4] = v28;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v30, (uint64_t)v36, 5);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setByAddingObjectsFromArray_(v29, v32, (uint64_t)v31);
  v33 = objc_claimAutoreleasedReturnValue();
  v34 = (void *)qword_1ED0FB948;
  qword_1ED0FB948 = v33;

}

void sub_1D40CF100(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  CLSChildParentRelation *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  objc_super v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v15.receiver = *(id *)(a1 + 32);
  v15.super_class = (Class)&OBJC_METACLASS___CLSGroupMember;
  objc_msgSendSuper2(&v15, sel_relations);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED0FB958;
  qword_1ED0FB958 = v2;

  v4 = [CLSChildParentRelation alloc];
  v5 = *(_QWORD *)(a1 + 32);
  v6 = objc_opt_class();
  v8 = (void *)objc_msgSend_initWithChildEntity_parentEntity_faultable_(v4, v7, v5, v6, 1);
  v9 = (void *)qword_1ED0FB958;
  v16[0] = v8;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v10, (uint64_t)v16, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setByAddingObjectsFromArray_(v9, v12, (uint64_t)v11);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)qword_1ED0FB958;
  qword_1ED0FB958 = v13;

}

id sub_1D40CF20C(void *a1)
{
  void *v2;
  const char *v3;
  void *v4;

  getpid();
  v2 = (void *)launch_copy_extension_properties_for_pid();
  objc_msgSend_cls_appExtensionContainerBundleRecordWithProperties_(a1, v3, (uint64_t)v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id sub_1D40CF250(void *a1, const char *a2, void *a3)
{
  void *v4;
  const char *v5;
  void *v6;

  CLSExtensionPropertiesForConnection(a3, a2, (uint64_t)a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_cls_appExtensionContainerBundleRecordWithProperties_(a1, v5, (uint64_t)v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id sub_1D40CF298(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;
  const char *string;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  id v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3 && (string = xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x1E0C83AE8])) != 0)
  {
    v6 = (uint64_t)string;
    v7 = (void *)MEMORY[0x1D82573E4]();
    objc_msgSend_fileURLWithFileSystemRepresentation_isDirectory_relativeToURL_(MEMORY[0x1E0C99E98], v8, v6, 1, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc(MEMORY[0x1E0CA5848]);
    v19 = 0;
    v12 = (void *)objc_msgSend_initWithURL_error_(v10, v11, (uint64_t)v9, &v19);
    v15 = v19;
    if (v15)
    {
      if (qword_1ED0FB9A0 != -1)
        dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
      v16 = CLSLogDefault;
      if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v21 = v9;
        v22 = 2114;
        v23 = v15;
        _os_log_error_impl(&dword_1D4054000, v16, OS_LOG_TYPE_ERROR, "Failed to get LSApplicationExtensionRecord for url: %{public}@, error: %{public}@", buf, 0x16u);
      }
    }
    objc_msgSend_containingBundleRecord(v12, v13, v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v7);
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

id CLSPersonalPersonaUniqueIdentifier()
{
  if (qword_1ED0FB970 != -1)
    dispatch_once(&qword_1ED0FB970, &unk_1E9749CB0);
  return (id)qword_1ED0FB968;
}

void sub_1D40CFAE8(uint64_t a1, const char *a2)
{
  void *v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend_personaAttributesForPersonaType_(MEMORY[0x1E0DC5F00], a2, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v2;
  if (v2)
  {
    objc_msgSend_userPersonaUniqueString(v2, v3, v4);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)qword_1ED0FB968;
    qword_1ED0FB968 = v6;

    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v8 = CLSLogDefault;
    if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_INFO))
    {
      v10 = 138412290;
      v11 = qword_1ED0FB968;
      _os_log_impl(&dword_1D4054000, v8, OS_LOG_TYPE_INFO, "personalPersonaUniqueIdentifier %@", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v9 = CLSLogDefault;
    if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v10) = 0;
      _os_log_error_impl(&dword_1D4054000, v9, OS_LOG_TYPE_ERROR, "Failed to get UMUserPersonaAttributes. The device may be a 'Shared iPad'", (uint8_t *)&v10, 2u);
    }
  }

}

BOOL CLSAdoptPersona(void *a1)
{
  const char *v1;
  uint64_t v2;
  id v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  _BOOL8 v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  int v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  if (v3)
  {
    objc_msgSend_sharedManager(MEMORY[0x1E0DC5EE8], v1, v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_currentPersona(v4, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_userPersonaUniqueString(v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v10;
    if (v10 && (objc_msgSend_isEqualToString_(v10, v11, (uint64_t)v3) & 1) != 0)
    {
      v13 = 1;
    }
    else
    {
      objc_msgSend_createPersonaContextForBackgroundProcessingWithPersonaUniqueString_(v7, v11, (uint64_t)v3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v14 == 0;
      if (qword_1ED0FB9A0 != -1)
        dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
      v15 = CLSLogDefault;
      if (v14)
      {
        if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR))
        {
          v18 = 138543618;
          v19 = v3;
          v20 = 2114;
          v21 = v14;
          _os_log_error_impl(&dword_1D4054000, v15, OS_LOG_TYPE_ERROR, "Error adopting persona with unique string '%{public}@': %{public}@;",
            (uint8_t *)&v18,
            0x16u);
        }
      }
      else if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_DEBUG))
      {
        v18 = 138543362;
        v19 = v3;
        _os_log_debug_impl(&dword_1D4054000, v15, OS_LOG_TYPE_DEBUG, "Current thread adopted persona with unique string %{public}@", (uint8_t *)&v18, 0xCu);
      }

    }
  }
  else
  {
    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v16 = CLSLogDefault;
    if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v18) = 0;
      _os_log_error_impl(&dword_1D4054000, v16, OS_LOG_TYPE_ERROR, "Cannot adopt a persona with 'nil' personaUniqueIdentifier", (uint8_t *)&v18, 2u);
    }
    v13 = 0;
  }

  return v13;
}

void CLSPerformWithPersona(void *a1, void *a2)
{
  id v3;
  void (**v4)(_QWORD);
  const char *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  void *v17;
  const char *v18;
  id v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  id v23;
  id v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  if (v4)
  {
    v7 = (void *)MEMORY[0x1D82573E4]();
    if (v3)
    {
      objc_msgSend_sharedManager(MEMORY[0x1E0DC5EE8], v5, v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_currentPersona(v8, v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_userPersonaUniqueString(v11, v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v14;
      if (!v14 || (objc_msgSend_isEqualToString_(v14, v15, (uint64_t)v3) & 1) == 0)
      {
        v23 = 0;
        v17 = (void *)objc_msgSend_copyCurrentPersonaContextWithError_(v11, v15, (uint64_t)&v23);
        v19 = v23;
        v24 = v17;
        if (v19)
        {
          if (qword_1ED0FB9A0 != -1)
            dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
          v20 = CLSLogDefault;
          if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v26 = v19;
            _os_log_error_impl(&dword_1D4054000, v20, OS_LOG_TYPE_ERROR, "Will not restore persona: %{public}@", buf, 0xCu);
          }
        }
        objc_msgSend_generateAndRestorePersonaContextWithPersonaUniqueString_(v11, v18, (uint64_t)v3);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          if (qword_1ED0FB9A0 != -1)
            dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
          v22 = CLSLogDefault;
          if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v26 = v3;
            v27 = 2114;
            v28 = v21;
            _os_log_error_impl(&dword_1D4054000, v22, OS_LOG_TYPE_ERROR, "Failed to temporarily adopt persona:'%@' with error: %{public}@. The code will be executed in current persona with unexpected result.", buf, 0x16u);
          }
        }
        v4[2](v4);
        sub_1D40D0120(&v24);

        goto LABEL_18;
      }

    }
    v4[2](v4);
LABEL_18:
    objc_autoreleasePoolPop(v7);
  }

}

void sub_1D40D00FC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_1D40D0120((id *)va);
  _Unwind_Resume(a1);
}

id sub_1D40D0120(id *a1)
{
  const char *v1;
  uint64_t v2;
  id v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  NSObject *v10;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v3 = *a1;
  if (v3)
  {
    objc_msgSend_sharedManager(MEMORY[0x1E0DC5EE8], v1, v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_currentPersona(v4, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_restorePersonaWithSavedPersonaContext_(v7, v8, (uint64_t)v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      if (qword_1ED0FB9A0 != -1)
        dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
      v10 = CLSLogDefault;
      if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR))
      {
        v12 = 138543362;
        v13 = v3;
        _os_log_error_impl(&dword_1D4054000, v10, OS_LOG_TYPE_ERROR, "Failed to restore persona for UMUserPersonaContext : %{public}@.", (uint8_t *)&v12, 0xCu);
      }
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void CLSLogDebugCurrentPersona(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend_sharedManager(MEMORY[0x1E0DC5EE8], a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_currentPersona(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (qword_1ED0FB9A0 != -1)
    dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
  v8 = (void *)CLSLogDefault;
  if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_DEBUG))
  {
    v9 = v8;
    objc_msgSend_userPersonaUniqueString(v7, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend_userPersonaType(v7, v13, v14);
    objc_msgSend_userPersonaNickName(v7, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 136315906;
    v20 = a1;
    v21 = 2112;
    v22 = v12;
    v23 = 2048;
    v24 = v15;
    v25 = 2112;
    v26 = v18;
    _os_log_debug_impl(&dword_1D4054000, v9, OS_LOG_TYPE_DEBUG, "%s PersonaUniqueIdentifier: '%@', Type: %lu, Nickname: '%@'", (uint8_t *)&v19, 0x2Au);

  }
}

void sub_1D40D03C0()
{
  os_log_t v0;
  void *v1;
  os_log_t v2;
  void *v3;
  os_log_t v4;
  void *v5;
  os_log_t v6;
  void *v7;
  os_log_t v8;
  void *v9;
  os_log_t v10;
  void *v11;
  os_log_t v12;
  void *v13;
  os_log_t v14;
  void *v15;
  os_log_t v16;
  void *v17;
  os_log_t v18;
  void *v19;
  os_log_t v20;
  void *v21;
  os_log_t v22;
  void *v23;
  os_log_t v24;
  void *v25;
  os_log_t v26;
  void *v27;
  os_log_t v28;
  void *v29;
  os_log_t v30;
  void *v31;
  os_log_t v32;
  void *v33;
  os_log_t v34;
  void *v35;
  os_log_t v36;
  void *v37;
  os_log_t v38;
  void *v39;
  os_log_t v40;
  void *v41;
  os_log_t v42;
  void *v43;
  os_log_t v44;
  void *v45;
  os_log_t v46;
  void *v47;

  v0 = os_log_create("com.apple.ClassKit", "default");
  v1 = (void *)CLSLogDefault;
  CLSLogDefault = (uint64_t)v0;

  v2 = os_log_create("com.apple.ClassKit", "app");
  v3 = (void *)CLSLogApp;
  CLSLogApp = (uint64_t)v2;

  v4 = os_log_create("com.apple.ClassKit", "authorization");
  v5 = (void *)CLSLogAuthorization;
  CLSLogAuthorization = (uint64_t)v4;

  v6 = os_log_create("com.apple.ClassKit", "connection");
  v7 = (void *)CLSLogConnection;
  CLSLogConnection = (uint64_t)v6;

  v8 = os_log_create("com.apple.ClassKit", "database");
  v9 = (void *)CLSLogDatabase;
  CLSLogDatabase = (uint64_t)v8;

  v10 = os_log_create("com.apple.ClassKit", "operations");
  v11 = (void *)CLSLogOperations;
  CLSLogOperations = (uint64_t)v10;

  v12 = os_log_create("com.apple.ClassKit", "fetch");
  v13 = (void *)CLSLogFetch;
  CLSLogFetch = (uint64_t)v12;

  v14 = os_log_create("com.apple.ClassKit", "setup");
  v15 = (void *)CLSLogSetup;
  CLSLogSetup = (uint64_t)v14;

  v16 = os_log_create("com.apple.ClassKit", "sync");
  v17 = (void *)CLSLogSync;
  CLSLogSync = (uint64_t)v16;

  v18 = os_log_create("com.apple.ClassKit", "asmSync");
  v19 = (void *)CLSLogASMSync;
  CLSLogASMSync = (uint64_t)v18;

  v20 = os_log_create("com.apple.ClassKit", "search");
  v21 = (void *)CLSLogSearch;
  CLSLogSearch = (uint64_t)v20;

  v22 = os_log_create("com.apple.ClassKit", "upload");
  v23 = (void *)CLSLogUpload;
  CLSLogUpload = (uint64_t)v22;

  v24 = os_log_create("com.apple.ClassKit", "handout");
  v25 = (void *)CLSLogHandout;
  CLSLogHandout = (uint64_t)v24;

  v26 = os_log_create("com.apple.ClassKit", "classes");
  v27 = (void *)CLSLogClasses;
  CLSLogClasses = (uint64_t)v26;

  v28 = os_log_create("com.apple.ClassKit", "json");
  v29 = (void *)CLSLogJSON;
  CLSLogJSON = (uint64_t)v28;

  v30 = os_log_create("com.apple.ClassKit", "pdtool");
  v31 = (void *)CLSLogPDTool;
  CLSLogPDTool = (uint64_t)v30;

  v32 = os_log_create("com.apple.ClassKit", "push");
  v33 = (void *)CLSLogPush;
  CLSLogPush = (uint64_t)v32;

  v34 = os_log_create("com.apple.ClassKit", "asset");
  v35 = (void *)CLSLogAsset;
  CLSLogAsset = (uint64_t)v34;

  v36 = os_log_create("com.apple.ClassKit", "collection");
  v37 = (void *)CLSLogCollection;
  CLSLogCollection = (uint64_t)v36;

  v38 = os_log_create("com.apple.ClassKit", "notifications");
  v39 = (void *)CLSLogNotifications;
  CLSLogNotifications = (uint64_t)v38;

  v40 = os_log_create("com.apple.ClassKit", "onboarding");
  v41 = (void *)CLSLogOnboarding;
  CLSLogOnboarding = (uint64_t)v40;

  v42 = os_log_create("com.apple.ClassKit", "memory");
  v43 = (void *)CLSLogMemory;
  CLSLogMemory = (uint64_t)v42;

  v44 = os_log_create("com.apple.ClassKit", "multimedia");
  v45 = (void *)CLSLogMultimedia;
  CLSLogMultimedia = (uint64_t)v44;

  v46 = os_log_create("com.apple.ClassKit", "preferences");
  v47 = (void *)CLSLogPreferences;
  CLSLogPreferences = (uint64_t)v46;

}

uint64_t BRSharingCreateShareForItemAtURL()
{
  return MEMORY[0x1E0D10D50]();
}

int CC_SHA224_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1E0C80350](md, c);
}

int CC_SHA224_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x1E0C80358](c);
}

int CC_SHA224_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C80360](c, data, *(_QWORD *)&len);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1E0C97E90](arg);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

uint64_t CGImageCreateThumb()
{
  return MEMORY[0x1E0CBC2F0]();
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
  MEMORY[0x1E0CBC308](idst, image, properties);
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1E0CBC338](data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1E0CBC358](idst);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1E0C9CC60](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1E0C9CCD0](image);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x1E0C9CDA0](image);
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x1E0C9CDA8](image);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1E0CBC568](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1E0CBC590](data, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1E0CBC5C0](url, options);
}

uint64_t CPCopyBundleIdentifierAndTeamFromApplicationIdentifier()
{
  return MEMORY[0x1E0CFA228]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

NSArray *__cdecl NSAllMapTableKeys(NSMapTable *table)
{
  return (NSArray *)MEMORY[0x1E0CB2850](table);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

uint64_t NSRequestConcreteImplementation()
{
  return MEMORY[0x1E0CB3158]();
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1E0CB3178](directory, domainMask, expandTilde);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1E0CB3190](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB3250]();
}

CFStringRef SecTaskCopySigningIdentifier(SecTaskRef task, CFErrorRef *error)
{
  return (CFStringRef)MEMORY[0x1E0CD65E0](task, error);
}

CFDictionaryRef SecTaskCopyValuesForEntitlements(SecTaskRef task, CFArrayRef entitlements, CFErrorRef *error)
{
  return (CFDictionaryRef)MEMORY[0x1E0CD6600](task, entitlements, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1E0CD6610](allocator);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x1E0CD6620](allocator, token);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _CFURLAttachSecurityScopeToFileURL()
{
  return MEMORY[0x1E0C9A5B0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1E0C813B0]();
}

uint64_t csr_check()
{
  return MEMORY[0x1E0C82B78]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C28](queue, block);
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C60](flags, block);
}

intptr_t dispatch_block_wait(dispatch_block_t block, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82C98](block, timeout);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D10](group, queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D38](group, queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E50](label, attr, target);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x1E0C83158]();
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

uint64_t launch_copy_extension_properties()
{
  return MEMORY[0x1E0C83A88]();
}

uint64_t launch_copy_extension_properties_for_pid()
{
  return MEMORY[0x1E0C83A90]();
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

BOOL notify_is_valid_token(int val)
{
  return MEMORY[0x1E0C843F0](*(_QWORD *)&val);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1E0C843F8](name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1E0DE7CA8](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

Class objc_lookUpClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7D10](name);
}

void objc_moveWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7D18](to, from);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)((uint64_t (*)(id, SEL))MEMORY[0x1E0DE7D20])(a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x1E0DE7F40](object, key, value, policy);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F90](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

void objc_terminate(void)
{
  MEMORY[0x1E0DE7FD8]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t os_unfair_recursive_lock_lock_with_options()
{
  return MEMORY[0x1E0C849B8]();
}

uint64_t os_unfair_recursive_lock_unlock()
{
  return MEMORY[0x1E0C849D0]();
}

const char *__cdecl protocol_getName(Protocol *p)
{
  return (const char *)MEMORY[0x1E0DE80B0](p);
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x1E0C84F80]();
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x1E0C851A8]();
}

uint64_t sandbox_extension_issue_file_to_process()
{
  return MEMORY[0x1E0C851B0]();
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C854D8](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1E0C855A8](__s1, __s2, __n);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x1E0C861F0](xdict, applier);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1E0C862C8](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C862E0](xdict, key);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x1E0C863B8](xdict, key, value);
}

BOOL xpc_equal(xpc_object_t object1, xpc_object_t object2)
{
  return MEMORY[0x1E0C86420](object1, object2);
}

