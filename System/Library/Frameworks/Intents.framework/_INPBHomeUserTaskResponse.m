@implementation _INPBHomeUserTaskResponse

- (void)setTaskOutcome:(int)a3
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
    self->_taskOutcome = a3;
  }
}

- (BOOL)hasTaskOutcome
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasTaskOutcome:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (id)taskOutcomeAsString:(int)a3
{
  if ((a3 - 1) < 0x17)
    return off_1E2293458[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsTaskOutcome:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SUCCESS")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNSUPPORTED_ATTRIBUTE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("READ_ONLY")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ALREADY_AT_MAX_VALUE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ALREADY_AT_MIN_VALUE")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNREACHABLE")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FAILURE")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SET_TO_MAX_VALUE")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SET_TO_MIN_VALUE")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LARGER_THAN_MAX_VALUE")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SMALLER_THAN_MIN_VALUE")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NO_REMOTE_ACCESS")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NO_MATCHING_ATTRIBUTE")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BLUETOOTH_IS_OFF")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WIFI_IS_OFF")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BRIDGED_ACCESSORY_UNREACHABLE")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IN_PROGRESS")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SCENE_NOT_SET_UP")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SECURING_FAILURE")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BLUETOOTH_WAKEUP")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNLOCK_REQUIRED")) & 1) != 0)
  {
    v4 = 21;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SECURED_ACCESS_DENIED")) & 1) != 0)
  {
    v4 = 22;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("CALIBRATION_IN_PROGRESS")))
  {
    v4 = 23;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)setUserTask:(id)a3
{
  objc_storeStrong((id *)&self->_userTask, a3);
}

- (BOOL)hasUserTask
{
  return self->_userTask != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBHomeUserTaskResponseReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (-[_INPBHomeUserTaskResponse hasTaskOutcome](self, "hasTaskOutcome"))
    PBDataWriterWriteInt32Field();
  -[_INPBHomeUserTaskResponse userTask](self, "userTask");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v7;
  if (v4)
  {
    -[_INPBHomeUserTaskResponse userTask](self, "userTask");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v5 = v7;
  }

}

- (_INPBHomeUserTaskResponse)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBHomeUserTaskResponse *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBHomeUserTaskResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBHomeUserTaskResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBHomeUserTaskResponse initWithData:](self, "initWithData:", v6);

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
  -[_INPBHomeUserTaskResponse data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBHomeUserTaskResponse *v5;
  id v6;

  v5 = -[_INPBHomeUserTaskResponse init](+[_INPBHomeUserTaskResponse allocWithZone:](_INPBHomeUserTaskResponse, "allocWithZone:"), "init");
  if (-[_INPBHomeUserTaskResponse hasTaskOutcome](self, "hasTaskOutcome"))
    -[_INPBHomeUserTaskResponse setTaskOutcome:](v5, "setTaskOutcome:", -[_INPBHomeUserTaskResponse taskOutcome](self, "taskOutcome"));
  v6 = -[_INPBHomeUserTask copyWithZone:](self->_userTask, "copyWithZone:", a3);
  -[_INPBHomeUserTaskResponse setUserTask:](v5, "setUserTask:", v6);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  int taskOutcome;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  BOOL v15;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = -[_INPBHomeUserTaskResponse hasTaskOutcome](self, "hasTaskOutcome");
    if (v5 == objc_msgSend(v4, "hasTaskOutcome"))
    {
      if (!-[_INPBHomeUserTaskResponse hasTaskOutcome](self, "hasTaskOutcome")
        || !objc_msgSend(v4, "hasTaskOutcome")
        || (taskOutcome = self->_taskOutcome, taskOutcome == objc_msgSend(v4, "taskOutcome")))
      {
        -[_INPBHomeUserTaskResponse userTask](self, "userTask");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "userTask");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if ((v7 == 0) != (v8 != 0))
        {
          -[_INPBHomeUserTaskResponse userTask](self, "userTask");
          v10 = objc_claimAutoreleasedReturnValue();
          if (!v10)
          {

LABEL_14:
            v15 = 1;
            goto LABEL_12;
          }
          v11 = (void *)v10;
          -[_INPBHomeUserTaskResponse userTask](self, "userTask");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "userTask");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v12, "isEqual:", v13);

          if ((v14 & 1) != 0)
            goto LABEL_14;
        }
        else
        {

        }
      }
    }
  }
  v15 = 0;
LABEL_12:

  return v15;
}

- (unint64_t)hash
{
  uint64_t v3;

  if (-[_INPBHomeUserTaskResponse hasTaskOutcome](self, "hasTaskOutcome"))
    v3 = 2654435761 * self->_taskOutcome;
  else
    v3 = 0;
  return -[_INPBHomeUserTask hash](self->_userTask, "hash") ^ v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t v4;
  __CFString *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_INPBHomeUserTaskResponse hasTaskOutcome](self, "hasTaskOutcome"))
  {
    v4 = -[_INPBHomeUserTaskResponse taskOutcome](self, "taskOutcome");
    if ((v4 - 1) >= 0x17)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E2293458[(v4 - 1)];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("taskOutcome"));

  }
  -[_INPBHomeUserTaskResponse userTask](self, "userTask");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("userTask"));

  return v3;
}

- (int)taskOutcome
{
  return self->_taskOutcome;
}

- (_INPBHomeUserTask)userTask
{
  return self->_userTask;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userTask, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
