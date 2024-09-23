@implementation ITMLKitGetLogObject

void __ITMLKitGetLogObject_block_invoke()
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

  v0 = os_log_create("com.apple.ITMLKit", "System");
  v1 = (void *)ITMLKitGetLogObject_categories[0];
  ITMLKitGetLogObject_categories[0] = (uint64_t)v0;

  v2 = os_log_create("com.apple.ITMLKit", "Inspector");
  v3 = (void *)qword_1F01E1B70;
  qword_1F01E1B70 = (uint64_t)v2;

  v4 = os_log_create("com.apple.ITMLKit", "Cache");
  v5 = (void *)qword_1F01E1B78;
  qword_1F01E1B78 = (uint64_t)v4;

  v6 = os_log_create("com.apple.ITMLKit", "Signpost");
  v7 = (void *)qword_1F01E1B80;
  qword_1F01E1B80 = (uint64_t)v6;

  v8 = os_log_create("com.apple.ITMLKit", "Styles");
  v9 = (void *)qword_1F01E1B88;
  qword_1F01E1B88 = (uint64_t)v8;

  v10 = os_log_create("com.apple.ITMLKit", "Safety");
  v11 = (void *)qword_1F01E1B90;
  qword_1F01E1B90 = (uint64_t)v10;

}

@end
