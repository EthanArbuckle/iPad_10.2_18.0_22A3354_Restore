@implementation PKPublicChannel

- (PKPublicChannel)initWithChannelID:(id)a3
{
  return -[PKPublicChannel initWithChannelID:channelTopic:environment:tokenName:checkpoint:](self, "initWithChannelID:channelTopic:environment:tokenName:checkpoint:", a3, &stru_24C06B908, &stru_24C06B908, &stru_24C06B908, 0);
}

- (PKPublicChannel)initWithChannelID:(id)a3 channelTopic:(id)a4 environment:(id)a5 checkpoint:(unint64_t)a6
{
  return -[PKPublicChannel initWithChannelID:channelTopic:environment:tokenName:checkpoint:](self, "initWithChannelID:channelTopic:environment:tokenName:checkpoint:", a3, a4, a5, 0, a6);
}

- (PKPublicChannel)initWithChannelID:(id)a3 channelTopic:(id)a4 environment:(id)a5 tokenName:(id)a6 checkpoint:(unint64_t)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  PKPublicChannel *v17;
  PKPublicChannel *v18;
  objc_super v20;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)PKPublicChannel;
  v17 = -[PKPublicChannel init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_channelID, a3);
    objc_storeStrong((id *)&v18->_channelTopic, a4);
    objc_storeStrong((id *)&v18->_environment, a5);
    objc_storeStrong((id *)&v18->_tokenName, a6);
    v18->_checkpoint = a7;
  }

  return v18;
}

- (PKPublicChannel)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  PKPublicChannel *v21;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("channel_id"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("channel_id"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("channel_topic"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v9 = objc_opt_isKindOfClass();

  if ((v9 & 1) != 0)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("channel_topic"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("environment"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v12 = objc_opt_isKindOfClass();

  if ((v12 & 1) != 0)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("environment"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("token_name"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v15 = objc_opt_isKindOfClass();

  if ((v15 & 1) != 0)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("token_name"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("checkpoint"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v18 = objc_opt_isKindOfClass();

  if ((v18 & 1) == 0)
  {
    v20 = 0;
LABEL_18:
    NSLog(CFSTR("Could not create PKPublicChannel from dictionary: %@"), v4);
    v21 = 0;
    goto LABEL_19;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("checkpoint"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (!v7 || !v19)
    goto LABEL_18;
  self = -[PKPublicChannel initWithChannelID:channelTopic:environment:tokenName:checkpoint:](self, "initWithChannelID:channelTopic:environment:tokenName:checkpoint:", v7, v10, v13, v16, objc_msgSend(v19, "unsignedLongLongValue"));
  v21 = self;
LABEL_19:

  return v21;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[PKPublicChannel channelID](self, "channelID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPublicChannel channelTopic](self, "channelTopic");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPublicChannel environment](self, "environment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPublicChannel tokenName](self, "tokenName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<PKGlobalChannel %p>: channelID %@ channelTopic %@ environment %@ tokenName %@ checkpoint %llu"), self, v4, v5, v6, v7, -[PKPublicChannel checkpoint](self, "checkpoint"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)setCheckpoint:(unint64_t)a3
{
  if (self->_checkpoint <= a3)
    self->_checkpoint = a3;
}

- (NSString)tokenName
{
  return (NSString *)CFSTR("TokenName");
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  -[PKPublicChannel channelID](self, "channelID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[PKPublicChannel channelTopic](self, "channelTopic");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[PKPublicChannel environment](self, "environment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[PKPublicChannel tokenName](self, "tokenName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v16;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "channelID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPublicChannel channelID](self, "channelID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", v7))
    {
      objc_msgSend(v5, "channelTopic");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPublicChannel channelTopic](self, "channelTopic");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isEqualToString:", v9))
      {
        objc_msgSend(v5, "environment");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPublicChannel environment](self, "environment");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "isEqualToString:", v11))
        {
          objc_msgSend(v5, "tokenName");
          v16 = v10;
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKPublicChannel tokenName](self, "tokenName");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v12, "isEqualToString:", v13);

          v10 = v16;
        }
        else
        {
          v14 = 0;
        }

      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (NSDictionary)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  _QWORD v11[6];

  v11[5] = *MEMORY[0x24BDAC8D0];
  v10[0] = CFSTR("channel_id");
  -[PKPublicChannel channelID](self, "channelID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  v10[1] = CFSTR("channel_topic");
  -[PKPublicChannel channelTopic](self, "channelTopic");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v4;
  v10[2] = CFSTR("environment");
  -[PKPublicChannel environment](self, "environment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v5;
  v10[3] = CFSTR("token_name");
  -[PKPublicChannel tokenName](self, "tokenName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v6;
  v10[4] = CFSTR("checkpoint");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[PKPublicChannel checkpoint](self, "checkpoint"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[4] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v8;
}

- (void)resetCheckpoint
{
  self->_checkpoint = 0;
}

- (NSString)channelID
{
  return self->_channelID;
}

- (void)setChannelID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)channelTopic
{
  return self->_channelTopic;
}

- (void)setChannelTopic:(id)a3
{
  objc_storeStrong((id *)&self->_channelTopic, a3);
}

- (NSString)environment
{
  return self->_environment;
}

- (void)setEnvironment:(id)a3
{
  objc_storeStrong((id *)&self->_environment, a3);
}

- (unint64_t)checkpoint
{
  return self->_checkpoint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_channelTopic, 0);
  objc_storeStrong((id *)&self->_channelID, 0);
  objc_storeStrong((id *)&self->_tokenName, 0);
}

@end
