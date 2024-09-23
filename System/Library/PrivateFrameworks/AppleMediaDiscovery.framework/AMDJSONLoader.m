@implementation AMDJSONLoader

- (AMDJSONLoader)initWithPath:(id)a3
{
  id v3;
  char v5;
  id v6;
  objc_super v7;
  id location[2];
  id v9;
  AMDJSONLoader *v10;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v9;
  v9 = 0;
  v7.receiver = v3;
  v7.super_class = (Class)AMDJSONLoader;
  v9 = -[AMDJSONLoader init](&v7, sel_init);
  objc_storeStrong(&v9, v9);
  v6 = (id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = 0;
  if ((objc_msgSend(v6, "fileExistsAtPath:isDirectory:", location[0], &v5) & 1) != 0 && (v5 & 1) == 0)
  {
    objc_msgSend(v9, "setPath:", location[0]);
    v10 = (AMDJSONLoader *)v9;
  }
  else
  {
    v10 = 0;
  }
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v9, 0);
  return v10;
}

- (id)loadDataFromFileForClass:(Class)a3
{
  id obj;
  id v5;
  id v6;
  id v7;
  id *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id *location;
  id v14;
  NSString *v15;
  id v16;
  id v17;
  int v18;
  id v19;
  id v20;
  id v21[3];
  AMDJSONLoader *v22;
  id v23;

  v22 = self;
  v21[2] = (id)a2;
  v21[1] = a3;
  location = v21;
  v21[0] = 0;
  v12 = (id)MEMORY[0x1E0C99D50];
  v15 = -[AMDJSONLoader path](self, "path");
  v19 = v21[0];
  v14 = (id)objc_msgSend(v12, "dataWithContentsOfFile:options:error:");
  objc_storeStrong(v21, v19);
  v20 = v14;

  if (v21[0])
  {
    v11 = -[AMDJSONLoader path](v22, "path");
    v10 = (id)objc_msgSend(v21[0], "localizedDescription");
    NSLog(CFSTR("Error reading file '%@': %@"), v11, v10);

    v23 = 0;
    v18 = 1;
  }
  else
  {
    v8 = v21;
    v16 = 0;
    v9 = (id)objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v20, 0, &v16);
    objc_storeStrong(v21, v16);
    v17 = v9;
    if (v21[0])
    {
      v7 = -[AMDJSONLoader path](v22, "path");
      v6 = (id)objc_msgSend(v21[0], "localizedDescription");
      NSLog(CFSTR("Error parsing data from file '%@': %@"), v7, v6);

      v23 = 0;
      v18 = 1;
    }
    else if (v17 && (objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = v17;
      v18 = 1;
    }
    else
    {
      v5 = -[AMDJSONLoader path](v22, "path");
      NSLog(CFSTR("Data from file '%@' is nil or incorrect"), v5);

      v23 = 0;
      v18 = 1;
    }
    objc_storeStrong(&v17, 0);
  }
  obj = 0;
  objc_storeStrong(&v20, 0);
  objc_storeStrong(v21, obj);
  return v23;
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
  objc_storeStrong((id *)&self->_path, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
}

@end
