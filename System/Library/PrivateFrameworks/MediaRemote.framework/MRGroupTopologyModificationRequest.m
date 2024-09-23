@implementation MRGroupTopologyModificationRequest

- (MRGroupTopologyModificationRequest)initWithRequestDetails:(id)a3 type:(unint64_t)a4 outputDevices:(id)a5
{
  id v8;
  id v9;
  void *v10;
  MRGroupTopologyModificationRequest *v11;
  uint64_t v12;
  NSArray *outputDevices;

  v8 = a5;
  v9 = a3;
  objc_msgSend(v8, "msv_compactMap:", &__block_literal_global_103);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[MRGroupTopologyModificationRequest initWithRequestDetails:type:outputDeviceUIDs:](self, "initWithRequestDetails:type:outputDeviceUIDs:", v9, a4, v10);

  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    outputDevices = v11->_outputDevices;
    v11->_outputDevices = (NSArray *)v12;

  }
  return v11;
}

uint64_t __80__MRGroupTopologyModificationRequest_initWithRequestDetails_type_outputDevices___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uid");
}

- (MRGroupTopologyModificationRequest)initWithRequestDetails:(id)a3 type:(unint64_t)a4 outputDeviceUIDs:(id)a5
{
  id v9;
  id v10;
  MRGroupTopologyModificationRequest *v11;
  MRGroupTopologyModificationRequest *v12;
  uint64_t v13;
  NSArray *outputDeviceUIDs;
  objc_super v16;

  v9 = a3;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)MRGroupTopologyModificationRequest;
  v11 = -[MRGroupTopologyModificationRequest init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_requestDetails, a3);
    v12->_type = a4;
    v13 = objc_msgSend(v10, "copy");
    outputDeviceUIDs = v12->_outputDeviceUIDs;
    v12->_outputDeviceUIDs = (NSArray *)v13;

  }
  return v12;
}

- (id)copyWithOutputDeviceUIDs:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = -[MRGroupTopologyModificationRequest copyWithType:outputDeviceUIDs:](self, "copyWithType:outputDeviceUIDs:", -[MRGroupTopologyModificationRequest type](self, "type"), v4);

  return v5;
}

- (id)copyWithType:(unint64_t)a3 outputDeviceUIDs:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a4;
  -[MRGroupTopologyModificationRequest protobuf](self, "protobuf");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v7, "setOutputDeviceUIDs:", v8);
  objc_msgSend(v7, "setType:", a3);
  v9 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithProtobuf:", v7);

  return v9;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  -[MRGroupTopologyModificationRequest requestDetails](self, "requestDetails");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MRGroupTopologyModificationRequestTypeDescription(-[MRGroupTopologyModificationRequest type](self, "type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRGroupTopologyModificationRequest outputDeviceUIDs](self, "outputDeviceUIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ %@ %@"), v4, v5, v6);

  if (self->_fadeAudio)
    objc_msgSend(v7, "appendFormat:", CFSTR("FadeAudio/"));
  if (self->_shouldNotPauseIfLastDeviceRemoved)
    objc_msgSend(v7, "appendFormat:", CFSTR("DontPause/"));
  if (self->_suppressErrorDialog)
    objc_msgSend(v7, "appendFormat:", CFSTR("SuppressErrorDialog/"));
  if (self->_muteUntilFinished)
    objc_msgSend(v7, "appendFormat:", CFSTR("MuteUntilFinished"));
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MRGroupTopologyModificationRequest protobuf](self, "protobuf");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("protobuf"));

}

- (MRGroupTopologyModificationRequest)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  MRGroupTopologyModificationRequest *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("protobuf"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[MRGroupTopologyModificationRequest initWithProtobuf:](self, "initWithProtobuf:", v5);
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MRGroupTopologyModificationRequest *v3;
  void *v4;
  MRGroupTopologyModificationRequest *v5;

  v3 = self;
  -[MRGroupTopologyModificationRequest protobuf](v3, "protobuf");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MRGroupTopologyModificationRequest initWithProtobuf:](v3, "initWithProtobuf:", v4);

  return v5;
}

- (MRGroupTopologyModificationRequest)initWithData:(id)a3
{
  id v4;
  _MRGroupTopologyModificationRequestProtobuf *v5;
  MRGroupTopologyModificationRequest *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[_MRGroupTopologyModificationRequestProtobuf initWithData:]([_MRGroupTopologyModificationRequestProtobuf alloc], "initWithData:", v4);

    self = -[MRGroupTopologyModificationRequest initWithProtobuf:](self, "initWithProtobuf:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (MRGroupTopologyModificationRequest)initWithProtobuf:(id)a3
{
  id v4;
  MRRequestDetails *v5;
  void *v6;
  MRRequestDetails *v7;
  uint64_t v8;
  void *v9;
  MRGroupTopologyModificationRequest *v10;
  MRGroupTopologyModificationRequest *v11;

  v4 = a3;
  if (v4)
  {
    v5 = [MRRequestDetails alloc];
    objc_msgSend(v4, "details");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[MRRequestDetails initWithProtobuf:](v5, "initWithProtobuf:", v6);
    v8 = (int)objc_msgSend(v4, "type");
    objc_msgSend(v4, "outputDeviceUIDs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[MRGroupTopologyModificationRequest initWithRequestDetails:type:outputDeviceUIDs:](self, "initWithRequestDetails:type:outputDeviceUIDs:", v7, v8, v9);

    if (v10)
    {
      v10->_fadeAudio = objc_msgSend(v4, "fadeAudio");
      v10->_shouldNotPauseIfLastDeviceRemoved = objc_msgSend(v4, "shouldNotPauseIfLastDeviceRemoved");
      v10->_suppressErrorDialog = objc_msgSend(v4, "suppressErrorDialog");
      v10->_muteUntilFinished = objc_msgSend(v4, "muteUntilFinished");
    }
    self = v10;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (NSData)data
{
  void *v2;
  void *v3;

  -[MRGroupTopologyModificationRequest protobuf](self, "protobuf");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (_MRGroupTopologyModificationRequestProtobuf)protobuf
{
  _MRGroupTopologyModificationRequestProtobuf *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(_MRGroupTopologyModificationRequestProtobuf);
  -[MRRequestDetails protobuf](self->_requestDetails, "protobuf");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRGroupTopologyModificationRequestProtobuf setDetails:](v3, "setDetails:", v4);

  -[_MRGroupTopologyModificationRequestProtobuf setType:](v3, "setType:", LODWORD(self->_type));
  if (-[NSArray count](self->_outputDevices, "count"))
  {
    -[NSArray msv_compactMap:](self->_outputDevices, "msv_compactMap:", &__block_literal_global_15_3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "mutableCopy");
    -[_MRGroupTopologyModificationRequestProtobuf setOutputDeviceUIDs:](v3, "setOutputDeviceUIDs:", v6);

  }
  else
  {
    v5 = (void *)-[NSArray mutableCopy](self->_outputDeviceUIDs, "mutableCopy");
    -[_MRGroupTopologyModificationRequestProtobuf setOutputDeviceUIDs:](v3, "setOutputDeviceUIDs:", v5);
  }

  -[_MRGroupTopologyModificationRequestProtobuf setFadeAudio:](v3, "setFadeAudio:", self->_fadeAudio);
  -[_MRGroupTopologyModificationRequestProtobuf setShouldNotPauseIfLastDeviceRemoved:](v3, "setShouldNotPauseIfLastDeviceRemoved:", self->_shouldNotPauseIfLastDeviceRemoved);
  -[_MRGroupTopologyModificationRequestProtobuf setSuppressErrorDialog:](v3, "setSuppressErrorDialog:", self->_suppressErrorDialog);
  -[_MRGroupTopologyModificationRequestProtobuf setMuteUntilFinished:](v3, "setMuteUntilFinished:", self->_muteUntilFinished);
  return v3;
}

uint64_t __46__MRGroupTopologyModificationRequest_protobuf__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uid");
}

- (MRRequestDetails)requestDetails
{
  return self->_requestDetails;
}

- (NSArray)outputDeviceUIDs
{
  return self->_outputDeviceUIDs;
}

- (NSArray)outputDevices
{
  return self->_outputDevices;
}

- (unint64_t)type
{
  return self->_type;
}

- (BOOL)fadeAudio
{
  return self->_fadeAudio;
}

- (void)setFadeAudio:(BOOL)a3
{
  self->_fadeAudio = a3;
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
  self->_password = (NSString *)a3;
}

- (BOOL)shouldNotPauseIfLastDeviceRemoved
{
  return self->_shouldNotPauseIfLastDeviceRemoved;
}

- (void)setShouldNotPauseIfLastDeviceRemoved:(BOOL)a3
{
  self->_shouldNotPauseIfLastDeviceRemoved = a3;
}

- (BOOL)suppressErrorDialog
{
  return self->_suppressErrorDialog;
}

- (void)setSuppressErrorDialog:(BOOL)a3
{
  self->_suppressErrorDialog = a3;
}

- (BOOL)muteUntilFinished
{
  return self->_muteUntilFinished;
}

- (void)setMuteUntilFinished:(BOOL)a3
{
  self->_muteUntilFinished = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputDevices, 0);
  objc_storeStrong((id *)&self->_outputDeviceUIDs, 0);
  objc_storeStrong((id *)&self->_requestDetails, 0);
}

@end
