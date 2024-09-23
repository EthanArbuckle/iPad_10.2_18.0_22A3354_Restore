@implementation MRMediaRemoteCopyReadableDictionaryDescription

void __MRMediaRemoteCopyReadableDictionaryDescription_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t StringRepresentation;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    StringRepresentation = MRDataCreateStringRepresentation(v5);

    v5 = (id)StringRepresentation;
  }
  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("\n\t%@ = %@"), v7, v5);

}

@end
