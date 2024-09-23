@implementation NSError(UserNotifications)

+ (id)un_errorWithUNErrorCode:()UserNotifications userInfo:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a4;
  objc_msgSend(a1, "_un_descriptionForUNErrorCode:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_updateUserInfo:withLocalizedDescription:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("UNErrorDomain"), a3, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)un_errorWithUNPrivateErrorCode:()UserNotifications userInfo:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a4;
  objc_msgSend(a1, "_un_descriptionForUNPrivateErrorCode:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_updateUserInfo:withLocalizedDescription:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("UNErrorDomain"), a3, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (const)_un_descriptionForUNErrorCode:()UserNotifications
{
  const __CFString *result;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;

  result = CFSTR("Notifications are not allowed for this application");
  if (a3 > 1399)
  {
    v4 = CFSTR("Content providing object not allowed");
    v5 = CFSTR("Content providing object is invalid");
    v6 = CFSTR("Badge count is invalid");
    if (a3 != 1600)
      v6 = CFSTR("Notifications are not allowed for this application");
    if (a3 != 1501)
      v5 = v6;
    if (a3 != 1500)
      v4 = v5;
    v7 = CFSTR("Notification has no date");
    v8 = CFSTR("Notification has no user visible content");
    if (a3 != 1401)
      v8 = CFSTR("Notifications are not allowed for this application");
    if (a3 != 1400)
      v7 = v8;
    if (a3 <= 1499)
      return v7;
    else
      return v4;
  }
  else
  {
    switch(a3)
    {
      case 'd':
        result = CFSTR("Invalid attachment file URL");
        break;
      case 'e':
        result = CFSTR("Unrecognized attachment file type");
        break;
      case 'f':
        result = CFSTR("Invalid attachment file size");
        break;
      case 'g':
        result = CFSTR("Attachment is not in the data store");
        break;
      case 'h':
        result = CFSTR("Failed to move attachment file into data store");
        break;
      case 'i':
        result = CFSTR("Attachment is corrupt");
        break;
      default:
        return result;
    }
  }
  return result;
}

+ (const)_un_descriptionForUNPrivateErrorCode:()UserNotifications
{
  const __CFString *result;

  switch(a3)
  {
    case 1901:
      result = CFSTR("Service extension time expired");
      break;
    case 1902:
      result = CFSTR("Invalid context");
      break;
    case 1903:
      result = CFSTR("Service extension encountered an unknown error");
      break;
    case 1904:
      result = CFSTR("Unknown application");
      break;
    default:
      if (a3 == 2000)
        result = CFSTR("Repository could not save notification due to mismatched revision numbers");
      else
        result = CFSTR("Service extension failed to start");
      break;
  }
  return result;
}

+ (id)_updateUserInfo:()UserNotifications withLocalizedDescription:
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;

  v5 = a3;
  v6 = a4;
  v7 = *MEMORY[0x1E0CB2D50];
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0CB2D50]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v9 = (void *)objc_msgSend(v5, "mutableCopy");
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v12 = v11;

    objc_msgSend(v12, "setObject:forKey:", v6, v7);
    v13 = objc_msgSend(v12, "copy");

    v5 = (id)v13;
  }

  return v5;
}

@end
