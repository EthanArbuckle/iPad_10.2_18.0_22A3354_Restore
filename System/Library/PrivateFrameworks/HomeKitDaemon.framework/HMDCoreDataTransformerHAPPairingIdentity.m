@implementation HMDCoreDataTransformerHAPPairingIdentity

+ (id)OPACKFromValue:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "publicKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "length") && objc_msgSend(v8, "length"))
  {
    v13[0] = CFSTR("i");
    v13[1] = CFSTR("d");
    v14[0] = v6;
    v14[1] = v8;
    v13[2] = CFSTR("p");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v5, "permissions"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[2] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
    a4 = (id *)objc_claimAutoreleasedReturnValue();

  }
  else if (a4)
  {
    v10 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid pairing identity: %@"), v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hmfErrorWithCode:reason:", 3, v11);
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
  __CFString *v9;
  void *v10;
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

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
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hmf_dataForKey:", CFSTR("d"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hmf_numberForKey:", CFSTR("p"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9 || (objc_msgSend(v10, "length") ? (v12 = v11 == 0) : (v12 = 1), v12))
    {
      if (!a4)
      {
        v15 = 0;
        goto LABEL_20;
      }
      v13 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to create HAPPairingIdentity from dictionary: %@"), v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "hmfErrorWithCode:reason:", 15, v14);
      v15 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!-[__CFString length](v9, "length"))
      {

        v9 = CFSTR("884A90AC-D3C1-4DB2-8C1C-33D10348F452");
      }
      v17 = objc_alloc(MEMORY[0x24BE1BBB0]);
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F230]), "initWithPairingKeyData:", v10);
      v15 = (void *)objc_msgSend(v17, "initWithIdentifier:publicKey:privateKey:permissions:", v9, v14, 0, objc_msgSend(v11, "unsignedIntegerValue"));
    }

LABEL_20:
    goto LABEL_21;
  }
  if (!a4)
  {
    v15 = 0;
    goto LABEL_22;
  }
  v16 = (void *)MEMORY[0x24BDD1540];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Expected NSDictionary value to create HAPPairingIdentity: %@"), v5);
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "hmfErrorWithCode:reason:", 3, v9);
  v15 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_21:

LABEL_22:
  return v15;
}

+ (Class)valueClass
{
  return (Class)objc_opt_class();
}

@end
