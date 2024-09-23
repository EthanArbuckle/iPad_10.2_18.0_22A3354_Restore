@implementation AXMSemanticText

- (AXMSemanticText)initWithText:(id)a3 locale:(id)a4
{
  id v6;
  id v7;
  AXMSemanticText *v8;
  uint64_t v9;
  NSMutableAttributedString *text;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AXMSemanticText;
  v8 = -[AXMSemanticText init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v6);
    text = v8->_text;
    v8->_text = (NSMutableAttributedString *)v9;

    objc_storeStrong((id *)&v8->_locale, a4);
  }

  return v8;
}

- (int64_t)tokenizedLength
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  int64_t v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, uint64_t);
  void *v13;
  AXMSemanticText *v14;
  id v15;

  if (!-[NSMutableAttributedString length](self->_text, "length"))
    return 0;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CCE180]), "initWithUnit:", 0);
  -[NSMutableAttributedString string](self->_text, "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setString:", v4);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[NSMutableAttributedString length](self->_text, "length");
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __34__AXMSemanticText_tokenizedLength__block_invoke;
  v13 = &unk_1E625E5F8;
  v14 = self;
  v15 = v5;
  v7 = v5;
  objc_msgSend(v3, "enumerateTokensInRange:usingBlock:", 0, v6, &v10);
  v8 = objc_msgSend(v7, "count", v10, v11, v12, v13, v14);
  self->_tokenizedLength = v8;

  return v8;
}

void __34__AXMSemanticText_tokenizedLength__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  id v7;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "substringWithRange:", a2, a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
}

- (NSString)preprocessedText
{
  return (NSString *)-[NSMutableAttributedString string](self->_text, "string");
}

- (void)enumerateNLPTokens:(id)a3
{
  id v4;
  NSMutableAttributedString *text;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  text = self->_text;
  v6 = -[AXMSemanticText textRange](self, "textRange");
  v8 = v7;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __38__AXMSemanticText_enumerateNLPTokens___block_invoke;
  v10[3] = &unk_1E625E620;
  v11 = v4;
  v9 = v4;
  -[NSMutableAttributedString enumerateAttribute:inRange:options:usingBlock:](text, "enumerateAttribute:inRange:options:usingBlock:", CFSTR("NLPToken"), v6, v8, 0, v10);

}

uint64_t __38__AXMSemanticText_enumerateNLPTokens___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

- (void)enumerateLexiconMarkers:(id)a3
{
  id v4;
  NSMutableAttributedString *text;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  text = self->_text;
  v6 = -[AXMSemanticText textRange](self, "textRange");
  v8 = v7;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __43__AXMSemanticText_enumerateLexiconMarkers___block_invoke;
  v10[3] = &unk_1E625E620;
  v11 = v4;
  v9 = v4;
  -[NSMutableAttributedString enumerateAttribute:inRange:options:usingBlock:](text, "enumerateAttribute:inRange:options:usingBlock:", CFSTR("IsInLexicon"), v6, v8, 0, v10);

}

uint64_t __43__AXMSemanticText_enumerateLexiconMarkers___block_invoke(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  if (a2)
    return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(result + 32) + 16))(*(_QWORD *)(result + 32), objc_msgSend(a2, "BOOLValue"), a3, a4);
  return result;
}

- (void)enumerateNumericTokens:(id)a3
{
  id v4;
  NSMutableAttributedString *text;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  text = self->_text;
  v6 = -[AXMSemanticText textRange](self, "textRange");
  v8 = v7;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __42__AXMSemanticText_enumerateNumericTokens___block_invoke;
  v10[3] = &unk_1E625E620;
  v11 = v4;
  v9 = v4;
  -[NSMutableAttributedString enumerateAttribute:inRange:options:usingBlock:](text, "enumerateAttribute:inRange:options:usingBlock:", CFSTR("NumericToken"), v6, v8, 0, v10);

}

uint64_t __42__AXMSemanticText_enumerateNumericTokens___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

- (void)enumerateDataDetectors:(id)a3
{
  id v4;
  NSMutableAttributedString *text;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  text = self->_text;
  v6 = -[AXMSemanticText textRange](self, "textRange");
  v8 = v7;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __42__AXMSemanticText_enumerateDataDetectors___block_invoke;
  v10[3] = &unk_1E625E620;
  v11 = v4;
  v9 = v4;
  -[NSMutableAttributedString enumerateAttribute:inRange:options:usingBlock:](text, "enumerateAttribute:inRange:options:usingBlock:", CFSTR("DataDetector"), v6, v8, 0, v10);

}

uint64_t __42__AXMSemanticText_enumerateDataDetectors___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

- (void)enumerateCustomPatterns:(id)a3
{
  id v4;
  NSMutableAttributedString *text;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  text = self->_text;
  v6 = -[AXMSemanticText textRange](self, "textRange");
  v8 = v7;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __43__AXMSemanticText_enumerateCustomPatterns___block_invoke;
  v10[3] = &unk_1E625E620;
  v11 = v4;
  v9 = v4;
  -[NSMutableAttributedString enumerateAttribute:inRange:options:usingBlock:](text, "enumerateAttribute:inRange:options:usingBlock:", CFSTR("CustomPattern"), v6, v8, 0, v10);

}

uint64_t __43__AXMSemanticText_enumerateCustomPatterns___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

- (void)enumerateSemanticErrors:(id)a3
{
  id v4;
  NSMutableAttributedString *text;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  text = self->_text;
  v6 = -[AXMSemanticText textRange](self, "textRange");
  v8 = v7;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __43__AXMSemanticText_enumerateSemanticErrors___block_invoke;
  v10[3] = &unk_1E625E620;
  v11 = v4;
  v9 = v4;
  -[NSMutableAttributedString enumerateAttribute:inRange:options:usingBlock:](text, "enumerateAttribute:inRange:options:usingBlock:", CFSTR("SemanticError"), v6, v8, 0, v10);

}

uint64_t __43__AXMSemanticText_enumerateSemanticErrors___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "BOOLValue");
  if ((_DWORD)result)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return result;
}

- (BOOL)isSemanticallyComplete
{
  NSMutableAttributedString *text;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  if (!-[NSMutableAttributedString length](self->_text, "length"))
    return 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  text = self->_text;
  v4 = -[AXMSemanticText textRange](self, "textRange");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __41__AXMSemanticText_isSemanticallyComplete__block_invoke;
  v8[3] = &unk_1E625E648;
  v8[4] = &v9;
  -[NSMutableAttributedString enumerateAttribute:inRange:options:usingBlock:](text, "enumerateAttribute:inRange:options:usingBlock:", CFSTR("SemanticError"), v4, v5, 0, v8);
  v6 = *((_BYTE *)v10 + 24) == 0;
  _Block_object_dispose(&v9, 8);
  return v6;
}

uint64_t __41__AXMSemanticText_isSemanticallyComplete__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t result;

  result = objc_msgSend(a2, "BOOLValue");
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a5 = 1;
  }
  return result;
}

- (_NSRange)textRange
{
  void *v2;
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  _NSRange result;

  -[NSMutableAttributedString string](self->_text, "string");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");

  v4 = 0;
  v5 = v3;
  result.length = v5;
  result.location = v4;
  return result;
}

- (id)substringWithRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v5;
  void *v6;

  length = a3.length;
  location = a3.location;
  -[NSMutableAttributedString string](self->_text, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "substringWithRange:", location, length);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)addNLPToken:(id)a3 withRange:(_NSRange)a4
{
  -[NSMutableAttributedString addAttribute:value:range:](self->_text, "addAttribute:value:range:", CFSTR("NLPToken"), a3, a4.location, a4.length);
}

- (void)addDataDetector:(id)a3 withRange:(_NSRange)a4
{
  -[NSMutableAttributedString addAttribute:value:range:](self->_text, "addAttribute:value:range:", CFSTR("DataDetector"), a3, a4.location, a4.length);
}

- (void)addCustomPattern:(id)a3 withRange:(_NSRange)a4
{
  -[NSMutableAttributedString addAttribute:value:range:](self->_text, "addAttribute:value:range:", CFSTR("CustomPattern"), a3, a4.location, a4.length);
}

- (void)addIsInLexionMarker:(BOOL)a3 withRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  NSMutableAttributedString *text;
  id v7;

  length = a4.length;
  location = a4.location;
  text = self->_text;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableAttributedString addAttribute:value:range:](text, "addAttribute:value:range:", CFSTR("IsInLexicon"), v7, location, length);

}

- (void)addSemanticErrorWithRange:(_NSRange)a3
{
  -[NSMutableAttributedString addAttribute:value:range:](self->_text, "addAttribute:value:range:", CFSTR("SemanticError"), MEMORY[0x1E0C9AAB0], a3.location, a3.length);
}

- (void)addNumericToken:(id)a3 withRange:(_NSRange)a4
{
  -[NSMutableAttributedString addAttribute:value:range:](self->_text, "addAttribute:value:range:", CFSTR("NumericToken"), a3, a4.location, a4.length);
}

- (id)makeCursor
{
  return -[_AXMSemanticTextCursor initWithText:semanticText:]([_AXMSemanticTextCursor alloc], "initWithText:semanticText:", self->_text, self);
}

- (NSString)transformedSpeechText
{
  return self->_transformedSpeechText;
}

- (void)setTransformedSpeechText:(id)a3
{
  objc_storeStrong((id *)&self->_transformedSpeechText, a3);
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
  objc_storeStrong((id *)&self->_locale, a3);
}

- (void)setTokenizedLength:(int64_t)a3
{
  self->_tokenizedLength = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_transformedSpeechText, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
