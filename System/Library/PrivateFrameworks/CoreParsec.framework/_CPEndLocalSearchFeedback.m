@implementation _CPEndLocalSearchFeedback

- (_CPEndLocalSearchFeedback)init
{
  _CPEndLocalSearchFeedback *v2;
  _CPEndLocalSearchFeedback *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_CPEndLocalSearchFeedback;
  v2 = -[_CPEndLocalSearchFeedback init](&v5, sel_init);
  if (v2)
  {
    -[_CPEndLocalSearchFeedback setTimestamp:](v2, "setTimestamp:", mach_absolute_time());
    v3 = v2;
  }

  return v2;
}

- (_CPEndLocalSearchFeedback)initWithFacade:(id)a3
{
  id v4;
  _CPEndLocalSearchFeedback *v5;
  void *v6;
  void *v7;
  void *v8;
  _CPQueryUnderstandingParse *v9;
  void *v10;
  _CPQueryUnderstandingParse *v11;
  void *v12;
  _CPPhotosRankingInfo *v13;
  void *v14;
  _CPPhotosRankingInfo *v15;
  _CPEndLocalSearchFeedback *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)_CPEndLocalSearchFeedback;
  v5 = -[_CPEndLocalSearchFeedback init](&v18, sel_init);
  if (v5)
  {
    -[_CPEndLocalSearchFeedback setTimestamp:](v5, "setTimestamp:", objc_msgSend(v4, "timestamp"));
    objc_msgSend(v4, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "uuid");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CPEndLocalSearchFeedback setUuid:](v5, "setUuid:", v7);

    }
    objc_msgSend(v4, "quParse");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = [_CPQueryUnderstandingParse alloc];
      objc_msgSend(v4, "quParse");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[_CPQueryUnderstandingParse initWithFacade:](v9, "initWithFacade:", v10);
      -[_CPEndLocalSearchFeedback setQuParse:](v5, "setQuParse:", v11);

    }
    -[_CPEndLocalSearchFeedback setL1ToL2ResultCount:](v5, "setL1ToL2ResultCount:", objc_msgSend(v4, "l1ToL2ResultCount"));
    -[_CPEndLocalSearchFeedback setCoreSpotlightIndexCount:](v5, "setCoreSpotlightIndexCount:", objc_msgSend(v4, "coreSpotlightIndexCount"));
    objc_msgSend(v4, "photosRankingInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = [_CPPhotosRankingInfo alloc];
      objc_msgSend(v4, "photosRankingInfo");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[_CPPhotosRankingInfo initWithFacade:](v13, "initWithFacade:", v14);
      -[_CPEndLocalSearchFeedback setPhotosRankingInfo:](v5, "setPhotosRankingInfo:", v15);

    }
    v16 = v5;
  }

  return v5;
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (-[_CPEndLocalSearchFeedback timestamp](self, "timestamp"))
    PBDataWriterWriteUint64Field();
  -[_CPEndLocalSearchFeedback uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[_CPEndLocalSearchFeedback quParse](self, "quParse");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_CPEndLocalSearchFeedback quParse](self, "quParse");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_CPEndLocalSearchFeedback l1ToL2ResultCount](self, "l1ToL2ResultCount"))
    PBDataWriterWriteUint32Field();
  if (-[_CPEndLocalSearchFeedback coreSpotlightIndexCount](self, "coreSpotlightIndexCount"))
    PBDataWriterWriteUint32Field();
  -[_CPEndLocalSearchFeedback photosRankingInfo](self, "photosRankingInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[_CPEndLocalSearchFeedback photosRankingInfo](self, "photosRankingInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (_CPQueryUnderstandingParse)quParse
{
  return self->_quParse;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
}

- (void)setUuid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photosRankingInfo, 0);
  objc_storeStrong((id *)&self->_quParse, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (BOOL)readFrom:(id)a3
{
  return _CPEndLocalSearchFeedbackReadFrom(self, (uint64_t)a3);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t timestamp;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  unsigned int l1ToL2ResultCount;
  unsigned int coreSpotlightIndexCount;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  BOOL v25;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_20;
  timestamp = self->_timestamp;
  if (timestamp != objc_msgSend(v4, "timestamp"))
    goto LABEL_20;
  -[_CPEndLocalSearchFeedback uuid](self, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_19;
  -[_CPEndLocalSearchFeedback uuid](self, "uuid");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[_CPEndLocalSearchFeedback uuid](self, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uuid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_20;
  }
  else
  {

  }
  -[_CPEndLocalSearchFeedback quParse](self, "quParse");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "quParse");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_19;
  -[_CPEndLocalSearchFeedback quParse](self, "quParse");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[_CPEndLocalSearchFeedback quParse](self, "quParse");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "quParse");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_20;
  }
  else
  {

  }
  l1ToL2ResultCount = self->_l1ToL2ResultCount;
  if (l1ToL2ResultCount != objc_msgSend(v4, "l1ToL2ResultCount"))
    goto LABEL_20;
  coreSpotlightIndexCount = self->_coreSpotlightIndexCount;
  if (coreSpotlightIndexCount != objc_msgSend(v4, "coreSpotlightIndexCount"))
    goto LABEL_20;
  -[_CPEndLocalSearchFeedback photosRankingInfo](self, "photosRankingInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "photosRankingInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[_CPEndLocalSearchFeedback photosRankingInfo](self, "photosRankingInfo");
    v20 = objc_claimAutoreleasedReturnValue();
    if (!v20)
    {

LABEL_23:
      v25 = 1;
      goto LABEL_21;
    }
    v21 = (void *)v20;
    -[_CPEndLocalSearchFeedback photosRankingInfo](self, "photosRankingInfo");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "photosRankingInfo");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v22, "isEqual:", v23);

    if ((v24 & 1) != 0)
      goto LABEL_23;
  }
  else
  {
LABEL_19:

  }
LABEL_20:
  v25 = 0;
LABEL_21:

  return v25;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  unint64_t v5;
  uint64_t v6;

  v3 = 2654435761u * self->_timestamp;
  v4 = -[NSString hash](self->_uuid, "hash");
  v5 = v4 ^ -[_CPQueryUnderstandingParse hash](self->_quParse, "hash") ^ (2654435761 * self->_l1ToL2ResultCount) ^ v3;
  v6 = 2654435761 * self->_coreSpotlightIndexCount;
  return v5 ^ v6 ^ -[_CPPhotosRankingInfo hash](self->_photosRankingInfo, "hash");
}

- (void)setQuParse:(id)a3
{
  objc_storeStrong((id *)&self->_quParse, a3);
}

- (unsigned)l1ToL2ResultCount
{
  return self->_l1ToL2ResultCount;
}

- (void)setL1ToL2ResultCount:(unsigned int)a3
{
  self->_l1ToL2ResultCount = a3;
}

- (unsigned)coreSpotlightIndexCount
{
  return self->_coreSpotlightIndexCount;
}

- (void)setCoreSpotlightIndexCount:(unsigned int)a3
{
  self->_coreSpotlightIndexCount = a3;
}

- (_CPPhotosRankingInfo)photosRankingInfo
{
  return self->_photosRankingInfo;
}

- (void)setPhotosRankingInfo:(id)a3
{
  objc_storeStrong((id *)&self->_photosRankingInfo, a3);
}

@end
