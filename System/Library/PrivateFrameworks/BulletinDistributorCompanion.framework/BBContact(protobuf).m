@implementation BBContact(protobuf)

+ (id)contactFromProtobuf:()protobuf
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  uint64_t v15;
  void *v16;

  v16 = (void *)MEMORY[0x24BE0FE40];
  v3 = a3;
  objc_msgSend(v3, "handle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "handleType");
  objc_msgSend(v3, "serviceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v3, "displayNameSuggested");
  objc_msgSend(v3, "customIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cnContactIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cnContactFullname");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v3, "cnContactIdentifierSuggested");

  LOBYTE(v15) = v12;
  objc_msgSend(v16, "contactWithHandle:handleType:serviceName:displayName:displayNameSuggested:customIdentifier:cnContactIdentifier:cnContactFullname:cnContactIdentifierSuggested:", v4, v5, v6, v7, v8, v9, v10, v11, v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)blt_protobuf
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = (void *)objc_opt_new();
  objc_msgSend(a1, "handle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHandle:", v3);

  objc_msgSend(v2, "setHandleType:", objc_msgSend(a1, "handleType"));
  objc_msgSend(a1, "serviceName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setServiceName:", v4);

  objc_msgSend(a1, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDisplayName:", v5);

  objc_msgSend(a1, "cnContactIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCnContactIdentifier:", v6);

  objc_msgSend(a1, "cnContactFullname");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCnContactFullname:", v7);

  objc_msgSend(v2, "setCnContactIdentifierSuggested:", objc_msgSend(a1, "isCNContactIdentifierSuggested"));
  objc_msgSend(v2, "setDisplayNameSuggested:", objc_msgSend(a1, "isDisplayNameSuggested"));
  objc_msgSend(a1, "customIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCustomIdentifier:", v8);

  return v2;
}

@end
