@implementation _CNUIDirectoryServicesPhotoFuture

+ (id)photoForEmailAddresses:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0D13A68];
  objc_msgSend(MEMORY[0x1E0C99E38], "null", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "futureWithResult:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
