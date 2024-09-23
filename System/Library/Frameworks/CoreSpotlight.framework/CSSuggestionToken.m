@implementation CSSuggestionToken

void __96___CSSuggestionToken_initWithUserString_displayString_attributeValues_attributeStrings_options___block_invoke()
{
  uint64_t v0;
  void *v1;

  CSGetLocalizedString(CFSTR("PHOTO_TOKEN"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)initWithUserString_displayString_attributeValues_attributeStrings_options__gPhoto;
  initWithUserString_displayString_attributeValues_attributeStrings_options__gPhoto = v0;

}

uint64_t __52___CSSuggestionToken_initWithUserString_itemResult___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v5;

  if (!*(_QWORD *)(result + 32))
  {
    v5 = result;
    result = objc_msgSend(*(id *)(result + 40), "rangeOfString:options:", a2, 1);
    if (result != 0x7FFFFFFFFFFFFFFFLL)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v5 + 48) + 8) + 24) = 1;
      *a4 = 1;
    }
  }
  return result;
}

void __63___CSSuggestionToken_initWithUserString_suggestionTokenResult___block_invoke()
{
  id v0;
  void *v1;
  id v2;
  void *v3;
  id v4;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v0, "setObject:forKey:", &unk_1E242FCD0, CFSTR("kQPTokenApplication"));
  objc_msgSend(v0, "setObject:forKey:", &unk_1E242FD48, CFSTR("kQPTokenAttachmentAny"));
  objc_msgSend(v0, "setObject:forKey:", &unk_1E242FD48, CFSTR("kQPTokenAttachment"));
  objc_msgSend(v0, "setObject:forKey:", &unk_1E242FD78, CFSTR("kQPTokenBook"));
  objc_msgSend(v0, "setObject:forKey:", &unk_1E242FD60, CFSTR("kQPTokenDate"));
  objc_msgSend(v0, "setObject:forKey:", &unk_1E242FD90, CFSTR("kQPTokenDocument"));
  objc_msgSend(v0, "setObject:forKey:", &unk_1E242FD00, CFSTR("kQPTokenEvent"));
  objc_msgSend(v0, "setObject:forKey:", &unk_1E242FD18, CFSTR("kQPTokenFolder"));
  objc_msgSend(v0, "setObject:forKey:", &unk_1E242FD30, CFSTR("kQPTokenIgnoreStatus"));
  objc_msgSend(v0, "setObject:forKey:", &unk_1E242FE68, CFSTR("kQPTokenImage"));
  objc_msgSend(v0, "setObject:forKey:", &unk_1E242FE80, CFSTR("kQPTokenMail"));
  objc_msgSend(v0, "setObject:forKey:", &unk_1E242FE98, CFSTR("kQPTokenMailbox"));
  objc_msgSend(v0, "setObject:forKey:", &unk_1E242FDF0, CFSTR("kQPTokenMap"));
  objc_msgSend(v0, "setObject:forKey:", &unk_1E242FEB0, CFSTR("kQPTokenMe"));
  objc_msgSend(v0, "setObject:forKey:", &unk_1E242FEC8, CFSTR("kQPTokenMessage"));
  objc_msgSend(v0, "setObject:forKey:", &unk_1E242FEE0, CFSTR("kQPTokenNote"));
  objc_msgSend(v0, "setObject:forKey:", &unk_1E242FDA8, CFSTR("kQPTokenPhoto"));
  objc_msgSend(v0, "setObject:forKey:", &unk_1E242FEF8, CFSTR("kQPTokenPresentation"));
  objc_msgSend(v0, "setObject:forKey:", &unk_1E242FF10, CFSTR("kQPTokenReadAction"));
  objc_msgSend(v0, "setObject:forKey:", &unk_1E242FF28, CFSTR("kQPTokenRepliedAction"));
  objc_msgSend(v0, "setObject:forKey:", &unk_1E242FF40, CFSTR("kQPTokenReminder"));
  objc_msgSend(v0, "setObject:forKey:", &unk_1E242FF58, CFSTR("kQPTokenSource"));
  objc_msgSend(v0, "setObject:forKey:", &unk_1E242FF70, CFSTR("kQPTokenSpreadsheet"));
  objc_msgSend(v0, "setObject:forKey:", &unk_1E242FF88, CFSTR("kQPTokenKeyword"));
  objc_msgSend(v0, "setObject:forKey:", &unk_1E242FFA0, CFSTR("kQPTokenFlagColorAction"));
  objc_msgSend(v0, "setObject:forKey:", &unk_1E242FFB8, CFSTR("kQPTokenFlaggedAction"));
  objc_msgSend(v0, "setObject:forKey:", &unk_1E242FFD0, CFSTR("kQPTokenSubject"));
  objc_msgSend(v0, "setObject:forKey:", &unk_1E242FFD0, CFSTR("kQPTokenTitle"));
  objc_msgSend(v0, "setObject:forKey:", &unk_1E242FFE8, CFSTR("kQPTokenSubjectAction"));
  objc_msgSend(v0, "setObject:forKey:", &unk_1E2430000, CFSTR("kQPTokenVideo"));
  objc_msgSend(v0, "setObject:forKey:", &unk_1E2430018, CFSTR("kQPTokenWebsite"));
  objc_msgSend(v0, "setObject:forKey:", &unk_1E2430030, CFSTR("kQPTokenFieldAttribute"));
  v1 = (void *)initWithUserString_suggestionTokenResult__gSuggestionTypes;
  initWithUserString_suggestionTokenResult__gSuggestionTypes = (uint64_t)v0;
  v4 = v0;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v2, "setObject:forKey:", &unk_1E2430048, CFSTR("0"));
  objc_msgSend(v2, "setObject:forKey:", &unk_1E2430060, CFSTR("1"));
  objc_msgSend(v2, "setObject:forKey:", &unk_1E2430078, CFSTR("2"));
  objc_msgSend(v2, "setObject:forKey:", &unk_1E2430090, CFSTR("3"));
  objc_msgSend(v2, "setObject:forKey:", &unk_1E24300A8, CFSTR("4"));
  objc_msgSend(v2, "setObject:forKey:", &unk_1E24300C0, CFSTR("5"));
  objc_msgSend(v2, "setObject:forKey:", &unk_1E24300D8, CFSTR("6"));
  v3 = (void *)initWithUserString_suggestionTokenResult__gSuggestionFlagColorTypes;
  initWithUserString_suggestionTokenResult__gSuggestionFlagColorTypes = (uint64_t)v2;

}

@end
