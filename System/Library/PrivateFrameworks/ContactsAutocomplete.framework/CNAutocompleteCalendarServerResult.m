@implementation CNAutocompleteCalendarServerResult

+ (unint64_t)category
{
  return 3;
}

+ (id)contactResultWithDisplayName:(id)a3 value:(id)a4 nameComponents:(id)a5 identifier:(id)a6 userInfo:(id)a7
{
  id v12;
  void *v13;

  v12 = a7;
  objc_msgSend(a1, "contactResultWithDisplayName:value:nameComponents:identifier:", a3, a4, a5, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setUserInfo:", v12);

  objc_msgSend(v13, "setSourceType:", 64);
  return v13;
}

@end
