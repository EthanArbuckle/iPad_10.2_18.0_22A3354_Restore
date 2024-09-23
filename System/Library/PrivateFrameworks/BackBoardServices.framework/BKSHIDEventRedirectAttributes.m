@implementation BKSHIDEventRedirectAttributes

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BKSHIDEventRedirectAttributes;
  result = -[BKSHIDEventBaseAttributes copyWithZone:](&v5, sel_copyWithZone_, a3);
  *((_DWORD *)result + 12) = self->_pid;
  return result;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)BKSHIDEventRedirectAttributes;
  -[BKSHIDEventBaseAttributes appendDescriptionToFormatter:](&v6, sel_appendDescriptionToFormatter_, v4);
  v5 = (id)objc_msgSend(v4, "appendInteger:withName:", self->_pid, CFSTR("pid"));

}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

+ (id)protobufSchema
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__BKSHIDEventRedirectAttributes_protobufSchema__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (protobufSchema_onceToken_227 != -1)
    dispatch_once(&protobufSchema_onceToken_227, block);
  return (id)protobufSchema_schema_226;
}

void __47__BKSHIDEventRedirectAttributes_protobufSchema__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0D01838], "buildSchemaForClass:builder:", *(_QWORD *)(a1 + 32), &__block_literal_global_228);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)protobufSchema_schema_226;
  protobufSchema_schema_226 = v1;

}

uint64_t __47__BKSHIDEventRedirectAttributes_protobufSchema__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addField:forTag:", "_pid", 1);
}

@end
