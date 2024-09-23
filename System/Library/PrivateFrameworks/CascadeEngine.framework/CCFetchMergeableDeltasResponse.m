@implementation CCFetchMergeableDeltasResponse

+ (id)fetchMergeableDeltasResponseFromPeerToPeerMessage:(id)a3 mergeableDelta:(id)a4 mergeableDeltaMetadataVectors:(id)a5
{
  id v7;
  id v8;
  id v9;
  CCFetchMergeableDeltasResponse *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  double v14;
  double v15;
  void *v16;
  CCFetchMergeableDeltasResponse *v17;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = [CCFetchMergeableDeltasResponse alloc];
  objc_msgSend(v9, "set");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "device");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v9, "protocolVersion");
  objc_msgSend(v9, "walltime");
  v15 = v14;
  objc_msgSend(v9, "peerPublicKey");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[CCPeerToPeerMessage initWithSet:device:protocolVersion:wallTime:peerPublicKey:](v10, "initWithSet:device:protocolVersion:wallTime:peerPublicKey:", v11, v12, v13, v16, v15);
  -[CCFetchMergeableDeltasResponse setMergeableDelta:](v17, "setMergeableDelta:", v8);

  -[CCFetchMergeableDeltasResponse setMergeableDeltaMetadataVectors:](v17, "setMergeableDeltaMetadataVectors:", v7);
  return v17;
}

- (id)initFromDictionary:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CCFetchMergeableDeltasResponse;
  v5 = -[CCPeerToPeerMessage initFromDictionary:](&v11, sel_initFromDictionary_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mergeableDelta"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v5[6];
    v5[6] = v6;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mergeableDeltaMetadataVectors"));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v5[7];
    v5[7] = v8;

  }
  return v5;
}

- (id)dictionaryRepresentation
{
  NSData *mergeableDelta;
  void *v4;
  NSData *mergeableDeltaMetadataVectors;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v12[0] = CFSTR("mergeableDelta");
  mergeableDelta = self->_mergeableDelta;
  v4 = mergeableDelta;
  if (!mergeableDelta)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "data");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[1] = CFSTR("mergeableDeltaMetadataVectors");
  v13[0] = v4;
  mergeableDeltaMetadataVectors = self->_mergeableDeltaMetadataVectors;
  v6 = mergeableDeltaMetadataVectors;
  if (!mergeableDeltaMetadataVectors)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "data");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  if (!mergeableDeltaMetadataVectors)
  {

    if (mergeableDelta)
      goto LABEL_7;
LABEL_9:

    goto LABEL_7;
  }
  if (!mergeableDelta)
    goto LABEL_9;
LABEL_7:
  v11.receiver = self;
  v11.super_class = (Class)CCFetchMergeableDeltasResponse;
  -[CCPeerToPeerMessage dictionaryRepresentation](&v11, sel_dictionaryRepresentation);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addEntriesFromDictionary:", v9);

  return v8;
}

- (NSData)mergeableDelta
{
  return self->_mergeableDelta;
}

- (void)setMergeableDelta:(id)a3
{
  objc_storeStrong((id *)&self->_mergeableDelta, a3);
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
  objc_storeStrong((id *)&self->_mergeableDelta, 0);
}

@end
