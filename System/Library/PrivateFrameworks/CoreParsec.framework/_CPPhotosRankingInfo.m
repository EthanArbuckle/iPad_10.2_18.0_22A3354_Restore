@implementation _CPPhotosRankingInfo

- (BOOL)readFrom:(id)a3
{
  return _CPPhotosRankingInfoReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  int v4;
  void *v5;
  id v6;

  v6 = a3;
  if (-[_CPPhotosRankingInfo totalNumberOfAssetsIndexed](self, "totalNumberOfAssetsIndexed"))
    PBDataWriterWriteInt32Field();
  if (-[_CPPhotosRankingInfo totalNumberOfAssetsInLibrary](self, "totalNumberOfAssetsInLibrary"))
    PBDataWriterWriteInt32Field();
  if (-[_CPPhotosRankingInfo totalNumberOfEmbeddingMatchedAssets](self, "totalNumberOfEmbeddingMatchedAssets"))
    PBDataWriterWriteInt32Field();
  if (-[_CPPhotosRankingInfo totalNumberOfMetadataMatchedAssets](self, "totalNumberOfMetadataMatchedAssets"))
    PBDataWriterWriteInt32Field();
  v4 = -[_CPPhotosRankingInfo assetEstimationOffAmount](self, "assetEstimationOffAmount");
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
  int totalNumberOfAssetsIndexed;
  int totalNumberOfAssetsInLibrary;
  int totalNumberOfEmbeddingMatchedAssets;
  int totalNumberOfMetadataMatchedAssets;
  int assetEstimationOffAmount;
  BOOL v10;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && (totalNumberOfAssetsIndexed = self->_totalNumberOfAssetsIndexed,
        totalNumberOfAssetsIndexed == objc_msgSend(v4, "totalNumberOfAssetsIndexed"))
    && (totalNumberOfAssetsInLibrary = self->_totalNumberOfAssetsInLibrary,
        totalNumberOfAssetsInLibrary == objc_msgSend(v4, "totalNumberOfAssetsInLibrary"))
    && (totalNumberOfEmbeddingMatchedAssets = self->_totalNumberOfEmbeddingMatchedAssets,
        totalNumberOfEmbeddingMatchedAssets == objc_msgSend(v4, "totalNumberOfEmbeddingMatchedAssets"))
    && (totalNumberOfMetadataMatchedAssets = self->_totalNumberOfMetadataMatchedAssets,
        totalNumberOfMetadataMatchedAssets == objc_msgSend(v4, "totalNumberOfMetadataMatchedAssets")))
  {
    assetEstimationOffAmount = self->_assetEstimationOffAmount;
    v10 = assetEstimationOffAmount == objc_msgSend(v4, "assetEstimationOffAmount");
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  return (2654435761 * self->_totalNumberOfAssetsInLibrary) ^ (2654435761 * self->_totalNumberOfAssetsIndexed) ^ (2654435761 * self->_totalNumberOfEmbeddingMatchedAssets) ^ (2654435761 * self->_totalNumberOfMetadataMatchedAssets) ^ (2654435761 * self->_assetEstimationOffAmount);
}

- (int)totalNumberOfAssetsIndexed
{
  return self->_totalNumberOfAssetsIndexed;
}

- (void)setTotalNumberOfAssetsIndexed:(int)a3
{
  self->_totalNumberOfAssetsIndexed = a3;
}

- (int)totalNumberOfAssetsInLibrary
{
  return self->_totalNumberOfAssetsInLibrary;
}

- (void)setTotalNumberOfAssetsInLibrary:(int)a3
{
  self->_totalNumberOfAssetsInLibrary = a3;
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

- (int)assetEstimationOffAmount
{
  return self->_assetEstimationOffAmount;
}

- (void)setAssetEstimationOffAmount:(int)a3
{
  self->_assetEstimationOffAmount = a3;
}

- (_CPPhotosRankingInfo)initWithFacade:(id)a3
{
  id v4;
  _CPPhotosRankingInfo *v5;
  _CPPhotosRankingInfo *v6;

  v4 = a3;
  v5 = -[_CPPhotosRankingInfo init](self, "init");
  if (v5)
  {
    -[_CPPhotosRankingInfo setTotalNumberOfAssetsIndexed:](v5, "setTotalNumberOfAssetsIndexed:", objc_msgSend(v4, "totalNumberOfAssetsIndexed"));
    -[_CPPhotosRankingInfo setTotalNumberOfAssetsInLibrary:](v5, "setTotalNumberOfAssetsInLibrary:", objc_msgSend(v4, "totalNumberOfAssetsInLibrary"));
    v6 = v5;
  }

  return v5;
}

@end
