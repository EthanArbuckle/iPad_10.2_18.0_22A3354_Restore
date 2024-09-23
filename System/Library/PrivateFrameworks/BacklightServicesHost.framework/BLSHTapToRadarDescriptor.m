@implementation BLSHTapToRadarDescriptor

- (BLSHTapToRadarDescriptor)initWithDesignation:(unint64_t)a3 radarTitle:(id)a4 radarDescription:(id)a5
{
  id v8;
  id v9;
  BLSHTapToRadarDescriptor *v10;
  BLSHTapToRadarDescriptor *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSString *bundleID;
  NSString *classification;
  NSString *reproducibility;
  NSString *componentName;
  NSString *componentVersion;
  NSString *ttrPromptHeader;
  objc_super v22;

  v8 = a4;
  v9 = a5;
  v22.receiver = self;
  v22.super_class = (Class)BLSHTapToRadarDescriptor;
  v10 = -[BLSHTapToRadarDescriptor init](&v22, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_designation = a3;
    if ((unint64_t)objc_msgSend(v8, "length") >= 0xF1)
    {
      objc_msgSend(v8, "substringToIndex:", 239);
      v12 = objc_claimAutoreleasedReturnValue();

      v8 = (id)v12;
    }
    objc_storeStrong((id *)&v11->_radarTitle, v8);
    objc_storeStrong((id *)&v11->_radarDescription, a5);
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bundleIdentifier");
    v14 = objc_claimAutoreleasedReturnValue();
    bundleID = v11->_bundleID;
    v11->_bundleID = (NSString *)v14;

    classification = v11->_classification;
    v11->_classification = (NSString *)CFSTR("Serious Bug");

    reproducibility = v11->_reproducibility;
    v11->_reproducibility = (NSString *)CFSTR("Sometimes");

    componentName = v11->_componentName;
    v11->_componentName = (NSString *)CFSTR("BacklightServices");

    componentVersion = v11->_componentVersion;
    v11->_componentVersion = (NSString *)CFSTR("All");

    v11->_componentID = 1331578;
    ttrPromptHeader = v11->_ttrPromptHeader;
    v11->_ttrPromptHeader = (NSString *)CFSTR("Internal Only");

  }
  return v11;
}

- (id)toURL
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

  objc_msgSend(MEMORY[0x24BDD1808], "componentsWithString:", CFSTR("tap-to-radar://new"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("Title"), self->_radarTitle);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("Description"), self->_radarDescription);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v6);

  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("BundleID"), self->_bundleID);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v7);

  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("Classification"), self->_classification);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v8);

  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("Reproducibility"), self->_reproducibility);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v9);

  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("ComponentName"), self->_componentName);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v10);

  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("ComponentVersion"), self->_componentVersion);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v11);

  v12 = (void *)MEMORY[0x24BDD1838];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), self->_componentID);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "queryItemWithName:value:", CFSTR("ComponentID"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v14);

  if (self->_keywordIDs)
  {
    objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("KeywordIDs"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v15);

  }
  if (self->_attachments)
  {
    objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("Attachments"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v16);

  }
  objc_msgSend(v3, "setQueryItems:", v4);
  objc_msgSend(v3, "URL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (void)setTtrDisplayReason:(id)a3
{
  id v4;
  NSObject *v5;
  NSString *ttrDisplayReason;

  v4 = a3;
  if ((unint64_t)objc_msgSend(v4, "length") >= 0x4B)
  {
    bls_backlight_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[BLSHTapToRadarDescriptor setTtrDisplayReason:].cold.1((uint64_t)v4, v5);

    v4 = 0;
  }
  ttrDisplayReason = self->_ttrDisplayReason;
  self->_ttrDisplayReason = (NSString *)v4;

}

- (unint64_t)designation
{
  return self->_designation;
}

- (NSString)radarTitle
{
  return self->_radarTitle;
}

- (NSString)radarDescription
{
  return self->_radarDescription;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)classification
{
  return self->_classification;
}

- (void)setClassification:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)reproducibility
{
  return self->_reproducibility;
}

- (void)setReproducibility:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)keywordIDs
{
  return self->_keywordIDs;
}

- (void)setKeywordIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)attachments
{
  return self->_attachments;
}

- (void)setAttachments:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (int64_t)componentID
{
  return self->_componentID;
}

- (void)setComponentID:(int64_t)a3
{
  self->_componentID = a3;
}

- (NSString)componentName
{
  return self->_componentName;
}

- (void)setComponentName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)componentVersion
{
  return self->_componentVersion;
}

- (void)setComponentVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)ttrPromptHeader
{
  return self->_ttrPromptHeader;
}

- (void)setTtrPromptHeader:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)ttrPromptMessage
{
  return self->_ttrPromptMessage;
}

- (void)setTtrPromptMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)ttrDisplayReason
{
  return self->_ttrDisplayReason;
}

- (NSDate)timeOfIssue
{
  return self->_timeOfIssue;
}

- (void)setTimeOfIssue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeOfIssue, 0);
  objc_storeStrong((id *)&self->_ttrDisplayReason, 0);
  objc_storeStrong((id *)&self->_ttrPromptMessage, 0);
  objc_storeStrong((id *)&self->_ttrPromptHeader, 0);
  objc_storeStrong((id *)&self->_componentVersion, 0);
  objc_storeStrong((id *)&self->_componentName, 0);
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_keywordIDs, 0);
  objc_storeStrong((id *)&self->_reproducibility, 0);
  objc_storeStrong((id *)&self->_classification, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_radarDescription, 0);
  objc_storeStrong((id *)&self->_radarTitle, 0);
}

- (void)setTtrDisplayReason:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_2145AC000, a2, OS_LOG_TYPE_ERROR, "ttrDisplayReason must be < 75 characters: \"%{public}@\", (uint8_t *)&v2, 0xCu);
}

@end
