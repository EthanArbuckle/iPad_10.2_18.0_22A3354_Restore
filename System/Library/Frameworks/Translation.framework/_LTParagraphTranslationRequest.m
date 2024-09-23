@implementation _LTParagraphTranslationRequest

- (id)loggingType
{
  return CFSTR("paragraph");
}

- (BOOL)_canUseTextService
{
  return 1;
}

- (void)_startTranslationWithTextService:(id)a3 done:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  uint64_t v8;
  void *v9;
  NSArray *ranges;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSString *v18;
  _QWORD v19[4];
  void (**v20)(_QWORD);
  id v21;
  id location;
  _QWORD v23[4];
  id v24;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  if (*(_OWORD *)&self->_text == 0)
  {
    v15 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("INVALID_REQUEST_NO_RANGES_OR_TEXT_ERROR_DESCRIPTION"), &stru_250695360, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "lt_invalidRequestErrorWithDescription:", v17);
    v18 = (NSString *)objc_claimAutoreleasedReturnValue();

    -[_LTParagraphTranslationRequest _translationFailedWithError:](self, "_translationFailedWithError:", v18);
    v7[2](v7);
  }
  else
  {
    v18 = self->_text;
    v8 = MEMORY[0x24BDAC760];
    if (self->_ranges)
    {
      objc_msgSend(MEMORY[0x24BDD16A8], "string");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      ranges = self->_ranges;
      v23[0] = v8;
      v23[1] = 3221225472;
      v23[2] = __72___LTParagraphTranslationRequest__startTranslationWithTextService_done___block_invoke;
      v23[3] = &unk_250693CE0;
      v11 = v9;
      v24 = v11;
      -[NSArray enumerateObjectsUsingBlock:](ranges, "enumerateObjectsUsingBlock:", v23);
      v12 = v11;

      v18 = (NSString *)v12;
    }
    -[_LTTranslationRequest requestContext](self, "requestContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_LTParagraphTranslationRequest translationParagraph](self, "translationParagraph");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    v19[0] = v8;
    v19[1] = 3221225472;
    v19[2] = __72___LTParagraphTranslationRequest__startTranslationWithTextService_done___block_invoke_2;
    v19[3] = &unk_250693D08;
    objc_copyWeak(&v21, &location);
    v20 = v7;
    objc_msgSend(v6, "translate:withContext:completion:", v14, v13, v19);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);

  }
}

- (void)_translationFailedWithError:(id)a3
{
  void (**completionHandler)(id, _QWORD, id);

  completionHandler = (void (**)(id, _QWORD, id))self->_completionHandler;
  if (completionHandler)
    completionHandler[2](completionHandler, 0, a3);
}

- (id)translationParagraph
{
  NSString *v3;
  void *v4;
  void *v5;
  NSArray *ranges;
  id v7;
  id v8;
  _LTTranslationParagraph *v9;
  void *v10;
  _LTTranslationParagraph *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD *v16;
  _QWORD v17[4];

  v3 = self->_text;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_ranges)
  {
    objc_msgSend(MEMORY[0x24BDD16A8], "string");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = 0;
    v17[1] = v17;
    v17[2] = 0x2020000000;
    ranges = self->_ranges;
    v17[3] = 0;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __54___LTParagraphTranslationRequest_translationParagraph__block_invoke;
    v13[3] = &unk_250693D30;
    v16 = v17;
    v14 = v4;
    v7 = v5;
    v15 = v7;
    -[NSArray enumerateObjectsUsingBlock:](ranges, "enumerateObjectsUsingBlock:", v13);
    v8 = v7;

    _Block_object_dispose(v17, 8);
    v3 = (NSString *)v8;
  }
  v9 = [_LTTranslationParagraph alloc];
  -[_LTTranslationRequest uniqueID](self, "uniqueID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[_LTTranslationParagraph initWithIdentifier:text:spans:isFinal:](v9, "initWithIdentifier:text:spans:isFinal:", v10, v3, v4, -[_LTTranslationRequest isFinal](self, "isFinal"));

  return v11;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSArray)ranges
{
  return self->_ranges;
}

- (void)setRanges:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_ranges, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
