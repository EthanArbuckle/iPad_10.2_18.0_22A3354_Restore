uint64_t sub_232C136E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = qword_255FF5DE0;
  v6 = qword_255FF5DE0;
  if (!qword_255FF5DE0)
  {
    v7 = xmmword_2503FDB20;
    v8 = *(_OWORD *)&off_2503FDB30;
    v1 = _sl_dlopen();
    v4[3] = v1;
    qword_255FF5DE0 = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_232C13790(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_232C137A8()
{
  uint64_t result;
  void *v1;

  v1 = 0;
  result = sub_232C136E0();
  if (!result)
    sub_232C161C4(&v1);
  return result;
}

void *sub_232C137F8()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)qword_255FF5DE8;
  v6 = qword_255FF5DE8;
  if (!qword_255FF5DE8)
  {
    v1 = (void *)sub_232C137A8();
    v0 = dlsym(v1, "DSSourceNamePassKeys");
    v4[3] = (uint64_t)v0;
    qword_255FF5DE8 = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_232C13870(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_232C13A10()
{
  if (qword_255FF5DF8 != -1)
    dispatch_once(&qword_255FF5DF8, &unk_2503FDB68);
  return qword_255FF5DF0;
}

void sub_232C13A50()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.SafariShared.PasswordsDigitalSeparation", "PasswordsSeparation");
  v1 = (void *)qword_255FF5DF0;
  qword_255FF5DF0 = (uint64_t)v0;

}

uint64_t sub_232C13EC8(uint64_t a1)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel__passwordsParticipantWithParticipant_);
}

void sub_232C14368(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if (v4)
  {
    v5 = sub_232C13A10();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_232C16318(a1, v5);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void sub_232C144F0(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if (v4)
  {
    v5 = sub_232C13A10();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_232C163C0(a1, v5);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void sub_232C146DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_232C146F4(uint64_t a1, void *a2)
{
  NSObject *v3;
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  uint64_t v9;

  v3 = *(NSObject **)(a1 + 32);
  v4 = a2;
  dispatch_group_enter(v3);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = sub_232C147A4;
  v6[3] = &unk_2503FDC08;
  v9 = *(_QWORD *)(a1 + 56);
  v5 = *(void **)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 32);
  objc_msgSend(v5, "_stopSharingWithGroup:completionHandler:", v4, v6);

}

void sub_232C147A4(uint64_t a1, void *a2)
{
  os_unfair_lock_s *v3;
  id v4;

  if (a2)
  {
    v3 = (os_unfair_lock_s *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32);
    v4 = a2;
    os_unfair_lock_lock(v3);
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32));
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_232C1480C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "count");
  v3 = *(_QWORD *)(a1 + 40);
  if (v2)
  {
    v4 = (void *)MEMORY[0x24BDD1540];
    v8 = *MEMORY[0x24BDD10D8];
    v5 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
    v9[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("com.apple.SafariShared.PasswordsDigitalSepration.PMSeparationErrorDomain"), 2, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v7);

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v3 + 16))(*(_QWORD *)(a1 + 40), 0);
  }
}

void sub_232C149CC(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  dispatch_group_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  _QWORD v18[4];
  NSObject *v19;
  uint64_t v20;
  id v21;
  _QWORD *v22;
  _QWORD v23[4];
  int v24;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "count"))
  {
    v7 = dispatch_group_create();
    v23[0] = 0;
    v23[1] = v23;
    v23[2] = 0x2810000000;
    v23[3] = &unk_232C1773F;
    v24 = 0;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x24BDAC760];
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = sub_232C14B8C;
    v18[3] = &unk_2503FDC80;
    v10 = v7;
    v11 = *(_QWORD *)(a1 + 32);
    v19 = v10;
    v20 = v11;
    v22 = v23;
    v12 = v8;
    v21 = v12;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v18);
    dispatch_get_global_queue(21, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = v9;
    block[1] = 3221225472;
    block[2] = sub_232C14CD8;
    block[3] = &unk_2503FDC58;
    v16 = v12;
    v17 = *(id *)(a1 + 40);
    v14 = v12;
    dispatch_group_notify(v10, v13, block);

    _Block_object_dispose(v23, 8);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void sub_232C14B74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_232C14B8C(uint64_t a1, void *a2)
{
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;

  v3 = *(NSObject **)(a1 + 32);
  v4 = a2;
  dispatch_group_enter(v3);
  v5 = *(void **)(a1 + 40);
  objc_msgSend(v4, "second");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "first");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = sub_232C14C70;
  v9[3] = &unk_2503FDC08;
  v8 = *(void **)(a1 + 48);
  v12 = *(_QWORD *)(a1 + 56);
  v10 = v8;
  v11 = *(id *)(a1 + 32);
  objc_msgSend(v5, "_stopSharingWithParticipant:inGroup:completionHandler:", v6, v7, v9);

}

void sub_232C14C70(uint64_t a1, void *a2)
{
  os_unfair_lock_s *v3;
  id v4;

  if (a2)
  {
    v3 = (os_unfair_lock_s *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32);
    v4 = a2;
    os_unfair_lock_lock(v3);
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32));
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_232C14CD8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "count");
  v3 = *(_QWORD *)(a1 + 40);
  if (v2)
  {
    v4 = (void *)MEMORY[0x24BDD1540];
    v8 = *MEMORY[0x24BDD10D8];
    v5 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
    v9[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("com.apple.SafariShared.PasswordsDigitalSepration.PMSeparationErrorDomain"), 2, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v7);

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v3 + 16))(*(_QWORD *)(a1 + 40), 0);
  }
}

void sub_232C14EB4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  id v17;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x24BDAC760];
    v13 = 3221225472;
    v14 = sub_232C14FEC;
    v15 = &unk_2503FDCF8;
    v16 = *(id *)(a1 + 32);
    v17 = v7;
    v8 = v7;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", &v12);
    v9 = *(_QWORD *)(a1 + 40);
    v10 = (void *)objc_msgSend(v8, "copy", v12, v13, v14, v15);
    (*(void (**)(uint64_t, void *, _QWORD))(v9 + 16))(v9, v10, 0);

  }
  else
  {
    if (v6)
    {
      v11 = sub_232C13A10();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        sub_232C164AC(v11);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void sub_232C14FEC(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v6 = a2;
  objc_msgSend(v6, "participants");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_232C150BC;
  v7[3] = &unk_2503FDCD0;
  v8 = *(id *)(a1 + 32);
  objc_msgSend(v3, "safari_firstObjectPassingTest:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE82D08]), "initWithFirst:second:", v6, v4);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);

  }
}

uint64_t sub_232C150BC(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "handle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

void sub_232C153A4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;

  v3 = a2;
  if (v3)
  {
    v4 = sub_232C13A10();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_232C16598(a1, v4);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE82DD8], "sharedStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_recordGroupIdentifierForExitCleanup:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
}

void sub_232C15564(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[5];

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "count"))
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = sub_232C15658;
    v9[3] = &unk_2503FDD48;
    v9[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v5, "safari_mapObjectsUsingBlock:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    if (v6)
    {
      v8 = sub_232C13A10();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        sub_232C164AC(v8);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

uint64_t sub_232C15658(uint64_t a1)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel__passwordsGroupWithGroup_);
}

void sub_232C15918(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v5 = a3;
  if (a2)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = sub_232C159F8;
    v8[3] = &unk_2503FDD70;
    v6 = *(void **)(a1 + 40);
    v9 = *(id *)(a1 + 32);
    v10 = *(id *)(a1 + 48);
    objc_msgSend(v6, "_stopSharingWithGroup:completionHandler:", a2, v8);

  }
  else
  {
    v7 = sub_232C13A10();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_232C166A4(a1, v7);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void sub_232C159F8(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    v4 = sub_232C13A10();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_232C16738(a1, v4);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void sub_232C15D00(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    v4 = sub_232C13A10();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_232C16830(a1, v4);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void sub_232C15E90(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "count"))
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = sub_232C15F70;
    v9[3] = &unk_2503FDDC0;
    v7 = *(void **)(a1 + 32);
    v10 = *(id *)(a1 + 40);
    objc_msgSend(v7, "_stopSharingWithGroups:completionHandler:", v5, v9);

  }
  else
  {
    if (v6)
    {
      v8 = sub_232C13A10();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        sub_232C164AC(v8);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void sub_232C15F70(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    v4 = sub_232C13A10();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_232C168C4(v4);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void sub_232C1608C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a3;
  objc_msgSend(a2, "safari_filterObjectsUsingBlock:", &unk_2503FDE00);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

BOOL sub_232C160F8(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "currentUserParticipant");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "inviteStatus") == 2;

  return v3;
}

void sub_232C16140(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_232C1615C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

uint64_t sub_232C16168()
{
  uint64_t v0;

  return v0;
}

id sub_232C1619C(uint64_t a1, void *a2)
{
  return a2;
}

id sub_232C161A8(id a1)
{
  return a1;
}

id sub_232C161B8(uint64_t a1, void *a2)
{
  return a2;
}

void sub_232C161C4(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *DigitalSeparationLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("DigitalSeparationSoftLink.m"), 5, CFSTR("%s"), *a1);

  __break(1u);
}

void sub_232C16240()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "typeof (((typeof (DSSourceNamePassKeys) (*)(void))0)()) getDSSourceNamePassKeys(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("DigitalSeparationSoftLink.m"), 6, CFSTR("%s"), dlerror());

  __break(1u);
}

void sub_232C162B4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  sub_232C16184();
  sub_232C16140(&dword_232C12000, v0, v1, "Falling back to email address for unknown participant handle: %@", v2);
  sub_232C161B0();
}

void sub_232C16318(uint64_t a1, void *a2)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;

  v3 = sub_232C161B8(a1, a2);
  objc_msgSend(v2, "groupID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)sub_232C16168(), "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v2;
  sub_232C16174();
  sub_232C1615C(&dword_232C12000, v3, v5, "Failed to remove participants from group (%@): %@", (uint8_t *)&v6);

  sub_232C1614C();
}

void sub_232C163C0(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "handle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "groupID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)sub_232C16168(), "safari_privacyPreservingDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412802;
  v8 = v5;
  v9 = 2112;
  v10 = a1;
  v11 = 2112;
  v12 = v6;
  _os_log_error_impl(&dword_232C12000, v4, OS_LOG_TYPE_ERROR, "Failed to remove participant (%@) from group (%@): %@", (uint8_t *)&v7, 0x20u);

}

void sub_232C164AC(void *a1)
{
  NSObject *v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];

  sub_232C161A8(a1);
  objc_msgSend((id)sub_232C16168(), "safari_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  sub_232C16184();
  sub_232C16140(&dword_232C12000, v1, v3, "Failed to fetch groups: %@", v4);

  sub_232C16190();
}

void sub_232C16534()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  sub_232C16184();
  sub_232C16140(&dword_232C12000, v0, v1, "Failed to copy contributed items back to My Passwords from group: %@", v2);
  sub_232C161B0();
}

void sub_232C16598(uint64_t a1, void *a2)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;

  v3 = sub_232C161B8(a1, a2);
  objc_msgSend(v2, "groupID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)sub_232C16168(), "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v2;
  sub_232C16174();
  sub_232C1615C(&dword_232C12000, v3, v5, "Failed to leave group (%@): %@", (uint8_t *)&v6);

  sub_232C1614C();
}

void sub_232C16640()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  sub_232C16184();
  sub_232C16140(&dword_232C12000, v0, v1, "Invalid resource: %@", v2);
  sub_232C161B0();
}

void sub_232C166A4(uint64_t a1, void *a2)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;

  sub_232C1619C(a1, a2);
  objc_msgSend((id)sub_232C16168(), "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v3;
  sub_232C16174();
  sub_232C1615C(&dword_232C12000, v2, v5, "Failed to fetch group (%@): %@", (uint8_t *)&v6);

  sub_232C1614C();
}

void sub_232C16738(uint64_t a1, void *a2)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;

  sub_232C1619C(a1, a2);
  objc_msgSend((id)sub_232C16168(), "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v3;
  sub_232C16174();
  sub_232C1615C(&dword_232C12000, v2, v5, "Failed to stop sharing with group (%@): %@", (uint8_t *)&v6);

  sub_232C1614C();
}

void sub_232C167CC()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  sub_232C16184();
  sub_232C16140(&dword_232C12000, v0, v1, "Invalid participant: %@", v2);
  sub_232C161B0();
}

void sub_232C16830(uint64_t a1, void *a2)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;

  sub_232C1619C(a1, a2);
  objc_msgSend((id)sub_232C16168(), "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v3;
  sub_232C16174();
  sub_232C1615C(&dword_232C12000, v2, v5, "Failed to stop sharing with participant (%@): %@", (uint8_t *)&v6);

  sub_232C1614C();
}

void sub_232C168C4(void *a1)
{
  NSObject *v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];

  sub_232C161A8(a1);
  objc_msgSend((id)sub_232C16168(), "safari_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  sub_232C16184();
  sub_232C16140(&dword_232C12000, v1, v3, "Failed to stop all sharing: %@", v4);

  sub_232C16190();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDE0](group, queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x24BDAE068]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

