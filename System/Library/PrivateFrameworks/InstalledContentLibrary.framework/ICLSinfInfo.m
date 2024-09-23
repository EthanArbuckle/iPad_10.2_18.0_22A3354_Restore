@implementation ICLSinfInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ICLSinfInfo)initWithCoder:(id)a3
{
  id v4;
  ICLSinfInfo *v5;
  uint64_t v6;
  NSNumber *applicationDSID;
  uint64_t v8;
  NSNumber *familyID;
  uint64_t v10;
  NSNumber *downloaderDSID;

  v4 = a3;
  v5 = -[ICLSinfInfo init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("applicationDSID"));
    v6 = objc_claimAutoreleasedReturnValue();
    applicationDSID = v5->_applicationDSID;
    v5->_applicationDSID = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("familyID"));
    v8 = objc_claimAutoreleasedReturnValue();
    familyID = v5->_familyID;
    v5->_familyID = (NSNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("downloaderDSID"));
    v10 = objc_claimAutoreleasedReturnValue();
    downloaderDSID = v5->_downloaderDSID;
    v5->_downloaderDSID = (NSNumber *)v10;

    v5->_hasMIDBasedSINF = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasMIDBasedSINF"));
    v5->_isMissingRequiredSINF = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isMissingRequiredSINF"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[ICLSinfInfo applicationDSID](self, "applicationDSID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("applicationDSID"));

  -[ICLSinfInfo familyID](self, "familyID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("familyID"));

  -[ICLSinfInfo downloaderDSID](self, "downloaderDSID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("downloaderDSID"));

  objc_msgSend(v7, "encodeBool:forKey:", -[ICLSinfInfo hasMIDBasedSINF](self, "hasMIDBasedSINF"), CFSTR("hasMIDBasedSINF"));
  objc_msgSend(v7, "encodeBool:forKey:", -[ICLSinfInfo isMissingRequiredSINF](self, "isMissingRequiredSINF"), CFSTR("isMissingRequiredSINF"));

}

- (ICLSinfInfo)initWithLegacySinfInfoDictionary:(id)a3
{
  id v4;
  ICLSinfInfo *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;

  v4 = a3;
  v5 = -[ICLSinfInfo init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ApplicationDSID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v7 = v6;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;

    -[ICLSinfInfo setApplicationDSID:](v5, "setApplicationDSID:", v8);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FamilyID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v10 = v9;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;

    -[ICLSinfInfo setFamilyID:](v5, "setFamilyID:", v11);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DownloaderDSID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v13 = v12;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;

    -[ICLSinfInfo setDownloaderDSID:](v5, "setDownloaderDSID:", v14);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HasMIDBasedSINF"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICLSinfInfo setHasMIDBasedSINF:](v5, "setHasMIDBasedSINF:", MIBooleanValue(v15, 0));

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MissingSINF"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICLSinfInfo setIsMissingRequiredSINF:](v5, "setIsMissingRequiredSINF:", MIBooleanValue(v16, 0));

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[ICLSinfInfo applicationDSID](self, "applicationDSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setApplicationDSID:", v5);

  -[ICLSinfInfo familyID](self, "familyID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFamilyID:", v6);

  -[ICLSinfInfo downloaderDSID](self, "downloaderDSID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDownloaderDSID:", v7);

  objc_msgSend(v4, "setHasMIDBasedSINF:", -[ICLSinfInfo hasMIDBasedSINF](self, "hasMIDBasedSINF"));
  objc_msgSend(v4, "setIsMissingRequiredSINF:", -[ICLSinfInfo isMissingRequiredSINF](self, "isMissingRequiredSINF"));
  return v4;
}

- (NSDictionary)legacySinfInfoDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v3 = (void *)objc_opt_new();
  -[ICLSinfInfo applicationDSID](self, "applicationDSID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("ApplicationDSID"));

  -[ICLSinfInfo familyID](self, "familyID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("FamilyID"));

  -[ICLSinfInfo downloaderDSID](self, "downloaderDSID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("DownloaderDSID"));

  v7 = -[ICLSinfInfo hasMIDBasedSINF](self, "hasMIDBasedSINF");
  v8 = MEMORY[0x1E0C9AAA0];
  v9 = MEMORY[0x1E0C9AAB0];
  if (v7)
  {
    if (-[ICLSinfInfo hasMIDBasedSINF](self, "hasMIDBasedSINF"))
      v10 = v9;
    else
      v10 = v8;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("HasMIDBasedSINF"));
  }
  if (-[ICLSinfInfo isMissingRequiredSINF](self, "isMissingRequiredSINF"))
  {
    if (-[ICLSinfInfo isMissingRequiredSINF](self, "isMissingRequiredSINF"))
      v11 = v9;
    else
      v11 = v8;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("MissingSINF"));
  }
  v12 = (void *)objc_msgSend(v3, "copy");

  return (NSDictionary *)v12;
}

- (BOOL)isEqual:(id)a3
{
  ICLSinfInfo *v4;
  ICLSinfInfo *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  BOOL v14;
  _BOOL4 v15;
  BOOL v16;
  _BOOL4 v18;

  v4 = (ICLSinfInfo *)a3;
  if (self == v4)
  {
    v16 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[ICLSinfInfo applicationDSID](self, "applicationDSID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICLSinfInfo applicationDSID](v5, "applicationDSID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = MICompareObjects(v6, v7);

      if (v8)
      {
        -[ICLSinfInfo familyID](self, "familyID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICLSinfInfo familyID](v5, "familyID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = MICompareObjects(v9, v10);

        if (v11)
        {
          -[ICLSinfInfo downloaderDSID](self, "downloaderDSID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[ICLSinfInfo downloaderDSID](v5, "downloaderDSID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = MICompareObjects(v12, v13);

          if (v14)
          {
            v15 = -[ICLSinfInfo hasMIDBasedSINF](self, "hasMIDBasedSINF");
            if (v15 == -[ICLSinfInfo hasMIDBasedSINF](v5, "hasMIDBasedSINF"))
            {
              v18 = -[ICLSinfInfo isMissingRequiredSINF](self, "isMissingRequiredSINF");
              if (v18 == -[ICLSinfInfo isMissingRequiredSINF](v5, "isMissingRequiredSINF"))
              {
                v16 = 1;
                goto LABEL_22;
              }
              if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
              {
LABEL_21:
                v16 = 0;
LABEL_22:

                goto LABEL_23;
              }
            }
            else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
            {
              goto LABEL_21;
            }
          }
          else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
          {
            goto LABEL_21;
          }
        }
        else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
        {
          goto LABEL_21;
        }
      }
      else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
      {
        goto LABEL_21;
      }
      MOLogWrite();
      goto LABEL_21;
    }
    v16 = 0;
  }
LABEL_23:

  return v16;
}

- (unint64_t)hash
{
  uint64_t v3;
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;

  v3 = -[ICLSinfInfo hasMIDBasedSINF](self, "hasMIDBasedSINF");
  v4 = -[ICLSinfInfo isMissingRequiredSINF](self, "isMissingRequiredSINF");
  v5 = 2;
  if (!v4)
    v5 = 0;
  v6 = v5 | v3;
  -[ICLSinfInfo applicationDSID](self, "applicationDSID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");

  -[ICLSinfInfo familyID](self, "familyID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8 ^ objc_msgSend(v9, "hash");

  -[ICLSinfInfo downloaderDSID](self, "downloaderDSID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10 ^ objc_msgSend(v11, "hash") ^ v6;

  return v12;
}

- (NSNumber)applicationDSID
{
  return self->_applicationDSID;
}

- (void)setApplicationDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)familyID
{
  return self->_familyID;
}

- (void)setFamilyID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)downloaderDSID
{
  return self->_downloaderDSID;
}

- (void)setDownloaderDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)hasMIDBasedSINF
{
  return self->_hasMIDBasedSINF;
}

- (void)setHasMIDBasedSINF:(BOOL)a3
{
  self->_hasMIDBasedSINF = a3;
}

- (BOOL)isMissingRequiredSINF
{
  return self->_isMissingRequiredSINF;
}

- (void)setIsMissingRequiredSINF:(BOOL)a3
{
  self->_isMissingRequiredSINF = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloaderDSID, 0);
  objc_storeStrong((id *)&self->_familyID, 0);
  objc_storeStrong((id *)&self->_applicationDSID, 0);
}

@end
