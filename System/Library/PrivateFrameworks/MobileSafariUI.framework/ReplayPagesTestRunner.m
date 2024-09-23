@implementation ReplayPagesTestRunner

- (void)dealloc
{
  FILE *suiteFile;
  objc_super v4;

  suiteFile = self->_suiteFile;
  if (suiteFile)
  {
    fclose(suiteFile);
    self->_suiteFile = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)ReplayPagesTestRunner;
  -[PageLoadTestRunner dealloc](&v4, sel_dealloc);
}

- (BOOL)loadTestSuiteFile:(id)a3
{
  id v4;
  FILE *suiteFile;
  id v6;
  FILE *v7;
  uint64_t v8;
  int *v9;

  v4 = a3;
  suiteFile = self->_suiteFile;
  if (suiteFile)
    fclose(suiteFile);
  v6 = objc_retainAutorelease(v4);
  v7 = fopen((const char *)objc_msgSend(v6, "UTF8String"), "r");
  self->_suiteFile = v7;
  if (!v7)
  {
    v8 = *__error();
    v9 = __error();
    -[PageLoadTestRunner log:](self, "log:", CFSTR("Error %d, could not open %@: %s"), v8, v6, strerror(*v9));
  }

  return v7 != 0;
}

- (void)finishedTestPage:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  ++self->_attemptCount;
  v6 = v4;
  if (objc_msgSend(v4, "status") == 5)
    ++self->_successCount;
  -[PageLoadTestRunner log:](self, "log:", CFSTR("%4lu: %@"), self->_attemptCount, v6);
  if (self->_suiteFile)
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->super.super._pageLoadArray, "objectAtIndexedSubscript:", self->super.super._currentTestIteration);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObject:", v6);

  }
}

- (void)startNextPage
{
  FILE *suiteFile;
  uint64_t v4;
  char *v5;
  char *v6;
  FILE *v7;
  size_t i;
  unsigned int v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t attemptCount;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  PageLoad *v18;
  void *v19;
  PageLoad *v20;
  objc_super v21;
  size_t v22;

  suiteFile = self->_suiteFile;
  if (suiteFile)
  {
    v4 = MEMORY[0x1E0C80978];
    while (1)
    {
      v22 = 0;
      v5 = fgetln(suiteFile, &v22);
      if (!v5)
        break;
      v6 = v5;
      if (-[PageLoadTestRunner skipCount](self, "skipCount"))
      {
        -[PageLoadTestRunner setSkipCount:](self, "setSkipCount:", -[PageLoadTestRunner skipCount](self, "skipCount") - 1);
        goto LABEL_9;
      }
      if (v22)
      {
        for (i = v22 - 1; i != -1; --i)
        {
          v9 = v6[i];
          if ((v9 & 0x80000000) != 0)
          {
            if (!__maskrune(v9, 0x4000uLL))
            {
LABEL_19:
              if (v22 && *v6 != 35)
              {
                v10 = objc_alloc(MEMORY[0x1E0CB3940]);
                v11 = (void *)objc_msgSend(v10, "initWithBytesNoCopy:length:encoding:freeWhenDone:", v6, v22, 4, 0);
                objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v11);
                v12 = (void *)objc_claimAutoreleasedReturnValue();
                -[PageLoadTestRunner addPageURL:withProcessSwap:](self, "addPageURL:withProcessSwap:", v12, 0);

                goto LABEL_28;
              }
              break;
            }
          }
          else if ((*(_DWORD *)(v4 + 4 * v9 + 60) & 0x4000) == 0)
          {
            goto LABEL_19;
          }
          v22 = i;
        }
      }
LABEL_9:
      suiteFile = self->_suiteFile;
      if (!suiteFile)
        goto LABEL_29;
    }
    if (self->_eternal)
    {
      v7 = self->_suiteFile;
      if (!ferror(v7))
      {
        rewind(v7);
        goto LABEL_9;
      }
    }
  }
  else
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->super.super._pageLoadArray, "objectAtIndexedSubscript:", self->super.super._currentTestIteration);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v13;
    if (self->_eternal)
    {
      attemptCount = self->_attemptCount;
      if (attemptCount)
      {
        if (!(attemptCount % objc_msgSend(v13, "count")))
        {
          v15 = objc_msgSend(v11, "count");
          if (v15)
          {
            v16 = v15 - 1;
            do
            {
              objc_msgSend(v11, "objectAtIndex:", v16);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = [PageLoad alloc];
              objc_msgSend(v17, "URL");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = -[PageLoad initWithURL:withProcessSwap:](v18, "initWithURL:withProcessSwap:", v19, 0);

              objc_msgSend(v11, "replaceObjectAtIndex:withObject:", v16, v20);
              --v16;
            }
            while (v16 != -1);
          }
        }
      }
    }
LABEL_28:

  }
LABEL_29:
  v21.receiver = self;
  v21.super_class = (Class)ReplayPagesTestRunner;
  -[PageLoadTestRunner startNextPage](&v21, sel_startNextPage);
}

- (BOOL)eternal
{
  return self->_eternal;
}

- (void)setEternal:(BOOL)a3
{
  self->_eternal = a3;
}

@end
