@implementation OZRXp7MLSzffIeLD

- (void)MypqGKKWznx4xnYa:(id)a3 ygOPXTiKN0J02x0j:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  uint64_t v26;
  _QWORD v27[3];

  v27[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (v5)
  {
    +[Lt10zus2DOk3OfFf sharedInstance](Lt10zus2DOk3OfFf, "sharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "HkbEJeZjAQnItubK");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "TbX4HHO0pTPaerrJ");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "BGiN5h2SLMRO6B9R");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "rU1LRx5aI44CETG8");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "yNHDWo3TCV");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "zeXRCfLmM5cdkEtz");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v5, "S08uY31jbmOEDLrH");
    objc_msgSend(v5, "hostChallenge");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "challengeResponse");
    v23 = v6;
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "seid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __54__OZRXp7MLSzffIeLD_MypqGKKWznx4xnYa_ygOPXTiKN0J02x0j___block_invoke;
    v24[3] = &unk_24C31EB58;
    v25 = v23;
    objc_msgSend(v19, "Z8aAH7stm0EYhyxg:xz5EHXEN4FjlhJbi:uhVTXyAfCFn7u0Ue:EQUjQp7JcQbqcPcD:A5wDLa5TFdFZlz3A:TJKMyOe6zn5PdGIr:eCqgGM0WcnHOslnr:eCszfxdv3kUXvhgV:uWp4aZpP2vLhc04Q:QZYtNpvp0hKd248p:oCwPYmtRv8s31KUH:completion:", v20, v7, v8, v22, v21, v9, 0, v10, v11, v12, v13, v24);

    v6 = v23;
    v14 = v19;

  }
  else
  {
    v15 = (void *)MEMORY[0x24BDD1540];
    v26 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("empty request"), &stru_24C31F770, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v17;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("com.apple.asd.ca"), -27100, v18);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, _QWORD, _QWORD, uint64_t, void *))v6 + 2))(v6, 0, 0, 0xFFFFFFFFLL, v14);
  }

}

void __54__OZRXp7MLSzffIeLD_MypqGKKWznx4xnYa_ygOPXTiKN0J02x0j___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  id v9;
  id v10;
  void *v11;
  id v12;
  int v13;
  int v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  int v21;
  int v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;

  v9 = a2;
  v10 = a3;
  v11 = v10;
  if (v10 && v9 && !a6)
  {
    v28 = 0;
    v29 = 0;
    v12 = objc_retainAutorelease(v10);
    bcgsyabc74vz12(objc_msgSend(v12, "bytes"), objc_msgSend(v12, "length"), (uint64_t)&v29);
    if (v13)
    {
      v14 = v13;
      free(v29);
      v15 = *(_QWORD *)(a1 + 32);
      v16 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", kCoreASErrorDomainCADecrypt);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, v14, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, _QWORD, uint64_t, void *))(v15 + 16))(v15, 0, 0, 0xFFFFFFFFLL, v18);
    }
    else
    {
      v19 = objc_alloc(MEMORY[0x24BDBCE50]);
      v17 = (void *)objc_msgSend(v19, "initWithBytes:length:", v29, objc_msgSend(v12, "length"));
      free(v29);
      v20 = objc_retainAutorelease(v9);
      bcgsyabc74vz12(objc_msgSend(v20, "bytes"), objc_msgSend(v20, "length"), (uint64_t)&v28);
      if (!v21)
      {
        v26 = objc_alloc(MEMORY[0x24BDBCE50]);
        v27 = (void *)objc_msgSend(v26, "initWithBytes:length:", v28, objc_msgSend(v20, "length"));
        free(v28);
        (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

        goto LABEL_10;
      }
      v22 = v21;
      free(v28);
      v23 = *(_QWORD *)(a1 + 32);
      v24 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", kCoreASErrorDomainCADecrypt);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "errorWithDomain:code:userInfo:", v18, v22, 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, _QWORD, uint64_t, void *))(v23 + 16))(v23, 0, 0, 0xFFFFFFFFLL, v25);

    }
LABEL_10:

    goto LABEL_11;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
LABEL_11:

}

- (void)t5yVezCKaX2Zrwrw:(id)a3 uXxcS3vcKdsH38zZ:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  v6 = a3;
  +[Lt10zus2DOk3OfFf sharedInstance](Lt10zus2DOk3OfFf, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __54__OZRXp7MLSzffIeLD_t5yVezCKaX2Zrwrw_uXxcS3vcKdsH38zZ___block_invoke;
  v9[3] = &unk_24C31EB80;
  v10 = v5;
  v8 = v5;
  objc_msgSend(v7, "ZfE6lVphNUVrZcKx:completion:", v6, v9);

}

uint64_t __54__OZRXp7MLSzffIeLD_t5yVezCKaX2Zrwrw_uXxcS3vcKdsH38zZ___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)MypqGKKWznx4xnYa:(id)a3 l8OCYbP9LFIvnTwG:(unint64_t)a4 ygOPXTiKN0J02x0j:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  uint64_t v28;
  _QWORD v29[3];

  v29[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a5;
  if (v7)
  {
    +[Lt10zus2DOk3OfFf sharedInstance](Lt10zus2DOk3OfFf, "sharedInstance");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "HkbEJeZjAQnItubK");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "TbX4HHO0pTPaerrJ");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "BGiN5h2SLMRO6B9R");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "rU1LRx5aI44CETG8");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "yNHDWo3TCV");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "zeXRCfLmM5cdkEtz");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v7, "S08uY31jbmOEDLrH");
    objc_msgSend(v7, "hostChallenge");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "challengeResponse");
    v25 = v8;
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "seid");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __71__OZRXp7MLSzffIeLD_MypqGKKWznx4xnYa_l8OCYbP9LFIvnTwG_ygOPXTiKN0J02x0j___block_invoke;
    v26[3] = &unk_24C31EB58;
    v27 = v25;
    objc_msgSend(v21, "Z8aAH7stm0EYhyxg:xz5EHXEN4FjlhJbi:uhVTXyAfCFn7u0Ue:EQUjQp7JcQbqcPcD:A5wDLa5TFdFZlz3A:TJKMyOe6zn5PdGIr:eCqgGM0WcnHOslnr:eCszfxdv3kUXvhgV:uWp4aZpP2vLhc04Q:QZYtNpvp0hKd248p:oCwPYmtRv8s31KUH:completion:", v9, v10, v24, v23, v22, v11, a4, v12, v13, v14, v15, v26);

    v8 = v25;
    v16 = v21;

  }
  else
  {
    v17 = (void *)MEMORY[0x24BDD1540];
    v28 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("empty request"), &stru_24C31F770, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v19;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("com.apple.asd.ca"), -27100, v20);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, _QWORD, _QWORD, _QWORD, uint64_t, void *))v8 + 2))(v8, 0, 0, 0, 0xFFFFFFFFLL, v16);
  }

}

void __71__OZRXp7MLSzffIeLD_MypqGKKWznx4xnYa_l8OCYbP9LFIvnTwG_ygOPXTiKN0J02x0j___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  id v9;
  id v10;
  void *v11;
  id v12;
  int v13;
  int v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  int v21;
  int v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;

  v9 = a2;
  v10 = a3;
  v11 = v10;
  if (!a6)
  {
    v28 = 0;
    v29 = 0;
    v12 = objc_retainAutorelease(v10);
    bcgsyabc74vz12(objc_msgSend(v12, "bytes"), objc_msgSend(v12, "length"), (uint64_t)&v29);
    if (v13)
    {
      v14 = v13;
      free(v29);
      v15 = *(_QWORD *)(a1 + 32);
      v16 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", kCoreASErrorDomainCADecrypt);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, v14, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, uint64_t, void *))(v15 + 16))(v15, 0, 0, 0, 0xFFFFFFFFLL, v18);
    }
    else
    {
      v19 = objc_alloc(MEMORY[0x24BDBCE50]);
      v17 = (void *)objc_msgSend(v19, "initWithBytes:length:", v29, objc_msgSend(v12, "length"));
      free(v29);
      v20 = objc_retainAutorelease(v9);
      bcgsyabc74vz12(objc_msgSend(v20, "bytes"), objc_msgSend(v20, "length"), (uint64_t)&v28);
      if (!v21)
      {
        v26 = objc_alloc(MEMORY[0x24BDBCE50]);
        v27 = (void *)objc_msgSend(v26, "initWithBytes:length:", v28, objc_msgSend(v20, "length"));
        free(v28);
        (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

        goto LABEL_8;
      }
      v22 = v21;
      free(v28);
      v23 = *(_QWORD *)(a1 + 32);
      v24 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", kCoreASErrorDomainCADecrypt);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "errorWithDomain:code:userInfo:", v18, v22, 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, uint64_t, void *))(v23 + 16))(v23, 0, 0, 0, 0xFFFFFFFFLL, v25);

    }
LABEL_8:

    goto LABEL_9;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
LABEL_9:

}

- (void)vffg4lwI2HftPvpO:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  +[Lt10zus2DOk3OfFf sharedInstance](Lt10zus2DOk3OfFf, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __37__OZRXp7MLSzffIeLD_vffg4lwI2HftPvpO___block_invoke;
  v6[3] = &unk_24C31EBA8;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "vffg4lwI2HftPvpO:", v6);

}

uint64_t __37__OZRXp7MLSzffIeLD_vffg4lwI2HftPvpO___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
