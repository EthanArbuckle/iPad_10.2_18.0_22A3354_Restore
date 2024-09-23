@implementation MakeFileTransferAnchor

void ___MakeFileTransferAnchor_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  v0 = objc_opt_new();
  v1 = (void *)_MakeFileTransferAnchor___formatter;
  _MakeFileTransferAnchor___formatter = v0;

  objc_msgSend((id)_MakeFileTransferAnchor___formatter, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH:mm:ss.SSS"));
  objc_msgSend(MEMORY[0x24BDBCF38], "timeZoneForSecondsFromGMT:", 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_MakeFileTransferAnchor___formatter, "setTimeZone:", v2);

}

@end
