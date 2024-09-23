@implementation AMSEngagementMessageRequest

- (AMSEngagementMessageRequest)initWithJSObject:(id)a3
{
  id v4;
  AMSEngagementMessageRequest *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  AMSEngagementMessageRequest *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  void *v46;
  id v47;
  void *v48;
  id v49;
  id v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  void *v55;
  id v56;
  void *v57;
  id v58;
  void *v59;
  id v60;
  NSDictionary *v61;
  NSDictionary *clickstreamMetricsEvent;
  void *v63;
  id v64;
  id v65;
  AMSEngagementRequest *v66;
  AMSEngagementRequest *engagementRequest;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  NSURL *iconURL;
  AMSMetricsEvent *v76;
  AMSMetricsEvent *metricsEvent;
  void *v78;
  id v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t i;
  AMSEngagementMessageAction *v84;
  uint64_t v85;
  NSArray *actions;
  AMSEngagementMessageAction *v87;
  AMSEngagementMessageRequest *v88;
  id v90;
  id v91;
  id v92;
  id v93;
  id v94;
  id v95;
  id v96;
  id v97;
  id v98;
  id obj;
  id v100;
  id v101;
  id v102;
  id v103;
  id v104;
  id v105;
  id v106;
  id v107;
  id v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  objc_super v113;
  _BYTE v114[128];
  const __CFString *v115;
  _QWORD v116[3];

  v116[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v113.receiver = self;
  v113.super_class = (Class)AMSEngagementMessageRequest;
  v5 = -[AMSEngagementMessageRequest init](&v113, sel_init);

  if (!v5)
  {
LABEL_104:
    v88 = v5;
    goto LABEL_105;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("action"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (objc_msgSend(v8, "isEqualToString:", CFSTR("present")))
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("content"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
    v12 = v10;

    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("appearance"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;
    v90 = v14;
    v15 = v14;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("debugInfo"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v17 = v16;
    else
      v17 = 0;
    obj = v17;
    v18 = v17;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("engagementRequest"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v20 = v19;
    else
      v20 = 0;
    v21 = v20;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("messageIdentifier"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v23 = v22;
    else
      v23 = 0;
    v94 = v23;
    v97 = v23;

    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("iconURL"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v25 = v24;
    else
      v25 = 0;
    v101 = v25;

    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("identifier"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v27 = v26;
    else
      v27 = 0;
    v92 = v27;
    v96 = v27;

    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("metricsEvent"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v29 = v28;
    else
      v29 = 0;
    v100 = v29;

    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("actions"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v31 = v30;
    else
      v31 = 0;
    v107 = v31;

    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("defaultAction"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v33 = v32;
    else
      v33 = 0;
    v105 = v33;

    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("style"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v35 = v34;
    else
      v35 = 0;
    v104 = v35;

    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("subtitle"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v37 = v36;
    else
      v37 = 0;
    v108 = v37;

    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("title"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v39 = v15;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v40 = v38;
    else
      v40 = 0;
    v41 = v40;

    v106 = v41;
    if (v41)
    {
      v103 = 0;
      v42 = v39;
    }
    else
    {
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("title"), v90, v92, v94, v96, v97);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v44 = v43;
      else
        v44 = 0;
      v45 = v44;

      objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("value"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v47 = v46;
      else
        v47 = 0;
      v42 = v39;
      v106 = v47;

      objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("accessibilityText"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v49 = v48;
      else
        v49 = 0;
      v103 = v49;

    }
    v98 = v21;
    if (v108)
    {
      v102 = 0;
    }
    else
    {
      v50 = v18;
      v51 = v42;
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("subtitle"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v53 = v52;
      else
        v53 = 0;
      v54 = v53;

      objc_msgSend(v54, "objectForKeyedSubscript:", CFSTR("value"));
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v56 = v55;
      else
        v56 = 0;
      v42 = v51;
      v108 = v56;

      objc_msgSend(v54, "objectForKeyedSubscript:", CFSTR("accessibilityText"));
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v18 = v50;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v58 = v57;
      else
        v58 = 0;
      v21 = v98;
      v102 = v58;

    }
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("clickstreamMetricsEvent"), v90);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v60 = v59;
    else
      v60 = 0;
    v61 = (NSDictionary *)v60;

    clickstreamMetricsEvent = v5->_clickstreamMetricsEvent;
    v5->_clickstreamMetricsEvent = v61;

    objc_storeStrong((id *)&v5->_debugInfo, obj);
    objc_storeStrong((id *)&v5->_messageIdentifier, v94);
    v5->_presentationAction = 1;
    objc_storeStrong((id *)&v5->_title, v106);
    objc_storeStrong((id *)&v5->_titleAccessibilityLabel, v103);
    objc_storeStrong((id *)&v5->_subtitle, v108);
    objc_storeStrong((id *)&v5->_subtitleAccessibilityLabel, v102);
    objc_storeStrong((id *)&v5->_identifier, v92);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isCached"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v64 = v63;
    else
      v64 = 0;
    v65 = v64;

    v5->_isMessageCached = objc_msgSend(v65, "BOOLValue");
    v66 = -[AMSEngagementRequest initWithJSONDictionary:]([AMSEngagementRequest alloc], "initWithJSONDictionary:", v21);
    engagementRequest = v5->_engagementRequest;
    v5->_engagementRequest = v66;

    if (v18)
    {
      -[AMSEngagementRequest clientData](v5->_engagementRequest, "clientData");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v115 = CFSTR("debugInfo");
      v116[0] = v18;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v116, &v115, 1);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "ams_dictionaryByAddingEntriesFromDictionary:", v69);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSEngagementRequest setClientData:](v5->_engagementRequest, "setClientData:", v70);

    }
    if (objc_msgSend(v42, "count"))
      objc_storeStrong((id *)&v5->_appearanceInfo, v91);
    v72 = v100;
    v71 = v101;
    v73 = v105;
    if (v101)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v101);
      v74 = objc_claimAutoreleasedReturnValue();
      iconURL = v5->_iconURL;
      v5->_iconURL = (NSURL *)v74;

    }
    if (v104)
      v5->_style = objc_msgSend(v104, "integerValue");
    if (v100)
    {
      v76 = -[AMSMetricsEvent initWithUnderlyingDictionary:]([AMSMetricsEvent alloc], "initWithUnderlyingDictionary:", v100);
      metricsEvent = v5->_metricsEvent;
      v5->_metricsEvent = v76;

    }
    if (v107)
    {
      v93 = v42;
      v95 = v8;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v109 = 0u;
      v110 = 0u;
      v111 = 0u;
      v112 = 0u;
      v79 = v107;
      v80 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v109, v114, 16);
      if (v80)
      {
        v81 = v80;
        v82 = *(_QWORD *)v110;
        do
        {
          for (i = 0; i != v81; ++i)
          {
            if (*(_QWORD *)v110 != v82)
              objc_enumerationMutation(v79);
            v84 = -[AMSEngagementMessageAction initWithJSObject:]([AMSEngagementMessageAction alloc], "initWithJSObject:", *(_QWORD *)(*((_QWORD *)&v109 + 1) + 8 * i));
            if (v84)
              objc_msgSend(v78, "addObject:", v84);

          }
          v81 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v109, v114, 16);
        }
        while (v81);
      }

      if (objc_msgSend(v78, "count"))
      {
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v78);
        v85 = objc_claimAutoreleasedReturnValue();
        actions = v5->_actions;
        v5->_actions = (NSArray *)v85;

      }
      v42 = v93;
      v8 = v95;
      v21 = v98;
      v72 = v100;
      v71 = v101;
      v73 = v105;
    }
    if (v73)
    {
      v87 = -[AMSEngagementMessageAction initWithJSObject:]([AMSEngagementMessageAction alloc], "initWithJSObject:", v73);
      if (v87)
        objc_storeStrong((id *)&v5->_defaultAction, v87);

      v73 = v105;
    }

    goto LABEL_104;
  }
  v11 = v5;

LABEL_105:
  return v5;
}

- (id)makeDialogRequest
{
  AMSDialogRequest *v3;
  void *v4;
  void *v5;
  void *v6;
  AMSDialogRequest *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  const __CFString *v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  if (-[AMSEngagementMessageRequest presentationAction](self, "presentationAction"))
  {
    v3 = [AMSDialogRequest alloc];
    -[AMSEngagementMessageRequest title](self, "title");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSEngagementMessageRequest subtitle](self, "subtitle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSEngagementMessageRequest appearanceInfo](self, "appearanceInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[AMSDialogRequest initWithTitle:message:appearanceInfo:](v3, "initWithTitle:message:appearanceInfo:", v4, v5, v6);

    -[AMSEngagementMessageRequest debugInfo](self, "debugInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[AMSDialogRequest userInfo](v7, "userInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = CFSTR("debugInfo");
      -[AMSEngagementMessageRequest debugInfo](self, "debugInfo");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v36[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "ams_dictionaryByAddingEntriesFromDictionary:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSDialogRequest setUserInfo:](v7, "setUserInfo:", v12);

    }
    -[AMSEngagementMessageRequest titleAccessibilityLabel](self, "titleAccessibilityLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSDialogRequest setTitleAccessibilityLabel:](v7, "setTitleAccessibilityLabel:", v13);

    -[AMSEngagementMessageRequest subtitleAccessibilityLabel](self, "subtitleAccessibilityLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSDialogRequest setMessageAccessibilityLabel:](v7, "setMessageAccessibilityLabel:", v14);

    -[AMSEngagementMessageRequest iconURL](self, "iconURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSDialogRequest setIconURL:](v7, "setIconURL:", v15);

    -[AMSDialogRequest setStyle:](v7, "setStyle:", -[AMSEngagementMessageRequest style](self, "style"));
    -[AMSEngagementMessageRequest clickstreamMetricsEvent](self, "clickstreamMetricsEvent");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSDialogRequest setClickstreamMetricsEvent:](v7, "setClickstreamMetricsEvent:", v16);

    -[AMSEngagementMessageRequest metricsEvent](self, "metricsEvent");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSDialogRequest setMetricsEvent:](v7, "setMetricsEvent:", v17);

    -[AMSEngagementMessageRequest identifier](self, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSDialogRequest setIdentifier:](v7, "setIdentifier:", v18);

    -[AMSEngagementMessageRequest actions](self, "actions");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      -[AMSEngagementMessageRequest actions](self, "actions", 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v31;
        do
        {
          v24 = 0;
          do
          {
            if (*(_QWORD *)v31 != v23)
              objc_enumerationMutation(v20);
            objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v24), "makeDialogAction");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            if (v25)
              -[AMSDialogRequest addButtonAction:](v7, "addButtonAction:", v25);

            ++v24;
          }
          while (v22 != v24);
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        }
        while (v22);
      }

    }
    -[AMSEngagementMessageRequest defaultAction](self, "defaultAction");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      -[AMSEngagementMessageRequest defaultAction](self, "defaultAction");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "makeDialogAction");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      -[AMSDialogRequest setDefaultAction:](v7, "setDefaultAction:", v28);
    }
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (NSArray)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
  objc_storeStrong((id *)&self->_actions, a3);
}

- (NSDictionary)appearanceInfo
{
  return self->_appearanceInfo;
}

- (void)setAppearanceInfo:(id)a3
{
  objc_storeStrong((id *)&self->_appearanceInfo, a3);
}

- (NSDictionary)clickstreamMetricsEvent
{
  return self->_clickstreamMetricsEvent;
}

- (void)setClickstreamMetricsEvent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (AMSEngagementMessageAction)defaultAction
{
  return self->_defaultAction;
}

- (void)setDefaultAction:(id)a3
{
  objc_storeStrong((id *)&self->_defaultAction, a3);
}

- (AMSEngagementRequest)engagementRequest
{
  return self->_engagementRequest;
}

- (void)setEngagementRequest:(id)a3
{
  objc_storeStrong((id *)&self->_engagementRequest, a3);
}

- (NSURL)iconURL
{
  return self->_iconURL;
}

- (void)setIconURL:(id)a3
{
  objc_storeStrong((id *)&self->_iconURL, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)isMessageCached
{
  return self->_isMessageCached;
}

- (void)setIsMessageCached:(BOOL)a3
{
  self->_isMessageCached = a3;
}

- (NSString)messageIdentifier
{
  return self->_messageIdentifier;
}

- (void)setMessageIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (AMSMetricsEvent)metricsEvent
{
  return self->_metricsEvent;
}

- (void)setMetricsEvent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (int64_t)presentationAction
{
  return self->_presentationAction;
}

- (void)setPresentationAction:(int64_t)a3
{
  self->_presentationAction = a3;
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)subtitleAccessibilityLabel
{
  return self->_subtitleAccessibilityLabel;
}

- (void)setSubtitleAccessibilityLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)titleAccessibilityLabel
{
  return self->_titleAccessibilityLabel;
}

- (void)setTitleAccessibilityLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSArray)debugInfo
{
  return self->_debugInfo;
}

- (void)setDebugInfo:(id)a3
{
  objc_storeStrong((id *)&self->_debugInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugInfo, 0);
  objc_storeStrong((id *)&self->_titleAccessibilityLabel, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_subtitleAccessibilityLabel, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_metricsEvent, 0);
  objc_storeStrong((id *)&self->_messageIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_iconURL, 0);
  objc_storeStrong((id *)&self->_engagementRequest, 0);
  objc_storeStrong((id *)&self->_defaultAction, 0);
  objc_storeStrong((id *)&self->_clickstreamMetricsEvent, 0);
  objc_storeStrong((id *)&self->_appearanceInfo, 0);
  objc_storeStrong((id *)&self->_actions, 0);
}

@end
