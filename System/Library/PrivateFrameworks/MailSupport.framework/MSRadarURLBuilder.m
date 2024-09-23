@implementation MSRadarURLBuilder

- (MSRadarURLBuilder)init
{
  MSRadarURLBuilder *v2;
  MSRadarURLBuilder *v3;
  NSArray *extensionIdentifiers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MSRadarURLBuilder;
  v2 = -[MSRadarURLBuilder init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    extensionIdentifiers = v2->_extensionIdentifiers;
    v2->_extensionIdentifiers = (NSArray *)&unk_1E7177BC0;

    v3->_appendSysdiagnoseHowTo = 0;
    *(_WORD *)&v3->_prependSystemVersionToTitle = 257;
  }
  return v3;
}

+ (BOOL)canOpenRadar
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setScheme:", CFSTR("tap-to-radar"));
  objc_msgSend(v2, "setHost:", CFSTR("new"));
  objc_msgSend(v2, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class sharedApplication](getUIApplicationClass_0(), "sharedApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "canOpenURL:", v3);

  return v5;
}

+ (id)stringFromRadarClassification:(int64_t)a3
{
  if ((unint64_t)a3 > 9)
    return &stru_1E7171180;
  else
    return off_1E716E2D0[a3];
}

+ (id)stringFromRadarReproducibility:(int64_t)a3
{
  if ((unint64_t)a3 > 5)
    return &stru_1E7171180;
  else
    return off_1E716E320[a3];
}

+ (id)_componentInfoDictionaryFromComponent:(int64_t)a3
{
  void *v3;
  _QWORD v5[3];
  _QWORD v6[3];
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  if (a3 == 27)
  {
    v7[0] = CFSTR("sRadarComponentIDKey");
    v7[1] = CFSTR("sRadarComponentNameKey");
    v8[0] = CFSTR("462765");
    v8[1] = CFSTR("Mail MIME");
    v7[2] = CFSTR("sRadarComponentVersionKey");
    v8[2] = CFSTR("iOS");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3 == 28)
  {
    objc_msgSend(a1, "_blackPearlComponentInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5[0] = CFSTR("sRadarComponentNameKey");
    v5[1] = CFSTR("sRadarComponentIDKey");
    v6[0] = CFSTR("Mail (New Bugs)");
    v6[1] = CFSTR("224209");
    v5[2] = CFSTR("sRadarComponentVersionKey");
    v6[2] = CFSTR("iOS");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

+ (id)_blackPearlComponentInfo
{
  _QWORD v3[3];
  _QWORD v4[4];

  v4[3] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("sRadarComponentNameKey");
  v3[1] = CFSTR("sRadarComponentIDKey");
  v4[0] = CFSTR("Black Pearl");
  v4[1] = CFSTR("1596667");
  v3[2] = CFSTR("sRadarComponentVersionKey");
  v4[2] = CFSTR("Feedback");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)componentNameFromRadarComponent:(int64_t)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "_componentInfoDictionaryFromComponent:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("sRadarComponentNameKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)componentIDFromRadarComponent:(int64_t)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "_componentInfoDictionaryFromComponent:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("sRadarComponentIDKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)autoDiagnosticsString
{
  int64_t v2;

  v2 = -[MSRadarURLBuilder autoDiagnostics](self, "autoDiagnostics");
  if ((unint64_t)(v2 - 1) > 5)
    return 0;
  else
    return off_1E716E350[v2 - 1];
}

+ (id)radarURLWithBuilder:(id)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  void *v31;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void (**v45)(id, void *);
  _QWORD v46[9];

  v46[7] = *MEMORY[0x1E0C80C00];
  v45 = (void (**)(id, void *))a3;
  if (!v45)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MSRadarURLBuilder.m"), 239, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("builderBlock"));

  }
  v5 = (void *)objc_opt_new();
  v45[2](v45, v5);
  if (objc_msgSend(v5, "appendStandardDisclaimerToDescription"))
  {
    objc_msgSend(v5, "radarDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "appendSysdiagnoseHowTo"))
    {
      objc_msgSend(v6, "stringByAppendingString:", CFSTR("\n\n*** REQUIRED DIAGNOSTICS\nPlease attach Mail-targeted sysdiagnose (run \"sudo sysdiagnose Mail\" in Terminal).\n"));
      v7 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v7;
    }
    if ((objc_msgSend(v5, "customFooter") & 1) == 0)
    {
      objc_msgSend(v6, "stringByAppendingString:", CFSTR("\n\n*** Note: If you have allowed Mail to collect privacy sensitive logs in Tap-to-Radar, Mail will attach the content of the email currently displayed to this radar. This is the EML file inside the \"Mail Logs\" folder, you can remove this attachment using the Tap-To-Radar app. ***"));
      v8 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v8;
    }
    objc_msgSend(v5, "setRadarDescription:", v6);

  }
  objc_msgSend(a1, "stringFromRadarClassification:", objc_msgSend(v5, "classification"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "stringFromRadarReproducibility:", objc_msgSend(v5, "reproducibility"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_componentInfoDictionaryFromComponent:", objc_msgSend(v5, "component"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("sRadarComponentNameKey"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("sRadarComponentIDKey"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = a1;
  objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("sRadarComponentVersionKey"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0C99DE8];
  v10 = (void *)MEMORY[0x1E0CB39D8];
  objc_msgSend(v5, "title");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "queryItemWithName:value:", CFSTR("Title"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = v37;
  v11 = (void *)MEMORY[0x1E0CB39D8];
  objc_msgSend(v5, "radarDescription");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "queryItemWithName:value:", CFSTR("Description"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v46[1] = v38;
  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("ComponentID"), v43);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v46[2] = v12;
  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("Classification"), v44);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v46[3] = v13;
  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("Reproducibility"), v42);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v46[4] = v14;
  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("ComponentName"), v40);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v46[5] = v15;
  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("ComponentVersion"), v41);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v46[6] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "arrayWithArray:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "attachmentPath");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    v20 = (void *)MEMORY[0x1E0CB39D8];
    objc_msgSend(v5, "attachmentPath");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "queryItemWithName:value:", CFSTR("attachments"), v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v22);

  }
  objc_msgSend(v5, "extensionIdentifiers");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "componentsJoinedByString:", CFSTR(","));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("ExtensionIdentifiers"), v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v25);

  }
  objc_msgSend(v5, "autoDiagnosticsString");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("AutoDiagnostics"), v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v27);

  }
  v28 = (void *)MEMORY[0x1E0CB39D8];
  if (objc_msgSend(v5, "prependSystemVersionToTitle"))
    v29 = CFSTR("1");
  else
    v29 = CFSTR("0");
  objc_msgSend(v28, "queryItemWithName:value:", CFSTR("IncludeDevicePrefixInTitle"), v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addObject:", v30);

  objc_msgSend(v35, "_URLFromQueryItems:builder:", v18, v5);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

+ (id)_URLFromQueryItems:(id)a3 builder:(id)a4
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setQueryItems:", v4);
  objc_msgSend(v5, "setScheme:", CFSTR("tap-to-radar"));
  objc_msgSend(v5, "setHost:", CFSTR("new"));
  objc_msgSend(v5, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)prependSystemVersionToTitle
{
  return self->_prependSystemVersionToTitle;
}

- (void)setPrependSystemVersionToTitle:(BOOL)a3
{
  self->_prependSystemVersionToTitle = a3;
}

- (NSString)radarDescription
{
  return self->_radarDescription;
}

- (void)setRadarDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)appendStandardDisclaimerToDescription
{
  return self->_appendStandardDisclaimerToDescription;
}

- (void)setAppendStandardDisclaimerToDescription:(BOOL)a3
{
  self->_appendStandardDisclaimerToDescription = a3;
}

- (BOOL)appendSysdiagnoseHowTo
{
  return self->_appendSysdiagnoseHowTo;
}

- (void)setAppendSysdiagnoseHowTo:(BOOL)a3
{
  self->_appendSysdiagnoseHowTo = a3;
}

- (BOOL)customFooter
{
  return self->_customFooter;
}

- (void)setCustomFooter:(BOOL)a3
{
  self->_customFooter = a3;
}

- (int64_t)component
{
  return self->_component;
}

- (void)setComponent:(int64_t)a3
{
  self->_component = a3;
}

- (int64_t)reproducibility
{
  return self->_reproducibility;
}

- (void)setReproducibility:(int64_t)a3
{
  self->_reproducibility = a3;
}

- (int64_t)classification
{
  return self->_classification;
}

- (void)setClassification:(int64_t)a3
{
  self->_classification = a3;
}

- (NSString)attachmentPath
{
  return self->_attachmentPath;
}

- (void)setAttachmentPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSArray)extensionIdentifiers
{
  return self->_extensionIdentifiers;
}

- (void)setExtensionIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (int64_t)autoDiagnostics
{
  return self->_autoDiagnostics;
}

- (void)setAutoDiagnostics:(int64_t)a3
{
  self->_autoDiagnostics = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionIdentifiers, 0);
  objc_storeStrong((id *)&self->_attachmentPath, 0);
  objc_storeStrong((id *)&self->_radarDescription, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
