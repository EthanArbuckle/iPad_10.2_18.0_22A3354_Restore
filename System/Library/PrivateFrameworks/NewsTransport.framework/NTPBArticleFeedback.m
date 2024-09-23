@implementation NTPBArticleFeedback

- (BOOL)hasSourceChannelId
{
  return self->_sourceChannelId != 0;
}

- (BOOL)hasArticleId
{
  return self->_articleId != 0;
}

- (BOOL)hasTopicId
{
  return self->_topicId != 0;
}

- (BOOL)hasLanguage
{
  return self->_language != 0;
}

- (int)feedback
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_feedback;
  else
    return 0;
}

- (void)setFeedback:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_feedback = a3;
}

- (void)setHasFeedback:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFeedback
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)NTPBArticleFeedback;
  -[NTPBArticleFeedback description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBArticleFeedback dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *sourceChannelId;
  NSString *articleId;
  NSString *topicId;
  NSString *language;
  void *v9;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  sourceChannelId = self->_sourceChannelId;
  if (sourceChannelId)
    objc_msgSend(v3, "setObject:forKey:", sourceChannelId, CFSTR("source_channel_id"));
  articleId = self->_articleId;
  if (articleId)
    objc_msgSend(v4, "setObject:forKey:", articleId, CFSTR("article_id"));
  topicId = self->_topicId;
  if (topicId)
    objc_msgSend(v4, "setObject:forKey:", topicId, CFSTR("topic_id"));
  language = self->_language;
  if (language)
    objc_msgSend(v4, "setObject:forKey:", language, CFSTR("language"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_feedback);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("feedback"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBArticleFeedbackReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_sourceChannelId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_articleId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_topicId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_language)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_sourceChannelId, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  v8 = -[NSString copyWithZone:](self->_articleId, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v8;

  v10 = -[NSString copyWithZone:](self->_topicId, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v10;

  v12 = -[NSString copyWithZone:](self->_language, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v12;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_feedback;
    *(_BYTE *)(v5 + 48) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *sourceChannelId;
  NSString *articleId;
  NSString *topicId;
  NSString *language;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  sourceChannelId = self->_sourceChannelId;
  if ((unint64_t)sourceChannelId | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](sourceChannelId, "isEqual:"))
      goto LABEL_14;
  }
  articleId = self->_articleId;
  if ((unint64_t)articleId | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](articleId, "isEqual:"))
      goto LABEL_14;
  }
  topicId = self->_topicId;
  if ((unint64_t)topicId | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](topicId, "isEqual:"))
      goto LABEL_14;
  }
  language = self->_language;
  if ((unint64_t)language | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](language, "isEqual:"))
      goto LABEL_14;
  }
  v9 = (*((_BYTE *)v4 + 48) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) != 0 && self->_feedback == *((_DWORD *)v4 + 4))
    {
      v9 = 1;
      goto LABEL_15;
    }
LABEL_14:
    v9 = 0;
  }
LABEL_15:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  uint64_t v7;

  v3 = -[NSString hash](self->_sourceChannelId, "hash");
  v4 = -[NSString hash](self->_articleId, "hash");
  v5 = -[NSString hash](self->_topicId, "hash");
  v6 = -[NSString hash](self->_language, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v7 = 2654435761 * self->_feedback;
  else
    v7 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  int *v5;

  v4 = (int *)a3;
  v5 = v4;
  if (*((_QWORD *)v4 + 4))
  {
    -[NTPBArticleFeedback setSourceChannelId:](self, "setSourceChannelId:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[NTPBArticleFeedback setArticleId:](self, "setArticleId:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[NTPBArticleFeedback setTopicId:](self, "setTopicId:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[NTPBArticleFeedback setLanguage:](self, "setLanguage:");
    v4 = v5;
  }
  if ((v4[12] & 1) != 0)
  {
    self->_feedback = v4[4];
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSString)sourceChannelId
{
  return self->_sourceChannelId;
}

- (void)setSourceChannelId:(id)a3
{
  objc_storeStrong((id *)&self->_sourceChannelId, a3);
}

- (NSString)articleId
{
  return self->_articleId;
}

- (void)setArticleId:(id)a3
{
  objc_storeStrong((id *)&self->_articleId, a3);
}

- (NSString)topicId
{
  return self->_topicId;
}

- (void)setTopicId:(id)a3
{
  objc_storeStrong((id *)&self->_topicId, a3);
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
  objc_storeStrong((id *)&self->_language, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topicId, 0);
  objc_storeStrong((id *)&self->_sourceChannelId, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_articleId, 0);
}

@end
