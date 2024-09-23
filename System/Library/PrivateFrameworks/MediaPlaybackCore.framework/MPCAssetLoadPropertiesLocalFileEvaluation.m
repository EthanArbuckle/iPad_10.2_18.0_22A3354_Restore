@implementation MPCAssetLoadPropertiesLocalFileEvaluation

- (MPCAssetLoadPropertiesLocalFileEvaluation)initWithFileAsset:(id)a3
{
  id v4;
  MPCAssetLoadPropertiesLocalFileEvaluation *v5;
  uint64_t v6;
  MPModelFileAsset *fileAsset;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPCAssetLoadPropertiesLocalFileEvaluation;
  v5 = -[MPCAssetLoadPropertiesLocalFileEvaluation init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    fileAsset = v5->_fileAsset;
    v5->_fileAsset = (MPModelFileAsset *)v6;

  }
  return v5;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[MPCAssetLoadPropertiesLocalFileEvaluation humanDescription](self, "humanDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)humanDescription
{
  void *v3;
  unint64_t v4;
  const __CFString *v5;
  void *v6;
  int64_t v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  int64_t v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int64_t v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  int64_t v29;
  const __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  const __CFString *v35;
  const __CFString *v36;
  unint64_t v37;
  void *v38;
  void *v39;

  v3 = (void *)objc_opt_new();
  v4 = -[MPCAssetLoadPropertiesLocalFileEvaluation status](self, "status") - 2;
  if (v4 <= 5)
    objc_msgSend(v3, "addObject:", off_24CAB3818[v4]);
  if (-[MPCAssetLoadPropertiesLocalFileEvaluation fileIsDownloaded](self, "fileIsDownloaded"))
    objc_msgSend(v3, "addObject:", CFSTR("downloaded"));
  if (-[MPCAssetLoadPropertiesLocalFileEvaluation fileIsCached](self, "fileIsCached"))
    objc_msgSend(v3, "addObject:", CFSTR("cached"));
  if (-[MPCAssetLoadPropertiesLocalFileEvaluation fileIsHLS](self, "fileIsHLS"))
    v5 = CFSTR("HLS format");
  else
    v5 = CFSTR("CRABS format");
  objc_msgSend(v3, "addObject:", v5);
  v6 = (void *)MEMORY[0x24BDD17C8];
  v7 = -[MPCAssetLoadPropertiesLocalFileEvaluation fileQualityType](self, "fileQualityType");
  if (v7 == 1)
    v8 = CFSTR("Low");
  else
    v8 = CFSTR("Unknown");
  if (v7 == 2)
    v8 = CFSTR("High");
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ quality"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v9);

  v10 = (void *)MEMORY[0x24BDD17C8];
  v11 = -[MPCAssetLoadPropertiesLocalFileEvaluation fileAssetType](self, "fileAssetType");
  if ((unint64_t)(v11 - 1) > 4)
    v12 = CFSTR("Unspecified");
  else
    v12 = off_24CAB3868[v11 - 1];
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@ audio"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v13);

  v14 = (void *)MEMORY[0x24BDD17C8];
  -[MPCAssetLoadPropertiesLocalFileEvaluation filePath](self, "filePath");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("[url: %@]"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v16);

  v17 = (void *)MEMORY[0x24BDD17C8];
  v18 = -[MPCAssetLoadPropertiesLocalFileEvaluation HLSContentPolicy](self, "HLSContentPolicy");
  if (v18 > 3)
    v19 = CFSTR("Unspecified");
  else
    v19 = off_24CAB3848[v18];
  objc_msgSend(v17, "stringWithFormat:", CFSTR("[HLSContentPolicy: %@]"), v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v20);

  v21 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringWithFormat:", CFSTR("File: %@"), v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "removeAllObjects");
  v24 = (void *)MEMORY[0x24BDD17C8];
  v25 = -[MPCAssetLoadPropertiesLocalFileEvaluation expectedQualityType](self, "expectedQualityType");
  if (v25 == 1)
    v26 = CFSTR("Low");
  else
    v26 = CFSTR("Unknown");
  if (v25 == 2)
    v26 = CFSTR("High");
  objc_msgSend(v24, "stringWithFormat:", CFSTR("%@ quality"), v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v27);

  v28 = (void *)MEMORY[0x24BDD17C8];
  v29 = -[MPCAssetLoadPropertiesLocalFileEvaluation expectedAssetType](self, "expectedAssetType");
  if ((unint64_t)(v29 - 1) > 4)
    v30 = CFSTR("Unspecified");
  else
    v30 = off_24CAB3868[v29 - 1];
  objc_msgSend(v28, "stringWithFormat:", CFSTR("%@ audio"), v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v31);

  v32 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "stringWithFormat:", CFSTR("Expectation: %@"), v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "removeAllObjects");
  if (-[MPCAssetLoadPropertiesLocalFileEvaluation fileMatchesRequiredFileFormat](self, "fileMatchesRequiredFileFormat"))
    v35 = CFSTR("file format ✅");
  else
    v35 = CFSTR("file format ❌");
  objc_msgSend(v3, "addObject:", v35);
  if (-[MPCAssetLoadPropertiesLocalFileEvaluation fileMatchesRequiredQuality](self, "fileMatchesRequiredQuality"))
    v36 = CFSTR("quality/audio ✅");
  else
    v36 = CFSTR("quality/audio ❌");
  objc_msgSend(v3, "addObject:", v36);
  v37 = -[MPCAssetLoadPropertiesLocalFileEvaluation recommendation](self, "recommendation") - 1;
  if (v37 <= 2)
    objc_msgSend(v3, "addObject:", off_24CAB3890[v37]);
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ - %@ -> %@"), v23, v34, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  return v39;
}

- (BOOL)fileIsValid
{
  return -[MPCAssetLoadPropertiesLocalFileEvaluation status](self, "status") == 1;
}

- (BOOL)fileShouldBeUpdated
{
  if (-[MPCAssetLoadPropertiesLocalFileEvaluation status](self, "status") == 3
    && -[MPCAssetLoadPropertiesLocalFileEvaluation fileIsDownloaded](self, "fileIsDownloaded"))
  {
    return 0;
  }
  if (!-[MPCAssetLoadPropertiesLocalFileEvaluation fileIsValid](self, "fileIsValid"))
    return 1;
  if (-[MPCAssetLoadPropertiesLocalFileEvaluation fileIsHLS](self, "fileIsHLS")
    && !-[MPCAssetLoadPropertiesLocalFileEvaluation fileMatchesRequiredFileFormat](self, "fileMatchesRequiredFileFormat")&& -[MPCAssetLoadPropertiesLocalFileEvaluation fileMatchesRequiredQuality](self, "fileMatchesRequiredQuality"))
  {
    return 0;
  }
  if (-[MPCAssetLoadPropertiesLocalFileEvaluation fileMatchesRequiredFileFormat](self, "fileMatchesRequiredFileFormat"))
    return !-[MPCAssetLoadPropertiesLocalFileEvaluation fileMatchesRequiredQuality](self, "fileMatchesRequiredQuality");
  else
    return 1;
}

- (MPModelFileAsset)fileAsset
{
  return self->_fileAsset;
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (int64_t)recommendation
{
  return self->_recommendation;
}

- (void)setRecommendation:(int64_t)a3
{
  self->_recommendation = a3;
}

- (BOOL)fileMatchesRequiredFileFormat
{
  return self->_fileMatchesRequiredFileFormat;
}

- (void)setFileMatchesRequiredFileFormat:(BOOL)a3
{
  self->_fileMatchesRequiredFileFormat = a3;
}

- (BOOL)fileMatchesRequiredQuality
{
  return self->_fileMatchesRequiredQuality;
}

- (void)setFileMatchesRequiredQuality:(BOOL)a3
{
  self->_fileMatchesRequiredQuality = a3;
}

- (BOOL)fileIsDownloaded
{
  return self->_fileIsDownloaded;
}

- (void)setFileIsDownloaded:(BOOL)a3
{
  self->_fileIsDownloaded = a3;
}

- (BOOL)fileIsCached
{
  return self->_fileIsCached;
}

- (void)setFileIsCached:(BOOL)a3
{
  self->_fileIsCached = a3;
}

- (BOOL)fileIsHLS
{
  return self->_fileIsHLS;
}

- (void)setFileIsHLS:(BOOL)a3
{
  self->_fileIsHLS = a3;
}

- (int64_t)fileAssetType
{
  return self->_fileAssetType;
}

- (void)setFileAssetType:(int64_t)a3
{
  self->_fileAssetType = a3;
}

- (int64_t)expectedAssetType
{
  return self->_expectedAssetType;
}

- (void)setExpectedAssetType:(int64_t)a3
{
  self->_expectedAssetType = a3;
}

- (int64_t)fileQualityType
{
  return self->_fileQualityType;
}

- (void)setFileQualityType:(int64_t)a3
{
  self->_fileQualityType = a3;
}

- (int64_t)expectedQualityType
{
  return self->_expectedQualityType;
}

- (void)setExpectedQualityType:(int64_t)a3
{
  self->_expectedQualityType = a3;
}

- (NSString)filePath
{
  return self->_filePath;
}

- (void)setFilePath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (int64_t)HLSContentPolicy
{
  return self->_HLSContentPolicy;
}

- (void)setHLSContentPolicy:(int64_t)a3
{
  self->_HLSContentPolicy = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filePath, 0);
  objc_storeStrong((id *)&self->_fileAsset, 0);
}

@end
