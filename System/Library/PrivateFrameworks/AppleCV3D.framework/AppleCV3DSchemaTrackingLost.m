@implementation AppleCV3DSchemaTrackingLost

- (void)setReasonToLoseTracking:(id)a3
{
  NSString *v4;
  NSString *reasonToLoseTracking;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  reasonToLoseTracking = self->_reasonToLoseTracking;
  self->_reasonToLoseTracking = v4;

}

- (BOOL)readFrom:(id)a3
{
  return sub_20E887FCC(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[AppleCV3DSchemaTrackingLost reasonToLoseTracking](self, "reasonToLoseTracking");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteStringField();

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  BOOL v13;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    -[AppleCV3DSchemaTrackingLost reasonToLoseTracking](self, "reasonToLoseTracking");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reasonToLoseTracking");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      -[AppleCV3DSchemaTrackingLost reasonToLoseTracking](self, "reasonToLoseTracking");
      v8 = objc_claimAutoreleasedReturnValue();
      if (!v8)
      {

LABEL_10:
        v13 = 1;
        goto LABEL_8;
      }
      v9 = (void *)v8;
      -[AppleCV3DSchemaTrackingLost reasonToLoseTracking](self, "reasonToLoseTracking");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "reasonToLoseTracking");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if ((v12 & 1) != 0)
        goto LABEL_10;
    }
    else
    {

    }
  }
  v13 = 0;
LABEL_8:

  return v13;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_reasonToLoseTracking, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_reasonToLoseTracking)
  {
    -[AppleCV3DSchemaTrackingLost reasonToLoseTracking](self, "reasonToLoseTracking");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("reasonToLoseTracking"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[AppleCV3DSchemaTrackingLost dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x24BDD1608], "isValidJSONObject:", v2))
  {
    objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v2, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    return (NSData *)v3;
  }
  else
  {

    return (NSData *)0;
  }
}

- (AppleCV3DSchemaTrackingLost)initWithJSON:(id)a3
{
  void *v4;
  AppleCV3DSchemaTrackingLost *v5;
  uint64_t v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", a3, 0, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = -[AppleCV3DSchemaTrackingLost initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (AppleCV3DSchemaTrackingLost)initWithDictionary:(id)a3
{
  id v4;
  AppleCV3DSchemaTrackingLost *v5;
  void *v6;
  void *v7;
  AppleCV3DSchemaTrackingLost *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AppleCV3DSchemaTrackingLost;
  v5 = -[AppleCV3DSchemaTrackingLost init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("reasonToLoseTracking"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[AppleCV3DSchemaTrackingLost setReasonToLoseTracking:](v5, "setReasonToLoseTracking:", v7);

    }
    v8 = v5;

  }
  return v5;
}

- (NSString)reasonToLoseTracking
{
  return self->_reasonToLoseTracking;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reasonToLoseTracking, 0);
}

@end
