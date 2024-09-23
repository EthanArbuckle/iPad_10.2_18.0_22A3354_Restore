@implementation PHPerson(PNPersonProtocol)

- (__CFString)anonymizedName
{
  __CFString *v2;
  void *v3;
  id v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  unsigned __int8 md[20];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_getAssociatedObject(a1, &PHPersonPNPersonProtocolAnonymizedNameKey);
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(a1, "name");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "length"))
    {
      objc_msgSend(v3, "dataUsingEncoding:allowLossyConversion:", 1, 1);
      v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      CC_SHA1((const void *)objc_msgSend(v4, "bytes"), objc_msgSend(v4, "length"), md);
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", md, 20);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
      v2 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v2 = 0;
    }
    if (v2)
      v6 = v2;
    else
      v6 = &stru_1E6B1C190;
    objc_setAssociatedObject(a1, &PHPersonPNPersonProtocolAnonymizedNameKey, v6, (void *)1);

  }
  if (-[__CFString length](v2, "length"))
    v7 = v2;
  else
    v7 = 0;
  v8 = v7;

  return v8;
}

- (BOOL)hidden
{
  return objc_msgSend(a1, "type") == -1;
}

- (BOOL)favorite
{
  return objc_msgSend(a1, "type") == 1;
}

- (void)setIsVerified:()PNPersonProtocol
{
  id v1;

  objc_msgSend(MEMORY[0x1E0CD16D0], "changeRequestForPerson:", a1);
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setVerifiedType:", 2);

}

- (void)setManualOrder:()PNPersonProtocol
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CD16D0], "changeRequestForPerson:", a1);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setManualOrder:", a3);

}

- (id)keyFace
{
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0CD1520], "fetchKeyFaceForPerson:options:", a1, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)setKeyFace:()PNPersonProtocol
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(a1, "keyFace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if ((v7 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CD16D0], "changeRequestForPerson:", a1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setKeyFace:forCluster:", v9, 0);

  }
}

- (void)pn_addMergeCandidatePersons:()PNPersonProtocol
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0CD16D0];
  v5 = a3;
  objc_msgSend(v4, "changeRequestForPerson:", a1);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addMergeCandidatePersons:", v5);

}

- (id)personLocalIdentifiers
{
  void *v1;
  void *v2;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
