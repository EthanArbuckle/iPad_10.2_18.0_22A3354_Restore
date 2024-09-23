@implementation TDSchemaRenditionSpec

- (id)_slicesToUseForCSI
{
  void *v2;

  v2 = (void *)-[TDSchemaRenditionSpec production](self, "production");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (id)objc_msgSend(v2, "slices");
  else
    return 0;
}

@end
