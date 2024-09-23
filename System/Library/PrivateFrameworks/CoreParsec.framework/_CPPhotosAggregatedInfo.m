@implementation _CPPhotosAggregatedInfo

- (BOOL)readFrom:(id)a3
{
  return _CPPhotosAggregatedInfoReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  int v4;
  void *v5;
  id v6;

  v6 = a3;
  if (-[_CPPhotosAggregatedInfo totalNumberOfAssets](self, "totalNumberOfAssets"))
    PBDataWriterWriteInt32Field();
  if (-[_CPPhotosAggregatedInfo totalNumberOfEmbeddingMatchedAssets](self, "totalNumberOfEmbeddingMatchedAssets"))
    PBDataWriterWriteInt32Field();
  v4 = -[_CPPhotosAggregatedInfo totalNumberOfMetadataMatchedAssets](self, "totalNumberOfMetadataMatchedAssets");
  v5 = v6;
  if (v4)
  {
    PBDataWriterWriteInt32Field();
    v5 = v6;
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int totalNumberOfAssets;
  int totalNumberOfEmbeddingMatchedAssets;
  int totalNumberOfMetadataMatchedAssets;
  BOOL v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && (totalNumberOfAssets = self->_totalNumberOfAssets,
        totalNumberOfAssets == objc_msgSend(v4, "totalNumberOfAssets"))
    && (totalNumberOfEmbeddingMatchedAssets = self->_totalNumberOfEmbeddingMatchedAssets,
        totalNumberOfEmbeddingMatchedAssets == objc_msgSend(v4, "totalNumberOfEmbeddingMatchedAssets")))
  {
    totalNumberOfMetadataMatchedAssets = self->_totalNumberOfMetadataMatchedAssets;
    v8 = totalNumberOfMetadataMatchedAssets == objc_msgSend(v4, "totalNumberOfMetadataMatchedAssets");
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  return (2654435761 * self->_totalNumberOfEmbeddingMatchedAssets) ^ (2654435761 * self->_totalNumberOfAssets) ^ (2654435761 * self->_totalNumberOfMetadataMatchedAssets);
}

- (int)totalNumberOfAssets
{
  return self->_totalNumberOfAssets;
}

- (void)setTotalNumberOfAssets:(int)a3
{
  self->_totalNumberOfAssets = a3;
}

- (int)totalNumberOfEmbeddingMatchedAssets
{
  return self->_totalNumberOfEmbeddingMatchedAssets;
}

- (void)setTotalNumberOfEmbeddingMatchedAssets:(int)a3
{
  self->_totalNumberOfEmbeddingMatchedAssets = a3;
}

- (int)totalNumberOfMetadataMatchedAssets
{
  return self->_totalNumberOfMetadataMatchedAssets;
}

- (void)setTotalNumberOfMetadataMatchedAssets:(int)a3
{
  self->_totalNumberOfMetadataMatchedAssets = a3;
}

- (_CPPhotosAggregatedInfo)initWithFacade:(id)a3
{
  id v4;
  _CPPhotosAggregatedInfo *v5;
  _CPPhotosAggregatedInfo *v6;

  v4 = a3;
  v5 = -[_CPPhotosAggregatedInfo init](self, "init");
  if (v5)
  {
    -[_CPPhotosAggregatedInfo setTotalNumberOfAssets:](v5, "setTotalNumberOfAssets:", objc_msgSend(v4, "totalNumberOfAssets"));
    -[_CPPhotosAggregatedInfo setTotalNumberOfEmbeddingMatchedAssets:](v5, "setTotalNumberOfEmbeddingMatchedAssets:", objc_msgSend(v4, "totalNumberOfEmbeddingMatchedAssets"));
    -[_CPPhotosAggregatedInfo setTotalNumberOfMetadataMatchedAssets:](v5, "setTotalNumberOfMetadataMatchedAssets:", objc_msgSend(v4, "totalNumberOfMetadataMatchedAssets"));
    v6 = v5;
  }

  return v5;
}

@end
