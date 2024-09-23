@implementation SGMIMetricsInferenceAndGroundTruth

- (BOOL)hasTrialMetadata
{
  return self->_trialMetadata != 0;
}

- (BOOL)hasSubmodelsProbabilities
{
  return self->_submodelsProbabilities != 0;
}

- (void)setPredictedSaliencyScore:(float)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_predictedSaliencyScore = a3;
}

- (void)setHasPredictedSaliencyScore:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasPredictedSaliencyScore
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (int)predictedSaliency
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
    return self->_predictedSaliency;
  else
    return 1;
}

- (void)setPredictedSaliency:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_predictedSaliency = a3;
}

- (void)setHasPredictedSaliency:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasPredictedSaliency
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)predictedSaliencyAsString:(int)a3
{
  if ((a3 - 1) < 3)
    return off_1E7DB7398[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsPredictedSaliency:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Salient")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Neutral")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Ignorable")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)setSaliencyPredictionPerformanceInMilliSeconds:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_saliencyPredictionPerformanceInMilliSeconds = a3;
}

- (void)setHasSaliencyPredictionPerformanceInMilliSeconds:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSaliencyPredictionPerformanceInMilliSeconds
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setEstimatedGroundTruth:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_estimatedGroundTruth = a3;
}

- (void)setHasEstimatedGroundTruth:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasEstimatedGroundTruth
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)clearMissingAttachments
{
  -[NSMutableArray removeAllObjects](self->_missingAttachments, "removeAllObjects");
}

- (void)addMissingAttachment:(id)a3
{
  id v4;
  NSMutableArray *missingAttachments;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  missingAttachments = self->_missingAttachments;
  v8 = v4;
  if (!missingAttachments)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_missingAttachments;
    self->_missingAttachments = v6;

    v4 = v8;
    missingAttachments = self->_missingAttachments;
  }
  -[NSMutableArray addObject:](missingAttachments, "addObject:", v4);

}

- (unint64_t)missingAttachmentsCount
{
  return -[NSMutableArray count](self->_missingAttachments, "count");
}

- (id)missingAttachmentAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_missingAttachments, "objectAtIndex:", a3);
}

- (void)setMissingAttachmentPredictionPerformanceInMilliSeconds:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_missingAttachmentPredictionPerformanceInMilliSeconds = a3;
}

- (void)setHasMissingAttachmentPredictionPerformanceInMilliSeconds:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMissingAttachmentPredictionPerformanceInMilliSeconds
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)clearMissingRecipients
{
  -[NSMutableArray removeAllObjects](self->_missingRecipients, "removeAllObjects");
}

- (void)addMissingRecipient:(id)a3
{
  id v4;
  NSMutableArray *missingRecipients;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  missingRecipients = self->_missingRecipients;
  v8 = v4;
  if (!missingRecipients)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_missingRecipients;
    self->_missingRecipients = v6;

    v4 = v8;
    missingRecipients = self->_missingRecipients;
  }
  -[NSMutableArray addObject:](missingRecipients, "addObject:", v4);

}

- (unint64_t)missingRecipientsCount
{
  return -[NSMutableArray count](self->_missingRecipients, "count");
}

- (id)missingRecipientAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_missingRecipients, "objectAtIndex:", a3);
}

- (void)setMissingRecipientPredictionPerformanceInMilliSeconds:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_missingRecipientPredictionPerformanceInMilliSeconds = a3;
}

- (void)setHasMissingRecipientPredictionPerformanceInMilliSeconds:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMissingRecipientPredictionPerformanceInMilliSeconds
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)SGMIMetricsInferenceAndGroundTruth;
  -[SGMIMetricsInferenceAndGroundTruth description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGMIMetricsInferenceAndGroundTruth dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  double v4;
  SGMIMetricsTrialMetadata *trialMetadata;
  void *v6;
  SGMIMetricsSubmodelsProbabilities *submodelsProbabilities;
  void *v8;
  char has;
  void *v10;
  void *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  void *v28;
  unsigned int v29;
  __CFString *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  trialMetadata = self->_trialMetadata;
  if (trialMetadata)
  {
    -[SGMIMetricsTrialMetadata dictionaryRepresentation](trialMetadata, "dictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("trialMetadata"));

  }
  submodelsProbabilities = self->_submodelsProbabilities;
  if (submodelsProbabilities)
  {
    -[SGMIMetricsSubmodelsProbabilities dictionaryRepresentation](submodelsProbabilities, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("submodelsProbabilities"));

  }
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *(float *)&v4 = self->_predictedSaliencyScore;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("predictedSaliencyScore"));

    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_7:
      if ((has & 4) == 0)
        goto LABEL_8;
      goto LABEL_38;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_7;
  }
  v29 = self->_predictedSaliency - 1;
  if (v29 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_predictedSaliency);
    v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v30 = off_1E7DB7398[v29];
  }
  objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("predictedSaliency"));

  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_38:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_saliencyPredictionPerformanceInMilliSeconds);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v31, CFSTR("saliencyPredictionPerformanceInMilliSeconds"));

  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_9:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_estimatedGroundTruth);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("estimatedGroundTruth"));

  }
LABEL_10:
  if (-[NSMutableArray count](self->_missingAttachments, "count"))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_missingAttachments, "count"));
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v12 = self->_missingAttachments;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v37 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * i), "dictionaryRepresentation");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v17);

        }
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      }
      while (v14);
    }

    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("missingAttachment"));
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_missingAttachmentPredictionPerformanceInMilliSeconds);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("missingAttachmentPredictionPerformanceInMilliSeconds"));

  }
  if (-[NSMutableArray count](self->_missingRecipients, "count"))
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_missingRecipients, "count"));
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v20 = self->_missingRecipients;
    v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v33;
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v33 != v23)
            objc_enumerationMutation(v20);
          objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * j), "dictionaryRepresentation");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addObject:", v25);

        }
        v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
      }
      while (v22);
    }

    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("missingRecipient"));
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_missingRecipientPredictionPerformanceInMilliSeconds);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("missingRecipientPredictionPerformanceInMilliSeconds"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SGMIMetricsInferenceAndGroundTruthReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_trialMetadata)
    PBDataWriterWriteSubmessage();
  if (self->_submodelsProbabilities)
    PBDataWriterWriteSubmessage();
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteFloatField();
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_7:
      if ((has & 4) == 0)
        goto LABEL_8;
      goto LABEL_31;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_31:
  PBDataWriterWriteUint64Field();
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
LABEL_9:
    PBDataWriterWriteBOOLField();
LABEL_10:
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = self->_missingAttachments;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v8);
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v11 = self->_missingRecipients;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        PBDataWriterWriteSubmessage();
      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v13);
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteUint64Field();

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t j;
  void *v13;
  id v14;

  v4 = a3;
  v14 = v4;
  if (self->_trialMetadata)
  {
    objc_msgSend(v4, "setTrialMetadata:");
    v4 = v14;
  }
  if (self->_submodelsProbabilities)
  {
    objc_msgSend(v14, "setSubmodelsProbabilities:");
    v4 = v14;
  }
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *((_DWORD *)v4 + 13) = LODWORD(self->_predictedSaliencyScore);
    *((_BYTE *)v4 + 76) |= 0x10u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_7:
      if ((has & 4) == 0)
        goto LABEL_8;
LABEL_25:
      *((_QWORD *)v4 + 3) = self->_saliencyPredictionPerformanceInMilliSeconds;
      *((_BYTE *)v4 + 76) |= 4u;
      if ((*(_BYTE *)&self->_has & 0x20) == 0)
        goto LABEL_10;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_7;
  }
  *((_DWORD *)v4 + 12) = self->_predictedSaliency;
  *((_BYTE *)v4 + 76) |= 8u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_25;
LABEL_8:
  if ((has & 0x20) != 0)
  {
LABEL_9:
    *((_BYTE *)v4 + 72) = self->_estimatedGroundTruth;
    *((_BYTE *)v4 + 76) |= 0x20u;
  }
LABEL_10:
  if (-[SGMIMetricsInferenceAndGroundTruth missingAttachmentsCount](self, "missingAttachmentsCount"))
  {
    objc_msgSend(v14, "clearMissingAttachments");
    v6 = -[SGMIMetricsInferenceAndGroundTruth missingAttachmentsCount](self, "missingAttachmentsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        -[SGMIMetricsInferenceAndGroundTruth missingAttachmentAtIndex:](self, "missingAttachmentAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addMissingAttachment:", v9);

      }
    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v14 + 1) = self->_missingAttachmentPredictionPerformanceInMilliSeconds;
    *((_BYTE *)v14 + 76) |= 1u;
  }
  if (-[SGMIMetricsInferenceAndGroundTruth missingRecipientsCount](self, "missingRecipientsCount"))
  {
    objc_msgSend(v14, "clearMissingRecipients");
    v10 = -[SGMIMetricsInferenceAndGroundTruth missingRecipientsCount](self, "missingRecipientsCount");
    if (v10)
    {
      v11 = v10;
      for (j = 0; j != v11; ++j)
      {
        -[SGMIMetricsInferenceAndGroundTruth missingRecipientAtIndex:](self, "missingRecipientAtIndex:", j);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addMissingRecipient:", v13);

      }
    }
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_QWORD *)v14 + 2) = self->_missingRecipientPredictionPerformanceInMilliSeconds;
    *((_BYTE *)v14 + 76) |= 2u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  char has;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[SGMIMetricsTrialMetadata copyWithZone:](self->_trialMetadata, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v6;

  v8 = -[SGMIMetricsSubmodelsProbabilities copyWithZone:](self->_submodelsProbabilities, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v8;

  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *(float *)(v5 + 52) = self->_predictedSaliencyScore;
    *(_BYTE *)(v5 + 76) |= 0x10u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_27;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 48) = self->_predictedSaliency;
  *(_BYTE *)(v5 + 76) |= 8u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_27:
  *(_QWORD *)(v5 + 24) = self->_saliencyPredictionPerformanceInMilliSeconds;
  *(_BYTE *)(v5 + 76) |= 4u;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_5:
    *(_BYTE *)(v5 + 72) = self->_estimatedGroundTruth;
    *(_BYTE *)(v5 + 76) |= 0x20u;
  }
LABEL_6:
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v11 = self->_missingAttachments;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v29 != v14)
          objc_enumerationMutation(v11);
        v16 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addMissingAttachment:", v16);

      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v13);
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_missingAttachmentPredictionPerformanceInMilliSeconds;
    *(_BYTE *)(v5 + 76) |= 1u;
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v17 = self->_missingRecipients;
  v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v25;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v25 != v20)
          objc_enumerationMutation(v17);
        v22 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v24);
        objc_msgSend((id)v5, "addMissingRecipient:", v22);

      }
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v19);
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_missingRecipientPredictionPerformanceInMilliSeconds;
    *(_BYTE *)(v5 + 76) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  SGMIMetricsTrialMetadata *trialMetadata;
  SGMIMetricsSubmodelsProbabilities *submodelsProbabilities;
  char has;
  char v8;
  NSMutableArray *missingAttachments;
  NSMutableArray *missingRecipients;
  BOOL v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_44;
  trialMetadata = self->_trialMetadata;
  if ((unint64_t)trialMetadata | *((_QWORD *)v4 + 8))
  {
    if (!-[SGMIMetricsTrialMetadata isEqual:](trialMetadata, "isEqual:"))
      goto LABEL_44;
  }
  submodelsProbabilities = self->_submodelsProbabilities;
  if ((unint64_t)submodelsProbabilities | *((_QWORD *)v4 + 7))
  {
    if (!-[SGMIMetricsSubmodelsProbabilities isEqual:](submodelsProbabilities, "isEqual:"))
      goto LABEL_44;
  }
  has = (char)self->_has;
  v8 = *((_BYTE *)v4 + 76);
  if ((has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 0x10) == 0 || self->_predictedSaliencyScore != *((float *)v4 + 13))
      goto LABEL_44;
  }
  else if ((*((_BYTE *)v4 + 76) & 0x10) != 0)
  {
    goto LABEL_44;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 8) == 0 || self->_predictedSaliency != *((_DWORD *)v4 + 12))
      goto LABEL_44;
  }
  else if ((*((_BYTE *)v4 + 76) & 8) != 0)
  {
    goto LABEL_44;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 4) == 0 || self->_saliencyPredictionPerformanceInMilliSeconds != *((_QWORD *)v4 + 3))
      goto LABEL_44;
  }
  else if ((*((_BYTE *)v4 + 76) & 4) != 0)
  {
    goto LABEL_44;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 0x20) == 0)
      goto LABEL_44;
    if (self->_estimatedGroundTruth)
    {
      if (!*((_BYTE *)v4 + 72))
        goto LABEL_44;
    }
    else if (*((_BYTE *)v4 + 72))
    {
      goto LABEL_44;
    }
  }
  else if ((*((_BYTE *)v4 + 76) & 0x20) != 0)
  {
    goto LABEL_44;
  }
  missingAttachments = self->_missingAttachments;
  if ((unint64_t)missingAttachments | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](missingAttachments, "isEqual:"))
      goto LABEL_44;
    has = (char)self->_has;
    v8 = *((_BYTE *)v4 + 76);
  }
  if ((has & 1) != 0)
  {
    if ((v8 & 1) == 0 || self->_missingAttachmentPredictionPerformanceInMilliSeconds != *((_QWORD *)v4 + 1))
      goto LABEL_44;
  }
  else if ((v8 & 1) != 0)
  {
    goto LABEL_44;
  }
  missingRecipients = self->_missingRecipients;
  if ((unint64_t)missingRecipients | *((_QWORD *)v4 + 5))
  {
    if (-[NSMutableArray isEqual:](missingRecipients, "isEqual:"))
    {
      has = (char)self->_has;
      v8 = *((_BYTE *)v4 + 76);
      goto LABEL_40;
    }
LABEL_44:
    v11 = 0;
    goto LABEL_45;
  }
LABEL_40:
  v11 = (v8 & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_missingRecipientPredictionPerformanceInMilliSeconds != *((_QWORD *)v4 + 2))
      goto LABEL_44;
    v11 = 1;
  }
LABEL_45:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  char has;
  unint64_t v5;
  float predictedSaliencyScore;
  float v7;
  float v8;
  float v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v18;

  v18 = -[SGMIMetricsTrialMetadata hash](self->_trialMetadata, "hash");
  v3 = -[SGMIMetricsSubmodelsProbabilities hash](self->_submodelsProbabilities, "hash");
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    predictedSaliencyScore = self->_predictedSaliencyScore;
    v7 = -predictedSaliencyScore;
    if (predictedSaliencyScore >= 0.0)
      v7 = self->_predictedSaliencyScore;
    v8 = floorf(v7 + 0.5);
    v9 = (float)(v7 - v8) * 1.8447e19;
    v5 = 2654435761u * (unint64_t)fmodf(v8, 1.8447e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0)
        v5 += (unint64_t)v9;
    }
    else
    {
      v5 -= (unint64_t)fabsf(v9);
    }
  }
  else
  {
    v5 = 0;
  }
  if ((has & 8) == 0)
  {
    v10 = 0;
    if ((has & 4) != 0)
      goto LABEL_11;
LABEL_14:
    v11 = 0;
    if ((has & 0x20) != 0)
      goto LABEL_12;
    goto LABEL_15;
  }
  v10 = 2654435761 * self->_predictedSaliency;
  if ((has & 4) == 0)
    goto LABEL_14;
LABEL_11:
  v11 = 2654435761u * self->_saliencyPredictionPerformanceInMilliSeconds;
  if ((has & 0x20) != 0)
  {
LABEL_12:
    v12 = 2654435761 * self->_estimatedGroundTruth;
    goto LABEL_16;
  }
LABEL_15:
  v12 = 0;
LABEL_16:
  v13 = -[NSMutableArray hash](self->_missingAttachments, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v14 = 2654435761u * self->_missingAttachmentPredictionPerformanceInMilliSeconds;
  else
    v14 = 0;
  v15 = -[NSMutableArray hash](self->_missingRecipients, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v16 = 2654435761u * self->_missingRecipientPredictionPerformanceInMilliSeconds;
  else
    v16 = 0;
  return v3 ^ v18 ^ v5 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  SGMIMetricsTrialMetadata *trialMetadata;
  uint64_t v6;
  SGMIMetricsSubmodelsProbabilities *submodelsProbabilities;
  uint64_t v8;
  char v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  trialMetadata = self->_trialMetadata;
  v6 = *((_QWORD *)v4 + 8);
  if (trialMetadata)
  {
    if (v6)
      -[SGMIMetricsTrialMetadata mergeFrom:](trialMetadata, "mergeFrom:");
  }
  else if (v6)
  {
    -[SGMIMetricsInferenceAndGroundTruth setTrialMetadata:](self, "setTrialMetadata:");
  }
  submodelsProbabilities = self->_submodelsProbabilities;
  v8 = *((_QWORD *)v4 + 7);
  if (submodelsProbabilities)
  {
    if (v8)
      -[SGMIMetricsSubmodelsProbabilities mergeFrom:](submodelsProbabilities, "mergeFrom:");
  }
  else if (v8)
  {
    -[SGMIMetricsInferenceAndGroundTruth setSubmodelsProbabilities:](self, "setSubmodelsProbabilities:");
  }
  v9 = *((_BYTE *)v4 + 76);
  if ((v9 & 0x10) != 0)
  {
    self->_predictedSaliencyScore = *((float *)v4 + 13);
    *(_BYTE *)&self->_has |= 0x10u;
    v9 = *((_BYTE *)v4 + 76);
    if ((v9 & 8) == 0)
    {
LABEL_13:
      if ((v9 & 4) == 0)
        goto LABEL_14;
      goto LABEL_37;
    }
  }
  else if ((*((_BYTE *)v4 + 76) & 8) == 0)
  {
    goto LABEL_13;
  }
  self->_predictedSaliency = *((_DWORD *)v4 + 12);
  *(_BYTE *)&self->_has |= 8u;
  v9 = *((_BYTE *)v4 + 76);
  if ((v9 & 4) == 0)
  {
LABEL_14:
    if ((v9 & 0x20) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_37:
  self->_saliencyPredictionPerformanceInMilliSeconds = *((_QWORD *)v4 + 3);
  *(_BYTE *)&self->_has |= 4u;
  if ((*((_BYTE *)v4 + 76) & 0x20) != 0)
  {
LABEL_15:
    self->_estimatedGroundTruth = *((_BYTE *)v4 + 72);
    *(_BYTE *)&self->_has |= 0x20u;
  }
LABEL_16:
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = *((id *)v4 + 4);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(v10);
        -[SGMIMetricsInferenceAndGroundTruth addMissingAttachment:](self, "addMissingAttachment:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i));
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v12);
  }

  if ((*((_BYTE *)v4 + 76) & 1) != 0)
  {
    self->_missingAttachmentPredictionPerformanceInMilliSeconds = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v15 = *((id *)v4 + 5);
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v21;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v21 != v18)
          objc_enumerationMutation(v15);
        -[SGMIMetricsInferenceAndGroundTruth addMissingRecipient:](self, "addMissingRecipient:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * j), (_QWORD)v20);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v17);
  }

  if ((*((_BYTE *)v4 + 76) & 2) != 0)
  {
    self->_missingRecipientPredictionPerformanceInMilliSeconds = *((_QWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }

}

- (SGMIMetricsTrialMetadata)trialMetadata
{
  return self->_trialMetadata;
}

- (void)setTrialMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_trialMetadata, a3);
}

- (SGMIMetricsSubmodelsProbabilities)submodelsProbabilities
{
  return self->_submodelsProbabilities;
}

- (void)setSubmodelsProbabilities:(id)a3
{
  objc_storeStrong((id *)&self->_submodelsProbabilities, a3);
}

- (float)predictedSaliencyScore
{
  return self->_predictedSaliencyScore;
}

- (unint64_t)saliencyPredictionPerformanceInMilliSeconds
{
  return self->_saliencyPredictionPerformanceInMilliSeconds;
}

- (BOOL)estimatedGroundTruth
{
  return self->_estimatedGroundTruth;
}

- (NSMutableArray)missingAttachments
{
  return self->_missingAttachments;
}

- (void)setMissingAttachments:(id)a3
{
  objc_storeStrong((id *)&self->_missingAttachments, a3);
}

- (unint64_t)missingAttachmentPredictionPerformanceInMilliSeconds
{
  return self->_missingAttachmentPredictionPerformanceInMilliSeconds;
}

- (NSMutableArray)missingRecipients
{
  return self->_missingRecipients;
}

- (void)setMissingRecipients:(id)a3
{
  objc_storeStrong((id *)&self->_missingRecipients, a3);
}

- (unint64_t)missingRecipientPredictionPerformanceInMilliSeconds
{
  return self->_missingRecipientPredictionPerformanceInMilliSeconds;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialMetadata, 0);
  objc_storeStrong((id *)&self->_submodelsProbabilities, 0);
  objc_storeStrong((id *)&self->_missingRecipients, 0);
  objc_storeStrong((id *)&self->_missingAttachments, 0);
}

+ (Class)missingAttachmentType
{
  return (Class)objc_opt_class();
}

+ (Class)missingRecipientType
{
  return (Class)objc_opt_class();
}

@end
