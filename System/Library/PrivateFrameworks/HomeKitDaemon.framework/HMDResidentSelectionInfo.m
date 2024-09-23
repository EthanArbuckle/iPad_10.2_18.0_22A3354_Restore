@implementation HMDResidentSelectionInfo

- (HMDResidentSelectionInfo)initWithPreferredResidentIDSIdentifier:(id)a3 selectionTimestamp:(id)a4
{
  return -[HMDResidentSelectionInfo initWithPreferredResidentIDSIdentifier:currentResidentSelectionModeType:selectionTimestamp:](self, "initWithPreferredResidentIDSIdentifier:currentResidentSelectionModeType:selectionTimestamp:");
}

- (HMDResidentSelectionInfo)initWithPreferredResidentIDSIdentifier:(id)a3 currentResidentSelectionModeType:(unint64_t)a4 selectionTimestamp:(id)a5
{
  NSUUID *v8;
  NSDate *v9;
  HMDResidentSelectionInfo *v10;
  NSUUID *preferredResidentIDSIdentifier;
  NSUUID *v12;
  NSDate *selectionTimestamp;
  objc_super v15;

  v8 = (NSUUID *)a3;
  v9 = (NSDate *)a5;
  v15.receiver = self;
  v15.super_class = (Class)HMDResidentSelectionInfo;
  v10 = -[HMDResidentSelectionInfo init](&v15, sel_init);
  preferredResidentIDSIdentifier = v10->_preferredResidentIDSIdentifier;
  v10->_preferredResidentIDSIdentifier = v8;
  v12 = v8;

  selectionTimestamp = v10->_selectionTimestamp;
  v10->_currentModeType = a4;
  v10->_selectionTimestamp = v9;

  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HMDResidentSelectionInfo preferredResidentIDSIdentifier](self, "preferredResidentIDSIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HMDResidentSelectionInfo currentModeType](self, "currentModeType");
  -[HMDResidentSelectionInfo selectionTimestamp](self, "selectionTimestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localTimeDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Preferred resident IDS identifier: %@, Mode: %lu, Selection Timestamp: %@"), v4, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSUUID)preferredResidentIDSIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPreferredResidentIDSIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (unint64_t)currentModeType
{
  return self->_currentModeType;
}

- (NSDate)selectionTimestamp
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionTimestamp, 0);
  objc_storeStrong((id *)&self->_preferredResidentIDSIdentifier, 0);
}

@end
