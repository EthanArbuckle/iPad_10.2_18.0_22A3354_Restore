@implementation EKParticipant(MobileCal)

- (uint64_t)displayName
{
  return objc_msgSend(MEMORY[0x1E0D0CD18], "displayStringForIdentity:useAddressAsFallback:contactIdentifier:", a1, 1, 0);
}

- (uint64_t)displayNameWithDecomposedFirstName:()MobileCal lastName:department:
{
  return objc_msgSend(MEMORY[0x1E0D0CD18], "displayStringForIdentityWithDecomposedName:useAddressAsFallback:contactIdentifier:outFirstName:outLastName:outDepartment:", a1, 1, 0, a3, a4, a5);
}

- (id)commentLabelString
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;

  objc_msgSend(a1, "inviterNameString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    EventKitUIBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Invited by %@"), &stru_1E601DFA8, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringWithFormat:", v5, v2);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  v7 = (void *)MEMORY[0x1E0D0CD90];
  objc_msgSend(a1, "comment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithAutoCommentRemoved:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && objc_msgSend(v9, "length"))
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    EventKitUIBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("“%@”"), &stru_1E601DFA8, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringWithFormat:", v12, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v6, "stringByAppendingFormat:", CFSTR("\n%@"), v13);
      v14 = objc_claimAutoreleasedReturnValue();

      v6 = (id)v14;
    }
    else
    {
      v6 = v13;
    }

  }
  return v6;
}

@end
