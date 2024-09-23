@implementation _CRKSendMessageCardFactory

- (void)buildCardForContent:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, id, _QWORD);
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  id v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _QWORD v78[3];
  _BYTE v79[128];
  uint64_t v80;

  v80 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, id, _QWORD))a4;
  if (v7)
  {
    if (objc_msgSend(v6, "conformsToProtocol:", &unk_25505F4C8))
    {
      v7[2](v7, v6, 0);
      goto LABEL_36;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "underlyingInteraction");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
    objc_msgSend(v8, "intent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v7[2](v7, 0, 0);
LABEL_35:

      goto LABEL_36;
    }
    v69 = v9;
    v10 = v9;
    v71 = v8;
    objc_msgSend(v8, "intentResponse");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_alloc_init(MEMORY[0x24BE84D80]);
    objc_msgSend(v11, "setType:", 1);
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "UUIDString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setCardId:", v13);

    v70 = v11;
    objc_msgSend(v11, "setSource:", 2);
    v68 = objc_alloc_init(MEMORY[0x24BE85020]);
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("SEND_MESSAGE_TO_PREFIX"), &stru_24DA4D820, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    v77 = 0u;
    v73 = v10;
    objc_msgSend(v10, "recipients");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v74, v79, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v75;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v75 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v74 + 1) + 8 * i), "displayName");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v22);

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v74, v79, 16);
      }
      while (v19);
    }

    -[_CRKSendMessageCardFactory delegate](self, "delegate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "semanticContentAttributeForCardFactory:", self);

    if (v24 == 4)
    {
      objc_msgSend(v16, "reverseObjectEnumerator");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "allObjects");
      v26 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v26 = v16;
    }
    v67 = v26;
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("MESSAGE_RECIPIENTS_DELIMITER"), &stru_24DA4D820, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "componentsJoinedByString:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v73, "speakableGroupName");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "spokenPhrase");
    v31 = objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      v32 = (void *)v31;
      v65 = v24;
      v33 = v29;
      objc_msgSend(v73, "speakableGroupName");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "spokenPhrase");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v35)
      {
        v29 = v33;
        v24 = v65;
        goto LABEL_25;
      }
      objc_msgSend(v73, "speakableGroupName");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "spokenPhrase");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "mutableCopy");

      v29 = (void *)v37;
      v24 = v65;
    }

LABEL_25:
    v66 = v29;
    if (v24 == 4)
    {
      v38 = (id)objc_msgSend(v29, "copy");
      v39 = v15;
    }
    else
    {
      v38 = v15;
      v39 = (id)objc_msgSend(v29, "copy");
    }
    v63 = v38;
    v64 = v39;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "setTitle:", v40);

    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "UUIDString");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "setCardSectionId:", v42);

    objc_msgSend(v68, "setParameterKeyPaths:", &unk_24DA56868);
    objc_msgSend(v68, "setSeparatorStyle:", 2);
    v43 = objc_alloc_init(MEMORY[0x24BE84EF0]);
    if (objc_msgSend(v72, "code") == 3)
      v44 = 2;
    else
      v44 = 1;
    objc_msgSend(v43, "setMessageStatus:", v44);
    objc_msgSend(v73, "launchId");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    INExtractAppInfoFromSiriLaunchId();
    v62 = 0;

    if (objc_msgSend(v62, "isEqualToString:", CFSTR("com.apple.MobileSMS")))
      v46 = 1;
    else
      v46 = 3;
    objc_msgSend(v43, "setMessageServiceType:", v46);
    objc_msgSend(v73, "content");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setMessageText:", v61);
    objc_msgSend(v43, "setSeparatorStyle:", 1);
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "UUIDString");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setCardSectionId:", v48);

    objc_msgSend(v43, "setParameterKeyPaths:", &unk_24DA56880);
    objc_msgSend(v73, "backingStore");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "data");
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v70, "setIntentMessageData:", v50);
    objc_opt_class();
    INIntentSchemaGetIntentDescriptionWithFacadeClass();
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "type");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "setIntentMessageName:", v52);

    objc_msgSend(v72, "backingStore");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "data");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "setIntentResponseMessageData:", v54);

    objc_opt_class();
    INIntentSchemaGetIntentResponseDescriptionWithFacadeClass();
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "type");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "setIntentResponseMessageName:", v56);

    v57 = objc_alloc_init(MEMORY[0x24BE84F10]);
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "UUIDString");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setCardSectionId:", v59);

    objc_msgSend(v57, "setParameterKeyPaths:", MEMORY[0x24BDBD1A8]);
    v78[0] = v57;
    v78[1] = v68;
    v78[2] = v43;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v78, 3);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "setCardSections:", v60);

    v7[2](v7, v70, 0);
    v8 = v71;
    v9 = v69;
    goto LABEL_35;
  }
LABEL_36:

}

- (void)requestCard:(id)a3 reply:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  objc_msgSend(a3, "content");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[_CRKSendMessageCardFactory buildCardForContent:completion:](self, "buildCardForContent:completion:", v7, v6);

}

- (BOOL)canSatisfyCardRequest:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  v3 = a3;
  objc_msgSend(v3, "content");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "underlyingInteraction");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "intent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  v7 = 0;
  if ((objc_msgSend(v4, "conformsToProtocol:", &unk_25505F4C8) & 1) == 0 && v6)
  {
    objc_opt_class();
    v7 = (objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v3, "format") != 2;
  }

  return v7;
}

- (unint64_t)servicePriorityForRequest:(id)a3
{
  return 2;
}

- (NSString)serviceIdentifier
{
  return (NSString *)CFSTR("com.apple.CardKit.BuiltInSendMessageCardFactory");
}

- (_CRKSendMessageCardFactory)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_CRKSendMessageCardFactory;
  return -[_CRKSendMessageCardFactory init](&v4, sel_init, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_CRKSendMessageCardFactoryDelegate)delegate
{
  return (_CRKSendMessageCardFactoryDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
