@implementation HKMedicalCoding(Display)

- (id)formattedDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "codingSystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "code");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "displayString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@\n%@\n%@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)formattedTitle
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;

  objc_msgSend(a1, "codingSystem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6838], "textSystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqual:", v3);

  objc_msgSend(a1, "codingSystem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v4 & 1) == 0)
  {

    if (v7)
    {
      objc_msgSend(a1, "code");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        v9 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("%@_CODE_SEPARATOR_%@"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Clinical-Health-Records"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "codingSystem");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "name");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "code");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "stringWithFormat:", v10, v12, v13);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_8;
      }
      objc_msgSend(a1, "codingSystem");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "name");
      v14 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("OTHER_CODE_SYSTEM"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Clinical-Health-Records"));
      v14 = objc_claimAutoreleasedReturnValue();
    }
    v7 = (void *)v14;
  }
LABEL_8:

  return v7;
}

@end
