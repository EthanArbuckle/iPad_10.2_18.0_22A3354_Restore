@implementation MRCreateSupportedCommandsFromProtobuf

MRCommandInfo *__MRCreateSupportedCommandsFromProtobuf_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  MRCommandInfo *v3;

  v2 = a2;
  v3 = -[MRCommandInfo initWithProtobuf:]([MRCommandInfo alloc], "initWithProtobuf:", v2);

  return v3;
}

@end
