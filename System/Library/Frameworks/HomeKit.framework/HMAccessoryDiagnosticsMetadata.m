@implementation HMAccessoryDiagnosticsMetadata

- (HMAccessoryDiagnosticsMetadata)initWithSnapshotPath:(id)a3 urlParameters:(id)a4 privacyPolicyURL:(id)a5 uploadDestination:(id)a6 consentVersion:(id)a7 uploadType:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  HMAccessoryDiagnosticsMetadata *v19;
  HMAccessoryDiagnosticsMetadata *v20;
  uint64_t v21;
  NSDictionary *urlParameters;
  id v24;
  id v25;
  objc_super v26;

  v25 = a3;
  v15 = a4;
  v24 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v26.receiver = self;
  v26.super_class = (Class)HMAccessoryDiagnosticsMetadata;
  v19 = -[HMAccessoryDiagnosticsMetadata init](&v26, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_snapshotPath, a3);
    v21 = objc_msgSend(v15, "copy", v24, v25);
    urlParameters = v20->_urlParameters;
    v20->_urlParameters = (NSDictionary *)v21;

    objc_storeStrong((id *)&v20->_privacyPolicyURL, a5);
    objc_storeStrong((id *)&v20->_uploadDestination, a6);
    objc_storeStrong((id *)&v20->_consentVersion, a7);
    objc_storeStrong((id *)&v20->_uploadType, a8);
  }

  return v20;
}

- (id)attributeDescriptions
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[7];

  v23[6] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMAccessoryDiagnosticsMetadata snapshotPath](self, "snapshotPath");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("snapshotPath"), v22);
  v23[0] = v21;
  v4 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMAccessoryDiagnosticsMetadata urlParameters](self, "urlParameters");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("urlParameters"), v20);
  v23[1] = v5;
  v6 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMAccessoryDiagnosticsMetadata privacyPolicyURL](self, "privacyPolicyURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("privacyPolicyURL"), v7);
  v23[2] = v8;
  v9 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMAccessoryDiagnosticsMetadata uploadDestination](self, "uploadDestination");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("uploadDestination"), v10);
  v23[3] = v11;
  v12 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMAccessoryDiagnosticsMetadata consentVersion](self, "consentVersion");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithName:value:", CFSTR("consentVersion"), v13);
  v23[4] = v14;
  v15 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMAccessoryDiagnosticsMetadata uploadType](self, "uploadType");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithName:value:", CFSTR("uploadType"), v16);
  v23[5] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (HMAccessoryDiagnosticsMetadata)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMAccessoryDiagnosticsMetadata *v12;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMA.diagnostics.ck.sp"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  objc_msgSend(v4, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:", v6, objc_opt_class(), CFSTR("HMA.diagnostics.ck.urlp"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMA.diagnostics.ck.purl"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMA.diagnostics.ck.udest"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMA.diagnostics.ck.cv"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMA.diagnostics.ck.ut"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[HMAccessoryDiagnosticsMetadata initWithSnapshotPath:urlParameters:privacyPolicyURL:uploadDestination:consentVersion:uploadType:](self, "initWithSnapshotPath:urlParameters:privacyPolicyURL:uploadDestination:consentVersion:uploadType:", v5, v7, v8, v9, v10, v11);
  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[HMAccessoryDiagnosticsMetadata snapshotPath](self, "snapshotPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HMA.diagnostics.ck.sp"));

  -[HMAccessoryDiagnosticsMetadata urlParameters](self, "urlParameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HMA.diagnostics.ck.urlp"));

  -[HMAccessoryDiagnosticsMetadata privacyPolicyURL](self, "privacyPolicyURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("HMA.diagnostics.ck.purl"));

  -[HMAccessoryDiagnosticsMetadata uploadDestination](self, "uploadDestination");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("HMA.diagnostics.ck.udest"));

  -[HMAccessoryDiagnosticsMetadata consentVersion](self, "consentVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("HMA.diagnostics.ck.cv"));

  -[HMAccessoryDiagnosticsMetadata uploadType](self, "uploadType");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("HMA.diagnostics.ck.ut"));

}

- (NSString)snapshotPath
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSDictionary)urlParameters
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (NSURL)privacyPolicyURL
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (NSURL)uploadDestination
{
  return (NSURL *)objc_getProperty(self, a2, 32, 1);
}

- (NSNumber)consentVersion
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (NSNumber)uploadType
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uploadType, 0);
  objc_storeStrong((id *)&self->_consentVersion, 0);
  objc_storeStrong((id *)&self->_uploadDestination, 0);
  objc_storeStrong((id *)&self->_privacyPolicyURL, 0);
  objc_storeStrong((id *)&self->_urlParameters, 0);
  objc_storeStrong((id *)&self->_snapshotPath, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
