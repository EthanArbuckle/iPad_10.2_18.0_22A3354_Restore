@implementation NUVisionBasedRenderJob

- (id)newRequestHandlerForImage:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[NURenderJob renderer:](self, "renderer:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "context");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc(MEMORY[0x1E0CEDF70]);
    v16 = *MEMORY[0x1E0CEE378];
    v17[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[NUFactory sharedFactory](NUFactory, "sharedFactory");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "visionSession");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v10, "initWithCIImage:options:session:", v6, v11, v13);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

@end
