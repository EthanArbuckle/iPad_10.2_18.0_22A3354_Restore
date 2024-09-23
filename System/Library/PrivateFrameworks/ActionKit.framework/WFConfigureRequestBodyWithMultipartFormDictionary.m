@implementation WFConfigureRequestBodyWithMultipartFormDictionary

void __WFConfigureRequestBodyWithMultipartFormDictionary_block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;

  v6 = a2;
  v7 = a4;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __WFConfigureRequestBodyWithMultipartFormDictionary_block_invoke_2;
    v9[3] = &unk_24F8BA0C0;
    v10 = *(id *)(a1 + 40);
    v11 = v6;
    v12 = v7;
    objc_msgSend(v8, "getFileRepresentation:forType:", v9, 0);

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(*(id *)(a1 + 40), "addPartWithName:string:", v6, v8);
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

void __WFConfigureRequestBodyWithMultipartFormDictionary_block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = *(void **)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v10 = a3;
  v6 = objc_msgSend(v5, "length");
  v7 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(*(id *)(a1 + 40), "boundary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("multipart/form-data; boundary=%@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  WFConfigureRequestBody(v4, (uint64_t)v5, v6, v9, 1);

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __WFConfigureRequestBodyWithMultipartFormDictionary_block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  if (a2)
  {
    v5 = (void *)a1[4];
    v6 = a1[5];
    v7 = a2;
    objc_msgSend(v7, "filename");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "inputStream");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "fileSize");

    objc_msgSend(v5, "addPartWithName:filename:stream:streamLength:", v6, v8, v9, v10);
  }
  (*(void (**)(void))(a1[6] + 16))();

}

@end
