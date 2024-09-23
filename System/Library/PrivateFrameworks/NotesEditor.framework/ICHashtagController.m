@implementation ICHashtagController

void __101__ICHashtagController_App__createNewHashtagIfNecessary_textStorage_ignoreDelimiter_parentAttachment___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  id v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t i;
  unint64_t v21;
  unint64_t v22;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v11 = a2;
  objc_msgSend(v11, "stringByApplyingTransform:reverse:", *MEMORY[0x1E0C99870], 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "ic_hashtagCharacterString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "isEqualToString:", v13);

  if (v14)
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v15 = *(id *)(a1 + 32);
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v30;
      v19 = a3 + a4;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v30 != v18)
            objc_enumerationMutation(v15);
          v21 = objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "range", (_QWORD)v29);
          if (v19 >= v21 && v19 - v21 < v22)
          {

            goto LABEL_21;
          }
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v17);
    }

    objc_msgSend(*(id *)(a1 + 40), "setEditedRange:", a3, objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "length") + 1);
    if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "length")
      && (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "ic_isNumeric") & 1) == 0)
    {
      if (*(_BYTE *)(a1 + 80))
        v24 = 0;
      else
        v24 = *(_QWORD *)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 40), "insertHashtagWithText:viaAutoComplete:delimiter:parentAttachment:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), 0, v24, *(_QWORD *)(a1 + 56), (_QWORD)v29);
    }
LABEL_21:
    objc_msgSend(*(id *)(a1 + 40), "clearUnconfirmedHashtagInTextStorage:", *(_QWORD *)(a1 + 64), (_QWORD)v29);
    goto LABEL_22;
  }
  if ((objc_msgSend(*(id *)(a1 + 40), "isValidElement:", objc_msgSend(v11, "characterAtIndex:", 0)) & 1) == 0
    && !objc_msgSend(*(id *)(a1 + 40), "isEmoji:", v11))
  {
LABEL_22:
    *a7 = 1;
    goto LABEL_23;
  }
  objc_msgSend(v11, "stringByAppendingString:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "mutableCopy");
  v27 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v28 = *(void **)(v27 + 40);
  *(_QWORD *)(v27 + 40) = v26;

LABEL_23:
}

uint64_t __36__ICHashtagController_App__isEmoji___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  uint64_t result;

  result = CEMStringIsSingleEmoji();
  if (!(_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a7 = 1;
  }
  return result;
}

uint64_t __67__ICHashtagController_App__rangeOfUnconfirmedHashtagInTextStorage___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t v5;

  if (a2)
  {
    v5 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
    *(_QWORD *)(v5 + 32) = a3;
    *(_QWORD *)(v5 + 40) = a4;
    *a5 = 1;
  }
  return result;
}

@end
