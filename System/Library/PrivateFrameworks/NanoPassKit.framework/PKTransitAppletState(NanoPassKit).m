@implementation PKTransitAppletState(NanoPassKit)

- (id)npk_processUpdateWithAppletHistory:()NanoPassKit concreteTransactions:ephemeralTransaction:mutatedBalances:pass:
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  _BOOL4 v19;
  NSObject *v20;
  void *v21;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  id v33;
  NSObject *v34;
  NSObject *v35;
  id v36;
  void *v37;
  uint8_t buf[4];
  void *v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a7;
  v14 = v13;
  if (!v13)
  {
    pk_Payment_log();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);

    if (v19)
    {
      pk_Payment_log();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_213518000, v20, OS_LOG_TYPE_DEFAULT, "Notice: Error no pass to process applet history", buf, 2u);
      }

    }
    goto LABEL_8;
  }
  if (!NPKIsTruthOnCard(v13))
  {
LABEL_8:
    v17 = 0;
    v16 = 0;
    v15 = 0;
    goto LABEL_9;
  }
  NPKPaymentPassBalanceLabelDictionary(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  NPKPaymentPassUnitDictionary(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  NPKPaymentPassPlanLabelDictionary(v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
  objc_msgSend(a1, "processUpdateWithAppletHistory:concreteTransactions:ephemeralTransaction:mutatedBalances:balanceLabelDictionary:unitDictionary:planLabelDictionary:", v12, a4, a5, a6, v15, v16, v17);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (a6)
  {
    if (!objc_msgSend(*a6, "count"))
    {
      objc_msgSend(v21, "balance");
      v23 = objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        v24 = (void *)v23;
        objc_msgSend(v21, "currency");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25)
        {
          objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "expirationDate");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "components:fromDate:", 30, v27);
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          v36 = objc_alloc(MEMORY[0x24BE6EF38]);
          v28 = *MEMORY[0x24BE6F618];
          objc_msgSend(v21, "balance");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "currency");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = (void *)objc_msgSend(v36, "initWithIdentifier:balance:currency:exponent:expirationDate:", v28, v29, v30, 0, v37);

          v40[0] = v31;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v40, 1);
          v32 = objc_claimAutoreleasedReturnValue();
          v33 = *a6;
          *a6 = (id)v32;

          pk_Payment_log();
          v34 = objc_claimAutoreleasedReturnValue();
          LODWORD(v29) = os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);

          if ((_DWORD)v29)
          {
            pk_Payment_log();
            v35 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v39 = v31;
              _os_log_impl(&dword_213518000, v35, OS_LOG_TYPE_DEFAULT, "Notice: added Manually mutated transit Applet Balance:%@", buf, 0xCu);
            }

          }
        }
      }
    }
  }

  return v21;
}

@end
