@implementation _INPBHomeUserTask

- (void)setAttribute:(int)a3
{
  char has;

  has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_BYTE *)&self->_has = has & 0xFE;
  }
  else
  {
    *(_BYTE *)&self->_has = has | 1;
    self->_attribute = a3;
  }
}

- (BOOL)hasAttribute
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasAttribute:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (id)attributeAsString:(int)a3
{
  if (a3 < 0x42)
    return off_1E2293510[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsAttribute:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ENABLED")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BRIGHTNESS")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HUE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SATURATION")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("COLOR_VALUE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TEMPERATURE")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HUMIDITY")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOCK")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("POSITION")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAISE")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROTATION_SPEED")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROTATION_DIRECTION")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SECURITY_SYSTEM_STATE")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HEATING_COOLING_MODE")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HEATER_COOLER_MODE")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CONTROL_LOCK")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("COOLING_THRESHOLD")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FAN_OPERATING_MODE")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HEATING_THRESHOLD")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HUMIDIFIER_DEHUMIDIFIER_MODE")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SLAT_OPERATING_MODE")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SWING_MODE")) & 1) != 0)
  {
    v4 = 21;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HUMIDIFIER_THRESHOLD")) & 1) != 0)
  {
    v4 = 22;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DEHUMIDIFIER_THRESHOLD")) & 1) != 0)
  {
    v4 = 23;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PROGRAM_MODE")) & 1) != 0)
  {
    v4 = 24;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DURATION")) & 1) != 0)
  {
    v4 = 25;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("POWER")) & 1) != 0)
  {
    v4 = 26;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AIR_QUALITY_RATING")) & 1) != 0)
  {
    v4 = 27;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AIR_PARTICULATE_DENSITY")) & 1) != 0)
  {
    v4 = 28;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AIR_PARTICULATE_SIZE")) & 1) != 0)
  {
    v4 = 29;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SMOKE_DETECTED")) & 1) != 0)
  {
    v4 = 30;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CARBON_MONOXIDE_DETECTED")) & 1) != 0)
  {
    v4 = 31;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CARBON_MONOXIDE_LEVEL")) & 1) != 0)
  {
    v4 = 32;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CARBON_MONOXIDE_PEAK_LEVEL")) & 1) != 0)
  {
    v4 = 33;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CARBON_DIOXIDE_DETECTED")) & 1) != 0)
  {
    v4 = 34;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CARBON_DIOXIDE_LEVEL")) & 1) != 0)
  {
    v4 = 35;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CARBON_DIOXIDE_PEAK_LEVEL")) & 1) != 0)
  {
    v4 = 36;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CONTACT_DETECTED")) & 1) != 0)
  {
    v4 = 37;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OCCUPANCY_DETECTED")) & 1) != 0)
  {
    v4 = 38;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LEAK_DETECTED")) & 1) != 0)
  {
    v4 = 39;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MOTION_DETECTED")) & 1) != 0)
  {
    v4 = 40;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AMBIENT_LIGHT_LEVEL")) & 1) != 0)
  {
    v4 = 41;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BATTERY_LEVEL")) & 1) != 0)
  {
    v4 = 42;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CHARGING_STATE")) & 1) != 0)
  {
    v4 = 43;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOW_BATTERY")) & 1) != 0)
  {
    v4 = 44;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IN_USE")) & 1) != 0)
  {
    v4 = 45;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AIR_PURIFIER_OPERATING_MODE")) & 1) != 0)
  {
    v4 = 46;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FILTER_CHANGE")) & 1) != 0)
  {
    v4 = 47;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FILTER_LIFE")) & 1) != 0)
  {
    v4 = 48;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATER_LEVEL")) & 1) != 0)
  {
    v4 = 49;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REMAINING_DURATION")) & 1) != 0)
  {
    v4 = 50;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STATUS_FAULT")) & 1) != 0)
  {
    v4 = 51;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SULPHUR_DIOXIDE_DENSITY")) & 1) != 0)
  {
    v4 = 52;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NITROGEN_DIOXIDE_DENSITY")) & 1) != 0)
  {
    v4 = 53;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PARTICULATE_MATTER_2_5_DENSITY")) & 1) != 0)
  {
    v4 = 54;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PARTICULATE_MATTER_10_DENSITY")) & 1) != 0)
  {
    v4 = 55;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VOLATILE_ORGANIC_COMPOUND_DENSITY")) & 1) != 0)
  {
    v4 = 56;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OZONE_DENSITY")) & 1) != 0)
  {
    v4 = 57;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("COLOR_TEMPERATURE")) & 1) != 0)
  {
    v4 = 58;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("COUNT")) & 1) != 0)
  {
    v4 = 59;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOCATION")) & 1) != 0)
  {
    v4 = 60;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INVENTORY")) & 1) != 0)
  {
    v4 = 61;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CAPABILITIES")) & 1) != 0)
  {
    v4 = 62;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OPEN")) & 1) != 0)
  {
    v4 = 63;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MEDIA")) & 1) != 0)
  {
    v4 = 64;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ADAPTIVE_LIGHTING")))
  {
    v4 = 65;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setTaskType:(int)a3
{
  char has;

  has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_BYTE *)&self->_has = has & 0xFD;
  }
  else
  {
    *(_BYTE *)&self->_has = has | 2;
    self->_taskType = a3;
  }
}

- (BOOL)hasTaskType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasTaskType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (id)taskTypeAsString:(int)a3
{
  if ((a3 - 1) < 6)
    return off_1E2293720[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsTaskType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SET")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INCREASE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DECREASE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GET")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GET_TARGET")) & 1) != 0)
  {
    v4 = 5;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("TOGGLE")))
  {
    v4 = 6;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)setValue:(id)a3
{
  objc_storeStrong((id *)&self->_value, a3);
}

- (BOOL)hasValue
{
  return self->_value != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBHomeUserTaskReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (-[_INPBHomeUserTask hasAttribute](self, "hasAttribute"))
    PBDataWriterWriteInt32Field();
  if (-[_INPBHomeUserTask hasTaskType](self, "hasTaskType"))
    PBDataWriterWriteInt32Field();
  -[_INPBHomeUserTask value](self, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v7;
  if (v4)
  {
    -[_INPBHomeUserTask value](self, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v5 = v7;
  }

}

- (_INPBHomeUserTask)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBHomeUserTask *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBHomeUserTask *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBHomeUserTask *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBHomeUserTask initWithData:](self, "initWithData:", v6);

    v6 = self;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_INPBHomeUserTask data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBHomeUserTask *v5;
  id v6;

  v5 = -[_INPBHomeUserTask init](+[_INPBHomeUserTask allocWithZone:](_INPBHomeUserTask, "allocWithZone:"), "init");
  if (-[_INPBHomeUserTask hasAttribute](self, "hasAttribute"))
    -[_INPBHomeUserTask setAttribute:](v5, "setAttribute:", -[_INPBHomeUserTask attribute](self, "attribute"));
  if (-[_INPBHomeUserTask hasTaskType](self, "hasTaskType"))
    -[_INPBHomeUserTask setTaskType:](v5, "setTaskType:", -[_INPBHomeUserTask taskType](self, "taskType"));
  v6 = -[_INPBHomeAttributeValue copyWithZone:](self->_value, "copyWithZone:", a3);
  -[_INPBHomeUserTask setValue:](v5, "setValue:", v6);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  int attribute;
  int v7;
  int taskType;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  BOOL v17;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = -[_INPBHomeUserTask hasAttribute](self, "hasAttribute");
    if (v5 == objc_msgSend(v4, "hasAttribute"))
    {
      if (!-[_INPBHomeUserTask hasAttribute](self, "hasAttribute")
        || !objc_msgSend(v4, "hasAttribute")
        || (attribute = self->_attribute, attribute == objc_msgSend(v4, "attribute")))
      {
        v7 = -[_INPBHomeUserTask hasTaskType](self, "hasTaskType");
        if (v7 == objc_msgSend(v4, "hasTaskType"))
        {
          if (!-[_INPBHomeUserTask hasTaskType](self, "hasTaskType")
            || !objc_msgSend(v4, "hasTaskType")
            || (taskType = self->_taskType, taskType == objc_msgSend(v4, "taskType")))
          {
            -[_INPBHomeUserTask value](self, "value");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "value");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = v10;
            if ((v9 == 0) != (v10 != 0))
            {
              -[_INPBHomeUserTask value](self, "value");
              v12 = objc_claimAutoreleasedReturnValue();
              if (!v12)
              {

LABEL_18:
                v17 = 1;
                goto LABEL_16;
              }
              v13 = (void *)v12;
              -[_INPBHomeUserTask value](self, "value");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "value");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(v14, "isEqual:", v15);

              if ((v16 & 1) != 0)
                goto LABEL_18;
            }
            else
            {

            }
          }
        }
      }
    }
  }
  v17 = 0;
LABEL_16:

  return v17;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  if (-[_INPBHomeUserTask hasAttribute](self, "hasAttribute"))
    v3 = 2654435761 * self->_attribute;
  else
    v3 = 0;
  if (-[_INPBHomeUserTask hasTaskType](self, "hasTaskType"))
    v4 = 2654435761 * self->_taskType;
  else
    v4 = 0;
  return v4 ^ v3 ^ -[_INPBHomeAttributeValue hash](self->_value, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t v4;
  __CFString *v5;
  uint64_t v6;
  __CFString *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_INPBHomeUserTask hasAttribute](self, "hasAttribute"))
  {
    v4 = -[_INPBHomeUserTask attribute](self, "attribute");
    if (v4 >= 0x42)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E2293510[v4];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("attribute"));

  }
  if (-[_INPBHomeUserTask hasTaskType](self, "hasTaskType"))
  {
    v6 = -[_INPBHomeUserTask taskType](self, "taskType");
    if ((v6 - 1) >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v6);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E2293720[(v6 - 1)];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("taskType"));

  }
  -[_INPBHomeUserTask value](self, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("value"));

  return v3;
}

- (int)attribute
{
  return self->_attribute;
}

- (int)taskType
{
  return self->_taskType;
}

- (_INPBHomeAttributeValue)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
