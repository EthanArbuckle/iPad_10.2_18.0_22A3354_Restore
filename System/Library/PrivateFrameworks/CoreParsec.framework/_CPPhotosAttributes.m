@implementation _CPPhotosAttributes

- (BOOL)readFrom:(id)a3
{
  return _CPPhotosAttributesReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  int v4;
  void *v5;
  id v6;

  v6 = a3;
  if (-[_CPPhotosAttributes positionIndex](self, "positionIndex"))
    PBDataWriterWriteUint64Field();
  if (-[_CPPhotosAttributes isEmbeddingMatched](self, "isEmbeddingMatched"))
    PBDataWriterWriteBOOLField();
  if (-[_CPPhotosAttributes isMetadataMatched](self, "isMetadataMatched"))
    PBDataWriterWriteBOOLField();
  if (-[_CPPhotosAttributes isVideo](self, "isVideo"))
    PBDataWriterWriteBOOLField();
  if (-[_CPPhotosAttributes isFavorite](self, "isFavorite"))
    PBDataWriterWriteBOOLField();
  v4 = -[_CPPhotosAttributes photosSuggestionType](self, "photosSuggestionType");
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
  unint64_t positionIndex;
  int isEmbeddingMatched;
  int isMetadataMatched;
  int isVideo;
  int isFavorite;
  int photosSuggestionType;
  BOOL v11;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && (positionIndex = self->_positionIndex, positionIndex == objc_msgSend(v4, "positionIndex"))
    && (isEmbeddingMatched = self->_isEmbeddingMatched,
        isEmbeddingMatched == objc_msgSend(v4, "isEmbeddingMatched"))
    && (isMetadataMatched = self->_isMetadataMatched,
        isMetadataMatched == objc_msgSend(v4, "isMetadataMatched"))
    && (isVideo = self->_isVideo, isVideo == objc_msgSend(v4, "isVideo"))
    && (isFavorite = self->_isFavorite, isFavorite == objc_msgSend(v4, "isFavorite")))
  {
    photosSuggestionType = self->_photosSuggestionType;
    v11 = photosSuggestionType == objc_msgSend(v4, "photosSuggestionType");
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  return (2654435761 * self->_isEmbeddingMatched) ^ (2654435761 * self->_isMetadataMatched) ^ (2654435761u
                                                                                                 * self->_positionIndex) ^ (2654435761 * self->_isVideo) ^ (2654435761 * self->_isFavorite) ^ (2654435761 * self->_photosSuggestionType);
}

- (unint64_t)positionIndex
{
  return self->_positionIndex;
}

- (void)setPositionIndex:(unint64_t)a3
{
  self->_positionIndex = a3;
}

- (BOOL)isEmbeddingMatched
{
  return self->_isEmbeddingMatched;
}

- (void)setIsEmbeddingMatched:(BOOL)a3
{
  self->_isEmbeddingMatched = a3;
}

- (BOOL)isMetadataMatched
{
  return self->_isMetadataMatched;
}

- (void)setIsMetadataMatched:(BOOL)a3
{
  self->_isMetadataMatched = a3;
}

- (BOOL)isVideo
{
  return self->_isVideo;
}

- (void)setIsVideo:(BOOL)a3
{
  self->_isVideo = a3;
}

- (BOOL)isFavorite
{
  return self->_isFavorite;
}

- (void)setIsFavorite:(BOOL)a3
{
  self->_isFavorite = a3;
}

- (int)photosSuggestionType
{
  return self->_photosSuggestionType;
}

- (void)setPhotosSuggestionType:(int)a3
{
  self->_photosSuggestionType = a3;
}

- (_CPPhotosAttributes)initWithFacade:(id)a3
{
  id v4;
  _CPPhotosAttributes *v5;
  _CPPhotosAttributes *v6;

  v4 = a3;
  v5 = -[_CPPhotosAttributes init](self, "init");
  if (v5)
  {
    -[_CPPhotosAttributes setPositionIndex:](v5, "setPositionIndex:", objc_msgSend(v4, "positionIndex"));
    -[_CPPhotosAttributes setIsEmbeddingMatched:](v5, "setIsEmbeddingMatched:", objc_msgSend(v4, "isEmbeddingMatched"));
    -[_CPPhotosAttributes setIsMetadataMatched:](v5, "setIsMetadataMatched:", objc_msgSend(v4, "isMetadataMatched"));
    -[_CPPhotosAttributes setIsVideo:](v5, "setIsVideo:", objc_msgSend(v4, "isVideo"));
    -[_CPPhotosAttributes setIsFavorite:](v5, "setIsFavorite:", objc_msgSend(v4, "isFavorite"));
    v6 = v5;
  }

  return v5;
}

@end
