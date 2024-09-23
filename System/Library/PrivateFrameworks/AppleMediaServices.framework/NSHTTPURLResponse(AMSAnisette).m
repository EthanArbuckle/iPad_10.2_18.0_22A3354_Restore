@implementation NSHTTPURLResponse(AMSAnisette)

- (id)ams_actionNameV1
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "allHeaderFields");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "ams_objectForCaseInsensitiveKey:", CFSTR("X-Apple-MD-Action"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v2, "length"))
  {

    v2 = 0;
  }
  return v2;
}

- (id)ams_actionNameV1_5
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "allHeaderFields");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "ams_objectForCaseInsensitiveKey:", CFSTR("X-Apple-AMD-Action"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v2, "length"))
  {

    v2 = 0;
  }
  return v2;
}

- (id)ams_actionData
{
  uint64_t v2;
  void *v3;

  v2 = objc_msgSend(a1, "_anisetteType");
  if (v2 == 2 || v2 == 1)
  {
    objc_msgSend(a1, "ams_actionDataV1");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)ams_actionDataV1
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "allHeaderFields");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "ams_objectForCaseInsensitiveKey:", CFSTR("X-Apple-MD-Data"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v2, "length"))
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v2, 0);
  else
    v3 = 0;

  return v3;
}

- (id)ams_actionDataV1_5
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "allHeaderFields");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "ams_objectForCaseInsensitiveKey:", CFSTR("X-Apple-AMD-Data"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v2, "length"))
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v2, 0);
  else
    v3 = 0;

  return v3;
}

- (id)ams_actionName
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(a1, "ams_actionNameV1");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(a1, "ams_actionNameV1");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (uint64_t)_anisetteType
{
  void *v2;
  void *v4;
  _BOOL4 v5;

  objc_msgSend(a1, "ams_actionNameV1");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    return 1;
  objc_msgSend(a1, "ams_actionNameV1");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return 2 * v5;
}

@end
