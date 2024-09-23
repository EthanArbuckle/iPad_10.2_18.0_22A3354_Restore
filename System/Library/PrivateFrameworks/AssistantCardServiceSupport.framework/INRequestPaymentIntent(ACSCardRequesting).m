@implementation INRequestPaymentIntent(ACSCardRequesting)

- (void)requestCard:()ACSCardRequesting reply:
{
  void (**v6)(id, void *, _QWORD);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  unint64_t v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  unint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  _QWORD v67[2];
  void *v68;
  void *v69;
  _QWORD v70[2];
  uint64_t v71;
  _QWORD v72[2];

  v72[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (v6)
  {
    objc_msgSend(a3, "content");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0
      && (objc_msgSend(v7, "underlyingInteraction"), (v8 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v9 = v8;
      objc_msgSend(v8, "intentResponse");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v9, "intentResponse");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = 0;
      }

      objc_msgSend(v11, "paymentRecord");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE84D80], "acs_uniquelyIdentifiedCard");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "intent");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "acs_needsTitleCardSection");

      v66 = v16;
      if (v18)
      {
        objc_msgSend(MEMORY[0x24BE84F80], "acs_uniquelyIdentifiedCardSection");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setIsCentered:", 1);
        objc_msgSend(v19, "setSeparatorStyle:", 5);
        v20 = objc_msgSend(v9, "intentHandlingStatus");
        if (v20 <= 6)
        {
          if (v20 == 3)
          {
            objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = v21;
            v23 = CFSTR("MONEY_REQUESTED");
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = v21;
            v23 = CFSTR("REQUEST_MONEY");
          }
          objc_msgSend(v21, "localizedStringForKey:value:table:", v23, &stru_24D478830, 0);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setTitle:", v24);

          v16 = v66;
        }
        objc_msgSend(v16, "addObject:", v19);

      }
      v65 = v11;
      objc_msgSend(MEMORY[0x24BE84F10], "acs_wildCardSection");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObject:", v25);

      objc_msgSend(a1, "payer");
      v26 = objc_claimAutoreleasedReturnValue();
      if (v26)
      {
        v27 = (void *)v26;
        objc_msgSend(a1, "currencyAmount");
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (v28)
        {
          objc_msgSend(MEMORY[0x24BE84F80], "acs_uniquelyIdentifiedCardSection");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "payer");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "image");
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          if (v31)
          {
            v32 = objc_alloc(MEMORY[0x24BDDA518]);
            objc_msgSend(a1, "payer");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "image");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = (void *)objc_msgSend(v32, "initWithIntentsImage:", v34);

            objc_msgSend(v29, "setTitleImage:", v35);
          }
          objc_msgSend(v29, "setIsCentered:", 1);
          objc_msgSend(a1, "payer");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "displayName");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "setTitle:", v37);

          objc_msgSend(a1, "currencyAmount");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "acs_formattedAmountString");
          v63 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v29, "setSubtitle:", v63);
          objc_msgSend(v29, "setSeparatorStyle:", 5);
          NSStringFromSelector(sel_payer);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v70[0] = v39;
          NSStringFromSelector(sel_displayName);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v70[1] = v40;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v70, 2);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          +[ACSCardServiceHelper addParameterToSection:selectorStrings:class:](ACSCardServiceHelper, "addParameterToSection:selectorStrings:class:", v29, v41, objc_opt_class());

          NSStringFromSelector(sel_currencyAmount);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v69 = v42;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v69, 1);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          +[ACSCardServiceHelper addParameterToSection:selectorStrings:class:](ACSCardServiceHelper, "addParameterToSection:selectorStrings:class:", v29, v43, objc_opt_class());

          v16 = v66;
          objc_msgSend(v66, "addObject:", v29);

        }
      }
      objc_msgSend(a1, "note");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v44, "length");

      if (v45)
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "localizedStringForKey:value:table:", CFSTR("NOTE"), &stru_24D478830, 0);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "note");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        +[ACSCardServiceHelper rowCardSectionFromLeadingText:trailingText:](ACSCardServiceHelper, "rowCardSectionFromLeadingText:trailingText:", v47, v48);
        v49 = (void *)objc_claimAutoreleasedReturnValue();

        v16 = v66;
        NSStringFromSelector(sel_note);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = v50;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v68, 1);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        +[ACSCardServiceHelper addParameterToSection:selectorStrings:class:](ACSCardServiceHelper, "addParameterToSection:selectorStrings:class:", v49, v51, objc_opt_class());

        objc_msgSend(v66, "addObject:", v49);
      }
      objc_msgSend(v15, "feeAmount");
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      v53 = 0x24BDBC000;
      if (v52)
      {
        objc_msgSend(v15, "feeAmount");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "acs_formattedAmountString");
        v55 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "localizedStringForKey:value:table:", CFSTR("FEE"), &stru_24D478830, 0);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        +[ACSCardServiceHelper rowCardSectionFromLeadingText:trailingText:](ACSCardServiceHelper, "rowCardSectionFromLeadingText:trailingText:", v57, v55);
        v58 = (void *)objc_claimAutoreleasedReturnValue();

        NSStringFromSelector(sel_paymentRecord);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v67[0] = v59;
        NSStringFromSelector(sel_feeAmount);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v67[1] = v60;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v67, 2);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        +[ACSCardServiceHelper addParameterToSection:selectorStrings:class:](ACSCardServiceHelper, "addParameterToSection:selectorStrings:class:", v58, v61, objc_opt_class());

        v16 = v66;
        objc_msgSend(v66, "addObject:", v58);

        v53 = 0x24BDBC000uLL;
      }
      objc_msgSend(*(id *)(v53 + 3632), "arrayWithArray:", v16);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "setCardSections:", v62);

      objc_msgSend(v64, "acs_setInteraction:", v9);
      v6[2](v6, v64, 0);

      v14 = v65;
    }
    else
    {
      v12 = (void *)MEMORY[0x24BDD1540];
      v13 = *MEMORY[0x24BE15488];
      v71 = *MEMORY[0x24BDD0BA0];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Content %@ is incompatible with this service"), v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v72[0] = v9;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v72, &v71, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, 400, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, void *, void *))v6)[2](v6, 0, v15);
    }

  }
}

- (uint64_t)servicePriorityForCardRequest:()ACSCardRequesting
{
  return 2;
}

@end
