@implementation NSError(HDIDSError)

- (uint64_t)hd_messageID
{
  void *v1;
  unsigned __int16 *v2;
  uint64_t v3;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("HDIDSContext"));
  v2 = (unsigned __int16 *)objc_claimAutoreleasedReturnValue();

  if (v2)
    v3 = v2[5];
  else
    v3 = 0;

  return v3;
}

- (id)hd_messageSent
{
  void *v1;
  _QWORD *v2;
  void *v3;
  id v4;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("HDIDSContext"));
  v2 = (_QWORD *)objc_claimAutoreleasedReturnValue();

  if (v2)
    v3 = (void *)v2[5];
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (id)hd_messageIDSIdentifier
{
  void *v1;
  _QWORD *v2;
  void *v3;
  id v4;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("HDIDSContext"));
  v2 = (_QWORD *)objc_claimAutoreleasedReturnValue();

  if (v2)
    v3 = (void *)v2[2];
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (id)hd_messageIDSDeviceIdentifier
{
  void *v1;
  _QWORD *v2;
  void *v3;
  id v4;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("HDIDSContext"));
  v2 = (_QWORD *)objc_claimAutoreleasedReturnValue();

  if (v2)
    v3 = (void *)v2[3];
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (id)hd_persistentUserInfo
{
  void *v1;
  _QWORD *v2;
  void *v3;
  id v4;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("HDIDSContext"));
  v2 = (_QWORD *)objc_claimAutoreleasedReturnValue();

  if (v2)
    v3 = (void *)v2[4];
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (BOOL)hd_isFromRequest
{
  void *v1;
  _BYTE *v2;
  _BOOL8 v3;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("HDIDSContext"));
  v2 = (_BYTE *)objc_claimAutoreleasedReturnValue();

  if (v2)
    v3 = v2[8] != 0;
  else
    v3 = 0;

  return v3;
}

- (BOOL)hd_isResponseTimeout
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", CFSTR("HDIDSErrorDomain")))
    v3 = objc_msgSend(a1, "code") == 2;
  else
    v3 = 0;

  return v3;
}

@end
