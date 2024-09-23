@implementation _CDInteractionFeedbackLogger

+ (void)logFeedbackItemSelected:(id)a3 adviceSource:(unint64_t)a4 presentationStyle:(unint64_t)a5 itemsShown:(id)a6 bundleID:(id)a7
{
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a7;
  objc_msgSend(a3, "personId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(a1, "aggdKeyForAdviceSource:", a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "aggdKeyForPresentationStyle:", a5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("%@.source.%@.%@"), CFSTR("com.apple.coreduet.interactionAdvisor.feedback"), v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    +[_CDDiagnosticDataReporter addValue:forScalarKey:](_CDDiagnosticDataReporter, "addValue:forScalarKey:", 1, v15);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v15, v17);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    +[_CDDiagnosticDataReporter addValue:forScalarKey:](_CDDiagnosticDataReporter, "addValue:forScalarKey:", 1, v16);
  }

}

+ (id)aggdKeyForAdviceSource:(unint64_t)a3
{
  if (a3 > 2)
    return CFSTR("other");
  else
    return off_1E26E6640[a3];
}

+ (id)aggdKeyForPresentationStyle:(unint64_t)a3
{
  if (a3 > 3)
    return CFSTR("autoComplete");
  else
    return off_1E26E6658[a3];
}

@end
