@implementation EMKTextEnumerator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emojiPreferences, 0);
  objc_storeStrong((id *)&self->_emojiDatasByLanguage, 0);
}

- (EMKTextEnumerator)initWithEmojiPreferences:(id)a3
{
  id v5;
  EMKTextEnumerator *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *emojiDatasByLanguage;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)EMKTextEnumerator;
  v6 = -[EMKTextEnumerator init](&v10, sel_init);
  if (v6)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    emojiDatasByLanguage = v6->_emojiDatasByLanguage;
    v6->_emojiDatasByLanguage = v7;

    objc_storeStrong((id *)&v6->_emojiPreferences, a3);
  }

  return v6;
}

- (EMKTextEnumerator)init
{
  return -[EMKTextEnumerator initWithEmojiPreferences:](self, "initWithEmojiPreferences:", 0);
}

- (id)emojiDataForLanguage:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  NSMutableDictionary *emojiDatasByLanguage;

  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_emojiDatasByLanguage, "objectForKey:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqual:", v7);

    if (!v8)
      goto LABEL_8;
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0D1F230], "emojiLocaleDataWithLocaleIdentifier:", v4);
  v9 = objc_claimAutoreleasedReturnValue();
  emojiDatasByLanguage = self->_emojiDatasByLanguage;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](emojiDatasByLanguage, "setObject:forKey:", v6, v4);
LABEL_7:

    v6 = 0;
    goto LABEL_8;
  }
  v6 = (void *)v9;
  -[NSMutableDictionary setObject:forKey:](emojiDatasByLanguage, "setObject:forKey:", v9, v4);
LABEL_8:

  return v6;
}

- (void)enumerateEmojiSignifiersInString:(id)a3 touchingRange:(_NSRange)a4 language:(id)a5 usingBlock:(id)a6
{
  NSUInteger length;
  NSUInteger location;
  id v11;
  id v12;
  id v13;
  NSUInteger v14;
  NSUInteger v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  NSUInteger v25;
  NSUInteger v26;

  length = a4.length;
  location = a4.location;
  v11 = a3;
  v12 = a5;
  v13 = a6;
  if (enumerateEmojiSignifiersInString_touchingRange_language_usingBlock__onceToken != -1)
    dispatch_once(&enumerateEmojiSignifiersInString_touchingRange_language_usingBlock__onceToken, &__block_literal_global_1);
  if (location)
    v14 = location - 1;
  else
    v14 = 0;
  if (location)
    ++length;
  if (length + v14 >= objc_msgSend(v11, "length"))
    v15 = length;
  else
    v15 = length + 1;
  v16 = objc_msgSend(v11, "paragraphRangeForRange:", v14, v15);
  v18 = v17;
  objc_msgSend(v11, "rangeOfCharacterFromSet:options:range:", enumerateEmojiSignifiersInString_touchingRange_language_usingBlock__searchableCharacterSet, 0, v16, v17);
  if (v19)
  {
    -[EMKTextEnumerator emojiDataForLanguage:](self, "emojiDataForLanguage:", v12);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20 && v18)
    {
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __88__EMKTextEnumerator_enumerateEmojiSignifiersInString_touchingRange_language_usingBlock___block_invoke_2;
      v21[3] = &unk_1EA258CC0;
      v25 = v14;
      v26 = v15;
      v21[4] = self;
      v22 = v11;
      v23 = v12;
      v24 = v13;
      objc_msgSend(v20, "enumerateSearchResultsInText:range:options:searchType:usingBlock:", v22, v16, v18, 17, 1, v21);

    }
  }
  else
  {
    v20 = 0;
  }

}

void __88__EMKTextEnumerator_enumerateEmojiSignifiersInString_touchingRange_language_usingBlock___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB3780], "controlCharacterSet");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "formUnionWithCharacterSet:", v0);

  objc_msgSend(v3, "addCharactersInRange:", 65532, 4);
  objc_msgSend(v3, "invert");
  v1 = objc_msgSend(v3, "copy");
  v2 = (void *)enumerateEmojiSignifiersInString_touchingRange_language_usingBlock__searchableCharacterSet;
  enumerateEmojiSignifiersInString_touchingRange_language_usingBlock__searchableCharacterSet = v1;

}

void __88__EMKTextEnumerator_enumerateEmojiSignifiersInString_touchingRange_language_usingBlock___block_invoke_2(uint64_t a1, void *a2, unint64_t a3, uint64_t a4)
{
  id v7;
  unint64_t v8;
  void *v10;
  uint64_t v11;
  EMKEmojiTokenList *v12;
  id v13;

  v7 = a2;
  if (a4)
  {
    v8 = *(_QWORD *)(a1 + 64);
    if (a3 <= *(_QWORD *)(a1 + 72) + v8 && v8 <= a3 + a4)
    {
      v13 = v7;
      if (objc_msgSend(v7, "count"))
      {
        if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
        {
          objc_msgSend(*(id *)(a1 + 40), "substringWithRange:", a3, a4);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copySortedEmojis:keyword:localeIdentifier:", v13, v10, *(_QWORD *)(a1 + 48));

          v13 = (id)v11;
        }
        v12 = -[EMKEmojiTokenList initWithEmojiTokenArray:]([EMKEmojiTokenList alloc], "initWithEmojiTokenArray:", v13);
        (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

      }
      v7 = v13;
    }
  }

}

@end
