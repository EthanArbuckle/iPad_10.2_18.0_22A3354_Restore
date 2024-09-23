@implementation NSMutableAttributedString(TextEffects)

- (void)ck_toggleTextEffectType:()TextEffects range:getAdded:
{
  id v10;

  IMTextEffectNameFromType();
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ck_toggleTextEffectNamed:range:getAdded:", v10, a4, a5, a6);

}

- (void)ck_toggleTextEffectNamed:()TextEffects range:getAdded:
{
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  _QWORD v15[8];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v10 = a3;
  v11 = IMTextEffectTypeFromName();
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v12 = *MEMORY[0x1E0D393F0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __82__NSMutableAttributedString_TextEffects__ck_toggleTextEffectNamed_range_getAdded___block_invoke;
  v15[3] = &unk_1E274EEF8;
  v15[4] = &v16;
  v15[5] = v11;
  v15[6] = a4;
  v15[7] = a5;
  objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", v12, a4, a5, 0, v15);
  v13 = v17;
  if (a6)
    *a6 = *((_BYTE *)v17 + 24);
  if (*((_BYTE *)v13 + 24))
    v14 = v11;
  else
    v14 = 0;
  objc_msgSend(a1, "ck_applyTextEffectType:range:", v14, a4, a5);
  _Block_object_dispose(&v16, 8);

}

- (uint64_t)ck_canApplyTextEffectInRange:()TextEffects
{
  uint64_t result;

  result = objc_msgSend(a1, "length");
  if (result)
    return a3 < objc_msgSend(a1, "length") && a3 + a4 <= objc_msgSend(a1, "length");
  return result;
}

- (uint64_t)ck_removeAnimatedTextEffectsFromRange:()TextEffects
{
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[5];
  _QWORD v12[5];

  result = objc_msgSend(a1, "ck_canApplyTextEffectInRange:");
  if ((_DWORD)result)
  {
    v8 = MEMORY[0x1E0C809B0];
    v9 = *MEMORY[0x1E0D393F0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __80__NSMutableAttributedString_TextEffects__ck_removeAnimatedTextEffectsFromRange___block_invoke;
    v12[3] = &unk_1E274EF20;
    v12[4] = a1;
    objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", v9, a3, a4, 0, v12);
    v10 = *MEMORY[0x1E0DC11D0];
    v11[0] = v8;
    v11[1] = 3221225472;
    v11[2] = __80__NSMutableAttributedString_TextEffects__ck_removeAnimatedTextEffectsFromRange___block_invoke_2;
    v11[3] = &unk_1E274EF20;
    v11[4] = a1;
    return objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", v10, a3, a4, 0, v11);
  }
  return result;
}

- (id)_ck_intersectingTextAnimationOnRange:()TextEffects getExistingAnimationRange:
{
  uint64_t v9;
  id v10;
  _QWORD v12[8];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  void *v22;
  __int128 v23;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3010000000;
  v22 = &unk_18E8EEE6F;
  v23 = xmmword_18E7C9230;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__22;
  v17 = __Block_byref_object_dispose__22;
  v18 = 0;
  v9 = objc_msgSend(a1, "length");
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __105__NSMutableAttributedString_TextEffects___ck_intersectingTextAnimationOnRange_getExistingAnimationRange___block_invoke;
  v12[3] = &unk_1E274EF48;
  v12[6] = a3;
  v12[7] = a4;
  v12[4] = &v19;
  v12[5] = &v13;
  objc_msgSend(a1, "ck_enumerateTextAnimationsIn:options:using:", 0, v9, 0, v12);
  if (a5)
    *a5 = *((_OWORD *)v20 + 2);
  v10 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v10;
}

- (void)ck_applyTextEffectType:()TextEffects range:
{
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  id obj;
  uint64_t v39;
  uint64_t v40;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD v47[4];
  id v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  unint64_t v53;
  _QWORD v54[5];
  __int128 v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a1, "ck_canApplyTextEffectInRange:", a4, a5))
  {
    v55 = xmmword_18E7C9230;
    objc_msgSend(a1, "_ck_intersectingTextAnimationOnRange:getExistingAnimationRange:", 0, objc_msgSend(a1, "length"), &v55);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = *MEMORY[0x1E0D393F0];
    objc_msgSend(a1, "removeAttribute:range:");
    v40 = *MEMORY[0x1E0DC11D0];
    objc_msgSend(a1, "removeAttribute:range:");
    objc_msgSend(a1, "ck_removeTextStyles:options:range:", *MEMORY[0x1E0D39430], 3, a4, a5);
    if (a3)
    {
      v8 = MEMORY[0x1E0C809B0];
      v9 = *MEMORY[0x1E0D381F0];
      v54[0] = MEMORY[0x1E0C809B0];
      v54[1] = 3221225472;
      v54[2] = __71__NSMutableAttributedString_TextEffects__ck_applyTextEffectType_range___block_invoke;
      v54[3] = &unk_1E274EF20;
      v54[4] = a1;
      objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", v9, a4, a5, 0, v54);
      v34 = 0;
      v36 = 0x7FFFFFFFFFFFFFFFLL;
      if ((_QWORD)v55 != 0x7FFFFFFFFFFFFFFFLL && a4 > (unint64_t)v55)
      {
        v10 = a4 + a5;
        v11 = *((_QWORD *)&v55 + 1) + v55;
        v12 = 0x7FFFFFFFFFFFFFFFLL;
        if (a4 + a5 < *((_QWORD *)&v55 + 1) + (_QWORD)v55)
          v12 = a4 + a5;
        v13 = v11 >= v10;
        v14 = v11 - v10;
        if (!v13)
          v14 = 0;
        v34 = v14;
        v36 = v12;
      }
      IMTextEffectNameFromType();
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = 0;
      v51 = &v50;
      v52 = 0x2020000000;
      v53 = a4;
      v16 = *MEMORY[0x1E0DC10F8];
      v47[0] = v8;
      v47[1] = 3221225472;
      v47[2] = __71__NSMutableAttributedString_TextEffects__ck_applyTextEffectType_range___block_invoke_2;
      v47[3] = &unk_1E274EF70;
      v49 = &v50;
      v17 = v15;
      v48 = v17;
      objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", v16, a4, a5, 0, v47);
      if (a4 + a5 > v51[3])
      {
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addObject:", v18);

      }
      if (!objc_msgSend(v17, "count", v34))
      {
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", a4, a5);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addObject:", v19);

      }
      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      obj = v17;
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v56, 16);
      if (v20)
      {
        v21 = *(_QWORD *)v44;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v44 != v21)
              objc_enumerationMutation(obj);
            v23 = objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * i), "rangeValue");
            v25 = v24;
            objc_msgSend(MEMORY[0x1E0CEAF28], "animationWithName:", v42);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            if (v26)
            {
              objc_msgSend(a1, "addAttribute:value:range:", v40, v26, v23, v25);
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(a1, "addAttribute:value:range:", v39, v27, v23, v25);

            }
          }
          v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v56, 16);
        }
        while (v20);
      }

      if (v36 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v28 = (void *)MEMORY[0x1E0CEAF28];
        objc_msgSend(v37, "name");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "animationWithName:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (v30)
        {
          objc_msgSend(a1, "removeAttribute:range:", v39, v36, v35);
          objc_msgSend(a1, "removeAttribute:range:", v40, v36, v35);
          objc_msgSend(a1, "addAttribute:value:range:", v40, v30, v36, v35);
          objc_msgSend(v37, "name");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = IMTextEffectTypeFromName();

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "addAttribute:value:range:", v39, v33, v36, v35);

        }
      }

      _Block_object_dispose(&v50, 8);
    }

  }
}

- (uint64_t)ck_applyTextStyle:()TextEffects range:
{
  return objc_msgSend(a1, "ck_applyTextStyle:options:range:", a3, 1, a4, a5);
}

- (uint64_t)ck_applyTextStyle:()TextEffects options:range:
{
  uint64_t result;

  result = objc_msgSend(a1, "ck_actionForIMTextStyle:range:", a3, a5, a6);
  if (result == 1)
    return objc_msgSend(a1, "ck_removeTextStyle:options:range:", a3, a4, a5, a6);
  if (!result)
    return objc_msgSend(a1, "ck_addTextStyle:options:range:", a3, a4, a5, a6);
  return result;
}

- (void)ck_addTextStyle:()TextEffects options:range:
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  id v18;
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD v21[7];
  _QWORD v22[7];

  v11 = MEMORY[0x1E0C809B0];
  if ((a4 & 1) != 0)
  {
    v12 = *MEMORY[0x1E0D393F0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __72__NSMutableAttributedString_TextEffects__ck_addTextStyle_options_range___block_invoke;
    v22[3] = &unk_1E274EF98;
    v22[5] = a5;
    v22[6] = a6;
    v22[4] = a1;
    objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", v12, 0, objc_msgSend(a1, "length"), 0, v22);
  }
  if ((a4 & 2) != 0)
  {
    v13 = *MEMORY[0x1E0DC11D0];
    v21[0] = v11;
    v21[1] = 3221225472;
    v21[2] = __72__NSMutableAttributedString_TextEffects__ck_addTextStyle_options_range___block_invoke_2;
    v21[3] = &unk_1E274EF98;
    v21[5] = a5;
    v21[6] = a6;
    v21[4] = a1;
    objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", v13, 0, objc_msgSend(a1, "length"), 0, v21);
  }
  switch(a3)
  {
    case 1:
      if ((a4 & 1) != 0)
        objc_msgSend(a1, "addAttribute:value:range:", *MEMORY[0x1E0D393E8], &unk_1E28704E0, a5, a6);
      if ((a4 & 2) != 0)
      {
        v14 = (void *)objc_msgSend(a1, "copy");
        v18 = v14;
        v15 = *MEMORY[0x1E0DC1138];
        v20[0] = v11;
        v20[1] = 3221225472;
        v20[2] = __72__NSMutableAttributedString_TextEffects__ck_addTextStyle_options_range___block_invoke_78;
        v20[3] = &unk_1E274EFC0;
        v20[4] = a1;
        v16 = v20;
        goto LABEL_14;
      }
      break;
    case 2:
      if ((a4 & 1) != 0)
        objc_msgSend(a1, "addAttribute:value:range:", *MEMORY[0x1E0D39420], &unk_1E28704E0, a5, a6);
      if ((a4 & 2) != 0)
      {
        v14 = (void *)objc_msgSend(a1, "copy");
        v18 = v14;
        v15 = *MEMORY[0x1E0DC1138];
        v19[0] = v11;
        v19[1] = 3221225472;
        v19[2] = __72__NSMutableAttributedString_TextEffects__ck_addTextStyle_options_range___block_invoke_2_81;
        v19[3] = &unk_1E274EFC0;
        v19[4] = a1;
        v16 = v19;
LABEL_14:
        objc_msgSend(v14, "enumerateAttribute:inRange:options:usingBlock:", v15, a5, a6, 0, v16);

      }
      break;
    case 4:
      if ((a4 & 1) != 0)
        objc_msgSend(a1, "addAttribute:value:range:", *MEMORY[0x1E0D39440], &unk_1E28704E0, a5, a6);
      if ((a4 & 2) != 0)
      {
        v17 = (_QWORD *)MEMORY[0x1E0DC1248];
        goto LABEL_24;
      }
      break;
    case 8:
      if ((a4 & 1) != 0)
        objc_msgSend(a1, "addAttribute:value:range:", *MEMORY[0x1E0D39428], &unk_1E28704E0, a5, a6);
      if ((a4 & 2) != 0)
      {
        v17 = (_QWORD *)MEMORY[0x1E0DC11A8];
LABEL_24:
        objc_msgSend(a1, "addAttribute:value:range:", *v17, &unk_1E28704F8, a5, a6);
      }
      break;
    default:
      return;
  }
}

- (void)ck_convertAttributesUsingConversionHandler:()TextEffects range:
{
  void (**v8)(id, id);
  void *v9;
  id v10;

  v8 = a3;
  objc_msgSend(a1, "attributesAtIndex:effectiveRange:", a4, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v8[2](v8, v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "setAttributes:range:", v9, a4, a5);
}

@end
