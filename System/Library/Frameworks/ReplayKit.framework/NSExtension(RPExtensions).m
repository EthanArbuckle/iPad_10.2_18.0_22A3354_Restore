@implementation NSExtension(RPExtensions)

+ (void)extensionsWithMatchingPointName:()RPExtensions baseIdentifier:activationRule:unwantedActivationRule:completion:
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x24BDAC8D0];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  v15 = (void *)MEMORY[0x24BDBCEB8];
  v16 = a3;
  objc_msgSend(v15, "array");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = *MEMORY[0x24BDD0C48];
  v33[0] = v16;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "mutableCopy");

  v20 = (void *)MEMORY[0x24BDD1550];
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __125__NSExtension_RPExtensions__extensionsWithMatchingPointName_baseIdentifier_activationRule_unwantedActivationRule_completion___block_invoke;
  v26[3] = &unk_24D15DCC0;
  v27 = v11;
  v28 = v12;
  v29 = v13;
  v30 = v17;
  v31 = v14;
  v21 = v14;
  v22 = v17;
  v23 = v13;
  v24 = v12;
  v25 = v11;
  objc_msgSend(v20, "extensionsWithMatchingAttributes:completion:", v19, v26);

}

+ (uint64_t)extensionsWithMatchingPointName:()RPExtensions baseIdentifier:completion:
{
  return objc_msgSend(MEMORY[0x24BDD1550], "extensionsWithMatchingPointName:baseIdentifier:activationRule:unwantedActivationRule:completion:", a3, a4, 0, 0, a5);
}

+ (uint64_t)extensionsWithMatchingPointName:()RPExtensions baseIdentifier:unwantedActivationRule:completion:
{
  return objc_msgSend(MEMORY[0x24BDD1550], "extensionsWithMatchingPointName:baseIdentifier:activationRule:unwantedActivationRule:completion:", a3, a4, 0, a5, a6);
}

+ (uint64_t)extensionsWithMatchingPointName:()RPExtensions activationRule:completion:
{
  return objc_msgSend(MEMORY[0x24BDD1550], "extensionsWithMatchingPointName:baseIdentifier:activationRule:unwantedActivationRule:completion:", a3, 0, a4, 0, a5);
}

+ (uint64_t)extensionsWithMatchingPointName:()RPExtensions unwantedActivationRule:completion:
{
  return objc_msgSend(MEMORY[0x24BDD1550], "extensionsWithMatchingPointName:baseIdentifier:activationRule:unwantedActivationRule:completion:", a3, 0, 0, a4, a5);
}

+ (uint64_t)extensionsWithMatchingPointName:()RPExtensions completion:
{
  return objc_msgSend(MEMORY[0x24BDD1550], "extensionsWithMatchingPointName:baseIdentifier:activationRule:unwantedActivationRule:completion:", a3, 0, 0, 0, a4);
}

- (uint64_t)processMode
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "infoDictionary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("NSExtension"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("RPBroadcastProcessMode"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("RPBroadcastProcessModeSampleBuffer"));
  return v4;
}

@end
