@implementation CWFScanResult

- (id)supportedEAPTypes
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CWFScanResult scanRecord](self, "scanRecord"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("AcceptEAPTypes")));

  return v3;
}

- (BOOL)isSAE
{
  void *v2;
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CWFScanResult scanRecord](self, "scanRecord"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("RSN_IE")));

  if (v3
    && ((v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("IE_KEY_RSN_AUTHSELS")))) != 0
     || (v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("IE_KEY_WPA_AUTHSELS")))) != 0))
  {
    if ((objc_msgSend(v4, "containsObject:", &off_100078DB8) & 1) != 0)
      v5 = 1;
    else
      v5 = objc_msgSend(v4, "containsObject:", &off_100078DD0);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)requiresPassword
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  unsigned __int8 v6;
  void *v8;

  if (-[CWFScanResult isEAP](self, "isEAP"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CWFScanResult supportedEAPTypes](self, "supportedEAPTypes"));
    v4 = objc_msgSend(v3, "containsObject:", &off_100078DE8);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CWFScanResult supportedEAPTypes](self, "supportedEAPTypes"));
    if ((objc_msgSend(v5, "containsObject:", &off_100078E00) & 1) != 0)
    {
      v6 = 1;
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CWFScanResult supportedEAPTypes](self, "supportedEAPTypes"));
      v6 = objc_msgSend(v8, "containsObject:", &off_100078E18);

    }
    return (v4 | v6) ^ 1;
  }
  else if ((-[CWFScanResult isWPA](self, "isWPA") & 1) != 0
         || (-[CWFScanResult isWPA2](self, "isWPA2") & 1) != 0
         || (-[CWFScanResult isWEP](self, "isWEP") & 1) != 0
         || (-[CWFScanResult isWAPI](self, "isWAPI") & 1) != 0)
  {
    return 1;
  }
  else
  {
    return -[CWFScanResult isSAE](self, "isSAE");
  }
}

- (BOOL)isSecure
{
  return (-[CWFScanResult isWPA](self, "isWPA") & 1) != 0
      || (-[CWFScanResult isWPA2](self, "isWPA2") & 1) != 0
      || (-[CWFScanResult isWPA3](self, "isWPA3") & 1) != 0
      || (-[CWFScanResult isWEP](self, "isWEP") & 1) != 0
      || (-[CWFScanResult isWAPI](self, "isWAPI") & 1) != 0
      || -[CWFScanResult WAPISubtype](self, "WAPISubtype") == (id)2
      || -[CWFScanResult WAPISubtype](self, "WAPISubtype") == (id)1;
}

@end
