@implementation HMDCoreDataTransformerHMFPairingIdentity

+ (id)OPACKFromValue:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "publicKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "length") && objc_msgSend(v8, "length"))
  {
    v12[0] = CFSTR("i");
    v12[1] = CFSTR("d");
    v13[0] = v6;
    v13[1] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
    a4 = (id *)objc_claimAutoreleasedReturnValue();
  }
  else if (a4)
  {
    v9 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid pairing identity: %@"), v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "hmfErrorWithCode:reason:", 3, v10);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0;
  }

  return a4;
}

+ (id)valueFromOPACK:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "hmf_stringForKey:", CFSTR("i"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hmf_dataForKey:", CFSTR("d"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "length") && objc_msgSend(v10, "length"))
    {
      v11 = objc_alloc(MEMORY[0x24BE3F228]);
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F230]), "initWithPairingKeyData:", v10);
      v13 = (void *)objc_msgSend(v11, "initWithIdentifier:publicKey:privateKey:", v9, v12, 0);
    }
    else
    {
      if (!a4)
      {
        v13 = 0;
        goto LABEL_15;
      }
      v15 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to create HMFPairingIdentity from dictionary: %@"), v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "hmfErrorWithCode:reason:", 15, v12);
      v13 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

LABEL_15:
    goto LABEL_16;
  }
  if (a4)
  {
    v14 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Expected NSDictionary value to create HMFPairingIdentity: %@"), v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "hmfErrorWithCode:reason:", 3, v9);
    v13 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_16:

    goto LABEL_17;
  }
  v13 = 0;
LABEL_17:

  return v13;
}

+ (Class)valueClass
{
  return (Class)objc_opt_class();
}

@end
