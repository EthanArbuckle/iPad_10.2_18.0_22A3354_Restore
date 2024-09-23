@implementation FSUnaryFileSystem

- (void)wipeResource:(id)a3 includingRanges:(id)a4 excludingRanges:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[FSUnaryFileSystem extension](self, "extension");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  +[FSFileSystemBasis wipeResource:includingRanges:excludingRanges:extension:completionHandler:](FSFileSystemBasis, "wipeResource:includingRanges:excludingRanges:extension:completionHandler:", v13, v12, v11, v14, v10);

}

- (void)wipeResource:(id)a3 includingRanges:(id)a4 excludingRanges:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[FSUnaryFileSystem extension](self, "extension");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  +[FSFileSystemBasis wipeResource:includingRanges:excludingRanges:extension:completionHandler:](FSFileSystemBasis, "wipeResource:includingRanges:excludingRanges:extension:completionHandler:", v13, v12, v11, v14, v10);

}

- (int64_t)containerState
{
  return self->containerState;
}

- (void)setContainerState:(int64_t)a3
{
  self->containerState = a3;
}

- (NSError)errorState
{
  return (NSError *)objc_getProperty(self, a2, 16, 1);
}

- (void)setErrorState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (FSModuleExtension)extension
{
  return (FSModuleExtension *)objc_getProperty(self, a2, 24, 1);
}

- (void)setExtension:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->errorState, 0);
}

- (void)wipeResource:(id)a3 includingRanges:(id)a4 excludingRanges:(id)a5 replyHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[FSUnaryFileSystem extension](self, "extension");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  +[FSFileSystemBasis wipeResource:includingRanges:excludingRanges:extension:completionHandler:](FSFileSystemBasis, "wipeResource:includingRanges:excludingRanges:extension:completionHandler:", v13, v12, v11, v14, v10);

}

@end
