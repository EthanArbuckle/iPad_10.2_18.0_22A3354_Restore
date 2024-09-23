@implementation _MRGameControllerMotionProtobuf

- (BOOL)hasGravity
{
  return self->_gravity != 0;
}

- (BOOL)hasUserAcceleration
{
  return self->_userAcceleration != 0;
}

- (BOOL)hasAttitude
{
  return self->_attitude != 0;
}

- (BOOL)hasRotation
{
  return self->_rotation != 0;
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
  v8.super_class = (Class)_MRGameControllerMotionProtobuf;
  -[_MRGameControllerMotionProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRGameControllerMotionProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  _MRGameControllerAccelerationProtobuf *gravity;
  void *v5;
  _MRGameControllerAccelerationProtobuf *userAcceleration;
  void *v7;
  _MRGameControllerAccelerationProtobuf *attitude;
  void *v9;
  _MRGameControllerAccelerationProtobuf *rotation;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  gravity = self->_gravity;
  if (gravity)
  {
    -[_MRGameControllerAccelerationProtobuf dictionaryRepresentation](gravity, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("gravity"));

  }
  userAcceleration = self->_userAcceleration;
  if (userAcceleration)
  {
    -[_MRGameControllerAccelerationProtobuf dictionaryRepresentation](userAcceleration, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("userAcceleration"));

  }
  attitude = self->_attitude;
  if (attitude)
  {
    -[_MRGameControllerAccelerationProtobuf dictionaryRepresentation](attitude, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("attitude"));

  }
  rotation = self->_rotation;
  if (rotation)
  {
    -[_MRGameControllerAccelerationProtobuf dictionaryRepresentation](rotation, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("rotation"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRGameControllerMotionProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_gravity)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_userAcceleration)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_attitude)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_rotation)
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
  if (self->_gravity)
  {
    objc_msgSend(v4, "setGravity:");
    v4 = v5;
  }
  if (self->_userAcceleration)
  {
    objc_msgSend(v5, "setUserAcceleration:");
    v4 = v5;
  }
  if (self->_attitude)
  {
    objc_msgSend(v5, "setAttitude:");
    v4 = v5;
  }
  if (self->_rotation)
  {
    objc_msgSend(v5, "setRotation:");
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
  id v12;
  void *v13;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[_MRGameControllerAccelerationProtobuf copyWithZone:](self->_gravity, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[_MRGameControllerAccelerationProtobuf copyWithZone:](self->_userAcceleration, "copyWithZone:", a3);
  v9 = (void *)v5[4];
  v5[4] = v8;

  v10 = -[_MRGameControllerAccelerationProtobuf copyWithZone:](self->_attitude, "copyWithZone:", a3);
  v11 = (void *)v5[1];
  v5[1] = v10;

  v12 = -[_MRGameControllerAccelerationProtobuf copyWithZone:](self->_rotation, "copyWithZone:", a3);
  v13 = (void *)v5[3];
  v5[3] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  _MRGameControllerAccelerationProtobuf *gravity;
  _MRGameControllerAccelerationProtobuf *userAcceleration;
  _MRGameControllerAccelerationProtobuf *attitude;
  _MRGameControllerAccelerationProtobuf *rotation;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((gravity = self->_gravity, !((unint64_t)gravity | v4[2]))
     || -[_MRGameControllerAccelerationProtobuf isEqual:](gravity, "isEqual:"))
    && ((userAcceleration = self->_userAcceleration, !((unint64_t)userAcceleration | v4[4]))
     || -[_MRGameControllerAccelerationProtobuf isEqual:](userAcceleration, "isEqual:"))
    && ((attitude = self->_attitude, !((unint64_t)attitude | v4[1]))
     || -[_MRGameControllerAccelerationProtobuf isEqual:](attitude, "isEqual:")))
  {
    rotation = self->_rotation;
    if ((unint64_t)rotation | v4[3])
      v9 = -[_MRGameControllerAccelerationProtobuf isEqual:](rotation, "isEqual:");
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
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v3 = -[_MRGameControllerAccelerationProtobuf hash](self->_gravity, "hash");
  v4 = -[_MRGameControllerAccelerationProtobuf hash](self->_userAcceleration, "hash") ^ v3;
  v5 = -[_MRGameControllerAccelerationProtobuf hash](self->_attitude, "hash");
  return v4 ^ v5 ^ -[_MRGameControllerAccelerationProtobuf hash](self->_rotation, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _MRGameControllerAccelerationProtobuf *gravity;
  uint64_t v6;
  _MRGameControllerAccelerationProtobuf *userAcceleration;
  uint64_t v8;
  _MRGameControllerAccelerationProtobuf *attitude;
  uint64_t v10;
  _MRGameControllerAccelerationProtobuf *rotation;
  uint64_t v12;
  _QWORD *v13;

  v4 = a3;
  gravity = self->_gravity;
  v6 = v4[2];
  v13 = v4;
  if (gravity)
  {
    if (!v6)
      goto LABEL_7;
    -[_MRGameControllerAccelerationProtobuf mergeFrom:](gravity, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[_MRGameControllerMotionProtobuf setGravity:](self, "setGravity:");
  }
  v4 = v13;
LABEL_7:
  userAcceleration = self->_userAcceleration;
  v8 = v4[4];
  if (userAcceleration)
  {
    if (!v8)
      goto LABEL_13;
    -[_MRGameControllerAccelerationProtobuf mergeFrom:](userAcceleration, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_13;
    -[_MRGameControllerMotionProtobuf setUserAcceleration:](self, "setUserAcceleration:");
  }
  v4 = v13;
LABEL_13:
  attitude = self->_attitude;
  v10 = v4[1];
  if (attitude)
  {
    if (!v10)
      goto LABEL_19;
    -[_MRGameControllerAccelerationProtobuf mergeFrom:](attitude, "mergeFrom:");
  }
  else
  {
    if (!v10)
      goto LABEL_19;
    -[_MRGameControllerMotionProtobuf setAttitude:](self, "setAttitude:");
  }
  v4 = v13;
LABEL_19:
  rotation = self->_rotation;
  v12 = v4[3];
  if (rotation)
  {
    if (v12)
    {
      -[_MRGameControllerAccelerationProtobuf mergeFrom:](rotation, "mergeFrom:");
LABEL_24:
      v4 = v13;
    }
  }
  else if (v12)
  {
    -[_MRGameControllerMotionProtobuf setRotation:](self, "setRotation:");
    goto LABEL_24;
  }

}

- (_MRGameControllerAccelerationProtobuf)gravity
{
  return self->_gravity;
}

- (void)setGravity:(id)a3
{
  objc_storeStrong((id *)&self->_gravity, a3);
}

- (_MRGameControllerAccelerationProtobuf)userAcceleration
{
  return self->_userAcceleration;
}

- (void)setUserAcceleration:(id)a3
{
  objc_storeStrong((id *)&self->_userAcceleration, a3);
}

- (_MRGameControllerAccelerationProtobuf)attitude
{
  return self->_attitude;
}

- (void)setAttitude:(id)a3
{
  objc_storeStrong((id *)&self->_attitude, a3);
}

- (_MRGameControllerAccelerationProtobuf)rotation
{
  return self->_rotation;
}

- (void)setRotation:(id)a3
{
  objc_storeStrong((id *)&self->_rotation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userAcceleration, 0);
  objc_storeStrong((id *)&self->_rotation, 0);
  objc_storeStrong((id *)&self->_gravity, 0);
  objc_storeStrong((id *)&self->_attitude, 0);
}

@end
