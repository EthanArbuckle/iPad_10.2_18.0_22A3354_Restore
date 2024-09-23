@implementation WFCorrectSpellingIntentHandler

- (void)resolveTextForCorrectSpelling:(id)a3 withCompletion:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  objc_msgSend(a3, "text");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "if_map:", &__block_literal_global_126);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))a4 + 2))(v6, v7);

}

- (void)handleCorrectSpelling:(id)a3 completion:(id)a4
{
  Class (__cdecl *v5)();
  void (**v6)(id, WFCorrectSpellingIntentResponse *);
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  WFCorrectSpellingIntentResponse *v15;
  __CFString *v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id (*v21)(uint64_t, void *);
  void *v22;
  id v23;
  __CFString *v24;

  v5 = (Class (__cdecl *)())getUITextCheckerClass;
  v6 = (void (**)(id, WFCorrectSpellingIntentResponse *))a4;
  v7 = a3;
  v8 = objc_alloc_init(v5());
  objc_msgSend((Class)getUITextCheckerClass(), "availableLanguages");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  v12 = CFSTR("en");
  if (v10)
    v12 = (__CFString *)v10;
  v13 = v12;

  objc_msgSend(v7, "text");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[WFCorrectSpellingIntentResponse initWithCode:userActivity:]([WFCorrectSpellingIntentResponse alloc], "initWithCode:userActivity:", 4, 0);
  v19 = MEMORY[0x24BDAC760];
  v20 = 3221225472;
  v21 = __67__WFCorrectSpellingIntentHandler_handleCorrectSpelling_completion___block_invoke;
  v22 = &unk_24F8AFFF0;
  v23 = v8;
  v24 = v13;
  v16 = v13;
  v17 = v8;
  objc_msgSend(v14, "if_map:", &v19);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCorrectSpellingIntentResponse setText:](v15, "setText:", v18, v19, v20, v21, v22);

  v6[2](v6, v15);
}

id __67__WFCorrectSpellingIntentHandler_handleCorrectSpelling_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)objc_msgSend(a2, "mutableCopy");
  if (objc_msgSend(v3, "length"))
  {
    v4 = 0;
    do
    {
      v5 = objc_msgSend(*(id *)(a1 + 32), "rangeOfMisspelledWordInString:range:startingAt:wrap:language:", v3, 0, objc_msgSend(v3, "length"), v4, 0, *(_QWORD *)(a1 + 40));
      if (v5 == 0x7FFFFFFFFFFFFFFFLL)
        break;
      v7 = v5;
      v8 = v6;
      objc_msgSend(*(id *)(a1 + 32), "guessesForWordRange:inString:language:", v5, v6, v3, *(_QWORD *)(a1 + 40));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "count"))
      {
        objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "replaceCharactersInRange:withString:", v7, v8, v10);
        v8 = objc_msgSend(v10, "length");

      }
      v4 = v8 + v7;

    }
    while (v4 < objc_msgSend(v3, "length"));
  }
  v11 = (void *)objc_msgSend(v3, "copy");

  return v11;
}

uint64_t __79__WFCorrectSpellingIntentHandler_resolveTextForCorrectSpelling_withCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x24BDDA218], "successWithResolvedString:", a2);
}

@end
