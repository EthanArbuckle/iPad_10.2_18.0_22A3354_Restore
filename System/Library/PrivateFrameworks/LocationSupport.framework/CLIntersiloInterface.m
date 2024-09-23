@implementation CLIntersiloInterface

- (void)extendSelectorInfoWithProtocol:(id)a3 bases:(id)a4
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  int v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v5 = a4;
  if ((sub_1A1A00BB0(v9, v5) & 1) == 0)
  {
    sub_1A1A05938();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68290051;
      v11 = 0;
      v12 = 2082;
      v13 = &unk_1A1A18FAF;
      v14 = 2114;
      v15 = v9;
      v16 = 2114;
      v17 = v5;
      v18 = 2082;
      v19 = "assert";
      v20 = 2081;
      v21 = "__objc_no";
      _os_log_impl(&dword_1A19F4000, v6, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Selector extension failed!\", \"proto\":%{public, location:escape_only}@, \"bases\":%{public, location:escape_only}@, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x3Au);
    }

    sub_1A1A05938();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v7))
    {
      *(_DWORD *)buf = 68290051;
      v11 = 0;
      v12 = 2082;
      v13 = &unk_1A1A18FAF;
      v14 = 2114;
      v15 = v9;
      v16 = 2114;
      v17 = v5;
      v18 = 2082;
      v19 = "assert";
      v20 = 2081;
      v21 = "__objc_no";
      _os_signpost_emit_with_name_impl(&dword_1A19F4000, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Selector extension failed!", "{\"msg%{public}.0s\":\"Selector extension failed!\", \"proto\":%{public, location:escape_only}@, \"bases\":%{public, location:escape_only}@, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x3Au);
    }

    sub_1A1A05938();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68290051;
      v11 = 0;
      v12 = 2082;
      v13 = &unk_1A1A18FAF;
      v14 = 2114;
      v15 = v9;
      v16 = 2114;
      v17 = v5;
      v18 = 2082;
      v19 = "assert";
      v20 = 2081;
      v21 = "__objc_no";
      _os_log_impl(&dword_1A19F4000, v8, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Selector extension failed!\", \"proto\":%{public, location:escape_only}@, \"bases\":%{public, location:escape_only}@, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x3Au);
    }

    abort_report_np();
    __break(1u);
  }

}

+ (id)sharedInterface
{
  if (qword_1ECE24D90 != -1)
    dispatch_once(&qword_1ECE24D90, &unk_1E45FB580);
  return (id)qword_1ECE24D88;
}

- (id)getInfoForSelector:(SEL)a3
{
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_1A1A02A0C;
  v10 = sub_1A1A029EC;
  v11 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1A19FD8C0;
  v5[3] = &unk_1E45FB7E8;
  v5[4] = &v6;
  v5[5] = a3;
  sub_1A19FD7E0(v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (BOOL)hasInfoForSelector:(SEL)a3
{
  BOOL v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_1A1A02A0C;
  v10 = sub_1A1A029EC;
  v11 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1A1A05EE4;
  v5[3] = &unk_1E45FB7E8;
  v5[4] = &v6;
  v5[5] = a3;
  sub_1A19FD7E0(v5);
  v3 = v7[5] != 0;
  _Block_object_dispose(&v6, 8);

  return v3;
}

@end
