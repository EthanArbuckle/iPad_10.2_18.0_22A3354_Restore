@implementation _MRDestinationProtobuf

- (BOOL)hasOutputDeviceUID
{
  return self->_outputDeviceUID != 0;
}

- (BOOL)hasEndpoint
{
  return self->_endpoint != 0;
}

- (BOOL)hasPlayerPath
{
  return self->_playerPath != 0;
}

- (BOOL)hasOutputContextUID
{
  return self->_outputContextUID != 0;
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
  v8.super_class = (Class)_MRDestinationProtobuf;
  -[_MRDestinationProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRDestinationProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *outputDeviceUID;
  _MRAVEndpointDescriptorProtobuf *endpoint;
  void *v7;
  _MRNowPlayingPlayerPathProtobuf *playerPath;
  void *v9;
  NSString *outputContextUID;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  outputDeviceUID = self->_outputDeviceUID;
  if (outputDeviceUID)
    objc_msgSend(v3, "setObject:forKey:", outputDeviceUID, CFSTR("outputDeviceUID"));
  endpoint = self->_endpoint;
  if (endpoint)
  {
    -[_MRAVEndpointDescriptorProtobuf dictionaryRepresentation](endpoint, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("endpoint"));

  }
  playerPath = self->_playerPath;
  if (playerPath)
  {
    -[_MRNowPlayingPlayerPathProtobuf dictionaryRepresentation](playerPath, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("playerPath"));

  }
  outputContextUID = self->_outputContextUID;
  if (outputContextUID)
    objc_msgSend(v4, "setObject:forKey:", outputContextUID, CFSTR("outputContextUID"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _MRDestinationProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_outputDeviceUID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_endpoint)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_playerPath)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_outputContextUID)
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
  if (self->_outputDeviceUID)
  {
    objc_msgSend(v4, "setOutputDeviceUID:");
    v4 = v5;
  }
  if (self->_endpoint)
  {
    objc_msgSend(v5, "setEndpoint:");
    v4 = v5;
  }
  if (self->_playerPath)
  {
    objc_msgSend(v5, "setPlayerPath:");
    v4 = v5;
  }
  if (self->_outputContextUID)
  {
    objc_msgSend(v5, "setOutputContextUID:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_outputDeviceUID, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  v8 = -[_MRAVEndpointDescriptorProtobuf copyWithZone:](self->_endpoint, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  v10 = -[_MRNowPlayingPlayerPathProtobuf copyWithZone:](self->_playerPath, "copyWithZone:", a3);
  v11 = (void *)v5[4];
  v5[4] = v10;

  v12 = -[NSString copyWithZone:](self->_outputContextUID, "copyWithZone:", a3);
  v13 = (void *)v5[2];
  v5[2] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *outputDeviceUID;
  _MRAVEndpointDescriptorProtobuf *endpoint;
  _MRNowPlayingPlayerPathProtobuf *playerPath;
  NSString *outputContextUID;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((outputDeviceUID = self->_outputDeviceUID, !((unint64_t)outputDeviceUID | v4[3]))
     || -[NSString isEqual:](outputDeviceUID, "isEqual:"))
    && ((endpoint = self->_endpoint, !((unint64_t)endpoint | v4[1]))
     || -[_MRAVEndpointDescriptorProtobuf isEqual:](endpoint, "isEqual:"))
    && ((playerPath = self->_playerPath, !((unint64_t)playerPath | v4[4]))
     || -[_MRNowPlayingPlayerPathProtobuf isEqual:](playerPath, "isEqual:")))
  {
    outputContextUID = self->_outputContextUID;
    if ((unint64_t)outputContextUID | v4[2])
      v9 = -[NSString isEqual:](outputContextUID, "isEqual:");
    else
      v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  unint64_t v5;

  v3 = -[NSString hash](self->_outputDeviceUID, "hash");
  v4 = -[_MRAVEndpointDescriptorProtobuf hash](self->_endpoint, "hash") ^ v3;
  v5 = -[_MRNowPlayingPlayerPathProtobuf hash](self->_playerPath, "hash");
  return v4 ^ v5 ^ -[NSString hash](self->_outputContextUID, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _MRAVEndpointDescriptorProtobuf *endpoint;
  uint64_t v6;
  _MRNowPlayingPlayerPathProtobuf *playerPath;
  uint64_t v8;
  _QWORD *v9;

  v4 = a3;
  v9 = v4;
  if (v4[3])
  {
    -[_MRDestinationProtobuf setOutputDeviceUID:](self, "setOutputDeviceUID:");
    v4 = v9;
  }
  endpoint = self->_endpoint;
  v6 = v4[1];
  if (endpoint)
  {
    if (!v6)
      goto LABEL_9;
    -[_MRAVEndpointDescriptorProtobuf mergeFrom:](endpoint, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_9;
    -[_MRDestinationProtobuf setEndpoint:](self, "setEndpoint:");
  }
  v4 = v9;
LABEL_9:
  playerPath = self->_playerPath;
  v8 = v4[4];
  if (playerPath)
  {
    if (!v8)
      goto LABEL_15;
    -[_MRNowPlayingPlayerPathProtobuf mergeFrom:](playerPath, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_15;
    -[_MRDestinationProtobuf setPlayerPath:](self, "setPlayerPath:");
  }
  v4 = v9;
LABEL_15:
  if (v4[2])
  {
    -[_MRDestinationProtobuf setOutputContextUID:](self, "setOutputContextUID:");
    v4 = v9;
  }

}

- (NSString)outputDeviceUID
{
  return self->_outputDeviceUID;
}

- (void)setOutputDeviceUID:(id)a3
{
  objc_storeStrong((id *)&self->_outputDeviceUID, a3);
}

- (_MRAVEndpointDescriptorProtobuf)endpoint
{
  return self->_endpoint;
}

- (void)setEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_endpoint, a3);
}

- (_MRNowPlayingPlayerPathProtobuf)playerPath
{
  return self->_playerPath;
}

- (void)setPlayerPath:(id)a3
{
  objc_storeStrong((id *)&self->_playerPath, a3);
}

- (NSString)outputContextUID
{
  return self->_outputContextUID;
}

- (void)setOutputContextUID:(id)a3
{
  objc_storeStrong((id *)&self->_outputContextUID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerPath, 0);
  objc_storeStrong((id *)&self->_outputDeviceUID, 0);
  objc_storeStrong((id *)&self->_outputContextUID, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
}

@end
