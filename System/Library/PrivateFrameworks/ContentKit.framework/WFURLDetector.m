@implementation WFURLDetector

+ (id)URLsInString:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;

  +[WFDataDetector resultsForString:ofTypes:error:](WFDataDetector, "resultsForString:ofTypes:error:", a3, 32, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (BOOL)stringContainsURLs:(id)a3
{
  return +[WFDataDetector hasResultForString:ofTypes:](WFDataDetector, "hasResultForString:ofTypes:", a3, 32);
}

+ (BOOL)stringMatchesExactly:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  BOOL v7;

  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD14E8], "dataDetectorWithTypes:error:", 32, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstMatchInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = !objc_msgSend(v5, "range") && v6 == objc_msgSend(v3, "length");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
