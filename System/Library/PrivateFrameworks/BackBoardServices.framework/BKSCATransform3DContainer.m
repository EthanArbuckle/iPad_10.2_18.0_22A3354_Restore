@implementation BKSCATransform3DContainer

void __44___BKSCATransform3DContainer_protobufSchema__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0D01838], "buildSchemaForClass:builder:", objc_opt_class(), &__block_literal_global_10362);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)protobufSchema_schema_10361;
  protobufSchema_schema_10361 = v0;

}

uint64_t __44___BKSCATransform3DContainer_protobufSchema__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addField:forTag:", "_transform", 1);
}

@end
