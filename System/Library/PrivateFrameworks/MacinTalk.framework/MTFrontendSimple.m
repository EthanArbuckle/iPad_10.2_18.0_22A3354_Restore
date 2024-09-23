@implementation MTFrontendSimple

- (MTFrontendSimple)initWithString:(id)a3
{
  id v4;
  void *v5;
  MTFrontendSimple *v6;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en-US"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MTFrontendSimple initWithStringAndLocale:locale:](self, "initWithStringAndLocale:locale:", v4, v5);

  return v6;
}

- (MTFrontendSimple)initWithStringAndLocale:(id)a3 locale:(id)a4
{
  __CFString *v6;
  SLDictLookup *v7;
  const __CFLocale *v8;
  MTFrontendSimple *v9;
  const __CFLocale *v10;
  const SLDictLookup *v11;
  SLCFStringTextSource *v12;
  uint64_t v13;
  uint64_t v14;
  MTFEBuilder *v15;
  objc_super v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v6 = (__CFString *)a3;
  v7 = (SLDictLookup *)a4;
  v17.receiver = self;
  v17.super_class = (Class)MTFrontendSimple;
  v9 = -[MTFrontendSimple init](&v17, sel_init);
  if (v9)
  {
    -[MTFrontendSimple setFDictLookup:](v9, "setFDictLookup:", SLDictLookup::Create(v7, v8));
    v10 = -[MTFrontendSimple fDictLookup](v9, "fDictLookup");
    -[MTFrontendSimple setFPronouncer:](v9, "setFPronouncer:", SLPronouncer::Create((SLPronouncer *)v7, v10, v11));
    v12 = (SLCFStringTextSource *)operator new();
    SLCFStringTextSource::SLCFStringTextSource(v12, v6);
    -[MTFrontendSimple setFTextSource:](v9, "setFTextSource:", v12);
    -[MTFrontendSimple fTextSource](v9, "fTextSource");
    -[MTFrontendSimple fDictLookup](v9, "fDictLookup");
    -[MTFrontendSimple fPronouncer](v9, "fPronouncer");
    -[MTFrontendSimple setFLexer:](v9, "setFLexer:", SLLexer::Create());
    v18[0] = 0x5D005D005B005BLL;
    v13 = -[MTFrontendSimple fLexer](v9, "fLexer");
    (*(void (**)(uint64_t, _QWORD *))(*(_QWORD *)v13 + 24))(v13, v18);
    v14 = -[MTFrontendSimple fLexer](v9, "fLexer");
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)v14 + 16))(v14, 0);
    v15 = (MTFEBuilder *)operator new();
    MTFEBuilder::MTFEBuilder(v15, -[MTFrontendSimple fLexer](v9, "fLexer"));
    -[MTFrontendSimple setBuilder:](v9, "setBuilder:", v15);
  }

  return v9;
}

- (id)nextObject
{
  MTFEBuilder *builder;
  MTFESentence *var2;
  void *v5;

  MTFEBuilder::ParseSentence(self->_builder);
  builder = self->_builder;
  var2 = builder->var2;
  MTFEBuilder::ResetProduct(builder, 0);
  if (var2)
  {
    +[MTFWrappedSpeechElement fromCPPElement:](MTFWrappedSpeechElement, "fromCPPElement:", var2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)dealloc
{
  MTFEBuilder *v3;
  SLLexer *v4;
  SLPronouncer *v5;
  SLDictLookup *v6;
  SLCFStringTextSource *v7;
  objc_super v8;

  v3 = -[MTFrontendSimple builder](self, "builder");
  if (v3)
    (*((void (**)(MTFEBuilder *))v3->var0 + 1))(v3);
  v4 = -[MTFrontendSimple fLexer](self, "fLexer");
  if (v4)
    (*((void (**)(SLLexer *))v4->var0 + 7))(v4);
  v5 = -[MTFrontendSimple fPronouncer](self, "fPronouncer");
  if (v5)
    (*((void (**)(SLPronouncer *))v5->var0 + 1))(v5);
  v6 = -[MTFrontendSimple fDictLookup](self, "fDictLookup");
  if (v6)
    (*((void (**)(SLDictLookup *))v6->var0 + 1))(v6);
  v7 = -[MTFrontendSimple fTextSource](self, "fTextSource");
  if (v7)
    (*((void (**)(SLCFStringTextSource *))v7->var0 + 2))(v7);
  v8.receiver = self;
  v8.super_class = (Class)MTFrontendSimple;
  -[MTFrontendSimple dealloc](&v8, sel_dealloc);
}

- (MTFEBuilder)builder
{
  return self->_builder;
}

- (void)setBuilder:(MTFEBuilder *)a3
{
  self->_builder = a3;
}

- (SLLexer)fLexer
{
  return self->_fLexer;
}

- (void)setFLexer:(SLLexer *)a3
{
  self->_fLexer = a3;
}

- (SLDictLookup)fDictLookup
{
  return self->_fDictLookup;
}

- (void)setFDictLookup:(SLDictLookup *)a3
{
  self->_fDictLookup = a3;
}

- (SLPronouncer)fPronouncer
{
  return self->_fPronouncer;
}

- (void)setFPronouncer:(SLPronouncer *)a3
{
  self->_fPronouncer = a3;
}

- (SLCFStringTextSource)fTextSource
{
  return self->_fTextSource;
}

- (void)setFTextSource:(SLCFStringTextSource *)a3
{
  self->_fTextSource = a3;
}

@end
