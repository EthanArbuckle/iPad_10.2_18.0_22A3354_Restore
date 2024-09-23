@implementation MODataExportResults

- (MODataExportResults)initWithFilePath:(id)a3 kvPairs:(id)a4
{
  id v7;
  id v8;
  MODataExportResults *v9;
  MODataExportResults *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MODataExportResults;
  v9 = -[MODataExportResults init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_filePath, a3);
    objc_storeStrong((id *)&v10->_kvPairs, a4);
  }

  return v10;
}

- (NSString)filePath
{
  return self->_filePath;
}

- (NSDictionary)kvPairs
{
  return self->_kvPairs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kvPairs, 0);
  objc_storeStrong((id *)&self->_filePath, 0);
}

@end
