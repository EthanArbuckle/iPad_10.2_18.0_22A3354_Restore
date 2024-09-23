@implementation NSData(DMCProfilesUI)

- (id)DMCProfileHexString
{
  void *v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", 2 * objc_msgSend(a1, "length"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __44__NSData_DMCProfilesUI__DMCProfileHexString__block_invoke;
  v6[3] = &unk_24D52EFB0;
  v7 = v2;
  v3 = v2;
  objc_msgSend(a1, "enumerateByteRangesUsingBlock:", v6);
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

@end
