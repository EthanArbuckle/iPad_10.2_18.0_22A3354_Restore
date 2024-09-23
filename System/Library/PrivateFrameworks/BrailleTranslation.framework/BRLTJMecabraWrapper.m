@implementation BRLTJMecabraWrapper

- (BRLTJMecabraWrapper)initWithUnitTesting:(BOOL)a3
{
  BRLTJMecabraWrapper *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  uint64_t v10;
  NSMutableDictionary *candidateRefForSurface;
  NSString *currentAnalysis;
  NSString *currentSurface;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)BRLTJMecabraWrapper;
  v4 = -[BRLTJMecabraWrapper init](&v15, sel_init);
  if (v4)
  {
    NSHomeDirectory();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("/Library/Accessibility/brailleLearningDict_ja"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "fileExistsAtPath:", v6);

    if ((v8 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v6, 0, 0, 0);

    }
    if (!a3)
      objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v6);
    v4->_mecabra = (__Mecabra *)MecabraCreateWithOptions();
    v4->_context = (__MecabraContext *)MecabraContextCreateMutable();
    v10 = objc_opt_new();
    candidateRefForSurface = v4->_candidateRefForSurface;
    v4->_candidateRefForSurface = (NSMutableDictionary *)v10;

    v4->_reachedEnd = v4->_mecabra == 0;
    currentAnalysis = v4->_currentAnalysis;
    v4->_currentAnalysis = (NSString *)&stru_24CBF1330;

    currentSurface = v4->_currentSurface;
    v4->_currentSurface = (NSString *)&stru_24CBF1330;

  }
  return v4;
}

- (BRLTJMecabraWrapper)init
{
  return -[BRLTJMecabraWrapper initWithUnitTesting:](self, "initWithUnitTesting:", 0);
}

- (void)dealloc
{
  objc_super v3;

  if (self->_mecabra)
    MecabraRelease();
  if (self->_context)
    MecabraContextRelease();
  v3.receiver = self;
  v3.super_class = (Class)BRLTJMecabraWrapper;
  -[BRLTJMecabraWrapper dealloc](&v3, sel_dealloc);
}

- (void)analyzeString:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  if (self->_mecabra)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_string, a3);
    MecabraAnalyzeStringWithContext();
    v5 = v6;
  }

}

- (BOOL)moveToNextCandidate
{
  uint64_t NextCandidate;
  uint64_t v4;
  NSString *v5;
  NSString *currentAnalysis;
  NSString *v7;
  NSString *currentSurface;

  if (self->_reachedEnd)
  {
    LOBYTE(NextCandidate) = 0;
  }
  else
  {
    NextCandidate = MecabraGetNextCandidate();
    if (NextCandidate)
    {
      v4 = NextCandidate;
      MecabraCandidateGetAnalysisString();
      v5 = (NSString *)objc_claimAutoreleasedReturnValue();
      currentAnalysis = self->_currentAnalysis;
      self->_currentAnalysis = v5;

      MecabraCandidateGetSurface();
      v7 = (NSString *)objc_claimAutoreleasedReturnValue();
      currentSurface = self->_currentSurface;
      self->_currentSurface = v7;

      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_candidateRefForSurface, "setObject:forKeyedSubscript:", v4, self->_currentSurface);
      LOBYTE(NextCandidate) = 1;
    }
    else
    {
      self->_reachedEnd = 1;
    }
  }
  return NextCandidate;
}

- (void)learnCandidate:(id)a3
{
  if (-[NSMutableDictionary objectForKey:](self->_candidateRefForSurface, "objectForKey:", a3))
    MecabraContextAddInlineCandidate();
  MecabraAcceptInlineCandidates();
}

- (id)getCurrentCandidateAnalysisString
{
  return self->_currentAnalysis;
}

- (id)getCurrentCandidateSurface
{
  return self->_currentSurface;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentSurface, 0);
  objc_storeStrong((id *)&self->_currentAnalysis, 0);
  objc_storeStrong((id *)&self->_candidateRefForSurface, 0);
  objc_storeStrong((id *)&self->_string, 0);
}

@end
