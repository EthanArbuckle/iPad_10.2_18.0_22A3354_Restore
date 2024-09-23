@implementation AXMIDIEvent

- (id)copyWithZone:(_NSZone *)a3
{
  AXMIDIEvent *v4;

  v4 = objc_alloc_init(AXMIDIEvent);
  -[AXMIDIEvent setChannel:](v4, "setChannel:", -[AXMIDIEvent channel](self, "channel"));
  -[AXMIDIEvent setType:](v4, "setType:", -[AXMIDIEvent type](self, "type"));
  -[AXMIDIEvent setNote:](v4, "setNote:", -[AXMIDIEvent note](self, "note"));
  -[AXMIDIEvent setPressure:](v4, "setPressure:", -[AXMIDIEvent pressure](self, "pressure"));
  -[AXMIDIEvent setControl:](v4, "setControl:", -[AXMIDIEvent control](self, "control"));
  -[AXMIDIEvent setControlValue:](v4, "setControlValue:", -[AXMIDIEvent controlValue](self, "controlValue"));
  -[AXMIDIEvent setProgram:](v4, "setProgram:", -[AXMIDIEvent program](self, "program"));
  -[AXMIDIEvent setPitchBend:](v4, "setPitchBend:", -[AXMIDIEvent pitchBend](self, "pitchBend"));
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[AXMIDIEvent channel](self, "channel"), CFSTR("midi_channel"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[AXMIDIEvent type](self, "type"), CFSTR("midi_type"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[AXMIDIEvent note](self, "note"), CFSTR("midi_note"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[AXMIDIEvent pressure](self, "pressure"), CFSTR("midi_pressure"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[AXMIDIEvent control](self, "control"), CFSTR("midi_control"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[AXMIDIEvent controlValue](self, "controlValue"), CFSTR("midi_controlvalue"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[AXMIDIEvent program](self, "program"), CFSTR("midi_program"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[AXMIDIEvent pitchBend](self, "pitchBend"), CFSTR("midi_pitchbend"));

}

- (AXMIDIEvent)initWithCoder:(id)a3
{
  id v4;
  AXMIDIEvent *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)AXMIDIEvent;
  v5 = -[AXMIDIEvent init](&v7, sel_init);
  if (v5)
  {
    v5->_channel = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("midi_channel"));
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("midi_type"));
    v5->_note = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("midi_note"));
    v5->_pressure = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("midi_pressure"));
    v5->_control = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("midi_control"));
    v5->_controlValue = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("midi_controlvalue"));
    v5->_program = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("midi_program"));
    v5->_pitchBend = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("midi_pitchbend"));
  }

  return v5;
}

- (id)description
{
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  switch(-[AXMIDIEvent type](self, "type"))
  {
    case 0:
      v3 = CFSTR("Unknown");
      break;
    case 1:
      v4 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", -[AXMIDIEvent note](self, "note"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXMIDIEvent noteDescription](self, "noteDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", -[AXMIDIEvent pressure](self, "pressure"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stringWithFormat:", CFSTR("Note Off. note:%@ (%@) pressure:%@"), v5, v6, v7);
      goto LABEL_7;
    case 2:
      v8 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", -[AXMIDIEvent note](self, "note"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXMIDIEvent noteDescription](self, "noteDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", -[AXMIDIEvent pressure](self, "pressure"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("Note On. note:%@ (%@) pressure:%@"), v5, v6, v7);
      goto LABEL_7;
    case 3:
      v9 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", -[AXMIDIEvent note](self, "note"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXMIDIEvent noteDescription](self, "noteDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", -[AXMIDIEvent pressure](self, "pressure"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", CFSTR("AfterTouch. note:%@ (%@) pressure:%@"), v5, v6, v7);
LABEL_7:
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

      goto LABEL_9;
    case 4:
      v10 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", -[AXMIDIEvent control](self, "control"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", -[AXMIDIEvent controlValue](self, "controlValue"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("Control Change. control:%@ value:%@"), v5, v6);
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_9:

      goto LABEL_14;
    case 5:
      v11 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", -[AXMIDIEvent program](self, "program"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("Program Change. program:%@"), v5);
      goto LABEL_13;
    case 6:
      v12 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", -[AXMIDIEvent pressure](self, "pressure"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("Channel AfterTouch. pressure:%@"), v5);
      goto LABEL_13;
    case 7:
      v13 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", -[AXMIDIEvent pitchBend](self, "pitchBend"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR("Pitch Bend. value:%@"), v5);
LABEL_13:
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_14:

      break;
    case 8:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("System Exclusive"));
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v3 = 0;
      break;
  }
  v14 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[AXMIDIEvent ordinalChannel](self, "ordinalChannel"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("MIDIEvent<%p>: channel:%@ type:%@"), self, v15, v3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (BOOL)isDownEvent
{
  return -[AXMIDIEvent type](self, "type") == 2;
}

- (int64_t)ordinalChannel
{
  int64_t result;

  result = self->_channel;
  if ((int)result > 127)
  {
    if ((int)result <= 2047)
    {
      if ((int)result > 511)
      {
        if ((_DWORD)result == 512)
          return 10;
        if ((_DWORD)result == 1024)
          return 11;
      }
      else
      {
        if ((_DWORD)result == 128)
          return 8;
        if ((_DWORD)result == 256)
          return 9;
      }
    }
    else if ((int)result < 0x2000)
    {
      if ((_DWORD)result == 2048)
        return 12;
      if ((_DWORD)result == 4096)
        return 13;
    }
    else
    {
      switch((_DWORD)result)
      {
        case 0x2000:
          return 14;
        case 0x4000:
          return 15;
        case 0x8000:
          return 16;
      }
    }
    return -1;
  }
  if ((int)result > 15)
  {
    switch((_DWORD)result)
    {
      case 0x10:
        return 5;
      case 0x20:
        return 6;
      case 0x40:
        return 7;
    }
    return -1;
  }
  switch((int)result)
  {
    case 0:
      return result;
    case 1:
      result = 1;
      break;
    case 2:
      result = 2;
      break;
    case 4:
      result = 3;
      break;
    case 8:
      result = 4;
      break;
    default:
      return -1;
  }
  return result;
}

- (BOOL)isOmniChannel
{
  return self->_channel == 0;
}

- (int64_t)noteValue
{
  int v2;

  v2 = -[AXMIDIEvent note](self, "note");
  return (v2 - 12 * ((171 * v2) >> 11));
}

- (unsigned)noteOctave
{
  return (171 * -[AXMIDIEvent note](self, "note")) >> 11;
}

- (id)noteDescription
{
  unint64_t v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = -[AXMIDIEvent noteValue](self, "noteValue");
  if (v3 > 0xB)
    v4 = &stru_1E24CAB08;
  else
    v4 = off_1E24C7360[v3];
  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", -[AXMIDIEvent noteOctave](self, "noteOctave"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@-%@"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unsigned)channel
{
  return self->_channel;
}

- (void)setChannel:(unsigned __int16)a3
{
  self->_channel = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (unsigned)note
{
  return self->_note;
}

- (void)setNote:(unsigned __int8)a3
{
  self->_note = a3;
}

- (unsigned)pressure
{
  return self->_pressure;
}

- (void)setPressure:(unsigned __int8)a3
{
  self->_pressure = a3;
}

- (unsigned)control
{
  return self->_control;
}

- (void)setControl:(unsigned __int8)a3
{
  self->_control = a3;
}

- (unsigned)controlValue
{
  return self->_controlValue;
}

- (void)setControlValue:(unsigned __int8)a3
{
  self->_controlValue = a3;
}

- (unsigned)program
{
  return self->_program;
}

- (void)setProgram:(unsigned __int8)a3
{
  self->_program = a3;
}

- (unsigned)pitchBend
{
  return self->_pitchBend;
}

- (void)setPitchBend:(unsigned __int16)a3
{
  self->_pitchBend = a3;
}

@end
