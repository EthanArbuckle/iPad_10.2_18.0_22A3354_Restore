@implementation NSHTTPURLResponse(AMSFraudReport)

- (id)ams_fsrData
{
  return AMSNonEmptyHeaderValue(a1, (uint64_t)CFSTR("X-Apple-FSR-Data"));
}

- (id)ams_fsrNameSpace
{
  return AMSNonEmptyHeaderValue(a1, (uint64_t)CFSTR("X-Apple-FSR-NameSpace"));
}

- (id)ams_fsrAnonymousID
{
  return AMSNonEmptyHeaderValue(a1, (uint64_t)CFSTR("X-Apple-FSR-AID"));
}

- (id)ams_fsrKeyID
{
  return AMSNonEmptyHeaderValue(a1, (uint64_t)CFSTR("X-Apple-FSR-KID"));
}

- (id)ams_fsrTransactionID
{
  return AMSNonEmptyHeaderValue(a1, (uint64_t)CFSTR("X-Apple-FSR-TID"));
}

- (id)ams_fsrCallbackUrl
{
  return AMSNonEmptyHeaderValue(a1, (uint64_t)CFSTR("X-Apple-FSR-Callback"));
}

- (id)ams_fsrInitUrl
{
  return AMSNonEmptyHeaderValue(a1, (uint64_t)CFSTR("X-Apple-FSR-Init"));
}

- (id)ams_fsrRequestInterval
{
  return AMSNonEmptyHeaderValue(a1, (uint64_t)CFSTR("X-Apple-FSR-RI"));
}

- (BOOL)ams_isFraudReportInitURLResponse
{
  void *v2;
  void *v3;
  void *v4;
  _BOOL8 v5;

  if (objc_msgSend(a1, "statusCode") != 200)
    return 0;
  objc_msgSend(a1, "ams_fsrNameSpace");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(a1, "ams_fsrInitUrl");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_msgSend(a1, "ams_fsrRequestInterval");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4 != 0;

    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)ams_isFraudReportRetryResponse
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;

  if (objc_msgSend(a1, "statusCode") != 409)
    return 0;
  objc_msgSend(a1, "ams_fsrNameSpace");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(a1, "ams_fsrTransactionID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_msgSend(a1, "ams_fsrAnonymousID");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        objc_msgSend(a1, "ams_fsrData");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v5 != 0;

      }
      else
      {
        v6 = 0;
      }

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)ams_isFraudReportCallbackResponse
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;

  if (objc_msgSend(a1, "statusCode") != 200)
    return 0;
  objc_msgSend(a1, "ams_fsrNameSpace");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(a1, "ams_fsrTransactionID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_msgSend(a1, "ams_fsrAnonymousID");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        objc_msgSend(a1, "ams_fsrData");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        if (v5)
        {
          objc_msgSend(a1, "ams_fsrCallbackUrl");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = v6 != 0;

        }
        else
        {
          v7 = 0;
        }

      }
      else
      {
        v7 = 0;
      }

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
