@implementation HDAttachmentEncryptedReader

- (id)initAdoptingArchive:(id)a3
{
  id v5;
  HDAttachmentEncryptedReader *v6;
  HDAttachmentEncryptedReader *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDAttachmentEncryptedReader;
  v6 = -[HDAttachmentEncryptedReader init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_archive, a3);

  return v7;
}

- (id)readDataUpToLength:(unint64_t)a3 offset:(unint64_t)a4 error:(id *)a5
{
  HDEncryptedArchive *archive;
  void *v6;

  archive = self->_archive;
  if (archive)
  {
    -[HDEncryptedArchive readDataOfLength:offset:error:](archive, "readDataOfLength:offset:error:", a3, a4, a5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a5, 126, CFSTR("Encrypted archive has already been closed."));
    v6 = 0;
  }
  return v6;
}

- (void)close
{
  HDEncryptedArchive *archive;
  HDEncryptedArchive *v4;

  archive = self->_archive;
  if (archive)
  {
    -[HDEncryptedArchive close](archive, "close");
    v4 = self->_archive;
    self->_archive = 0;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_archive, 0);
}

@end
