@implementation MPMusicPlayerRadioStationQueueDescriptor

- (MPMusicPlayerRadioStationQueueDescriptor)initWithRadioStation:(id)a3
{
  id v5;
  id *v6;
  MPMusicPlayerRadioStationQueueDescriptor *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPMusicPlayerRadioStationQueueDescriptor;
  v6 = -[MPMusicPlayerQueueDescriptor _init](&v9, sel__init);
  v7 = (MPMusicPlayerRadioStationQueueDescriptor *)v6;
  if (v6)
    objc_storeStrong(v6 + 10, a3);

  return v7;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p radioStation=%@>"), objc_opt_class(), self, self->_radioStation);
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  MPRadioStation *v5;
  MPRadioStation *v6;
  MPRadioStation *v7;
  char v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MPMusicPlayerRadioStationQueueDescriptor;
  if (-[MPMusicPlayerQueueDescriptor isEqual:](&v10, sel_isEqual_, v4))
  {
    v5 = (MPRadioStation *)v4[10];
    v6 = self->_radioStation;
    v7 = v6;
    if (v6 == v5)
      v8 = 1;
    else
      v8 = -[MPRadioStation isEqual:](v6, "isEqual:", v5);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (MPMusicPlayerRadioStationQueueDescriptor)initWithCoder:(id)a3
{
  id v4;
  MPMusicPlayerRadioStationQueueDescriptor *v5;
  uint64_t v6;
  MPRadioStation *radioStation;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPMusicPlayerRadioStationQueueDescriptor;
  v5 = -[MPMusicPlayerQueueDescriptor initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("radioStation"));
    v6 = objc_claimAutoreleasedReturnValue();
    radioStation = v5->_radioStation;
    v5->_radioStation = (MPRadioStation *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MPMusicPlayerRadioStationQueueDescriptor;
  v4 = a3;
  -[MPMusicPlayerQueueDescriptor encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_radioStation, CFSTR("radioStation"), v5.receiver, v5.super_class);

}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MPMusicPlayerRadioStationQueueDescriptor;
  v4 = -[MPMusicPlayerQueueDescriptor copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_storeStrong(v4 + 10, self->_radioStation);
  return v4;
}

- (BOOL)isEmpty
{
  return self->_radioStation == 0;
}

- (MPRadioStation)radioStation
{
  return self->_radioStation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_radioStation, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
