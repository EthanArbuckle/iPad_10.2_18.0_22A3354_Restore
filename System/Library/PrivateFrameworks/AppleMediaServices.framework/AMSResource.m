@implementation AMSResource

+ (id)loadHARFileWithName:(id)a3 bundle:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a4, "pathForResource:ofType:", a3, CFSTR("har"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v5, 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v7 = 0;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)loadHARFileWithName:(id)a3 bundle:(id)a4 inDirectory:(id)a5
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(a4, "pathForResource:ofType:inDirectory:", a3, CFSTR("har"), a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v6, 0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v8 = 0;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)loadPropertyListWithName:(id)a3 bundle:(id)a4 error:(id *)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;

  objc_msgSend(a4, "pathForResource:ofType:", a3, CFSTR("plist"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v6, 0, a5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v7, 0, 0, a5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
      {
        v10 = v8;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v11 = v10;

          v12 = v11;
        }
        else
        {

          if (a5)
          {
            AMSError(2, CFSTR("Invalid Property List"), CFSTR("Expected the property list to be a dictionary"), 0);
            v12 = 0;
            *a5 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v12 = 0;
          }
        }

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }

  }
  else if (a5)
  {
    AMSError(7, CFSTR("File not found"), CFSTR("Could not find the file."), 0);
    v12 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

@end
