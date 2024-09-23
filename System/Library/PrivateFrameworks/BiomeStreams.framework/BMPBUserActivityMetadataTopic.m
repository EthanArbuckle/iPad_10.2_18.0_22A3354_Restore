@implementation BMPBUserActivityMetadataTopic

- (BOOL)hasTopicIdentifier
{
  return self->_topicIdentifier != 0;
}

- (BOOL)hasTitle
{
  return self->_title != 0;
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
  v8.super_class = (Class)BMPBUserActivityMetadataTopic;
  -[BMPBUserActivityMetadataTopic description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPBUserActivityMetadataTopic dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *topicIdentifier;
  NSString *title;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  topicIdentifier = self->_topicIdentifier;
  if (topicIdentifier)
    objc_msgSend(v3, "setObject:forKey:", topicIdentifier, CFSTR("topicIdentifier"));
  title = self->_title;
  if (title)
    objc_msgSend(v4, "setObject:forKey:", title, CFSTR("title"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBUserActivityMetadataTopicReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_topicIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_title)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_topicIdentifier)
  {
    objc_msgSend(v4, "setTopicIdentifier:");
    v4 = v5;
  }
  if (self->_title)
  {
    objc_msgSend(v5, "setTitle:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_topicIdentifier, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSString copyWithZone:](self->_title, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *topicIdentifier;
  NSString *title;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((topicIdentifier = self->_topicIdentifier, !((unint64_t)topicIdentifier | v4[2]))
     || -[NSString isEqual:](topicIdentifier, "isEqual:")))
  {
    title = self->_title;
    if ((unint64_t)title | v4[1])
      v7 = -[NSString isEqual:](title, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_topicIdentifier, "hash");
  return -[NSString hash](self->_title, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = a3;
  v5 = v4;
  if (v4[2])
  {
    -[BMPBUserActivityMetadataTopic setTopicIdentifier:](self, "setTopicIdentifier:");
    v4 = v5;
  }
  if (v4[1])
  {
    -[BMPBUserActivityMetadataTopic setTitle:](self, "setTitle:");
    v4 = v5;
  }

}

- (NSString)topicIdentifier
{
  return self->_topicIdentifier;
}

- (void)setTopicIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_topicIdentifier, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topicIdentifier, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
