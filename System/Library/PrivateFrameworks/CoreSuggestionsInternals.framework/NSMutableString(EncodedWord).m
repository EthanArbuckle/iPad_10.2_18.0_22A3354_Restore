@implementation NSMutableString(EncodedWord)

- (void)sg_decodeEncodedWords
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD block[6];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1C3BD4F6C]();
  if ((unint64_t)objc_msgSend(a1, "length") >= 9)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__NSMutableString_EncodedWord__sg_decodeEncodedWords__block_invoke;
    block[3] = &unk_1E7DB6368;
    block[4] = a1;
    block[5] = a2;
    v31 = a1;
    v27 = v4;
    if (sg_decodeEncodedWords__pasOnceToken8 != -1)
      dispatch_once(&sg_decodeEncodedWords__pasOnceToken8, block);
    v5 = a1;
    v26 = (id)sg_decodeEncodedWords__pasExprOnceResult;
    objc_msgSend(v26, "matchesInString:options:range:", a1, 0, 0, objc_msgSend(a1, "length"));
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "reverseObjectEnumerator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v33;
      v28 = v6;
      v29 = 0x7FFFFFFFFFFFFFFFLL;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v33 != v9)
            objc_enumerationMutation(v6);
          v11 = objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v10), "range");
          v13 = v12;
          objc_msgSend(v5, "substringWithRange:", v11, v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "dataUsingEncoding:", 1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E6E0]), "initWithHeaderData:", v15);
          if (objc_msgSend(v16, "identifyRangeOfEncodedWordAtIndex:", 0) != 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(v16, "stringEncoding");
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            if (v17)
            {
              v18 = (void *)objc_opt_new();
              if (objc_msgSend(v16, "decodeEncodedTextToData:", v18) && objc_msgSend(v18, "length"))
              {
                v19 = objc_alloc(MEMORY[0x1E0CB3940]);
                objc_msgSend(v16, "stringEncoding");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                v21 = (void *)objc_msgSend(v19, "initWithData:encoding:", v18, objc_msgSend(v20, "unsignedIntValue"));

                if (v21)
                {
                  v22 = v29;
                  v5 = v31;
                  if (v29 != 0x7FFFFFFFFFFFFFFFLL)
                  {
                    if (sg_decodeEncodedWords__pasOnceToken9 != -1)
                    {
                      dispatch_once(&sg_decodeEncodedWords__pasOnceToken9, &__block_literal_global_9367);
                      v22 = v29;
                    }
                    v30 = v22 - (v11 + v13);
                    v5 = v31;
                    v23 = objc_msgSend(v31, "rangeOfCharacterFromSet:options:range:", sg_decodeEncodedWords__pasExprOnceResult_10, 2);
                    v24 = v30;
                    if (v23 != 0x7FFFFFFFFFFFFFFFLL)
                      v24 = 0;
                    v13 += v24;
                  }
                  objc_msgSend(v5, "replaceCharactersInRange:withString:", v11, v13, v21);
                  v29 = v11;
                }
                else
                {
                  v5 = v31;
                }

                v6 = v28;
              }

            }
          }

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      }
      while (v8);
    }

    v4 = v27;
  }
  objc_autoreleasePoolPop(v4);
}

@end
