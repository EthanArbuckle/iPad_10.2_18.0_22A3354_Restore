@implementation MKFileDecoder

- (id)extractFormatOfAsset:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  unint64_t v8;
  void *v9;
  id v10;
  __CFString *v11;
  id v13;
  id v14;

  v3 = a3;
  if (!v3
    || (objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v3), (v4 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v11 = &stru_24E35A3B8;
    goto LABEL_11;
  }
  v5 = (void *)v4;
  v14 = 0;
  objc_msgSend(MEMORY[0x24BDD1578], "fileHandleForReadingFromURL:error:", v4, &v14);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v14;
  if (v7)
    goto LABEL_6;
  v8 = +[MKSignature preferredSignatureLength](MKSignature, "preferredSignatureLength");
  v13 = 0;
  -[NSObject readDataUpToLength:error:](v6, "readDataUpToLength:error:", v8, &v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v13;
  if (v10)
  {
    v7 = v10;

LABEL_6:
    +[MKLog log](MKLog, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[MKFileDecoder extractFormatOfAsset:].cold.1((uint64_t)v3, v7, v6);
    v11 = &stru_24E35A3B8;
    v5 = v7;
    goto LABEL_9;
  }
  if (objc_msgSend(v9, "length") == v8)
  {
    +[MKSignature identifier:length:](MKSignature, "identifier:length:", objc_msgSend(objc_retainAutorelease(v9), "bytes"), v8);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = &stru_24E35A3B8;
  }

LABEL_9:
LABEL_11:

  return v11;
}

- (void)extractFormatOfAsset:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = a1;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_21EC08000, a3, OS_LOG_TYPE_ERROR, "could not extract a format of asset. path=%@, error=%@", (uint8_t *)&v6, 0x16u);

}

@end
