@implementation NSMutableAttributedString(CKUtilities)

- (void)__ck_removeOccurencesOfString:()CKUtilities
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(a1, "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "rangeOfString:options:", v7, 2) == 0x7FFFFFFFFFFFFFFFLL)
  {
    do
    {
      objc_msgSend(a1, "deleteCharactersInRange:", 0x7FFFFFFFFFFFFFFFLL, v5);
      objc_msgSend(a1, "string");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v4 = v6;
    }
    while (objc_msgSend(v6, "rangeOfString:options:", v7, 2) == 0x7FFFFFFFFFFFFFFFLL);
  }
  else
  {
    v6 = v4;
  }

}

- (void)__ck_removeAllAttributesExcept:()CKUtilities
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  void *v10;

  v4 = a3;
  v5 = objc_msgSend(a1, "length");
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v4);

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __73__NSMutableAttributedString_CKUtilities____ck_removeAllAttributesExcept___block_invoke;
  v8[3] = &unk_1E274E3B8;
  v9 = v6;
  v10 = a1;
  v7 = v6;
  objc_msgSend(a1, "enumerateAttributesInRange:options:usingBlock:", 0, v5, 0, v8);

}

- (void)__ck_filterAttributes:()CKUtilities
{
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_msgSend(a1, "length");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__NSMutableAttributedString_CKUtilities____ck_filterAttributes___block_invoke;
  v7[3] = &unk_1E274E408;
  v7[4] = a1;
  v8 = v4;
  v6 = v4;
  objc_msgSend(a1, "enumerateAttributesInRange:options:usingBlock:", 0, v5, 0, v7);

}

@end
