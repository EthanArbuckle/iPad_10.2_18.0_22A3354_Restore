@implementation SYDocumentAttributes(EDSynapseAttributes)

- (uint64_t)initWithEDAttributes:()EDSynapseAttributes file:
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc(MEMORY[0x1E0DB0720]);
  objc_msgSend(v6, "senderAddressComment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "senderAddress");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "initWithName:handle:", v9, v10);

  objc_msgSend(v6, "messagePersistentID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "receivedDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(a1, "initWithSourceBundleIdentifier:indexKey:originalFileURL:receivedDate:sender:", CFSTR("com.apple.mobilemail"), v12, v7, v13, v11);

  return v14;
}

@end
