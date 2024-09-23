@implementation CKWatchfaceUtilities

+ (void)addWatchFaceAtURL:(id)a3 completionHandler:(id)a4
{
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v5 = _WatchFaceLibrary_onceToken;
  v6 = a4;
  v7 = a3;
  v9 = v7;
  if (v5 == -1)
  {
    v8 = v7;
  }
  else
  {
    dispatch_once(&_WatchFaceLibrary_onceToken, &__block_literal_global_155);
    v8 = v9;
  }
  objc_msgSend((id)_WatchFaceLibrary_library, "_addWatchFaceAtURL:shouldValidate:completionHandler:", v8, 0, v6);

}

@end
