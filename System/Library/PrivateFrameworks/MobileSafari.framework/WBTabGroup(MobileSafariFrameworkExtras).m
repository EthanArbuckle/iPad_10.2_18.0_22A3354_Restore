@implementation WBTabGroup(MobileSafariFrameworkExtras)

- (BOOL)hasTextForPasteboard
{
  return objc_msgSend(a1, "tabCountForPasteboard") != 0;
}

- (id)plainTextForPasteboard
{
  char v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v2 = objc_msgSend(a1, "isNamed");
  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "unpinnedTabs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_listOfLinksForTabs:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if ((v2 & 1) != 0)
    {
      v6 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(a1, "title");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", CFSTR("%@\n%@"), v7, v5);
      v8 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = v5;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)richTextForPasteboard
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(a1, "isNamed");
  v3 = (void *)MEMORY[0x1E0CB3498];
  objc_msgSend(a1, "unpinnedTabs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_richListOfLinksForTabs:includingBulletForSingleLink:", v4, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0CB3778]);
    if ((_DWORD)v2)
    {
      v7 = objc_alloc(MEMORY[0x1E0CB3498]);
      objc_msgSend(a1, "title");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *MEMORY[0x1E0DC1138];
      objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 14.0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v7, "initWithString:attributes:", v8, v10);
      objc_msgSend(v6, "appendAttributedString:", v11);

      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR("\n"));
      objc_msgSend(v6, "appendAttributedString:", v12);

    }
    objc_msgSend(v6, "appendAttributedString:", v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (uint64_t)tabCountForPasteboard
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0DCCB58];
  objc_msgSend(a1, "unpinnedTabs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "linkCountForTabs:", v2);

  return v3;
}

- (uint64_t)_sf_isOppositeBrowsingModeOfTabGroup:()MobileSafariFrameworkExtras
{
  id v4;
  uint64_t v5;

  v4 = a3;
  LODWORD(a1) = objc_msgSend(a1, "isPrivateBrowsing");
  v5 = a1 ^ objc_msgSend(v4, "isPrivateBrowsing");

  return v5;
}

@end
