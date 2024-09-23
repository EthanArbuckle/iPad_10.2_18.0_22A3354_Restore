@implementation FAInviteRecipientEvaluator

- (id)parseRecipientAddresses:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x24BE19258]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v5, "firstEmailAddressInString:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v4, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v4;
}

- (id)recipientAlreadyInFamily:(id)a3 emailOnly:(BOOL)a4 recipients:(id)a5
{
  id v6;
  id v7;
  uint64_t i;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  void *v15;
  void *v16;
  uint64_t k;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t m;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  id obj;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  id v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v36 = a5;
  v7 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v28 = v6;
  objc_msgSend(v6, "members");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v59, 16);
  if (v33)
  {
    v32 = *(_QWORD *)v53;
    do
    {
      for (i = 0; i != v33; ++i)
      {
        if (*(_QWORD *)v53 != v32)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
        objc_msgSend(v9, "appleID");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v34)
          goto LABEL_20;
        v50 = 0u;
        v51 = 0u;
        v48 = 0u;
        v49 = 0u;
        v10 = v36;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v48, v58, 16);
        if (v11)
        {
          v12 = *(_QWORD *)v49;
          while (2)
          {
            for (j = 0; j != v11; ++j)
            {
              if (*(_QWORD *)v49 != v12)
                objc_enumerationMutation(v10);
              if (objc_msgSend(v34, "ea_isEqualToEmailAddress:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * j)))
              {
                objc_msgSend(v9, "fullName");
                v14 = (void *)objc_claimAutoreleasedReturnValue();

                if (v14)
                {
                  objc_msgSend(v9, "fullName");
                  v11 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v7, "addObject:", v11);

                  LOBYTE(v11) = 1;
                  goto LABEL_19;
                }
              }
            }
            v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v48, v58, 16);
            if (v11)
              continue;
            break;
          }
        }
LABEL_19:

        if ((v11 & 1) == 0)
        {
LABEL_20:
          if (!a4)
          {
            v31 = i;
            objc_msgSend(v9, "memberPhoneNumbers");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "componentsSeparatedByString:", CFSTR(","));
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            v46 = 0u;
            v47 = 0u;
            v44 = 0u;
            v45 = 0u;
            v35 = v16;
            v38 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v44, v57, 16);
            if (v38)
            {
              v37 = *(_QWORD *)v45;
              do
              {
                for (k = 0; k != v38; ++k)
                {
                  if (*(_QWORD *)v45 != v37)
                    objc_enumerationMutation(v35);
                  objc_msgSend(MEMORY[0x24BDBAD88], "phoneNumberWithStringValue:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * k));
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v18)
                  {
                    v39 = k;
                    v42 = 0u;
                    v43 = 0u;
                    v40 = 0u;
                    v41 = 0u;
                    v19 = v36;
                    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v40, v56, 16);
                    if (v20)
                    {
                      v21 = v20;
                      v22 = *(_QWORD *)v41;
                      do
                      {
                        for (m = 0; m != v21; ++m)
                        {
                          if (*(_QWORD *)v41 != v22)
                            objc_enumerationMutation(v19);
                          objc_msgSend(MEMORY[0x24BDBAD88], "phoneNumberWithStringValue:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * m));
                          v24 = (void *)objc_claimAutoreleasedReturnValue();
                          if (objc_msgSend(v18, "isEqual:", v24))
                          {
                            objc_msgSend(v9, "fullName");
                            v25 = (void *)objc_claimAutoreleasedReturnValue();

                            if (v25)
                            {
                              objc_msgSend(v9, "fullName");
                              v26 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v7, "addObject:", v26);

                            }
                          }

                        }
                        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v40, v56, 16);
                      }
                      while (v21);
                    }

                    k = v39;
                  }

                }
                v38 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v44, v57, 16);
              }
              while (v38);
            }

            i = v31;
          }
        }

      }
      v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v59, 16);
    }
    while (v33);
  }

  return v7;
}

- (void)showAlreadyFamilyMember:(id)a3 presenter:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  FAInviteRecipientEvaluator *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__FAInviteRecipientEvaluator_showAlreadyFamilyMember_presenter___block_invoke;
  block[3] = &unk_24C88C190;
  v11 = v6;
  v12 = self;
  v13 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __64__FAInviteRecipientEvaluator_showAlreadyFamilyMember_presenter___block_invoke(uint64_t a1)
{
  unint64_t v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v2 = objc_msgSend(*(id *)(a1 + 32), "count");
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2 <= 1)
    v5 = CFSTR("FAMILY_INVITE_ALREADY_FAMILY_MEMBER");
  else
    v5 = CFSTR("FAMILY_INVITE_ALREADY_FAMILY_MEMBERS");
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_24C8A3000, CFSTR("Localizable"));
  v14 = (id)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x24BDD17C8];
  v7 = (void *)MEMORY[0x24BDD1640];
  objc_msgSend(*(id *)(a1 + 32), "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringByJoiningStrings:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", v14, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_24C8A3000, CFSTR("Localizable"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD3B0], "alertWithTitle:message:buttonTitle:actionHandler:", v10, 0, v12, &__block_literal_global_7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "presentViewController:animated:completion:", v13, 1, 0);

}

- (void)validateRecipients:(id)a3 inviteContext:(id)a4 presenter:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (objc_msgSend(v10, "count"))
  {
    if ((objc_msgSend(v11, "validation") & 1) != 0)
    {
      v14 = objc_alloc_init(MEMORY[0x24BE30A88]);
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __84__FAInviteRecipientEvaluator_validateRecipients_inviteContext_presenter_completion___block_invoke;
      v15[3] = &unk_24C88C1B8;
      v15[4] = self;
      v16 = v10;
      v18 = v13;
      v17 = v12;
      objc_msgSend(v14, "startRequestWithCompletionHandler:", v15);

    }
    else
    {
      (*((void (**)(id, uint64_t))v13 + 2))(v13, 1);
    }
  }
  else
  {
    (*((void (**)(id, _QWORD))v13 + 2))(v13, 0);
  }

}

void __84__FAInviteRecipientEvaluator_validateRecipients_inviteContext_presenter_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void (*v4)(void);
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "recipientAlreadyInFamily:emailOnly:recipients:", a2, 0, *(_QWORD *)(a1 + 40));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v5, "count");
  v4 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
  if (v3)
  {
    v4();
    objc_msgSend(*(id *)(a1 + 32), "showAlreadyFamilyMember:presenter:", v5, *(_QWORD *)(a1 + 48));
  }
  else
  {
    v4();
  }

}

@end
