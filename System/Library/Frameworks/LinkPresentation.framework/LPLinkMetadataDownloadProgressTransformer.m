@implementation LPLinkMetadataDownloadProgressTransformer

- (LPLinkMetadataDownloadProgressTransformer)initWithBytesLoaded:(unint64_t)a3 downloadState:(int64_t)a4 metadata:(id)a5
{
  id v8;
  LPLinkMetadataDownloadProgressTransformer *v9;
  LPLinkMetadataDownloadProgressTransformer *v10;
  LPLinkMetadataDownloadProgressTransformer *v11;
  objc_super v13;

  v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)LPLinkMetadataDownloadProgressTransformer;
  v9 = -[LPLinkMetadataDownloadProgressTransformer init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_bytesLoaded = a3;
    objc_storeStrong((id *)&v9->_metadata, a5);
    v11 = v10;
  }

  return v10;
}

- (id)downloadProgressForTransformer:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;

  -[LPLinkMetadata specialization](self->_metadata, "specialization", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "conformsToProtocol:", &unk_1EE5EA628);

  if (v5)
  {
    -[LPLinkMetadata specialization](self->_metadata, "specialization");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "downloadProgressForTransformer:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (unint64_t)bytesLoaded
{
  return self->_bytesLoaded;
}

- (void)setBytesLoaded:(unint64_t)a3
{
  self->_bytesLoaded = a3;
}

- (LPLinkMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
}

@end
