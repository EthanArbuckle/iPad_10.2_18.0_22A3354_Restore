@implementation MKOverlayTileLoader

uint64_t ___MKOverlayTileLoader_block_invoke()
{
  uint64_t v0;
  void *v1;

  VKRasterTileOverlayTileLoader();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1EDFB7CB8;
  qword_1EDFB7CB8 = v0;

  return objc_msgSend((id)qword_1EDFB7CB8, "registerTileLoader:", objc_opt_class());
}

@end
