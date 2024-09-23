@implementation INCreateNoteIntent(ACSCardRequesting)

- (void)requestCard:()ACSCardRequesting reply:
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    objc_msgSend(v6, "content");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0
      && (objc_msgSend(v8, "underlyingInteraction"), (v9 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v10 = v9;
      v11 = objc_msgSend(v9, "intentHandlingStatus");
      if (v11 <= 6)
      {
        if (v11 == 4)
        {
          v17 = (void *)MEMORY[0x24BDD1540];
          v18 = *MEMORY[0x24BE15488];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Content %@ is incompatible with this service"), v8, *MEMORY[0x24BDD0BA0]);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v19;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "errorWithDomain:code:userInfo:", v18, 400, v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v7[2](v7, 0, v21);

        }
        else
        {
          objc_msgSend(a1, "_buildCardFromRequest:reply:", v6, v7);
        }
      }
    }
    else
    {
      v12 = (void *)MEMORY[0x24BDD1540];
      v13 = *MEMORY[0x24BE15488];
      v24 = *MEMORY[0x24BDD0BA0];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Content %@ is incompatible with this service"), v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = v14;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, 400, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, 0, v16);

      v10 = 0;
    }

  }
}

- (uint64_t)servicePriorityForCardRequest:()ACSCardRequesting
{
  return 2;
}

- (void)_buildCardFromRequest:()ACSCardRequesting reply:
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _QWORD v54[4];
  id v55;
  id v56;
  uint64_t v57;
  _BYTE v58[128];
  void *v59;
  _QWORD v60[3];

  v60[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (v6)
  {
    objc_msgSend(a3, "content");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v7;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v7, "underlyingInteraction");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
    v47 = v8;
    objc_msgSend(v8, "intentResponse");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE84D80], "acs_uniquelyIdentifiedCard");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(v9, "createdNote");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "title");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "spokenPhrase");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = v13;
      objc_msgSend(MEMORY[0x24BDD9EF8], "parameterForClass:keyPath:", objc_opt_class(), CFSTR("createdNote.title"));
      v15 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(a1, "title");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "spokenPhrase");
      v14 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD9EF8], "parameterForClass:keyPath:", objc_opt_class(), CFSTR("title"));
      v15 = objc_claimAutoreleasedReturnValue();
      if (!v14)
        goto LABEL_11;
    }
    objc_msgSend(MEMORY[0x24BE84F80], "acs_uniquelyIdentifiedCardSection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTitle:", v14);
    objc_msgSend(v17, "setIsCentered:", 1);
    objc_msgSend(v17, "setSeparatorStyle:", 5);
    objc_msgSend(v17, "setTitleAlign:", 1);
    objc_msgSend(v17, "setTitleWeight:", &unk_24D479BE0);
    if (v15)
    {
      v60[0] = v15;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v60, 1);
      v18 = v15;
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "acs_setParameters:", v19);

      v15 = v18;
    }
    objc_msgSend(v10, "addObject:", v17);

LABEL_11:
    v44 = v13;
    objc_msgSend(MEMORY[0x24BE84F10], "acs_wildCardSection");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v20);

    objc_msgSend(a1, "content");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v11;
    objc_msgSend(v11, "contents");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    v49 = v6;
    v42 = v22;
    v43 = (void *)v15;
    if (v22 || !v21)
    {
      v24 = v22;
      v30 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      v25 = v30;
      if (v23)
      {
        v54[0] = MEMORY[0x24BDAC760];
        v54[1] = 3221225472;
        v54[2] = __69__INCreateNoteIntent_ACSCardRequesting___buildCardFromRequest_reply___block_invoke;
        v54[3] = &unk_24D4787B0;
        v25 = v30;
        v55 = v25;
        v56 = v9;
        objc_msgSend(v24, "enumerateObjectsUsingBlock:", v54);

        goto LABEL_18;
      }
      if (!v21)
      {
LABEL_30:
        objc_msgSend(v46, "setCardSections:", v10, v41);
        objc_msgSend(v46, "acs_setInteraction:", v47);
        v6 = v49;
        (*((void (**)(id, void *, _QWORD))v49 + 2))(v49, v46, 0);

        goto LABEL_31;
      }
      v24 = 0;
    }
    else
    {
      v59 = v21;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v59, 1);
      v24 = (id)objc_claimAutoreleasedReturnValue();
      v25 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    }
    v26 = (void *)MEMORY[0x24BDD9EF8];
    v27 = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("content"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "parameterForClass:keyPath:", v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setObject:forKey:", v29, v21);

    if (!v24)
      goto LABEL_30;
LABEL_18:
    v41 = v21;
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v31 = v24;
    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
    if (v32)
    {
      v33 = v32;
      v34 = *(_QWORD *)v51;
      do
      {
        for (i = 0; i != v33; ++i)
        {
          if (*(_QWORD *)v51 != v34)
            objc_enumerationMutation(v31);
          v36 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
          objc_msgSend(v36, "acs_cardSection", v41, v42, v43);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "objectForKey:", v36);
          v38 = objc_claimAutoreleasedReturnValue();
          v39 = (void *)v38;
          if (v38)
          {
            v57 = v38;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v57, 1);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "acs_setParameters:", v40);

          }
          if (v37)
            objc_msgSend(v10, "addObject:", v37);

        }
        v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
      }
      while (v33);
    }

    v21 = v41;
    goto LABEL_30;
  }
LABEL_31:

}

@end
