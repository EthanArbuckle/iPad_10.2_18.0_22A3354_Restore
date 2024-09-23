@implementation DTSysmonRecordEnumerator

- (DTSysmonRecordEnumerator)initWithHeartbeatTime:(unint64_t)a3
{
  DTSysmonRecordEnumerator *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DTSysmonRecordEnumerator;
  result = -[DTSysmonRecordEnumerator init](&v5, sel_init);
  if (result)
    result->_heartbeatTime = a3;
  return result;
}

- (unint64_t)enumerateRecordsWithBlock:(id)a3
{
  id v4;
  void *v5;
  NSArray *samples;
  unint64_t heartbeatTime;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  unint64_t v15;

  v4 = a3;
  v5 = v4;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  samples = self->_samples;
  if (samples)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = sub_222B2D5A0;
    v9[3] = &unk_24EB28988;
    v11 = &v12;
    v9[4] = self;
    v10 = v4;
    -[NSArray enumerateObjectsUsingBlock:](samples, "enumerateObjectsUsingBlock:", v9);

    heartbeatTime = v13[3];
  }
  else
  {
    heartbeatTime = self->_heartbeatTime;
    v15 = heartbeatTime;
  }
  _Block_object_dispose(&v12, 8);

  return heartbeatTime;
}

- (DTSysmonTapRecordDecoder)recordDecoder
{
  return self->_recordDecoder;
}

- (void)setRecordDecoder:(id)a3
{
  objc_storeStrong((id *)&self->_recordDecoder, a3);
}

- (NSArray)samples
{
  return self->_samples;
}

- (void)setSamples:(id)a3
{
  objc_storeStrong((id *)&self->_samples, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_samples, 0);
  objc_storeStrong((id *)&self->_recordDecoder, 0);
}

@end
