@implementation NSError

id __44__NSError_MRAdditions__mr_initWithProtobuf___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;

  v2 = (objc_class *)MEMORY[0x1E0CB35C8];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v4, "mr_initWithProtobuf:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __35__NSError_MRAdditions__mr_protobuf__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "mr_protobuf");
}

@end
