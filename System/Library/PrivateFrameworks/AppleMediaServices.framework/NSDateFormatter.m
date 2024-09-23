@implementation NSDateFormatter

void __66__NSDateFormatter_AppleMediaServices__ams_serverFriendlyFormatter__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3578], "_ams_serverFriendlyFormatter");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECEADA48;
  qword_1ECEADA48 = v0;

}

void __79__NSDateFormatter_AppleMediaServices__ams_serverFriendlyLocalTimeZoneFormatter__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3578], "_ams_serverFriendlyLocalTimeZoneFormatter");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECEADA58;
  qword_1ECEADA58 = v0;

}

@end
