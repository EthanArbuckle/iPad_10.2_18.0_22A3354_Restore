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

  v0 = os_log_create("com.apple.remindd.dataaccess", "DA");
  v1 = (void *)DALoggingwithCategory_log[0];
  DALoggingwithCategory_log[0] = (uint64_t)v0;

  v2 = os_log_create("com.apple.remindd.dataaccess", "EAS");
  v3 = (void *)qword_1ED798EE8;
  qword_1ED798EE8 = (uint64_t)v2;

  v4 = os_log_create("com.apple.remindd.dataaccess", "CalDAV");
  v5 = (void *)qword_1ED798EF0;
  qword_1ED798EF0 = (uint64_t)v4;

  v6 = os_log_create("com.apple.remindd.dataaccess", "LDAP");
  v7 = (void *)qword_1ED798EF8;
  qword_1ED798EF8 = (uint64_t)v6;

  v8 = os_log_create("com.apple.remindd.dataaccess", "SubCal");
  v9 = (void *)qword_1ED798F00;
  qword_1ED798F00 = (uint64_t)v8;

  v10 = os_log_create("com.apple.remindd.dataaccess", "CardDAV");
  v11 = (void *)qword_1ED798F08;
  qword_1ED798F08 = (uint64_t)v10;

  v12 = os_log_create("com.apple.remindd.dataaccess", "IMAPNotes");
  v13 = (void *)qword_1ED798F10;
  qword_1ED798F10 = (uint64_t)v12;

  v14 = os_log_create("com.apple.remindd.dataaccess", "CoreDAV");
  v15 = (void *)qword_1ED798F18;
  qword_1ED798F18 = (uint64_t)v14;

  v16 = os_log_create("com.apple.remindd.dataaccess", "PC");
  v17 = (void *)qword_1ED798F20;
  qword_1ED798F20 = (uint64_t)v16;

  v18 = os_log_create("com.apple.remindd.dataaccess", "Accounts");
  v19 = (void *)qword_1ED798F28;
  qword_1ED798F28 = (uint64_t)v18;

  v20 = os_log_create("com.apple.remindd.dataaccess", "DAREM");
  v21 = (void *)qword_1ED798F30;
  qword_1ED798F30 = (uint64_t)v20;

  v22 = os_log_create("com.apple.remindd.dataaccess", "General");
  v23 = (void *)qword_1ED798F38;
  qword_1ED798F38 = (uint64_t)v22;

}

@end
