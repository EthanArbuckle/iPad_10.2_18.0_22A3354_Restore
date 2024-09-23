@implementation SPProtoSockPuppetMessage

+ (id)sockPuppetMessageWithSubMessage:(id)a3 setterSelector:(SEL)a4
{
  id v5;
  SPProtoAudioFilePlayerMessage *v6;
  SPProtoSockPuppetMessage *v7;

  v5 = a3;
  v6 = objc_alloc_init(SPProtoAudioFilePlayerMessage);
  ((void (*)(SPProtoAudioFilePlayerMessage *, SEL, id))-[SPProtoAudioFilePlayerMessage methodForSelector:](v6, "methodForSelector:", a4))(v6, a4, v5);

  v7 = objc_alloc_init(SPProtoSockPuppetMessage);
  -[SPProtoSockPuppetMessage setAudioFilePlayerMessage:](v7, "setAudioFilePlayerMessage:", v6);

  return v7;
}

- (BOOL)hasPlist
{
  return self->_plist != 0;
}

- (BOOL)hasAudioFilePlayerMessage
{
  return self->_audioFilePlayerMessage != 0;
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
  v8.super_class = (Class)SPProtoSockPuppetMessage;
  -[SPProtoSockPuppetMessage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPProtoSockPuppetMessage dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  SPProtoSockPuppetPlist *plist;
  void *v5;
  SPProtoAudioFilePlayerMessage *audioFilePlayerMessage;
  void *v7;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  plist = self->_plist;
  if (plist)
  {
    -[SPProtoSockPuppetPlist dictionaryRepresentation](plist, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("plist"));

  }
  audioFilePlayerMessage = self->_audioFilePlayerMessage;
  if (audioFilePlayerMessage)
  {
    -[SPProtoAudioFilePlayerMessage dictionaryRepresentation](audioFilePlayerMessage, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("audioFilePlayerMessage"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SPProtoSockPuppetMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_plist)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_audioFilePlayerMessage)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_plist)
  {
    objc_msgSend(v4, "setPlist:");
    v4 = v5;
  }
  if (self->_audioFilePlayerMessage)
  {
    objc_msgSend(v5, "setAudioFilePlayerMessage:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[SPProtoSockPuppetPlist copyWithZone:](self->_plist, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[SPProtoAudioFilePlayerMessage copyWithZone:](self->_audioFilePlayerMessage, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  SPProtoSockPuppetPlist *plist;
  SPProtoAudioFilePlayerMessage *audioFilePlayerMessage;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((plist = self->_plist, !((unint64_t)plist | v4[2]))
     || -[SPProtoSockPuppetPlist isEqual:](plist, "isEqual:")))
  {
    audioFilePlayerMessage = self->_audioFilePlayerMessage;
    if ((unint64_t)audioFilePlayerMessage | v4[1])
      v7 = -[SPProtoAudioFilePlayerMessage isEqual:](audioFilePlayerMessage, "isEqual:");
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
  unint64_t v3;

  v3 = -[SPProtoSockPuppetPlist hash](self->_plist, "hash");
  return -[SPProtoAudioFilePlayerMessage hash](self->_audioFilePlayerMessage, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  SPProtoSockPuppetPlist *plist;
  uint64_t v6;
  SPProtoAudioFilePlayerMessage *audioFilePlayerMessage;
  uint64_t v8;
  _QWORD *v9;

  v4 = a3;
  plist = self->_plist;
  v6 = v4[2];
  v9 = v4;
  if (plist)
  {
    if (!v6)
      goto LABEL_7;
    -[SPProtoSockPuppetPlist mergeFrom:](plist, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[SPProtoSockPuppetMessage setPlist:](self, "setPlist:");
  }
  v4 = v9;
LABEL_7:
  audioFilePlayerMessage = self->_audioFilePlayerMessage;
  v8 = v4[1];
  if (audioFilePlayerMessage)
  {
    if (v8)
    {
      -[SPProtoAudioFilePlayerMessage mergeFrom:](audioFilePlayerMessage, "mergeFrom:");
LABEL_12:
      v4 = v9;
    }
  }
  else if (v8)
  {
    -[SPProtoSockPuppetMessage setAudioFilePlayerMessage:](self, "setAudioFilePlayerMessage:");
    goto LABEL_12;
  }

}

- (SPProtoSockPuppetPlist)plist
{
  return self->_plist;
}

- (void)setPlist:(id)a3
{
  objc_storeStrong((id *)&self->_plist, a3);
}

- (SPProtoAudioFilePlayerMessage)audioFilePlayerMessage
{
  return self->_audioFilePlayerMessage;
}

- (void)setAudioFilePlayerMessage:(id)a3
{
  objc_storeStrong((id *)&self->_audioFilePlayerMessage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plist, 0);
  objc_storeStrong((id *)&self->_audioFilePlayerMessage, 0);
}

@end
