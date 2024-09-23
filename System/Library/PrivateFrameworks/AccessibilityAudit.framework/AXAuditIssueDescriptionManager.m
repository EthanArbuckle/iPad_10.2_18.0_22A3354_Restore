@implementation AXAuditIssueDescriptionManager

+ (id)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__AXAuditIssueDescriptionManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken_4 != -1)
    dispatch_once(&sharedManager_onceToken_4, block);
  return (id)sharedManager_instance_4;
}

void __47__AXAuditIssueDescriptionManager_sharedManager__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedManager_instance_4;
  sharedManager_instance_4 = v0;

}

- (id)shortTitleForAuditIssue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  objc_msgSend(v4, "mlGeneratedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "mlGeneratedDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXAuditIssueDescriptionManager _locKeyWithSuffix:issueClassification:](self, "_locKeyWithSuffix:issueClassification:", CFSTR("title.formatter"), objc_msgSend(v4, "issueClassification"));
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    v9 = &stru_25071BA38;
    if (v7)
      v9 = (__CFString *)v7;
    v10 = v9;

    v11 = (void *)MEMORY[0x24BDD17C8];
    -[AXAuditIssueDescriptionManager _locStringForKey:](self, "_locStringForKey:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "stringWithFormat:", v12, v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[AXAuditIssueDescriptionManager _locStringForIssue:suffix:](self, "_locStringForIssue:suffix:", v4, CFSTR("title"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (id)longDescriptionForAuditIssue:(id)a3
{
  return -[AXAuditIssueDescriptionManager _locStringForIssue:suffix:](self, "_locStringForIssue:suffix:", a3, CFSTR("longDesc"));
}

- (id)longDescExtraInfoForAuditIssue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;

  v4 = a3;
  objc_msgSend(v4, "longDescExtraInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "longDescExtraInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", "));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[AXAuditIssueDescriptionManager _locStringForIssue:suffix:](self, "_locStringForIssue:suffix:", v4, CFSTR("longDescExtraInfo"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), v8, v7);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = v7;
    }
    v10 = v9;

  }
  else
  {
    v10 = &stru_25071BA38;
  }

  return v10;
}

- (id)suggestionDescriptionForAuditIssue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  __CFString *v20;
  __CFString *v21;
  void *v22;
  void *v23;
  id v24;
  const __CFString *v25;
  uint64_t v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "suggestedSelectorsToFix");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    -[AXAuditIssueDescriptionManager _locKeyWithSuffix:issueClassification:](self, "_locKeyWithSuffix:issueClassification:", CFSTR("suggestion.formatter"), objc_msgSend(v4, "issueClassification"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v15 = 0;
      v7 = 0;
      goto LABEL_19;
    }
    v7 = (void *)objc_opt_new();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v29 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(v7, "appendFormat:", CFSTR("%@, "), *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i));
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v10);
    }

    objc_msgSend(v7, "deleteCharactersInRange:", objc_msgSend(v7, "length") - 2, 2);
    v13 = (void *)MEMORY[0x24BDD17C8];
    -[AXAuditIssueDescriptionManager _locStringForKey:](self, "_locStringForKey:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", v14, v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
      goto LABEL_19;
LABEL_18:
    if (!objc_msgSend(v15, "isEqual:", v6))
    {
LABEL_23:
      v24 = v15;

      goto LABEL_24;
    }
LABEL_19:
    if (objc_msgSend(v4, "platform") == 1)
      v25 = CFSTR("defaultIOSSuggestion");
    else
      v25 = CFSTR("defaultMacOSSuggestion");
    -[AXAuditIssueDescriptionManager _locStringForKey:](self, "_locStringForKey:", v25);
    v26 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)v26;
    goto LABEL_23;
  }
  objc_msgSend(v4, "mlGeneratedDescription");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    -[AXAuditIssueDescriptionManager _locKeyWithSuffix:issueClassification:](self, "_locKeyWithSuffix:issueClassification:", CFSTR("suggestion"), objc_msgSend(v4, "issueClassification"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXAuditIssueDescriptionManager _locStringForKey:](self, "_locStringForKey:", v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0;
    if (!v15)
      goto LABEL_19;
    goto LABEL_18;
  }
  objc_msgSend(v4, "mlGeneratedDescription");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXAuditIssueDescriptionManager _locKeyWithSuffix:issueClassification:](self, "_locKeyWithSuffix:issueClassification:", CFSTR("suggestion.formatter"), objc_msgSend(v4, "issueClassification"));
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  v20 = &stru_25071BA38;
  if (v18)
    v20 = (__CFString *)v18;
  v21 = v20;

  v22 = (void *)MEMORY[0x24BDD17C8];
  -[AXAuditIssueDescriptionManager _locStringForKey:](self, "_locStringForKey:", v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "stringWithFormat:", v23, v17);
  v24 = (id)objc_claimAutoreleasedReturnValue();

LABEL_24:
  return v24;
}

- (id)_locStringForKey:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = _locStringForKey__onceToken_0;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&_locStringForKey__onceToken_0, &__block_literal_global_16);
  objc_msgSend((id)_locStringForKey__myBundle_0, "localizedStringForKey:value:table:", v4, v4, CFSTR("AuditIssues"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __51__AXAuditIssueDescriptionManager__locStringForKey___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_locStringForKey__myBundle_0;
  _locStringForKey__myBundle_0 = v0;

}

- (id)_locStringForIssue:(id)a3 suffix:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v6 = a4;
  v7 = a3;
  -[AXAuditIssueDescriptionManager _locKeyWithSuffix:issueClassification:](self, "_locKeyWithSuffix:issueClassification:", v6, objc_msgSend(v7, "issueClassification"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "elementDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    -[AXAuditIssueDescriptionManager _locStringForKey:](self, "_locStringForKey:", CFSTR("element"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)MEMORY[0x24BDD17C8];
  -[AXAuditIssueDescriptionManager _locStringForKey:](self, "_locStringForKey:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", v11, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "isEqual:", v8))
    v13 = 0;
  else
    v13 = v12;
  v14 = v13;

  return v14;
}

- (id)_locKeyWithSuffix:(id)a3 issueClassification:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[AXAuditIssueDescriptionManager _locKeyForAuditIssueClassification:](self, "_locKeyForAuditIssueClassification:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@"), v7, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_locKeyForAuditIssueClassification:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  +[AXAuditIssueDescriptionManager _auditIssueTypeToLocalizationKeyLookup](AXAuditIssueDescriptionManager, "_auditIssueTypeToLocalizationKeyLookup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isContrastTypeIssue:(int64_t)a3
{
  return (unint64_t)(a3 - 10) < 7;
}

+ (id)_auditIssueTypeToLocalizationKeyLookup
{
  if (_auditIssueTypeToLocalizationKeyLookup_onceToken != -1)
    dispatch_once(&_auditIssueTypeToLocalizationKeyLookup_onceToken, &__block_literal_global_35);
  return (id)_auditIssueTypeToLocalizationKeyLookup__AuditIssueTypeToLocalizationKeyLookup;
}

void __72__AXAuditIssueDescriptionManager__auditIssueTypeToLocalizationKeyLookup__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[37];
  _QWORD v3[38];

  v3[37] = *MEMORY[0x24BDAC8D0];
  v2[0] = &unk_25072A0F0;
  v2[1] = &unk_25072A108;
  v3[0] = CFSTR("contrastUnknown");
  v3[1] = CFSTR("contrastAAPass");
  v2[2] = &unk_25072A120;
  v2[3] = &unk_25072A138;
  v3[2] = CFSTR("contrastAAPartialPass");
  v3[3] = CFSTR("contrastAAFail");
  v2[4] = &unk_25072A150;
  v2[5] = &unk_25072A168;
  v3[4] = CFSTR("contrastAAAPass");
  v3[5] = CFSTR("contrastAAAPartialPass");
  v2[6] = &unk_25072A180;
  v2[7] = &unk_25072A198;
  v3[6] = CFSTR("contrastAAAFail");
  v3[7] = CFSTR("hitRegionTooSmall");
  v2[8] = &unk_25072A1B0;
  v2[9] = &unk_25072A1C8;
  v3[8] = CFSTR("elementLabelAndValueEmptyWithMLGeneratedDesc");
  v3[9] = CFSTR("elementLabelAndValueEmpty");
  v2[10] = &unk_25072A1E0;
  v2[11] = &unk_25072A1F8;
  v3[10] = CFSTR("elementLabelUsesImageName");
  v3[11] = CFSTR("elementLabelNotHumanReadable");
  v2[12] = &unk_25072A210;
  v2[13] = &unk_25072A228;
  v3[12] = CFSTR("elementMissingTraitNotEnabled");
  v3[13] = CFSTR("elementLabelDuplicateTraitString");
  v2[14] = &unk_25072A240;
  v2[15] = &unk_25072A258;
  v3[14] = CFSTR("elementValueDuplicateTraitString");
  v3[15] = CFSTR("potentialElement");
  v2[16] = &unk_25072A270;
  v2[17] = &unk_25072A288;
  v3[16] = CFSTR("potentialTextElement");
  v3[17] = CFSTR("hitTestButNotInSwipeOrder");
  v2[18] = &unk_25072A2A0;
  v2[19] = &unk_25072A2B8;
  v3[18] = CFSTR("inSwipeOrderButNotHitTested");
  v3[19] = CFSTR("swipeOrderForwardReverseMismatch");
  v2[20] = &unk_25072A2D0;
  v2[21] = &unk_25072A2E8;
  v3[20] = CFSTR("dynamicTextUnsupported");
  v3[21] = CFSTR("dynamicTextPartiallyUnsupported");
  v2[22] = &unk_25072A300;
  v2[23] = &unk_25072A318;
  v3[22] = CFSTR("textIsClipped");
  v3[23] = CFSTR("elementLabelAndValueEmpty");
  v2[24] = &unk_25072A330;
  v2[25] = &unk_25072A348;
  v3[24] = CFSTR("elementImageHasNoLabel");
  v3[25] = CFSTR("elementLabelUsesImageName");
  v2[26] = &unk_25072A360;
  v2[27] = &unk_25072A378;
  v3[26] = CFSTR("missingParent");
  v3[27] = CFSTR("notChildOfParent");
  v2[28] = &unk_25072A390;
  v2[29] = &unk_25072A3A8;
  v3[28] = CFSTR("potentialElement");
  v3[29] = CFSTR("elementLabelAndValueEmpty");
  v2[30] = &unk_25072A3C0;
  v2[31] = &unk_25072A3D8;
  v3[30] = CFSTR("elementLabelNotHumanReadable");
  v3[31] = CFSTR("elementImageHasNoLabel");
  v2[32] = &unk_25072A3F0;
  v2[33] = &unk_25072A408;
  v3[32] = CFSTR("elementLabelDuplicateRoleDescription");
  v3[33] = CFSTR("elementCouldUseTitle");
  v2[34] = &unk_25072A420;
  v2[35] = &unk_25072A438;
  v3[34] = CFSTR("actionMissing");
  v3[35] = CFSTR("unknownRole");
  v2[36] = &unk_25072A450;
  v3[36] = CFSTR("potentialTextElement");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, v2, 37);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_auditIssueTypeToLocalizationKeyLookup__AuditIssueTypeToLocalizationKeyLookup;
  _auditIssueTypeToLocalizationKeyLookup__AuditIssueTypeToLocalizationKeyLookup = v0;

}

- (id)humanReadableDescriptionForAuditIssueTestType:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = objc_msgSend(a3, "issueClassification");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[AXAuditIssueDescriptionManager auditIssueTypeToAuditTestTypeMapping](AXAuditIssueDescriptionManager, "auditIssueTypeToAuditTestTypeMapping");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[AXAuditIssueDescriptionManager humanReadableDescriptionForAuditTestType:](self, "humanReadableDescriptionForAuditTestType:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)humanReadableDescriptionForAuditTestType:(id)a3
{
  id v4;
  __CFString *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("testTypeContrast")) & 1) != 0)
  {
    v5 = CFSTR("contrast");
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("testTypeHitRegion")) & 1) != 0)
  {
    v5 = CFSTR("hitRegion");
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("testTypeSufficientElementDescription")) & 1) != 0)
  {
    v5 = CFSTR("elementDescription");
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("testTypeAction")) & 1) != 0)
  {
    v5 = CFSTR("action");
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("testTypeTrait")) & 1) != 0)
  {
    v5 = CFSTR("trait");
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("testTypeElementDetection")) & 1) != 0)
  {
    v5 = CFSTR("elementDetection");
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("testTypeSwipeOrder")) & 1) != 0)
  {
    v5 = CFSTR("swipeOrder");
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("testTypeDynamicText")) & 1) != 0)
  {
    v5 = CFSTR("dynamicText");
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("testTypeTextClipped")) & 1) != 0)
  {
    v5 = CFSTR("textClipped");
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("testTypeParentChild")))
  {
    v5 = CFSTR("parentChild");
  }
  else
  {
    v5 = 0;
  }
  if (-[__CFString length](v5, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("auditTestType.%@"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXAuditIssueDescriptionManager _locStringForKey:](self, "_locStringForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)auditIssueTypeToAuditTestTypeMapping
{
  if (auditIssueTypeToAuditTestTypeMapping_onceToken != -1)
    dispatch_once(&auditIssueTypeToAuditTestTypeMapping_onceToken, &__block_literal_global_156);
  return (id)auditIssueTypeToAuditTestTypeMapping__AuditIssueTypeToAuditTestTypeMapping;
}

void __70__AXAuditIssueDescriptionManager_auditIssueTypeToAuditTestTypeMapping__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[37];
  _QWORD v3[38];

  v3[37] = *MEMORY[0x24BDAC8D0];
  v2[0] = &unk_25072A0F0;
  v2[1] = &unk_25072A108;
  v3[0] = CFSTR("testTypeContrast");
  v3[1] = CFSTR("testTypeContrast");
  v2[2] = &unk_25072A120;
  v2[3] = &unk_25072A138;
  v3[2] = CFSTR("testTypeContrast");
  v3[3] = CFSTR("testTypeContrast");
  v2[4] = &unk_25072A150;
  v2[5] = &unk_25072A168;
  v3[4] = CFSTR("testTypeContrast");
  v3[5] = CFSTR("testTypeContrast");
  v2[6] = &unk_25072A180;
  v2[7] = &unk_25072A198;
  v3[6] = CFSTR("testTypeContrast");
  v3[7] = CFSTR("testTypeHitRegion");
  v2[8] = &unk_25072A1B0;
  v2[9] = &unk_25072A1C8;
  v3[8] = CFSTR("testTypeSufficientElementDescription");
  v3[9] = CFSTR("testTypeSufficientElementDescription");
  v2[10] = &unk_25072A1E0;
  v2[11] = &unk_25072A1F8;
  v3[10] = CFSTR("testTypeSufficientElementDescription");
  v3[11] = CFSTR("testTypeSufficientElementDescription");
  v2[12] = &unk_25072A210;
  v2[13] = &unk_25072A228;
  v3[12] = CFSTR("testTypeTrait");
  v3[13] = CFSTR("testTypeTrait");
  v2[14] = &unk_25072A240;
  v2[15] = &unk_25072A258;
  v3[14] = CFSTR("testTypeTrait");
  v3[15] = CFSTR("testTypeElementDetection");
  v2[16] = &unk_25072A270;
  v2[17] = &unk_25072A288;
  v3[16] = CFSTR("testTypeElementDetection");
  v3[17] = CFSTR("testTypeSwipeOrder");
  v2[18] = &unk_25072A2A0;
  v2[19] = &unk_25072A2B8;
  v3[18] = CFSTR("testTypeSwipeOrder");
  v3[19] = CFSTR("testTypeSwipeOrder");
  v2[20] = &unk_25072A2D0;
  v2[21] = &unk_25072A2E8;
  v3[20] = CFSTR("testTypeDynamicText");
  v3[21] = CFSTR("testTypeDynamicText");
  v2[22] = &unk_25072A300;
  v2[23] = &unk_25072A318;
  v3[22] = CFSTR("testTypeTextClipped");
  v3[23] = CFSTR("testTypeSufficientElementDescription");
  v2[24] = &unk_25072A330;
  v2[25] = &unk_25072A348;
  v3[24] = CFSTR("testTypeSufficientElementDescription");
  v3[25] = CFSTR("testTypeSufficientElementDescription");
  v2[26] = &unk_25072A360;
  v2[27] = &unk_25072A378;
  v3[26] = CFSTR("testTypeParentChild");
  v3[27] = CFSTR("testTypeParentChild");
  v2[28] = &unk_25072A390;
  v2[29] = &unk_25072A3A8;
  v3[28] = CFSTR("testTypeElementDetection");
  v3[29] = CFSTR("testTypeSufficientElementDescription");
  v2[30] = &unk_25072A3C0;
  v2[31] = &unk_25072A3D8;
  v3[30] = CFSTR("testTypeSufficientElementDescription");
  v3[31] = CFSTR("testTypeSufficientElementDescription");
  v2[32] = &unk_25072A3F0;
  v2[33] = &unk_25072A408;
  v3[32] = CFSTR("testTypeSufficientElementDescription");
  v3[33] = CFSTR("testTypeSufficientElementDescription");
  v2[34] = &unk_25072A420;
  v2[35] = &unk_25072A438;
  v3[34] = CFSTR("testTypeAction");
  v3[35] = CFSTR("testTypeSufficientElementDescription");
  v2[36] = &unk_25072A450;
  v3[36] = CFSTR("testTypeElementDetection");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, v2, 37);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)auditIssueTypeToAuditTestTypeMapping__AuditIssueTypeToAuditTestTypeMapping;
  auditIssueTypeToAuditTestTypeMapping__AuditIssueTypeToAuditTestTypeMapping = v0;

}

+ (id)allAuditIssueClassificationCodes
{
  void *v2;
  void *v3;

  objc_msgSend((id)objc_opt_class(), "_auditIssueTypeToLocalizationKeyLookup");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
