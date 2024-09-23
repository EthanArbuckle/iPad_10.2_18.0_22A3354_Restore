@implementation CDPCABaseRecoveryKeyReporter

- (void)reportRecoveryKeyTaskFinishedWithSuccess:(BOOL)a3 error:(id)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPCAReporter setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v6, CFSTR("wasSuccess"));

  if (v7)
    -[CDPCAReporter populateUnderlyingErrorsStartingWithRootError:maxDepth:](self, "populateUnderlyingErrorsStartingWithRootError:maxDepth:", v7, 3);
  -[CDPCAReporter sendReport](self, "sendReport");

}

@end
