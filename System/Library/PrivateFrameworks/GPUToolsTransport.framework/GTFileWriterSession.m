@implementation GTFileWriterSession

+ (id)sessionWithFileEntries:(id)a3 relativeToURL:(id)a4 options:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v9, "compressionAlgorithm");
  objc_msgSend((id)objc_opt_class(), "sessionWithFileEntries:relativeToURL:options:error:", v11, v10, v9, a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end
