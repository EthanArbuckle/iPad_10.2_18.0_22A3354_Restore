@implementation WFDateDetector

+ (id)datesInString:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;

  if (a3)
  {
    +[WFDataDetector resultsForString:ofTypes:error:](WFDataDetector, "resultsForString:ofTypes:error:", a3, 8, a4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dates");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = (void *)MEMORY[0x24BDBD1A8];
  }
  return v5;
}

+ (id)detectedDatesInString:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;
  void *v6;

  if (a3)
  {
    +[WFDataDetector resultsForString:ofTypes:error:](WFDataDetector, "resultsForString:ofTypes:error:", a3, 8, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "textCheckingResults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "if_compactMap:", &__block_literal_global_23076);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)MEMORY[0x24BDBD1A8];
  }
  return v6;
}

+ (BOOL)stringContainsDates:(id)a3
{
  return +[WFDataDetector hasResultForString:ofTypes:](WFDataDetector, "hasResultForString:ofTypes:", a3, 8);
}

WFDetectedDate *__46__WFDateDetector_detectedDatesInString_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  WFDetectedDate *v3;

  v2 = a2;
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v3 = -[WFDetectedDate initWithDateCheckingResult:]([WFDetectedDate alloc], "initWithDateCheckingResult:", v2);
  else
    v3 = 0;

  return v3;
}

@end
