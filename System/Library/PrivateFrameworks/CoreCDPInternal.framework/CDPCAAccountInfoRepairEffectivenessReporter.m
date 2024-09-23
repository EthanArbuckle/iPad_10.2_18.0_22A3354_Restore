@implementation CDPCAAccountInfoRepairEffectivenessReporter

- (CDPCAAccountInfoRepairEffectivenessReporter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CDPCAAccountInfoRepairEffectivenessReporter;
  return -[CDPCAReporter initWithEvent:](&v3, sel_initWithEvent_, CFSTR("com.apple.cdp.accountInfoRepairEffectiveness"));
}

- (void)reportRepairAttemptFinishedWithSuccess:(BOOL)a3 authenticationError:(id)a4 accountInfoFetchErrorBeforeRepair:(id)a5 repairError:(id)a6 accountInfoFetchErrorAfterRepair:(id)a7 octagonStatusBefore:(unint64_t)a8 octagonStatusAfter:(unint64_t)a9 pcsStatusBefore:(unint64_t)a10 pcsStatusAfter:(unint64_t)a11 escrowKeysStatusBefore:(unint64_t)a12 escrowKeysStatusAfter:(unint64_t)a13
{
  _BOOL8 v17;
  id v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  _QWORD v38[15];

  v17 = a3;
  v38[13] = *MEMORY[0x24BDAC8D0];
  v36 = a4;
  v37 = a5;
  v19 = a6;
  v20 = a7;
  v21 = (void *)MEMORY[0x24BDBCF20];
  v22 = *MEMORY[0x24BDD1100];
  v38[0] = *MEMORY[0x24BDD0B88];
  v38[1] = v22;
  v23 = *MEMORY[0x24BE1A368];
  v38[2] = *MEMORY[0x24BDD1308];
  v38[3] = v23;
  v24 = *MEMORY[0x24BE17C10];
  v38[4] = *MEMORY[0x24BE0AB28];
  v38[5] = v24;
  v25 = *MEMORY[0x24BE17B90];
  v38[6] = *MEMORY[0x24BE17B98];
  v38[7] = v25;
  v26 = *MEMORY[0x24BDB8EE0];
  v38[8] = *MEMORY[0x24BDB8EA8];
  v38[9] = v26;
  v38[10] = CFSTR("com.apple.protectedcloudstorage");
  v38[11] = CFSTR("com.apple.security.octagon");
  v38[12] = CFSTR("com.apple.accounts");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v38, 13);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setWithArray:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v17);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPCAReporter setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v29, CFSTR("wasSuccess"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a8);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPCAReporter setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v30, CFSTR("otStatus_before"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a9);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPCAReporter setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v31, CFSTR("otStatus_after"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a10);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPCAReporter setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v32, CFSTR("pcsStatus_before"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a11);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPCAReporter setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v33, CFSTR("pcsStatus_after"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a12);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPCAReporter setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v34, CFSTR("escrowKeysStatus_before"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a13);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPCAReporter setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v35, CFSTR("escrowKeysStatus_after"));

  if (v36)
    -[CDPCAReporter populateUnderlyingErrorsStartingWithRootError:maxDepth:topLevelErrorCodeKey:topLevelErrorDomainKey:errorCodePrefix:errorDomainPrefix:domainAllowlist:](self, "populateUnderlyingErrorsStartingWithRootError:maxDepth:topLevelErrorCodeKey:topLevelErrorDomainKey:errorCodePrefix:errorDomainPrefix:domainAllowlist:", v36, 3, CFSTR("authErrorCode"), CFSTR("authErrorDomain"), CFSTR("authUnderlyingErrorCode"), CFSTR("authUnderlyingErrorDomain"), v28);
  if (v37)
    -[CDPCAReporter populateUnderlyingErrorsStartingWithRootError:maxDepth:topLevelErrorCodeKey:topLevelErrorDomainKey:errorCodePrefix:errorDomainPrefix:domainAllowlist:](self, "populateUnderlyingErrorsStartingWithRootError:maxDepth:topLevelErrorCodeKey:topLevelErrorDomainKey:errorCodePrefix:errorDomainPrefix:domainAllowlist:", v37, 3, CFSTR("accountInfoFetchBeforeRepairErrorCode"), CFSTR("accountInfoFetchBeforeRepairErrorDomain"), CFSTR("accountInfoFetchBeforeRepairUnderlyingErrorCode"), CFSTR("accountInfoFetchBeforeRepairUnderlyingErrorDomain"), v28);
  if (v19)
    -[CDPCAReporter populateUnderlyingErrorsStartingWithRootError:maxDepth:domainAllowlist:](self, "populateUnderlyingErrorsStartingWithRootError:maxDepth:domainAllowlist:", v19, 3, v28);
  if (v20)
    -[CDPCAReporter populateUnderlyingErrorsStartingWithRootError:maxDepth:topLevelErrorCodeKey:topLevelErrorDomainKey:errorCodePrefix:errorDomainPrefix:domainAllowlist:](self, "populateUnderlyingErrorsStartingWithRootError:maxDepth:topLevelErrorCodeKey:topLevelErrorDomainKey:errorCodePrefix:errorDomainPrefix:domainAllowlist:", v20, 3, CFSTR("accountInfoFetchAfterRepairErrorCode"), CFSTR("accountInfoFetchAfterRepairErrorDomain"), CFSTR("accountInfoFetchAfterRepairUnderlyingErrorCode"), CFSTR("accountInfoFetchAfterRepairUnderlyingErrorDomain"), v28);
  -[CDPCAReporter sendReport](self, "sendReport");

}

- (void)reportRepairAttemptFailedDueToAuthenticationError:(id)a3
{
  -[CDPCAAccountInfoRepairEffectivenessReporter reportRepairAttemptFinishedWithSuccess:authenticationError:accountInfoFetchErrorBeforeRepair:repairError:accountInfoFetchErrorAfterRepair:octagonStatusBefore:octagonStatusAfter:pcsStatusBefore:pcsStatusAfter:escrowKeysStatusBefore:escrowKeysStatusAfter:](self, "reportRepairAttemptFinishedWithSuccess:authenticationError:accountInfoFetchErrorBeforeRepair:repairError:accountInfoFetchErrorAfterRepair:octagonStatusBefore:octagonStatusAfter:pcsStatusBefore:pcsStatusAfter:escrowKeysStatusBefore:escrowKeysStatusAfter:", 0, a3, 0, 0, 0, 0, 0, 0, 0, 0, 0);
}

@end
