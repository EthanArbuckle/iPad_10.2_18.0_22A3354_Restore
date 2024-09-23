@implementation SFLanguageDetectorResult

- (SFLanguageDetectorResult)initWithRange:(id *)a3 dominantLocale:(id)a4 alternatives:(id)a5 detectedLanguageCode:(id)a6
{
  id v10;
  id v11;
  id v12;
  SFLanguageDetectorResult *v13;
  SFLanguageDetectorResult *v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  NSLocale *dominantLocale;
  uint64_t v19;
  NSArray *alternatives;
  objc_super v22;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)SFLanguageDetectorResult;
  v13 = -[SFLanguageDetectorResult init](&v22, sel_init);
  v14 = v13;
  if (v13)
  {
    v15 = *(_OWORD *)&a3->var0.var0;
    v16 = *(_OWORD *)&a3->var1.var1;
    *(_OWORD *)&v13->_range.start.epoch = *(_OWORD *)&a3->var0.var3;
    *(_OWORD *)&v13->_range.duration.timescale = v16;
    *(_OWORD *)&v13->_range.start.value = v15;
    v17 = objc_msgSend(v10, "copy");
    dominantLocale = v14->_dominantLocale;
    v14->_dominantLocale = (NSLocale *)v17;

    v19 = objc_msgSend(v11, "copy");
    alternatives = v14->_alternatives;
    v14->_alternatives = (NSArray *)v19;

    objc_storeStrong((id *)&v14->_detectedLanguageCode, a6);
  }

  return v14;
}

- ($A0D62BC7BB322857EA05296DE7D5C3FF)range
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].var0.var0;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self->var1.var1;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[1].var0.var3;
  return self;
}

- (NSLocale)dominantLocale
{
  return self->_dominantLocale;
}

- (NSArray)alternatives
{
  return self->_alternatives;
}

- (NSString)detectedLanguageCode
{
  return self->_detectedLanguageCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detectedLanguageCode, 0);
  objc_storeStrong((id *)&self->_alternatives, 0);
  objc_storeStrong((id *)&self->_dominantLocale, 0);
}

@end
