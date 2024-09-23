@implementation BRLTTranslator

- (BRLTTranslator)initWithDelegate:(id)a3 tableIdentifier:(id)a4
{
  id v7;
  id v8;
  BRLTTranslator *v9;
  BRLTTranslator *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BRLTTranslator;
  v9 = -[BRLTTranslator init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_translationDelegate, a3);
    objc_storeStrong((id *)&v10->_tableIdentifier, a4);
  }

  return v10;
}

- (id)_translate:(id)a3 isTechnical:(BOOL)a4 textFormattingRanges:(id)a5
{
  uint64_t v6;
  BRLTBrailleTranslationDelegateProtocol *translationDelegate;
  uint64_t v8;
  id v9;
  __CFString *v10;
  void *v11;
  void *v12;
  id v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  v6 = 4;
  if (!a4)
    v6 = 1;
  translationDelegate = self->_translationDelegate;
  v14 = 0;
  -[BRLTBrailleTranslationDelegateProtocol printBrailleForText:language:mode:textPositionsRange:locations:textFormattingRanges:](translationDelegate, "printBrailleForText:language:mode:textPositionsRange:locations:textFormattingRanges:", a3, 0, v6, 0x7FFFFFFFFFFFFFFFLL, 0, &v14, a5);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v14;
  if (v8)
    v10 = (__CFString *)v8;
  else
    v10 = &stru_24CBF1330;
  v15[0] = CFSTR("braille");
  v15[1] = CFSTR("locations");
  v16[0] = v10;
  -[BRLTTranslator arrayFromData:](self, "arrayFromData:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_backTranslate:(id)a3
{
  BRLTBrailleTranslationDelegateProtocol *translationDelegate;
  uint64_t v5;
  id v6;
  __CFString *v7;
  void *v8;
  void *v9;
  id v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  translationDelegate = self->_translationDelegate;
  v11 = 0;
  -[BRLTBrailleTranslationDelegateProtocol textForPrintBraille:language:mode:locations:](translationDelegate, "textForPrintBraille:language:mode:locations:", a3, 0, 1, &v11);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v11;
  if (v5)
    v7 = (__CFString *)v5;
  else
    v7 = &stru_24CBF1330;
  v12[0] = CFSTR("text");
  v12[1] = CFSTR("locations");
  v13[0] = v7;
  -[BRLTTranslator arrayFromData:](self, "arrayFromData:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)arrayFromData:(id)a3
{
  id v3;
  unint64_t v4;
  id v5;
  uint64_t *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v3 = a3;
  v4 = objc_msgSend(v3, "length");
  v5 = objc_retainAutorelease(v3);
  v6 = (uint64_t *)objc_msgSend(v5, "bytes");
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v4 >> 3);
  if (v4 >= 8)
  {
    if (v4 >> 3 <= 1)
      v8 = 1;
    else
      v8 = v4 >> 3;
    do
    {
      v9 = *v6++;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v10);

      --v8;
    }
    while (v8);
  }

  return v7;
}

- (BOOL)isEqualTable:(id)a3
{
  return -[NSString isEqual:](self->_tableIdentifier, "isEqual:", *((_QWORD *)a3 + 2));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableIdentifier, 0);
  objc_storeStrong((id *)&self->_translationDelegate, 0);
}

@end
