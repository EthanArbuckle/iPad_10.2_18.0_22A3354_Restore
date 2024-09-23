@implementation HMDHPSAPIConformanceProviding

+ (BOOL)objectRespondsToHPSSiriAvailableLanguagesProtocolMethods:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = objc_msgSend(a1, "objectRespondsToHPSSettingProtocolMethods:", v4);
  else
    v5 = 0;

  return v5;
}

+ (BOOL)objectRespondsToHPSLanguageValueProtocolMethods:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = objc_opt_respondsToSelector();
  }
  else
  {
    v4 = 0;
  }

  return v4 & 1;
}

+ (BOOL)objectRespondsToHPSSettingProtocolMethods:(id)a3
{
  return objc_opt_respondsToSelector() & 1;
}

+ (BOOL)objectRespondsToHPSSiriLanguageSettingProtocolMethods:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = objc_msgSend(a1, "objectRespondsToHPSSettingProtocolMethods:", v4);
  else
    v5 = 0;

  return v5;
}

+ (BOOL)objectRespondsToHPSStringSettingProtocolMethods:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = objc_msgSend(a1, "objectRespondsToHPSSettingProtocolMethods:", v4);
  else
    v5 = 0;

  return v5;
}

+ (BOOL)objectRespondsToHPSBooleanSettingProtocolMethods:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = objc_msgSend(a1, "objectRespondsToHPSSettingProtocolMethods:", v4);
  else
    v5 = 0;

  return v5;
}

+ (BOOL)objectRespondsToHPSNumberSettingProtocolMethods:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = objc_msgSend(a1, "objectRespondsToHPSSettingProtocolMethods:", v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (BOOL)objectRespondsToHPSConstrainedNumberSettingProtocolMethods:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = objc_msgSend(a1, "objectRespondsToHPSNumberSettingProtocolMethods:", v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
