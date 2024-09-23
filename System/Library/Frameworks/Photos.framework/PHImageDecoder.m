@implementation PHImageDecoder

+ (id)sharedDecoder
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHImageDecoder.m"), 119, CFSTR("Subclass to implement"));

  return 0;
}

+ (id)sharedFigDecoder
{
  return +[PHFigDecoder sharedDecoder](PHFigDecoder, "sharedDecoder");
}

- (id)decodeImageFromData:(id)a3 orFileURL:(id)a4 options:(id)a5 completion:(id)a6
{
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5, a6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHImageDecoder.m"), 127, CFSTR("Subclass to implement"));

  return 0;
}

- (void)cancelInFlightAsyncDecodeForRequestHandle:(id)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHImageDecoder.m"), 132, CFSTR("Subclass to implement"));

}

@end
