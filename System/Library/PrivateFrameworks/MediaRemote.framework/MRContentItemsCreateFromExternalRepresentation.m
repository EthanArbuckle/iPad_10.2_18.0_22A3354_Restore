@implementation MRContentItemsCreateFromExternalRepresentation

MRContentItem *__MRContentItemsCreateFromExternalRepresentation_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  MRContentItem *v3;

  v2 = a2;
  v3 = -[MRContentItem initWithData:]([MRContentItem alloc], "initWithData:", v2);

  return v3;
}

@end
