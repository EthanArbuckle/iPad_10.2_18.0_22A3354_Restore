@implementation BKSHIDCGSConnectIDEventDeferringToken

void __56___BKSHIDCGSConnectIDEventDeferringToken_protobufSchema__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0D01838], "buildSchemaForClass:builder:", *(_QWORD *)(a1 + 32), &__block_literal_global_67);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)protobufSchema_schema_65;
  protobufSchema_schema_65 = v1;

}

uint64_t __56___BKSHIDCGSConnectIDEventDeferringToken_protobufSchema__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addField:forTag:", "_CGSConnectionID", 3);
}

@end
