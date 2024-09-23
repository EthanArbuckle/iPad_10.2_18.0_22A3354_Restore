@implementation BRLTJTranslatorWrapper

- (BRLTJTranslatorWrapper)initWithTranslationDelegate:(id)a3 outputMode:(unint64_t)a4 inputMode:(unint64_t)a5
{
  id v9;
  BRLTJTranslatorWrapper *v10;
  BRLTJTranslatorWrapper *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BRLTJTranslatorWrapper;
  v10 = -[BRLTJTranslatorWrapper init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_translationDelegate, a3);
    v11->_outputMode = a4;
    v11->_inputMode = a5;
  }

  return v11;
}

- (id)brailleForText:(id)a3
{
  BRLTBrailleTranslationDelegateProtocol *translationDelegate;
  unint64_t outputMode;
  uint64_t v6;
  id v7;
  __CFString *v8;
  void *v9;
  void *v10;
  id v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  translationDelegate = self->_translationDelegate;
  outputMode = self->_outputMode;
  v12 = 0;
  -[BRLTBrailleTranslationDelegateProtocol printBrailleForText:language:mode:textPositionsRange:locations:textFormattingRanges:](translationDelegate, "printBrailleForText:language:mode:textPositionsRange:locations:textFormattingRanges:", a3, 0, outputMode, 0x7FFFFFFFFFFFFFFFLL, 0, &v12, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v12;
  if (v6)
    v8 = (__CFString *)v6;
  else
    v8 = &stru_24CBF1330;
  v13[0] = CFSTR("braille");
  v13[1] = CFSTR("locations");
  v14[0] = v8;
  -[BRLTJTranslatorWrapper arrayFromData:](self, "arrayFromData:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)textForBraille:(id)a3
{
  BRLTBrailleTranslationDelegateProtocol *translationDelegate;
  unint64_t inputMode;
  uint64_t v6;
  id v7;
  __CFString *v8;
  void *v9;
  void *v10;
  id v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  translationDelegate = self->_translationDelegate;
  inputMode = self->_inputMode;
  v12 = 0;
  -[BRLTBrailleTranslationDelegateProtocol textForPrintBraille:language:mode:locations:](translationDelegate, "textForPrintBraille:language:mode:locations:", a3, 0, inputMode, &v12);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v12;
  if (v6)
    v8 = (__CFString *)v6;
  else
    v8 = &stru_24CBF1330;
  v13[0] = CFSTR("text");
  v13[1] = CFSTR("locations");
  v14[0] = v8;
  -[BRLTJTranslatorWrapper arrayFromData:](self, "arrayFromData:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
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

- (unint64_t)outputMode
{
  return self->_outputMode;
}

- (void)setOutputMode:(unint64_t)a3
{
  self->_outputMode = a3;
}

- (unint64_t)inputMode
{
  return self->_inputMode;
}

- (void)setInputMode:(unint64_t)a3
{
  self->_inputMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_translationDelegate, 0);
}

@end
