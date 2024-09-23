@implementation _GCHapticEvent

- (pair<BOOL,)valueForNoteParam:(unsigned int)a3 inParameters:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  signed int v10;
  uint64_t v11;
  unint64_t v12;
  unsigned int v13;
  unsigned int v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = a4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v9, "identifier", (_QWORD)v16) == a3)
        {
          objc_msgSend(v9, "value");
          v14 = v13;

          v12 = (unint64_t)v14 << 32;
          v11 = 1;
          goto LABEL_13;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v6)
        continue;
      break;
    }
  }

  v10 = a3 - 330;
  if (a3 - 330 >= 7)
  {
    v11 = 0;
    v12 = 0;
  }
  else
  {
    v11 = 0;
    v12 = qword_21526CDB0[v10];
  }
LABEL_13:

  return (pair<BOOL, float>)(v12 | v11);
}

- (void)evaluateDeviceNoteParams:(id)a3
{
  id v4;

  v4 = a3;
  self->_intensity = COERCE_FLOAT((unint64_t)-[_GCHapticEvent valueForNoteParam:inParameters:](self, "valueForNoteParam:inParameters:", 330) >> 32);
  self->_sharpness = COERCE_FLOAT((unint64_t)-[_GCHapticEvent valueForNoteParam:inParameters:](self, "valueForNoteParam:inParameters:", 331, v4) >> 32);

}

- (_GCHapticEvent)initWithSyntheticCommand:(id)a3
{
  id v4;
  _GCHapticEvent *v5;
  _GCHapticEvent *v6;
  double v7;
  void *v8;
  unsigned __int8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_GCHapticEvent;
  v5 = -[_GCHapticEvent init](&v14, sel_init);
  if (!v5)
  {
LABEL_13:
    v6 = v5;
    goto LABEL_14;
  }
  objc_msgSend(v4, "tokenAndParams");
  v6 = (_GCHapticEvent *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v5->_type = 0;
    objc_msgSend(v4, "time");
    v5->_startTime = v7;
    v5->_identifier = -[_GCHapticEvent token](v6, "token");
    -[_GCHapticEvent params](v6, "params");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_GCHapticEvent evaluateDeviceNoteParams:](v5, "evaluateDeviceNoteParams:", v8);

    v9 = objc_msgSend(v4, "eventID");
    v10 = v9;
    switch(v9)
    {
      case 1u:
        break;
      case 2u:
        goto LABEL_11;
      case 3u:
        v11 = 0x3FC999999999999ALL;
        goto LABEL_7;
      case 4u:
        v11 = 0x3FE199999999999ALL;
LABEL_7:
        *(_QWORD *)&v5->_sharpness = v11;
        v10 = 1;
        break;
      case 5u:
        v12 = 0x3FC999999999999ALL;
        goto LABEL_10;
      case 6u:
        v12 = 0x3FE199999999999ALL;
LABEL_10:
        *(_QWORD *)&v5->_sharpness = v12;
LABEL_11:
        v10 = 2;
        break;
      default:
        v10 = 0;
        break;
    }
    v5->_type = v10;

    goto LABEL_13;
  }
LABEL_14:

  return v6;
}

- (id)description
{
  objc_class *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (self->_type == 1)
    v6 = CFSTR("transient");
  else
    v6 = CFSTR("continuous");
  +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("<%@ %lu (%@), i=%f s=%f (started at %f)>"), v4, self->_identifier, v6, *(_QWORD *)&self->_intensity, *(_QWORD *)&self->_sharpness, *(_QWORD *)&self->_startTime);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(unint64_t)a3
{
  self->_identifier = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (double)intensity
{
  return self->_intensity;
}

- (void)setIntensity:(double)a3
{
  self->_intensity = a3;
}

- (double)sharpness
{
  return self->_sharpness;
}

- (void)setSharpness:(double)a3
{
  self->_sharpness = a3;
}

- (BOOL)stopped
{
  return self->_stopped;
}

- (void)setStopped:(BOOL)a3
{
  self->_stopped = a3;
}

- (BOOL)transientBeganAsContinuousEvent
{
  return self->_transientBeganAsContinuousEvent;
}

- (void)setTransientBeganAsContinuousEvent:(BOOL)a3
{
  self->_transientBeganAsContinuousEvent = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_GCHapticEvent)initWithCoder:(id)a3
{
  id v4;
  _GCHapticEvent *v5;
  double v6;
  double v7;
  double v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_GCHapticEvent;
  v5 = -[_GCHapticEvent init](&v10, sel_init);
  if (v5)
  {
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
    v5->_identifier = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("identifier"));
    v5->_stopped = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("stopped"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("startTime"));
    v5->_startTime = v6;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("intensity"));
    v5->_intensity = v7;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("sharpness"));
    v5->_sharpness = v8;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", self->_type, CFSTR("type"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_stopped, CFSTR("stopped"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("startTime"), self->_startTime);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("intensity"), self->_intensity);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("sharpness"), self->_sharpness);

}

@end
