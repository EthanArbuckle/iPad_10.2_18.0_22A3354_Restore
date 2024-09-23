@implementation IMDLiteMessageCompressor

+ (IMDLiteMessageCompressor)sharedCompressor
{
  if (qword_1EFC63F48[0] != -1)
    dispatch_once(qword_1EFC63F48, &unk_1E922F848);
  return (IMDLiteMessageCompressor *)(id)qword_1EFC63F40;
}

- (IMDLiteMessageCompressor)init
{
  IMDLiteMessageCompressor *v2;
  BlastDoorLiteMessageCompressor *v3;
  BlastDoorLiteMessageCompressor *compressor;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IMDLiteMessageCompressor;
  v2 = -[IMDLiteMessageCompressor init](&v6, sel_init);
  if (v2)
  {
    v3 = (BlastDoorLiteMessageCompressor *)objc_alloc_init(MEMORY[0x1E0D4D898]);
    compressor = v2->_compressor;
    v2->_compressor = v3;

  }
  return v2;
}

- (id)compressData:(id)a3 codecID:(int64_t *)a4
{
  return (id)MEMORY[0x1E0DE7D20](self->_compressor, sel_compressData_codecID_);
}

- (BlastDoorLiteMessageCompressor)compressor
{
  return self->_compressor;
}

- (void)setCompressor:(id)a3
{
  objc_storeStrong((id *)&self->_compressor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compressor, 0);
}

@end
