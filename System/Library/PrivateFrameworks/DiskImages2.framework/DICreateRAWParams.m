@implementation DICreateRAWParams

- (DICreateRAWParams)initWithURL:(id)a3 numBlocks:(unint64_t)a4 error:(id *)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DICreateRAWParams;
  return -[DICreateParams initWithURL:numBlocks:error:](&v6, sel_initWithURL_numBlocks_error_, a3, a4, a5);
}

- (void)createDiskImageParamsXPC
{
  FileLocalXPC *v3;
  void *v4;
  DiskImageParamsRaw_XPC *v5;
  FileLocalXPC *v6;

  v3 = [FileLocalXPC alloc];
  -[DIBaseParams inputURL](self, "inputURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[FileLocalXPC initWithURL:fileOpenFlags:](v3, "initWithURL:fileOpenFlags:", v4, 514);

  v5 = -[DiskImageParamsXPC initWithBackendXPC:]([DiskImageParamsRaw_XPC alloc], "initWithBackendXPC:", v6);
  -[DIBaseParams setDiskImageParamsXPC:](self, "setDiskImageParamsXPC:", v5);

}

@end
