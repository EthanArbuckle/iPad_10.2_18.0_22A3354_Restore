@implementation UploadRecord

- (NSMutableArray)fileURLs
{
  return self->fileURLs;
}

- (void)setFileURLs:(id)a3
{
  objc_storeStrong((id *)&self->fileURLs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->fileURLs, 0);
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("UploadRecord"));
}

@end
