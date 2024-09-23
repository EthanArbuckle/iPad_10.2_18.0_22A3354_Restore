@implementation CVNLPTextDecodingPath

- (CVNLPTextDecodingPath)init
{
  CVNLPTextDecodingPath *v2;
  CVNLPTextDecodingPath *v3;
  NSString *string;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CVNLPTextDecodingPath;
  v2 = -[CVNLPTextDecodingPath init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_hasProblematicMixedScriptWords = 0;
    *(_OWORD *)&v2->_modelLogProbability = 0u;
    *(_OWORD *)&v2->_wordLanguageModelLogProbability = 0u;
    *(_OWORD *)&v2->_characterCount = 0u;
    string = v2->_string;
    v2->_tokenCount = 0;
    v2->_string = (NSString *)&stru_1E60CE768;

  }
  return v3;
}

- (CVNLPTextDecodingPath)initWithCharacterLanguageModelLogProbability:(double)a3 wordLanguageModelLogProbability:(double)a4 lexiconScore:(double)a5 hasProblematicMixedScriptWords:(BOOL)a6 string:(id)a7
{
  id v13;
  CVNLPTextDecodingPath *v14;
  CVNLPTextDecodingPath *v15;
  objc_super v17;

  v13 = a7;
  v17.receiver = self;
  v17.super_class = (Class)CVNLPTextDecodingPath;
  v14 = -[CVNLPTextDecodingPath init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_characterLanguageModelLogProbability = a3;
    v14->_wordLanguageModelLogProbability = a4;
    v14->_lexiconScore = a5;
    v14->_hasProblematicMixedScriptWords = a6;
    objc_storeStrong((id *)&v14->_string, a7);
  }

  return v15;
}

+ (id)defaultPathScoringFunctionForLanguageResourceBundle:(id)a3
{
  id v3;
  void *v4;
  const char *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_opt_class();
  objc_msgSend_defaultPathScoringFunctionForLanguageResourceBundle_pruneProblematicMixedScriptWordPaths_(v4, v5, (uint64_t)v3, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)defaultPathScoringFunctionForLanguageResourceBundle:(id)a3 pruneProblematicMixedScriptWordPaths:(BOOL)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  BOOL v15;

  v5 = a3;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_1B03707EC;
  v13[3] = &unk_1E60CE108;
  v15 = a4;
  v14 = v5;
  v6 = v5;
  v7 = (void *)MEMORY[0x1B5E082B4](v13);
  v11 = (void *)MEMORY[0x1B5E082B4](v7, v8, v9, v10);

  return v11;
}

+ (id)defaultPathScoringFunction
{
  uint64_t v2;
  uint64_t v3;

  v2 = objc_opt_class();
  return (id)MEMORY[0x1E0DE7D20](v2, sel_defaultPathScoringFunctionPruneProblematicMixedScriptWordPaths_, 0, v3);
}

+ (id)defaultPathScoringFunctionPruneProblematicMixedScriptWordPaths:(BOOL)a3
{
  void *v3;
  void *v4;
  _QWORD v6[4];
  BOOL v7;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1B03709C4;
  v6[3] = &unk_1E60CE128;
  v7 = a3;
  v3 = (void *)MEMORY[0x1B5E082B4](v6, a2);
  v4 = (void *)MEMORY[0x1B5E082B4]();

  return v4;
}

- (double)modelLogProbability
{
  return self->_modelLogProbability;
}

- (double)characterLanguageModelLogProbability
{
  return self->_characterLanguageModelLogProbability;
}

- (double)wordLanguageModelLogProbability
{
  return self->_wordLanguageModelLogProbability;
}

- (double)lexiconScore
{
  return self->_lexiconScore;
}

- (BOOL)hasProblematicMixedScriptWords
{
  return self->_hasProblematicMixedScriptWords;
}

- (int64_t)characterCount
{
  return self->_characterCount;
}

- (int64_t)pseudoSpaceCount
{
  return self->_pseudoSpaceCount;
}

- (int64_t)tokenCount
{
  return self->_tokenCount;
}

- (NSString)string
{
  return self->_string;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_string, 0);
}

@end
