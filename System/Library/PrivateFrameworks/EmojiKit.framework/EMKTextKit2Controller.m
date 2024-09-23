@implementation EMKTextKit2Controller

void __29___EMKTextKit2Controller_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.emojikit", "TK2Controller");
  v1 = (void *)log_logger;
  log_logger = (uint64_t)v0;

}

uint64_t __55___EMKTextKit2Controller__updateEmojiAttributesOfText___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", CFSTR("EMKEmojiTokenList"), a4, a2, a3);
  return objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", CFSTR("EMKEmojiConversionLanguage"), *(_QWORD *)(a1 + 40), a2, a3);
}

uint64_t __42___EMKTextKit2Controller___startAnimation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startRippleAnimation");
}

uint64_t __52___EMKTextKit2Controller_touchHasEmojiSignificance___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, BOOL *a5)
{
  void *v7;
  uint64_t result;
  _QWORD v9[4];
  __int128 v10;
  uint64_t v11;
  __int128 v12;

  v7 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __52___EMKTextKit2Controller_touchHasEmojiSignificance___block_invoke_2;
  v9[3] = &unk_1EA258B80;
  v12 = *(_OWORD *)(a1 + 64);
  v10 = *(_OWORD *)(a1 + 40);
  v11 = *(_QWORD *)(a1 + 56);
  result = objc_msgSend(v7, "enumerateTextSegmentsInRange:type:options:usingBlock:", a3, 0, 0, v9);
  *a5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) != 0;
  return result;
}

BOOL __52___EMKTextKit2Controller_touchHasEmojiSignificance___block_invoke_2(uint64_t a1, void *a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  id v12;
  NSObject *v13;
  void *v14;
  _BOOL4 v15;
  double *v16;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;
  CGRect v23;
  CGRect v24;

  v22 = *MEMORY[0x1E0C80C00];
  v12 = a2;
  objc_msgSend((id)objc_opt_class(), "log");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v23.origin.x = a3;
    v23.origin.y = a4;
    v23.size.width = a5;
    v23.size.height = a6;
    NSStringFromCGRect(v23);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138412546;
    v19 = v14;
    v20 = 2112;
    v21 = v12;
    _os_log_impl(&dword_1DB196000, v13, OS_LOG_TYPE_DEFAULT, "touchHasEmojiSignificance: textSegmentFrame %@ touchedWordRange: %@", (uint8_t *)&v18, 0x16u);

  }
  v24.origin.x = a3;
  v24.origin.y = a4;
  v24.size.width = a5;
  v24.size.height = a6;
  v15 = CGRectContainsPoint(v24, *(CGPoint *)(a1 + 56));
  if (v15)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    v16 = *(double **)(*(_QWORD *)(a1 + 48) + 8);
    v16[4] = a3;
    v16[5] = a4;
    v16[6] = a5;
    v16[7] = a6;
  }

  return !v15;
}

uint64_t __52___EMKTextKit2Controller_touchHasEmojiSignificance___block_invoke_49(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "rangeInElement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v25 = v3;
    v26 = 2112;
    v27 = v4;
    _os_log_impl(&dword_1DB196000, v5, OS_LOG_TYPE_DEFAULT, "layoutFragment: %@ - rangeInElement: %@", buf, 0x16u);
  }

  objc_msgSend(v3, "textElement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v6;
      objc_msgSend((id)objc_opt_class(), "log");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v7, "elementRange");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "paragraphContentRange");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "paragraphSeparatorRange");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v25 = v9;
        v26 = 2112;
        v27 = v10;
        v28 = 2112;
        v29 = v11;
        _os_log_impl(&dword_1DB196000, v8, OS_LOG_TYPE_DEFAULT, "paragraph range: %@ - paragraphContentRange: %@ - paragraphSeparatorRange: %@", buf, 0x20u);

      }
      objc_msgSend(v7, "attributedString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "length");
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __52___EMKTextKit2Controller_touchHasEmojiSignificance___block_invoke_51;
      v17[3] = &unk_1EA258BD0;
      v18 = *(id *)(a1 + 40);
      v19 = *(id *)(a1 + 48);
      v14 = v4;
      v22 = *(_OWORD *)(a1 + 56);
      v23 = *(_QWORD *)(a1 + 72);
      v15 = *(_QWORD *)(a1 + 32);
      v20 = v14;
      v21 = v15;
      objc_msgSend(v12, "enumerateAttribute:inRange:options:usingBlock:", CFSTR("EMKEmojiTokenList"), 0, v13, 0, v17);

    }
  }

  return 1;
}

void __52___EMKTextKit2Controller_touchHasEmojiSignificance___block_invoke_51(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  id v9;
  char isKindOfClass;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _EMKTouchInfo *v22;
  void *v23;

  v9 = a2;
  if (v9)
  {
    v23 = v9;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v9 = v23;
    if ((isKindOfClass & 1) != 0)
    {
      v11 = v23;
      v12 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "location");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "location");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v12, "offsetFromLocation:toLocation:", v13, v14);

      v16 = v15 + a3;
      v17 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "location");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "locationFromLocation:withOffset:", v18, v16);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "locationFromLocation:withOffset:", v19, a4);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC1318]), "initWithLocation:endLocation:", v19, v20);
      if (objc_msgSend(v21, "intersectsWithTextRange:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40)))
      {
        *a5 = 1;
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
        v22 = objc_alloc_init(_EMKTouchInfo);
        -[_EMKTouchInfo setTokenList:](v22, "setTokenList:", v11);
        -[_EMKTouchInfo setFrame:](v22, "setFrame:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 48), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 56));
        -[_EMKTouchInfo setTokenListRange:](v22, "setTokenListRange:", v16, a4);
        objc_msgSend(*(id *)(a1 + 56), "setLastTouchInfo:", v22);

      }
      v9 = v23;
    }
  }

}

void __51___EMKTextKit2Controller_textTapGestureRecognized___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  unint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "setOverlayView:", 0);
  if (v7)
  {
    v4 = *(_QWORD *)(a1 + 72) + *(_QWORD *)(a1 + 64);
    if (v4 <= objc_msgSend(*(id *)(a1 + 32), "length"))
    {
      v5 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v5) = objc_msgSend(v5, "isEqualToString:", v6);

      if ((_DWORD)v5)
        objc_msgSend(*(id *)(a1 + 48), "replaceRange:withEmojiToken:language:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), v7, CFSTR("en"));
    }
  }
  objc_msgSend(WeakRetained, "setLastTouchInfo:", 0);

}

uint64_t __51___EMKTextKit2Controller_textViewDidLayoutSubviews__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateOverlayView");
}

@end
