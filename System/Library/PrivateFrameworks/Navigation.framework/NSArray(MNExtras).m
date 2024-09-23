@implementation NSArray(MNExtras)

- (id)_navigation_firstObjectPassingTest:()MNExtras
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __56__NSArray_MNExtras___navigation_firstObjectPassingTest___block_invoke;
    v9[3] = &unk_1E61D7AC8;
    v10 = v4;
    v6 = objc_msgSend(a1, "indexOfObjectPassingTest:", v9);
    if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v7 = 0;
    }
    else
    {
      objc_msgSend(a1, "objectAtIndexedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
