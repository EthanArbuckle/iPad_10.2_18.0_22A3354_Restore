@implementation AWDHomeKitCameraStreamIDSConnSetup

- (BOOL)hasVideoConnection
{
  return self->_videoConnection != 0;
}

- (BOOL)hasAudioConnection
{
  return self->_audioConnection != 0;
}

- (BOOL)hasKeepaliveConnection
{
  return self->_keepaliveConnection != 0;
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
  v8.super_class = (Class)AWDHomeKitCameraStreamIDSConnSetup;
  -[AWDHomeKitCameraStreamIDSConnSetup description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AWDHomeKitCameraStreamIDSConnSetup dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  AWDHomeKitCameraStreamIDSConnSetupParameters *videoConnection;
  void *v5;
  AWDHomeKitCameraStreamIDSConnSetupParameters *audioConnection;
  void *v7;
  AWDHomeKitCameraStreamIDSConnSetupParameters *keepaliveConnection;
  void *v9;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  videoConnection = self->_videoConnection;
  if (videoConnection)
  {
    -[AWDHomeKitCameraStreamIDSConnSetupParameters dictionaryRepresentation](videoConnection, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("videoConnection"));

  }
  audioConnection = self->_audioConnection;
  if (audioConnection)
  {
    -[AWDHomeKitCameraStreamIDSConnSetupParameters dictionaryRepresentation](audioConnection, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("audioConnection"));

  }
  keepaliveConnection = self->_keepaliveConnection;
  if (keepaliveConnection)
  {
    -[AWDHomeKitCameraStreamIDSConnSetupParameters dictionaryRepresentation](keepaliveConnection, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("keepaliveConnection"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDHomeKitCameraStreamIDSConnSetupReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_videoConnection)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_audioConnection)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_keepaliveConnection)
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
  if (self->_videoConnection)
  {
    objc_msgSend(v4, "setVideoConnection:");
    v4 = v5;
  }
  if (self->_audioConnection)
  {
    objc_msgSend(v5, "setAudioConnection:");
    v4 = v5;
  }
  if (self->_keepaliveConnection)
  {
    objc_msgSend(v5, "setKeepaliveConnection:");
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
  id v10;
  void *v11;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[AWDHomeKitCameraStreamIDSConnSetupParameters copyWithZone:](self->_videoConnection, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  v8 = -[AWDHomeKitCameraStreamIDSConnSetupParameters copyWithZone:](self->_audioConnection, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  v10 = -[AWDHomeKitCameraStreamIDSConnSetupParameters copyWithZone:](self->_keepaliveConnection, "copyWithZone:", a3);
  v11 = (void *)v5[2];
  v5[2] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  AWDHomeKitCameraStreamIDSConnSetupParameters *videoConnection;
  AWDHomeKitCameraStreamIDSConnSetupParameters *audioConnection;
  AWDHomeKitCameraStreamIDSConnSetupParameters *keepaliveConnection;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((videoConnection = self->_videoConnection, !((unint64_t)videoConnection | v4[3]))
     || -[AWDHomeKitCameraStreamIDSConnSetupParameters isEqual:](videoConnection, "isEqual:"))
    && ((audioConnection = self->_audioConnection, !((unint64_t)audioConnection | v4[1]))
     || -[AWDHomeKitCameraStreamIDSConnSetupParameters isEqual:](audioConnection, "isEqual:")))
  {
    keepaliveConnection = self->_keepaliveConnection;
    if ((unint64_t)keepaliveConnection | v4[2])
      v8 = -[AWDHomeKitCameraStreamIDSConnSetupParameters isEqual:](keepaliveConnection, "isEqual:");
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;

  v3 = -[AWDHomeKitCameraStreamIDSConnSetupParameters hash](self->_videoConnection, "hash");
  v4 = -[AWDHomeKitCameraStreamIDSConnSetupParameters hash](self->_audioConnection, "hash") ^ v3;
  return v4 ^ -[AWDHomeKitCameraStreamIDSConnSetupParameters hash](self->_keepaliveConnection, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  AWDHomeKitCameraStreamIDSConnSetupParameters *videoConnection;
  uint64_t v6;
  AWDHomeKitCameraStreamIDSConnSetupParameters *audioConnection;
  uint64_t v8;
  AWDHomeKitCameraStreamIDSConnSetupParameters *keepaliveConnection;
  uint64_t v10;
  _QWORD *v11;

  v4 = a3;
  videoConnection = self->_videoConnection;
  v6 = v4[3];
  v11 = v4;
  if (videoConnection)
  {
    if (!v6)
      goto LABEL_7;
    -[AWDHomeKitCameraStreamIDSConnSetupParameters mergeFrom:](videoConnection, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[AWDHomeKitCameraStreamIDSConnSetup setVideoConnection:](self, "setVideoConnection:");
  }
  v4 = v11;
LABEL_7:
  audioConnection = self->_audioConnection;
  v8 = v4[1];
  if (audioConnection)
  {
    if (!v8)
      goto LABEL_13;
    -[AWDHomeKitCameraStreamIDSConnSetupParameters mergeFrom:](audioConnection, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_13;
    -[AWDHomeKitCameraStreamIDSConnSetup setAudioConnection:](self, "setAudioConnection:");
  }
  v4 = v11;
LABEL_13:
  keepaliveConnection = self->_keepaliveConnection;
  v10 = v4[2];
  if (keepaliveConnection)
  {
    if (v10)
    {
      -[AWDHomeKitCameraStreamIDSConnSetupParameters mergeFrom:](keepaliveConnection, "mergeFrom:");
LABEL_18:
      v4 = v11;
    }
  }
  else if (v10)
  {
    -[AWDHomeKitCameraStreamIDSConnSetup setKeepaliveConnection:](self, "setKeepaliveConnection:");
    goto LABEL_18;
  }

}

- (AWDHomeKitCameraStreamIDSConnSetupParameters)videoConnection
{
  return self->_videoConnection;
}

- (void)setVideoConnection:(id)a3
{
  objc_storeStrong((id *)&self->_videoConnection, a3);
}

- (AWDHomeKitCameraStreamIDSConnSetupParameters)audioConnection
{
  return self->_audioConnection;
}

- (void)setAudioConnection:(id)a3
{
  objc_storeStrong((id *)&self->_audioConnection, a3);
}

- (AWDHomeKitCameraStreamIDSConnSetupParameters)keepaliveConnection
{
  return self->_keepaliveConnection;
}

- (void)setKeepaliveConnection:(id)a3
{
  objc_storeStrong((id *)&self->_keepaliveConnection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoConnection, 0);
  objc_storeStrong((id *)&self->_keepaliveConnection, 0);
  objc_storeStrong((id *)&self->_audioConnection, 0);
}

@end
