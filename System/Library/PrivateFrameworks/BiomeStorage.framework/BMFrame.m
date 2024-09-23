@implementation BMFrame

- (BMFrame)initWithHeader:(id *)a3 storePath:(id)a4 data:(id)a5 framePtr:(void *)a6 offset:(unint64_t)a7 nextOffset:(unint64_t)a8 timestamp:(double)a9 datastoreVersion:(unint64_t)a10 state:(unsigned int)a11
{
  id v19;
  id v20;
  char *v21;
  BMFrame *v22;
  __int128 v23;
  objc_super v25;

  v19 = a4;
  v20 = a5;
  v25.receiver = self;
  v25.super_class = (Class)BMFrame;
  v21 = -[BMFrame init](&v25, sel_init);
  v22 = (BMFrame *)v21;
  if (v21)
  {
    *((_QWORD *)v21 + 2) = a6;
    v23 = *(_OWORD *)&a3->var0.var0.var0.var0;
    *(_OWORD *)(v21 + 88) = *((_OWORD *)&a3->var1 + 1);
    *(_OWORD *)(v21 + 72) = v23;
    objc_storeStrong((id *)v21 + 3, a4);
    objc_storeStrong((id *)&v22->_data, a5);
    v22->_offset = a7;
    v22->_nextOffset = a8;
    v22->_creationTimestamp = a9;
    v22->_datastoreVersion = a10;
    v22->_state = a11;
  }

  return v22;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_storePath, 0);
}

- (double)creationTimestamp
{
  return self->_creationTimestamp;
}

- (unsigned)state
{
  return self->_state;
}

- (unsigned)dataVersion
{
  uint64_t v3;

  if (-[BMFrame datastoreVersion](self, "datastoreVersion") == 9)
  {
    v3 = 100;
    return *(_DWORD *)((char *)&self->super.isa + v3);
  }
  if (-[BMFrame datastoreVersion](self, "datastoreVersion") == 10)
  {
    v3 = 76;
    return *(_DWORD *)((char *)&self->super.isa + v3);
  }
  return 0;
}

- (unint64_t)datastoreVersion
{
  return self->_datastoreVersion;
}

- (unint64_t)offset
{
  return self->_offset;
}

- (NSData)data
{
  return self->_data;
}

- (unint64_t)nextOffset
{
  return self->_nextOffset;
}

- (double)modifiedTimestamp
{
  unint64_t v3;
  double result;

  v3 = -[BMFrame datastoreVersion](self, "datastoreVersion");
  result = 0.0;
  if (v3 == 9)
    return self->_frameHeader.frameHeaderV1.otherInfo.modifiedTimestamp;
  return result;
}

- (void)framePtr
{
  return self->_framePtr;
}

- ($BF470DBDD0B504C7FE3574886EF5E48C)frameHeader
{
  __int128 v3;

  v3 = *(_OWORD *)(&self[2].var1 + 3);
  *(_OWORD *)&retstr->var0.var0.var0.var0 = *(_OWORD *)(&self[2].var1 + 1);
  *((_OWORD *)&retstr->var1 + 1) = v3;
  return self;
}

- (NSString)storePath
{
  return self->_storePath;
}

@end
