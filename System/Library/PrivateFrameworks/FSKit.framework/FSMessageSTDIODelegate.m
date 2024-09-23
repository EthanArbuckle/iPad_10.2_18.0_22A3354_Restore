@implementation FSMessageSTDIODelegate

+ (id)delegateWithCompletionHandler:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  if (v5)
  {
    v6 = _Block_copy(v4);
    v7 = (void *)v5[1];
    v5[1] = v6;

  }
  return v5;
}

- (void)completed:(id)a3 replyHandler:(id)a4
{
  void (**delegate)(id, id);
  id v7;

  v7 = a4;
  delegate = (void (**)(id, id))self->_delegate;
  if (delegate)
    delegate[2](delegate, a3);
  (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);

}

- (void)logMessage:(id)a3
{
  puts((const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String"));
}

- (void)prompt:(id)a3 replyHandler:(id)a4
{
  void (**v5)(id, const __CFString *, _QWORD);
  void *v6;
  void *v7;
  FILE **v8;
  __CFString *v9;
  int v10;
  int v11;
  int v12;
  void *v13;
  id v14;

  v14 = a3;
  v5 = (void (**)(id, const __CFString *, _QWORD))a4;
  v6 = malloc_type_malloc(0x400uLL, 0x27FF5AE1uLL);
  if (!v6)
  {
    v10 = *__error();
    goto LABEL_8;
  }
  v7 = v6;
  fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", (const char *)objc_msgSend(objc_retainAutorelease(v14), "UTF8String"));
  v8 = (FILE **)MEMORY[0x24BDAC8E0];
  if (!fgets((char *)v7, 1024, (FILE *)*MEMORY[0x24BDAC8E0]))
  {
    v11 = *__error();
    free(v7);
    v12 = feof(*v8);
    clearerr(*v8);
    if (v12)
    {
      v5[2](v5, &stru_250C33628, 0);
      goto LABEL_9;
    }
    v10 = v11;
LABEL_8:
    fs_errorForPOSIXError(v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, const __CFString *, void *))v5)[2](v5, 0, v13);

    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v7);
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  free(v7);
  v5[2](v5, v9, 0);

LABEL_9:
}

- (void)promptTrueFalse:(id)a3 replyHandler:(id)a4
{
  void (**v5)(id, _QWORD, void *);
  char *v6;
  char *v7;
  FILE **v8;
  FILE **v9;
  char *v10;
  int v11;
  int v13;
  int v14;
  int v15;
  _BOOL8 v16;
  void *v17;
  id v18;

  v18 = a3;
  v5 = (void (**)(id, _QWORD, void *))a4;
  v6 = (char *)malloc_type_malloc(0x400uLL, 0xE11253E5uLL);
  if (!v6)
  {
    v15 = *__error();
LABEL_13:
    fs_errorForPOSIXError(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, 0, v17);

    goto LABEL_14;
  }
  v7 = v6;
  v8 = (FILE **)MEMORY[0x24BDAC8D8];
  fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\nY/N\n", (const char *)objc_msgSend(objc_retainAutorelease(v18), "UTF8String"));
  v9 = (FILE **)MEMORY[0x24BDAC8E0];
  v10 = fgets(v7, 1024, (FILE *)*MEMORY[0x24BDAC8E0]);
  if (!v10)
  {
LABEL_9:
    v13 = *__error();
    free(v7);
    v14 = feof(*v9);
    clearerr(*v9);
    if (v14)
      v15 = 96;
    else
      v15 = v13;
    goto LABEL_13;
  }
  while (1)
  {
    v11 = *v10;
    if ((v11 - 78) <= 0x2B && ((1 << (v11 - 78)) & 0x80100000801) != 0)
      break;
    fwrite("Y/N\n", 4uLL, 1uLL, *v8);
    v10 = fgets(v7, 1024, *v9);
    if (!v10)
      goto LABEL_9;
  }
  v16 = (v11 & 0xFFFFFFDF) == 89;
  free(v7);
  v5[2](v5, v16, 0);
LABEL_14:

}

- (id)delegate
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_delegate, 0);
}

@end
