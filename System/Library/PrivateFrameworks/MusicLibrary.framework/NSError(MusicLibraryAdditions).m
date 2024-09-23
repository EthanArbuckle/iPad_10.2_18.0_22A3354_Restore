@implementation NSError(MusicLibraryAdditions)

+ (uint64_t)ml_errorWithCode:()MusicLibraryAdditions
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "ml_errorWithCode:description:", a3, 0);
}

+ (id)ml_errorWithCode:()MusicLibraryAdditions description:
{
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t *v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  if (!v10)
  {
    v12 = 0;
    goto LABEL_5;
  }
  v16 = &a9;
  v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", v10, &a9);
  v12 = (void *)v11;
  if (!v11)
  {
LABEL_5:
    v13 = 0;
    goto LABEL_6;
  }
  v17 = *MEMORY[0x1E0CB2D50];
  v18[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MLMusicLibraryErrorDomain"), a3, v13, v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

@end
