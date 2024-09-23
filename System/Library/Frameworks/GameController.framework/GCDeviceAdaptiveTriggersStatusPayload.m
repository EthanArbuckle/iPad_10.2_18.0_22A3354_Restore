@implementation GCDeviceAdaptiveTriggersStatusPayload

- (id)initFeedbackWithStatus:(unsigned __int8)a3 armPosition:(unsigned __int8)a4 mode:(unsigned __int8)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  GCDeviceAdaptiveTriggersStatusPayload *v8;
  uint64_t v9;
  NSNumber *status;
  uint64_t v11;
  NSNumber *armPosition;
  uint64_t v13;
  NSNumber *mode;
  objc_super v16;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  v16.receiver = self;
  v16.super_class = (Class)GCDeviceAdaptiveTriggersStatusPayload;
  v8 = -[GCDeviceAdaptiveTriggersStatusPayload init](&v16, sel_init);
  if (v8)
  {
    +[NSNumber numberWithUnsignedChar:](&off_254DED908, "numberWithUnsignedChar:", v7);
    v9 = objc_claimAutoreleasedReturnValue();
    status = v8->_status;
    v8->_status = (NSNumber *)v9;

    +[NSNumber numberWithUnsignedChar:](&off_254DED908, "numberWithUnsignedChar:", v6);
    v11 = objc_claimAutoreleasedReturnValue();
    armPosition = v8->_armPosition;
    v8->_armPosition = (NSNumber *)v11;

    +[NSNumber numberWithUnsignedChar:](&off_254DED908, "numberWithUnsignedChar:", v5);
    v13 = objc_claimAutoreleasedReturnValue();
    mode = v8->_mode;
    v8->_mode = (NSNumber *)v13;

  }
  return v8;
}

- (id)description
{
  return +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("<ATPayload - mode=%@> status=%@ armPosition=%@"), self->_mode, self->_status, self->_armPosition);
}

- (id)redactedDescription
{
  return +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("<ATPayload - mode=%@>"), self->_mode);
}

- (BOOL)isEqual:(id)a3
{
  GCDeviceAdaptiveTriggersStatusPayload *v4;
  GCDeviceAdaptiveTriggersStatusPayload *v5;
  NSNumber *status;
  void *v7;
  NSNumber *armPosition;
  void *v9;
  NSNumber *mode;
  void *v11;
  char v12;

  v4 = (GCDeviceAdaptiveTriggersStatusPayload *)a3;
  if (v4 == self)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      status = self->_status;
      -[GCDeviceAdaptiveTriggersStatusPayload status](v5, "status");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSNumber isEqualToNumber:](status, "isEqualToNumber:", v7))
      {
        armPosition = self->_armPosition;
        -[GCDeviceAdaptiveTriggersStatusPayload armPosition](v5, "armPosition");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[NSNumber isEqualToNumber:](armPosition, "isEqualToNumber:", v9))
        {
          mode = self->_mode;
          -[GCDeviceAdaptiveTriggersStatusPayload mode](v5, "mode");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = -[NSNumber isEqualToNumber:](mode, "isEqualToNumber:", v11);

        }
        else
        {
          v12 = 0;
        }

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[NSNumber hash](self->_status, "hash");
  v4 = -[NSNumber hash](self->_armPosition, "hash") ^ v3;
  return v4 ^ -[NSNumber hash](self->_mode, "hash");
}

- (NSNumber)status
{
  return self->_status;
}

- (NSNumber)armPosition
{
  return self->_armPosition;
}

- (NSNumber)mode
{
  return self->_mode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mode, 0);
  objc_storeStrong((id *)&self->_armPosition, 0);
  objc_storeStrong((id *)&self->_status, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCDeviceAdaptiveTriggersStatusPayload)initWithCoder:(id)a3
{
  id v4;
  GCDeviceAdaptiveTriggersStatusPayload *v5;
  uint64_t v6;
  NSNumber *status;
  uint64_t v8;
  NSNumber *armPosition;
  uint64_t v10;
  NSNumber *mode;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GCDeviceAdaptiveTriggersStatusPayload;
  v5 = -[GCDeviceAdaptiveTriggersStatusPayload init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_status"));
    v6 = objc_claimAutoreleasedReturnValue();
    status = v5->_status;
    v5->_status = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_armPosition"));
    v8 = objc_claimAutoreleasedReturnValue();
    armPosition = v5->_armPosition;
    v5->_armPosition = (NSNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_mode"));
    v10 = objc_claimAutoreleasedReturnValue();
    mode = v5->_mode;
    v5->_mode = (NSNumber *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSNumber *status;
  id v5;

  status = self->_status;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", status, CFSTR("_status"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_armPosition, CFSTR("_armPosition"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mode, CFSTR("_mode"));

}

@end
