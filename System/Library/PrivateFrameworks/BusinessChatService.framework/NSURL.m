@implementation NSURL

+ (id)bcs_templatedImageURLWithString:(_QWORD *)a3 imageSpecifier:
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  _QWORD v19[4];
  _QWORD v20[5];

  v20[4] = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  objc_opt_self();
  if (v4)
  {
    v19[0] = CFSTR("{w}");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu"), *a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v5;
    v19[1] = CFSTR("{h}");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu"), a3[1]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = v6;
    v19[2] = CFSTR("{f}");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a3[3]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v20[2] = v7;
    v19[3] = CFSTR("{c}");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a3[2]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v20[3] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__5;
    v17 = __Block_byref_object_dispose__5;
    v18 = (id)objc_msgSend(v4, "copy");
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __77__NSURL_BusinessChatService__bcs_templatedImageURLWithString_imageSpecifier___block_invoke;
    v12[3] = &unk_24C39D520;
    v12[4] = &v13;
    objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v12);
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v14[5]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _Block_object_dispose(&v13, 8);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void __77__NSURL_BusinessChatService__bcs_templatedImageURLWithString_imageSpecifier___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "stringByReplacingOccurrencesOfString:withString:", a2, a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (id)URLByDeletingFragment
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;

  v1 = a1;
  if (a1)
  {
    objc_msgSend(a1, "absoluteString");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "rangeOfString:options:", CFSTR("#"), 4);
    if (v3 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v1 = v1;
    }
    else
    {
      objc_msgSend(v2, "substringToIndex:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v4);
      v1 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  return v1;
}

@end
