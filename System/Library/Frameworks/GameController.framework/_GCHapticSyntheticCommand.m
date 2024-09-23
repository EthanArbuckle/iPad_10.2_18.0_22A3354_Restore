@implementation _GCHapticSyntheticCommand

- (_GCHapticSyntheticCommand)initWithHapticCommand:(const void *)a3
{
  _GCHapticSyntheticCommand *v4;
  _GCHapticSyntheticCommand *v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_GCHapticSyntheticCommand;
  v4 = -[_GCHapticSyntheticCommand init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v6 = syntheticCommandServerID++;
    v4->_serverID = v6;
    v4->_type = *((_WORD *)a3 + 1);
    v4->_time = *((double *)a3 + 1);
    v4->_channelOrSeqID = *((_QWORD *)a3 + 2);
    v4->_identifier = *((_QWORD *)a3 + 3);
    -[_GCHapticSyntheticCommand preprocessCommand:](v4, "preprocessCommand:", a3);
  }
  return v5;
}

- (void)preprocessCommand:(const void *)a3
{
  int v4;
  _GCHapticParameterCurve *v5;
  void *tokenAndParams;
  _GCHapticTokenAndParams *v7;

  v4 = *((unsigned __int16 *)a3 + 1);
  if ((v4 - 1) < 2)
  {
    v7 = -[_GCHapticTokenAndParams initWithHapticCommand:]([_GCHapticTokenAndParams alloc], "initWithHapticCommand:", a3);
    tokenAndParams = self->_tokenAndParams;
    self->_tokenAndParams = v7;
LABEL_6:

    return;
  }
  if (v4 != 3)
  {
    if (v4 != 10)
      return;
    v5 = -[_GCHapticParameterCurve initWithHapticCommand:]([_GCHapticParameterCurve alloc], "initWithHapticCommand:", a3);
    tokenAndParams = self->_parameterCurve;
    self->_parameterCurve = v5;
    goto LABEL_6;
  }
  self->_value = *((float *)a3 + 8);
}

- (void)cancel
{
  self->_type = 30;
}

- (unsigned)type
{
  return self->_type;
}

- (double)time
{
  return self->_time;
}

- (unint64_t)channelID
{
  return self->_channelOrSeqID;
}

- (unint64_t)sequenceID
{
  return self->_channelOrSeqID;
}

- (unint64_t)eventID
{
  return self->_identifier;
}

- (unint64_t)paramID
{
  return self->_identifier;
}

- (unsigned)command
{
  return self->_identifier;
}

- (id)description
{
  return +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("<%@ serverID=%lu time=%f>"), objc_opt_class(), self->_serverID, *(_QWORD *)&self->_time);
}

- (unint64_t)serverID
{
  return self->_serverID;
}

- (float)value
{
  return self->_value;
}

- (_GCHapticParameterCurve)parameterCurve
{
  return self->_parameterCurve;
}

- (_GCHapticTokenAndParams)tokenAndParams
{
  return self->_tokenAndParams;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenAndParams, 0);
  objc_storeStrong((id *)&self->_parameterCurve, 0);
}

@end
