@implementation CKShareParticipant(HMB)

- (BOOL)hmbIsEqualToParticipant:()HMB
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  _BOOL8 v7;

  v4 = a3;
  if (objc_msgSend(a1, "isEqual:", v4)
    && (v5 = objc_msgSend(a1, "acceptanceStatus"), v5 == objc_msgSend(v4, "acceptanceStatus")))
  {
    v6 = objc_msgSend(a1, "permission");
    v7 = v6 == objc_msgSend(v4, "permission");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
