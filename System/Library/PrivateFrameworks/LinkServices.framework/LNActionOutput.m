@implementation LNActionOutput

- (LNActionOutput)initWithIdentifier:(id)a3 dialog:(id)a4 viewSnippet:(id)a5 value:(id)a6 showOutputAction:(id)a7 showOutputActionHint:(int64_t)a8 showOutputActionOptions:(unint64_t)a9 deferred:(BOOL)a10 nextAction:(id)a11 suggestedFollowUpActions:(id)a12 activityIdentifier:(id)a13 confirmationActionName:(id)a14 showPrompt:(BOOL)a15 confirmationConditions:(int64_t)a16 undoContext:(id)a17
{
  id v22;
  id v23;
  id v24;
  id v25;
  LNActionOutput *v26;
  LNActionOutput *v27;
  uint64_t v28;
  NSString *activityIdentifier;
  LNActionOutput *v30;
  id obj;
  id v33;
  id v34;
  id v35;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  objc_super v44;

  v42 = a3;
  obj = a4;
  v39 = a4;
  v33 = a5;
  v38 = a5;
  v34 = a6;
  v22 = a6;
  v35 = a7;
  v43 = a7;
  v41 = a11;
  v40 = a12;
  v23 = a13;
  v24 = a14;
  v25 = a17;
  v44.receiver = self;
  v44.super_class = (Class)LNActionOutput;
  v26 = -[LNActionOutput init](&v44, sel_init);
  v27 = v26;
  if (v26)
  {
    objc_storeStrong((id *)&v26->_identifier, a3);
    objc_storeStrong((id *)&v27->_dialog, obj);
    objc_storeStrong((id *)&v27->_viewSnippet, v33);
    objc_storeStrong((id *)&v27->_value, v34);
    objc_storeStrong((id *)&v27->_showOutputAction, v35);
    v27->_showOutputActionHint = a8;
    v27->_showOutputActionOptions = a9;
    v27->_deferred = a10;
    objc_storeStrong((id *)&v27->_nextAction, a11);
    objc_storeStrong((id *)&v27->_suggestedFollowUpActions, a12);
    v28 = objc_msgSend(v23, "copy");
    activityIdentifier = v27->_activityIdentifier;
    v27->_activityIdentifier = (NSString *)v28;

    objc_storeStrong((id *)&v27->_confirmationActionName, a14);
    v27->_showPrompt = a15;
    v27->_confirmationConditions = a16;
    objc_storeStrong((id *)&v27->_undoContext, a17);
    v30 = v27;
  }

  return v27;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  -[LNActionOutput identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  -[LNActionOutput dialog](self, "dialog");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("dialog"));

  -[LNActionOutput viewSnippet](self, "viewSnippet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("viewSnippet"));

  -[LNActionOutput value](self, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("value"));

  -[LNActionOutput showOutputAction](self, "showOutputAction");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("showOutputAction"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[LNActionOutput showOutputActionHint](self, "showOutputActionHint"), CFSTR("showOutputActionHint"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[LNActionOutput showOutputActionOptions](self, "showOutputActionOptions"), CFSTR("showOutputActionOptions"));
  objc_msgSend(v4, "encodeBool:forKey:", -[LNActionOutput isDeferred](self, "isDeferred"), CFSTR("deferred"));
  -[LNActionOutput nextAction](self, "nextAction");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("nextAction"));

  -[LNActionOutput suggestedFollowUpActions](self, "suggestedFollowUpActions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("suggestedFollowUpActions"));

  -[LNActionOutput activityIdentifier](self, "activityIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("activityIdentifier"));

  -[LNActionOutput confirmationActionName](self, "confirmationActionName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("confirmationActionName"));

  objc_msgSend(v4, "encodeBool:forKey:", -[LNActionOutput shouldShowPrompt](self, "shouldShowPrompt"), CFSTR("showPrompt"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[LNActionOutput confirmationConditions](self, "confirmationConditions"), CFSTR("confirmationConditions"));
  -[LNActionOutput undoContext](self, "undoContext");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("undoContext"));

}

- (LNActionOutput)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  uint64_t v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  LNActionOutput *v26;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dialog"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("viewSnippet"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("value"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("showOutputAction"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("showOutputActionHint"));
  v20 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("showOutputActionOptions"));
  v19 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("deferred"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nextAction"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v9, CFSTR("suggestedFollowUpActions"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("activityIdentifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("confirmationActionName"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("showPrompt"));
  v14 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("confirmationConditions"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("undoContext"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v18) = v13;
  LOBYTE(v17) = v19;
  v26 = -[LNActionOutput initWithIdentifier:dialog:viewSnippet:value:showOutputAction:showOutputActionHint:showOutputActionOptions:deferred:nextAction:suggestedFollowUpActions:activityIdentifier:confirmationActionName:showPrompt:confirmationConditions:undoContext:](self, "initWithIdentifier:dialog:viewSnippet:value:showOutputAction:showOutputActionHint:showOutputActionOptions:deferred:nextAction:suggestedFollowUpActions:activityIdentifier:confirmationActionName:showPrompt:confirmationConditions:undoContext:", v21, v4, v24, v5, v23, v22, v20, v17, v6, v10, v11, v12, v18, v14, v15);

  return v26;
}

- (id)description
{
  objc_class *v3;
  void *v4;
  const __CFString *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v13;
  int64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v20 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNActionOutput identifier](self, "identifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNActionOutput dialog](self, "dialog");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNActionOutput viewSnippet](self, "viewSnippet");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNActionOutput value](self, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNActionOutput showOutputAction](self, "showOutputAction");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[LNActionOutput showOutputActionHint](self, "showOutputActionHint");
  v13 = -[LNActionOutput showOutputActionOptions](self, "showOutputActionOptions");
  v5 = CFSTR("NO");
  if (-[LNActionOutput isDeferred](self, "isDeferred"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  -[LNActionOutput nextAction](self, "nextAction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNActionOutput suggestedFollowUpActions](self, "suggestedFollowUpActions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNActionOutput activityIdentifier](self, "activityIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNActionOutput confirmationActionName](self, "confirmationActionName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[LNActionOutput shouldShowPrompt](self, "shouldShowPrompt"))
    v5 = CFSTR("YES");
  objc_msgSend(v20, "stringWithFormat:", CFSTR("<%@: %p, identifier: %@, dialog: %@, viewSnippet: %@, value: %@, showOutputAction: %@, showOutputActionHint: %ld, showOutputActionOptions: %ld, deferred: %@, nextAction: %@, suggestedFollowUpActions: %@, activityIdentifier: %@, confirmationActionName: %@, showPrompt: %@, confirmationConditions: %lu>"), v19, self, v18, v17, v16, v4, v15, v14, v13, v6, v7, v8, v9, v10, v5, -[LNActionOutput confirmationConditions](self, "confirmationConditions"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  int64_t v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  void *v26;
  void *v27;
  void *v28;

  -[LNActionOutput identifier](self, "identifier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v28, "hash");
  -[LNActionOutput identifier](self, "identifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v27, "hash") ^ v3;
  -[LNActionOutput dialog](self, "dialog");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v26, "hash");
  -[LNActionOutput viewSnippet](self, "viewSnippet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4 ^ v5 ^ objc_msgSend(v6, "hash");
  -[LNActionOutput value](self, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hash");
  -[LNActionOutput showOutputAction](self, "showOutputAction");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9 ^ objc_msgSend(v10, "hash");
  v12 = v7 ^ v11 ^ -[LNActionOutput showOutputActionHint](self, "showOutputActionHint");
  v13 = -[LNActionOutput showOutputActionOptions](self, "showOutputActionOptions");
  v14 = v13 ^ -[LNActionOutput isDeferred](self, "isDeferred");
  -[LNActionOutput nextAction](self, "nextAction");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v12 ^ v14 ^ objc_msgSend(v15, "hash");
  -[LNActionOutput suggestedFollowUpActions](self, "suggestedFollowUpActions");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "hash");
  -[LNActionOutput activityIdentifier](self, "activityIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v18 ^ objc_msgSend(v19, "hash");
  -[LNActionOutput confirmationActionName](self, "confirmationActionName");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v20 ^ objc_msgSend(v21, "hash");
  v23 = v22 ^ -[LNActionOutput shouldShowPrompt](self, "shouldShowPrompt");
  v24 = v16 ^ v23 ^ -[LNActionOutput confirmationConditions](self, "confirmationConditions");

  return v24;
}

- (BOOL)isEqual:(id)a3
{
  LNActionOutput *v4;
  LNActionOutput *v5;
  LNActionOutput *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  int v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  int v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  int v38;
  int64_t v39;
  unint64_t v40;
  _BOOL4 v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  _BOOL4 v62;
  int64_t v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  int v69;
  id v70;
  int v71;
  id v72;
  void *v73;
  int v74;
  id v75;
  void *v76;
  int v77;
  void *v78;
  void *v79;
  void *v80;
  id v81;
  void *v82;
  id v83;
  void *v84;
  id v85;

  v4 = (LNActionOutput *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_88:

      goto LABEL_89;
    }
    -[LNActionOutput identifier](self, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNActionOutput identifier](v6, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7;
    v10 = v8;
    v11 = v10;
    if (v9 == v10)
    {

    }
    else
    {
      LOBYTE(v12) = 0;
      v13 = v10;
      v14 = v9;
      if (!v9 || !v10)
        goto LABEL_86;
      v15 = objc_msgSend(v9, "isEqual:", v10);

      if (!v15)
      {
        LOBYTE(v12) = 0;
LABEL_87:

        goto LABEL_88;
      }
    }
    -[LNActionOutput dialog](self, "dialog");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNActionOutput dialog](v6, "dialog");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v16;
    v18 = v17;
    v13 = v18;
    if (v14 == v18)
    {

    }
    else
    {
      LOBYTE(v12) = 0;
      v19 = v18;
      v20 = v14;
      if (!v14 || !v18)
        goto LABEL_85;
      v21 = objc_msgSend(v14, "isEqual:", v18);

      if (!v21)
      {
        LOBYTE(v12) = 0;
LABEL_86:

        goto LABEL_87;
      }
    }
    -[LNActionOutput viewSnippet](self, "viewSnippet");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNActionOutput viewSnippet](v6, "viewSnippet");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v22;
    v24 = v23;
    v19 = v24;
    v85 = v20;
    if (v20 == v24)
    {

    }
    else
    {
      LOBYTE(v12) = 0;
      v25 = v24;
      if (!v20 || !v24)
        goto LABEL_84;
      LODWORD(v12) = objc_msgSend(v20, "isEqual:", v24);

      if (!(_DWORD)v12)
        goto LABEL_85;
    }
    v84 = v19;
    -[LNActionOutput value](self, "value");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNActionOutput value](self, "value");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v26;
    v29 = v27;
    v82 = v29;
    v83 = v28;
    if (v28 != v29)
    {
      LOBYTE(v12) = 0;
      if (v28)
      {
        v30 = v29;
        v19 = v84;
        if (v29)
        {
          v31 = objc_msgSend(v28, "isEqual:", v29);

          if (!v31)
          {
            LOBYTE(v12) = 0;
            v19 = v84;
LABEL_83:
            v25 = v82;
            v20 = v83;
LABEL_84:

            v20 = v85;
LABEL_85:

            goto LABEL_86;
          }
LABEL_30:
          -[LNActionOutput showOutputAction](self, "showOutputAction");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          -[LNActionOutput showOutputAction](self, "showOutputAction");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = v32;
          v34 = v33;
          v81 = v34;
          if (v28 != v34)
          {
            LOBYTE(v12) = 0;
            if (v28)
            {
              v35 = v34;
              v36 = v28;
              v19 = v84;
              if (v34)
              {
                v37 = v34;
                v38 = objc_msgSend(v28, "isEqual:", v34);

                if (!v38)
                {
LABEL_39:
                  LOBYTE(v12) = 0;
                  v19 = v84;
LABEL_81:
                  v30 = v81;
                  goto LABEL_82;
                }
LABEL_36:
                v39 = -[LNActionOutput showOutputActionHint](self, "showOutputActionHint");
                if (v39 != -[LNActionOutput showOutputActionHint](self, "showOutputActionHint"))
                  goto LABEL_39;
                v40 = -[LNActionOutput showOutputActionOptions](self, "showOutputActionOptions");
                if (v40 != -[LNActionOutput showOutputActionOptions](self, "showOutputActionOptions"))
                  goto LABEL_39;
                v41 = -[LNActionOutput isDeferred](self, "isDeferred");
                if (v41 != -[LNActionOutput isDeferred](v6, "isDeferred"))
                  goto LABEL_39;
                -[LNActionOutput nextAction](self, "nextAction");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                -[LNActionOutput nextAction](v6, "nextAction");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                v44 = v42;
                v45 = v43;
                v79 = v45;
                v80 = v44;
                if (v44 != v45)
                {
                  LOBYTE(v12) = 0;
                  if (v44)
                  {
                    v46 = v45;
                    v47 = v44;
                    v19 = v84;
                    if (v45)
                    {
                      v77 = objc_msgSend(v80, "isEqual:", v45);

                      if (!v77)
                      {
                        LOBYTE(v12) = 0;
                        v19 = v84;
LABEL_79:
                        v35 = v79;
                        v36 = v80;
                        goto LABEL_80;
                      }
LABEL_48:
                      -[LNActionOutput suggestedFollowUpActions](self, "suggestedFollowUpActions");
                      v48 = (void *)objc_claimAutoreleasedReturnValue();
                      -[LNActionOutput suggestedFollowUpActions](v6, "suggestedFollowUpActions");
                      v49 = (void *)objc_claimAutoreleasedReturnValue();
                      v50 = v48;
                      v51 = v49;
                      v76 = v51;
                      v78 = v50;
                      if (v50 != v51)
                      {
                        LOBYTE(v12) = 0;
                        if (v50)
                        {
                          v52 = v51;
                          v53 = v50;
                          v19 = v84;
                          if (v51)
                          {
                            v74 = objc_msgSend(v78, "isEqualToArray:", v51);

                            if (!v74)
                            {
                              LOBYTE(v12) = 0;
                              v19 = v84;
LABEL_77:
                              v46 = v76;
                              v47 = v78;
                              goto LABEL_78;
                            }
LABEL_54:
                            -[LNActionOutput activityIdentifier](self, "activityIdentifier");
                            v54 = (void *)objc_claimAutoreleasedReturnValue();
                            -[LNActionOutput activityIdentifier](v6, "activityIdentifier");
                            v55 = (void *)objc_claimAutoreleasedReturnValue();
                            v56 = v54;
                            v57 = v55;
                            v73 = v57;
                            v75 = v56;
                            if (v56 == v57)
                            {

                            }
                            else
                            {
                              LOBYTE(v12) = 0;
                              if (!v56)
                              {
                                v58 = v57;
                                goto LABEL_74;
                              }
                              v58 = v57;
                              if (!v57)
                              {
LABEL_74:

                                goto LABEL_75;
                              }
                              v71 = objc_msgSend(v56, "isEqual:", v57);

                              if (!v71)
                              {
                                LOBYTE(v12) = 0;
LABEL_75:
                                v19 = v84;
                                v52 = v73;
                                v53 = v75;
                                goto LABEL_76;
                              }
                            }
                            -[LNActionOutput confirmationActionName](self, "confirmationActionName");
                            v59 = (void *)objc_claimAutoreleasedReturnValue();
                            -[LNActionOutput confirmationActionName](v6, "confirmationActionName");
                            v60 = (void *)objc_claimAutoreleasedReturnValue();
                            v56 = v59;
                            v61 = v60;
                            v12 = v61;
                            if (v56 == v61)
                            {
                              v70 = v61;

                              v72 = v56;
LABEL_68:
                              v62 = -[LNActionOutput shouldShowPrompt](self, "shouldShowPrompt");
                              if (v62 == -[LNActionOutput shouldShowPrompt](v6, "shouldShowPrompt"))
                              {
                                v63 = -[LNActionOutput confirmationConditions](self, "confirmationConditions");
                                LOBYTE(v12) = v63 == -[LNActionOutput confirmationConditions](v6, "confirmationConditions");
                                goto LABEL_73;
                              }
LABEL_69:
                              LOBYTE(v12) = 0;
LABEL_73:
                              v58 = v70;
                              v56 = v72;
                              goto LABEL_74;
                            }
                            if (v56 && v61)
                            {
                              v69 = objc_msgSend(v56, "isEqual:", v61);
                              v70 = v12;

                              v72 = v56;
                              if (!v69)
                                goto LABEL_69;
                              goto LABEL_68;
                            }

                            v58 = v12;
                            LOBYTE(v12) = 0;
                            goto LABEL_74;
                          }
                        }
                        else
                        {
                          v52 = v51;
                          v53 = 0;
                          v19 = v84;
                        }
LABEL_76:
                        v64 = v53;

                        goto LABEL_77;
                      }

                      goto LABEL_54;
                    }
                  }
                  else
                  {
                    v46 = v45;
                    v47 = 0;
                    v19 = v84;
                  }
LABEL_78:
                  v65 = v47;

                  goto LABEL_79;
                }

                goto LABEL_48;
              }
            }
            else
            {
              v35 = v34;
              v36 = 0;
              v19 = v84;
            }
LABEL_80:
            v66 = v28;
            v67 = v36;

            v28 = v66;
            goto LABEL_81;
          }

          goto LABEL_36;
        }
      }
      else
      {
        v30 = v29;
        v19 = v84;
      }
LABEL_82:

      goto LABEL_83;
    }

    goto LABEL_30;
  }
  LOBYTE(v12) = 1;
LABEL_89:

  return (char)v12;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (LNAction)showOutputAction
{
  return self->_showOutputAction;
}

- (int64_t)showOutputActionHint
{
  return self->_showOutputActionHint;
}

- (unint64_t)showOutputActionOptions
{
  return self->_showOutputActionOptions;
}

- (LNDialog)dialog
{
  return self->_dialog;
}

- (LNViewSnippet)viewSnippet
{
  return self->_viewSnippet;
}

- (LNValue)value
{
  return self->_value;
}

- (BOOL)isDeferred
{
  return self->_deferred;
}

- (LNAction)nextAction
{
  return self->_nextAction;
}

- (NSArray)suggestedFollowUpActions
{
  return self->_suggestedFollowUpActions;
}

- (NSString)activityIdentifier
{
  return self->_activityIdentifier;
}

- (LNConfirmationActionName)confirmationActionName
{
  return self->_confirmationActionName;
}

- (BOOL)shouldShowPrompt
{
  return self->_showPrompt;
}

- (int64_t)confirmationConditions
{
  return self->_confirmationConditions;
}

- (LNUndoContext)undoContext
{
  return self->_undoContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_undoContext, 0);
  objc_storeStrong((id *)&self->_confirmationActionName, 0);
  objc_storeStrong((id *)&self->_activityIdentifier, 0);
  objc_storeStrong((id *)&self->_suggestedFollowUpActions, 0);
  objc_storeStrong((id *)&self->_nextAction, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_viewSnippet, 0);
  objc_storeStrong((id *)&self->_dialog, 0);
  objc_storeStrong((id *)&self->_showOutputAction, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LNActionOutput)initWithIdentifier:(id)a3 dialog:(id)a4 viewSnippet:(id)a5 value:(id)a6 showOutputAction:(id)a7 deferred:(BOOL)a8 nextAction:(id)a9 confirmationActionName:(id)a10
{
  uint64_t v11;

  LOBYTE(v11) = 1;
  return -[LNActionOutput initWithIdentifier:dialog:viewSnippet:value:showOutputAction:deferred:nextAction:confirmationActionName:showPrompt:](self, "initWithIdentifier:dialog:viewSnippet:value:showOutputAction:deferred:nextAction:confirmationActionName:showPrompt:", a3, a4, a5, a6, a7, a8, a9, a10, v11);
}

- (LNActionOutput)initWithIdentifier:(id)a3 dialog:(id)a4 viewSnippet:(id)a5 value:(id)a6 showOutputAction:(id)a7 deferred:(BOOL)a8 nextAction:(id)a9 confirmationActionName:(id)a10 showPrompt:(BOOL)a11
{
  uint64_t v12;
  uint64_t v13;

  LOBYTE(v13) = a11;
  LOBYTE(v12) = a8;
  return -[LNActionOutput initWithIdentifier:dialog:viewSnippet:value:showOutputAction:showOutputActionHint:deferred:nextAction:confirmationActionName:showPrompt:undoContext:](self, "initWithIdentifier:dialog:viewSnippet:value:showOutputAction:showOutputActionHint:deferred:nextAction:confirmationActionName:showPrompt:undoContext:", a3, a4, a5, a6, a7, 0, v12, a9, a10, v13, 0);
}

- (LNActionOutput)initWithIdentifier:(id)a3 dialog:(id)a4 viewSnippet:(id)a5 value:(id)a6 showOutputAction:(id)a7 showOutputActionHint:(int64_t)a8 deferred:(BOOL)a9 nextAction:(id)a10 confirmationActionName:(id)a11 showPrompt:(BOOL)a12 undoContext:(id)a13
{
  uint64_t v14;
  uint64_t v15;

  LOBYTE(v15) = a12;
  LOBYTE(v14) = a9;
  return -[LNActionOutput initWithIdentifier:dialog:viewSnippet:value:showOutputAction:showOutputActionHint:deferred:nextAction:suggestedFollowUpActions:activityIdentifier:confirmationActionName:showPrompt:confirmationConditions:undoContext:](self, "initWithIdentifier:dialog:viewSnippet:value:showOutputAction:showOutputActionHint:deferred:nextAction:suggestedFollowUpActions:activityIdentifier:confirmationActionName:showPrompt:confirmationConditions:undoContext:", a3, a4, a5, a6, a7, 0, v14, a10, 0, 0, a11, v15, 0, a13);
}

- (LNActionOutput)initWithIdentifier:(id)a3 dialog:(id)a4 viewSnippet:(id)a5 value:(id)a6 showOutputAction:(id)a7 showOutputActionHint:(int64_t)a8 deferred:(BOOL)a9 nextAction:(id)a10 activityIdentifier:(id)a11 confirmationActionName:(id)a12 showPrompt:(BOOL)a13
{
  uint64_t v14;
  uint64_t v15;

  LOBYTE(v15) = a13;
  LOBYTE(v14) = a9;
  return -[LNActionOutput initWithIdentifier:dialog:viewSnippet:value:showOutputAction:showOutputActionHint:deferred:nextAction:suggestedFollowUpActions:activityIdentifier:confirmationActionName:showPrompt:confirmationConditions:undoContext:](self, "initWithIdentifier:dialog:viewSnippet:value:showOutputAction:showOutputActionHint:deferred:nextAction:suggestedFollowUpActions:activityIdentifier:confirmationActionName:showPrompt:confirmationConditions:undoContext:", a3, a4, a5, a6, a7, 0, v14, a10, 0, 0, a12, v15, 0, 0);
}

- (LNActionOutput)initWithIdentifier:(id)a3 dialog:(id)a4 viewSnippet:(id)a5 value:(id)a6 showOutputAction:(id)a7 showOutputActionHint:(int64_t)a8 deferred:(BOOL)a9 nextAction:(id)a10 suggestedFollowUpActions:(id)a11 activityIdentifier:(id)a12 confirmationActionName:(id)a13 showPrompt:(BOOL)a14 confirmationConditions:(int64_t)a15 undoContext:(id)a16
{
  uint64_t v17;
  uint64_t v18;

  LOBYTE(v18) = a14;
  LOBYTE(v17) = a9;
  return -[LNActionOutput initWithIdentifier:dialog:viewSnippet:value:showOutputAction:showOutputActionHint:showOutputActionOptions:deferred:nextAction:suggestedFollowUpActions:activityIdentifier:confirmationActionName:showPrompt:confirmationConditions:undoContext:](self, "initWithIdentifier:dialog:viewSnippet:value:showOutputAction:showOutputActionHint:showOutputActionOptions:deferred:nextAction:suggestedFollowUpActions:activityIdentifier:confirmationActionName:showPrompt:confirmationConditions:undoContext:", a3, a4, a5, a6, a7, a8, 0, v17, a10, a11, a12, a13, v18, a15, a16);
}

@end
