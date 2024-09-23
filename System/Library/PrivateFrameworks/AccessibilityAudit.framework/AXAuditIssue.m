@implementation AXAuditIssue

+ (Class)_auditIssueClassForType:(int64_t)a3
{
  return (Class)objc_opt_class();
}

+ (id)auditIssueForClassification:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_msgSend(objc_allocWithZone((Class)objc_msgSend(a1, "_auditIssueClassForType:")), "init");
  objc_msgSend(v4, "setIssueClassification:", a3);
  +[AXAuditIssueDescriptionManager auditIssueTypeToAuditTestTypeMapping](AXAuditIssueDescriptionManager, "auditIssueTypeToAuditTestTypeMapping");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setAuditTestType:", v7);
  return v4;
}

- (AXAuditIssue)init
{
  AXAuditIssue *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AXAuditIssue;
  result = -[AXAuditIssue init](&v3, sel_init);
  if (result)
  {
    result->_containerOrigin = (CGPoint)*MEMORY[0x24BDD1400];
    result->_fontSize = 0.0;
  }
  return result;
}

- (void)setIssueClassification:(int64_t)a3
{
  self->_issueClassification = a3;
  -[AXAuditIssue setPlatform:](self, "setPlatform:", -[AXAuditIssue _platformForClassification:](self, "_platformForClassification:"));
}

- (int64_t)_platformForClassification:(int64_t)a3
{
  return a3 < 100000;
}

- (id)foundLogMessage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
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
  double v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSRect v31;

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[AXAuditIssueDescriptionManager sharedManager](AXAuditIssueDescriptionManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXAuditIssue setDescManager:](self, "setDescManager:", v4);

  -[AXAuditIssue descManager](self, "descManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "longDescriptionForAuditIssue:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[AXAuditIssue descManager](self, "descManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "longDescExtraInfoForAuditIssue:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[AXAuditIssue auditElement](self, "auditElement");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Found Issue %li:"), -[AXAuditIssue issueClassification](self, "issueClassification"));
  -[AXAuditIssue auditTestType](self, "auditTestType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[AXAuditIssue auditTestType](self, "auditTestType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" %@"), v11);

  }
  if (objc_msgSend(v6, "length"))
    objc_msgSend(v3, "appendFormat:", CFSTR(" %@"), v6);
  if (objc_msgSend(v8, "length"))
    objc_msgSend(v3, "appendFormat:", CFSTR(" %@"), v8);
  if (v9)
    objc_msgSend(v3, "appendFormat:", CFSTR(" %@"), v9);
  -[AXAuditIssue elementRect](self, "elementRect");
  NSStringFromRect(v31);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" %@"), v12);

  -[AXAuditIssue suggestedSelectorsToFix](self, "suggestedSelectorsToFix");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "count"))
    objc_msgSend(v3, "appendFormat:", CFSTR(", Suggested selectors to fix: %@"), v13);
  -[AXAuditIssue foregroundColor](self, "foregroundColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[AXAuditIssue foregroundColor](self, "foregroundColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" ForegroundColor:%@"), v15);

  }
  -[AXAuditIssue backgroundColor](self, "backgroundColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[AXAuditIssue backgroundColor](self, "backgroundColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" BackgroundColor:%@"), v17);

  }
  -[AXAuditIssue fontSize](self, "fontSize");
  if (v18 > 0.0)
  {
    -[AXAuditIssue fontSize](self, "fontSize");
    objc_msgSend(v3, "appendFormat:", CFSTR(" FontSize:%.1f"), v19);
  }
  -[AXAuditIssue elementText](self, "elementText");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[AXAuditIssue elementText](self, "elementText");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" ElementText :%@"), v21);

  }
  -[AXAuditIssue screenGroupId](self, "screenGroupId");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[AXAuditIssue screenGroupId](self, "screenGroupId");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" ScreenGroupID :%@"), v23);

  }
  if (-[AXAuditIssue isDuplicate](self, "isDuplicate"))
    v24 = CFSTR(" Known Duplicate ");
  else
    v24 = CFSTR(" New Issue ");
  objc_msgSend(v3, "appendFormat:", v24);
  -[AXAuditIssue mlGeneratedDescription](self, "mlGeneratedDescription");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    -[AXAuditIssue mlGeneratedDescription](self, "mlGeneratedDescription");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" ML Generated Description :%@"), v26);

  }
  -[AXAuditIssue timeStamp](self, "timeStamp");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    -[AXAuditIssue timeStamp](self, "timeStamp");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" timestamp :%@"), v28);

  }
  v29 = (void *)objc_msgSend(v3, "copy");

  return v29;
}

+ (void)registerTransportableObjectWithManager:(id)a3
{
  id v3;
  AXAuditObjectTransportPropertyEntry *v4;
  AXAuditObjectTransportPropertyEntry *v5;
  AXAuditObjectTransportPropertyEntry *v6;
  AXAuditObjectTransportPropertyEntry *v7;
  AXAuditObjectTransportPropertyEntry *v8;
  AXAuditObjectTransportPropertyEntry *v9;
  AXAuditObjectTransportPropertyEntry *v10;
  AXAuditObjectTransportPropertyEntry *v11;
  AXAuditObjectTransportPropertyEntry *v12;
  AXAuditObjectTransportPropertyEntry *v13;
  AXAuditObjectTransportPropertyEntry *v14;
  AXAuditObjectTransportPropertyEntry *v15;
  AXAuditObjectTransportPropertyEntry *v16;
  AXAuditObjectTransportPropertyEntry *v17;
  AXAuditObjectTransportPropertyEntry *v18;
  AXAuditObjectTransportPropertyEntry *v19;
  AXAuditObjectTransportInfoPropertyBased *v20;

  v3 = a3;
  v20 = -[AXAuditObjectTransportInfoPropertyBased initWithClass:transportKey:]([AXAuditObjectTransportInfoPropertyBased alloc], "initWithClass:transportKey:", objc_opt_class(), CFSTR("AXAuditIssue_v1"));
  v19 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  -[AXAuditObjectTransportInfoPropertyBased addPropertyEntry:](v20, "addPropertyEntry:", v19);
  -[AXAuditObjectTransportPropertyEntry setTransportKey:](v19, "setTransportKey:", CFSTR("IssueClassificationValue_v1"));
  -[AXAuditObjectTransportPropertyEntry setLocalValueToTransportValue:](v19, "setLocalValueToTransportValue:", &__block_literal_global_12);
  -[AXAuditObjectTransportPropertyEntry setPopulateLocalObjectWithTransportValue:](v19, "setPopulateLocalObjectWithTransportValue:", &__block_literal_global_34);
  v18 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  -[AXAuditObjectTransportInfoPropertyBased addPropertyEntry:](v20, "addPropertyEntry:", v18);
  -[AXAuditObjectTransportPropertyEntry setTransportKey:](v18, "setTransportKey:", CFSTR("auditTestTypeValue_v1"));
  -[AXAuditObjectTransportPropertyEntry setLocalValueToTransportValue:](v18, "setLocalValueToTransportValue:", &__block_literal_global_38);
  -[AXAuditObjectTransportPropertyEntry setPopulateLocalObjectWithTransportValue:](v18, "setPopulateLocalObjectWithTransportValue:", &__block_literal_global_40_0);
  v17 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  -[AXAuditObjectTransportInfoPropertyBased addPropertyEntry:](v20, "addPropertyEntry:", v17);
  -[AXAuditObjectTransportPropertyEntry setTransportKey:](v17, "setTransportKey:", CFSTR("ElementRectValue_v1"));
  -[AXAuditObjectTransportPropertyEntry setLocalValueToTransportValue:](v17, "setLocalValueToTransportValue:", &__block_literal_global_45_0);
  -[AXAuditObjectTransportPropertyEntry setPopulateLocalObjectWithTransportValue:](v17, "setPopulateLocalObjectWithTransportValue:", &__block_literal_global_48_0);
  v16 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  -[AXAuditObjectTransportInfoPropertyBased addPropertyEntry:](v20, "addPropertyEntry:", v16);
  -[AXAuditObjectTransportPropertyEntry setTransportKey:](v16, "setTransportKey:", CFSTR("ElementDescriptionValue_v1"));
  -[AXAuditObjectTransportPropertyEntry setLocalValueToTransportValue:](v16, "setLocalValueToTransportValue:", &__block_literal_global_51);
  -[AXAuditObjectTransportPropertyEntry setPopulateLocalObjectWithTransportValue:](v16, "setPopulateLocalObjectWithTransportValue:", &__block_literal_global_52);
  v15 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  -[AXAuditObjectTransportInfoPropertyBased addPropertyEntry:](v20, "addPropertyEntry:", v15);
  -[AXAuditObjectTransportPropertyEntry setTransportKey:](v15, "setTransportKey:", CFSTR("ElementLongDescExtraInfo_v1"));
  -[AXAuditObjectTransportPropertyEntry setLocalValueToTransportValue:](v15, "setLocalValueToTransportValue:", &__block_literal_global_56);
  -[AXAuditObjectTransportPropertyEntry setPopulateLocalObjectWithTransportValue:](v15, "setPopulateLocalObjectWithTransportValue:", &__block_literal_global_58);
  v14 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  -[AXAuditObjectTransportInfoPropertyBased addPropertyEntry:](v20, "addPropertyEntry:", v14);
  -[AXAuditObjectTransportPropertyEntry setTransportKey:](v14, "setTransportKey:", CFSTR("AuditElementValue_v1"));
  -[AXAuditObjectTransportPropertyEntry setLocalValueToTransportValue:](v14, "setLocalValueToTransportValue:", &__block_literal_global_63);
  -[AXAuditObjectTransportPropertyEntry setPopulateLocalObjectWithTransportValue:](v14, "setPopulateLocalObjectWithTransportValue:", &__block_literal_global_65);
  v13 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  -[AXAuditObjectTransportInfoPropertyBased addPropertyEntry:](v20, "addPropertyEntry:", v13);
  -[AXAuditObjectTransportPropertyEntry setTransportKey:](v13, "setTransportKey:", CFSTR("suggestedSelectorsToFix_v1"));
  -[AXAuditObjectTransportPropertyEntry setLocalValueToTransportValue:](v13, "setLocalValueToTransportValue:", &__block_literal_global_69);
  -[AXAuditObjectTransportPropertyEntry setPopulateLocalObjectWithTransportValue:](v13, "setPopulateLocalObjectWithTransportValue:", &__block_literal_global_70);
  v4 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  -[AXAuditObjectTransportInfoPropertyBased addPropertyEntry:](v20, "addPropertyEntry:", v4);
  -[AXAuditObjectTransportPropertyEntry setTransportKey:](v4, "setTransportKey:", CFSTR("ForegroundColorValue_v1"));
  -[AXAuditObjectTransportPropertyEntry setLocalValueToTransportValue:](v4, "setLocalValueToTransportValue:", &__block_literal_global_73);
  -[AXAuditObjectTransportPropertyEntry setPopulateLocalObjectWithTransportValue:](v4, "setPopulateLocalObjectWithTransportValue:", &__block_literal_global_74);
  v5 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  -[AXAuditObjectTransportInfoPropertyBased addPropertyEntry:](v20, "addPropertyEntry:", v5);
  -[AXAuditObjectTransportPropertyEntry setTransportKey:](v5, "setTransportKey:", CFSTR("BackgroundColorValue_v1"));
  -[AXAuditObjectTransportPropertyEntry setLocalValueToTransportValue:](v5, "setLocalValueToTransportValue:", &__block_literal_global_77);
  -[AXAuditObjectTransportPropertyEntry setPopulateLocalObjectWithTransportValue:](v5, "setPopulateLocalObjectWithTransportValue:", &__block_literal_global_78);
  v6 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  -[AXAuditObjectTransportInfoPropertyBased addPropertyEntry:](v20, "addPropertyEntry:", v6);
  -[AXAuditObjectTransportPropertyEntry setTransportKey:](v6, "setTransportKey:", CFSTR("FontSizeValue_v1"));
  -[AXAuditObjectTransportPropertyEntry setLocalValueToTransportValue:](v6, "setLocalValueToTransportValue:", &__block_literal_global_81);
  -[AXAuditObjectTransportPropertyEntry setPopulateLocalObjectWithTransportValue:](v6, "setPopulateLocalObjectWithTransportValue:", &__block_literal_global_82);
  v7 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  -[AXAuditObjectTransportInfoPropertyBased addPropertyEntry:](v20, "addPropertyEntry:", v7);
  -[AXAuditObjectTransportPropertyEntry setTransportKey:](v7, "setTransportKey:", CFSTR("ElementTextValue_v1"));
  -[AXAuditObjectTransportPropertyEntry setLocalValueToTransportValue:](v7, "setLocalValueToTransportValue:", &__block_literal_global_85);
  -[AXAuditObjectTransportPropertyEntry setPopulateLocalObjectWithTransportValue:](v7, "setPopulateLocalObjectWithTransportValue:", &__block_literal_global_86);
  v8 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  -[AXAuditObjectTransportInfoPropertyBased addPropertyEntry:](v20, "addPropertyEntry:", v8);
  -[AXAuditObjectTransportPropertyEntry setTransportKey:](v8, "setTransportKey:", CFSTR("ScreenGroupIDValue_v1"));
  -[AXAuditObjectTransportPropertyEntry setLocalValueToTransportValue:](v8, "setLocalValueToTransportValue:", &__block_literal_global_89);
  -[AXAuditObjectTransportPropertyEntry setPopulateLocalObjectWithTransportValue:](v8, "setPopulateLocalObjectWithTransportValue:", &__block_literal_global_90);
  v9 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  -[AXAuditObjectTransportInfoPropertyBased addPropertyEntry:](v20, "addPropertyEntry:", v9);
  -[AXAuditObjectTransportPropertyEntry setTransportKey:](v9, "setTransportKey:", CFSTR("IsDuplicateValue_v1"));
  -[AXAuditObjectTransportPropertyEntry setLocalValueToTransportValue:](v9, "setLocalValueToTransportValue:", &__block_literal_global_93);
  -[AXAuditObjectTransportPropertyEntry setPopulateLocalObjectWithTransportValue:](v9, "setPopulateLocalObjectWithTransportValue:", &__block_literal_global_94);
  v10 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  -[AXAuditObjectTransportInfoPropertyBased addPropertyEntry:](v20, "addPropertyEntry:", v10);
  -[AXAuditObjectTransportPropertyEntry setTransportKey:](v10, "setTransportKey:", CFSTR("MLGeneratedDescriptionValue_v1"));
  -[AXAuditObjectTransportPropertyEntry setLocalValueToTransportValue:](v10, "setLocalValueToTransportValue:", &__block_literal_global_97);
  -[AXAuditObjectTransportPropertyEntry setPopulateLocalObjectWithTransportValue:](v10, "setPopulateLocalObjectWithTransportValue:", &__block_literal_global_98);
  v11 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  -[AXAuditObjectTransportInfoPropertyBased addPropertyEntry:](v20, "addPropertyEntry:", v11);
  -[AXAuditObjectTransportPropertyEntry setTransportKey:](v11, "setTransportKey:", CFSTR("ImageIdentifierValue_v1"));
  -[AXAuditObjectTransportPropertyEntry setLocalValueToTransportValue:](v11, "setLocalValueToTransportValue:", &__block_literal_global_101);
  -[AXAuditObjectTransportPropertyEntry setPopulateLocalObjectWithTransportValue:](v11, "setPopulateLocalObjectWithTransportValue:", &__block_literal_global_102);
  v12 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  -[AXAuditObjectTransportInfoPropertyBased addPropertyEntry:](v20, "addPropertyEntry:", v12);
  -[AXAuditObjectTransportPropertyEntry setTransportKey:](v12, "setTransportKey:", CFSTR("TimeStampValue_v1"));
  -[AXAuditObjectTransportPropertyEntry setLocalValueToTransportValue:](v12, "setLocalValueToTransportValue:", &__block_literal_global_105);
  -[AXAuditObjectTransportPropertyEntry setPopulateLocalObjectWithTransportValue:](v12, "setPopulateLocalObjectWithTransportValue:", &__block_literal_global_106);
  objc_msgSend(v3, "registerTransportInfoPropertyBased:", v20);

}

uint64_t __55__AXAuditIssue_registerTransportableObjectWithManager___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", objc_msgSend(a2, "issueClassification"));
}

void __55__AXAuditIssue_registerTransportableObjectWithManager___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setIssueClassification:", objc_msgSend(v4, "integerValue"));

}

uint64_t __55__AXAuditIssue_registerTransportableObjectWithManager___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "auditTestType");
}

void __55__AXAuditIssue_registerTransportableObjectWithManager___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setAuditTestType:", v4);

}

uint64_t __55__AXAuditIssue_registerTransportableObjectWithManager___block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;

  v2 = (void *)MEMORY[0x24BDD1968];
  objc_msgSend(a2, "elementRect");
  return objc_msgSend(v2, "valueWithRect:");
}

void __55__AXAuditIssue_registerTransportableObjectWithManager___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "rectValue");
    objc_msgSend(v5, "setElementRect:");
  }

}

uint64_t __55__AXAuditIssue_registerTransportableObjectWithManager___block_invoke_7(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "elementDescription");
}

void __55__AXAuditIssue_registerTransportableObjectWithManager___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setElementDescription:", v4);

}

uint64_t __55__AXAuditIssue_registerTransportableObjectWithManager___block_invoke_9(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "longDescExtraInfo");
}

void __55__AXAuditIssue_registerTransportableObjectWithManager___block_invoke_10(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setLongDescExtraInfo:", v4);

}

uint64_t __55__AXAuditIssue_registerTransportableObjectWithManager___block_invoke_11(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "auditElement");
}

void __55__AXAuditIssue_registerTransportableObjectWithManager___block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setAuditElement:", v4);

}

uint64_t __55__AXAuditIssue_registerTransportableObjectWithManager___block_invoke_13(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "suggestedSelectorsToFix");
}

void __55__AXAuditIssue_registerTransportableObjectWithManager___block_invoke_14(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setSuggestedSelectorsToFix:", v4);

}

uint64_t __55__AXAuditIssue_registerTransportableObjectWithManager___block_invoke_15(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "foregroundColor");
}

void __55__AXAuditIssue_registerTransportableObjectWithManager___block_invoke_16(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setForegroundColor:", v4);

}

uint64_t __55__AXAuditIssue_registerTransportableObjectWithManager___block_invoke_17(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "backgroundColor");
}

void __55__AXAuditIssue_registerTransportableObjectWithManager___block_invoke_18(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setBackgroundColor:", v4);

}

uint64_t __55__AXAuditIssue_registerTransportableObjectWithManager___block_invoke_19(uint64_t a1, void *a2)
{
  void *v2;

  v2 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(a2, "fontSize");
  return objc_msgSend(v2, "numberWithDouble:");
}

void __55__AXAuditIssue_registerTransportableObjectWithManager___block_invoke_20(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "doubleValue");
    objc_msgSend(v5, "setFontSize:");
  }

}

uint64_t __55__AXAuditIssue_registerTransportableObjectWithManager___block_invoke_21(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "elementText");
}

void __55__AXAuditIssue_registerTransportableObjectWithManager___block_invoke_22(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setElementText:", v4);

}

uint64_t __55__AXAuditIssue_registerTransportableObjectWithManager___block_invoke_23(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "screenGroupId");
}

void __55__AXAuditIssue_registerTransportableObjectWithManager___block_invoke_24(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setScreenGroupId:", v4);

}

uint64_t __55__AXAuditIssue_registerTransportableObjectWithManager___block_invoke_25(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(a2, "isDuplicate"));
}

void __55__AXAuditIssue_registerTransportableObjectWithManager___block_invoke_26(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setIsDuplicate:", objc_msgSend(v4, "BOOLValue"));

}

uint64_t __55__AXAuditIssue_registerTransportableObjectWithManager___block_invoke_27(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "mlGeneratedDescription");
}

void __55__AXAuditIssue_registerTransportableObjectWithManager___block_invoke_28(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setMlGeneratedDescription:", v4);

}

uint64_t __55__AXAuditIssue_registerTransportableObjectWithManager___block_invoke_29(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "imageIdentifier");
}

void __55__AXAuditIssue_registerTransportableObjectWithManager___block_invoke_30(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setImageIdentifier:", v4);

}

uint64_t __55__AXAuditIssue_registerTransportableObjectWithManager___block_invoke_31(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "timeStamp");
}

void __55__AXAuditIssue_registerTransportableObjectWithManager___block_invoke_32(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setTimeStamp:", v4);

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setIssueClassification:", -[AXAuditIssue issueClassification](self, "issueClassification"));
  -[AXAuditIssue auditTestType](self, "auditTestType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAuditTestType:", v5);

  -[AXAuditIssue auditElement](self, "auditElement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAuditElement:", v6);

  -[AXAuditIssue elementDescription](self, "elementDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setElementDescription:", v7);

  -[AXAuditIssue elementRect](self, "elementRect");
  objc_msgSend(v4, "setElementRect:");
  -[AXAuditIssue suggestedSelectorsToFix](self, "suggestedSelectorsToFix");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSuggestedSelectorsToFix:", v8);

  -[AXAuditIssue longDescExtraInfo](self, "longDescExtraInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLongDescExtraInfo:", v9);

  -[AXAuditIssue foregroundColor](self, "foregroundColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setForegroundColor:", v10);

  -[AXAuditIssue backgroundColor](self, "backgroundColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v11);

  -[AXAuditIssue fontSize](self, "fontSize");
  objc_msgSend(v4, "setFontSize:");
  -[AXAuditIssue elementText](self, "elementText");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setElementText:", v12);

  -[AXAuditIssue screenGroupId](self, "screenGroupId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setScreenGroupId:", v13);

  objc_msgSend(v4, "setIsDuplicate:", -[AXAuditIssue isDuplicate](self, "isDuplicate"));
  -[AXAuditIssue mlGeneratedDescription](self, "mlGeneratedDescription");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMlGeneratedDescription:", v14);

  -[AXAuditIssue imageIdentifier](self, "imageIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImageIdentifier:", v15);

  -[AXAuditIssue timeStamp](self, "timeStamp");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTimeStamp:", v16);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  AXAuditIssue *v4;
  AXAuditIssue *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BOOL4 v14;
  char v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  double v46;
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
  int v57;
  int v58;
  int v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  __int128 v68;
  NSSize v69;
  NSSize v70;
  NSRect v71;
  NSRect v72;

  v4 = (AXAuditIssue *)a3;
  if (self == v4)
  {
    v15 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[AXAuditIssue issueClassification](v5, "issueClassification");
      if (v6 != -[AXAuditIssue issueClassification](self, "issueClassification"))
      {
        v15 = 0;
LABEL_21:

        goto LABEL_22;
      }
      -[AXAuditIssue elementDescription](self, "elementDescription");
      v7 = objc_claimAutoreleasedReturnValue();
      -[AXAuditIssue elementDescription](v5, "elementDescription");
      v8 = objc_claimAutoreleasedReturnValue();
      -[AXAuditIssue elementText](self, "elementText");
      v9 = objc_claimAutoreleasedReturnValue();
      -[AXAuditIssue elementText](v5, "elementText");
      v10 = objc_claimAutoreleasedReturnValue();
      -[AXAuditIssue screenGroupId](self, "screenGroupId");
      v11 = objc_claimAutoreleasedReturnValue();
      -[AXAuditIssue screenGroupId](v5, "screenGroupId");
      v67 = objc_claimAutoreleasedReturnValue();
      -[AXAuditIssue mlGeneratedDescription](self, "mlGeneratedDescription");
      v12 = objc_claimAutoreleasedReturnValue();
      -[AXAuditIssue auditTestType](self, "auditTestType");
      *((_QWORD *)&v68 + 1) = objc_claimAutoreleasedReturnValue();
      -[AXAuditIssue auditTestType](v5, "auditTestType");
      *(_QWORD *)&v68 = objc_claimAutoreleasedReturnValue();
      -[AXAuditIssue mlGeneratedDescription](v5, "mlGeneratedDescription");
      v13 = objc_claimAutoreleasedReturnValue();
      -[AXAuditIssue isDuplicate](self, "isDuplicate");
      -[AXAuditIssue isDuplicate](v5, "isDuplicate");
      if (v7 | v8 && !objc_msgSend((id)v7, "isEqual:", v8)
        || v9 | v10 && !objc_msgSend((id)v9, "isEqual:", v10)
        || v12 | v13 && !objc_msgSend((id)v12, "isEqual:", v13)
        || v68 != 0 && !objc_msgSend(*((id *)&v68 + 1), "isEqual:", (_QWORD)v68)
        || v11 | v67 && !objc_msgSend((id)v11, "isEqualToString:", v67))
      {
        v15 = 0;
        goto LABEL_20;
      }
      v66 = v11;
      v14 = -[AXAuditIssue isDuplicate](self, "isDuplicate");
      if (v14 != -[AXAuditIssue isDuplicate](v5, "isDuplicate"))
      {
        v15 = 0;
        v11 = v66;
LABEL_20:

        goto LABEL_21;
      }
      v64 = v12;
      -[AXAuditIssue auditElement](self, "auditElement");
      v17 = objc_claimAutoreleasedReturnValue();
      -[AXAuditIssue auditElement](v5, "auditElement");
      v18 = objc_claimAutoreleasedReturnValue();
      v65 = (void *)v17;
      v19 = v17 | v18;
      v11 = v66;
      if (v19 && !objc_msgSend(v65, "isEqual:", v18))
      {
        v15 = 0;
LABEL_57:

        v12 = v64;
        goto LABEL_20;
      }
      v62 = v18;
      -[AXAuditIssue elementRect](self, "elementRect");
      v21 = v20;
      v23 = v22;
      v25 = v24;
      v27 = v26;
      -[AXAuditIssue elementRect](v5, "elementRect");
      v72.origin.x = v28;
      v72.origin.y = v29;
      v31 = v30;
      v33 = v32;
      v71.origin.x = v21;
      v71.origin.y = v23;
      v71.size.width = v25;
      v71.size.height = v27;
      v72.size.width = v31;
      v72.size.height = v33;
      if (!NSEqualRects(v71, v72))
      {
        v69.width = v25;
        v69.height = v27;
        v70.width = v31;
        v70.height = v33;
        if (!NSEqualSizes(v69, v70)
          || !-[AXAuditIssue _isSameRelativeLocationAsAuditIssue:](self, "_isSameRelativeLocationAsAuditIssue:", v5))
        {
          v15 = 0;
LABEL_56:
          v18 = v62;
          goto LABEL_57;
        }
      }
      -[AXAuditIssue suggestedSelectorsToFix](self, "suggestedSelectorsToFix");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXAuditIssue suggestedSelectorsToFix](v5, "suggestedSelectorsToFix");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = v34;
      if ((objc_msgSend(v34, "count") || objc_msgSend(v63, "count"))
        && !objc_msgSend(v34, "isEqual:", v63))
      {
        goto LABEL_54;
      }
      -[AXAuditIssue longDescExtraInfo](self, "longDescExtraInfo");
      v35 = objc_claimAutoreleasedReturnValue();
      if (v35
        || (-[AXAuditIssue longDescExtraInfo](v5, "longDescExtraInfo"),
            (v51 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[AXAuditIssue longDescExtraInfo](self, "longDescExtraInfo", v51);
        v54 = (void *)v35;
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXAuditIssue longDescExtraInfo](v5, "longDescExtraInfo");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = objc_msgSend(v36, "isEqualToArray:", v37);

        if (v54)
        {

          v11 = v66;
          if (!v57)
            goto LABEL_54;
        }
        else
        {

          v11 = v66;
          if ((v57 & 1) == 0)
            goto LABEL_54;
        }
      }
      -[AXAuditIssue foregroundColor](self, "foregroundColor", v51);
      v38 = objc_claimAutoreleasedReturnValue();
      if (v38
        || (-[AXAuditIssue foregroundColor](v5, "foregroundColor"),
            (v52 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[AXAuditIssue foregroundColor](self, "foregroundColor", v52);
        v55 = (void *)v38;
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXAuditIssue foregroundColor](v5, "foregroundColor");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = objc_msgSend(v39, "isEqualToString:", v40);

        if (v55)
        {

          v11 = v66;
          if (!v58)
            goto LABEL_54;
        }
        else
        {

          v11 = v66;
          if ((v58 & 1) == 0)
            goto LABEL_54;
        }
      }
      -[AXAuditIssue backgroundColor](self, "backgroundColor", v52);
      v41 = objc_claimAutoreleasedReturnValue();
      if (v41
        || (-[AXAuditIssue backgroundColor](v5, "backgroundColor"),
            (v53 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[AXAuditIssue backgroundColor](self, "backgroundColor", v53);
        v56 = (void *)v41;
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXAuditIssue backgroundColor](v5, "backgroundColor");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = objc_msgSend(v42, "isEqualToString:", v43);

        if (v56)
        {

          v11 = v66;
          if (!v59)
            goto LABEL_54;
        }
        else
        {

          v11 = v66;
          if ((v59 & 1) == 0)
            goto LABEL_54;
        }
      }
      -[AXAuditIssue fontSize](self, "fontSize", v53);
      v45 = v44;
      -[AXAuditIssue fontSize](v5, "fontSize");
      if (vabdd_f64(v45, v46) < 0.000001)
      {
        -[AXAuditIssue imageIdentifier](self, "imageIdentifier");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXAuditIssue imageIdentifier](v5, "imageIdentifier");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = objc_msgSend(v47, "compare:", v48);

        if (v60)
        {
          v15 = 0;
        }
        else
        {
          -[AXAuditIssue timeStamp](self, "timeStamp");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          -[AXAuditIssue timeStamp](v5, "timeStamp");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v49, "isEqualToString:", v50);

        }
        v11 = v66;
        goto LABEL_55;
      }
LABEL_54:
      v15 = 0;
LABEL_55:

      goto LABEL_56;
    }
    v15 = 0;
  }
LABEL_22:

  return v15;
}

- (BOOL)_isSameRelativeLocationAsAuditIssue:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;

  v4 = a3;
  -[AXAuditIssue containerOrigin](self, "containerOrigin");
  v6 = v5;
  v8 = v7;
  objc_msgSend(v4, "containerOrigin");
  v10 = v9;
  v12 = v11;
  -[AXAuditIssue elementRect](self, "elementRect");
  v14 = v13;
  v16 = v15;
  objc_msgSend(v4, "elementRect");
  v18 = v17;
  v20 = v19;

  return vabdd_f64(v14 - v6, v18 - v10) < 0.100000001 && vabdd_f64(v16 - v8, v20 - v12) < 0.100000001;
}

- (unint64_t)hash
{
  double v3;
  double v4;
  double v5;
  double v6;
  unint64_t v7;
  int64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;

  -[AXAuditIssue elementRect](self, "elementRect");
  v7 = (unint64_t)(v6 + v5 + v3 + v4);
  v8 = -[AXAuditIssue issueClassification](self, "issueClassification");
  -[AXAuditIssue auditElement](self, "auditElement");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hash");
  -[AXAuditIssue elementDescription](self, "elementDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10 ^ v8 ^ objc_msgSend(v11, "hash") ^ v7;

  return v12;
}

- (int64_t)compare:(id)a3
{
  id v4;
  int64_t v5;
  uint64_t v6;

  v4 = a3;
  v5 = -[AXAuditIssue issueClassification](self, "issueClassification");
  v6 = objc_msgSend(v4, "issueClassification");

  if (v5 < v6)
    return -1;
  else
    return v5 > v6;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AXAuditIssue;
  -[AXAuditIssue description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXAuditIssue foundLogMessage](self, "foundLogMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (int64_t)issueClassification
{
  return self->_issueClassification;
}

- (NSString)auditTestType
{
  return self->_auditTestType;
}

- (void)setAuditTestType:(id)a3
{
  objc_storeStrong((id *)&self->_auditTestType, a3);
}

- (AXAuditElement)auditElement
{
  return self->_auditElement;
}

- (void)setAuditElement:(id)a3
{
  objc_storeStrong((id *)&self->_auditElement, a3);
}

- (NSString)elementDescription
{
  return self->_elementDescription;
}

- (void)setElementDescription:(id)a3
{
  objc_storeStrong((id *)&self->_elementDescription, a3);
}

- (NSArray)longDescExtraInfo
{
  return self->_longDescExtraInfo;
}

- (void)setLongDescExtraInfo:(id)a3
{
  objc_storeStrong((id *)&self->_longDescExtraInfo, a3);
}

- (CGRect)elementRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_elementRect.origin.x;
  y = self->_elementRect.origin.y;
  width = self->_elementRect.size.width;
  height = self->_elementRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setElementRect:(CGRect)a3
{
  self->_elementRect = a3;
}

- (CGPoint)containerOrigin
{
  double x;
  double y;
  CGPoint result;

  x = self->_containerOrigin.x;
  y = self->_containerOrigin.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setContainerOrigin:(CGPoint)a3
{
  self->_containerOrigin = a3;
}

- (NSString)elementText
{
  return self->_elementText;
}

- (void)setElementText:(id)a3
{
  objc_storeStrong((id *)&self->_elementText, a3);
}

- (NSString)mlGeneratedDescription
{
  return self->_mlGeneratedDescription;
}

- (void)setMlGeneratedDescription:(id)a3
{
  objc_storeStrong((id *)&self->_mlGeneratedDescription, a3);
}

- (BOOL)isDuplicate
{
  return self->_isDuplicate;
}

- (void)setIsDuplicate:(BOOL)a3
{
  self->_isDuplicate = a3;
}

- (NSString)screenGroupId
{
  return self->_screenGroupId;
}

- (void)setScreenGroupId:(id)a3
{
  objc_storeStrong((id *)&self->_screenGroupId, a3);
}

- (NSString)foregroundColor
{
  return self->_foregroundColor;
}

- (void)setForegroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_foregroundColor, a3);
}

- (NSString)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (double)fontSize
{
  return self->_fontSize;
}

- (void)setFontSize:(double)a3
{
  self->_fontSize = a3;
}

- (NSString)timeStamp
{
  return self->_timeStamp;
}

- (void)setTimeStamp:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (int64_t)platform
{
  return self->_platform;
}

- (void)setPlatform:(int64_t)a3
{
  self->_platform = a3;
}

- (NSArray)suggestedSelectorsToFix
{
  return self->_suggestedSelectorsToFix;
}

- (void)setSuggestedSelectorsToFix:(id)a3
{
  objc_storeStrong((id *)&self->_suggestedSelectorsToFix, a3);
}

- (NSNumber)imageIdentifier
{
  return self->_imageIdentifier;
}

- (void)setImageIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_imageIdentifier, a3);
}

- (AXAuditIssueDescriptionManager)descManager
{
  return self->_descManager;
}

- (void)setDescManager:(id)a3
{
  objc_storeStrong((id *)&self->_descManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descManager, 0);
  objc_storeStrong((id *)&self->_imageIdentifier, 0);
  objc_storeStrong((id *)&self->_suggestedSelectorsToFix, 0);
  objc_storeStrong((id *)&self->_timeStamp, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_foregroundColor, 0);
  objc_storeStrong((id *)&self->_screenGroupId, 0);
  objc_storeStrong((id *)&self->_mlGeneratedDescription, 0);
  objc_storeStrong((id *)&self->_elementText, 0);
  objc_storeStrong((id *)&self->_longDescExtraInfo, 0);
  objc_storeStrong((id *)&self->_elementDescription, 0);
  objc_storeStrong((id *)&self->_auditElement, 0);
  objc_storeStrong((id *)&self->_auditTestType, 0);
}

@end
