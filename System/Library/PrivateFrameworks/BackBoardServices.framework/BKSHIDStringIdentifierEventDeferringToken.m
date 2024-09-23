@implementation BKSHIDStringIdentifierEventDeferringToken

void __60___BKSHIDStringIdentifierEventDeferringToken_protobufSchema__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0D01838], "buildSchemaForClass:builder:", *(_QWORD *)(a1 + 32), &__block_literal_global_48);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)protobufSchema_schema_46;
  protobufSchema_schema_46 = v1;

}

uint64_t __60___BKSHIDStringIdentifierEventDeferringToken_protobufSchema__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addField:forTag:", "_stringIdentifier", 2);
}

@end
