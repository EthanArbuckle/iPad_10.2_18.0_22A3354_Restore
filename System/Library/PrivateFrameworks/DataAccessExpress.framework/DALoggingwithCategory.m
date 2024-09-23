@implementation DALoggingwithCategory

void __DALoggingwithCategory_block_invoke()
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

  v0 = os_log_create("com.apple.dataaccess", "DA");
  v1 = (void *)DALoggingwithCategory_log[0];
  DALoggingwithCategory_log[0] = (uint64_t)v0;

  v2 = os_log_create("com.apple.dataaccess", "EAS");
  v3 = (void *)qword_1ED0232D8;
  qword_1ED0232D8 = (uint64_t)v2;

  v4 = os_log_create("com.apple.dataaccess", "CalDAV");
  v5 = (void *)qword_1ED0232E0;
  qword_1ED0232E0 = (uint64_t)v4;

  v6 = os_log_create("com.apple.dataaccess", "LDAP");
  v7 = (void *)qword_1ED0232E8;
  qword_1ED0232E8 = (uint64_t)v6;

  v8 = os_log_create("com.apple.dataaccess", "PubCal");
  v9 = (void *)qword_1ED0232F0;
  qword_1ED0232F0 = (uint64_t)v8;

  v10 = os_log_create("com.apple.dataaccess", "SubCal");
  v11 = (void *)qword_1ED0232F8;
  qword_1ED0232F8 = (uint64_t)v10;

  v12 = os_log_create("com.apple.dataaccess", "CardDAV");
  v13 = (void *)qword_1ED023300;
  qword_1ED023300 = (uint64_t)v12;

  v14 = os_log_create("com.apple.dataaccess", "IMAPNotes");
  v15 = (void *)qword_1ED023308;
  qword_1ED023308 = (uint64_t)v14;

  v16 = os_log_create("com.apple.dataaccess", "CoreDAV");
  v17 = (void *)qword_1ED023310;
  qword_1ED023310 = (uint64_t)v16;

  v18 = os_log_create("com.apple.dataaccess", "PC");
  v19 = (void *)qword_1ED023318;
  qword_1ED023318 = (uint64_t)v18;

  v20 = os_log_create("com.apple.dataaccess", "Accounts");
  v21 = (void *)qword_1ED023320;
  qword_1ED023320 = (uint64_t)v20;

  v22 = os_log_create("com.apple.dataaccess", "General");
  v23 = (void *)qword_1ED023328;
  qword_1ED023328 = (uint64_t)v22;

}

@end
