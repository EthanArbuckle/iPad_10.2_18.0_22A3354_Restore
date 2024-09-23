@implementation LNNearbyAudioDeviceRelevantContext

- (LNNearbyAudioDeviceRelevantContext)initWithDeviceIdentifier:(id)a3 isPlaying:(id)a4
{
  id v7;
  id v8;
  id *v9;
  LNNearbyAudioDeviceRelevantContext *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)LNNearbyAudioDeviceRelevantContext;
  v9 = -[LNRelevantContext _init](&v12, sel__init);
  v10 = (LNNearbyAudioDeviceRelevantContext *)v9;
  if (v9)
  {
    objc_storeStrong(v9 + 1, a3);
    objc_storeStrong((id *)&v10->_isPlaying, a4);
  }

  return v10;
}

- (LNNearbyAudioDeviceRelevantContext)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  LNNearbyAudioDeviceRelevantContext *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isPlaying"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[LNNearbyAudioDeviceRelevantContext initWithDeviceIdentifier:isPlaying:](self, "initWithDeviceIdentifier:isPlaying:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *deviceIdentifier;
  id v5;

  deviceIdentifier = self->_deviceIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", deviceIdentifier, CFSTR("deviceIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_isPlaying, CFSTR("isPlaying"));

}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_deviceIdentifier, "hash");
  return -[NSNumber hash](self->_isPlaying, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  LNNearbyAudioDeviceRelevantContext *v4;
  LNNearbyAudioDeviceRelevantContext *v5;
  NSString *deviceIdentifier;
  uint64_t v7;
  void *v8;
  NSString *v9;
  void *v10;
  char v11;
  NSNumber *isPlaying;
  uint64_t v13;
  NSNumber *v14;
  NSNumber *v15;
  void *v16;

  v4 = (LNNearbyAudioDeviceRelevantContext *)a3;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      deviceIdentifier = self->_deviceIdentifier;
      -[LNNearbyAudioDeviceRelevantContext deviceIdentifier](v5, "deviceIdentifier");
      v7 = objc_claimAutoreleasedReturnValue();
      if (deviceIdentifier == (NSString *)v7)
      {

      }
      else
      {
        v8 = (void *)v7;
        v9 = self->_deviceIdentifier;
        -[LNNearbyAudioDeviceRelevantContext deviceIdentifier](v5, "deviceIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v9) = -[NSString isEqualToString:](v9, "isEqualToString:", v10);

        if (!(_DWORD)v9)
        {
          v11 = 0;
LABEL_13:

          goto LABEL_14;
        }
      }
      isPlaying = self->_isPlaying;
      -[LNNearbyAudioDeviceRelevantContext isPlaying](v5, "isPlaying");
      v13 = objc_claimAutoreleasedReturnValue();
      if (isPlaying == (NSNumber *)v13)
      {
        v11 = 1;
      }
      else
      {
        v14 = (NSNumber *)v13;
        v15 = self->_isPlaying;
        -[LNNearbyAudioDeviceRelevantContext isPlaying](v5, "isPlaying");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = -[NSNumber isEqual:](v15, "isEqual:", v16);

        isPlaying = v14;
      }

      goto LABEL_13;
    }
    v11 = 0;
  }
LABEL_14:

  return v11;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  -[LNNearbyAudioDeviceRelevantContext isPlaying](self, "isPlaying");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0CB3940];
  -[LNNearbyAudioDeviceRelevantContext deviceIdentifier](self, "deviceIdentifier");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v3)
  {
    -[LNNearbyAudioDeviceRelevantContext isPlaying](self, "isPlaying");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<nearby audio device: %@, isPlaying: %{BOOL}d>"), v6, objc_msgSend(v7, "BOOLValue"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<nearby audio device: %@>"), v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)analyticsDescription
{
  return CFSTR(".nearbyAudioDevice()");
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (NSNumber)isPlaying
{
  return self->_isPlaying;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isPlaying, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
