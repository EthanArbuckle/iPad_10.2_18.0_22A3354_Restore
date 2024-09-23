@implementation AXAuditResult

- (AXAuditResult)initWithAXAuditCategoryResults:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  AXAuditResult *v18;
  AXAuditResult *v20;
  id obj;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v20 = self;
  v39 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v3;
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
  if (v23)
  {
    v22 = *(_QWORD *)v33;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v33 != v22)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v5);
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        objc_msgSend(v6, "caseResults", v20);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v29;
          do
          {
            v11 = 0;
            do
            {
              if (*(_QWORD *)v29 != v10)
                objc_enumerationMutation(v7);
              v12 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v11);
              v24 = 0u;
              v25 = 0u;
              v26 = 0u;
              v27 = 0u;
              objc_msgSend(v12, "auditIssues");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
              if (v14)
              {
                v15 = v14;
                v16 = *(_QWORD *)v25;
                do
                {
                  v17 = 0;
                  do
                  {
                    if (*(_QWORD *)v25 != v16)
                      objc_enumerationMutation(v13);
                    objc_msgSend(v4, "addObject:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v17++));
                  }
                  while (v15 != v17);
                  v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
                }
                while (v15);
              }

              ++v11;
            }
            while (v11 != v9);
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
          }
          while (v9);
        }

        ++v5;
      }
      while (v5 != v23);
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    }
    while (v23);
  }

  v18 = -[AXAuditResult initWithAuditIssues:](v20, "initWithAuditIssues:", v4);
  return v18;
}

- (AXAuditResult)initWithAuditIssues:(id)a3
{
  id v5;
  AXAuditResult *v6;
  AXAuditResult *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AXAuditResult;
  v6 = -[AXAuditResult init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_auditIssues, a3);
    -[AXAuditResult _generateIssueToImageMapping](v7, "_generateIssueToImageMapping");
  }

  return v7;
}

- (void)_generateIssueToImageMapping
{
  uint64_t v3;
  unint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  UIImage *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  UIImage *v27;
  uint64_t v28;
  void *v29;
  unint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  AXAuditResult *v36;
  id obj;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _QWORD v49[6];
  _QWORD v50[6];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v38 = (void *)objc_opt_new();
  +[AXAuditScreenshotManager sharedManager](AXAuditScreenshotManager, "sharedManager");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v36 = self;
  -[AXAuditResult auditIssues](self, "auditIssues");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
  if (v41)
  {
    v39 = *(_QWORD *)v46;
    v3 = 1;
    v4 = 0x24BDD1000uLL;
    do
    {
      for (i = 0; i != v41; ++i)
      {
        if (*(_QWORD *)v46 != v39)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
        objc_msgSend(*(id *)(v4 + 1760), "numberWithInt:", v3);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setImageIdentifier:", v7);

        objc_msgSend(v40, "screenshotForIssue:elementRect:", v6, 0);
        v8 = (UIImage *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)MEMORY[0x24BDD1968];
        objc_msgSend(v6, "timeStamp");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "screenshotBorderFrameForTimestamp:", v10);
        objc_msgSend(v9, "valueWithRect:");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = *(void **)(v4 + 1760);
        objc_msgSend(v6, "timeStamp");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "screenshotScaleFactorForTimestamp:", v13);
        *(float *)&v14 = v14;
        objc_msgSend(v12, "numberWithFloat:", v14);
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        v15 = *(void **)(v4 + 1760);
        objc_msgSend(v6, "timeStamp");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "screenshotRotationForTimestamp:", v16);
        *(float *)&v17 = v17;
        objc_msgSend(v15, "numberWithFloat:", v17);
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        v18 = (void *)MEMORY[0x24BDD1968];
        objc_msgSend(v6, "timeStamp");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "screenshotDisplayBoundsForTimestamp:", v19);
        objc_msgSend(v18, "valueWithRect:");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v21 = *(void **)(v4 + 1760);
        objc_msgSend(v6, "timeStamp");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "numberWithBool:", objc_msgSend(v40, "screenshotShouldFlipOutlineForTimestamp:", v22));
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        UIImagePNGRepresentation(v8);
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = (void *)v24;
        if (v24)
        {
          v26 = (void *)MEMORY[0x24BDBCE70];
          v50[0] = v24;
          v50[1] = v11;
          v50[2] = v44;
          v50[3] = v43;
          v50[4] = v20;
          v50[5] = v23;
          v42 = v11;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v50, 6);
          v27 = v8;
          v28 = v3;
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v49[0] = CFSTR("imageData");
          v49[1] = CFSTR("borderFrame");
          v49[2] = CFSTR("displayNativeScale");
          v49[3] = CFSTR("rotationRadians");
          v49[4] = CFSTR("displayBounds");
          v49[5] = CFSTR("shouldFlipOutline");
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v49, 6);
          v30 = v4;
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "dictionaryWithObjects:forKeys:", v29, v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(*(id *)(v30 + 1760), "numberWithInt:", v28);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "stringValue");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "setObject:forKey:", v32, v34);

          v4 = v30;
          v11 = v42;

          LODWORD(v33) = v28;
          v8 = v27;
          v3 = ((_DWORD)v33 + 1);

        }
      }
      v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
    }
    while (v41);
  }

  v35 = (void *)objc_msgSend(v38, "copy");
  -[AXAuditResult setAuditIssueToScreenshotMapping:](v36, "setAuditIssueToScreenshotMapping:", v35);

}

- (id)screenshotInfoDictionaryForAuditIssue:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "imageIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[AXAuditResult auditIssueToScreenshotMapping](self, "auditIssueToScreenshotMapping");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)screenshotForAuditIssue:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(a3, "imageIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[AXAuditResult auditIssueToScreenshotMapping](self, "auditIssueToScreenshotMapping");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("imageData"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AC8]), "initWithData:", v8);
  else
    v9 = 0;

  return v9;
}

- (id)borderFrameForAuditIssue:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "imageIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[AXAuditResult auditIssueToScreenshotMapping](self, "auditIssueToScreenshotMapping");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("borderFrame"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)scaleForAuditIssue:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "imageIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[AXAuditResult auditIssueToScreenshotMapping](self, "auditIssueToScreenshotMapping");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("displayNativeScale"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)rotationForAuditIssue:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "imageIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[AXAuditResult auditIssueToScreenshotMapping](self, "auditIssueToScreenshotMapping");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("rotationRadians"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)displayBoundsForAuditIssue:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "imageIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[AXAuditResult auditIssueToScreenshotMapping](self, "auditIssueToScreenshotMapping");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("displayBounds"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)shouldFlipOutlineForAuditIssue:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "imageIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[AXAuditResult auditIssueToScreenshotMapping](self, "auditIssueToScreenshotMapping");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("shouldFlipOutline"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (void)registerTransportableObjectWithManager:(id)a3
{
  id v3;
  AXAuditObjectTransportPropertyEntry *v4;
  AXAuditObjectTransportPropertyEntry *v5;
  AXAuditObjectTransportInfoPropertyBased *v6;

  v3 = a3;
  v6 = -[AXAuditObjectTransportInfoPropertyBased initWithClass:transportKey:]([AXAuditObjectTransportInfoPropertyBased alloc], "initWithClass:transportKey:", objc_opt_class(), CFSTR("AXAuditResult_v1"));
  v4 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  -[AXAuditObjectTransportInfoPropertyBased addPropertyEntry:](v6, "addPropertyEntry:", v4);
  -[AXAuditObjectTransportPropertyEntry setTransportKey:](v4, "setTransportKey:", CFSTR("AuditIssuesValue_v1"));
  -[AXAuditObjectTransportPropertyEntry setLocalValueToTransportValue:](v4, "setLocalValueToTransportValue:", &__block_literal_global_13);
  -[AXAuditObjectTransportPropertyEntry setPopulateLocalObjectWithTransportValue:](v4, "setPopulateLocalObjectWithTransportValue:", &__block_literal_global_15_0);
  v5 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  -[AXAuditObjectTransportInfoPropertyBased addPropertyEntry:](v6, "addPropertyEntry:", v5);
  -[AXAuditObjectTransportPropertyEntry setTransportKey:](v5, "setTransportKey:", CFSTR("AuditIssueToScreenshotMappingPropertyValue_v1"));
  -[AXAuditObjectTransportPropertyEntry setLocalValueToTransportValue:](v5, "setLocalValueToTransportValue:", &__block_literal_global_19);
  -[AXAuditObjectTransportPropertyEntry setPopulateLocalObjectWithTransportValue:](v5, "setPopulateLocalObjectWithTransportValue:", &__block_literal_global_21_1);
  objc_msgSend(v3, "registerTransportInfoPropertyBased:", v6);

}

uint64_t __56__AXAuditResult_registerTransportableObjectWithManager___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "auditIssues");
}

void __56__AXAuditResult_registerTransportableObjectWithManager___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setAuditIssues:", v4);

}

uint64_t __56__AXAuditResult_registerTransportableObjectWithManager___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "auditIssueToScreenshotMapping");
}

void __56__AXAuditResult_registerTransportableObjectWithManager___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setAuditIssueToScreenshotMapping:", v4);

}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[AXAuditResult auditIssues](self, "auditIssues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[AXAuditResult auditIssueToScreenshotMapping](self, "auditIssueToScreenshotMapping");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  AXAuditResult *v4;
  AXAuditResult *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  char v11;
  BOOL v12;

  v4 = (AXAuditResult *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[AXAuditResult auditIssues](self, "auditIssues");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXAuditResult auditIssues](v5, "auditIssues");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqualToArray:", v7);

      v12 = 0;
      if (v8)
      {
        -[AXAuditResult auditIssueToScreenshotMapping](self, "auditIssueToScreenshotMapping");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXAuditResult auditIssueToScreenshotMapping](v5, "auditIssueToScreenshotMapping");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqualToDictionary:", v10);

        if ((v11 & 1) != 0)
          v12 = 1;
      }

    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[AXAuditResult auditIssues](self, "auditIssues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAuditIssues:", v5);

  -[AXAuditResult auditIssueToScreenshotMapping](self, "auditIssueToScreenshotMapping");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAuditIssueToScreenshotMapping:", v6);

  return v4;
}

- (NSArray)auditIssues
{
  return self->_auditIssues;
}

- (void)setAuditIssues:(id)a3
{
  objc_storeStrong((id *)&self->_auditIssues, a3);
}

- (NSDictionary)auditIssueToScreenshotMapping
{
  return self->_auditIssueToScreenshotMapping;
}

- (void)setAuditIssueToScreenshotMapping:(id)a3
{
  objc_storeStrong((id *)&self->_auditIssueToScreenshotMapping, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auditIssueToScreenshotMapping, 0);
  objc_storeStrong((id *)&self->_auditIssues, 0);
}

@end
