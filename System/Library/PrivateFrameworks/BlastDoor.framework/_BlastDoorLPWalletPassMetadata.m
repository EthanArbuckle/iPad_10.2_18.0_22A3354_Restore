@implementation _BlastDoorLPWalletPassMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_BlastDoorLPWalletPassMetadata)initWithCoder:(id)a3
{
  id v4;
  _BlastDoorLPWalletPassMetadata *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  NSDate *eventDate;
  uint64_t v10;
  NSDate *expirationDate;
  _BlastDoorLPWalletPassMetadata *v12;
  objc_super v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_BlastDoorLPWalletPassMetadata;
  v5 = -[_BlastDoorLPWalletPassMetadata init](&v14, sel_init);
  if (v5)
  {
    decodeStringForKey(v4, (uint64_t)CFSTR("name"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    v5->_style = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("style"));
    objc_msgSend(v4, "_bd_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("eventDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    eventDate = v5->_eventDate;
    v5->_eventDate = (NSDate *)v8;

    objc_msgSend(v4, "_bd_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("expirationDate"));
    v10 = objc_claimAutoreleasedReturnValue();
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v10;

    v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *name;
  id v5;

  name = self->_name;
  v5 = a3;
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", name, CFSTR("name"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_style, CFSTR("style"));
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_eventDate, CFSTR("eventDate"));
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_expirationDate, CFSTR("expirationDate"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _BlastDoorLPWalletPassMetadata *v4;
  void *v5;
  void *v6;
  void *v7;
  _BlastDoorLPWalletPassMetadata *v8;

  v4 = +[_BlastDoorLPWalletPassMetadata allocWithZone:](_BlastDoorLPWalletPassMetadata, "allocWithZone:", a3);
  if (v4)
  {
    -[_BlastDoorLPWalletPassMetadata name](self, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPWalletPassMetadata setName:](v4, "setName:", v5);

    -[_BlastDoorLPWalletPassMetadata setStyle:](v4, "setStyle:", -[_BlastDoorLPWalletPassMetadata style](self, "style"));
    -[_BlastDoorLPWalletPassMetadata eventDate](self, "eventDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPWalletPassMetadata setEventDate:](v4, "setEventDate:", v6);

    -[_BlastDoorLPWalletPassMetadata expirationDate](self, "expirationDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPWalletPassMetadata setExpirationDate:](v4, "setExpirationDate:", v7);

    v8 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;
  _QWORD *v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  objc_super v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_BlastDoorLPWalletPassMetadata;
  if (-[_BlastDoorLPWalletPassMetadata isEqual:](&v11, sel_isEqual_, v4))
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v4;
      v7 = v6[2];
      if ((!(v7 | (unint64_t)self->_name) || objc_msgSend((id)v7, "isEqual:"))
        && v6[3] == self->_style
        && ((v8 = v6[4], !(v8 | (unint64_t)self->_eventDate)) || objc_msgSend((id)v8, "isEqual:")))
      {
        v9 = v6[5];
        if (v9 | (unint64_t)self->_expirationDate)
          v5 = objc_msgSend((id)v9, "isEqual:");
        else
          v5 = 1;
      }
      else
      {
        v5 = 0;
      }

    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_name, "hash");
}

+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("name"), CFSTR("style"), CFSTR("eventDate"), CFSTR("expirationDate"), 0);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (NSDate)eventDate
{
  return self->_eventDate;
}

- (void)setEventDate:(id)a3
{
  objc_storeStrong((id *)&self->_eventDate, a3);
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
  objc_storeStrong((id *)&self->_expirationDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_eventDate, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
