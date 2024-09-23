@implementation _MRGameControllerMessageProtobuf

- (void)setControllerID:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_controllerID = a3;
}

- (void)setHasControllerID:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasControllerID
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasMotion
{
  return self->_motion != 0;
}

- (BOOL)hasButtons
{
  return self->_buttons != 0;
}

- (BOOL)hasDigitizer
{
  return self->_digitizer != 0;
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
  v8.super_class = (Class)_MRGameControllerMessageProtobuf;
  -[_MRGameControllerMessageProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRGameControllerMessageProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  _MRGameControllerMotionProtobuf *motion;
  void *v6;
  _MRGameControllerButtonsProtobuf *buttons;
  void *v8;
  _MRGameControllerDigitizerProtobuf *digitizer;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_controllerID);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("controllerID"));

  }
  motion = self->_motion;
  if (motion)
  {
    -[_MRGameControllerMotionProtobuf dictionaryRepresentation](motion, "dictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("motion"));

  }
  buttons = self->_buttons;
  if (buttons)
  {
    -[_MRGameControllerButtonsProtobuf dictionaryRepresentation](buttons, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("buttons"));

  }
  digitizer = self->_digitizer;
  if (digitizer)
  {
    -[_MRGameControllerDigitizerProtobuf dictionaryRepresentation](digitizer, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("digitizer"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRGameControllerMessageProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v5;
  }
  if (self->_motion)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_buttons)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_digitizer)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[1] = self->_controllerID;
    *((_BYTE *)v4 + 40) |= 1u;
  }
  v5 = v4;
  if (self->_motion)
  {
    objc_msgSend(v4, "setMotion:");
    v4 = v5;
  }
  if (self->_buttons)
  {
    objc_msgSend(v5, "setButtons:");
    v4 = v5;
  }
  if (self->_digitizer)
  {
    objc_msgSend(v5, "setDigitizer:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_controllerID;
    *(_BYTE *)(v5 + 40) |= 1u;
  }
  v7 = -[_MRGameControllerMotionProtobuf copyWithZone:](self->_motion, "copyWithZone:", a3);
  v8 = (void *)v6[4];
  v6[4] = v7;

  v9 = -[_MRGameControllerButtonsProtobuf copyWithZone:](self->_buttons, "copyWithZone:", a3);
  v10 = (void *)v6[2];
  v6[2] = v9;

  v11 = -[_MRGameControllerDigitizerProtobuf copyWithZone:](self->_digitizer, "copyWithZone:", a3);
  v12 = (void *)v6[3];
  v6[3] = v11;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _MRGameControllerMotionProtobuf *motion;
  _MRGameControllerButtonsProtobuf *buttons;
  _MRGameControllerDigitizerProtobuf *digitizer;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_controllerID != *((_QWORD *)v4 + 1))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
LABEL_13:
    v8 = 0;
    goto LABEL_14;
  }
  motion = self->_motion;
  if ((unint64_t)motion | *((_QWORD *)v4 + 4)
    && !-[_MRGameControllerMotionProtobuf isEqual:](motion, "isEqual:"))
  {
    goto LABEL_13;
  }
  buttons = self->_buttons;
  if ((unint64_t)buttons | *((_QWORD *)v4 + 2))
  {
    if (!-[_MRGameControllerButtonsProtobuf isEqual:](buttons, "isEqual:"))
      goto LABEL_13;
  }
  digitizer = self->_digitizer;
  if ((unint64_t)digitizer | *((_QWORD *)v4 + 3))
    v8 = -[_MRGameControllerDigitizerProtobuf isEqual:](digitizer, "isEqual:");
  else
    v8 = 1;
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761u * self->_controllerID;
  else
    v3 = 0;
  v4 = -[_MRGameControllerMotionProtobuf hash](self->_motion, "hash") ^ v3;
  v5 = -[_MRGameControllerButtonsProtobuf hash](self->_buttons, "hash");
  return v4 ^ v5 ^ -[_MRGameControllerDigitizerProtobuf hash](self->_digitizer, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  _MRGameControllerMotionProtobuf *motion;
  uint64_t v7;
  _MRGameControllerButtonsProtobuf *buttons;
  uint64_t v9;
  _MRGameControllerDigitizerProtobuf *digitizer;
  uint64_t v11;
  _QWORD *v12;

  v4 = a3;
  v5 = v4;
  if ((v4[5] & 1) != 0)
  {
    self->_controllerID = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }
  motion = self->_motion;
  v7 = v5[4];
  v12 = v5;
  if (motion)
  {
    if (!v7)
      goto LABEL_9;
    -[_MRGameControllerMotionProtobuf mergeFrom:](motion, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_9;
    -[_MRGameControllerMessageProtobuf setMotion:](self, "setMotion:");
  }
  v5 = v12;
LABEL_9:
  buttons = self->_buttons;
  v9 = v5[2];
  if (buttons)
  {
    if (!v9)
      goto LABEL_15;
    -[_MRGameControllerButtonsProtobuf mergeFrom:](buttons, "mergeFrom:");
  }
  else
  {
    if (!v9)
      goto LABEL_15;
    -[_MRGameControllerMessageProtobuf setButtons:](self, "setButtons:");
  }
  v5 = v12;
LABEL_15:
  digitizer = self->_digitizer;
  v11 = v5[3];
  if (digitizer)
  {
    if (v11)
    {
      -[_MRGameControllerDigitizerProtobuf mergeFrom:](digitizer, "mergeFrom:");
LABEL_20:
      v5 = v12;
    }
  }
  else if (v11)
  {
    -[_MRGameControllerMessageProtobuf setDigitizer:](self, "setDigitizer:");
    goto LABEL_20;
  }

}

- (unint64_t)controllerID
{
  return self->_controllerID;
}

- (_MRGameControllerMotionProtobuf)motion
{
  return self->_motion;
}

- (void)setMotion:(id)a3
{
  objc_storeStrong((id *)&self->_motion, a3);
}

- (_MRGameControllerButtonsProtobuf)buttons
{
  return self->_buttons;
}

- (void)setButtons:(id)a3
{
  objc_storeStrong((id *)&self->_buttons, a3);
}

- (_MRGameControllerDigitizerProtobuf)digitizer
{
  return self->_digitizer;
}

- (void)setDigitizer:(id)a3
{
  objc_storeStrong((id *)&self->_digitizer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_motion, 0);
  objc_storeStrong((id *)&self->_digitizer, 0);
  objc_storeStrong((id *)&self->_buttons, 0);
}

@end
