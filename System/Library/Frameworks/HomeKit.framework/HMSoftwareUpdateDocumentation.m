@implementation HMSoftwareUpdateDocumentation

- (HMSoftwareUpdateDocumentation)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (HMSoftwareUpdateDocumentation)initWithReleaseNotesSummary:(id)a3 releaseNotes:(id)a4 textReleaseNotes:(id)a5 licenseAgreement:(id)a6 licenseAgreementVersion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  HMSoftwareUpdateDocumentation *v17;
  uint64_t v18;
  HMHTMLDocument *releaseNotesSummary;
  uint64_t v20;
  HMHTMLDocument *releaseNotes;
  uint64_t v22;
  HMPlainTextDocument *textReleaseNotes;
  uint64_t v24;
  HMHTMLDocument *licenseAgreement;
  uint64_t v26;
  NSNumber *licenseAgreementVersion;
  uint64_t v28;
  HMHTMLDocument *v29;
  objc_super v31;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v31.receiver = self;
  v31.super_class = (Class)HMSoftwareUpdateDocumentation;
  v17 = -[HMSoftwareUpdateDocumentation init](&v31, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v12, "copy");
    releaseNotesSummary = v17->_releaseNotesSummary;
    v17->_releaseNotesSummary = (HMHTMLDocument *)v18;

    v20 = objc_msgSend(v13, "copy");
    releaseNotes = v17->_releaseNotes;
    v17->_releaseNotes = (HMHTMLDocument *)v20;

    v22 = objc_msgSend(v14, "copy");
    textReleaseNotes = v17->_textReleaseNotes;
    v17->_textReleaseNotes = (HMPlainTextDocument *)v22;

    v24 = objc_msgSend(v15, "copy");
    licenseAgreement = v17->_licenseAgreement;
    v17->_licenseAgreement = (HMHTMLDocument *)v24;

    v26 = objc_msgSend(v16, "copy");
    licenseAgreementVersion = v17->_licenseAgreementVersion;
    v17->_licenseAgreementVersion = (NSNumber *)v26;

    v28 = objc_msgSend(v12, "copy");
    v29 = v17->_releaseNotesSummary;
    v17->_releaseNotesSummary = (HMHTMLDocument *)v28;

  }
  return v17;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;

  -[HMSoftwareUpdateDocumentation releaseNotesSummary](self, "releaseNotesSummary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[HMSoftwareUpdateDocumentation releaseNotes](self, "releaseNotes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[HMSoftwareUpdateDocumentation textReleaseNotes](self, "textReleaseNotes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[HMSoftwareUpdateDocumentation licenseAgreement](self, "licenseAgreement");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  -[HMSoftwareUpdateDocumentation licenseAgreementVersion](self, "licenseAgreementVersion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10 ^ objc_msgSend(v11, "hash");

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  HMSoftwareUpdateDocumentation *v4;
  HMSoftwareUpdateDocumentation *v5;
  HMSoftwareUpdateDocumentation *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  char v21;

  v4 = (HMSoftwareUpdateDocumentation *)a3;
  if (self == v4)
  {
    v21 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (!v6)
      goto LABEL_11;
    -[HMSoftwareUpdateDocumentation releaseNotesSummary](self, "releaseNotesSummary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMSoftwareUpdateDocumentation releaseNotesSummary](v6, "releaseNotesSummary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = HMFEqualObjects();

    if (!v9)
      goto LABEL_11;
    -[HMSoftwareUpdateDocumentation releaseNotes](self, "releaseNotes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMSoftwareUpdateDocumentation releaseNotes](v6, "releaseNotes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = HMFEqualObjects();

    if (!v12)
      goto LABEL_11;
    -[HMSoftwareUpdateDocumentation textReleaseNotes](self, "textReleaseNotes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMSoftwareUpdateDocumentation textReleaseNotes](v6, "textReleaseNotes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = HMFEqualObjects();

    if (!v15)
      goto LABEL_11;
    -[HMSoftwareUpdateDocumentation licenseAgreement](self, "licenseAgreement");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMSoftwareUpdateDocumentation licenseAgreement](v6, "licenseAgreement");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = HMFEqualObjects();

    if (v18)
    {
      -[HMSoftwareUpdateDocumentation licenseAgreementVersion](self, "licenseAgreementVersion");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMSoftwareUpdateDocumentation licenseAgreementVersion](v6, "licenseAgreementVersion");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = HMFEqualObjects();

    }
    else
    {
LABEL_11:
      v21 = 0;
    }

  }
  return v21;
}

- (id)debugDescription
{
  return __secureDescription(self, 0);
}

- (id)description
{
  return __secureDescription(self, 1);
}

- (HMSoftwareUpdateDocumentation)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HMSoftwareUpdateDocumentation *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.summary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.releaseNotes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.textReleaseNotes"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.licenseAgreement"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.slaVersion"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[HMSoftwareUpdateDocumentation initWithReleaseNotesSummary:releaseNotes:textReleaseNotes:licenseAgreement:licenseAgreementVersion:](self, "initWithReleaseNotesSummary:releaseNotes:textReleaseNotes:licenseAgreement:licenseAgreementVersion:", v5, v6, v7, v8, v9);
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[HMSoftwareUpdateDocumentation releaseNotesSummary](self, "releaseNotesSummary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HM.summary"));

  -[HMSoftwareUpdateDocumentation releaseNotes](self, "releaseNotes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HM.releaseNotes"));

  -[HMSoftwareUpdateDocumentation textReleaseNotes](self, "textReleaseNotes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("HM.textReleaseNotes"));

  -[HMSoftwareUpdateDocumentation licenseAgreement](self, "licenseAgreement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("HM.licenseAgreement"));

  -[HMSoftwareUpdateDocumentation licenseAgreementVersion](self, "licenseAgreementVersion");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("HM.slaVersion"));

}

- (HMHTMLDocument)releaseNotesSummary
{
  return (HMHTMLDocument *)objc_getProperty(self, a2, 8, 1);
}

- (HMHTMLDocument)releaseNotes
{
  return (HMHTMLDocument *)objc_getProperty(self, a2, 16, 1);
}

- (HMPlainTextDocument)textReleaseNotes
{
  return (HMPlainTextDocument *)objc_getProperty(self, a2, 24, 1);
}

- (HMHTMLDocument)licenseAgreement
{
  return (HMHTMLDocument *)objc_getProperty(self, a2, 32, 1);
}

- (NSNumber)licenseAgreementVersion
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_licenseAgreementVersion, 0);
  objc_storeStrong((id *)&self->_licenseAgreement, 0);
  objc_storeStrong((id *)&self->_textReleaseNotes, 0);
  objc_storeStrong((id *)&self->_releaseNotes, 0);
  objc_storeStrong((id *)&self->_releaseNotesSummary, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HMSoftwareUpdateDocumentation)initWithBundle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMSoftwareUpdateDocumentation *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  HMPlainTextDocument *v19;
  uint64_t v20;
  HMPlainTextDocument *i;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  void *v25;
  HMSoftwareUpdateDocumentation *v26;
  void *v27;
  id v28;
  HMPlainTextDocument *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  HMSoftwareUpdateDocumentation *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  HMSoftwareUpdateDocumentation *v42;
  NSObject *v43;
  void *v44;
  const char *v45;
  HMSoftwareUpdateDocumentation *v46;
  void *v48;
  void *v49;
  void *context;
  void *v51;
  HMSoftwareUpdateDocumentation *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint8_t v63[4];
  void *v64;
  __int16 v65;
  void *v66;
  __int16 v67;
  id v68;
  uint8_t buf[4];
  void *v70;
  __int16 v71;
  void *v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    __resourceBundleForBundle(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (!v6)
    {
      v30 = (void *)MEMORY[0x1A1AC1AAC]();
      HMFGetOSLogHandle();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v70 = v32;
        v71 = 2112;
        v72 = v5;
        _os_log_impl(&dword_19B1B0000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@Invalid bundle: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v30);
      v26 = 0;
      goto LABEL_46;
    }
    v8 = (void *)MEMORY[0x1E0CB34D0];
    objc_msgSend(v6, "localizations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "preferredLocalizationsFromArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v10, "count"))
    {

      v10 = &unk_1E3B30970;
    }
    v11 = (void *)MEMORY[0x1A1AC1AAC]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v70 = v14;
      v71 = 2112;
      v72 = v10;
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_INFO, "%{public}@Parsing using preferred localizations: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    __htmlDocumentForResource(v7, v10, CFSTR("ReadMeSummary"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    __htmlDocumentForResource(v7, v10, CFSTR("ReadMe"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    __htmlDocumentForResource(v7, v10, CFSTR("License"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v7;
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v18 = v10;
    v19 = (HMPlainTextDocument *)objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v59, buf, 16);
    if (v19)
    {
      v52 = v12;
      v54 = v16;
      v51 = v15;
      v20 = *(_QWORD *)v60;
      while (2)
      {
        for (i = 0; i != v19; i = (HMPlainTextDocument *)((char *)i + 1))
        {
          if (*(_QWORD *)v60 != v20)
            objc_enumerationMutation(v18);
          objc_msgSend(v17, "URLForResource:withExtension:subdirectory:localization:", CFSTR("ReadMe"), CFSTR("txt"), 0, *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * (_QWORD)i));
          v22 = objc_claimAutoreleasedReturnValue();
          if (v22)
          {
            v27 = (void *)v22;
            v58 = 0;
            v19 = -[HMPlainTextDocument initWithURL:error:]([HMPlainTextDocument alloc], "initWithURL:error:", v22, &v58);
            v28 = v58;
            if (v19)
            {
              v29 = v19;
              v15 = v51;
              v12 = v52;
            }
            else
            {
              context = (void *)MEMORY[0x1A1AC1AAC]();
              HMFGetOSLogHandle();
              v33 = objc_claimAutoreleasedReturnValue();
              v15 = v51;
              v12 = v52;
              if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "path");
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)v63 = 138543874;
                v64 = v49;
                v65 = 2112;
                v66 = v48;
                v67 = 2112;
                v68 = v28;
                _os_log_impl(&dword_19B1B0000, v33, OS_LOG_TYPE_INFO, "%{public}@Unable to load document, %@, with error: %@", v63, 0x20u);

              }
              objc_autoreleasePoolPop(context);
            }

            goto LABEL_28;
          }
        }
        v19 = (HMPlainTextDocument *)objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v59, buf, 16);
        if (v19)
          continue;
        break;
      }
      v15 = v51;
      v12 = v52;
LABEL_28:
      v16 = v54;
    }

    if (v16 && v19)
    {
      v34 = (void *)MEMORY[0x1A1AC1AAC]();
      v35 = v12;
      HMFGetOSLogHandle();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v55 = v16;
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v70 = v37;
        _os_log_impl(&dword_19B1B0000, v36, OS_LOG_TYPE_DEFAULT, "%{public}@Both html and text release notes provided, using text notes", buf, 0xCu);

        v16 = v55;
      }

      objc_autoreleasePoolPop(v34);
      v16 = 0;
      v15 = 0;
    }
    if (!v57)
    {
      v41 = 0;
LABEL_45:
      self = -[HMSoftwareUpdateDocumentation initWithReleaseNotesSummary:releaseNotes:textReleaseNotes:licenseAgreement:licenseAgreementVersion:](v12, "initWithReleaseNotesSummary:releaseNotes:textReleaseNotes:licenseAgreement:licenseAgreementVersion:", v15, v16, v19, v57, v41, v48);

      v26 = self;
LABEL_46:

      goto LABEL_47;
    }
    v56 = v16;
    objc_msgSend(v5, "infoDictionary");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "hmf_dictionaryForKey:", CFSTR("MobileAssetProperties"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v39;
    if (v39)
    {
      objc_msgSend(v39, "hmf_numberForKey:", CFSTR("SUSLAVersionRequired"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      if (v41)
      {
LABEL_44:

        v16 = v56;
        goto LABEL_45;
      }
      v53 = (void *)MEMORY[0x1A1AC1AAC]();
      v42 = v12;
      HMFGetOSLogHandle();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v70 = v44;
        v71 = 2112;
        v72 = v40;
        v45 = "%{public}@Missing SLA version from asset properties: %@";
LABEL_42:
        _os_log_impl(&dword_19B1B0000, v43, OS_LOG_TYPE_ERROR, v45, buf, 0x16u);

      }
    }
    else
    {
      v53 = (void *)MEMORY[0x1A1AC1AAC]();
      v46 = v12;
      HMFGetOSLogHandle();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v70 = v44;
        v71 = 2112;
        v72 = v38;
        v45 = "%{public}@Missing asset properties from asset info: %@";
        goto LABEL_42;
      }
    }

    objc_autoreleasePoolPop(v53);
    v41 = 0;
    goto LABEL_44;
  }
  v23 = (void *)MEMORY[0x1A1AC1AAC]();
  self = self;
  HMFGetOSLogHandle();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v70 = v25;
    _os_log_impl(&dword_19B1B0000, v24, OS_LOG_TYPE_ERROR, "%{public}@The bundle parameter is required", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v23);
  v26 = 0;
LABEL_47:

  return v26;
}

+ (id)localizationsForBundle:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  __resourceBundleForBundle(a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "localizations");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v5;
}

@end
