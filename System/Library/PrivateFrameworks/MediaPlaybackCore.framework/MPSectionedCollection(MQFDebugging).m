@implementation MPSectionedCollection(MQFDebugging)

- (id)mpc_identifiersAsJsonValue
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  _QWORD v7[5];
  id v8;

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(a1, "numberOfSections"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __65__MPSectionedCollection_MQFDebugging__mpc_identifiersAsJsonValue__block_invoke;
  v7[3] = &unk_24CAB50A0;
  v7[4] = a1;
  v3 = v2;
  v8 = v3;
  objc_msgSend(a1, "enumerateSectionIdentifiersUsingBlock:", v7);
  v4 = v8;
  v5 = v3;

  return v5;
}

@end
