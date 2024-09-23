@implementation ECMessageBodyParsingUtils

+ (id)snippetFromHTMLBody:(id)a3 options:(unint64_t)a4 maxLength:(unint64_t)a5 preservingQuotedForwardedContent:(BOOL)a6
{
  id v9;
  ECMessageBodyHTMLParser *v10;
  ECMessageBodyOriginalTextSubparser *v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  __CFString *v16;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  BOOL v22;

  v9 = a3;
  v10 = -[ECMessageBodyHTMLParser initWithHTML:]([ECMessageBodyHTMLParser alloc], "initWithHTML:", v9);
  v11 = objc_alloc_init(ECMessageBodyOriginalTextSubparser);
  -[ECMessageBodyParser addSubparser:](v10, "addSubparser:", v11);
  v12 = -[ECMessageBodyParser newStringAccumulatorWithOptions:lengthLimit:](v10, "newStringAccumulatorWithOptions:lengthLimit:", a4, a5);
  v13 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __100__ECMessageBodyParsingUtils_snippetFromHTMLBody_options_maxLength_preservingQuotedForwardedContent___block_invoke;
  v20[3] = &unk_1E71213D8;
  v22 = a6;
  v14 = v12;
  v21 = v14;
  -[ECMessageBodyOriginalTextSubparser setFoundTextBlock:](v11, "setFoundTextBlock:", v20);
  v18[0] = v13;
  v18[1] = 3221225472;
  v18[2] = __100__ECMessageBodyParsingUtils_snippetFromHTMLBody_options_maxLength_preservingQuotedForwardedContent___block_invoke_2;
  v18[3] = &unk_1E7121400;
  v15 = v14;
  v19 = v15;
  -[ECMessageBodyOriginalTextSubparser setFoundWhitespaceBlock:](v11, "setFoundWhitespaceBlock:", v18);
  if (-[ECMessageBodyHTMLParser parse](v10, "parse"))
  {
    objc_msgSend(v15, "accumulatedString");
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = &stru_1E7123500;
  }

  return v16;
}

void __100__ECMessageBodyParsingUtils_snippetFromHTMLBody_options_maxLength_preservingQuotedForwardedContent___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  id v8;

  v7 = a2;
  v8 = v7;
  if (!a3 || a3 == 2 && *(_BYTE *)(a1 + 40))
  {
    if (!objc_msgSend(v7, "valueForAttributes:", 64))
      objc_msgSend(*(id *)(a1 + 32), "appendInnerTextWithConsumableNode:", v8);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "appendCustomEntityWithTag:stringRepresentation:", 0, CFSTR(" "));
  }
  *a4 = objc_msgSend(*(id *)(a1 + 32), "isFull");

}

uint64_t __100__ECMessageBodyParsingUtils_snippetFromHTMLBody_options_maxLength_preservingQuotedForwardedContent___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendInnerTextWithConsumableNode:", a2);
}

@end
