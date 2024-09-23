@implementation IDSService

BOOL __46__IDSService_HMDAccounts__hmd_preferredHandle__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;

  v3 = a2;
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32)) && !objc_msgSend(v3, "isLocal");

  return v4;
}

uint64_t __46__IDSService_HMDAccounts__hmd_preferredHandle__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "isLocal");
  if (v6 == objc_msgSend(v5, "isLocal"))
  {
    v8 = objc_msgSend(v4, "type");
    if (v8 != objc_msgSend(v5, "type"))
    {
      if (objc_msgSend(v4, "type") == 1)
      {
        v7 = 1;
        goto LABEL_11;
      }
      if (objc_msgSend(v5, "type") == 1)
      {
        v7 = -1;
        goto LABEL_11;
      }
    }
    v7 = 0;
    goto LABEL_11;
  }
  if (objc_msgSend(v4, "isLocal"))
    v7 = -1;
  else
    v7 = 1;
LABEL_11:

  return v7;
}

@end
