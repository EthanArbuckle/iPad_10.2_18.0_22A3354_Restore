@implementation UIImage(IMPNGImageWriting)

- (uint64_t)__ck_writePNGToFilePath:()IMPNGImageWriting error:
{
  void *v6;
  uint64_t v7;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(a1, "__ck_writePNGToURL:error:", v6, a4);

  return v7;
}

- (uint64_t)__ck_writePNGToURL:()IMPNGImageWriting error:
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v12;

  v6 = a3;
  objc_msgSend(a1, "__ck_pngImageData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v8 = objc_msgSend(v7, "writeToURL:options:error:", v6, 1, &v12);

  v9 = v12;
  v10 = v9;
  if (a4 && (v8 & 1) == 0)
    *a4 = objc_retainAutorelease(v9);

  return v8;
}

- (id)__ck_pngImageData
{
  objc_msgSend(objc_retainAutorelease(a1), "CGImage");
  return (id)IMCreatePNGImageDataFromCGImageRef();
}

- (id)__ck_heicsImageData
{
  objc_msgSend(objc_retainAutorelease(a1), "CGImage");
  return (id)IMCreateHEICSImageDataFromCGImageRef();
}

@end
