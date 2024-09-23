@implementation CCMergeableDeltaFileTransferMessageMetadata

+ (id)mergeableDeltaFileTransferMessageMetadataFromPeerToPeerMessage:(id)a3 mergeableDeltaMetadataVectors:(id)a4 fileFormatVersion:(unint64_t)a5 peerPublicKey:(id)a6
{
  id v9;
  id v10;
  id v11;
  CCMergeableDeltaFileTransferMessageMetadata *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  double v16;
  double v17;
  void *v18;
  CCMergeableDeltaFileTransferMessageMetadata *v19;

  v9 = a6;
  v10 = a4;
  v11 = a3;
  v12 = [CCMergeableDeltaFileTransferMessageMetadata alloc];
  objc_msgSend(v11, "set");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "device");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v11, "protocolVersion");
  objc_msgSend(v11, "walltime");
  v17 = v16;
  objc_msgSend(v11, "peerPublicKey");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = -[CCPeerToPeerMessage initWithSet:device:protocolVersion:wallTime:peerPublicKey:](v12, "initWithSet:device:protocolVersion:wallTime:peerPublicKey:", v13, v14, v15, v18, v17);
  -[CCMergeableDeltaFileTransferMessageMetadata setMergeableDeltaMetadataVectors:](v19, "setMergeableDeltaMetadataVectors:", v10);

  -[CCMergeableDeltaFileTransferMessageMetadata setFileFormatVersion:](v19, "setFileFormatVersion:", a5);
  -[CCPeerToPeerMessage setPeerPublicKey:](v19, "setPeerPublicKey:", v9);

  return v19;
}

- (id)initFromDictionary:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CCMergeableDeltaFileTransferMessageMetadata;
  v5 = -[CCPeerToPeerMessage initFromDictionary:](&v10, sel_initFromDictionary_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("fileFormatVersion"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5[6] = objc_msgSend(v6, "unsignedIntegerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mergeableDeltaMetadataVectors"));
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v5[7];
    v5[7] = v7;

  }
  return v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v9[0] = CFSTR("fileFormatVersion");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_fileFormatVersion);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = CFSTR("mergeableDeltaMetadataVectors");
  v10[0] = v3;
  v10[1] = self->_mergeableDeltaMetadataVectors;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  v8.receiver = self;
  v8.super_class = (Class)CCMergeableDeltaFileTransferMessageMetadata;
  -[CCPeerToPeerMessage dictionaryRepresentation](&v8, sel_dictionaryRepresentation);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addEntriesFromDictionary:", v6);

  return v5;
}

- (unint64_t)fileFormatVersion
{
  return self->_fileFormatVersion;
}

- (void)setFileFormatVersion:(unint64_t)a3
{
  self->_fileFormatVersion = a3;
}

- (NSData)mergeableDeltaMetadataVectors
{
  return self->_mergeableDeltaMetadataVectors;
}

- (void)setMergeableDeltaMetadataVectors:(id)a3
{
  objc_storeStrong((id *)&self->_mergeableDeltaMetadataVectors, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mergeableDeltaMetadataVectors, 0);
}

@end
