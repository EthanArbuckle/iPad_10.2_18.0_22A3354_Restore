@implementation CNContact(CKAdditions)

- (id)identifierForKey:()CKAdditions withDestination:
{
  id v6;
  id v7;
  char v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C966A8]);
  v9 = 0;
  if (v7 && (v8 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C97398], "phoneNumberWithStringValue:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(a1, "valueForKey:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __59__CNContact_CKAdditions__identifierForKey_withDestination___block_invoke;
  v19[3] = &unk_1E274DF20;
  v11 = v6;
  v20 = v11;
  v21 = v7;
  v22 = v9;
  v12 = v9;
  v13 = v7;
  v14 = objc_msgSend(v10, "indexOfObjectPassingTest:", v19);

  if (v14 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v15 = 0;
  }
  else
  {
    objc_msgSend(a1, "valueForKey:", v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectAtIndex:", v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v15;
}

@end
