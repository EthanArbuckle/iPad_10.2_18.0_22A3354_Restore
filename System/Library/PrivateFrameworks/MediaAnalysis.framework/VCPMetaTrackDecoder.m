@implementation VCPMetaTrackDecoder

- (VCPMetaTrackDecoder)initWithTrack:(id)a3
{
  id v4;
  VCPMetaTrackDecoder *v5;
  id v6;
  void *v7;
  uint64_t v8;
  AVAssetReader *reader;
  void *v10;
  uint64_t v11;
  AVAssetReaderTrackOutput *readerOutput;
  uint64_t v13;
  AVAssetReaderOutputMetadataAdaptor *readerOutputAdaptor;
  VCPMetaTrackDecoder *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)VCPMetaTrackDecoder;
  v5 = -[VCPMetaTrackDecoder init](&v17, sel_init);
  if (v5)
  {
    if (v4)
    {
      v6 = objc_alloc(MEMORY[0x1E0C8AFD0]);
      objc_msgSend(v4, "asset");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "initWithAsset:error:", v7, 0);
      reader = v5->_reader;
      v5->_reader = (AVAssetReader *)v8;

      v10 = v5->_reader;
      if (!v10)
        goto LABEL_12;
      objc_msgSend(MEMORY[0x1E0C8B000], "assetReaderTrackOutputWithTrack:outputSettings:", v4, 0);
      v11 = objc_claimAutoreleasedReturnValue();
      readerOutput = v5->_readerOutput;
      v5->_readerOutput = (AVAssetReaderTrackOutput *)v11;

      if (v5->_readerOutput)
      {
        objc_msgSend(MEMORY[0x1E0C8AFF0], "assetReaderOutputMetadataAdaptorWithAssetReaderTrackOutput:");
        v13 = objc_claimAutoreleasedReturnValue();
        readerOutputAdaptor = v5->_readerOutputAdaptor;
        v5->_readerOutputAdaptor = (AVAssetReaderOutputMetadataAdaptor *)v13;

        v10 = v5->_readerOutputAdaptor;
        if (v10)
        {
          if (-[AVAssetReader canAddOutput:](v5->_reader, "canAddOutput:", v5->_readerOutput))
          {
            -[AVAssetReader addOutput:](v5->_reader, "addOutput:", v5->_readerOutput);
            if (-[AVAssetReader startReading](v5->_reader, "startReading"))
              v10 = v5;
            else
              v10 = 0;
            goto LABEL_12;
          }
          goto LABEL_11;
        }
LABEL_12:
        v15 = v10;
        goto LABEL_13;
      }
    }
LABEL_11:
    v10 = 0;
    goto LABEL_12;
  }
  v15 = 0;
LABEL_13:

  return v15;
}

- (void)dealloc
{
  AVAssetReader *reader;
  objc_super v4;

  reader = self->_reader;
  if (reader)
    -[AVAssetReader cancelReading](reader, "cancelReading");
  v4.receiver = self;
  v4.super_class = (Class)VCPMetaTrackDecoder;
  -[VCPMetaTrackDecoder dealloc](&v4, sel_dealloc);
}

- (int64_t)status
{
  return -[AVAssetReader status](self->_reader, "status");
}

- (id)copyNextMetadataGroup
{
  -[AVAssetReaderOutputMetadataAdaptor nextTimedMetadataGroup](self->_readerOutputAdaptor, "nextTimedMetadataGroup");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readerOutputAdaptor, 0);
  objc_storeStrong((id *)&self->_readerOutput, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
