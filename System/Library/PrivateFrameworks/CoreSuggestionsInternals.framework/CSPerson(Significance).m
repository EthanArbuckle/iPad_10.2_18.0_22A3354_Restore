@implementation CSPerson(Significance)

- (BOOL)sg_isSignificantWithStore:()Significance
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  if (v4
    && (objc_msgSend(a1, "handles"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "count"),
        v5,
        v6))
  {
    objc_msgSend(a1, "handles");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "anyHandleIsSignificant:", v7) & 1) != 0)
    {
      v8 = 1;
    }
    else
    {
      objc_msgSend(a1, "handles");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "handleIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = +[SGContactsInterface handleExistsInContactStoreForHandle:withHandleType:](SGContactsInterface, "handleExistsInContactStoreForHandle:withHandleType:", v10, v11);

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
