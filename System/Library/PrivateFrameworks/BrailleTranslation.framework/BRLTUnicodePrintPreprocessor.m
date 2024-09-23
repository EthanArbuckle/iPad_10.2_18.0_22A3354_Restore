@implementation BRLTUnicodePrintPreprocessor

- (id)preprocessPrintString:(id)a3 withLocationMap:(id *)a4 isEightDot:(BOOL)a5 textFormattingRanges:(id)a6
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __CFString *v15;
  uint64_t v16;
  __CFString *v17;
  uint64_t v18;
  id v19;
  unint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  id v27;
  void *v28;
  unint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  unint64_t v34;
  uint64_t v35;
  id v36;
  id v37;
  void *v38;
  unint64_t v40;
  id *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  unint64_t v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = v7;
  if (v7)
  {
    v9 = objc_msgSend(v7, "length");
    objc_msgSend(MEMORY[0x24BDD16A8], "string");
    v46 = (id)objc_claimAutoreleasedReturnValue();
    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    +[؋ allKeys](&unk_24CBF7F58, "allKeys");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
    v41 = a4;
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v48;
      v15 = &stru_24CBF1330;
      do
      {
        v16 = 0;
        v17 = v15;
        do
        {
          if (*(_QWORD *)v48 != v14)
            objc_enumerationMutation(v11);
          -[__CFString stringByAppendingString:](v17, "stringByAppendingString:", *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * v16));
          v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

          ++v16;
          v17 = v15;
        }
        while (v13 != v16);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
      }
      while (v13);
    }
    else
    {
      v15 = &stru_24CBF1330;
    }
    v40 = v9;

    objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", v15);
    v18 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v8;
    v19 = v8;
    v45 = (void *)v18;
    v43 = v19;
    v20 = 0;
    if (objc_msgSend(v19, "rangeOfCharacterFromSet:", v18) != 0x7FFFFFFFFFFFFFFFLL)
    {
      v21 = v19;
      do
      {
        v22 = objc_msgSend(v21, "rangeOfCharacterFromSet:", v45);
        v23 = v22;
        v25 = v24;
        if (v22)
        {
          if (v22 == 0x7FFFFFFFFFFFFFFFLL)
          {
            v19 = v21;
            break;
          }
          v26 = v46;
          v27 = v10;
          objc_msgSend(v43, "substringWithRange:", v20, v23);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "appendString:", v28);

          v29 = v20;
          v30 = v23;
          do
          {
            v51 = v29;
            objc_msgSend(v27, "appendBytes:length:", &v51, 8);
            ++v29;
            --v30;
          }
          while (v30);

        }
        objc_msgSend(v21, "substringWithRange:", v23, v25);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        +[؋ objectForKey:](&unk_24CBF7F58, "objectForKey:", v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "localizedStringForKey:value:table:", v32, &stru_24CBF1330, CFSTR("CharacterReplacements"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v33, "length"))
        {
          v34 = 0;
          do
          {
            v51 = v23 + v20;
            objc_msgSend(v10, "appendBytes:length:", &v51, 8);
            ++v34;
          }
          while (v34 < objc_msgSend(v33, "length"));
        }
        objc_msgSend(v46, "appendString:", v33);
        v35 = v23 + v25;
        objc_msgSend(v21, "substringFromIndex:", v23 + v25);
        v19 = (id)objc_claimAutoreleasedReturnValue();

        v20 += v35;
        v21 = v19;
      }
      while (v23 != 0x7FFFFFFFFFFFFFFFLL);
    }
    if (v40 > v20)
    {
      v36 = v46;
      v37 = v10;
      objc_msgSend(v43, "substringWithRange:", v20, v40 - v20);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "appendString:", v38);

      do
      {
        v51 = v20;
        objc_msgSend(v37, "appendBytes:length:", &v51, 8);
        ++v20;
      }
      while (v40 != v20);

    }
    if (v41)
      *v41 = objc_retainAutorelease(v10);

    v8 = v42;
  }
  else
  {
    v46 = 0;
  }

  return v46;
}

@end
