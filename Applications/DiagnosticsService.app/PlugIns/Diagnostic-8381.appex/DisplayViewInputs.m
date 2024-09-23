@implementation DisplayViewInputs

- (BOOL)validateAndInitializeParameters:(id)a3
{
  id v4;
  NSSet *v5;
  void *v6;
  void *v7;
  char v9;

  v9 = 0;
  v4 = a3;
  v5 = +[NSSet setWithObject:](NSSet, "setWithObject:", objc_opt_class(NSString));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_arrayFromRequiredKey:types:maxLength:failed:", CFSTR("testImages"), v6, 256, &v9));

  -[DisplayViewInputs setImageFileNames:](self, "setImageFileNames:", v7);
  return v9 == 0;
}

- (NSArray)imageFileNames
{
  return self->_imageFileNames;
}

- (void)setImageFileNames:(id)a3
{
  objc_storeStrong((id *)&self->_imageFileNames, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageFileNames, 0);
}

@end
