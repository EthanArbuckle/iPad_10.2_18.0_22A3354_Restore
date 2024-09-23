@implementation HKAttachmentObjectIdentifierUtilities

+ (id)attachmentObjectIdentifierForClinicalRecord:(id)a3
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
  void *v14;

  v4 = a3;
  objc_msgSend(v4, "clinicalType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sourceRevision");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "source");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "FHIRResource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "resourceType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "FHIRResource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_attachmentObjectIdentifierWithSampleTypeIdentifier:bundleIdentifier:FHIRResourceType:FHIRResourceIdentifier:", v6, v9, v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)attachmentObjectIdentifierForMedicalRecord:(id)a3
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
  void *v14;

  v4 = a3;
  objc_msgSend(v4, "medicalType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sourceRevision");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "source");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "FHIRIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "resourceType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "FHIRIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_attachmentObjectIdentifierWithSampleTypeIdentifier:bundleIdentifier:FHIRResourceType:FHIRResourceIdentifier:", v6, v9, v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)_attachmentObjectIdentifierWithSampleTypeIdentifier:(id)a3 bundleIdentifier:(id)a4 FHIRResourceType:(id)a5 FHIRResourceIdentifier:(id)a6
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@/%@/%@"), a3, a4, a5, a6);
}

+ (BOOL)componentsFromAttachmentObjectIdentifier:(id)a3 sampleTypeIdentifier:(id *)a4 bundleIdentifier:(id *)a5 FHIRIdentifier:(id *)a6
{
  void *v9;
  void *v10;
  void *v11;
  HKFHIRIdentifier *v12;
  HKFHIRIdentifier *v13;
  BOOL v14;

  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("/"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count") == 4)
  {
    objc_msgSend(v9, "objectAtIndexedSubscript:", 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (a6)
    {
      v12 = -[HKFHIRIdentifier initWithResourceType:identifier:]([HKFHIRIdentifier alloc], "initWithResourceType:identifier:", v10, v11);
      if (!v12)
      {
        v14 = 0;
LABEL_11:

        goto LABEL_12;
      }
      v13 = objc_retainAutorelease(v12);
      *a6 = v13;

    }
    if (a4)
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    v14 = 1;
    if (a5)
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_11;
  }
  v14 = 0;
LABEL_12:

  return v14;
}

@end
