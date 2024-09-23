@implementation NPKTestAddPaymentPassRequest

void __NPKTestAddPaymentPassRequest_block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;

  v6 = a2;
  if (a4)
  {
    objc_msgSend(a4, "localizedDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Error: %@"), v7);

  }
  else
  {
    v27 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v6, 4, &v27);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v27;
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v6, 4);
    NSLog(CFSTR("Kista response: %@"), v10);

    if (v9)
    {
      objc_msgSend(v9, "localizedDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("Error in Kista response dict: %@"), v11);

      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v6, 4);
      NSLog(CFSTR("Kista response:: %@"), v12);

      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      NSLog(CFSTR("Called completion with nil"));
    }
    else
    {
      v13 = objc_alloc_init(MEMORY[0x24BE6E9A0]);
      NSLog(CFSTR("responseDict: %@"), v8);
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("encryptedData"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("encryptedData: %@"), v14);

      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("activationData"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("activationData: %@"), v15);

      v16 = objc_alloc(MEMORY[0x24BDBCE50]);
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("encryptedData"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v16, "initWithBase64EncodedString:options:", v17, 0);
      objc_msgSend(v13, "setEncryptedPassData:", v18);

      v19 = objc_alloc(MEMORY[0x24BDBCE50]);
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("activationData"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)objc_msgSend(v19, "initWithBase64EncodedString:options:", v20, 1);
      objc_msgSend(v13, "setActivationData:", v21);

      objc_msgSend(*(id *)(a1 + 32), "cardEncryptionScheme");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v18) = objc_msgSend(v22, "isEqualToString:", *MEMORY[0x24BE6F318]);

      v23 = objc_alloc(MEMORY[0x24BDBCE50]);
      if ((_DWORD)v18)
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ephemeralKey"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (void *)objc_msgSend(v23, "initWithBase64EncodedString:options:", v24, 0);
        objc_msgSend(v13, "setEphemeralPublicKey:", v25);
      }
      else
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("wrappedKey"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (void *)objc_msgSend(v23, "initWithBase64EncodedString:options:", v24, 0);
        objc_msgSend(v13, "setWrappedKey:", v25);
      }

      v26 = *(_QWORD *)(a1 + 40);
      if (v26)
        (*(void (**)(uint64_t, id))(v26 + 16))(v26, v13);

    }
  }

}

@end
