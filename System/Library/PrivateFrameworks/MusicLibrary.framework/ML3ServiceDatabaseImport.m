@implementation ML3ServiceDatabaseImport

- (ML3ServiceDatabaseImport)initWithDatabaseImport:(id)a3 library:(id)a4 writer:(id)a5 client:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  ML3ServiceDatabaseImport *v15;
  void *v17;
  void *v18;
  void *v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (v12)
  {
    if (v13)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ML3ServiceDatabaseImport.m"), 21, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("writer"));

    if (v14)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ML3ServiceDatabaseImport.m"), 20, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("library"));

  if (!v13)
    goto LABEL_8;
LABEL_3:
  if (v14)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ML3ServiceDatabaseImport.m"), 22, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("client"));

LABEL_4:
  v15 = (ML3ServiceDatabaseImport *)objc_msgSend(v11, "_copyWithZone:usingConcreteClass:", 0, objc_opt_class());

  if (v15)
  {
    objc_storeStrong((id *)&v15->_library, a4);
    objc_storeStrong((id *)&v15->_writer, a5);
    objc_storeStrong((id *)&v15->_client, a6);
  }

  return v15;
}

- (ML3MusicLibrary)library
{
  return self->_library;
}

- (ML3MediaLibraryWriter)writer
{
  return self->_writer;
}

- (ML3Client)client
{
  return self->_client;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_writer, 0);
  objc_storeStrong((id *)&self->_library, 0);
}

@end
